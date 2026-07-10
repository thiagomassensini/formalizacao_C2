#!/usr/bin/env python3
"""
Sector certifier for projected-j0 positive boxes.

The script reads candidate boxes and checks interval enclosures for

    -Re(D0 * conj(M)) <= 0.

When this sector condition holds, the projected numerator can be set to zero
and the box budget is reduced to mainLower - restUpper.
"""

from __future__ import annotations

import argparse
import csv
import hashlib
import json
import math
import sys
import time
from collections import Counter
from dataclasses import asdict, dataclass
from pathlib import Path
from typing import Any

import numpy as np

from c2_adjusted_quartet_evaluator import validate_args
from c2_projected_j0_atlas_scout import safe_label
from c2_projected_j0_interval_box_certifier import (
    abs_bounds_rect,
    add_rect,
    build_interval_context,
    center_radius_lower,
    conj_rect,
    eval_subbox,
    lower_out,
    mul_rect,
    split_range,
    upper_out,
)


EPS = 1.0e-300


@dataclass(frozen=True)
class SectorBoxInput:
    source_box_id: str
    sigma_min: float
    sigma_max: float
    t_min: float
    t_max: float
    scout_budget_combined: float
    scout_budget_separate: float


@dataclass(frozen=True)
class SectorCertificateRow:
    label: str
    source_box_id: str
    sigma_min: float
    sigma_max: float
    t_min: float
    t_max: float
    d0_neg_re_upper: float
    d0_neg_re_lower: float
    certified_nondestructive: bool
    mainNormLowerConst: float
    restUpperCombinedConst: float
    restUpperSeparateConst: float
    sectorBudgetCombined: float
    sectorBudgetSeparate: float
    certified_sector_combined: bool
    certified_sector_separate: bool
    status: str
    mode: str
    interval_dps: int
    subdiv_sigma: int
    subdiv_t: int
    inflate: float
    main_center_abs: float
    main_radius: float
    scout_budget_combined: float
    scout_budget_separate: float
    notes: str


def parse_bool(text: str) -> bool:
    return str(text).strip().lower() in {"1", "true", "yes", "y"}


def signed_lower_out(value: float) -> float:
    if not math.isfinite(value):
        return value
    return float(np.nextafter(value, -np.inf))


def signed_upper_out(value: float) -> float:
    if not math.isfinite(value):
        return value
    return float(np.nextafter(value, np.inf))


def default_output_paths(label: str) -> tuple[Path, Path]:
    stem = safe_label(label)
    out_dir = Path("audit_outputs")
    return (
        out_dir / f"c2_projected_j0_sector_box_certifier_{stem}.csv",
        out_dir / f"c2_projected_j0_sector_box_certifier_{stem}.json",
    )


def read_boxes(path: Path, args: argparse.Namespace) -> list[SectorBoxInput]:
    box_id_set = {
        item.strip()
        for item in str(args.box_id_list).split(",")
        if item.strip()
    }
    rows: list[SectorBoxInput] = []
    with path.open(newline="") as f:
        reader = csv.DictReader(f)
        for row in reader:
            box_id = row["box_id"] if "box_id" in row else row["source_box_id"]
            if args.box_id and box_id != args.box_id:
                continue
            if box_id_set and box_id not in box_id_set:
                continue
            if args.only_pass_combined and not parse_bool(
                row.get("pass_combined_const", row.get("certified_combined", "false"))
            ):
                continue
            if args.only_pass_separate and not parse_bool(
                row.get("pass_separate_const", row.get("certified_separate", "false"))
            ):
                continue
            rows.append(
                SectorBoxInput(
                    source_box_id=box_id,
                    sigma_min=float(row["sigma_min"]),
                    sigma_max=float(row["sigma_max"]),
                    t_min=float(row["t_min"]),
                    t_max=float(row["t_max"]),
                    scout_budget_combined=float(
                        row.get("budgetCombinedConst", row.get("sectorBudgetCombined", "nan"))
                    ),
                    scout_budget_separate=float(
                        row.get("budgetSeparateConst", row.get("sectorBudgetSeparate", "nan"))
                    ),
                )
            )
    if args.max_boxes is not None:
        rows = rows[: max(0, int(args.max_boxes))]
    return rows


