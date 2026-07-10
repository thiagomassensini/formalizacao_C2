#!/usr/bin/env python3
"""
C2 genuine operator-only minimal CPU scanner, NumPy backend
---------------------------------------------------------
No CLI args, no CUDA, no Numba, no Newton.  It scans Z(1/2 + it) for t in [1, 50].

Operator:
    Z(s) = (D(s) - B(s)) / c0(s)

    D(s)  = sum_{odd n>=3} w(n) n^(-s) exp(-n/X)
    B(s)  = sum_{k,m odd} 2^(-k) [(c-1)^(-s) + (c+1)^(-s) - 2 c^(-s)]
            with c = 2^k m
    c0(s) = 2^(-2s) (2^s - 1) / (2*2^s - 1)

This version has no hardcoded zeta-zero comparison.
It only reports local minima detected directly from the C2 genuine operator.

Backend note:
    This file intentionally avoids Numba. The oscillatory sums are evaluated
    with NumPy in chunks, so it is more portable but slower than the Numba
    version. Increase EXP_DOT_CHUNK_SIZE for speed if you have RAM sobrando;
    decrease it if the process gets killed by memory pressure.
"""

import math
import time
import numpy as np


# Fixed scan parameters.
SIGMA = 0.5
T_MIN = 1.0
T_MAX = 50.0
DT = 0.00005

# C2-derived detector budgets.
BG_TAIL_EPS = 1.1e-3
PHASE_SAFETY = 1.45
DEFAULT_X = 10_661.0
DEFAULT_TAIL_L = 100_000.0 / DEFAULT_X

# Detection controls.  These are intentionally simple: local minima of |Z|.
DETECTION_THRESHOLD = 0.01

# Pure-NumPy backend control.
# Larger chunks are usually faster, but use more RAM.
EXP_DOT_CHUNK_SIZE = 128


def exp_dot(t_values, log_values, weights, chunk_size: int = EXP_DOT_CHUNK_SIZE):
    """
    Compute sum_j weights[j] * exp(-i*t*log_values[j]) for each t.

    This is the no-Numba replacement for the compiled kernel. It evaluates
    the dot product in t-chunks:

        Re = cos(t log n) @ weights
        Im = -sin(t log n) @ weights

    The temporary matrix has shape (chunk_size, number_of_terms).
    """
    t_values = np.asarray(t_values, dtype=np.float64)
    log_values = np.asarray(log_values, dtype=np.float64)
    weights = np.asarray(weights, dtype=np.float64)

    if chunk_size <= 0:
        raise ValueError("chunk_size must be positive")
    if log_values.size != weights.size:
        raise ValueError("log_values and weights must have the same size")

    out_re = np.empty(t_values.size, dtype=np.float64)
    out_im = np.empty(t_values.size, dtype=np.float64)

    for start in range(0, t_values.size, chunk_size):
        end = min(start + chunk_size, t_values.size)
        t_chunk = t_values[start:end]

        # Reuse the same matrix for cos and sin to keep peak RAM lower.
        angles = np.empty((t_chunk.size, log_values.size), dtype=np.float64)

        np.multiply(t_chunk[:, None], log_values[None, :], out=angles)
        np.cos(angles, out=angles)
        out_re[start:end] = angles @ weights

        np.multiply(t_chunk[:, None], log_values[None, :], out=angles)
        np.sin(angles, out=angles)
        out_im[start:end] = -(angles @ weights)

    return out_re + 1j * out_im


def odd_keff_weights(n):
    """For odd n>=3: k=max(v2(n-1), v2(n+1)), w(n)=2^(-k)."""
    a = n - 1
    b = n + 1
    low_a = np.bitwise_and(a, -a)
    low_b = np.bitwise_and(b, -b)
    v2_a = np.log2(low_a).astype(np.int64)
    v2_b = np.log2(low_b).astype(np.int64)
    k = np.maximum(v2_a, v2_b)
    return np.exp2(-k.astype(np.float64))


def odd_floor(x: float) -> int:
    """Largest odd integer <= x."""
    n = int(math.floor(x))
    return n if n % 2 == 1 else n - 1


def choose_bg_kmax(sigma: float = SIGMA, eps_k: float = BG_TAIL_EPS) -> int:
    """Choose the dyadic depth from the geometric C2 tail budget."""
    if eps_k <= 0.0:
        raise ValueError("eps_k must be positive")

    ratio = 2.0 ** (-(1.0 + float(sigma)))
    bg_kmax = 2
    while (ratio ** (bg_kmax - 1)) / (1.0 - ratio) > eps_k:
        bg_kmax += 1
    return bg_kmax


def c2_phase_nmax(t_max: float, kmax: int, safety: float = PHASE_SAFETY) -> int:
    """
    C2-geometric Nmax from the dyadic phase-resolution rule.

    Require approximately:

        t * log(1 + 1/Nmax) <= 2π / 2^kmax.
    """
    t_max = float(abs(t_max))
    if t_max <= 0.0:
        return 1
    if safety <= 0.0:
        raise ValueError("safety must be positive")

    phase_cell = 2.0 * math.pi / (2 ** int(kmax))
    raw = 1.0 / math.expm1(phase_cell / t_max)
    return int(math.ceil(safety * raw))


