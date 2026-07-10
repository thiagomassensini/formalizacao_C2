#!/usr/bin/env python3
"""
C2 center Gaussian ledger.

This is a numerical lab for the intrinsic center operator

    C_X(s) = sum_{c = 2^k m} 2 * 2^(-k) * c^(-s) * exp(-(c / X)^2),

with k >= 2 and m odd.  It does not use any external comparison data.
Optional tilt modes use the centered bracket already formalized in Lean as
`tiltBracket delta c`, with delta = sigma - 1/2.

The ledger tests geometric block inequalities of the form

    |main block| - |remaining block| > 0.

These are numerical probes, not formal certificates.  They are meant to show
which decompositions preserve useful phase cancellation and which destroy it.
"""

from __future__ import annotations

import argparse
import csv
import math
import os
import time
from dataclasses import asdict, dataclass
from pathlib import Path

import numpy as np

try:
    import numba
except ImportError as exc:
    raise SystemExit("Install numba first: pip install numba") from exc


@numba.njit(parallel=True, fastmath=True, cache=True)
def exp_dot(t_values: np.ndarray, log_values: np.ndarray, weights: np.ndarray) -> np.ndarray:
    out_re = np.empty(t_values.size, dtype=np.float64)
    out_im = np.empty(t_values.size, dtype=np.float64)

    for i in numba.prange(t_values.size):
        t = t_values[i]
        re = 0.0
        im = 0.0
        for j in range(log_values.size):
            ang = t * log_values[j]
            re += weights[j] * math.cos(ang)
            im -= weights[j] * math.sin(ang)
        out_re[i] = re
        out_im[i] = im

    return out_re + 1j * out_im


@dataclass(frozen=True)
class LedgerRow:
    sigma: float
    t: float
    full_abs: float
    total_mass: float
    full_efficiency: float
    depth_main_abs: float
    depth_rest_abs: float
    depth_surplus: float
    depth_coverage: float
    core_main_abs: float
    core_rest_abs: float
    core_surplus: float
    core_coverage: float
    center_main_abs: float
    center_rest_abs: float
    center_surplus: float
    center_coverage: float
    layer_sum_abs: float
    layer_efficiency: float
    tilt_factor_min: float
    tilt_factor_max: float


def build_c2_centers(nmax: int, bg_kmax: int) -> tuple[np.ndarray, np.ndarray, np.ndarray]:
    centers: list[int] = []
    ks: list[int] = []
    cores: list[int] = []

    for k in range(2, int(bg_kmax) + 1):
        step = 1 << k
        mmax = (int(nmax) - 1) // step
        if mmax % 2 == 0:
            mmax -= 1
        if mmax < 1:
            continue
        for m in range(1, mmax + 1, 2):
            c = step * m
            if c - 1 >= 3 and c + 1 <= nmax:
                centers.append(c)
                ks.append(k)
                cores.append(m)

    return (
        np.asarray(centers, dtype=np.float64),
        np.asarray(ks, dtype=np.int64),
        np.asarray(cores, dtype=np.float64),
    )


def float_grid(start: float, stop: float, step: float) -> np.ndarray:
    if step <= 0.0:
        raise ValueError("dt must be positive")
    if stop < start:
        raise ValueError("tmax must be greater than or equal to tmin")
    n = int(math.floor((stop - start) / step + 0.5))
    return start + step * np.arange(n + 1, dtype=np.float64)


def parse_sigmas(text: str) -> list[float]:
    vals = [float(part.strip()) for part in text.split(",") if part.strip()]
    if not vals:
        raise ValueError("--sigmas must contain at least one value")
    return vals


def finite_sum(t_values: np.ndarray, logs: np.ndarray, weights: np.ndarray) -> np.ndarray:
    if logs.size == 0:
        return np.zeros(t_values.size, dtype=np.complex128)
    return exp_dot(t_values, logs, weights)


def safe_ratio(num: np.ndarray, den: np.ndarray) -> np.ndarray:
    out = np.empty(num.size, dtype=np.float64)
    mask = den > 0.0
    out[mask] = num[mask] / den[mask]
    out[~mask] = np.inf
    return out