def classify_row(row: SectorCertificateRow) -> str:
    if row.certified_sector_combined and row.certified_sector_separate:
        return "certified_sector_combined_and_separate"
    if not row.certified_nondestructive:
        return "fail_nondestructive"
    if row.mainNormLowerConst <= EPS:
        return "fail_main_contains_zero"
    if row.sectorBudgetCombined <= 0.0:
        return "fail_sector_budget_combined"
    if row.sectorBudgetSeparate <= 0.0:
        return "fail_sector_budget_separate"
    if row.certified_sector_combined:
        return "certified_sector_combined"
    if row.certified_sector_separate:
        return "certified_sector_separate"
    return "fail_unknown"


def certify_box(ctx: Any, box: SectorBoxInput, args: argparse.Namespace) -> SectorCertificateRow:
    main_lower = math.inf
    min_main_center_abs = math.inf
    max_main_radius = 0.0
    d0_neg_re_lower = math.inf
    d0_neg_re_upper = -math.inf
    rest_combined_upper = 0.0
    rest_separate_upper = 0.0
    notes: list[str] = []

    sigma_parts = split_range(box.sigma_min, box.sigma_max, int(args.subdiv_sigma))
    t_parts = split_range(box.t_min, box.t_max, int(args.subdiv_t))

    try:
        for sigma_lo, sigma_hi in sigma_parts:
            for t_lo, t_hi in t_parts:
                main, d0, drest, rvec_tail, _total_quartet, _total_finite = eval_subbox(
                    ctx,
                    sigma_lo,
                    sigma_hi,
                    t_lo,
                    t_hi,
                    args.mode,
                    int(args.interval_dps),
                    float(args.inflate),
                )
                sub_main_lower, _sub_main_upper = abs_bounds_rect(main)
                main_lower = min(main_lower, sub_main_lower)
                center_abs, radius, _center_radius_lower = center_radius_lower(main)
                min_main_center_abs = min(min_main_center_abs, center_abs)
                max_main_radius = max(max_main_radius, radius)

                product = mul_rect(d0, conj_rect(main), float(args.inflate))
                sub_neg_lower = -product.re_hi
                sub_neg_upper = -product.re_lo
                d0_neg_re_lower = min(d0_neg_re_lower, sub_neg_lower)
                d0_neg_re_upper = max(d0_neg_re_upper, sub_neg_upper)

                rest_combined = add_rect(drest, rvec_tail, float(args.inflate))
                _rest_combined_lower, sub_rest_combined_upper = abs_bounds_rect(rest_combined)
                _drest_lower, drest_upper = abs_bounds_rect(drest)
                _rvec_lower, rvec_upper = abs_bounds_rect(rvec_tail)
                rest_combined_upper = max(rest_combined_upper, sub_rest_combined_upper)
                rest_separate_upper = max(rest_separate_upper, drest_upper + rvec_upper)
    except ArithmeticError as exc:
        notes.append(str(exc))
        main_lower = 0.0

    main_lower = lower_out(main_lower)
    rest_combined_upper = upper_out(rest_combined_upper)
    rest_separate_upper = upper_out(rest_separate_upper)
    d0_neg_re_lower = signed_lower_out(d0_neg_re_lower)
    d0_neg_re_upper = signed_upper_out(d0_neg_re_upper)
    min_main_center_abs = 0.0 if not math.isfinite(min_main_center_abs) else min_main_center_abs

    certified_nondestructive = d0_neg_re_upper <= 0.0
    sector_budget_combined = main_lower - rest_combined_upper
    sector_budget_separate = main_lower - rest_separate_upper
    certified_sector_combined = (
        certified_nondestructive and main_lower > 0.0 and sector_budget_combined > 0.0
    )
    certified_sector_separate = (
        certified_nondestructive and main_lower > 0.0 and sector_budget_separate > 0.0
    )

    draft = SectorCertificateRow(
        label=args.label,
        source_box_id=box.source_box_id,
        sigma_min=box.sigma_min,
        sigma_max=box.sigma_max,
        t_min=box.t_min,
        t_max=box.t_max,
        d0_neg_re_upper=d0_neg_re_upper,
        d0_neg_re_lower=d0_neg_re_lower,
        certified_nondestructive=certified_nondestructive,
        mainNormLowerConst=main_lower,
        restUpperCombinedConst=rest_combined_upper,
        restUpperSeparateConst=rest_separate_upper,
        sectorBudgetCombined=sector_budget_combined,
        sectorBudgetSeparate=sector_budget_separate,
        certified_sector_combined=certified_sector_combined,
        certified_sector_separate=certified_sector_separate,
        status="",
        mode=args.mode,
        interval_dps=int(args.interval_dps),
        subdiv_sigma=int(args.subdiv_sigma),
        subdiv_t=int(args.subdiv_t),
        inflate=float(args.inflate),
        main_center_abs=min_main_center_abs,
        main_radius=max_main_radius,
        scout_budget_combined=box.scout_budget_combined,
        scout_budget_separate=box.scout_budget_separate,
        notes="; ".join(notes),
    )
    return SectorCertificateRow(**{**asdict(draft), "status": classify_row(draft)})


