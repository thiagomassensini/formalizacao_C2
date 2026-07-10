#!/usr/bin/env python3
"""
Sample-Lipschitz scout for projected-j0 main lower bounds.

This is a diagnostic scout.  The Lipschitz bound is estimated by inflated
finite differences of the sampled complex main value, so the output is not a
strong external certificate by itself.
"""

from __future__ import annotations

import argparse
import csv
import json
import math
import time
from dataclasses import asdict, dataclass
from pathlib import Path
from typing import Any

import numpy as np

from c2_adjusted_quartet_evaluator import validate_args
from c2_projected_j0_atlas_scout import evaluate_sigma, safe_label, scalar_ratio


@dataclass(frozen=True)
class ScoutRow:
    source_box_id: str
    t_min: float
    t_max: float
    main_lower_rect: float
    main_sample_min_abs: float
    main_lipschitz_bound: float
    main_radius: float
    main_lower_sample_lipschitz: float
    main_lower_gain: float
    old_budget_combined: float
    new_budget_combined_estimate: float
    would_recover: bool
    notes: str


def parse_bool(text: Any) -> bool:
    return str(text).strip().lower() in {"1", "true", "yes", "y"}


def read_boxes(path: Path, box_id_list: str) -> list[dict[str, str]]:
    wanted = {item.strip() for item in box_id_list.split(",") if item.strip()}
    with path.open(newline="", encoding="utf-8") as f:
        rows = list(csv.DictReader(f))
    if wanted:
        rows = [row for row in rows if row["source_box_id"] in wanted]
    return rows


def sample_axis(lo: float, hi: float, n: int) -> np.ndarray:
    if n <= 1:
        return np.array([(lo + hi) * 0.5], dtype=np.float64)
    return np.linspace(float(lo), float(hi), int(n), dtype=np.float64)


def grid_radius(sigma_min: float, sigma_max: float, t_min: float, t_max: float, ns: int, nt: int) -> float:
    sigma_width = max(0.0, sigma_max - sigma_min)
    t_width = max(0.0, t_max - t_min)
    sigma_spacing = sigma_width / max(1, ns - 1) if ns > 1 else sigma_width
    t_spacing = t_width / max(1, nt - 1) if nt > 1 else t_width
    return math.hypot(0.5 * sigma_spacing, 0.5 * t_spacing)


def finite_difference_lipschitz(
    sigma_values: np.ndarray,
    t_values: np.ndarray,
    main_values: np.ndarray,
    inflate: float,
) -> float:
    max_sigma_slope = 0.0
    max_t_slope = 0.0
    if sigma_values.size > 1:
        for i in range(sigma_values.size - 1):
            ds = float(sigma_values[i + 1] - sigma_values[i])
            if ds > 0.0:
                slopes = np.abs(main_values[i + 1, :] - main_values[i, :]) / ds
                max_sigma_slope = max(max_sigma_slope, float(np.max(slopes)))
    if t_values.size > 1:
        for j in range(t_values.size - 1):
            dt = float(t_values[j + 1] - t_values[j])
            if dt > 0.0:
                slopes = np.abs(main_values[:, j + 1] - main_values[:, j]) / dt
                max_t_slope = max(max_t_slope, float(np.max(slopes)))
    return math.hypot(max_sigma_slope, max_t_slope) * max(0.0, float(inflate))


def scout_box(args: argparse.Namespace, row: dict[str, str]) -> ScoutRow:
    sigma_min = float(row["sigma_min"])
    sigma_max = float(row["sigma_max"])
    t_min = float(row["t_min"])
    t_max = float(row["t_max"])
    sigma_values = sample_axis(sigma_min, sigma_max, int(args.samples_sigma))
    t_values = sample_axis(t_min, t_max, int(args.samples_t))

    main_rows: list[np.ndarray] = []
    for sigma in sigma_values:
        values = evaluate_sigma(args, float(sigma), t_values)
        main_rows.append(values["main_complex"])
    main_values = np.vstack(main_rows)
    main_abs = np.abs(main_values)
    sample_min = float(np.min(main_abs))
    lip = finite_difference_lipschitz(
        sigma_values,
        t_values,
        main_values,
        float(args.lipschitz_inflate),
    )
    radius = grid_radius(
        sigma_min,
        sigma_max,
        t_min,
        t_max,
        int(args.samples_sigma),
        int(args.samples_t),
    )
    sample_lower = max(0.0, sample_min - lip * radius)
    main_lower_rect = float(row.get("main_lower_rect") or row["mainNormLowerConst"])
    numerator = float(row["numeratorUpperConst"])
    rest = float(row["restUpperCombinedConst"])
    new_parallel = scalar_ratio(numerator, sample_lower)
    new_budget = sample_lower - new_parallel - rest
    old_budget = float(row["budgetCombinedConst"])
    notes = (
        "diagnostic finite-difference Lipschitz; not a strong certificate; "
        f"samples_sigma={args.samples_sigma}; samples_t={args.samples_t}; "
        f"lipschitz_inflate={args.lipschitz_inflate}"
    )
    return ScoutRow(
        source_box_id=row["source_box_id"],
        t_min=t_min,
        t_max=t_max,
        main_lower_rect=main_lower_rect,
        main_sample_min_abs=sample_min,
        main_lipschitz_bound=lip,
        main_radius=radius,
        main_lower_sample_lipschitz=sample_lower,
        main_lower_gain=sample_lower - main_lower_rect,
        old_budget_combined=old_budget,
        new_budget_combined_estimate=new_budget,
        would_recover=new_budget > 0.0,
        notes=notes,
    )


