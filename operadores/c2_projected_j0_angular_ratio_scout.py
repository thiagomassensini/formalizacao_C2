#!/usr/bin/env python3
"""
Angular-ratio scout for the projected-j0 route.

This is a numerical diagnostic.  It reuses the finite adjusted-quartet atlas
evaluator and reports the destructive angular ratio

    max(0, -Re(D0 / M)).

The output is intended to guide future interval or geometric certificates; it
is not a proof.
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

from c2_adjusted_quartet_evaluator import float_grid, fmt, validate_args
from c2_adjusted_quartet_horizontal_defect_breakdown import parse_sigmas
from c2_projected_j0_atlas_scout import evaluate_sigma, make_box_id, safe_label


EPS = 1.0e-300


@dataclass(frozen=True)
class AngularPointRow:
    label: str
    box_id: str
    sigma: float
    t: float
    main_abs: float
    D0_abs: float
    Drest_abs: float
    RvecTail_abs: float
    rest_combined: float
    rest_separate: float
    z0_re: float
    z0_im: float
    destructive_ratio: float
    angle_D0_over_M: float
    bounded_surplus_combined: float
    angular_surplus_combined: float
    angular_surplus_separate: float
    failure_class: str


@dataclass(frozen=True)
class AngularBoxRow:
    label: str
    box_id: str
    sigma_min: float
    sigma_max: float
    t_min: float
    t_max: float
    points: int
    lambdaConst: float
    lambdaMin: float
    lambdaMean: float
    mainNormLowerConst: float
    restUpperCombinedConst: float
    restUpperSeparateConst: float
    angularBudgetCombinedConst: float
    angularBudgetSeparateConst: float
    min_pointwise_angular_surplus_combined: float
    max_pointwise_destructive_ratio: float
    min_pointwise_destructive_ratio: float
    max_abs_z0: float
    max_D0_abs: float
    pass_combined_const: bool
    pass_separate_const: bool
    recommended_mode: str


def default_output_paths(label: str) -> tuple[Path, Path, Path]:
    stem = safe_label(label)
    out_dir = Path("audit_outputs")
    return (
        out_dir / f"c2_projected_j0_angular_ratio_scout_{stem}_points.csv",
        out_dir / f"c2_projected_j0_angular_ratio_scout_{stem}_boxes.csv",
        out_dir / f"c2_projected_j0_angular_ratio_scout_{stem}.json",
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


def classify_point(main_abs: float, destructive_ratio: float, rest_combined: float) -> str:
    if main_abs <= EPS:
        return "fail_main_zero"
    if destructive_ratio >= 1.0:
        return "lambda_ge_one"
    if (1.0 - destructive_ratio) * main_abs - rest_combined > 0.0:
        return "pass_angular_pointwise"
    if destructive_ratio >= 0.75:
        return "lambda_large"
    if rest_combined >= (1.0 - destructive_ratio) * main_abs:
        return "rest_dominates"
    return "mixed"


def classify_box(row: AngularBoxRow) -> str:
    if row.pass_combined_const:
        return "combined"
    if row.pass_separate_const:
        return "separate"
    if row.mainNormLowerConst <= EPS:
        return "fail_main_small"
    if row.lambdaConst >= 1.0:
        return "fail_lambda_ge_one"
    if row.lambdaConst >= 0.75:
        return "fail_lambda_large"
    return "fail_rest_or_width"


def rows_for_sigma(
    args: argparse.Namespace,
    sigma: float,
    t_values: np.ndarray,
    sigma_base: float,
    t_base: float,
) -> list[AngularPointRow]:
    values = evaluate_sigma(args, sigma, t_values)
    rows: list[AngularPointRow] = []
    main_complex = values["main_complex"]
    d0_complex = values["d0_complex"]
    main_abs = values["main_abs"]

    z0 = np.full(t_values.shape, np.nan + 1j * np.nan, dtype=np.complex128)
    mask = main_abs > 0.0
    z0[mask] = d0_complex[mask] / main_complex[mask]
    destructive_ratio = np.full(t_values.shape, math.inf, dtype=np.float64)
    destructive_ratio[mask] = np.maximum(0.0, -z0.real[mask])
    angle = np.full(t_values.shape, math.nan, dtype=np.float64)
    angle[mask] = np.angle(z0[mask], deg=True)

    rest_combined = values["rest_combined"]
    rest_separate = values["rest_separate"]
    angular_surplus_combined = (1.0 - destructive_ratio) * main_abs - rest_combined
    angular_surplus_separate = (1.0 - destructive_ratio) * main_abs - rest_separate

    for i, t in enumerate(t_values):
        box_id = make_box_id(
            float(sigma),
            float(t),
            sigma_base=sigma_base,
            t_base=t_base,
            box_sigma_width=float(args.box_sigma_width),
            box_t_width=float(args.box_t_width),
        )
        row_main_abs = float(main_abs[i])
        row_ratio = float(destructive_ratio[i])
        row_rest = float(rest_combined[i])
        rows.append(
            AngularPointRow(
                label=args.label,
                box_id=box_id,
                sigma=float(sigma),
                t=float(t),
                main_abs=row_main_abs,
                D0_abs=float(values["D0_abs"][i]),
                Drest_abs=float(values["Drest_abs"][i]),
                RvecTail_abs=float(values["RvecTail_abs"][i]),
                rest_combined=row_rest,
                rest_separate=float(rest_separate[i]),
                z0_re=float(z0.real[i]),
                z0_im=float(z0.imag[i]),
                destructive_ratio=row_ratio,
                angle_D0_over_M=float(angle[i]),
                bounded_surplus_combined=float(values["bounded_surplus_combined"][i]),
                angular_surplus_combined=float(angular_surplus_combined[i]),
                angular_surplus_separate=float(angular_surplus_separate[i]),
                failure_class=classify_point(row_main_abs, row_ratio, row_rest),
            )
        )
    return rows


def finite_values(values: list[float]) -> list[float]:
    return [value for value in values if math.isfinite(value)]


def summarize_boxes(rows: list[AngularPointRow]) -> list[AngularBoxRow]:
    grouped: dict[str, list[AngularPointRow]] = defaultdict(list)
    for row in rows:
        grouped[row.box_id].append(row)

    box_rows: list[AngularBoxRow] = []
    for box_id, points in sorted(grouped.items(), key=lambda kv: kv[0]):
        ratios = finite_values([row.destructive_ratio for row in points])
        abs_z0 = finite_values([math.hypot(row.z0_re, row.z0_im) for row in points])
        lambda_const = max(ratios) if ratios else math.inf
        lambda_min = min(ratios) if ratios else math.inf
        lambda_mean = sum(ratios) / len(ratios) if ratios else math.inf
        main_lower = min(row.main_abs for row in points)
        rest_combined = max(row.rest_combined for row in points)
        rest_separate = max(row.rest_separate for row in points)
        budget_combined = (1.0 - lambda_const) * main_lower - rest_combined
        budget_separate = (1.0 - lambda_const) * main_lower - rest_separate
        draft = AngularBoxRow(
            label=points[0].label,
            box_id=box_id,
            sigma_min=min(row.sigma for row in points),
            sigma_max=max(row.sigma for row in points),
            t_min=min(row.t for row in points),
            t_max=max(row.t for row in points),
            points=len(points),
            lambdaConst=lambda_const,
            lambdaMin=lambda_min,
            lambdaMean=lambda_mean,
            mainNormLowerConst=main_lower,
            restUpperCombinedConst=rest_combined,
            restUpperSeparateConst=rest_separate,
            angularBudgetCombinedConst=budget_combined,
            angularBudgetSeparateConst=budget_separate,
            min_pointwise_angular_surplus_combined=min(
                row.angular_surplus_combined for row in points
            ),
            max_pointwise_destructive_ratio=lambda_const,
            min_pointwise_destructive_ratio=lambda_min,
            max_abs_z0=max(abs_z0) if abs_z0 else math.inf,
            max_D0_abs=max(row.D0_abs for row in points),
            pass_combined_const=budget_combined > 0.0,
            pass_separate_const=budget_separate > 0.0,
            recommended_mode="",
        )
        box_rows.append(
            AngularBoxRow(
                **{**asdict(draft), "recommended_mode": classify_box(draft)}
            )
        )
    return box_rows


def write_csv(path: Path, rows: list[Any]) -> None:
    if not rows:
        return
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="", encoding="utf-8") as f:
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
    point_rows: list[AngularPointRow],
    box_rows: list[AngularBoxRow],
    elapsed: float,
    point_csv: Path,
    box_csv: Path,
) -> dict[str, Any]:
    ratios = finite_values([row.destructive_ratio for row in point_rows])
    angular_budgets = [row.angularBudgetCombinedConst for row in box_rows]
    summary = {
        "label": args.label,
        "elapsed_seconds": elapsed,
        "point_csv": str(point_csv),
        "box_csv": str(box_csv),
        "json": str(path),
        "points": len(point_rows),
        "boxes": len(box_rows),
        "lambda_point_min": min(ratios) if ratios else math.inf,
        "lambda_point_max": max(ratios) if ratios else math.inf,
        "lambda_point_mean": sum(ratios) / len(ratios) if ratios else math.inf,
        "lambda_box_max": max((row.lambdaConst for row in box_rows), default=math.inf),
        "lambda_box_min": min((row.lambdaConst for row in box_rows), default=math.inf),
        "pass_combined_const": sum(1 for row in box_rows if row.pass_combined_const),
        "pass_separate_const": sum(1 for row in box_rows if row.pass_separate_const),
        "recommended_mode_counts": dict(Counter(row.recommended_mode for row in box_rows)),
        "point_class_counts": dict(Counter(row.failure_class for row in point_rows)),
        "min_angular_budget_combined": min(angular_budgets, default=math.nan),
        "max_angular_budget_combined": max(angular_budgets, default=math.nan),
        "worst_angular_boxes": [
            asdict(row)
            for row in sorted(box_rows, key=lambda row: row.angularBudgetCombinedConst)[
                : max(0, args.top)
            ]
        ],
        "args": {key: to_jsonable(value) for key, value in vars(args).items()},
    }
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", encoding="utf-8") as f:
        json.dump(summary, f, indent=2, sort_keys=True, default=to_jsonable)
        f.write("\n")
    return summary


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description="Projected-j0 angular ratio scout.")
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
        default="supergaussian",
    )
    parser.add_argument("--target-reference-X", type=float, default=10661.0)
    parser.add_argument("--target-reference-p", type=int, default=2)
    parser.add_argument(
        "--odd-reference-mode",
        choices=["raw", "exponential", "supergaussian"],
        default="supergaussian",
    )
    parser.add_argument("--odd-ref-M", type=int, default=16001)
    parser.add_argument("--odd-reference-X", type=float, default=10661.0)
    parser.add_argument("--odd-reference-p", type=int, default=2)
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

    point_default, box_default, json_default = default_output_paths(args.label)
    if args.csv is None:
        args.csv = point_default
    if args.box_csv is None:
        args.box_csv = box_default
    if args.json is None:
        args.json = json_default

    sigmas = parse_sigma_values(args)
    t_values = float_grid(args.t_min, args.t_max, args.dt)
    sigma_base = min(sigmas)
    t_base = float(args.t_min)

    print("C2 projected-j0 angular ratio scout")
    print("===================================")
    print(f"label={args.label}")
    print(f"sigmas={sigmas}; t=[{args.t_min}, {args.t_max}] dt={args.dt}")
    print(
        f"box_sigma_width={args.box_sigma_width}; box_t_width={args.box_t_width}; "
        f"threads={numba.get_num_threads()}"
    )

    tic = time.time()
    point_rows: list[AngularPointRow] = []
    for sigma in sigmas:
        local_args = argparse.Namespace(**vars(args))
        local_args.sigma = float(sigma)
        validate_args(local_args)
        sigma_tic = time.time()
        rows = rows_for_sigma(args, sigma, t_values, sigma_base, t_base)
        point_rows.extend(rows)
        ratios = finite_values([row.destructive_ratio for row in rows])
        print(
            f"  sigma={sigma:.6f}: rows={len(rows)} "
            f"lambda=[{fmt(min(ratios))},{fmt(max(ratios))}] "
            f"min_angular_surplus={fmt(min(row.angular_surplus_combined for row in rows))} "
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
        f"lambda point min/max/mean="
        f"{fmt(summary['lambda_point_min'])}/"
        f"{fmt(summary['lambda_point_max'])}/"
        f"{fmt(summary['lambda_point_mean'])}"
    )
    print(
        f"pass_combined_const={summary['pass_combined_const']} "
        f"pass_separate_const={summary['pass_separate_const']}"
    )
    print(f"recommended_mode_counts={summary['recommended_mode_counts']}")
    print(f"points CSV: {args.csv}")
    print(f"boxes CSV: {args.box_csv}")
    print(f"JSON: {args.json}")

    if args.top > 0 and box_rows:
        print("\nWorst boxes by angular combined budget:")
        for row in sorted(box_rows, key=lambda r: r.angularBudgetCombinedConst)[: args.top]:
            print(
                f"  {row.box_id} sigma=[{row.sigma_min:.6f},{row.sigma_max:.6f}] "
                f"t=[{row.t_min:.6f},{row.t_max:.6f}] "
                f"budget={fmt(row.angularBudgetCombinedConst)} "
                f"lambda={fmt(row.lambdaConst)} "
                f"main={fmt(row.mainNormLowerConst)} "
                f"rest={fmt(row.restUpperCombinedConst)} "
                f"mode={row.recommended_mode}"
            )


if __name__ == "__main__":
    main()
