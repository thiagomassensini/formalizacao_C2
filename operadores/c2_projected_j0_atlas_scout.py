#!/usr/bin/env python3
"""
Projected-j0 atlas scout for the finite C2 adjusted quartet.

This is a numerical scout for constant box candidates.  It reuses the existing
finite evaluator and horizontal-defect phase helpers, then groups sampled
points into rectangular boxes and reports the constants that a later certified
atlas would need to justify.
"""

from __future__ import annotations

import argparse
import csv
import json
import math
import time
from collections import Counter, defaultdict
from dataclasses import asdict, dataclass
from pathlib import Path
from typing import Any

import numpy as np
import numba

from c2_adjusted_quartet_evaluator import (
    AdjustedQuartetEvaluator,
    finite_sum,
    float_grid,
    fmt,
    q_values,
    validate_args,
    vertical_quartet_prefix,
)
from c2_adjusted_quartet_horizontal_defect_breakdown import angle_degrees, parse_sigmas


EPS = 1.0e-300


@dataclass(frozen=True)
class AtlasPointRow:
    label: str
    box_id: str
    sigma: float
    t: float
    main_abs: float
    d0_neg_re_main: float
    d0_destructive_numerator: float
    parallel_exact: float
    D0_abs: float
    Drest_abs: float
    RvecTail_abs: float
    rest_combined: float
    rest_separate: float
    bounded_surplus_combined: float
    bounded_surplus_separate: float
    angle_D0_vs_M: float
    angle_Drest_vs_M: float
    failure_class: str


@dataclass(frozen=True)
class AtlasBoxRow:
    label: str
    box_id: str
    sigma_min: float
    sigma_max: float
    t_min: float
    t_max: float
    points: int
    mainNormLowerConst: float
    numeratorUpperConst: float
    parallelUpperConst: float
    restUpperCombinedConst: float
    restUpperSeparateConst: float
    budgetCombinedConst: float
    budgetSeparateConst: float
    min_pointwise_surplus_combined: float
    min_pointwise_surplus_separate: float
    max_D0_abs: float
    max_parallel_exact: float
    max_angle_D0_vs_M: float
    pass_combined_const: bool
    pass_separate_const: bool
    recommended_mode: str


def safe_label(text: str) -> str:
    return "".join(ch if ch.isalnum() or ch in ("-", "_", ".") else "_" for ch in text)


def default_output_paths(label: str) -> tuple[Path, Path, Path]:
    stem = safe_label(label)
    out_dir = Path("audit_outputs")
    return (
        out_dir / f"c2_projected_j0_atlas_scout_{stem}_points.csv",
        out_dir / f"c2_projected_j0_atlas_scout_{stem}_boxes.csv",
        out_dir / f"c2_projected_j0_atlas_scout_{stem}.json",
    )


def parse_sigma_values(args: argparse.Namespace) -> list[float]:
    if args.sigmas:
        return parse_sigmas(args.sigmas)
    if args.sigma_min is None and args.sigma_max is None:
        return [0.5]
    if args.sigma_min is None or args.sigma_max is None:
        raise SystemExit("--sigma-min and --sigma-max must be provided together")
    if args.sigma_step is None:
        if args.sigma_min != args.sigma_max:
            raise SystemExit("--sigma-step is required when sigma-min != sigma-max")
        return [float(args.sigma_min)]
    return [float(x) for x in float_grid(args.sigma_min, args.sigma_max, args.sigma_step)]


def scalar_ratio(num: float, den: float) -> float:
    if den <= 0.0:
        return math.inf
    return num / den


def classify_point(
    *,
    main_abs: float,
    parallel_exact: float,
    rest_combined: float,
    rest_separate: float,
    surplus_combined: float,
    surplus_separate: float,
) -> str:
    if surplus_combined > 0.0:
        return "pass_combined_pointwise"
    if surplus_separate > 0.0:
        return "pass_separate_pointwise"
    if main_abs <= EPS or main_abs <= 0.25 * (parallel_exact + rest_combined):
        return "main_small"
    if parallel_exact >= rest_combined:
        return "parallel_dominates"
    if rest_separate > rest_combined and rest_separate >= parallel_exact:
        return "rest_separate_dominates"
    return "rest_dominates"


