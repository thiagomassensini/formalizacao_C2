#!/usr/bin/env python3
"""
C2 Genuine Zero Detector
=========================
Finds zeros of the C2 spectral operator Z(s) = (D(s) - B(s)) / c0(s)
on the critical line, using NO reference to known zeta zeros.

The operator is built entirely from C2 2-adic structure:
  D(s)  = Σ w(n) n^{-s} exp(-n/X)    (main sum, odd n ≥ 3)
  B(s)  = fiber background            (symmetric bracket / hyperbolic form)
  c0(s) = 2^{-2s}(2^s - 1)/(2·2^s - 1)  (coupling from C2 tree)

This is the same operator as c2_scan_optimized.py, extracted into a clean
zero-finding tool.

Usage:
    python3 c2_zero_detector_genuine.py [T_max] [--preset accurate]
"""

import sys, os, time, csv, argparse, math
import numpy as np

try:
    import numba

    @numba.njit(parallel=True, fastmath=True, cache=True)
    def _exp_dot_numba(t_batch, log_values, weights):
        B = t_batch.shape[0]
        N = log_values.shape[0]
        out_re = np.zeros(B)
        out_im = np.zeros(B)
        for i in numba.prange(B):
            sr = 0.0
            si = 0.0
            ti = t_batch[i]
            for j in range(N):
                ang = ti * log_values[j]
                sr += weights[j] * np.cos(ang)
                si -= weights[j] * np.sin(ang)
            out_re[i] = sr
            out_im[i] = si
        return out_re, out_im

    _HAS_NUMBA = True
except ImportError:
    _HAS_NUMBA = False


# ── CuPy / CUDA detection ─────────────────────────────────────────────
try:
    import cupy as cp
    _cp_probe = cp.zeros(1, dtype=cp.float32)  # fail fast if no GPU
    del _cp_probe
    _HAS_CUPY = True
except Exception:
    cp = None  # type: ignore[assignment]
    _HAS_CUPY = False


# ── Custom CUDA kernel: register-level exp-dot, no phase matrix ───────
#   Each CUDA block handles one t-value; threads stripe over N.
#   sincos() + warp-shuffle reduction avoids writing any intermediate
#   (B × N) matrix — dominant memory traffic in the CuPy matrix path.
_CUDA_KERNEL_SRC = r"""
extern "C" __global__ void exp_dot_r2c(
    const double* __restrict__ t_arr,
    const double* __restrict__ log_arr,
    const double* __restrict__ w_arr,
    double* __restrict__ out_re,
    double* __restrict__ out_im,
    const int B,
    const int N
){
    const int t_idx = blockIdx.x;
    if (t_idx >= B) return;

    const double t = t_arr[t_idx];
    double re = 0.0, im = 0.0;

    for (int n = threadIdx.x; n < N; n += blockDim.x) {
        double ang = t * log_arr[n];
        double s, c;
        sincos(ang, &s, &c);
        double ww = w_arr[n];
        re += ww * c;
        im -= ww * s;
    }

    /* Warp-level shuffle reduction */
    for (int mask = 16; mask > 0; mask >>= 1) {
        re += __shfl_down_sync(0xffffffff, re, mask);
        im += __shfl_down_sync(0xffffffff, im, mask);
    }

    /* Store per-warp partial sums */
    __shared__ double sre[32], sim[32];
    const int warp   = threadIdx.x >> 5;
    const int lane   = threadIdx.x & 31;
    const int nwarps = (blockDim.x + 31) >> 5;
    if (lane == 0) { sre[warp] = re; sim[warp] = im; }
    __syncthreads();

    /* First warp does final reduction */
    if (warp == 0) {
        re = (lane < nwarps) ? sre[lane] : 0.0;
        im = (lane < nwarps) ? sim[lane] : 0.0;
        for (int mask = 16; mask > 0; mask >>= 1) {
            re += __shfl_down_sync(0xffffffff, re, mask);
            im += __shfl_down_sync(0xffffffff, im, mask);
        }
        if (lane == 0) { out_re[t_idx] = re; out_im[t_idx] = im; }
    }
}
"""