def choose_c2_params(
    t_max: float,
    sigma: float = SIGMA,
    eps_k: float = BG_TAIL_EPS,
    X: float | None = None,
    tail_L: float = DEFAULT_TAIL_L,
    phase_safety: float = PHASE_SAFETY,
):
    """Derive non-arbitrary C2 scan parameters from tail and phase budgets."""
    if tail_L <= 0.0:
        raise ValueError("tail_L must be positive")

    bg_kmax = choose_bg_kmax(sigma=sigma, eps_k=eps_k)

    if X is None:
        if t_max <= 50.0:
            X = 8_850.0
        else:
            X = 8_850.0 * math.sqrt(math.log(2.0 + t_max) / math.log(52.0))

    X = float(X)
    n_phase = c2_phase_nmax(t_max, bg_kmax, safety=phase_safety)
    n_tail = int(math.ceil(tail_L * X))

    Nmax = max(3, n_phase, n_tail)
    if Nmax % 2 == 1:
        Nmax += 1

    Mmax = odd_floor((Nmax - 1) / 4)
    return {
        "sigma": float(sigma),
        "eps_k": float(eps_k),
        "phase_safety": float(phase_safety),
        "tail_L": float(tail_L),
        "bg_kmax": int(bg_kmax),
        "n_phase": int(n_phase),
        "n_tail": int(n_tail),
        "Nmax": int(Nmax),
        "Mmax": int(Mmax),
        "X": float(X),
    }


class C2GenuineCPU:
    def __init__(self, params):
        self.params = dict(params)
        self.Nmax = int(params["Nmax"])
        self.X = float(params["X"])
        self.Mmax = int(params["Mmax"])
        self.bg_kmax = int(params["bg_kmax"])
        self.log2 = float(np.log(2.0))

        # D(s): odd main channel, cutoff by exp(-n/X).
        n = np.arange(3, self.Nmax + 1, 2, dtype=np.int64)
        nf = n.astype(np.float64)
        w = odd_keff_weights(n)
        self.d_logs = np.ascontiguousarray(np.log(nf))
        self.d_weights = np.ascontiguousarray(
            w * np.exp(-SIGMA * self.d_logs) * np.exp(-nf / self.X)
        )

        # B(s): symmetric C2 background bracket, packed into one dot product.
        bg_logs = []
        bg_weights = []
        for k in range(2, self.bg_kmax + 1):
            m_lim = min((self.Nmax - 1) // (1 << k), self.Mmax)
            if m_lim % 2 == 0:
                m_lim -= 1
            if m_lim < 1:
                continue

            m = np.arange(1, m_lim + 1, 2, dtype=np.int64)
            c = ((1 << k) * m).astype(np.float64)
            wk = 2.0 ** (-k)

            bg_logs.extend([np.log(c - 1.0), np.log(c + 1.0), np.log(c)])
            bg_weights.extend([
                wk * np.exp(-SIGMA * np.log(c - 1.0)),
                wk * np.exp(-SIGMA * np.log(c + 1.0)),
                -2.0 * wk * np.exp(-SIGMA * np.log(c)),
            ])

        self.b_logs = np.ascontiguousarray(np.concatenate(bg_logs))
        self.b_weights = np.ascontiguousarray(np.concatenate(bg_weights))

    def eval_t(self, t_values):
        """Evaluate Z(1/2+it) on a real t-array."""
        t = np.asarray(t_values, dtype=np.float64)

        d = exp_dot(t, self.d_logs, self.d_weights)
        b = exp_dot(t, self.b_logs, self.b_weights)

        two_s = (2.0 ** SIGMA) * np.exp(1j * t * self.log2)
        two_m2s = (2.0 ** (-2.0 * SIGMA)) * np.exp(-2j * t * self.log2)
        c0 = two_m2s * (two_s - 1.0) / (2.0 * two_s - 1.0)

        return (d - b) / c0


def scan():
    params = choose_c2_params(
        T_MAX,
        sigma=SIGMA,
        eps_k=BG_TAIL_EPS,
        X=DEFAULT_X,
        tail_L=DEFAULT_TAIL_L,
        phase_safety=PHASE_SAFETY,
    )
    op = C2GenuineCPU(params)
    t_grid = np.arange(T_MIN, T_MAX + 0.5 * DT, DT, dtype=np.float64)

    print("C2 genuine operator-only minimal CPU scanner")
    print("================================")
    print(f"Scan: sigma=1/2, t=[{T_MIN}, {T_MAX}], dt={DT}")
    print(
        "Params: "
        f"Nmax={params['Nmax']}, X={params['X']:.0f}, "
        f"Mmax={params['Mmax']}, bg_kmax={params['bg_kmax']}"
    )
    print(
        "Budgets: "
        f"eps_k={params['eps_k']:.2e}, tail_L={params['tail_L']:.5f}, "
        f"n_phase={params['n_phase']}, n_tail={params['n_tail']}, "
        f"phase_safety={params['phase_safety']:.2f}"
    )
    print(f"Terms: D={op.d_logs.size:,}, B={op.b_logs.size:,}")
    print(f"Backend: NumPy chunked, EXP_DOT_CHUNK_SIZE={EXP_DOT_CHUNK_SIZE}")
    print("Sem Numba: mais portável, mais lento. A ciência cobra pedágio de outro jeito.")

    tic = time.time()
    z = op.eval_t(t_grid)
    elapsed = time.time() - tic
    z_abs = np.abs(z)

    found = []
    for i in range(1, t_grid.size - 1):
        if z_abs[i] < z_abs[i - 1] and z_abs[i] < z_abs[i + 1] and z_abs[i] < DETECTION_THRESHOLD:
            found.append((float(t_grid[i]), float(z_abs[i])))

    print(f"\nFound {len(found)} local minima below |Z|<{DETECTION_THRESHOLD} in {elapsed:.2f}s")
    print(f"{'#':>2} {'t_found':>12} {'|Z|':>12}")
    print("-" * 31)

    for idx, (tf, rz) in enumerate(found, 1):
        print(f"{idx:2d} {tf:12.6f} {rz:12.4e}")

    print(f"\nSummary: found={len(found)} operator minima")


if __name__ == "__main__":
    scan()