def tilt_factor_values(
    mode: str,
    centers: np.ndarray,
    ks: np.ndarray,
    sigma: float,
    strength: float,
) -> np.ndarray:
    if mode == "none" or strength == 0.0:
        return np.ones(centers.size, dtype=np.float64)

    delta = float(sigma) - 0.5
    if mode == "depth-linear":
        profile = delta * (ks.astype(np.float64) - 2.0)
        return 1.0 + float(strength) * profile

    c = centers.astype(np.float64)
    raw_bracket = (c - 1.0) ** (-delta) + (c + 1.0) ** (-delta) - 2.0 * (c ** (-delta))
    if mode == "tilt-bracket":
        profile = raw_bracket
        return 1.0 + float(strength) * profile

    theta_norm = ((1.0 - 1.0 / c) ** (-delta)) + ((1.0 + 1.0 / c) ** (-delta)) - 2.0
    if mode == "transverse-norm":
        profile = theta_norm
    elif mode == "transverse-curvature":
        profile = c * c * theta_norm
    else:
        raise ValueError(f"unknown tilt mode: {mode}")

    return 1.0 + float(strength) * profile


def local_minima(y: np.ndarray) -> np.ndarray:
    if y.size < 3:
        return np.empty(0, dtype=np.int64)
    return np.where((y[1:-1] < y[:-2]) & (y[1:-1] < y[2:]))[0] + 1


def fmt(x: float) -> str:
    if math.isinf(x):
        return "inf" if x > 0 else "-inf"
    if math.isnan(x):
        return "nan"
    return f"{x:.6e}"


def evaluate_sigma(
    t_values: np.ndarray,
    sigma: float,
    centers: np.ndarray,
    ks: np.ndarray,
    cores: np.ndarray,
    x_cut: float,
    main_k_max: int,
    core_main: float,
    center_main: float,
    tilt_mode: str,
    tilt_lambda: float,
) -> tuple[list[LedgerRow], dict[str, np.ndarray]]:
    logs = np.log(centers)
    tilt_factors = tilt_factor_values(tilt_mode, centers, ks, sigma, tilt_lambda)
    weights = (
        2.0
        * np.exp2(-ks.astype(np.float64))
        * np.exp(-float(sigma) * logs)
        * np.exp(-((centers / float(x_cut)) ** 2))
        * tilt_factors
    )

    full = finite_sum(t_values, logs, weights)
    full_abs = np.abs(full)
    total_mass = float(np.sum(np.abs(weights), dtype=np.float64))
    total_mass_arr = np.full(t_values.size, total_mass, dtype=np.float64)
    full_efficiency = safe_ratio(full_abs, total_mass_arr)

    depth_mask = ks <= int(main_k_max)
    core_mask = cores <= float(core_main)
    center_mask = centers <= float(center_main)

    depth_main = finite_sum(t_values, logs[depth_mask], weights[depth_mask])
    depth_rest = full - depth_main
    core_main_val = finite_sum(t_values, logs[core_mask], weights[core_mask])
    core_rest = full - core_main_val
    center_main_val = finite_sum(t_values, logs[center_mask], weights[center_mask])
    center_rest = full - center_main_val

    depth_main_abs = np.abs(depth_main)
    depth_rest_abs = np.abs(depth_rest)
    core_main_abs = np.abs(core_main_val)
    core_rest_abs = np.abs(core_rest)
    center_main_abs = np.abs(center_main_val)
    center_rest_abs = np.abs(center_rest)

    depth_surplus = depth_main_abs - depth_rest_abs
    core_surplus = core_main_abs - core_rest_abs
    center_surplus = center_main_abs - center_rest_abs

    layer_sum_abs = np.zeros(t_values.size, dtype=np.float64)
    for k in np.unique(ks):
        mask = ks == k
        layer_sum_abs += np.abs(finite_sum(t_values, logs[mask], weights[mask]))
    layer_efficiency = safe_ratio(full_abs, layer_sum_abs)

    values = {
        "t": t_values,
        "full_abs": full_abs,
        "full_efficiency": full_efficiency,
        "depth_main_abs": depth_main_abs,
        "depth_rest_abs": depth_rest_abs,
        "depth_surplus": depth_surplus,
        "depth_coverage": safe_ratio(depth_rest_abs, depth_main_abs),
        "core_main_abs": core_main_abs,
        "core_rest_abs": core_rest_abs,
        "core_surplus": core_surplus,
        "core_coverage": safe_ratio(core_rest_abs, core_main_abs),
        "center_main_abs": center_main_abs,
        "center_rest_abs": center_rest_abs,
        "center_surplus": center_surplus,
        "center_coverage": safe_ratio(center_rest_abs, center_main_abs),
        "layer_sum_abs": layer_sum_abs,
        "layer_efficiency": layer_efficiency,
        "tilt_factor_min": np.full(t_values.size, float(np.min(tilt_factors)), dtype=np.float64),
        "tilt_factor_max": np.full(t_values.size, float(np.max(tilt_factors)), dtype=np.float64),
    }

    rows: list[LedgerRow] = []
    for i in range(t_values.size):
        rows.append(
            LedgerRow(
                sigma=float(sigma),
                t=float(t_values[i]),
                full_abs=float(full_abs[i]),
                total_mass=total_mass,
                full_efficiency=float(full_efficiency[i]),
                depth_main_abs=float(depth_main_abs[i]),
                depth_rest_abs=float(depth_rest_abs[i]),
                depth_surplus=float(depth_surplus[i]),
                depth_coverage=float(values["depth_coverage"][i]),
                core_main_abs=float(core_main_abs[i]),
                core_rest_abs=float(core_rest_abs[i]),
                core_surplus=float(core_surplus[i]),
                core_coverage=float(values["core_coverage"][i]),
                center_main_abs=float(center_main_abs[i]),
                center_rest_abs=float(center_rest_abs[i]),
                center_surplus=float(center_surplus[i]),
                center_coverage=float(values["center_coverage"][i]),
                layer_sum_abs=float(layer_sum_abs[i]),
                layer_efficiency=float(layer_efficiency[i]),
                tilt_factor_min=float(values["tilt_factor_min"][i]),
                tilt_factor_max=float(values["tilt_factor_max"][i]),
            )
        )

    return rows, values


