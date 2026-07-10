#!/usr/bin/env python3
"""
Emit a granular external subbox certificate for projected-j0 sector boxes.

This script reuses the same finite interval evaluator used by the sector box
certifier. It records the rectangular complex enclosures for each subbox plus
the scalar quantities consumed by the sector contract.
"""

from __future__ import annotations

import argparse
import csv
import hashlib
import json
import math
import subprocess
import sys
import time
from collections import defaultdict
from dataclasses import asdict, dataclass
from pathlib import Path
from typing import Any

import numpy as np

from c2_adjusted_quartet_evaluator import validate_args
from c2_projected_j0_interval_box_certifier import (
    Rect,
    abs_bounds_rect,
    add_rect,
    build_interval_context,
    conj_rect,
    eval_subbox,
    lower_out,
    mul_rect,
    split_range,
    upper_out,
)


IMPLEMENTATION_VERSION = "sector-subbox-certificate-v1"


@dataclass(frozen=True)
class SourceBox:
    source_box_id: str
    sigma_min: float
    sigma_max: float
    t_min: float
    t_max: float
    mainNormLowerConst: float
    d0_neg_re_upper: float
    restUpperCombinedConst: float
    restUpperSeparateConst: float
    sectorBudgetCombined: float
    sectorBudgetSeparate: float


def file_sha256(path: Path) -> str | None:
    if not path.exists():
        return None
    h = hashlib.sha256()
    with path.open("rb") as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b""):
            h.update(chunk)
    return h.hexdigest()


def git_head() -> str | None:
    try:
        out = subprocess.check_output(
            ["git", "rev-parse", "HEAD"],
            cwd=Path(__file__).resolve().parents[1],
            stderr=subprocess.DEVNULL,
            text=True,
        )
    except Exception:
        return None
    return out.strip()


def jsonable(value: Any) -> Any:
    if isinstance(value, Path):
        return str(value)
    if isinstance(value, float):
        if math.isnan(value):
            return "nan"
        if math.isinf(value):
            return "inf" if value > 0 else "-inf"
    return value


def signed_lower_out(value: float) -> float:
    if not math.isfinite(value):
        return value
    return float(np.nextafter(value, -np.inf))


def signed_upper_out(value: float) -> float:
    if not math.isfinite(value):
        return value
    return float(np.nextafter(value, np.inf))


def rect_fields(prefix: str, rect: Rect) -> dict[str, float]:
    return {
        f"{prefix}_re_lower": rect.re_lo,
        f"{prefix}_re_upper": rect.re_hi,
        f"{prefix}_im_lower": rect.im_lo,
        f"{prefix}_im_upper": rect.im_hi,
    }


def read_source_boxes(path: Path) -> list[SourceBox]:
    boxes: list[SourceBox] = []
    with path.open(newline="") as f:
        reader = csv.DictReader(f)
        for row in reader:
            boxes.append(
                SourceBox(
                    source_box_id=row["source_box_id"],
                    sigma_min=float(row["sigma_min"]),
                    sigma_max=float(row["sigma_max"]),
                    t_min=float(row["t_min"]),
                    t_max=float(row["t_max"]),
                    mainNormLowerConst=float(row["mainNormLowerConst"]),
                    d0_neg_re_upper=float(row["d0_neg_re_upper"]),
                    restUpperCombinedConst=float(row["restUpperCombinedConst"]),
                    restUpperSeparateConst=float(row["restUpperSeparateConst"]),
                    sectorBudgetCombined=float(row["sectorBudgetCombined"]),
                    sectorBudgetSeparate=float(row["sectorBudgetSeparate"]),
                )
            )
    return boxes