_CUDA_KERNEL_OBJ = None  # compiled once, reused


def _get_cuda_kernel():
    """Compile (or return cached) the exp_dot_r2c kernel."""
    global _CUDA_KERNEL_OBJ
    if _CUDA_KERNEL_OBJ is None and _HAS_CUPY:
        _CUDA_KERNEL_OBJ = cp.RawKernel(_CUDA_KERNEL_SRC, "exp_dot_r2c")
    return _CUDA_KERNEL_OBJ


def _complex_exp_dot(t_batch, log_values, weights, block_size):
    if _HAS_NUMBA:
        re, im = _exp_dot_numba(
            np.ascontiguousarray(t_batch),
            np.ascontiguousarray(log_values),
            np.ascontiguousarray(weights.astype(np.float64)),
        )
        return re + 1j * im

    out = np.zeros(t_batch.size, dtype=np.complex128)
    for start in range(0, log_values.size, block_size):
        end = min(start + block_size, log_values.size)
        phase = np.exp(-1j * t_batch[:, None] * log_values[None, start:end])
        out += phase @ weights[start:end].astype(np.complex128)
    return out

# ── C2 2-adic weights ──────────────────────────────────────────────────

def keff_w_array(n):
    """k = max(v2(n-1), v2(n+1)), w = 2^{-k} for odd n ≥ 3."""
    a = n - 1
    b = n + 1
    low_a = np.bitwise_and(a, -a)
    low_b = np.bitwise_and(b, -b)
    v2_a = np.log2(low_a).astype(np.int64)
    v2_b = np.log2(low_b).astype(np.int64)
    k = np.maximum(v2_a, v2_b)
    w = np.exp2(-k.astype(np.float64))
    return k, w


def K_eff(n: int) -> int:
    """
    Canonical C2 effective depth.

    n = 1: depth 1
    n even: v2(n)
    n odd >= 3: max(v2(n-1), v2(n+1))
    """
    if n < 1:
        raise ValueError("K_eff expects n >= 1")
    if n == 1:
        return 1
    if n % 2 == 0:
        return v2(n)
    return max(v2(n - 1), v2(n + 1))