def write_csv(path: Path, rows: list[LedgerRow]) -> None:
    if not rows:
        return
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=list(asdict(rows[0]).keys()))
        writer.writeheader()
        for row in rows:
            writer.writerow(asdict(row))


def print_sigma_report(sigma: float, rows: list[LedgerRow], values: dict[str, np.ndarray], top: int) -> None:
    min_full = rows[int(np.argmin(values["full_abs"]))]
    worst_depth = rows[int(np.argmin(values["depth_surplus"]))]
    worst_core = rows[int(np.argmin(values["core_surplus"]))]
    worst_center = rows[int(np.argmin(values["center_surplus"]))]
    min_layer_eff = rows[int(np.argmin(values["layer_efficiency"]))]
    minima = local_minima(values["full_abs"])

    depth_pass = int(np.count_nonzero(values["depth_surplus"] > 0.0))
    core_pass = int(np.count_nonzero(values["core_surplus"] > 0.0))
    center_pass = int(np.count_nonzero(values["center_surplus"] > 0.0))
    n = values["t"].size

    print()
    print(f"sigma={sigma:.6f}")
    print("-" * 72)
    print(f"points={n}, internal_minima={minima.size}")
    print(
        f"tilt_factor=[{fmt(rows[0].tilt_factor_min)}, {fmt(rows[0].tilt_factor_max)}]"
    )
    print(
        f"min |C|={fmt(min_full.full_abs)} at t={min_full.t:.6f}; "
        f"full_eff={fmt(min_full.full_efficiency)}"
    )
    print(
        f"depth pass={depth_pass}/{n}, worst_surplus={fmt(worst_depth.depth_surplus)} "
        f"at t={worst_depth.t:.6f}, coverage={fmt(worst_depth.depth_coverage)}"
    )
    print(
        f"core pass={core_pass}/{n}, worst_surplus={fmt(worst_core.core_surplus)} "
        f"at t={worst_core.t:.6f}, coverage={fmt(worst_core.core_coverage)}"
    )
    print(
        f"center pass={center_pass}/{n}, worst_surplus={fmt(worst_center.center_surplus)} "
        f"at t={worst_center.t:.6f}, coverage={fmt(worst_center.center_coverage)}"
    )
    print(
        f"min layer_eff={fmt(min_layer_eff.layer_efficiency)} at t={min_layer_eff.t:.6f}; "
        f"layer_sum_abs={fmt(min_layer_eff.layer_sum_abs)}"
    )

    print("\nsmallest |C| rows:")
    for idx in np.argsort(values["full_abs"])[: max(0, top)]:
        row = rows[int(idx)]
        print(
            f"  t={row.t:.6f} |C|={fmt(row.full_abs)} "
            f"depth_s={fmt(row.depth_surplus)} core_s={fmt(row.core_surplus)} "
            f"center_s={fmt(row.center_surplus)} layer_eff={fmt(row.layer_efficiency)}"
        )


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description="C2 center Gaussian block ledger.")
    parser.add_argument("--nmax", type=int, default=200_000)
    parser.add_argument("--bg-kmax", type=int, default=5)
    parser.add_argument("--x-factor", type=float, default=3.0)
    parser.add_argument("--sigmas", type=str, default="0.5")
    parser.add_argument("--tmin", type=float, default=10.0)
    parser.add_argument("--tmax", type=float, default=50.0)
    parser.add_argument("--dt", type=float, default=0.05)
    parser.add_argument("--main-k-max", type=int, default=5)
    parser.add_argument("--core-main", type=float, default=401.0)
    parser.add_argument("--center-main-factor", type=float, default=1.0)
    parser.add_argument(
        "--tilt-mode",
        choices=[
            "none",
            "tilt-bracket",
            "transverse-norm",
            "transverse-curvature",
            "depth-linear",
        ],
        default="none",
    )
    parser.add_argument("--tilt-lambda", type=float, default=0.0)
    parser.add_argument("--threads", type=int, default=None)
    parser.add_argument("--top", type=int, default=5)
    parser.add_argument("--csv", type=Path, default=None)
    return parser