def recommended_mode_for_box(
    *,
    main_lower: float,
    parallel_upper: float,
    rest_combined: float,
    rest_separate: float,
    pass_combined: bool,
    pass_separate: bool,
    max_surplus_combined: float,
    max_surplus_separate: float,
) -> str:
    if pass_combined:
        return "combined"
    if pass_separate:
        return "separate"
    if max_surplus_combined > 0.0 or max_surplus_separate > 0.0:
        return "split_needed"
    if main_lower <= EPS or main_lower <= 0.25 * (parallel_upper + rest_combined):
        return "fail_main_small"
    if parallel_upper >= rest_combined and parallel_upper >= rest_separate:
        return "fail_parallel"
    return "fail_rest"


def max_non_nan(values: list[float]) -> float:
    finite = [value for value in values if not math.isnan(value)]
    if not finite:
        return math.nan
    return max(finite)


def make_box_id(
    sigma: float,
    t: float,
    *,
    sigma_base: float,
    t_base: float,
    box_sigma_width: float,
    box_t_width: float,
) -> str:
    if box_t_width <= 0.0:
        raise SystemExit("--box-t-width must be positive")
    if box_sigma_width > 0.0:
        sigma_idx = math.floor((sigma - sigma_base) / box_sigma_width + 1.0e-10)
    else:
        sigma_idx = round(sigma, 12)
    t_idx = math.floor((t - t_base) / box_t_width + 1.0e-10)
    return f"s{sigma_idx}_t{t_idx}"


def evaluate_sigma(args: argparse.Namespace, sigma: float, t_values: np.ndarray) -> dict[str, np.ndarray]:
    local_args = argparse.Namespace(**vars(args))
    local_args.sigma = float(sigma)
    validate_args(local_args)

    evaluator = AdjustedQuartetEvaluator(local_args)
    q = q_values(t_values, sigma)

    odd_core = finite_sum(t_values, evaluator.core_logs, evaluator.core_weights)
    odd_ref = finite_sum(t_values, evaluator.odd_ref_logs, evaluator.odd_ref_weights)
    horizontal_delta = odd_core - odd_ref

    target_rect = finite_sum(t_values, evaluator.target_logs, evaluator.target_weights)
    central_ref = finite_sum(t_values, evaluator.central_ref_logs, evaluator.central_ref_weights)

    vertical_depth_tail_from_two = (q * q) / (1.0 - q)
    vertical_rectangular_residual = vertical_depth_tail_from_two + target_rect - 2.0 * central_ref
    horizontal_defect_seed = 2.0 * (q * q) / (1.0 - q) * horizontal_delta
    seed = (-vertical_rectangular_residual - horizontal_defect_seed) * (1.0 - q)

    prefix = vertical_quartet_prefix(q)
    main_complex = (q * q + seed) * prefix
    defect_layers = [2.0 * (q ** (j + 2)) * horizontal_delta for j in range(4)]
    drest_complex = defect_layers[1] + defect_layers[2] + defect_layers[3]

    vertical_tail_complex = (q**6) / (1.0 - q)
    tilt_tail_complex = seed * (q**4) / (1.0 - q)
    horizontal_tail_complex = 2.0 * (q**6) / (1.0 - q) * horizontal_delta
    cutoff_complex = target_rect - central_ref
    rvec_tail_complex = (
        vertical_tail_complex + tilt_tail_complex + horizontal_tail_complex + cutoff_complex
    )
    total_finite_complex = main_complex + sum(defect_layers) + rvec_tail_complex

    d0_complex = defect_layers[0]
    main_abs = np.abs(main_complex)
    d0_neg_re_main = -((d0_complex * np.conj(main_complex)).real)
    d0_destructive_numerator = np.maximum(0.0, d0_neg_re_main)
    parallel_exact = np.full(t_values.size, math.inf, dtype=np.float64)
    mask = main_abs > 0.0
    parallel_exact[mask] = d0_destructive_numerator[mask] / main_abs[mask]

    rest_combined = np.abs(drest_complex + rvec_tail_complex)
    rest_separate = np.abs(drest_complex) + np.abs(rvec_tail_complex)
    return {
        "t": t_values,
        "main_complex": main_complex,
        "d0_complex": d0_complex,
        "drest_complex": drest_complex,
        "rvec_tail_complex": rvec_tail_complex,
        "total_finite_complex": total_finite_complex,
        "main_abs": main_abs,
        "d0_neg_re_main": d0_neg_re_main,
        "d0_destructive_numerator": d0_destructive_numerator,
        "parallel_exact": parallel_exact,
        "D0_abs": np.abs(d0_complex),
        "Drest_abs": np.abs(drest_complex),
        "RvecTail_abs": np.abs(rvec_tail_complex),
        "rest_combined": rest_combined,
        "rest_separate": rest_separate,
        "bounded_surplus_combined": main_abs - parallel_exact - rest_combined,
        "bounded_surplus_separate": main_abs - parallel_exact - rest_separate,
        "angle_D0_vs_M": angle_degrees(d0_complex, main_complex),
        "angle_Drest_vs_M": angle_degrees(drest_complex, main_complex),
    }


