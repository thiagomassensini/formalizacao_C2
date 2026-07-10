#!/usr/bin/env python3
"""
C2 tilt-aware middle ledger.

This script tests whether the normalized tilt curvature behaves like a raw
debt or like an oriented contribution to the main ledger.

It uses only the intrinsic C2 center-Gaussian operator:

    sum 2 * 2^(-k) * c^(-s) * exp(-(c/X)^2), c = 2^k*m, m odd.

For each block split it compares three ledgers on the same grid:

    no_tilt:
      |main_0| - |rest_0|

    tilt_norm_only:
      |main_0| - |rest_0| - (|tilt_main| + |tilt_rest|)

    tilt_oriented:
      |main_0 + tilt_main| - |rest_0 + tilt_rest|

No zeta data, functional equation, or external zero information is used.
"""

from __future__ import annotations

import argparse
import csv
import math
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
class TiltAwareRow:
    sigma: float
    t: float
    split: str
    main0_abs: float
    rest0_abs: float
    tilt_main_abs: float
    tilt_rest_abs: float
    no_tilt_surplus: float
    tilt_norm_only_surplus: float
    tilt_oriented_surplus: float
    oriented_gain: float
    norm_tax: float
    full0_abs: float
    full_oriented_abs: float
    full_abs_gain: float
    branch_mass: float
    branch_defect: float
    profile_min: float
    profile_max: float
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


def finite_sum(t_values: np.ndarray, logs: np.ndarray, weights: np.ndarray) -> np.ndarray:
    if logs.size == 0:
        return np.zeros(t_values.size, dtype=np.complex128)
    return exp_dot(t_values, logs, weights)


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


def branch_mass_sigma(sigma: float) -> float:
    q = 2.0 ** (-2.0 * float(sigma))
    return 2.0 * q * q / (1.0 - q)


def tilt_profile_values(mode: str, centers: np.ndarray, ks: np.ndarray, sigma: float) -> np.ndarray:
    if mode == "none":
        return np.zeros(centers.size, dtype=np.float64)

    delta = float(sigma) - 0.5
    if mode == "depth-linear":
        return delta * (ks.astype(np.float64) - 2.0)

    c = centers.astype(np.float64)
    raw_bracket = (c - 1.0) ** (-delta) + (c + 1.0) ** (-delta) - 2.0 * (c ** (-delta))
    if mode == "tilt-bracket":
        return raw_bracket

    theta_norm = ((1.0 - 1.0 / c) ** (-delta)) + ((1.0 + 1.0 / c) ** (-delta)) - 2.0
    if mode == "transverse-norm":
        return theta_norm
    if mode == "transverse-curvature":
        return c * c * theta_norm
    raise ValueError(f"unknown tilt mode: {mode}")


def split_masks(
    split: str,
    centers: np.ndarray,
    ks: np.ndarray,
    cores: np.ndarray,
    main_k_max: int,
    core_main: float,
    center_main: float,
) -> np.ndarray:
    if split == "depth":
        return ks <= int(main_k_max)
    if split == "core":
        return cores <= float(core_main)
    if split == "center":
        return centers <= float(center_main)
    raise ValueError(f"unknown split: {split}")


