#!/usr/bin/env python3
"""
Tilt-aware diagnostic for the finite C2 adjusted quartet evaluator.

It reuses `c2_adjusted_quartet_evaluator.py` and compares:

    no_tilt:
      |q^2 * (1+q+q^2+q^3)| - defect - tail_without_tilt

    tilt_norm_only:
      no_tilt - |seed * (1+q+q^2+q^3)| - tilt_tail_upper

    tilt_oriented:
      |(q^2 + seed) * (1+q+q^2+q^3)| - defect - tail_upper

The last quantity is the existing adjusted-quartet surplus.  The diagnostic is
whether the seed/tilt behaves as tax under norm-only bookkeeping but as margin
when collected into the adjusted main term.
"""

from __future__ import annotations

import argparse
import csv
import math
import time
from dataclasses import asdict, dataclass
from pathlib import Path

import numpy as np

import numba

from c2_adjusted_quartet_evaluator import (
    AdjustedQuartetEvaluator,
    build_parser as build_base_parser,
    float_grid,
    fmt,
    safe_ratio,
    validate_args,
)


@dataclass(frozen=True)
class AdjustedTiltAwareRow:
    sigma: float
    t: float
    r: float
    main_base: float
    main_seeded_oriented: float
    seed_prefix_norm_tax: float
    defect: float
    tail_without_tilt: float
    tilt_tail_upper: float
    tail_upper: float
    surplus_no_tilt: float
    surplus_tilt_norm_only: float
    surplus_tilt_oriented: float
    oriented_gain_vs_no_tilt: float
    norm_tax_total: float
    coverage_no_tilt: float
    coverage_norm_only: float
    coverage_oriented: float
    seed_abs: float
    horizontal_delta_abs: float
    vertical_rectangular_residual_abs: float
    target_rect_abs: float
    central_ref_abs: float


def parse_sigmas(text: str) -> list[float]:
    vals = [float(part.strip()) for part in text.split(",") if part.strip()]
    if not vals:
        raise ValueError("--sigmas must contain at least one value")
    return vals


def rows_from_values(sigma: float, values: dict[str, np.ndarray]) -> tuple[list[AdjustedTiltAwareRow], dict[str, np.ndarray]]:
    q = values["q"]
    prefix = 1.0 + q + q * q + q * q * q
    main_base = np.abs(q * q * prefix)
    main_seeded = values["main"]
    seed_prefix_norm_tax = values["seed_abs"] * np.abs(prefix)
    tail_without_tilt = values["tail_upper"] - values["tilt_tail_upper"]
    norm_tax_total = seed_prefix_norm_tax + values["tilt_tail_upper"]

    surplus_no_tilt = main_base - values["defect"] - tail_without_tilt
    surplus_norm_only = surplus_no_tilt - norm_tax_total
    surplus_oriented = values["surplus"]
    oriented_gain = surplus_oriented - surplus_no_tilt

    coverage_no = safe_ratio(values["defect"] + tail_without_tilt, main_base)
    coverage_norm = safe_ratio(values["defect"] + tail_without_tilt + norm_tax_total, main_base)
    coverage_oriented = values["coverage_ratio"]

    arrays = {
        "surplus_no_tilt": surplus_no_tilt,
        "surplus_tilt_norm_only": surplus_norm_only,
        "surplus_tilt_oriented": surplus_oriented,
        "oriented_gain_vs_no_tilt": oriented_gain,
        "norm_tax_total": norm_tax_total,
        "main_base": main_base,
        "seed_prefix_norm_tax": seed_prefix_norm_tax,
    }

    rows: list[AdjustedTiltAwareRow] = []
    for i, t in enumerate(values["t"]):
        rows.append(
            AdjustedTiltAwareRow(
                sigma=float(sigma),
                t=float(t),
                r=float(values["r"][i]),
                main_base=float(main_base[i]),
                main_seeded_oriented=float(main_seeded[i]),
                seed_prefix_norm_tax=float(seed_prefix_norm_tax[i]),
                defect=float(values["defect"][i]),
                tail_without_tilt=float(tail_without_tilt[i]),
                tilt_tail_upper=float(values["tilt_tail_upper"][i]),
                tail_upper=float(values["tail_upper"][i]),
                surplus_no_tilt=float(surplus_no_tilt[i]),
                surplus_tilt_norm_only=float(surplus_norm_only[i]),
                surplus_tilt_oriented=float(surplus_oriented[i]),
                oriented_gain_vs_no_tilt=float(oriented_gain[i]),
                norm_tax_total=float(norm_tax_total[i]),
                coverage_no_tilt=float(coverage_no[i]),
                coverage_norm_only=float(coverage_norm[i]),
                coverage_oriented=float(coverage_oriented[i]),
                seed_abs=float(values["seed_abs"][i]),
                horizontal_delta_abs=float(values["horizontal_delta_abs"][i]),
                vertical_rectangular_residual_abs=float(values["vertical_rectangular_residual_abs"][i]),
                target_rect_abs=float(values["target_rect_abs"][i]),
                central_ref_abs=float(values["central_ref_abs"][i]),
            )
        )

    return rows, arrays