def rows_for_sigma(
    args: argparse.Namespace,
    sigma: float,
    t_values: np.ndarray,
    sigma_base: float,
    t_base: float,
) -> list[AtlasPointRow]:
    values = evaluate_sigma(args, sigma, t_values)
    rows: list[AtlasPointRow] = []
    for i, t in enumerate(t_values):
        main_abs = float(values["main_abs"][i])
        parallel_exact = float(values["parallel_exact"][i])
        rest_combined = float(values["rest_combined"][i])
        rest_separate = float(values["rest_separate"][i])
        surplus_combined = float(values["bounded_surplus_combined"][i])
        surplus_separate = float(values["bounded_surplus_separate"][i])
        box_id = make_box_id(
            float(sigma),
            float(t),
            sigma_base=sigma_base,
            t_base=t_base,
            box_sigma_width=float(args.box_sigma_width),
            box_t_width=float(args.box_t_width),
        )
        rows.append(
            AtlasPointRow(
                label=args.label,
                box_id=box_id,
                sigma=float(sigma),
                t=float(t),
                main_abs=main_abs,
                d0_neg_re_main=float(values["d0_neg_re_main"][i]),
                d0_destructive_numerator=float(values["d0_destructive_numerator"][i]),
                parallel_exact=parallel_exact,
                D0_abs=float(values["D0_abs"][i]),
                Drest_abs=float(values["Drest_abs"][i]),
                RvecTail_abs=float(values["RvecTail_abs"][i]),
                rest_combined=rest_combined,
                rest_separate=rest_separate,
                bounded_surplus_combined=surplus_combined,
                bounded_surplus_separate=surplus_separate,
                angle_D0_vs_M=float(values["angle_D0_vs_M"][i]),
                angle_Drest_vs_M=float(values["angle_Drest_vs_M"][i]),
                failure_class=classify_point(
                    main_abs=main_abs,
                    parallel_exact=parallel_exact,
                    rest_combined=rest_combined,
                    rest_separate=rest_separate,
                    surplus_combined=surplus_combined,
                    surplus_separate=surplus_separate,
                ),
            )
        )
    return rows


def summarize_boxes(rows: list[AtlasPointRow]) -> list[AtlasBoxRow]:
    grouped: dict[str, list[AtlasPointRow]] = defaultdict(list)
    for row in rows:
        grouped[row.box_id].append(row)

    box_rows: list[AtlasBoxRow] = []
    for box_id, box_points in sorted(grouped.items(), key=lambda kv: kv[0]):
        main_lower = min(row.main_abs for row in box_points)
        numerator_upper = max(row.d0_destructive_numerator for row in box_points)
        parallel_upper = scalar_ratio(numerator_upper, main_lower)
        rest_combined = max(row.rest_combined for row in box_points)
        rest_separate = max(row.rest_separate for row in box_points)
        budget_combined = main_lower - parallel_upper - rest_combined
        budget_separate = main_lower - parallel_upper - rest_separate
        pass_combined = budget_combined > 0.0
        pass_separate = budget_separate > 0.0
        mode = recommended_mode_for_box(
            main_lower=main_lower,
            parallel_upper=parallel_upper,
            rest_combined=rest_combined,
            rest_separate=rest_separate,
            pass_combined=pass_combined,
            pass_separate=pass_separate,
            max_surplus_combined=max(row.bounded_surplus_combined for row in box_points),
            max_surplus_separate=max(row.bounded_surplus_separate for row in box_points),
        )
        box_rows.append(
            AtlasBoxRow(
                label=box_points[0].label,
                box_id=box_id,
                sigma_min=min(row.sigma for row in box_points),
                sigma_max=max(row.sigma for row in box_points),
                t_min=min(row.t for row in box_points),
                t_max=max(row.t for row in box_points),
                points=len(box_points),
                mainNormLowerConst=main_lower,
                numeratorUpperConst=numerator_upper,
                parallelUpperConst=parallel_upper,
                restUpperCombinedConst=rest_combined,
                restUpperSeparateConst=rest_separate,
                budgetCombinedConst=budget_combined,
                budgetSeparateConst=budget_separate,
                min_pointwise_surplus_combined=min(
                    row.bounded_surplus_combined for row in box_points
                ),
                min_pointwise_surplus_separate=min(
                    row.bounded_surplus_separate for row in box_points
                ),
                max_D0_abs=max(row.D0_abs for row in box_points),
                max_parallel_exact=max(row.parallel_exact for row in box_points),
                max_angle_D0_vs_M=max_non_nan([row.angle_D0_vs_M for row in box_points]),
                pass_combined_const=pass_combined,
                pass_separate_const=pass_separate,
                recommended_mode=mode,
            )
        )
    return box_rows


