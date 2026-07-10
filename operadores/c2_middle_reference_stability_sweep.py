#!/usr/bin/env python3
"""
Parallel stability sweep for finite C2 middle-ledger references.

The active Lean middle ledger uses exact/infinite central channels.  Numerically,
we approximate them with finite C2 references and only trust a cut after comparing
it with a larger C2 cut.  This script automates that comparison across levels
(K, M), reference regularizations, X scales, and super-Gaussian powers.

No external analytic proxy is used.
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

    HAS_NUMBA = True
except ImportError:
    numba = None
    HAS_NUMBA = False


MODE_CODES = {
    "raw": 0,
    "exponential": 1,
    "supergaussian": 2,
}


@dataclass(frozen=True)
class CutLevel:
    K: int
    M: int


@dataclass(frozen=True)
class SweepRow:
    mode: str
    X: float
    p: int
    K: int
    M: int
    check_K: int
    check_M: int
    t_count: int
    max_ref_delta: float
    p95_ref_delta: float
    median_ref_delta: float
    worst_ref_t: float
    max_total_delta: float
    max_total_ratio: float
    min_quarter_surplus_ratio: float
    worst_total_t: float
    max_external_ratio: float
    max_lower_factor_ratio: float
    max_cutoff_pressure_ratio: float
    max_central_abs: float
    passes_ref: bool
    passes_total_delta: bool


if HAS_NUMBA:

    @numba.njit(parallel=True, fastmath=True, cache=True)
    def _reference_values_numba(
        t_values,
        sigma,
        K,
        odd_logs,
        odd_sigma_weights,
        odd_values,
        mode_code,
        x_scale,
        p,
    ):
        out_re = np.empty(t_values.size, dtype=np.float64)
        out_im = np.empty(t_values.size, dtype=np.float64)
        log2 = math.log(2.0)

        for i in numba.prange(t_values.size):
            t = t_values[i]
            re = 0.0
            im = 0.0
            for k in range(2, K + 1):
                depth = 2.0 ** k
                amp_k = 2.0 * (2.0 ** (-(sigma + 1.0) * k))
                phase_k = k * log2
                for j in range(odd_values.size):
                    center = depth * odd_values[j]
                    cutoff = 1.0
                    if mode_code == 1:
                        cutoff = math.exp(-(center / x_scale))
                    elif mode_code == 2:
                        cutoff = math.exp(-((center / x_scale) ** p))
                    amp = amp_k * odd_sigma_weights[j] * cutoff
                    phase = t * (phase_k + odd_logs[j])
                    re += amp * math.cos(phase)
                    im -= amp * math.sin(phase)
            out_re[i] = re
            out_im[i] = im

        return out_re + 1j * out_im


def parse_levels(text: str) -> list[CutLevel]:
    levels: list[CutLevel] = []
    for part in text.split(","):
        part = part.strip()
        if not part:
            continue
        if ":" not in part:
            raise ValueError(f"Invalid level '{part}', expected K:M")
        k_text, m_text = part.split(":", 1)
        level = CutLevel(int(k_text), int(m_text))
        if level.K < 2:
            raise ValueError("Every K must be at least 2")
        if level.M < 1:
            raise ValueError("Every M must be at least 1")
        levels.append(level)
    if len(levels) < 2:
        raise ValueError("At least two levels are required")
    return levels


def parse_float_list(text: str) -> list[float]:
    return [float(part.strip()) for part in text.split(",") if part.strip()]


def parse_int_list(text: str) -> list[int]:
    return [int(part.strip()) for part in text.split(",") if part.strip()]


def float_range(start: float, stop: float, step: float) -> np.ndarray:
    if step <= 0.0:
        raise ValueError("dt must be positive")
    n = int(math.floor((stop - start) / step + 0.5))
    return np.array([start + i * step for i in range(n + 1)], dtype=np.float64)


def odd_arrays(M: int, sigma: float) -> tuple[np.ndarray, np.ndarray, np.ndarray]:
    odds = np.arange(1, M + 1, 2, dtype=np.float64)
    logs = np.log(odds)
    weights = odds ** (-sigma)
    return logs, weights, odds


def reference_values(
    t_values: np.ndarray,
    sigma: float,
    level: CutLevel,
    mode: str,
    x_scale: float,
    p: int,
) -> np.ndarray:
    if not HAS_NUMBA:
        raise RuntimeError("This sweep script requires numba for now.")
    logs, weights, odds = odd_arrays(level.M, sigma)
    return _reference_values_numba(
        t_values,
        float(sigma),
        int(level.K),
        logs,
        weights,
        odds,
        int(MODE_CODES[mode]),
        float(x_scale),
        int(p),
    )


def q_values(t_values: np.ndarray, sigma: float) -> np.ndarray:
    q_abs = 2.0 ** (-(sigma + 1.0))
    return q_abs * np.exp(-1j * t_values * math.log(2.0))


def residual_margin_from_r(r: float) -> float:
    return (r * r) * ((1.0 - r) * (1.0 + r * r)) - (r**6) / (1.0 - r)


def ledger_arrays(
    t_values: np.ndarray,
    sigma: float,
    target_ref: np.ndarray,
    central_ref: np.ndarray,
    horizontal_constant: float,
    horizontal_scale: float,
    horizontal_ratio_mode: str,
    horizontal_ratio: float,
) -> dict[str, np.ndarray]:
    q = q_values(t_values, sigma)
    r = float(abs(q[0]))
    margin = residual_margin_from_r(r)
    cleared_margin = margin * ((1.0 - r) ** 2)
    if cleared_margin <= 0.0:
        inf = np.full(t_values.shape, np.inf, dtype=np.float64)
        return {
            "external_ratio": inf,
            "lower_ratio": inf,
            "total_ratio": inf,
            "quarter_surplus_ratio": -inf,
            "cutoff_pressure_ratio": inf,
            "central_abs": np.abs(central_ref),
        }

    ratio_value = r if horizontal_ratio_mode == "qnorm" else horizontal_ratio
    horizontal_upper = (horizontal_constant / horizontal_scale) / (1.0 - ratio_value)
    cutoff_budget = np.abs(target_ref - central_ref)
    central_abs = np.abs(central_ref)

    external_component_upper = (1.0 + r) * (central_abs + central_abs) + 2.0 * (
        horizontal_upper + cutoff_budget
    )
    external_ratio = external_component_upper * (1.0 - r) / cleared_margin

    tail = (q * q) / (1.0 - q)
    tail_lower = (r * r) / (1.0 + r)
    lower_factor_upper = np.abs(tail - central_ref) / tail_lower
    lower_factor_cost = ((1.0 + r) * (r * r)) * lower_factor_upper
    lower_ratio = lower_factor_cost / cleared_margin

    total_ratio = external_ratio + lower_ratio
    quarter_surplus_ratio = 0.75 - total_ratio
    cutoff_pressure_ratio = ((1.0 - r) * 2.0 * cutoff_budget) / cleared_margin

    return {
        "external_ratio": external_ratio,
        "lower_ratio": lower_ratio,
        "total_ratio": total_ratio,
        "quarter_surplus_ratio": quarter_surplus_ratio,
        "cutoff_pressure_ratio": cutoff_pressure_ratio,
        "central_abs": central_abs,
    }


def percentile(values: np.ndarray, q: float) -> float:
    return float(np.percentile(values, q))


def run_one_family(
    args: argparse.Namespace,
    t_values: np.ndarray,
    mode: str,
    x_scale: float,
    p: int,
    levels: list[CutLevel],
) -> list[SweepRow]:
    refs: list[np.ndarray] = []
    for level in levels:
        tic = time.time()
        ref = reference_values(t_values, args.sigma, level, mode, x_scale, p)
        refs.append(ref)
        elapsed = time.time() - tic
        print(
            f"computed mode={mode} X={x_scale:g} p={p} "
            f"K={level.K} M={level.M} in {elapsed:.2f}s",
            flush=True,
        )

    target_ref = reference_values(
        t_values,
        args.sigma,
        CutLevel(args.target_K, args.target_M),
        "raw",
        1.0,
        1,
    )

    ledger_by_level = [
        ledger_arrays(
            t_values,
            args.sigma,
            target_ref,
            ref,
            args.horizontal_constant,
            args.horizontal_scale,
            args.horizontal_ratio_mode,
            args.horizontal_ratio,
        )
        for ref in refs
    ]

    rows: list[SweepRow] = []
    for i in range(len(levels) - 1):
        level = levels[i]
        check = levels[i + 1]
        delta = np.abs(refs[i + 1] - refs[i])
        total_delta = np.abs(
            ledger_by_level[i + 1]["total_ratio"] - ledger_by_level[i]["total_ratio"]
        )
        worst_ref_idx = int(np.argmax(delta))
        total = ledger_by_level[i]["total_ratio"]
        worst_total_idx = int(np.argmax(total))

        row = SweepRow(
            mode=mode,
            X=float(x_scale),
            p=int(p),
            K=level.K,
            M=level.M,
            check_K=check.K,
            check_M=check.M,
            t_count=int(t_values.size),
            max_ref_delta=float(np.max(delta)),
            p95_ref_delta=percentile(delta, 95.0),
            median_ref_delta=float(np.median(delta)),
            worst_ref_t=float(t_values[worst_ref_idx]),
            max_total_delta=float(np.max(total_delta)),
            max_total_ratio=float(np.max(total)),
            min_quarter_surplus_ratio=float(
                np.min(ledger_by_level[i]["quarter_surplus_ratio"])
            ),
            worst_total_t=float(t_values[worst_total_idx]),
            max_external_ratio=float(np.max(ledger_by_level[i]["external_ratio"])),
            max_lower_factor_ratio=float(np.max(ledger_by_level[i]["lower_ratio"])),
            max_cutoff_pressure_ratio=float(
                np.max(ledger_by_level[i]["cutoff_pressure_ratio"])
            ),
            max_central_abs=float(np.max(ledger_by_level[i]["central_abs"])),
            passes_ref=bool(np.max(delta) <= args.ref_threshold),
            passes_total_delta=bool(np.max(total_delta) <= args.total_delta_threshold),
        )
        rows.append(row)
    return rows


def write_csv(path: Path, rows: list[SweepRow]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=list(asdict(rows[0]).keys()))
        writer.writeheader()
        for row in rows:
            writer.writerow(asdict(row))


def fmt(x: float) -> str:
    if math.isinf(x):
        return "inf" if x > 0 else "-inf"
    if math.isnan(x):
        return "nan"
    return f"{x:.3e}"


def print_table(rows: list[SweepRow], top: int) -> None:
    rows_sorted = sorted(rows, key=lambda row: (not row.passes_ref, row.max_ref_delta))
    print()
    print(
        f"{'mode':>13} {'X':>9} {'p':>3} {'K:M':>12} {'check':>12} "
        f"{'max_ref':>10} {'p95_ref':>10} {'max_dTot':>10} "
        f"{'max_total':>10} {'min_surplus':>11} {'ok':>5}"
    )
    print("-" * 111)
    for row in rows_sorted[:top]:
        ok = "yes" if row.passes_ref and row.passes_total_delta else "no"
        print(
            f"{row.mode:>13} {row.X:9.0f} {row.p:3d} "
            f"{row.K}:{row.M:<7d} {row.check_K}:{row.check_M:<7d} "
            f"{fmt(row.max_ref_delta):>10} {fmt(row.p95_ref_delta):>10} "
            f"{fmt(row.max_total_delta):>10} {fmt(row.max_total_ratio):>10} "
            f"{fmt(row.min_quarter_surplus_ratio):>11} {ok:>5}"
        )


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        description="Sweep stability of finite C2 middle-ledger reference cuts."
    )
    parser.add_argument("--sigma", type=float, default=0.5)
    parser.add_argument("--t-min", type=float, default=1.0)
    parser.add_argument("--t-max", type=float, default=50.0)
    parser.add_argument("--dt", type=float, default=0.5)
    parser.add_argument(
        "--levels",
        default="8:501,10:1001,12:2001,14:4001,16:8001,18:16001,20:32001",
        help="Comma-separated K:M cut levels. Consecutive levels are compared.",
    )
    parser.add_argument(
        "--modes",
        default="supergaussian",
        help="Comma-separated modes: raw, exponential, supergaussian.",
    )
    parser.add_argument("--x-list", default="10661")
    parser.add_argument("--p-list", default="2")
    parser.add_argument("--target-K", type=int, default=5)
    parser.add_argument("--target-M", type=int, default=3)
    parser.add_argument("--horizontal-constant", type=float, default=0.0)
    parser.add_argument("--horizontal-scale", type=float, default=1.0)
    parser.add_argument("--horizontal-ratio", type=float, default=0.0)
    parser.add_argument(
        "--horizontal-ratio-mode",
        choices=["constant", "qnorm"],
        default="qnorm",
    )
    parser.add_argument("--ref-threshold", type=float, default=1.0e-4)
    parser.add_argument("--total-delta-threshold", type=float, default=1.0e-2)
    parser.add_argument("--threads", type=int, default=os.cpu_count() or 1)
    parser.add_argument("--csv", type=Path, default=None)
    parser.add_argument("--top", type=int, default=12)
    return parser


def main() -> None:
    args = build_parser().parse_args()
    if not HAS_NUMBA:
        raise SystemExit("Install numba first: pip install numba")
    if args.threads < 1:
        raise SystemExit("--threads must be positive")
    numba.set_num_threads(args.threads)

    levels = parse_levels(args.levels)
    modes = [mode.strip() for mode in args.modes.split(",") if mode.strip()]
    unknown_modes = [mode for mode in modes if mode not in MODE_CODES]
    if unknown_modes:
        raise SystemExit(f"Unknown modes: {unknown_modes}")
    x_values = parse_float_list(args.x_list)
    p_values = parse_int_list(args.p_list)
    t_values = float_range(args.t_min, args.t_max, args.dt)

    print("C2 finite reference stability sweep")
    print("===================================")
    print(
        f"sigma={args.sigma}, t=[{args.t_min}, {args.t_max}], dt={args.dt}, "
        f"points={t_values.size}, threads={args.threads}"
    )
    print(f"levels={args.levels}")
    print(
        f"thresholds: ref<={args.ref_threshold:g}, "
        f"total_delta<={args.total_delta_threshold:g}"
    )
    print()

    rows: list[SweepRow] = []
    tic_all = time.time()
    for mode in modes:
        if mode == "raw":
            families = [(0.0, 0)]
        elif mode == "exponential":
            families = [(x, 1) for x in x_values]
        else:
            families = [(x, p) for x in x_values for p in p_values]
        for x_scale, p in families:
            rows.extend(run_one_family(args, t_values, mode, x_scale, p, levels))

    elapsed_all = time.time() - tic_all
    print()
    print(f"sweep elapsed: {elapsed_all:.2f}s")
    print_table(rows, args.top)

    passing = [row for row in rows if row.passes_ref and row.passes_total_delta]
    if passing:
        best = sorted(passing, key=lambda row: (row.M, row.K, row.max_ref_delta))[0]
        print()
        print(
            "first passing cut by size: "
            f"mode={best.mode}, X={best.X:g}, p={best.p}, "
            f"K={best.K}, M={best.M}, "
            f"check=({best.check_K},{best.check_M}), "
            f"max_ref_delta={fmt(best.max_ref_delta)}, "
            f"max_total_delta={fmt(best.max_total_delta)}"
        )
    else:
        print()
        print("No cut passed both thresholds in this sweep.")

    if args.csv is not None:
        write_csv(args.csv, rows)
        print(f"CSV written: {args.csv}")


if __name__ == "__main__":
    main()
