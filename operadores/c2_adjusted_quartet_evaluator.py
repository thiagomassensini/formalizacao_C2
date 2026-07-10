#!/usr/bin/env python3
"""
Finite C2 adjusted quartet evaluator.

Numerical lab for the active Lean route:

  c2ConcreteAntiMiracleAdjustedMain
  c2ConcreteAntiMiracleAdjustedDefect
  c2ConcreteAntiMiracleAdjustedTailScaledUpper
  c2OddTailBalancingSeed

The tested inequality is:

  main - defect - tail_upper > 0

The infinite central and odd channels are represented by finite C2 reference
sums.  The default target rectangle is the raw Lean rectangle; regularized
targets can be selected explicitly for finite-model diagnostics.
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


LOG2 = math.log(2.0)


@numba.njit(parallel=True, fastmath=True, cache=True)
def exp_dot(t_values: np.ndarray, log_values: np.ndarray, weights: np.ndarray) -> np.ndarray:
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


@dataclass(frozen=True)
class QuartetAuditRow:
    t: float
    sigma: float
    r: float
    main: float
    defect: float
    tail_upper: float
    surplus: float
    coverage_ratio: float
    vertical_tail_upper: float
    tilt_tail_upper: float
    horizontal_tail_upper: float
    cutoff_budget: float
    defect_j0: float
    defect_j1: float
    defect_j2: float
    defect_j3: float
    seed_abs: float
    horizontal_delta_abs: float
    vertical_rectangular_residual_abs: float
    target_rect_abs: float
    central_ref_abs: float


def regularized_weight(mode: str, addresses: np.ndarray, x_scale: float, p: int) -> np.ndarray:
    if mode == "raw":
        return np.ones(addresses.size, dtype=np.float64)
    if x_scale <= 0.0:
        raise ValueError("regularization scale must be positive")
    if mode == "exponential":
        return np.exp(-(addresses / x_scale))
    if mode == "supergaussian":
        if p < 1:
            raise ValueError("regularization p must be at least 1")
        return np.exp(-((addresses / x_scale) ** p))
    raise ValueError(f"unknown mode: {mode}")


def odd_addresses(m_max: int) -> np.ndarray:
    if m_max < 1:
        return np.empty(0, dtype=np.float64)
    return np.arange(1, int(m_max) + 1, 2, dtype=np.float64)


def odd_terms(
    m_max: int,
    sigma: float,
    mode: str,
    x_scale: float,
    p: int,
) -> tuple[np.ndarray, np.ndarray]:
    odds = odd_addresses(m_max)
    logs = np.log(odds)
    weights = np.exp(-float(sigma) * logs)
    weights *= regularized_weight(mode, odds, x_scale, p)
    keep = weights != 0.0
    return logs[keep].astype(np.float64), weights[keep].astype(np.float64)


def central_terms(
    k_max: int,
    m_max: int,
    sigma: float,
    mode: str,
    x_scale: float,
    p: int,
) -> tuple[np.ndarray, np.ndarray]:
    if k_max < 2 or m_max < 1:
        return np.empty(0, dtype=np.float64), np.empty(0, dtype=np.float64)

    odds = odd_addresses(m_max)
    logs_by_k: list[np.ndarray] = []
    weights_by_k: list[np.ndarray] = []
    for k in range(2, int(k_max) + 1):
        depth = float(1 << k)
        centers = depth * odds
        logs = np.log(centers)
        reg = regularized_weight(mode, centers, x_scale, p)
        weights = (2.0 * math.ldexp(1.0, -k)) * np.exp(-float(sigma) * logs) * reg
        keep = weights != 0.0
        if np.any(keep):
            logs_by_k.append(logs[keep].astype(np.float64))
            weights_by_k.append(weights[keep].astype(np.float64))

    if not logs_by_k:
        return np.empty(0, dtype=np.float64), np.empty(0, dtype=np.float64)
    return np.concatenate(logs_by_k), np.concatenate(weights_by_k)


def q_values(t_values: np.ndarray, sigma: float) -> np.ndarray:
    r = 0.5 * math.exp(-float(sigma) * LOG2)
    angles = t_values * LOG2
    return r * (np.cos(angles) - 1j * np.sin(angles))


def depth_factor(q: np.ndarray, k_max: int) -> np.ndarray:
    total = np.zeros(q.size, dtype=np.complex128)
    power = q * q
    for k in range(2, int(k_max) + 1):
        if k > 2:
            power = power * q
        total = total + power
    return total


def vertical_quartet_prefix(q: np.ndarray) -> np.ndarray:
    return 1.0 + q + q * q + q * q * q


def finite_sum(t_values: np.ndarray, logs: np.ndarray, weights: np.ndarray) -> np.ndarray:
    if logs.size == 0:
        return np.zeros(t_values.size, dtype=np.complex128)
    return exp_dot(t_values, logs, weights)


def float_grid(start: float, stop: float, step: float) -> np.ndarray:
    if step <= 0.0:
        raise ValueError("dt must be positive")
    if stop < start:
        raise ValueError("t-max must be greater than or equal to t-min")
    count = int(math.floor((stop - start) / step + 0.5)) + 1
    return start + step * np.arange(count, dtype=np.float64)


def safe_ratio(num: np.ndarray, den: np.ndarray) -> np.ndarray:
    out = np.empty(num.size, dtype=np.float64)
    mask = den > 0.0
    out[mask] = num[mask] / den[mask]
    out[~mask] = np.inf
    return out


class AdjustedQuartetEvaluator:
    def __init__(self, args: argparse.Namespace):
        self.args = args
        self.sigma = float(args.sigma)

        odd_ref_m = args.odd_ref_M if args.odd_ref_M is not None else args.ref_M
        odd_ref_x = args.odd_reference_X if args.odd_reference_X is not None else args.reference_X
        odd_ref_p = args.odd_reference_p if args.odd_reference_p is not None else args.reference_p
        target_x = args.target_reference_X if args.target_reference_X is not None else args.reference_X
        target_p = args.target_reference_p if args.target_reference_p is not None else args.reference_p

        self.core_logs, self.core_weights = odd_terms(
            args.M, self.sigma, "raw", args.reference_X, args.reference_p
        )
        self.odd_ref_logs, self.odd_ref_weights = odd_terms(
            odd_ref_m, self.sigma, args.odd_reference_mode, odd_ref_x, odd_ref_p
        )
        self.target_logs, self.target_weights = central_terms(
            args.K, args.M, self.sigma, args.target_reference_mode, target_x, target_p
        )
        self.central_ref_logs, self.central_ref_weights = central_terms(
            args.ref_K, args.ref_M, self.sigma, args.reference_mode, args.reference_X, args.reference_p
        )

        self.odd_ref_m = odd_ref_m
        self.odd_ref_x = odd_ref_x
        self.odd_ref_p = odd_ref_p
        self.target_x = target_x
        self.target_p = target_p

    def evaluate(self, t_values: np.ndarray) -> dict[str, np.ndarray]:
        q = q_values(t_values, self.sigma)
        r = np.abs(q)

        odd_core = finite_sum(t_values, self.core_logs, self.core_weights)
        odd_ref = finite_sum(t_values, self.odd_ref_logs, self.odd_ref_weights)
        horizontal_delta = odd_core - odd_ref

        target_rect = finite_sum(t_values, self.target_logs, self.target_weights)
        central_ref = finite_sum(t_values, self.central_ref_logs, self.central_ref_weights)

        vertical_depth_tail_from_two = (q * q) / (1.0 - q)
        vertical_rectangular_residual = vertical_depth_tail_from_two + target_rect - 2.0 * central_ref

        horizontal_defect_total = 2.0 * (q * q) / (1.0 - q) * horizontal_delta
        seed = (-vertical_rectangular_residual - horizontal_defect_total) * (1.0 - q)

        prefix = vertical_quartet_prefix(q)
        main = np.abs((q * q + seed) * prefix)

        defects = []
        for j in range(4):
            layer = 2.0 * (q ** (j + 2)) * horizontal_delta
            defects.append(np.abs(layer))
        defect = defects[0] + defects[1] + defects[2] + defects[3]

        vertical_tail_upper = (r**6) / (1.0 - r)
        tilt_tail_upper = np.abs(seed) * (r**4) / (1.0 - r)
        horizontal_tail_upper = 2.0 * np.abs(horizontal_delta) * (r**6) / (1.0 - r)
        cutoff_budget = np.abs(target_rect - central_ref)
        tail_upper = vertical_tail_upper + tilt_tail_upper + horizontal_tail_upper + cutoff_budget

        surplus = main - defect - tail_upper
        coverage_ratio = safe_ratio(defect + tail_upper, main)

        return {
            "t": t_values,
            "q": q,
            "r": r,
            "main": main,
            "defect": defect,
            "tail_upper": tail_upper,
            "surplus": surplus,
            "coverage_ratio": coverage_ratio,
            "vertical_tail_upper": vertical_tail_upper,
            "tilt_tail_upper": tilt_tail_upper,
            "horizontal_tail_upper": horizontal_tail_upper,
            "cutoff_budget": cutoff_budget,
            "defect_j0": defects[0],
            "defect_j1": defects[1],
            "defect_j2": defects[2],
            "defect_j3": defects[3],
            "seed_abs": np.abs(seed),
            "horizontal_delta_abs": np.abs(horizontal_delta),
            "vertical_rectangular_residual_abs": np.abs(vertical_rectangular_residual),
            "target_rect_abs": np.abs(target_rect),
            "central_ref_abs": np.abs(central_ref),
        }


def rows_from_arrays(args: argparse.Namespace, values: dict[str, np.ndarray]) -> list[QuartetAuditRow]:
    rows: list[QuartetAuditRow] = []
    n = values["t"].size
    for i in range(n):
        rows.append(
            QuartetAuditRow(
                t=float(values["t"][i]),
                sigma=float(args.sigma),
                r=float(values["r"][i]),
                main=float(values["main"][i]),
                defect=float(values["defect"][i]),
                tail_upper=float(values["tail_upper"][i]),
                surplus=float(values["surplus"][i]),
                coverage_ratio=float(values["coverage_ratio"][i]),
                vertical_tail_upper=float(values["vertical_tail_upper"][i]),
                tilt_tail_upper=float(values["tilt_tail_upper"][i]),
                horizontal_tail_upper=float(values["horizontal_tail_upper"][i]),
                cutoff_budget=float(values["cutoff_budget"][i]),
                defect_j0=float(values["defect_j0"][i]),
                defect_j1=float(values["defect_j1"][i]),
                defect_j2=float(values["defect_j2"][i]),
                defect_j3=float(values["defect_j3"][i]),
                seed_abs=float(values["seed_abs"][i]),
                horizontal_delta_abs=float(values["horizontal_delta_abs"][i]),
                vertical_rectangular_residual_abs=float(values["vertical_rectangular_residual_abs"][i]),
                target_rect_abs=float(values["target_rect_abs"][i]),
                central_ref_abs=float(values["central_ref_abs"][i]),
            )
        )
    return rows


def fmt(x: float) -> str:
    if math.isinf(x):
        return "inf" if x > 0 else "-inf"
    if math.isnan(x):
        return "nan"
    return f"{x:.6e}"


def write_csv(path: Path, rows: list[QuartetAuditRow]) -> None:
    if not rows:
        return
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=list(asdict(rows[0]).keys()))
        writer.writeheader()
        for row in rows:
            writer.writerow(asdict(row))


def print_row(row: QuartetAuditRow) -> None:
    print(
        f"t={row.t:.6f}  surplus={fmt(row.surplus)}  "
        f"coverage={fmt(row.coverage_ratio)}  main={fmt(row.main)}  "
        f"defect={fmt(row.defect)}  tail={fmt(row.tail_upper)}"
    )
    print(
        f"    seed={fmt(row.seed_abs)}  cutoff={fmt(row.cutoff_budget)}  "
        f"tilt_tail={fmt(row.tilt_tail_upper)}  htail={fmt(row.horizontal_tail_upper)}  "
        f"vtail={fmt(row.vertical_tail_upper)}"
    )


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        description="Finite C2 adjusted quartet evaluator for main - defect - tail."
    )
    parser.add_argument("--sigma", type=float, default=0.5)
    parser.add_argument("--t", type=float, default=None, help="Evaluate a single height.")
    parser.add_argument("--t-min", type=float, default=10.0)
    parser.add_argument("--t-max", type=float, default=50.0)
    parser.add_argument("--dt", type=float, default=0.25)
    parser.add_argument("--K", type=int, default=16, help="Target rectangle depth cutoff.")
    parser.add_argument("--M", type=int, default=12001, help="Target rectangle odd-core cutoff.")
    parser.add_argument("--ref-K", type=int, default=17, help="Central reference depth cutoff.")
    parser.add_argument("--ref-M", type=int, default=16001, help="Central reference odd cutoff.")
    parser.add_argument("--odd-ref-M", type=int, default=None, help="Odd-channel reference cutoff.")
    parser.add_argument(
        "--reference-mode",
        choices=["raw", "exponential", "supergaussian"],
        default="supergaussian",
        help="Finite C2 central reference mode.",
    )
    parser.add_argument(
        "--target-reference-mode",
        choices=["raw", "exponential", "supergaussian"],
        default="raw",
        help="Target rectangle mode; raw mirrors the formal rectangle.",
    )
    parser.add_argument(
        "--odd-reference-mode",
        choices=["raw", "exponential", "supergaussian"],
        default="supergaussian",
        help="Finite odd-channel reference mode.",
    )
    parser.add_argument("--reference-X", type=float, default=10661.0)
    parser.add_argument("--reference-p", type=int, default=2)
    parser.add_argument("--target-reference-X", type=float, default=None)
    parser.add_argument("--target-reference-p", type=int, default=None)
    parser.add_argument("--odd-reference-X", type=float, default=None)
    parser.add_argument("--odd-reference-p", type=int, default=None)
    parser.add_argument("--threads", type=int, default=None, help="Numba thread count.")
    parser.add_argument("--top", type=int, default=8, help="Rows to print from worst surplus.")
    parser.add_argument("--csv", type=Path, default=None)
    return parser


def validate_args(args: argparse.Namespace) -> None:
    if args.K < 2 or args.ref_K < 2:
        raise SystemExit("K and ref-K must be at least 2")
    if args.M < 1 or args.ref_M < 1:
        raise SystemExit("M and ref-M must be at least 1")
    if args.odd_ref_M is not None and args.odd_ref_M < 1:
        raise SystemExit("odd-ref-M must be at least 1")
    if args.reference_X <= 0.0:
        raise SystemExit("reference-X must be positive")
    if args.reference_p < 1:
        raise SystemExit("reference-p must be at least 1")
    if args.threads is not None and args.threads < 1:
        raise SystemExit("threads must be positive")


def main() -> None:
    args = build_parser().parse_args()
    validate_args(args)
    if args.threads is not None:
        numba.set_num_threads(args.threads)

    if args.t is not None:
        t_values = np.array([args.t], dtype=np.float64)
    else:
        t_values = float_grid(args.t_min, args.t_max, args.dt)

    evaluator = AdjustedQuartetEvaluator(args)

    print("C2 adjusted quartet finite evaluator")
    print("====================================")
    print("Lean anchors: AdjustedMain, AdjustedDefect, AdjustedTailScaledUpper, OddTailBalancingSeed")
    print("Dominance tested: main - defect - tail_upper > 0")
    print(
        f"Region sample: sigma={args.sigma}, "
        f"t={'single ' + str(args.t) if args.t is not None else f'[{args.t_min}, {args.t_max}] dt={args.dt}'}"
    )
    print(
        f"Target: K={args.K}, M={args.M}, mode={args.target_reference_mode}; "
        f"central_ref=({args.ref_K}, {args.ref_M}), mode={args.reference_mode}; "
        f"odd_ref_M={evaluator.odd_ref_m}, odd_mode={args.odd_reference_mode}"
    )
    print(
        f"Scales: reference_X={args.reference_X}, reference_p={args.reference_p}, "
        f"target_X={evaluator.target_x}, target_p={evaluator.target_p}, "
        f"odd_X={evaluator.odd_ref_x}, odd_p={evaluator.odd_ref_p}"
    )
    print(
        f"Finite term counts: odd_core={evaluator.core_logs.size}, "
        f"odd_ref={evaluator.odd_ref_logs.size}, target={evaluator.target_logs.size}, "
        f"central_ref={evaluator.central_ref_logs.size}"
    )
    print(f"Numba threads: {numba.get_num_threads()}")

    tic = time.time()
    values = evaluator.evaluate(t_values)
    elapsed = time.time() - tic
    rows = rows_from_arrays(args, values)

    if args.csv is not None:
        write_csv(args.csv, rows)

    failures = int(np.count_nonzero(values["surplus"] <= 0.0))
    worst_idx = int(np.argmin(values["surplus"]))
    worst = rows[worst_idx]
    max_coverage = rows[int(np.argmax(values["coverage_ratio"]))]
    max_seed = rows[int(np.argmax(values["seed_abs"]))]
    max_cutoff = rows[int(np.argmax(values["cutoff_budget"]))]

    print("-" * 72)
    print(f"Elapsed: {elapsed:.2f}s for {t_values.size} point(s)")
    print(f"Minimum surplus: {fmt(worst.surplus)} at t={worst.t:.6f}")
    print(f"Maximum coverage ratio: {fmt(max_coverage.coverage_ratio)} at t={max_coverage.t:.6f}")
    print(f"Maximum seed abs: {fmt(max_seed.seed_abs)} at t={max_seed.t:.6f}")
    print(f"Maximum cutoff budget: {fmt(max_cutoff.cutoff_budget)} at t={max_cutoff.t:.6f}")

    if failures == 0:
        print("[PASS] No sampled point violated the adjusted quartet dominance.")
    else:
        print(f"[FAIL] {failures} sampled point(s) violated the adjusted quartet dominance.")

    print("\nWorst rows by surplus:")
    for idx in np.argsort(values["surplus"])[: max(0, args.top)]:
        print_row(rows[int(idx)])

    if args.csv is not None:
        print(f"\nCSV written to: {args.csv}")


if __name__ == "__main__":
    main()