def default_paths(label: str) -> tuple[Path, Path]:
    stem = safe_label(label)
    return (
        Path("audit_outputs") / f"c2_projected_j0_sample_lipschitz_scout_{stem}.csv",
        Path("audit_outputs") / f"c2_projected_j0_sample_lipschitz_scout_{stem}.json",
    )


def write_csv(path: Path, rows: list[ScoutRow]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=list(asdict(rows[0]).keys()))
        writer.writeheader()
        for row in rows:
            writer.writerow(asdict(row))


def write_json(path: Path, args: argparse.Namespace, rows: list[ScoutRow], elapsed: float) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    payload = {
        "label": args.label,
        "elapsed_seconds": elapsed,
        "boxes": len(rows),
        "would_recover": sum(1 for row in rows if row.would_recover),
        "parameters": {
            key: str(value) if isinstance(value, Path) else value
            for key, value in vars(args).items()
        },
        "rows": [asdict(row) for row in rows],
    }
    with path.open("w", encoding="utf-8") as f:
        json.dump(payload, f, indent=2, sort_keys=True)
        f.write("\n")


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser()
    parser.add_argument("--boxes-csv", type=Path, required=True)
    parser.add_argument("--label", default="valley47_sample_lipschitz")
    parser.add_argument("--box-id-list", default="")
    parser.add_argument("--samples-t", type=int, default=65)
    parser.add_argument("--samples-sigma", type=int, default=1)
    parser.add_argument("--lipschitz-inflate", type=float, default=4.0)
    parser.add_argument("--K", type=int, default=16)
    parser.add_argument("--M", type=int, default=12001)
    parser.add_argument("--ref-K", type=int, default=17)
    parser.add_argument("--ref-M", type=int, default=16001)
    parser.add_argument("--reference-mode", choices=["raw", "exponential", "supergaussian"], default="supergaussian")
    parser.add_argument("--reference-X", type=float, default=10661.0)
    parser.add_argument("--reference-p", type=int, default=2)
    parser.add_argument("--target-reference-mode", choices=["raw", "exponential", "supergaussian"], default="supergaussian")
    parser.add_argument("--target-reference-X", type=float, default=None)
    parser.add_argument("--target-reference-p", type=int, default=None)
    parser.add_argument("--odd-reference-mode", choices=["raw", "exponential", "supergaussian"], default="supergaussian")
    parser.add_argument("--odd-ref-M", type=int, default=None)
    parser.add_argument("--odd-reference-X", type=float, default=None)
    parser.add_argument("--odd-reference-p", type=int, default=None)
    parser.add_argument("--threads", type=int, default=None)
    parser.add_argument("--out-csv", type=Path, default=None)
    parser.add_argument("--out-json", type=Path, default=None)
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
    validate_args(argparse.Namespace(**vars(args), sigma=0.5))
    if args.samples_t < 1 or args.samples_sigma < 1:
        raise SystemExit("sample counts must be positive")
    if args.out_csv is None or args.out_json is None:
        default_csv, default_json = default_paths(args.label)
        if args.out_csv is None:
            args.out_csv = default_csv
        if args.out_json is None:
            args.out_json = default_json

    boxes = read_boxes(args.boxes_csv, args.box_id_list)
    tic = time.time()
    rows = [scout_box(args, row) for row in boxes]
    elapsed = time.time() - tic
    write_csv(args.out_csv, rows)
    write_json(args.out_json, args, rows, elapsed)
    print(f"boxes={len(rows)} would_recover={sum(1 for row in rows if row.would_recover)}")
    print(f"CSV: {args.out_csv}")
    print(f"JSON: {args.out_json}")


if __name__ == "__main__":
    main()