def evaluate_split(
    t_values: np.ndarray,
    sigma: float,
    split: str,
    centers: np.ndarray,
    ks: np.ndarray,
    cores: np.ndarray,
    x_cut: float,
    main_k_max: int,
    core_main: float,
    center_main: float,
    tilt_mode: str,
    tilt_lambda: float,
) -> tuple[list[TiltAwareRow], dict[str, np.ndarray]]:
    logs = np.log(centers)
    profile = tilt_profile_values(tilt_mode, centers, ks, sigma)
    tilt_factors = 1.0 + float(tilt_lambda) * profile

    base_weights = (
        2.0
        * np.exp2(-ks.astype(np.float64))
        * np.exp(-float(sigma) * logs)
        * np.exp(-((centers / float(x_cut)) ** 2))
    )
    tilt_weights = base_weights * (float(tilt_lambda) * profile)

    mask = split_masks(split, centers, ks, cores, main_k_max, core_main, center_main)

    main0 = finite_sum(t_values, logs[mask], base_weights[mask])
    rest0 = finite_sum(t_values, logs[~mask], base_weights[~mask])
    tilt_main = finite_sum(t_values, logs[mask], tilt_weights[mask])
    tilt_rest = finite_sum(t_values, logs[~mask], tilt_weights[~mask])

    full0 = main0 + rest0
    full_oriented = full0 + tilt_main + tilt_rest

    main0_abs = np.abs(main0)
    rest0_abs = np.abs(rest0)
    tilt_main_abs = np.abs(tilt_main)
    tilt_rest_abs = np.abs(tilt_rest)

    no_tilt_surplus = main0_abs - rest0_abs
    norm_tax = tilt_main_abs + tilt_rest_abs
    tilt_norm_only_surplus = no_tilt_surplus - norm_tax
    tilt_oriented_surplus = np.abs(main0 + tilt_main) - np.abs(rest0 + tilt_rest)
    oriented_gain = tilt_oriented_surplus - no_tilt_surplus

    full0_abs = np.abs(full0)
    full_oriented_abs = np.abs(full_oriented)
    full_abs_gain = full_oriented_abs - full0_abs

    bmass = branch_mass_sigma(sigma)
    bdef = bmass - 1.0
    pmin = float(np.min(profile)) if profile.size else 0.0
    pmax = float(np.max(profile)) if profile.size else 0.0
    fmin = float(np.min(tilt_factors)) if tilt_factors.size else 1.0
    fmax = float(np.max(tilt_factors)) if tilt_factors.size else 1.0

    values = {
        "t": t_values,
        "no_tilt_surplus": no_tilt_surplus,
        "tilt_norm_only_surplus": tilt_norm_only_surplus,
        "tilt_oriented_surplus": tilt_oriented_surplus,
        "oriented_gain": oriented_gain,
        "norm_tax": norm_tax,
        "full0_abs": full0_abs,
        "full_oriented_abs": full_oriented_abs,
        "full_abs_gain": full_abs_gain,
    }

    rows: list[TiltAwareRow] = []
    for i, t in enumerate(t_values):
        rows.append(
            TiltAwareRow(
                sigma=float(sigma),
                t=float(t),
                split=split,
                main0_abs=float(main0_abs[i]),
                rest0_abs=float(rest0_abs[i]),
                tilt_main_abs=float(tilt_main_abs[i]),
                tilt_rest_abs=float(tilt_rest_abs[i]),
                no_tilt_surplus=float(no_tilt_surplus[i]),
                tilt_norm_only_surplus=float(tilt_norm_only_surplus[i]),
                tilt_oriented_surplus=float(tilt_oriented_surplus[i]),
                oriented_gain=float(oriented_gain[i]),
                norm_tax=float(norm_tax[i]),
                full0_abs=float(full0_abs[i]),
                full_oriented_abs=float(full_oriented_abs[i]),
                full_abs_gain=float(full_abs_gain[i]),
                branch_mass=float(bmass),
                branch_defect=float(bdef),
                profile_min=pmin,
                profile_max=pmax,
                tilt_factor_min=fmin,
                tilt_factor_max=fmax,
            )
        )

    return rows, values


def fmt(x: float) -> str:
    if math.isinf(x):
        return "inf" if x > 0 else "-inf"
    if math.isnan(x):
        return "nan"
    return f"{x:.6e}"


def write_csv(path: Path, rows: list[TiltAwareRow]) -> None:
    if not rows:
        return
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=list(asdict(rows[0]).keys()))
        writer.writeheader()
        for row in rows:
            writer.writerow(asdict(row))