def namespace_from_source_json(source_json: Path, args: argparse.Namespace) -> argparse.Namespace:
    data = json.loads(source_json.read_text())
    params = dict(data["parameters"])
    params["boxes_csv"] = args.source_csv
    params["out_csv"] = None
    params["out_json"] = None
    params["label"] = args.label or f"{data.get('label', 'sector_subbox')}_subboxes"
    params["top"] = 0
    params["box_id"] = ""
    params["box_id_list"] = ""
    params["max_boxes"] = None
    params["only_pass_combined"] = False
    params["only_pass_separate"] = False
    params["threads"] = params.get("threads")
    ns = argparse.Namespace(**params)
    if ns.target_reference_X is None:
        ns.target_reference_X = ns.reference_X
    if ns.target_reference_p is None:
        ns.target_reference_p = ns.reference_p
    if ns.odd_reference_X is None:
        ns.odd_reference_X = ns.reference_X
    if ns.odd_reference_p is None:
        ns.odd_reference_p = ns.reference_p
    validate_args(ns)
    return ns


def subbox_record(
    box: SourceBox,
    subbox_id: str,
    sigma_lo: float,
    sigma_hi: float,
    t_lo: float,
    t_hi: float,
    main: Rect,
    d0: Rect,
    drest: Rect,
    rvec_tail: Rect,
    args: argparse.Namespace,
) -> dict[str, Any]:
    product = mul_rect(d0, conj_rect(main), float(args.inflate))
    d0_neg_re_lower = signed_lower_out(-product.re_hi)
    d0_neg_re_upper = signed_upper_out(-product.re_lo)
    main_abs_lower, main_abs_upper = abs_bounds_rect(main)
    drest_abs_lower, drest_abs_upper = abs_bounds_rect(drest)
    rvec_abs_lower, rvec_abs_upper = abs_bounds_rect(rvec_tail)
    rest_combined = add_rect(drest, rvec_tail, float(args.inflate))
    rest_combined_lower, rest_combined_upper = abs_bounds_rect(rest_combined)
    return {
        "source_box_id": box.source_box_id,
        "subbox_id": subbox_id,
        "sigma_min": sigma_lo,
        "sigma_max": sigma_hi,
        "t_min": t_lo,
        "t_max": t_hi,
        **rect_fields("M", main),
        **rect_fields("D0", d0),
        **rect_fields("Drest", drest),
        **rect_fields("RvecTail", rvec_tail),
        "D0NegReMain_lower": d0_neg_re_lower,
        "D0NegReMain_upper": d0_neg_re_upper,
        "main_abs_lower": lower_out(main_abs_lower),
        "main_abs_upper": upper_out(main_abs_upper),
        "Drest_abs_lower": lower_out(drest_abs_lower),
        "Drest_abs_upper": upper_out(drest_abs_upper),
        "RvecTail_abs_lower": lower_out(rvec_abs_lower),
        "RvecTail_abs_upper": upper_out(rvec_abs_upper),
        "rest_combined_lower": lower_out(rest_combined_lower),
        "rest_combined_upper": upper_out(rest_combined_upper),
        "rest_separate_upper": upper_out(drest_abs_upper + rvec_abs_upper),
        "mode": args.mode,
        "interval_dps": int(args.interval_dps),
        "inflate": float(args.inflate),
        "subdiv_sigma": int(args.subdiv_sigma),
        "subdiv_t": int(args.subdiv_t),
        "implementation_version": IMPLEMENTATION_VERSION,
    }


def write_readme(out_dir: Path) -> None:
    (out_dir / "README.md").write_text(
        "# Projected J0 Positive Box Sector Subbox Certificate\n\n"
        "External granular certificate data for the positive-box sector run. "
        "The JSONL file records interval rectangles and scalar bounds for each "
        "subbox. This is an audit artifact, not a kernel-checked proof.\n"
    )


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        description="Emit subbox-level projected-j0 sector certificate data."
    )
    parser.add_argument("--source-csv", type=Path, required=True)
    parser.add_argument("--source-json", type=Path, required=True)
    parser.add_argument("--out-dir", type=Path, required=True)
    parser.add_argument("--label", type=str, default="")
    return parser


