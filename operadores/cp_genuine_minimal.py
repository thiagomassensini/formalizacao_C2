#!/usr/bin/env python3
"""
Cp genuine minimal CPU scanner
------------------------------
Versão Cp do genuine finito C2.

Arquitetura preservada do c2_genuine_minimal.py:

    G_p(s) = (D_p(s) - B_p(s)) / c_p(s)

Para zeta:

    c_p(s) = (p-1) * q(s)^k_start/(1-q(s)) * (1-p^(-s)),
    q(s)   = p^(-1-s).

Para p ímpar canônico:
    k_start = 1
    centros c = p^k m, (m,p)=1
    pernas A_p = {-h,...,-1,1,...,h}, h=(p-1)/2
    bracket = sum_{a in A_p} (c+a)^(-s) - (p-1)c^(-s)

Para p=2:
    usa o modo C2 especial com pernas [-1,+1].
    Para reproduzir o normalizador c0 antigo, use k_start=2.

O detector reporta mínimos locais de |G_p| abaixo do threshold.
"""

from __future__ import annotations

import argparse
import time
import numpy as np

try:
    import numba
except ImportError as exc:
    raise SystemExit("Install numba first: pip install numba") from exc


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


def is_prime(p: int) -> bool:
    if p < 2:
        return False
    if p == 2:
        return True
    if p % 2 == 0:
        return False
    d = 3
    while d * d <= p:
        if p % d == 0:
            return False
        d += 2
    return True


def cp_legs(p: int) -> np.ndarray:
    """Representantes simétricos dos ramos laterais."""
    if p == 2:
        return np.array([-1, 1], dtype=np.int64)
    h = (p - 1) // 2
    return np.array(list(range(-h, 0)) + list(range(1, h + 1)), dtype=np.int64)


def vp_array(values: np.ndarray, p: int) -> np.ndarray:
    """
    v_p(values) para array positivo.
    values deve estar todo divisível por p quando usado no Cp canônico.
    """
    x = values.copy()
    k = np.zeros(x.size, dtype=np.int64)
    mask = (x > 0) & ((x % p) == 0)
    while np.any(mask):
        k[mask] += 1
        x[mask] //= p
        mask = (x > 0) & ((x % p) == 0)
    return k


def odd_keff_weights_c2(n: np.ndarray) -> tuple[np.ndarray, np.ndarray]:
    """
    C2 especial:
        k_eff = max(v2(n-1), v2(n+1))
        w = 2^(-k_eff)
    """
    a = n - 1
    b = n + 1
    low_a = np.bitwise_and(a, -a)
    low_b = np.bitwise_and(b, -b)
    v2_a = np.log2(low_a).astype(np.int64)
    v2_b = np.log2(low_b).astype(np.int64)
    k = np.maximum(v2_a, v2_b)
    w = np.exp2(-k.astype(np.float64))
    return k, w


def cp_keff_weights_odd_prime(n: np.ndarray, p: int) -> tuple[np.ndarray, np.ndarray, np.ndarray]:
    """
    Cp ímpar:
      para cada n com p∤n, escolhe a em A_p tal que a ≡ n mod p.
      então c = n-a é múltiplo de p, e k_eff = v_p(c).

    Retorna:
      k_eff, weights=p^(-k_eff), a_branch
    """
    h = (p - 1) // 2
    r = n % p

    # r está em 1..p-1 pois filtramos p∤n.
    # representante simétrico: 1..h ficam positivos; h+1..p-1 viram negativos.
    a = r.copy().astype(np.int64)
    neg = a > h
    a[neg] -= p

    c = n - a
    valid = c > 0
    if not np.all(valid):
        # remove casos minúsculos em que c=0, tipo n=a.
        n = n[valid]
        a = a[valid]
        c = c[valid]

    k = vp_array(c.astype(np.int64), p)
    w = np.power(float(p), -k.astype(np.float64))
    return k, w, a


