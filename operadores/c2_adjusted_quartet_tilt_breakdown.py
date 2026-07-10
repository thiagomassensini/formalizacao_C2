#!/usr/bin/env python3
"""
Fine tilt-aware breakdown for the finite C2 adjusted quartet.

This diagnostic reuses the same finite objects as
`c2_adjusted_quartet_evaluator.py`, but exposes the seed/tilt accounting before
collapsing everything into one surplus number.

No zeta data, functional equation, explicit formula, or external zero
comparison is used.
"""

from __future__ import annotations

import argparse
import csv
import math
import time
from collections import Counter
from dataclasses import asdict, dataclass
from pathlib import Path

import numpy as np
import numba

from c2_adjusted_quartet_evaluator import (
    AdjustedQuartetEvaluator,
    build_parser as build_base_parser,
    finite_sum,
    float_grid,
    fmt,
    q_values,
    validate_args,
    vertical_quartet_prefix,
)


@dataclass(frozen=True)
class BreakdownRow:
    sigma: float
    t: float
    q_abs: float
    main_base: float
    seed_complex_re: float
    seed_complex_im: float
    seed_abs: float
    prefix_abs: float
    seed_prefix_norm_tax: float
    main_seeded_oriented: float
    oriented_gain: float
    tail_without_tilt: float
    tilt_tail_upper: float
    vertical_tail: float
    horizontal_tail: float
    horizontal_defect: float
    cutoff_budget: float
    defect_total: float
    surplus_no_tilt: float
    surplus_tilt_norm_only: float
    surplus_tilt_oriented: float
    norm_tax: float
    net_oriented_gain: float
    failure_class: str


def parse_sigmas(text: str) -> list[float]:
    vals = [float(part.strip()) for part in text.split(",") if part.strip()]
    if not vals:
        raise ValueError("--sigmas must contain at least one value")
    return vals


def classify_failure(
    *,
    surplus_tilt_oriented: float,
    oriented_gain: float,
    norm_tax: float,
    main_base: float,
    main_seeded_oriented: float,
    horizontal_defect: float,
    tilt_tail_upper: float,
    vertical_tail: float,
    cutoff_budget: float,
    tail_without_tilt: float,
    defect_total: float,
) -> str:
    if surplus_tilt_oriented > 0.0:
        return "pass"
    if oriented_gain < 0.0:
        return "seed_hurts_phase"

    if oriented_gain > 0.0 and norm_tax >= oriented_gain:
        return "seed_helps_but_norm_tax_eats"

    if main_base < 0.5 * (defect_total + tail_without_tilt):
        return "main_base_too_small"
    if main_seeded_oriented < 0.5 * (defect_total + tail_without_tilt + tilt_tail_upper):
        return "main_oriented_too_small"

    costs = {
        "horizontal_defect_dominates": horizontal_defect,
        "tilt_tail_dominates": tilt_tail_upper,
        "vertical_tail_dominates": vertical_tail,
        "cutoff_dominates": cutoff_budget,
    }
    dominant, value = max(costs.items(), key=lambda item: item[1])
    total_cost = sum(costs.values())
    if total_cost > 0.0 and value >= 0.45 * total_cost:
        return dominant
    return "mixed_failure"