def main() -> None:
    cli = build_parser().parse_args()
    if not cli.source_csv.exists():
        raise SystemExit(f"missing source csv: {cli.source_csv}")
    if not cli.source_json.exists():
        raise SystemExit(f"missing source json: {cli.source_json}")

    args = namespace_from_source_json(cli.source_json, cli)
    boxes = read_source_boxes(cli.source_csv)
    cli.out_dir.mkdir(parents=True, exist_ok=True)

    print("C2 projected-j0 sector subbox certificate")
    print("=========================================")
    print(f"source_csv={cli.source_csv}")
    print(f"source_json={cli.source_json}")
    print(f"out_dir={cli.out_dir}")
    print(f"boxes={len(boxes)} mode={args.mode} subdiv_t={args.subdiv_t}")

    tic = time.time()
    ctx = build_interval_context(args)
    subbox_path = cli.out_dir / "subboxes.jsonl"
    by_box: dict[str, list[dict[str, Any]]] = defaultdict(list)
    count = 0

    with subbox_path.open("w") as out:
        for box_idx, box in enumerate(boxes, 1):
            sigma_parts = split_range(box.sigma_min, box.sigma_max, int(args.subdiv_sigma))
            t_parts = split_range(box.t_min, box.t_max, int(args.subdiv_t))
            for si, (sigma_lo, sigma_hi) in enumerate(sigma_parts):
                for ti, (t_lo, t_hi) in enumerate(t_parts):
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
                    subbox_id = f"{box.source_box_id}__s{si:02d}_t{ti:03d}"
                    rec = subbox_record(
                        box, subbox_id, sigma_lo, sigma_hi, t_lo, t_hi,
                        main, d0, drest, rvec_tail, args
                    )
                    out.write(json.dumps(rec, sort_keys=True, default=jsonable) + "\n")
                    by_box[box.source_box_id].append(rec)
                    count += 1
            print(f"  [{box_idx}/{len(boxes)}] {box.source_box_id}: {len(by_box[box.source_box_id])} subboxes")

    boxes_summary: list[dict[str, Any]] = []
    for box in boxes:
        subboxes = by_box[box.source_box_id]
        min_main = lower_out(min(r["main_abs_lower"] for r in subboxes))
        max_neg_upper = signed_upper_out(max(r["D0NegReMain_upper"] for r in subboxes))
        max_rest_combined = upper_out(max(r["rest_combined_upper"] for r in subboxes))
        max_rest_separate = upper_out(max(r["rest_separate_upper"] for r in subboxes))
        boxes_summary.append(
            {
                **asdict(box),
                "subboxes": len(subboxes),
                "subbox_main_abs_lower_min": min_main,
                "subbox_D0NegReMain_upper_max": max_neg_upper,
                "subbox_rest_combined_upper_max": max_rest_combined,
                "subbox_rest_separate_upper_max": max_rest_separate,
                "subbox_sectorBudgetCombined": min_main - max_rest_combined,
                "subbox_sectorBudgetSeparate": min_main - max_rest_separate,
            }
        )

    elapsed = time.time() - tic
    config = {
        "label": args.label,
        "created_at_unix": time.time(),
        "elapsed_seconds": elapsed,
        "implementation_version": IMPLEMENTATION_VERSION,
        "git_head": git_head(),
        "script_sha256": file_sha256(Path(__file__)),
        "source_csv": str(cli.source_csv),
        "source_json": str(cli.source_json),
        "source_csv_sha256": file_sha256(cli.source_csv),
        "source_json_sha256": file_sha256(cli.source_json),
        "boxes_count": len(boxes),
        "subboxes_count": count,
        "parameters": {k: jsonable(v) for k, v in vars(args).items()},
        "command": sys.argv,
    }
    (cli.out_dir / "config.json").write_text(json.dumps(config, indent=2, sort_keys=True) + "\n")
    (cli.out_dir / "boxes_summary.json").write_text(
        json.dumps(boxes_summary, indent=2, sort_keys=True, default=jsonable) + "\n"
    )
    write_readme(cli.out_dir)

    print("-" * 72)
    print(f"elapsed={elapsed:.2f}s subboxes={count}")
    print(f"JSONL: {subbox_path}")
    print(f"summary: {cli.out_dir / 'boxes_summary.json'}")


if __name__ == "__main__":
    main()