class GenuineOperator:
    """
    Precomputed evaluator for the genuine C2 zero detector.

    The key optimization is to rewrite the fiber background as

        B(s) = sum_{k,m} 2^{-k}[(c-1)^(-s) + (c+1)^(-s) - 2 c^(-s)],
        c = 2^k m,

    which is algebraically identical to the original hyperbolic-form code but
    removes the expensive Python loop over all `(m,k)` pairs at each call.
    """

    def __init__(self, sigma=0.5, Nmax=200000, X=50000.0, Mmax=20000, bg_kmax=20, state_block=8192,
                 device="auto", gpu_n_block=16384):
        self.sigma = float(sigma)
        self.Nmax = int(Nmax)
        self.X = float(X)
        self.Mmax = int(Mmax)
        self.bg_kmax = int(bg_kmax)
        self.state_block = int(state_block)

        log2 = np.log(2.0)
        self._log2 = float(log2)

        # Part A: D(s)
        n = np.arange(3, self.Nmax + 1, 2, dtype=np.int64)
        _, w_n = keff_w_array(n)
        n_f = n.astype(np.float64)
        self._logn = np.log(n_f)
        self._d_weight = (
            w_n * np.exp(-self.sigma * self._logn) * np.exp(-n_f / self.X)
        ).astype(np.float64)

        # Part B: background states (c = 2^k m)
        c_list: list[np.ndarray] = []
        w_list: list[np.ndarray] = []
        for kv in range(2, self.bg_kmax + 1):
            m_lim = min((self.Nmax - 1) // (1 << kv), self.Mmax)
            if m_lim % 2 == 0:
                m_lim -= 1
            if m_lim < 1:
                continue

            odds_k = np.arange(1, m_lim + 1, 2, dtype=np.int64)
            c_vals = (1 << kv) * odds_k
            c_list.append(c_vals.astype(np.float64))
            w_list.append(np.full(c_vals.shape, 2.0 ** (-kv), dtype=np.float64))
        if c_list:
            c_all = np.concatenate(c_list)
            self._bg_weight = np.concatenate(w_list)
            self._bg_log_left = np.log(c_all - 1.0)
            self._bg_log_center = np.log(c_all)
            self._bg_log_right = np.log(c_all + 1.0)
            self._bg_left_base = np.exp(-self.sigma * self._bg_log_left)
            self._bg_center_base = np.exp(-self.sigma * self._bg_log_center)
            self._bg_right_base = np.exp(-self.sigma * self._bg_log_right)
            self._bg_left_weight = (self._bg_weight * self._bg_left_base).astype(np.float64)
            self._bg_center_weight = (self._bg_weight * self._bg_center_base).astype(np.float64)
            self._bg_right_weight = (self._bg_weight * self._bg_right_base).astype(np.float64)
        else:
            self._bg_weight = np.array([], dtype=np.float64)
            self._bg_log_left = np.array([], dtype=np.float64)
            self._bg_log_center = np.array([], dtype=np.float64)
            self._bg_log_right = np.array([], dtype=np.float64)
            self._bg_left_base = np.array([], dtype=np.float64)
            self._bg_center_base = np.array([], dtype=np.float64)
            self._bg_right_base = np.array([], dtype=np.float64)
            self._bg_left_weight = np.array([], dtype=np.float64)
            self._bg_center_weight = np.array([], dtype=np.float64)
            self._bg_right_weight = np.array([], dtype=np.float64)

        # ── Device selection + GPU upload ───────────────────────────────
        self.device = ("cuda" if _HAS_CUPY else "cpu") if device == "auto" else device
        self._gpu_n_block = int(gpu_n_block)

        if self.device == "cuda":
            if not _HAS_CUPY:
                raise RuntimeError("device='cuda' requested but CuPy is not available. "
                                   "Install with: pip install cupy-cuda12x")
            self._logn_gpu     = cp.asarray(self._logn)
            self._d_weight_gpu = cp.asarray(self._d_weight)
            if self._bg_weight.size > 0:
                self._bg_log_left_gpu      = cp.asarray(self._bg_log_left)
                self._bg_log_center_gpu    = cp.asarray(self._bg_log_center)
                self._bg_log_right_gpu     = cp.asarray(self._bg_log_right)
                self._bg_left_weight_gpu   = cp.asarray(self._bg_left_weight)
                self._bg_center_weight_gpu = cp.asarray(self._bg_center_weight)
                self._bg_right_weight_gpu  = cp.asarray(self._bg_right_weight)
            vram_mb = (self._logn.nbytes + self._d_weight.nbytes
                       + self._bg_log_left.nbytes * 3
                       + self._bg_left_weight.nbytes * 3) / 1e6
            print(f"  [CUDA] D-terms: {self._logn.size:,}  "
                  f"BG-terms: {self._bg_weight.size:,}  "
                  f"~{vram_mb:.0f} MB VRAM", flush=True)
            # Pre-combine left/right/center into one contiguous GPU array so
            # _eval_gpu does a single chunked pass for B(s) instead of three.
            if self._bg_weight.size > 0:
                self._bg_log_comb_gpu = cp.concatenate([
                    self._bg_log_left_gpu,
                    self._bg_log_right_gpu,
                    self._bg_log_center_gpu,
                ])
                self._bg_w_comb_gpu = cp.concatenate([
                    self._bg_left_weight_gpu,
                    self._bg_right_weight_gpu,
                    cp.asarray(-2.0 * self._bg_center_weight),
                ])
                # Release individual arrays — not needed on GPU any more
                del (self._bg_log_left_gpu, self._bg_log_right_gpu,
                     self._bg_log_center_gpu, self._bg_left_weight_gpu,
                     self._bg_right_weight_gpu, self._bg_center_weight_gpu)

    def _eval_gpu(self, t_batch: np.ndarray) -> np.ndarray:
        """CUDA raw-kernel evaluation — no intermediate phase matrix."""
        B     = t_batch.size
        t_gpu = cp.asarray(t_batch)
        kern  = _get_cuda_kernel()
        threads = 256

        def _kdot(log_gpu, w_gpu):
            """Kernel wrapper: returns complex (B,) array on GPU."""
            N    = np.int32(log_gpu.size)
            ore  = cp.zeros(B, dtype=cp.float64)
            oim  = cp.zeros(B, dtype=cp.float64)
            kern((B,), (threads,),
                 (t_gpu, log_gpu, w_gpu, ore, oim, np.int32(B), N))
            return ore + 1j * oim

        # Part A ── D(s)
        d_acc = _kdot(self._logn_gpu, self._d_weight_gpu)

        # Part B ── B(s)  (single pass over combined left+right−2×center)
        if self._bg_weight.size > 0:
            b_acc = _kdot(self._bg_log_comb_gpu, self._bg_w_comb_gpu)
        else:
            b_acc = cp.zeros(B, dtype=cp.complex128)

        # Part C ── c0(s)
        two_s   = (2.0 ** self.sigma)          * cp.exp( 1j * t_gpu * self._log2)
        two_m2s = (2.0 ** (-2.0 * self.sigma)) * cp.exp(-1j * 2.0 * t_gpu * self._log2)
        c0 = two_m2s * (two_s - 1.0) / (2.0 * two_s - 1.0)

        return cp.asnumpy((d_acc - b_acc) / c0)

    def eval(self, s_vals):
        s_vals = np.atleast_1d(s_vals)
        t_batch = np.asarray(s_vals.imag, dtype=np.float64)
        B = t_batch.size

        if self.device == "cuda" and _HAS_CUPY:
            return self._eval_gpu(t_batch)

        # Part A: D(s)
        d_val = _complex_exp_dot(t_batch, self._logn, self._d_weight, 65536)

        # Part B: B(s)
        b_val = np.zeros(B, dtype=np.complex128)
        n_states = self._bg_weight.size
        if n_states:
            left = _complex_exp_dot(t_batch, self._bg_log_left, self._bg_left_weight, self.state_block)
            center = _complex_exp_dot(t_batch, self._bg_log_center, self._bg_center_weight, self.state_block)
            right = _complex_exp_dot(t_batch, self._bg_log_right, self._bg_right_weight, self.state_block)
            b_val = left + right - (2.0 * center)

        # Part C: c0(s)
        two_sigma = 2.0 ** self.sigma
        two_s = two_sigma * np.exp(1j * t_batch * self._log2)
        two_m2s = (2.0 ** (-2.0 * self.sigma)) * np.exp(-1j * 2.0 * t_batch * self._log2)
        c0 = two_m2s * (two_s - 1.0) / (2.0 * two_s - 1.0)

        return (d_val - b_val) / c0

    def eval_scalar(self, s):
        return self.eval(np.array([s], dtype=np.complex128))[0]


# ── C2 operator Z(s) = (D - B) / c0 ──────────────────────────────────

def Z_operator(s_vals, sigma=0.5, Nmax=200000, X=50000.0, Mmax=20000, bg_kmax=20,
               device="auto", gpu_n_block=16384):
    """
    Evaluate Z(s) = (D(s) - B(s)) / c0(s) for an array of s values.

    All s values must share the same real part (sigma).
    Returns complex array Z(s).
    """
    operator = GenuineOperator(sigma=sigma, Nmax=Nmax, X=X, Mmax=Mmax, bg_kmax=bg_kmax,
                               device=device, gpu_n_block=gpu_n_block)
    return operator.eval(s_vals)


def Z_scalar(s, sigma=0.5, operator=None, **kwargs):
    """Evaluate Z at a single complex point."""
    if operator is not None:
        return operator.eval_scalar(s)
    return Z_operator(np.array([s]), sigma=sigma, **kwargs)[0]


# ── Scan parameters from preset ─────────────────────────────────────
def odd_floor(x: float) -> int:
    """Largest odd integer <= x."""
    n = int(math.floor(x))
    return n if n % 2 == 1 else n - 1


def c2_phase_nmax(t_max: float, kmax: int = 8, safety: float = 1.45) -> int:
    """
    C2-geometric Nmax from dyadic phase resolution.

    We require, approximately,

        t * log(1 + 1/Nmax) <= 2π / 2^kmax.

    Equivalently,

        Nmax >= 1 / (exp((2π/2^kmax)/t) - 1),

    and for large t this is about

        Nmax ≈ t * 2^kmax / (2π).

    The safety factor accounts for endpoint effects, tails, and numerical margin.
    """
    t_max = float(abs(t_max))
    if t_max <= 0:
        return 83_000

    phase_cell = 2.0 * math.pi / (2 ** kmax)
    denom = math.expm1(phase_cell / t_max)
    raw = 1.0 / denom
    return int(math.ceil(safety * raw))


def c2_Mmax_by_k(Nmax: int, kmin: int = 2, kmax: int = 8) -> dict:
    """
    Per-depth M cutoff so that each B_k block stays within the global Nmax scale.

    For depth k the largest center c = 2^k * m within Nmax is m <= Nmax / 2^k,
    so Mmax(k) = odd_floor((Nmax - 1) / 2^k).
    """
    return {
        k: odd_floor((Nmax - 1) / (2 ** k))
        for k in range(kmin, kmax + 1)
    }


def get_scan_params(t_max, preset="c2_geometric"):
    """
    Compute Nmax, X, Mmax, bg_kmax from preset and t_max.

    Presets:
      - c2_geometric (default):
          Nmax from dyadic phase-resolution rule with safety=1.45, bg_kmax=8.

      - c2_geometric_strict:
          Same, but safety=1.75 for extra margin.

      - c2_q4_fixed:
          Historical/certification-style first1000 preset.
          Nmax=83000, Mmax=5329, X=8850, bg_kmax=8.

      - c2_q4_scaled:
          Q4-compatible linear scaling with t_max, bg_kmax=8.

      - ultra/coarse/balanced/accurate:
          Previous empirical presets (bg_kmax grows with Nmax).
    """
    t_max = float(t_max)

    if preset == "c2_q4_fixed":
        return {
            "Nmax": 83_000,
            "X": 8_850.0,
            "Mmax": 5_329,
            "bg_kmax": 8,
            "q4_kmin": 2,
            "q4_kmax": 5,
            "tail_kmin": 6,
            "tail_kmax": 8,
        }

    if preset == "c2_q4_scaled":
        base_N = 83_000
        base_X = 8_850.0
        base_M = 5_330
        scale = max(1.0, t_max / 1_000.0)
        Nmax = max(83_000, int(math.ceil(base_N * scale)))
        X = max(8_850.0, float(base_X * scale))
        Mmax = max(5_329, odd_floor((base_M / base_N) * Nmax))
        return {
            "Nmax": Nmax,
            "X": X,
            "Mmax": Mmax,
            "bg_kmax": 8,
            "q4_kmin": 2,
            "q4_kmax": 5,
            "tail_kmin": 6,
            "tail_kmax": 8,
        }

    if preset in ("c2_geometric", "c2_geometric_strict"):
        bg_kmax = 8
        safety = 1.75 if preset == "c2_geometric_strict" else 1.45
        Nmax = max(83_000, c2_phase_nmax(t_max, kmax=bg_kmax, safety=safety))
        Mmax = odd_floor((Nmax - 1) / 4)   # k=2 base cutoff: c=4m <= Nmax
        X = 0.5 * (Mmax + 1)
        return {
            "Nmax": Nmax,
            "X": X,
            "Mmax": Mmax,
            "bg_kmax": bg_kmax,
            "q4_kmin": 2,
            "q4_kmax": 5,
            "tail_kmin": 6,
            "tail_kmax": 8,
            "Mmax_by_k": c2_Mmax_by_k(Nmax, 2, bg_kmax),
        }

    # ── Original empirical presets ────────────────────────────────────
    if preset == "ultra":
        Nmax = int(50_000 + 300.0 * t_max)
    elif preset == "coarse":
        Nmax = int(20_000 + 180.0 * t_max)
    elif preset == "balanced":
        Nmax = int(20_000 + 450.0 * t_max + 0.08 * t_max**2)
    else:  # accurate
        Nmax = int(50_000 + 1500.0 * t_max + 0.8 * t_max**2)

    Nmax = max(100_000, Nmax)
    Mmax = odd_floor(0.25 * (Nmax + 1))
    # Note: for large t this pushes bg_kmax beyond 8, changing the operator.
    bg_kmax = int(np.floor(np.log2(Nmax + 1) * 0.5))
    X = 0.5 * (Mmax + 1)
    return {"Nmax": Nmax, "X": X, "Mmax": Mmax, "bg_kmax": bg_kmax}


# ── Newton refinement via finite differences ─────────────────────────

def newton_refine(
    t0,
    params,
    sigma=0.5,
    operator=None,
    max_iter=8,
    tol=1e-8,
    max_step=0.03,
    max_drift=0.12,
    fallback_halfwidth=0.04,
):
    """
    Fast safeguarded refinement on a fixed vertical line sigma + it.

    Design:
      - keep the original Newton-like speed;
      - clip each step so it cannot jump to a neighboring basin;
      - reject large total drift from the original candidate;
      - if Newton misbehaves, fall back to a tiny local parabolic search.

    Returns
    -------
    (t_best, resid_best, converged)
    """

    import numpy as np

    def zval(t):
        return Z_scalar(sigma + 1j * t, sigma=sigma, operator=operator, **params)

    def zabs(t):
        return abs(zval(t))

    # ── Fast path: safeguarded Newton on |Z|^2 ────────────────────────
    t = float(t0)
    best_t = t
    best_resid = zabs(t)
    converged = False

    for _ in range(max_iter):
        z = zval(t)

        h = 1e-5
        zp = zval(t + h)
        zm = zval(t - h)
        dzdt = (zp - zm) / (2.0 * h)

        denom = abs(dzdt) ** 2
        if denom < 1e-24:
            break

        # Newton step for minimizing |Z|^2 along the critical line
        step = -np.real(z * np.conj(dzdt)) / denom

        # SAFEGUARD 1: clip step
        if step > max_step:
            step = max_step
        elif step < -max_step:
            step = -max_step
        t_new = t + step

        # SAFEGUARD 2: never drift too far from the original candidate
        if abs(t_new - t0) > max_drift:
            break

        r_new = zabs(t_new)

        # accept only if it improves or nearly improves
        if r_new <= best_resid * 1.02:
            t = t_new
            if r_new < best_resid:
                best_t = t_new
                best_resid = r_new

            if abs(step) < tol:
                converged = True
                return best_t, best_resid, converged
        else:
            break

    # If fast Newton already got a good point, keep it unless we need rescue
    if abs(best_t - t0) <= max_drift and best_resid < 0.05:
        return best_t, best_resid, True

    # ── Cheap fallback: tiny local quadratic fit around the candidate ──
    left = max(5.0, t0 - fallback_halfwidth)
    mid = float(t0)
    right = t0 + fallback_halfwidth

    fL = zabs(left)
    fM = zabs(mid)
    fR = zabs(right)

    # Quadratic interpolation for the minimum of three points
    # If degenerate, just return the best sampled point.
    denom = (left - mid) * (left - right) * (mid - right)
    if abs(denom) < 1e-20:
        ts = [left, mid, right]
        fs = [fL, fM, fR]
        i = int(np.argmin(fs))
        return ts[i], fs[i], False

    a = (
        right * (fM - fL)
        + mid * (fL - fR)
        + left * (fR - fM)
    ) / denom

    b = (
        right**2 * (fL - fM)
        + mid**2 * (fR - fL)
        + left**2 * (fM - fR)
    ) / denom

    if abs(a) < 1e-20:
        ts = [left, mid, right]
        fs = [fL, fM, fR]
        i = int(np.argmin(fs))
        return ts[i], fs[i], False

    t_quad = -b / (2.0 * a)

    # keep fallback inside the tiny local window
    t_quad = min(max(t_quad, left), right)
    fQ = zabs(t_quad)

    ts = [left, mid, right, t_quad, best_t]
    fs = [fL, fM, fR, fQ, best_resid]
    i = int(np.argmin(fs))

    return float(ts[i]), float(fs[i]), False


# ── Main scan ────────────────────────────────────────────────────────

def find_zeros(
    t_max,
    sigma=0.5,
    dt=0.05,
    preset="accurate",
    threshold=0.3,
    chunk_size=1000,
    refine=False,
    device="auto",
    gpu_n_block=16384,
):
    """
    Blind scan of |Z(sigma+it)| for t ∈ [1, t_max].
    Detect local minima and optionally apply safeguarded Newton refinement.
    """
    params = get_scan_params(t_max, preset)
    eval_params = {
        "Nmax": params["Nmax"],
        "X": params["X"],
        "Mmax": params["Mmax"],
        "bg_kmax": params["bg_kmax"],
    }
    operator = GenuineOperator(sigma=sigma, **eval_params, device=device, gpu_n_block=gpu_n_block)
    print(f"  Scan params: Nmax={params['Nmax']}, X={params['X']:.0f}, "
          f"Mmax={params['Mmax']}, bg_kmax={params['bg_kmax']}, sigma={sigma}")

    # Phase 1: coarse scan
    print(f"  Phase 1: coarse scan t ∈ [1, {t_max}] with dt={dt}...")
    t_grid = np.arange(1.0, t_max + dt, dt)

    # Evaluate in chunks to manage memory
    z_abs = np.zeros(t_grid.size)
    for i in range(0, t_grid.size, chunk_size):
        end = min(i + chunk_size, t_grid.size)
        s_chunk = sigma + 1j * t_grid[i:end]
        z_chunk = operator.eval(s_chunk)
        z_abs[i:end] = np.abs(z_chunk)

    # Phase 2: find local minima
    candidates = []
    for i in range(1, len(z_abs) - 1):
        if z_abs[i] < z_abs[i-1] and z_abs[i] < z_abs[i+1] and z_abs[i] < threshold:
            candidates.append((float(t_grid[i]), float(z_abs[i])))

    print(f"  Phase 2: found {len(candidates)} candidate minima")

    # Phase 3: direct minima or optional safeguarded Newton polish
    zeros = []
    dedup_radius = max(0.05, 4.0 * dt)
    newton_converged = 0
    for t0, coarse_resid in candidates:
        if refine:
            t_eval, resid, converged = newton_refine(
                t0,
                eval_params,
                sigma=sigma,
                operator=operator,
                max_step=max(0.03, 2.0 * dt),
                max_drift=max(0.20, 6.0 * dt),
            )
            if converged:
                newton_converged += 1
        else:
            t_eval, resid = t0, coarse_resid

        if t_eval < 5.0 or t_eval > t_max:
            continue

        if resid > 0.1:
            continue

        # Deduplicate by proximity — keep the one with smaller |Z|
        dup = False
        for j, (t_prev, r_prev) in enumerate(zeros):
            if abs(t_eval - t_prev) < dedup_radius:
                if resid < r_prev:
                    zeros[j] = (t_eval, resid)
                dup = True
                break
        if dup:
            continue
        zeros.append((t_eval, resid))

    zeros.sort(key=lambda x: x[0])
    if refine:
        print(f"  Phase 3: {len(zeros)} zeros after safeguarded Newton refinement "
              f"({newton_converged} converged)")
    else:
        print(f"  Phase 2→direct: {len(zeros)} zeros (no Newton)")
    return zeros, params


def main():
    parser = argparse.ArgumentParser(description="C2 Genuine Zero Detector")
    parser.add_argument("t_max", type=float, nargs="?", default=200.0,
                        help="Scan up to this height (default: 200)")
    parser.add_argument("--sigma", type=float, default=0.5,
                        help="Real part sigma for the scan line (default: 0.5)")
    parser.add_argument("--preset", default="ultra",
                        choices=["ultra", "coarse", "balanced", "accurate",
                                 "c2_q4_fixed", "c2_q4_scaled",
                                 "c2_geometric", "c2_geometric_strict"],
                        help="Accuracy preset (default: ultra)")
    parser.add_argument("--dt", type=float, default=0.01,
                        help="Coarse scan step (default: 0.01)")
    parser.add_argument("--threshold", type=float, default=0.1,
                        help="Detection threshold for |Z| (default: 0.1)")
    parser.add_argument("--chunk-size", type=int, default=1000,
                        help="Coarse scan chunk size (default: 1000)")
    parser.add_argument("--refine", action="store_true",
                        help="Apply safeguarded Newton refinement after coarse minima detection")
    parser.add_argument("--csv", action="store_true",
                        help="Export results to CSV")
    parser.add_argument("--device", default="auto",
                        choices=["auto", "cuda", "cpu"],
                        help="Compute device: auto (default), cuda, or cpu")
    parser.add_argument("--gpu-n-block", type=int, default=16384,
                        help="GPU N-chunk size per kernel launch (default: 16384)")
    parser.add_argument("--no-details", action="store_true",
                        help="Suppress per-zero detail table; only show summary and rankings")
    args = parser.parse_args()

    print(f"C2 Genuine Zero Detector")
    print(f"========================")
    print(f"Scanning t ∈ [1, {args.t_max}] on σ = {args.sigma:g}")
    print(f"Preset: {args.preset}")
    print(f"Refinement: {'safeguarded Newton' if args.refine else 'off'}")
    _dev_label = f"CUDA (gpu_n_block={args.gpu_n_block})" if (args.device == "cuda" or (args.device == "auto" and _HAS_CUPY)) else "CPU"
    print(f"Device: {_dev_label}")

    t0 = time.time()
    zeros, params = find_zeros(args.t_max, sigma=args.sigma, dt=args.dt, preset=args.preset,
                               threshold=args.threshold, chunk_size=args.chunk_size,
                               refine=args.refine,
                               device=args.device, gpu_n_block=args.gpu_n_block)
    elapsed = time.time() - t0

    if not args.no_details:
        print(f"\n{'#':>3} {'t_found':>12} {'|Z|':>12}")
        print("-" * 30)
        for i, (t_found, resid) in enumerate(zeros):
            print(f"{i+1:3d} {t_found:12.6f} {resid:12.6e}")

    print(f"\n[Summary] {len(zeros)} zeros found")
    print(f"[Time] {elapsed:.1f}s")

    if args.csv:
        out_dir = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))),
                               "artifacts", "csv")
        os.makedirs(out_dir, exist_ok=True)
        path = os.path.join(out_dir, f"c2_genuine_zeros_T{int(args.t_max)}.csv")
        with open(path, "w", newline="") as f:
            w = csv.writer(f)
            w.writerow(["n", "t_found", f"|Z({args.sigma:g}+it)|"])
            for i, (t_found, resid) in enumerate(zeros):
                w.writerow([i+1, f"{t_found:.8f}", f"{resid:.6e}"])
        print(f"[CSV] {path}")


if __name__ == "__main__":
    main()