def print_report(sigma: float, split: str, rows: list[TiltAwareRow], values: dict[str, np.ndarray], top: int) -> None:
    n = len(rows)
    worst_no = rows[int(np.argmin(values["no_tilt_surplus"]))]
    worst_norm = rows[int(np.argmin(values["tilt_norm_only_surplus"]))]
    worst_oriented = rows[int(np.argmin(values["tilt_oriented_surplus"]))]
    best_gain = rows[int(np.argmax(values["oriented_gain"]))]
    worst_gain = rows[int(np.argmin(values["oriented_gain"]))]

    pass_no = int(np.count_nonzero(values["no_tilt_surplus"] > 0.0))
    pass_norm = int(np.count_nonzero(values["tilt_norm_only_surplus"] > 0.0))
    pass_oriented = int(np.count_nonzero(values["tilt_oriented_surplus"] > 0.0))
    gain_pos = int(np.count_nonzero(values["oriented_gain"] > 0.0))

    print()
    print(f"sigma={sigma:.6f} split={split}")
    print("-" * 78)
    print(
        f"branch_mass={fmt(rows[0].branch_mass)} branch_defect={fmt(rows[0].branch_defect)} "
        f"profile=[{fmt(rows[0].profile_min)}, {fmt(rows[0].profile_max)}] "
        f"factor=[{fmt(rows[0].tilt_factor_min)}, {fmt(rows[0].tilt_factor_max)}]"
    )
    print(f"pass no/norm/oriented = {pass_no}/{pass_norm}/{pass_oriented} of {n}; gain_pos={gain_pos}/{n}")
    print(f"worst no_tilt      {fmt(worst_no.no_tilt_surplus)} at t={worst_no.t:.6f}")
    print(f"worst norm_only    {fmt(worst_norm.tilt_norm_only_surplus)} at t={worst_norm.t:.6f}")
    print(f"worst oriented     {fmt(worst_oriented.tilt_oriented_surplus)} at t={worst_oriented.t:.6f}")
    print(f"best oriented_gain {fmt(best_gain.oriented_gain)} at t={best_gain.t:.6f}")
    print(f"worst oriented_gain {fmt(worst_gain.oriented_gain)} at t={worst_gain.t:.6f}")

    print("\nworst oriented rows:")
    for idx in np.argsort(values["tilt_oriented_surplus"])[: max(0, top)]:
        row = rows[int(idx)]
        print(
            f"  t={row.t:.6f} no={fmt(row.no_tilt_surplus)} "
            f"norm={fmt(row.tilt_norm_only_surplus)} oriented={fmt(row.tilt_oriented_surplus)} "
            f"gain={fmt(row.oriented_gain)} tax={fmt(row.norm_tax)}"
        )


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description="C2 tilt-aware middle ledger.")
    parser.add_argument("--nmax", type=int, default=200_000)
    parser.add_argument("--bg-kmax", type=int, default=12)
    parser.add_argument("--x-factor", type=float, default=3.0)
    parser.add_argument("--sigmas", type=str, default="0.74,0.75")
    parser.add_argument("--tmin", type=float, default=13.8)
    parser.add_argument("--tmax", type=float, default=14.5)
    parser.add_argument("--dt", type=float, default=0.001)
    parser.add_argument("--main-k-max", type=int, default=5)
    parser.add_argument("--core-main", type=float, default=401.0)
    parser.add_argument("--center-main-factor", type=float, default=1.5)
    parser.add_argument("--splits", type=str, default="core", help="comma list: depth,core,center")
    parser.add_argument(
        "--tilt-mode",
        choices=["none", "tilt-bracket", "transverse-norm", "transverse-curvature", "depth-linear"],
        default="transverse-curvature",
    )
    parser.add_argument("--tilt-lambda", type=float, default=1.0)
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
    splits = [part.strip() for part in args.splits.split(",") if part.strip()]
    for split in splits:
        if split not in {"depth", "core", "center"}:
            raise SystemExit(f"unknown split: {split}")

    x_cut = float(args.nmax) / float(args.x_factor)
    center_main = float(args.center_main_factor) * x_cut
    t_values = float_grid(args.tmin, args.tmax, args.dt)
    centers, ks, cores = build_c2_centers(args.nmax, args.bg_kmax)
    if centers.size == 0:
        raise SystemExit("no centers were built; check nmax/bg-kmax")

    print("C2 tilt-aware middle ledger")
    print("===========================")
    print("No zeta or external comparison data is used.")
    print(f"nmax={args.nmax}, bg_kmax={args.bg_kmax}, centers={centers.size:,}")
    print(f"X={x_cut:.12g}, center_main={center_main:.12g}, core_main={args.core_main}")
    print(f"scan=[{args.tmin}, {args.tmax}] dt={args.dt}; sigmas={sigmas}")
    print(f"tilt_mode={args.tilt_mode}, tilt_lambda={args.tilt_lambda}, splits={splits}")
    print(f"threads={numba.get_num_threads()}")

    all_rows: list[TiltAwareRow] = []
    tic_all = time.time()
    for sigma in sigmas:
        for split in splits:
            tic = time.time()
            rows, values = evaluate_split(
                t_values=t_values,
                sigma=sigma,
                split=split,
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
            print_report(sigma, split, rows, values, args.top)
            print(f"elapsed sigma={sigma:.6f} split={split}: {time.time() - tic:.2f}s")

    if args.csv is not None:
        write_csv(args.csv, all_rows)
        print(f"\nCSV written to: {args.csv}")
    print(f"\ntotal elapsed: {time.time() - tic_all:.2f}s")


if __name__ == "__main__":
    main()
