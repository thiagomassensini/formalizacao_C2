#!/usr/bin/env python3
"""
Phase/projection breakdown for the finite C2 adjusted quartet horizontal defect.

This diagnostic reuses the same finite objects as
`c2_adjusted_quartet_evaluator.py`, but keeps the four horizontal defect layers
as complex vectors and compares norm-only payment with projected/phase-aware
payments.

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


EPS = 1.0e-300


@dataclass(frozen=True)
class HorizontalDefectBreakdownRow:
    sigma: float
    t: float
    q_abs: float
    main_base_complex_re: float
    main_base_complex_im: float
    main_seeded_complex_re: float
    main_seeded_complex_im: float
    main_seeded_oriented: float
    seed_complex_re: float
    seed_complex_im: float
    oriented_gain: float
    seed_parallel_to_main: float
    seed_perp_to_main: float
    angle_seed_vs_main: float
    horizontal_defect_total_abs: float
    horizontal_defect_complex_re: float
    horizontal_defect_complex_im: float
    horizontal_defect_complex_abs: float
    horizontal_defect_parallel_to_main: float
    horizontal_defect_perp_to_main: float
    horizontal_defect_parallel_to_seeded_main: float
    horizontal_defect_perp_to_seeded_main: float
    angle_defect_vs_main: float
    angle_defect_vs_seeded_main: float
    defect_j0_abs: float
    defect_j1_abs: float
    defect_j2_abs: float
    defect_j3_abs: float
    defect_j0_parallel: float
    defect_j1_parallel: float
    defect_j2_parallel: float
    defect_j3_parallel: float
    defect_j0_perp: float
    defect_j1_perp: float
    defect_j2_perp: float
    defect_j3_perp: float
    dominant_defect_layer: str
    phase_aware_defect_cost: float
    norm_over_projected_ratio: float
    current_minus_projected_gain: float
    seed_prefix_norm_tax: float
    tilt_tail_upper: float
    vertical_tail: float
    horizontal_tail: float
    cutoff_budget: float
    tail_without_tilt: float
    surplus_current_oriented: float
    surplus_projected_parallel: float
    surplus_projected_phase_aware: float
    failure_class_refined: str


def parse_sigmas(text: str) -> list[float]:
    vals = [float(part.strip()) for part in text.split(",") if part.strip()]
    if not vals:
        raise ValueError("--sigmas must contain at least one value")
    return vals


def unit(z: np.ndarray) -> np.ndarray:
    abs_z = np.abs(z)
    out = np.zeros(z.size, dtype=np.complex128)
    mask = abs_z > EPS
    out[mask] = z[mask] / abs_z[mask]
    return out


def destructive_parallel_and_perp(
    vector: np.ndarray, reference: np.ndarray
) -> tuple[np.ndarray, np.ndarray, np.ndarray]:
    ref_unit = unit(reference)
    rotated = vector * np.conj(ref_unit)
    signed_parallel = rotated.real
    destructive_parallel = np.maximum(0.0, -signed_parallel)
    perp = np.abs(rotated.imag)
    return destructive_parallel, perp, signed_parallel


def angle_degrees(vector: np.ndarray, reference: np.ndarray) -> np.ndarray:
    vector_abs = np.abs(vector)
    reference_abs = np.abs(reference)
    denom = vector_abs * reference_abs
    out = np.full(vector.size, np.nan, dtype=np.float64)
    mask = denom > EPS
    cosang = np.empty(vector.size, dtype=np.float64)
    cosang[mask] = (vector[mask] * np.conj(reference[mask])).real / denom[mask]
    cosang[mask] = np.clip(cosang[mask], -1.0, 1.0)
    out[mask] = np.degrees(np.arccos(cosang[mask]))
    return out


def safe_ratio_scalar(num: float, den: float) -> float:
    if den <= 0.0:
        return math.inf
    return num / den


def classify_refined(
    *,
    surplus_current_oriented: float,
    surplus_projected_parallel: float,
    surplus_projected_phase_aware: float,
    oriented_gain: float,
    total_abs: float,
    destructive_parallel: float,
    phase_aware_cost: float,
    tail_without_tilt: float,
    tilt_tail_upper: float,
) -> str:
    if surplus_current_oriented > 0.0:
        return "pass_current"
    if oriented_gain < 0.0:
        return "seed_phase_hurts"
    if surplus_projected_phase_aware > 0.0:
        return "phase_aware_would_pass"
    if surplus_projected_parallel > 0.0:
        return "parallel_projection_would_pass"
    if total_abs > 0.0 and destructive_parallel <= 0.35 * total_abs:
        return "norm_gross_overpay"
    if total_abs > 0.0 and phase_aware_cost <= 0.35 * total_abs:
        return "phase_cancellation_available"
    if total_abs > 0.0 and destructive_parallel >= 0.75 * total_abs:
        return "real_destructive_defect"
    if tilt_tail_upper > tail_without_tilt:
        return "tilt_tail_still_dominates"
    return "mixed_phase_failure"


def evaluate_breakdown(
    args: argparse.Namespace, t_values: np.ndarray
) -> list[HorizontalDefectBreakdownRow]:
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
    horizontal_defect_seed_complex = 2.0 * (q * q) / (1.0 - q) * horizontal_delta
    seed = (-vertical_rectangular_residual - horizontal_defect_seed_complex) * (1.0 - q)

    main_base_complex = q * q * prefix
    main_seeded_complex = (q * q + seed) * prefix
    main_base_abs = np.abs(main_base_complex)
    main_seeded_oriented = np.abs(main_seeded_complex)
    oriented_gain = main_seeded_oriented - main_base_abs

    defect_layers = [2.0 * (q ** (j + 2)) * horizontal_delta for j in range(4)]
    defect_layer_abs = [np.abs(layer) for layer in defect_layers]
    horizontal_defect_total_abs = sum(defect_layer_abs)
    horizontal_defect_complex = sum(defect_layers)
    horizontal_defect_complex_abs = np.abs(horizontal_defect_complex)

    defect_parallel_main, defect_perp_main, _ = destructive_parallel_and_perp(
        horizontal_defect_complex, main_base_complex
    )
    defect_parallel_seeded, defect_perp_seeded, _ = destructive_parallel_and_perp(
        horizontal_defect_complex, main_seeded_complex
    )
    angle_defect_main = angle_degrees(horizontal_defect_complex, main_base_complex)
    angle_defect_seeded = angle_degrees(horizontal_defect_complex, main_seeded_complex)

    seed_parallel, seed_perp, _ = destructive_parallel_and_perp(seed * prefix, main_base_complex)
    angle_seed_main = angle_degrees(seed * prefix, main_base_complex)

    layer_parallel_seeded = []
    layer_perp_seeded = []
    for layer in defect_layers:
        par, perp, _ = destructive_parallel_and_perp(layer, main_seeded_complex)
        layer_parallel_seeded.append(par)
        layer_perp_seeded.append(perp)

    vertical_tail = (r**6) / (1.0 - r)
    seed_abs = np.abs(seed)
    seed_prefix_norm_tax = seed_abs * prefix_abs
    tilt_tail_upper = seed_abs * (r**4) / (1.0 - r)
    horizontal_tail = 2.0 * np.abs(horizontal_delta) * (r**6) / (1.0 - r)
    cutoff_budget = np.abs(target_rect - central_ref)
    tail_without_tilt = vertical_tail + horizontal_tail + cutoff_budget

    phase_aware_defect_cost = np.maximum(
        0.0, main_seeded_oriented - np.abs(main_seeded_complex + horizontal_defect_complex)
    )

    surplus_current_oriented = (
        main_seeded_oriented - horizontal_defect_total_abs - tail_without_tilt - tilt_tail_upper
    )
    surplus_projected_parallel = (
        main_seeded_oriented - defect_parallel_seeded - tail_without_tilt - tilt_tail_upper
    )
    surplus_projected_phase_aware = (
        main_seeded_oriented - phase_aware_defect_cost - tail_without_tilt - tilt_tail_upper
    )

    rows: list[HorizontalDefectBreakdownRow] = []
    for i, t in enumerate(t_values):
        layer_abs_values = [float(defect_layer_abs[j][i]) for j in range(4)]
        dominant_idx = max(range(4), key=lambda j: layer_abs_values[j])
        failure_class = classify_refined(
            surplus_current_oriented=float(surplus_current_oriented[i]),
            surplus_projected_parallel=float(surplus_projected_parallel[i]),
            surplus_projected_phase_aware=float(surplus_projected_phase_aware[i]),
            oriented_gain=float(oriented_gain[i]),
            total_abs=float(horizontal_defect_total_abs[i]),
            destructive_parallel=float(defect_parallel_seeded[i]),
            phase_aware_cost=float(phase_aware_defect_cost[i]),
            tail_without_tilt=float(tail_without_tilt[i]),
            tilt_tail_upper=float(tilt_tail_upper[i]),
        )
        rows.append(
            HorizontalDefectBreakdownRow(
                sigma=sigma,
                t=float(t),
                q_abs=float(r[i]),
                main_base_complex_re=float(main_base_complex[i].real),
                main_base_complex_im=float(main_base_complex[i].imag),
                main_seeded_complex_re=float(main_seeded_complex[i].real),
                main_seeded_complex_im=float(main_seeded_complex[i].imag),
                main_seeded_oriented=float(main_seeded_oriented[i]),
                seed_complex_re=float(seed[i].real),
                seed_complex_im=float(seed[i].imag),
                oriented_gain=float(oriented_gain[i]),
                seed_parallel_to_main=float(seed_parallel[i]),
                seed_perp_to_main=float(seed_perp[i]),
                angle_seed_vs_main=float(angle_seed_main[i]),
                horizontal_defect_total_abs=float(horizontal_defect_total_abs[i]),
                horizontal_defect_complex_re=float(horizontal_defect_complex[i].real),
                horizontal_defect_complex_im=float(horizontal_defect_complex[i].imag),
                horizontal_defect_complex_abs=float(horizontal_defect_complex_abs[i]),
                horizontal_defect_parallel_to_main=float(defect_parallel_main[i]),
                horizontal_defect_perp_to_main=float(defect_perp_main[i]),
                horizontal_defect_parallel_to_seeded_main=float(defect_parallel_seeded[i]),
                horizontal_defect_perp_to_seeded_main=float(defect_perp_seeded[i]),
                angle_defect_vs_main=float(angle_defect_main[i]),
                angle_defect_vs_seeded_main=float(angle_defect_seeded[i]),
                defect_j0_abs=float(defect_layer_abs[0][i]),
                defect_j1_abs=float(defect_layer_abs[1][i]),
                defect_j2_abs=float(defect_layer_abs[2][i]),
                defect_j3_abs=float(defect_layer_abs[3][i]),
                defect_j0_parallel=float(layer_parallel_seeded[0][i]),
                defect_j1_parallel=float(layer_parallel_seeded[1][i]),
                defect_j2_parallel=float(layer_parallel_seeded[2][i]),
                defect_j3_parallel=float(layer_parallel_seeded[3][i]),
                defect_j0_perp=float(layer_perp_seeded[0][i]),
                defect_j1_perp=float(layer_perp_seeded[1][i]),
                defect_j2_perp=float(layer_perp_seeded[2][i]),
                defect_j3_perp=float(layer_perp_seeded[3][i]),
                dominant_defect_layer=f"j{dominant_idx}",
                phase_aware_defect_cost=float(phase_aware_defect_cost[i]),
                norm_over_projected_ratio=safe_ratio_scalar(
                    float(horizontal_defect_total_abs[i]), float(defect_parallel_seeded[i])
                ),
                current_minus_projected_gain=float(
                    surplus_projected_parallel[i] - surplus_current_oriented[i]
                ),
                seed_prefix_norm_tax=float(seed_prefix_norm_tax[i]),
                tilt_tail_upper=float(tilt_tail_upper[i]),
                vertical_tail=float(vertical_tail[i]),
                horizontal_tail=float(horizontal_tail[i]),
                cutoff_budget=float(cutoff_budget[i]),
                tail_without_tilt=float(tail_without_tilt[i]),
                surplus_current_oriented=float(surplus_current_oriented[i]),
                surplus_projected_parallel=float(surplus_projected_parallel[i]),
                surplus_projected_phase_aware=float(surplus_projected_phase_aware[i]),
                failure_class_refined=failure_class,
            )
        )
    return rows


def write_csv(path: Path, rows: list[HorizontalDefectBreakdownRow]) -> None:
    if not rows:
        return
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=list(asdict(rows[0]).keys()))
        writer.writeheader()
        for row in rows:
            writer.writerow(asdict(row))


def print_summary(label: str, rows: list[HorizontalDefectBreakdownRow], top: int) -> None:
    counts = Counter(row.failure_class_refined for row in rows)
    layers = Counter(row.dominant_defect_layer for row in rows)
    worst_current = min(rows, key=lambda row: row.surplus_current_oriented)
    worst_projected = min(rows, key=lambda row: row.surplus_projected_parallel)
    best_projection_gain = max(rows, key=lambda row: row.current_minus_projected_gain)
    phase_pass = sum(1 for row in rows if row.surplus_projected_phase_aware > 0.0)
    projected_pass = sum(1 for row in rows if row.surplus_projected_parallel > 0.0)

    print()
    print(label)
    print("-" * len(label))
    print(f"rows={len(rows)} classes={dict(counts)} layers={dict(layers)}")
    print(
        f"pass current/projected/phase-aware = "
        f"{sum(1 for row in rows if row.surplus_current_oriented > 0.0)}/"
        f"{projected_pass}/{phase_pass}"
    )
    print(
        f"worst current: sigma={worst_current.sigma:.6f} t={worst_current.t:.6f} "
        f"surplus={fmt(worst_current.surplus_current_oriented)} "
        f"proj={fmt(worst_current.surplus_projected_parallel)} "
        f"phase={fmt(worst_current.surplus_projected_phase_aware)} "
        f"class={worst_current.failure_class_refined}"
    )
    print(
        f"worst projected: sigma={worst_projected.sigma:.6f} t={worst_projected.t:.6f} "
        f"projected={fmt(worst_projected.surplus_projected_parallel)} "
        f"parallel={fmt(worst_projected.horizontal_defect_parallel_to_seeded_main)} "
        f"total_abs={fmt(worst_projected.horizontal_defect_total_abs)}"
    )
    print(
        f"best projection gain: sigma={best_projection_gain.sigma:.6f} "
        f"t={best_projection_gain.t:.6f} "
        f"gain={fmt(best_projection_gain.current_minus_projected_gain)} "
        f"angle={best_projection_gain.angle_defect_vs_seeded_main:.2f}"
    )

    failing_current = [row for row in rows if row.surplus_current_oriented <= 0.0]
    if failing_current:
        print("\ntop current failures:")
        for row in sorted(failing_current, key=lambda r: r.surplus_current_oriented)[:top]:
            print(
                f"  sigma={row.sigma:.6f} t={row.t:.6f} "
                f"current={fmt(row.surplus_current_oriented)} "
                f"projected={fmt(row.surplus_projected_parallel)} "
                f"phase={fmt(row.surplus_projected_phase_aware)} "
                f"abs={fmt(row.horizontal_defect_total_abs)} "
                f"par={fmt(row.horizontal_defect_parallel_to_seeded_main)} "
                f"angle={row.angle_defect_vs_seeded_main:.2f} "
                f"layer={row.dominant_defect_layer} class={row.failure_class_refined}"
            )

    seed_hurts = [row for row in rows if row.oriented_gain < 0.0]
    if seed_hurts:
        print("\ntop seed phase hurts:")
        for row in sorted(seed_hurts, key=lambda r: r.oriented_gain)[:top]:
            print(
                f"  sigma={row.sigma:.6f} t={row.t:.6f} "
                f"gain={fmt(row.oriented_gain)} "
                f"seed_angle={row.angle_seed_vs_main:.2f} "
                f"seed_par={fmt(row.seed_parallel_to_main)} "
                f"seed_perp={fmt(row.seed_perp_to_main)}"
            )


def build_parser() -> argparse.ArgumentParser:
    parser = build_base_parser()
    parser.description = "Horizontal defect phase/projection breakdown for finite C2 adjusted quartet."
    parser.add_argument("--sigmas", type=str, default="", help="Comma list overriding --sigma.")
    parser.add_argument("--label", type=str, default="adjusted_quartet_horizontal_defect_breakdown")
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

    print("C2 adjusted quartet horizontal defect breakdown")
    print("================================================")
    print("No zeta or external comparison data is used.")
    print(f"label={args.label}")
    print(f"sigmas={sigmas}; t_count={t_values.size}; threads={numba.get_num_threads()}")
    print(f"K={args.K}, M={args.M}, ref_K={args.ref_K}, ref_M={args.ref_M}")
    print(
        f"reference={args.reference_mode}, target={args.target_reference_mode}, "
        f"odd_ref={args.odd_reference_mode}"
    )
    print("projection formula:")
    print("  destructive_parallel(D,M) = max(0, -Re(D * conj(M/|M|)))")
    print("phase-aware formula:")
    print("  main_seeded_oriented - max(0, |M|-|M+D|) - tails")

    all_rows: list[HorizontalDefectBreakdownRow] = []
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