class CpGenuineCPU:
    def __init__(
        self,
        p: int,
        sigma: float,
        nmax: int,
        mmax_factor: float,
        bg_kmax: int,
        k_start: int,
    ):
        if not is_prime(p):
            raise ValueError(f"p precisa ser primo; recebido p={p}")

        self.p = int(p)
        self.sigma = float(sigma)
        self.nmax = int(nmax)
        self.mmax = int(mmax_factor * nmax)
        self.x = 0.5 * (self.mmax + 1)
        self.bg_kmax = int(bg_kmax)
        self.k_start = int(k_start)

        self.logp = float(np.log(float(p)))
        self.legs = cp_legs(p)
        self.branch_count = int(self.legs.size)

        self._build_d_channel()
        self._build_b_channel()

    def _build_d_channel(self) -> None:
        """
        D_p(s): canal lateral comprimido por n.

        Para p ímpar, percorre n com p∤n e usa k_eff=v_p(n-a(n)).
        Para p=2, usa o peso C2 especial.
        """
        p = self.p

        if p == 2:
            n = np.arange(3, self.nmax + 1, 2, dtype=np.int64)
            k_eff, w = odd_keff_weights_c2(n)
            keep = k_eff >= self.k_start
            n = n[keep]
            w = w[keep]
        else:
            n_all = np.arange(1, self.nmax + 1, dtype=np.int64)
            n = n_all[(n_all % p) != 0]
            k_eff, w, _a = cp_keff_weights_odd_prime(n, p)
            # cp_keff_weights pode remover c=0; refaz n compatível nesses casos raros.
            # Para evitar desalinhamento, reconstrói com o mesmo filtro explicitamente.
            h = (p - 1) // 2
            r = n % p
            a = r.copy().astype(np.int64)
            a[a > h] -= p
            c = n - a
            keep_pos = c > 0
            n = n[keep_pos]
            k_eff = k_eff
            w = w

            keep = k_eff >= self.k_start
            n = n[keep]
            w = w[keep]

        nf = n.astype(np.float64)
        self.d_logs = np.ascontiguousarray(np.log(nf))
        self.d_weights = np.ascontiguousarray(
            w * np.exp(-self.sigma * self.d_logs) * np.exp(-nf / self.x)
        )

    def _build_b_channel(self) -> None:
        """
        B_p(s): bracket Cp empacotado em um único dot product.

        B = sum_{k,m} p^{-k} [
              sum_{a in A_p} (c+a)^(-s) - |A_p| c^(-s)
            ].
        """
        p = self.p
        bg_logs = []
        bg_weights = []

        max_leg = int(np.max(np.abs(self.legs)))
        for k in range(self.k_start, self.bg_kmax + 1):
            pk = p ** k
            m_lim = min((self.nmax - max_leg) // pk, self.mmax)
            if m_lim < 1:
                continue

            m = np.arange(1, m_lim + 1, dtype=np.int64)
            m = m[(m % p) != 0]
            if m.size == 0:
                continue

            c = (pk * m).astype(np.float64)
            wk = float(p) ** (-k)

            # laterais
            for a in self.legs:
                leg = c + float(a)
                good = leg > 0.0
                log_leg = np.log(leg[good])
                bg_logs.append(log_leg)
                bg_weights.append(wk * np.exp(-self.sigma * log_leg))

            # centro
            log_c = np.log(c)
            bg_logs.append(log_c)
            bg_weights.append(-float(self.branch_count) * wk * np.exp(-self.sigma * log_c))

        if not bg_logs:
            self.b_logs = np.empty(0, dtype=np.float64)
            self.b_weights = np.empty(0, dtype=np.float64)
        else:
            self.b_logs = np.ascontiguousarray(np.concatenate(bg_logs))
            self.b_weights = np.ascontiguousarray(np.concatenate(bg_weights))

    def normalizer_zeta(self, t_values: np.ndarray) -> np.ndarray:
        """
        c_p(s) para zeta:
            c_p(s) = |A_p| * q^k_start/(1-q) * (1-p^(-s))
            q = p^(-1-s)
        """
        t = np.asarray(t_values, dtype=np.float64)
        p = float(self.p)

        p_minus_s = (p ** (-self.sigma)) * np.exp(-1j * t * self.logp)
        q = (p ** (-(1.0 + self.sigma))) * np.exp(-1j * t * self.logp)

        return float(self.branch_count) * (q ** self.k_start) / (1.0 - q) * (1.0 - p_minus_s)

    def eval_t(self, t_values: np.ndarray) -> np.ndarray:
        """Evaluate G_p(sigma+it)."""
        t = np.asarray(t_values, dtype=np.float64)

        d = exp_dot(t, self.d_logs, self.d_weights)
        b = exp_dot(t, self.b_logs, self.b_weights)
        cp = self.normalizer_zeta(t)

        return (d - b) / cp


def scan(args: argparse.Namespace) -> None:
    k_start = args.k_start
    if k_start == 0:
        k_start = 2 if args.p == 2 else 1

    op = CpGenuineCPU(
        p=args.p,
        sigma=args.sigma,
        nmax=args.nmax,
        mmax_factor=args.mmax_factor,
        bg_kmax=args.bg_kmax,
        k_start=k_start,
    )

    t_grid = np.arange(args.t_min, args.t_max + 0.5 * args.dt, args.dt, dtype=np.float64)

    print(f"Cp genuine minimal CPU scanner: p={args.p}")
    print("========================================")
    print(f"Scan: sigma={args.sigma}, t=[{args.t_min}, {args.t_max}], dt={args.dt}")
    print(
        f"Params: Nmax={args.nmax}, X={op.x:.0f}, Mmax={op.mmax}, "
        f"bg_kmax={args.bg_kmax}, k_start={k_start}"
    )
    print(f"Legs A_p={op.legs.tolist()}, branches={op.branch_count}")
    print(f"Terms: D={op.d_logs.size:,}, B={op.b_logs.size:,}, CPU threads={numba.get_num_threads()}")
    print("First run includes Numba compilation, porque o pedágio não tira férias.")

    tic = time.time()
    values = op.eval_t(t_grid)
    elapsed = time.time() - tic
    abs_values = np.abs(values)

    found = []
    for i in range(1, t_grid.size - 1):
        is_local_min = abs_values[i] < abs_values[i - 1] and abs_values[i] < abs_values[i + 1]
        if is_local_min and abs_values[i] < args.threshold:
            found.append((float(t_grid[i]), float(abs_values[i])))

    print(f"\nFound {len(found)} local minima below |G_p|<{args.threshold} in {elapsed:.2f}s")
    print(f"{'#':>2} {'t_found':>12} {'|G_p|':>12}")
    print("-" * 30)

    for idx, (tf, rg) in enumerate(found, 1):
        print(f"{idx:2d} {tf:12.6f} {rg:12.4e}")

    print(f"\nSummary: found={len(found)}")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Scanner genuine finito Cp para zeta.")
    parser.add_argument("--p", type=int, default=3, help="Primo da geometria Cp. Default: 3.")
    parser.add_argument("--sigma", type=float, default=0.5)
    parser.add_argument("--t-min", type=float, default=1.0)
    parser.add_argument("--t-max", type=float, default=50.0)
    parser.add_argument("--dt", type=float, default=0.001)

    parser.add_argument("--nmax", type=int, default=100_000)
    parser.add_argument("--mmax-factor", type=float, default=0.25)
    parser.add_argument("--bg-kmax", type=int, default=8)
    parser.add_argument(
        "--k-start",
        type=int,
        default=0,
        help="0=auto: p=2 usa 2; p ímpar usa 1. Para Cp canônico use 1.",
    )
    parser.add_argument("--threshold", type=float, default=0.04)
    return parser.parse_args()


if __name__ == "__main__":
    scan(parse_args())