def main() -> None:
    args = build_parser().parse_args()
    if args.nmax < 8:
        raise SystemExit("nmax must be at least 8")
    if args.bg_kmax < 2:
        raise SystemExit("bg-kmax must be at least 2")
    if args.x_factor <= 0.0:
        raise SystemExit("x-factor must be positive")
    if args.threads is not None:
        if args.threads < 1:
            raise SystemExit("threads must be positive")
        numba.set_num_threads(args.threads)

    sigmas = parse_sigmas(args.sigmas)
    x_cut = float(args.nmax) / float(args.x_factor)
    center_main = float(args.center_main_factor) * x_cut
    t_values = float_grid(args.tmin, args.tmax, args.dt)
    centers, ks, cores = build_c2_centers(args.nmax, args.bg_kmax)
    if centers.size == 0:
        raise SystemExit("no centers were built; check nmax/bg-kmax")

    print("C2 center Gaussian ledger")
    print("=========================")
    print("Operator: sum 2*2^(-k)*c^(-s)*exp(-(c/X)^2), c=2^k*m, m odd")
    print("No external comparison data is used.")
    print(f"nmax={args.nmax}, bg_kmax={args.bg_kmax}, centers={centers.size:,}")
    print(f"X={x_cut:.12g}, center_main={center_main:.12g}, core_main={args.core_main}")
    print(f"depth main: k <= {args.main_k_max}; scan=[{args.tmin}, {args.tmax}] dt={args.dt}")
    print(f"tilt_mode={args.tilt_mode}, tilt_lambda={args.tilt_lambda}")
    print(f"sigmas={sigmas}; threads={numba.get_num_threads()}")

    all_rows: list[LedgerRow] = []
    tic_all = time.time()
    for sigma in sigmas:
        tic = time.time()
        rows, values = evaluate_sigma(
            t_values=t_values,
            sigma=sigma,
            centers=centers,
            ks=ks,
            cores=cores,
            x_cut=x_cut,
            main_k_max=args.main_k_max,
            core_main=args.core_main,
            center_main=center_main,
            tilt_mode=args.tilt_mode,
            tilt_lambda=args.tilt_lambda,
        )
        all_rows.extend(rows)
        print_sigma_report(sigma, rows, values, args.top)
        print(f"elapsed sigma={sigma:.6f}: {time.time() - tic:.2f}s")

    if args.csv is not None:
        write_csv(args.csv, all_rows)
        print(f"\nCSV written to: {args.csv}")

    print(f"\ntotal elapsed: {time.time() - tic_all:.2f}s")


if __name__ == "__main__":
    main()