def write_csv(path: Path, rows: list[Any]) -> None:
    if not rows:
        return
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=list(asdict(rows[0]).keys()))
        writer.writeheader()
        for row in rows:
            writer.writerow(asdict(row))


def to_jsonable(value: Any) -> Any:
    if isinstance(value, Path):
        return str(value)
    if isinstance(value, float):
        if math.isnan(value):
            return "nan"
        if math.isinf(value):
            return "inf" if value > 0 else "-inf"
    return value


def write_json_summary(
    path: Path,
    args: argparse.Namespace,
    point_rows: list[AtlasPointRow],
    box_rows: list[AtlasBoxRow],
    elapsed: float,
    point_csv: Path,
    box_csv: Path,
) -> dict[str, Any]:
    rec_counts = Counter(row.recommended_mode for row in box_rows)
    point_class_counts = Counter(row.failure_class for row in point_rows)
    pass_combined = sum(1 for row in box_rows if row.pass_combined_const)
    pass_separate = sum(1 for row in box_rows if row.pass_separate_const)
    worst_combined = sorted(box_rows, key=lambda row: row.budgetCombinedConst)[: max(0, args.top)]
    worst_separate = sorted(box_rows, key=lambda row: row.budgetSeparateConst)[: max(0, args.top)]
    summary = {
        "label": args.label,
        "elapsed_seconds": elapsed,
        "point_csv": str(point_csv),
        "box_csv": str(box_csv),
        "json": str(path),
        "points": len(point_rows),
        "boxes": len(box_rows),
        "pass_combined_const": pass_combined,
        "pass_separate_const": pass_separate,
        "recommended_mode_counts": dict(rec_counts),
        "point_failure_class_counts": dict(point_class_counts),
        "min_budget_combined": min((row.budgetCombinedConst for row in box_rows), default=math.nan),
        "min_budget_separate": min((row.budgetSeparateConst for row in box_rows), default=math.nan),
        "max_budget_combined": max((row.budgetCombinedConst for row in box_rows), default=math.nan),
        "max_budget_separate": max((row.budgetSeparateConst for row in box_rows), default=math.nan),
        "worst_combined_boxes": [asdict(row) for row in worst_combined],
        "worst_separate_boxes": [asdict(row) for row in worst_separate],
        "args": {key: to_jsonable(value) for key, value in vars(args).items()},
    }
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w") as f:
        json.dump(summary, f, indent=2, sort_keys=True, default=to_jsonable)
        f.write("\n")
    return summary


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        description="Projected-j0 constant-box atlas scout for the finite adjusted quartet."
    )
    parser.add_argument("--label", type=str, required=True)
    parser.add_argument("--sigmas", type=str, default="")
    parser.add_argument("--sigma-min", type=float, default=None)
    parser.add_argument("--sigma-max", type=float, default=None)
    parser.add_argument("--sigma-step", type=float, default=None)
    parser.add_argument("--t-min", type=float, required=True)
    parser.add_argument("--t-max", type=float, required=True)
    parser.add_argument("--dt", type=float, required=True)
    parser.add_argument("--box-sigma-width", type=float, default=0.0)
    parser.add_argument("--box-t-width", type=float, required=True)
    parser.add_argument("--K", type=int, default=16)
    parser.add_argument("--M", type=int, default=12001)
    parser.add_argument("--ref-K", type=int, default=17)
    parser.add_argument("--ref-M", type=int, default=16001)
    parser.add_argument(
        "--reference-mode",
        choices=["raw", "exponential", "supergaussian"],
        default="supergaussian",
    )
    parser.add_argument("--reference-X", type=float, default=10661.0)
    parser.add_argument("--reference-p", type=int, default=2)
    parser.add_argument(
        "--target-reference-mode",
        choices=["raw", "exponential", "supergaussian"],
        default="raw",
    )
    parser.add_argument("--target-reference-X", type=float, default=None)
    parser.add_argument("--target-reference-p", type=int, default=None)
    parser.add_argument(
        "--odd-reference-mode",
        choices=["raw", "exponential", "supergaussian"],
        default="supergaussian",
    )
    parser.add_argument("--odd-ref-M", type=int, default=None)
    parser.add_argument("--odd-reference-X", type=float, default=None)
    parser.add_argument("--odd-reference-p", type=int, default=None)
    parser.add_argument("--threads", type=int, default=None)
    parser.add_argument("--csv", type=Path, default=None)
    parser.add_argument("--box-csv", type=Path, default=None)
    parser.add_argument("--json", type=Path, default=None)
    parser.add_argument("--top", type=int, default=8)
    return parser


