#!/usr/bin/env python3
"""
C2 genuine minimal CPU scanner
------------------------------
No CLI args, no CUDA, no Newton.  It scans Z(1/2 + it) for t in [1, 50].

Operator:
    Z(s) = (D(s) - B(s)) / c0(s)

    D(s)  = sum_{odd n>=3} w(n) n^(-s) exp(-n/X)
    B(s)  = sum_{k,m odd} 2^(-k) [(c-1)^(-s) + (c+1)^(-s) - 2 c^(-s)]
            with c = 2^k m
    c0(s) = 2^(-2s) (2^s - 1) / (2*2^s - 1)

The comparison zeta zeros are hardcoded and are NOT used by the detector.
"""

import time
import numpy as np

try:
    import numba
except ImportError as exc:
    raise SystemExit("Install numba first: pip install numba") from exc


# Fixed scan/operator parameters.
SIGMA = 0.5
T_MIN = 1.0
T_MAX = 50.0
DT = 0.01

NMAX = 100_000
X = 10_661.0
MMAX = 24_999
BG_KMAX = 5

# Detection controls.  These are intentionally simple: local minima of |Z|.
DETECTION_THRESHOLD = 0.01
MATCH_TOL = 0


@numba.njit(parallel=True, fastmath=True, cache=True)
def exp_dot(t_values, log_values, weights):
    """sum_j weights[j] * exp(-i*t*log_values[j]) for each t."""
    out_re = np.empty(t_values.size, dtype=np.float64)
    out_im = np.empty(t_values.size, dtype=np.float64)

    for i in numba.prange(t_values.size):
        t = t_values[i]
        re = 0.0
        im = 0.0
        for j in range(log_values.size):
            ang = t * log_values[j]
            re += weights[j] * np.cos(ang)
            im -= weights[j] * np.sin(ang)
        out_re[i] = re
        out_im[i] = im

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


class C2GenuineCPU:
    def __init__(self):
        self.log2 = float(np.log(2.0))

        # D(s): odd main channel, cutoff by exp(-n/X).
        n = np.arange(3, NMAX + 1, 2, dtype=np.int64)
        nf = n.astype(np.float64)
        w = odd_keff_weights(n)
        self.d_logs = np.ascontiguousarray(np.log(nf))
        self.d_weights = np.ascontiguousarray(
            w * np.exp(-SIGMA * self.d_logs) * np.exp(-nf / X)
        )

        # B(s): symmetric C2 background bracket, packed into one dot product.
        bg_logs = []
        bg_weights = []
        for k in range(2, BG_KMAX + 1):
            m_lim = min((NMAX - 1) // (1 << k), MMAX)
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
    op = C2GenuineCPU()
    t_grid = np.arange(T_MIN, T_MAX + 0.5 * DT, DT, dtype=np.float64)

    print("C2 genuine minimal CPU scanner")
    print("================================")
    print(f"Scan: sigma=1/2, t=[{T_MIN}, {T_MAX}], dt={DT}")
    print(f"Params: Nmax={NMAX}, X={X:.0f}, Mmax={MMAX}, bg_kmax={BG_KMAX}")
    print(f"Terms: D={op.d_logs.size:,}, B={op.b_logs.size:,}, CPU threads={numba.get_num_threads()}")
    print("First run includes Numba compilation, porque claro que tinha que ter esse pedágio.")

    tic = time.time()
    z = op.eval_t(t_grid)
    elapsed = time.time() - tic
    z_abs = np.abs(z)

    found = []
    for i in range(1, t_grid.size - 1):
        if z_abs[i] < z_abs[i - 1] and z_abs[i] < z_abs[i + 1] and z_abs[i] < DETECTION_THRESHOLD:
            found.append((float(t_grid[i]), float(z_abs[i])))

    print(f"\nFound {len(found)} local minima below |Z|<{DETECTION_THRESHOLD} in {elapsed:.2f}s")
    print(f"{'#':>2} {'t_found':>12} {'|Z|':>12} {'nearest_zeta':>14} {'dt_err':>10}")
    print("-" * 56)

    matched = 0
    matched_refs = set()
    for idx, (tf, rz) in enumerate(found, 1):
        j = int(np.argmin(np.abs(KNOWN_ZETA_ZEROS - tf)))
        ref = float(KNOWN_ZETA_ZEROS[j])
        err = abs(ref - tf)
        ok = err < MATCH_TOL
        if ok:
            matched += 1
            matched_refs.add(j)
        tag = f"{ref:.6f}" if ok else "spurious?"
        print(f"{idx:2d} {tf:12.6f} {rz:12.4e} {tag:>14} {err:10.4f}")

    missed = [KNOWN_ZETA_ZEROS[i] for i in range(KNOWN_ZETA_ZEROS.size) if i not in matched_refs]
    print(f"\nSummary: found={len(found)}, matched={matched}, missed={len(missed)}")
    if missed:
        print("Missed:", ", ".join(f"{x:.6f}" for x in missed))


if __name__ == "__main__":
    scan()