def evaluate_breakdown(args: argparse.Namespace, t_values: np.ndarray) -> list[BreakdownRow]:
    evaluator = AdjustedQuartetEvaluator(args)
    sigma = float(args.sigma)

    q = q_values(t_values, sigma)
    r = np.abs(q)
    prefix = vertical_quartet_prefix(q)
    prefix_abs = np.abs(prefix)

    odd_core = finite_sum(t_values, evaluator.core_logs, evaluator.core_weights)
    odd_ref = finite_sum(t_values, evaluator.odd_ref_logs, evaluator.odd_ref_weights)
    horizontal_delta = odd_core - odd_ref

    target_rect = finite_sum(t_values, evaluator.target_logs, evaluator.target_weights)
    central_ref = finite_sum(t_values, evaluator.central_ref_logs, evaluator.central_ref_weights)

    vertical_depth_tail_from_two = (q * q) / (1.0 - q)
    vertical_rectangular_residual = vertical_depth_tail_from_two + target_rect - 2.0 * central_ref
    horizontal_defect_total_complex = 2.0 * (q * q) / (1.0 - q) * horizontal_delta
    seed = (-vertical_rectangular_residual - horizontal_defect_total_complex) * (1.0 - q)

    main_base = np.abs(q * q * prefix)
    main_seeded_oriented = np.abs((q * q + seed) * prefix)
    oriented_gain = main_seeded_oriented - main_base

    defect_layers = []
    for j in range(4):
        layer = 2.0 * (q ** (j + 2)) * horizontal_delta
        defect_layers.append(np.abs(layer))
    horizontal_defect = defect_layers[0] + defect_layers[1] + defect_layers[2] + defect_layers[3]
    defect_total = horizontal_defect

    vertical_tail = (r**6) / (1.0 - r)
    seed_abs = np.abs(seed)
    seed_prefix_norm_tax = seed_abs * prefix_abs
    tilt_tail_upper = seed_abs * (r**4) / (1.0 - r)
    horizontal_tail = 2.0 * np.abs(horizontal_delta) * (r**6) / (1.0 - r)
    cutoff_budget = np.abs(target_rect - central_ref)
    tail_without_tilt = vertical_tail + horizontal_tail + cutoff_budget

    norm_tax = seed_prefix_norm_tax + tilt_tail_upper
    surplus_no_tilt = main_base - defect_total - tail_without_tilt
    surplus_tilt_norm_only = surplus_no_tilt - norm_tax
    surplus_tilt_oriented = main_seeded_oriented - defect_total - tail_without_tilt - tilt_tail_upper
    net_oriented_gain = oriented_gain - norm_tax

    rows: list[BreakdownRow] = []
    for i, t in enumerate(t_values):
        failure_class = classify_failure(
            surplus_tilt_oriented=float(surplus_tilt_oriented[i]),
            oriented_gain=float(oriented_gain[i]),
            norm_tax=float(norm_tax[i]),
            main_base=float(main_base[i]),
            main_seeded_oriented=float(main_seeded_oriented[i]),
            horizontal_defect=float(horizontal_defect[i]),
            tilt_tail_upper=float(tilt_tail_upper[i]),
            vertical_tail=float(vertical_tail[i]),
            cutoff_budget=float(cutoff_budget[i]),
            tail_without_tilt=float(tail_without_tilt[i]),
            defect_total=float(defect_total[i]),
        )
        rows.append(
            BreakdownRow(
                sigma=sigma,
                t=float(t),
                q_abs=float(r[i]),
                main_base=float(main_base[i]),
                seed_complex_re=float(seed[i].real),
                seed_complex_im=float(seed[i].imag),
                seed_abs=float(seed_abs[i]),
                prefix_abs=float(prefix_abs[i]),
                seed_prefix_norm_tax=float(seed_prefix_norm_tax[i]),
                main_seeded_oriented=float(main_seeded_oriented[i]),
                oriented_gain=float(oriented_gain[i]),
                tail_without_tilt=float(tail_without_tilt[i]),
                tilt_tail_upper=float(tilt_tail_upper[i]),
                vertical_tail=float(vertical_tail[i]),
                horizontal_tail=float(horizontal_tail[i]),
                horizontal_defect=float(horizontal_defect[i]),
                cutoff_budget=float(cutoff_budget[i]),
                defect_total=float(defect_total[i]),
                surplus_no_tilt=float(surplus_no_tilt[i]),
                surplus_tilt_norm_only=float(surplus_tilt_norm_only[i]),
                surplus_tilt_oriented=float(surplus_tilt_oriented[i]),
                norm_tax=float(norm_tax[i]),
                net_oriented_gain=float(net_oriented_gain[i]),
                failure_class=failure_class,
            )
        )
    return rows


def write_csv(path: Path, rows: list[BreakdownRow]) -> None:
    if not rows:
        return
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=list(asdict(rows[0]).keys()))
        writer.writeheader()
        for row in rows:
            writer.writerow(asdict(row))