def main() -> None:
    args = build_parser().parse_args()
    if args.threads is not None:
        if args.threads < 1:
            raise SystemExit("threads must be positive")
        numba.set_num_threads(args.threads)

    point_csv_default, box_csv_default, json_default = default_output_paths(args.label)
    if args.csv is None:
        args.csv = point_csv_default
    if args.box_csv is None:
        args.box_csv = box_csv_default
    if args.json is None:
        args.json = json_default

    sigmas = parse_sigma_values(args)
    if args.target_reference_X is None:
        args.target_reference_X = args.reference_X
    if args.target_reference_p is None:
        args.target_reference_p = args.reference_p
    if args.odd_reference_X is None:
        args.odd_reference_X = args.reference_X
    if args.odd_reference_p is None:
        args.odd_reference_p = args.reference_p

    t_values = float_grid(args.t_min, args.t_max, args.dt)
    sigma_base = min(sigmas)
    t_base = float(args.t_min)

    print("C2 projected-j0 atlas scout")
    print("===========================")
    print(f"label={args.label}")
    print(f"sigmas={sigmas}; t=[{args.t_min}, {args.t_max}] dt={args.dt}")
    print(
        f"box_sigma_width={args.box_sigma_width}; box_t_width={args.box_t_width}; "
        f"threads={numba.get_num_threads()}"
    )
    print(
        f"K={args.K}, M={args.M}, ref_K={args.ref_K}, ref_M={args.ref_M}, "
        f"odd_ref_M={args.odd_ref_M if args.odd_ref_M is not None else args.ref_M}"
    )
    print(
        f"modes: reference={args.reference_mode}, target={args.target_reference_mode}, "
        f"odd_ref={args.odd_reference_mode}"
    )

    tic = time.time()
    point_rows: list[AtlasPointRow] = []
    for sigma in sigmas:
        sigma_tic = time.time()
        rows = rows_for_sigma(args, sigma, t_values, sigma_base, t_base)
        point_rows.extend(rows)
        print(
            f"  sigma={sigma:.6f}: rows={len(rows)} "
            f"min_combined={fmt(min(row.bounded_surplus_combined for row in rows))} "
            f"elapsed={time.time() - sigma_tic:.2f}s"
        )

    box_rows = summarize_boxes(point_rows)
    write_csv(args.csv, point_rows)
    write_csv(args.box_csv, box_rows)
    elapsed = time.time() - tic
    summary = write_json_summary(
        args.json, args, point_rows, box_rows, elapsed, args.csv, args.box_csv
    )

    print("-" * 72)
    print(f"elapsed={elapsed:.2f}s points={len(point_rows)} boxes={len(box_rows)}")
    print(
        f"pass_combined_const={summary['pass_combined_const']} "
        f"pass_separate_const={summary['pass_separate_const']}"
    )
    print(f"recommended_mode_counts={summary['recommended_mode_counts']}")
    print(
        f"budget_combined min/max="
        f"{fmt(float(summary['min_budget_combined']))}/{fmt(float(summary['max_budget_combined']))}"
    )
    print(f"points CSV: {args.csv}")
    print(f"boxes CSV: {args.box_csv}")
    print(f"JSON: {args.json}")

    if args.top > 0 and box_rows:
        print("\nWorst boxes by combined constant budget:")
        for row in sorted(box_rows, key=lambda r: r.budgetCombinedConst)[: args.top]:
            print(
                f"  {row.box_id} sigma=[{row.sigma_min:.6f},{row.sigma_max:.6f}] "
                f"t=[{row.t_min:.6f},{row.t_max:.6f}] "
                f"budget={fmt(row.budgetCombinedConst)} "
                f"main={fmt(row.mainNormLowerConst)} "
                f"parallel={fmt(row.parallelUpperConst)} "
                f"rest={fmt(row.restUpperCombinedConst)} "
                f"mode={row.recommended_mode}"
            )


if __name__ == "__main__":
    main()