def write_csv(path: Path, rows: list[SectorCertificateRow]) -> None:
    if not rows:
        return
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=list(asdict(rows[0]).keys()))
        writer.writeheader()
        for row in rows:
            writer.writerow(asdict(row))


def jsonable(value: Any) -> Any:
    if isinstance(value, Path):
        return str(value)
    if isinstance(value, float):
        if math.isnan(value):
            return "nan"
        if math.isinf(value):
            return "inf" if value > 0 else "-inf"
    return value


def file_sha256(path: Path) -> str | None:
    if not path.exists():
        return None
    h = hashlib.sha256()
    with path.open("rb") as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b""):
            h.update(chunk)
    return h.hexdigest()


def write_json(
    path: Path,
    args: argparse.Namespace,
    rows: list[SectorCertificateRow],
    elapsed: float,
    command: list[str],
) -> dict[str, Any]:
    status_counts = Counter(row.status for row in rows)
    summary = {
        "label": args.label,
        "elapsed_seconds": elapsed,
        "boxes": len(rows),
        "certified_nondestructive": sum(1 for row in rows if row.certified_nondestructive),
        "certified_sector_combined": sum(1 for row in rows if row.certified_sector_combined),
        "certified_sector_separate": sum(1 for row in rows if row.certified_sector_separate),
        "status_counts": dict(status_counts),
        "min_sector_budget_combined": min(
            (row.sectorBudgetCombined for row in rows), default=math.nan
        ),
        "min_sector_budget_separate": min(
            (row.sectorBudgetSeparate for row in rows), default=math.nan
        ),
        "max_d0_neg_re_upper": max((row.d0_neg_re_upper for row in rows), default=math.nan),
        "parameters": {key: jsonable(value) for key, value in vars(args).items()},
        "command": command,
        "script_sha256": file_sha256(Path(__file__)),
        "rows": [asdict(row) for row in rows],
    }
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w") as f:
        json.dump(summary, f, indent=2, sort_keys=True, default=jsonable)
        f.write("\n")
    return summary


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        description="Sector certifier for projected-j0 boxes."
    )
    parser.add_argument("--boxes-csv", type=Path, required=True)
    parser.add_argument("--label", type=str, required=True)
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
    parser.add_argument("--interval-dps", type=int, default=50)
    parser.add_argument("--inflate", type=float, default=1.0e-12)
    parser.add_argument("--mode", choices=["fast", "strict"], default="fast")
    parser.add_argument("--subdiv-sigma", type=int, default=1)
    parser.add_argument("--subdiv-t", type=int, default=1)
    parser.add_argument("--only-pass-combined", action="store_true")
    parser.add_argument("--only-pass-separate", action="store_true")
    parser.add_argument("--max-boxes", type=int, default=None)
    parser.add_argument("--box-id", type=str, default="")
    parser.add_argument("--box-id-list", type=str, default="")
    parser.add_argument("--out-csv", type=Path, default=None)
    parser.add_argument("--out-json", type=Path, default=None)
    parser.add_argument("--top", type=int, default=8)
    parser.add_argument("--threads", type=int, default=None)
    return parser