def print_summary(label: str, rows: list[BreakdownRow], top: int) -> None:
    counts = Counter(row.failure_class for row in rows)
    worst = min(rows, key=lambda row: row.surplus_tilt_oriented)
    best_gain = max(rows, key=lambda row: row.oriented_gain)
    worst_gain = min(rows, key=lambda row: row.oriented_gain)
    positive_gain_fail = [
        row for row in rows if row.oriented_gain > 0.0 and row.surplus_tilt_oriented <= 0.0
    ]
    seed_hurts = [row for row in rows if row.failure_class == "seed_hurts_phase"]

    print()
    print(label)
    print("-" * len(label))
    print(f"rows={len(rows)} classes={dict(counts)}")
    print(
        f"worst oriented: sigma={worst.sigma:.6f} t={worst.t:.6f} "
        f"surplus={fmt(worst.surplus_tilt_oriented)} class={worst.failure_class}"
    )
    print(
        f"best gain: sigma={best_gain.sigma:.6f} t={best_gain.t:.6f} "
        f"gain={fmt(best_gain.oriented_gain)} net_gain={fmt(best_gain.net_oriented_gain)}"
    )
    print(
        f"worst gain: sigma={worst_gain.sigma:.6f} t={worst_gain.t:.6f} "
        f"gain={fmt(worst_gain.oriented_gain)} class={worst_gain.failure_class}"
    )
    print(f"positive_gain_but_fail={len(positive_gain_fail)} seed_hurts_phase={len(seed_hurts)}")

    if positive_gain_fail:
        print("\ntop positive gain but still failing:")
        for row in sorted(positive_gain_fail, key=lambda r: r.surplus_tilt_oriented)[:top]:
            print(
                f"  sigma={row.sigma:.6f} t={row.t:.6f} "
                f"surplus={fmt(row.surplus_tilt_oriented)} gain={fmt(row.oriented_gain)} "
                f"norm_tax={fmt(row.norm_tax)} hdef={fmt(row.horizontal_defect)} "
                f"cutoff={fmt(row.cutoff_budget)} class={row.failure_class}"
            )

    if seed_hurts:
        print("\ntop seed_hurts_phase:")
        for row in sorted(seed_hurts, key=lambda r: r.oriented_gain)[:top]:
            print(
                f"  sigma={row.sigma:.6f} t={row.t:.6f} "
                f"gain={fmt(row.oriented_gain)} surplus={fmt(row.surplus_tilt_oriented)} "
                f"seed_abs={fmt(row.seed_abs)} class={row.failure_class}"
            )


def build_parser() -> argparse.ArgumentParser:
    parser = build_base_parser()
    parser.description = "Fine tilt-aware breakdown for finite C2 adjusted quartet."
    parser.add_argument("--sigmas", type=str, default="", help="Comma list overriding --sigma.")
    parser.add_argument("--label", type=str, default="adjusted_quartet_tilt_breakdown")
    return parser


def main() -> None:
    args = build_parser().parse_args()
    if args.threads is not None:
        if args.threads < 1:
            raise SystemExit("threads must be positive")
        numba.set_num_threads(args.threads)

    sigmas = parse_sigmas(args.sigmas) if args.sigmas else [float(args.sigma)]
    if args.t is not None:
        t_values = np.asarray([float(args.t)], dtype=np.float64)
    else:
        t_values = float_grid(args.t_min, args.t_max, args.dt)

    print("C2 adjusted quartet tilt breakdown")
    print("==================================")
    print("No zeta or external comparison data is used.")
    print(f"label={args.label}")
    print(f"sigmas={sigmas}; t_count={t_values.size}; threads={numba.get_num_threads()}")
    print(f"K={args.K}, M={args.M}, ref_K={args.ref_K}, ref_M={args.ref_M}")
    print(
        f"reference={args.reference_mode}, target={args.target_reference_mode}, "
        f"odd_ref={args.odd_reference_mode}"
    )
    print("surplus_tilt_oriented formula:")
    print("  main_seeded_oriented - defect_total - tail_without_tilt - tilt_tail_upper")
    print("defect_total formula:")
    print("  sum_j |2*q^(j+2)*horizontal_delta| for j=0..3")

    all_rows: list[BreakdownRow] = []
    tic_all = time.time()
    for sigma in sigmas:
        args.sigma = float(sigma)
        validate_args(args)
        tic = time.time()
        rows = evaluate_breakdown(args, t_values)
        all_rows.extend(rows)
        print_summary(f"{args.label} sigma={sigma:.6f}", rows, args.top)
        print(f"elapsed sigma={sigma:.6f}: {time.time() - tic:.2f}s")

    if args.csv is not None:
        write_csv(args.csv, all_rows)
        print(f"\nCSV written to: {args.csv}")
    print_summary(f"{args.label} all", all_rows, args.top)
    print(f"\ntotal elapsed: {time.time() - tic_all:.2f}s")


if __name__ == "__main__":
    main()