def write_csv(path: Path, rows: list[AdjustedTiltAwareRow]) -> None:
    if not rows:
        return
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=list(asdict(rows[0]).keys()))
        writer.writeheader()
        for row in rows:
            writer.writerow(asdict(row))


def print_report(sigma: float, rows: list[AdjustedTiltAwareRow], arrays: dict[str, np.ndarray], top: int) -> None:
    n = len(rows)
    pass_no = int(np.count_nonzero(arrays["surplus_no_tilt"] > 0.0))
    pass_norm = int(np.count_nonzero(arrays["surplus_tilt_norm_only"] > 0.0))
    pass_oriented = int(np.count_nonzero(arrays["surplus_tilt_oriented"] > 0.0))
    gain_pos = int(np.count_nonzero(arrays["oriented_gain_vs_no_tilt"] > 0.0))

    worst_no = rows[int(np.argmin(arrays["surplus_no_tilt"]))]
    worst_norm = rows[int(np.argmin(arrays["surplus_tilt_norm_only"]))]
    worst_oriented = rows[int(np.argmin(arrays["surplus_tilt_oriented"]))]
    best_gain = rows[int(np.argmax(arrays["oriented_gain_vs_no_tilt"]))]
    worst_gain = rows[int(np.argmin(arrays["oriented_gain_vs_no_tilt"]))]

    print()
    print(f"sigma={sigma:.6f}")
    print("-" * 78)
    print(f"pass no/norm/oriented = {pass_no}/{pass_norm}/{pass_oriented} of {n}; gain_pos={gain_pos}/{n}")
    print(f"worst no_tilt      {fmt(worst_no.surplus_no_tilt)} at t={worst_no.t:.6f}")
    print(f"worst norm_only    {fmt(worst_norm.surplus_tilt_norm_only)} at t={worst_norm.t:.6f}")
    print(f"worst oriented     {fmt(worst_oriented.surplus_tilt_oriented)} at t={worst_oriented.t:.6f}")
    print(f"best oriented_gain {fmt(best_gain.oriented_gain_vs_no_tilt)} at t={best_gain.t:.6f}")
    print(f"worst oriented_gain {fmt(worst_gain.oriented_gain_vs_no_tilt)} at t={worst_gain.t:.6f}")

    print("\nworst oriented rows:")
    for idx in np.argsort(arrays["surplus_tilt_oriented"])[: max(0, top)]:
        row = rows[int(idx)]
        print(
            f"  t={row.t:.6f} no={fmt(row.surplus_no_tilt)} "
            f"norm={fmt(row.surplus_tilt_norm_only)} oriented={fmt(row.surplus_tilt_oriented)} "
            f"gain={fmt(row.oriented_gain_vs_no_tilt)} tax={fmt(row.norm_tax_total)}"
        )


def build_parser() -> argparse.ArgumentParser:
    parser = build_base_parser()
    parser.description = "Tilt-aware finite C2 adjusted quartet diagnostic."
    parser.add_argument("--sigmas", type=str, default="", help="Comma list overriding --sigma.")
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

    print("C2 adjusted quartet tilt-aware diagnostic")
    print("=========================================")
    print("No zeta or external comparison data is used.")
    print(f"sigmas={sigmas}, t_count={t_values.size}, threads={numba.get_num_threads()}")
    print(f"K={args.K}, M={args.M}, ref_K={args.ref_K}, ref_M={args.ref_M}")
    print(
        f"reference={args.reference_mode}, target={args.target_reference_mode}, "
        f"odd_ref={args.odd_reference_mode}"
    )

    all_rows: list[AdjustedTiltAwareRow] = []
    tic_all = time.time()
    for sigma in sigmas:
        args.sigma = float(sigma)
        validate_args(args)
        tic = time.time()
        evaluator = AdjustedQuartetEvaluator(args)
        values = evaluator.evaluate(t_values)
        rows, arrays = rows_from_values(float(sigma), values)
        all_rows.extend(rows)
        print_report(float(sigma), rows, arrays, args.top)
        print(f"elapsed sigma={sigma:.6f}: {time.time() - tic:.2f}s")

    if args.csv is not None:
        write_csv(args.csv, all_rows)
        print(f"\nCSV written to: {args.csv}")
    print(f"\ntotal elapsed: {time.time() - tic_all:.2f}s")


if __name__ == "__main__":
    main()