def main() -> None:
    args = build_parser().parse_args()
    if args.target_reference_X is None:
        args.target_reference_X = args.reference_X
    if args.target_reference_p is None:
        args.target_reference_p = args.reference_p
    if args.odd_reference_X is None:
        args.odd_reference_X = args.reference_X
    if args.odd_reference_p is None:
        args.odd_reference_p = args.reference_p
    if args.subdiv_sigma < 1 or args.subdiv_t < 1:
        raise SystemExit("subdivision counts must be positive")
    validate_args(args)

    default_csv, default_json = default_output_paths(args.label)
    if args.out_csv is None:
        args.out_csv = default_csv
    if args.out_json is None:
        args.out_json = default_json

    boxes = read_boxes(args.boxes_csv, args)
    print("C2 projected-j0 sector box certifier")
    print("====================================")
    print(f"label={args.label}")
    print(f"boxes_csv={args.boxes_csv}")
    print(f"boxes_selected={len(boxes)} mode={args.mode} dps={args.interval_dps}")
    print(
        f"inflate={args.inflate} subdiv_sigma={args.subdiv_sigma} "
        f"subdiv_t={args.subdiv_t}"
    )

    tic = time.time()
    ctx = build_interval_context(args)
    print(
        "term_counts="
        f"odd_core:{ctx.odd_core.logs.size}, odd_ref:{ctx.odd_ref.logs.size}, "
        f"target:{ctx.target.logs.size}, central_ref:{ctx.central_ref.logs.size}"
    )

    rows: list[SectorCertificateRow] = []
    for idx, box in enumerate(boxes, 1):
        row = certify_box(ctx, box, args)
        rows.append(row)
        print(
            f"  [{idx}/{len(boxes)}] {box.source_box_id} "
            f"negReUpper={row.d0_neg_re_upper:.6e} "
            f"budget={row.sectorBudgetCombined:.6e} status={row.status}"
        )

    elapsed = time.time() - tic
    write_csv(args.out_csv, rows)
    summary = write_json(args.out_json, args, rows, elapsed, sys.argv)

    print("-" * 72)
    print(f"elapsed={elapsed:.2f}s boxes={len(rows)}")
    print(
        f"certified_nondestructive={summary['certified_nondestructive']} "
        f"sector_combined={summary['certified_sector_combined']} "
        f"sector_separate={summary['certified_sector_separate']}"
    )
    print(f"status_counts={summary['status_counts']}")
    print(f"CSV: {args.out_csv}")
    print(f"JSON: {args.out_json}")

    if args.top > 0 and rows:
        print("\nWorst sector budgets:")
        for row in sorted(rows, key=lambda r: r.sectorBudgetCombined)[: args.top]:
            print(
                f"  {row.source_box_id} budget={row.sectorBudgetCombined:.6e} "
                f"negReUpper={row.d0_neg_re_upper:.6e} "
                f"main={row.mainNormLowerConst:.6e} "
                f"rest={row.restUpperCombinedConst:.6e} "
                f"status={row.status}"
            )


if __name__ == "__main__":
    main()
