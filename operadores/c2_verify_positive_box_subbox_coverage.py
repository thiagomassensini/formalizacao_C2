#!/usr/bin/env python3
"""Verify positive-box subbox coverage with exact rational endpoint arithmetic."""

from __future__ import annotations

import argparse
import csv
import json
from collections import defaultdict
from dataclasses import dataclass
from datetime import datetime, timezone
from decimal import Decimal
from fractions import Fraction
from pathlib import Path
from typing import Any


EXPECTED_BOXES = [
    *(f"s0.84_t{i}" for i in range(9)),
    *(f"s0.85_t{i}" for i in range(9)),
    *(f"s0.86_t{i}" for i in range(9)),
]


@dataclass(frozen=True)
class IntervalBox:
    source_box_id: str
    sigma_min: Fraction
    sigma_max: Fraction
    t_min: Fraction
    t_max: Fraction


@dataclass(frozen=True)
class Subbox:
    source_box_id: str
    subbox_id: str
    sigma_min: Fraction
    sigma_max: Fraction
    t_min: Fraction
    t_max: Fraction


def parse_number(value: Any) -> Fraction:
    if isinstance(value, Decimal):
        return Fraction(value)
    if isinstance(value, int):
        return Fraction(value, 1)
    if isinstance(value, float):
        return Fraction(Decimal(str(value)))
    if isinstance(value, str):
        return Fraction(Decimal(value))
    raise TypeError(f"unsupported numeric value: {value!r}")


def frac_to_decimal_string(value: Fraction) -> str:
    return format(Decimal(value.numerator) / Decimal(value.denominator), "f")


def frac_to_json(value: Fraction) -> str:
    return frac_to_decimal_string(value)


def load_subboxes(path: Path) -> list[Subbox]:
    out: list[Subbox] = []
    with path.open("r", encoding="utf-8") as handle:
        for line_no, line in enumerate(handle, start=1):
            raw = line.strip()
            if not raw:
                continue
            data = json.loads(raw, parse_float=Decimal)
            missing = [
                field
                for field in (
                    "source_box_id",
                    "subbox_id",
                    "sigma_min",
                    "sigma_max",
                    "t_min",
                    "t_max",
                )
                if field not in data
            ]
            if missing:
                raise SystemExit(f"{path}:{line_no} missing fields: {missing}")
            out.append(
                Subbox(
                    source_box_id=str(data["source_box_id"]),
                    subbox_id=str(data["subbox_id"]),
                    sigma_min=parse_number(data["sigma_min"]),
                    sigma_max=parse_number(data["sigma_max"]),
                    t_min=parse_number(data["t_min"]),
                    t_max=parse_number(data["t_max"]),
                )
            )
    return out


def load_boxes_summary(path: Path) -> dict[str, IntervalBox]:
    data = json.loads(path.read_text(encoding="utf-8"), parse_float=Decimal)
    if isinstance(data, dict) and "boxes" in data:
        entries = data["boxes"]
    elif isinstance(data, list):
        entries = data
    elif isinstance(data, dict):
        entries = list(data.values())
    else:
        entries = []
    out: dict[str, IntervalBox] = {}
    for entry in entries:
        if not isinstance(entry, dict):
            continue
        source_box_id = entry.get("source_box_id") or entry.get("box_id")
        if not source_box_id:
            continue
        required = ("sigma_min", "sigma_max", "t_min", "t_max")
        if not all(field in entry for field in required):
            continue
        out[str(source_box_id)] = IntervalBox(
            source_box_id=str(source_box_id),
            sigma_min=parse_number(entry["sigma_min"]),
            sigma_max=parse_number(entry["sigma_max"]),
            t_min=parse_number(entry["t_min"]),
            t_max=parse_number(entry["t_max"]),
        )
    return out


def load_sector_boxes(path: Path) -> dict[str, IntervalBox]:
    out: dict[str, IntervalBox] = {}
    with path.open("r", encoding="utf-8", newline="") as handle:
        for row in csv.DictReader(handle):
            source_box_id = row["source_box_id"]
            out[source_box_id] = IntervalBox(
                source_box_id=source_box_id,
                sigma_min=parse_number(row["sigma_min"]),
                sigma_max=parse_number(row["sigma_max"]),
                t_min=parse_number(row["t_min"]),
                t_max=parse_number(row["t_max"]),
            )
    return out


def choose_box(
    source_box_id: str,
    summary_boxes: dict[str, IntervalBox],
    sector_boxes: dict[str, IntervalBox],
    failed: list[dict[str, Any]],
) -> IntervalBox | None:
    summary_box = summary_boxes.get(source_box_id)
    sector_box = sector_boxes.get(source_box_id)
    if summary_box is None:
        failed.append({"box": source_box_id, "check": "missing_boxes_summary"})
    if sector_box is None:
        failed.append({"box": source_box_id, "check": "missing_sector_pack"})
    if summary_box is None or sector_box is None:
        return None
    fields = ("sigma_min", "sigma_max", "t_min", "t_max")
    for field in fields:
        if getattr(summary_box, field) != getattr(sector_box, field):
            failed.append(
                {
                    "box": source_box_id,
                    "check": "box_range_mismatch",
                    "field": field,
                    "summary": frac_to_json(getattr(summary_box, field)),
                    "sector": frac_to_json(getattr(sector_box, field)),
                }
            )
    return sector_box


def verify_coverage(
    subboxes: list[Subbox],
    summary_boxes: dict[str, IntervalBox],
    sector_boxes: dict[str, IntervalBox],
) -> dict[str, Any]:
    by_box: dict[str, list[Subbox]] = defaultdict(list)
    for subbox in subboxes:
        by_box[subbox.source_box_id].append(subbox)

    failed: list[dict[str, Any]] = []
    boxes_with_full_coverage = 0
    boxes_with_gaps: list[str] = []
    boxes_with_bad_sigma: list[str] = []
    boxes_with_overlaps: list[str] = []
    max_gap = Fraction(0)
    max_overlap = Fraction(0)
    worst_box = None
    per_box: list[dict[str, Any]] = []

    all_box_ids = sorted(set(EXPECTED_BOXES) | set(by_box) | set(summary_boxes) | set(sector_boxes))
    for source_box_id in all_box_ids:
        box_failed_before = len(failed)
        box = choose_box(source_box_id, summary_boxes, sector_boxes, failed)
        box_subboxes = sorted(
            by_box.get(source_box_id, []),
            key=lambda item: (item.t_min, item.t_max, item.subbox_id),
        )
        if source_box_id not in EXPECTED_BOXES:
            failed.append({"box": source_box_id, "check": "unexpected_box_id"})
        if not box_subboxes:
            failed.append({"box": source_box_id, "check": "empty_subbox_list"})
            per_box.append(
                {
                    "source_box_id": source_box_id,
                    "subboxes": 0,
                    "full_coverage": False,
                    "bad_sigma": True,
                    "gaps": [],
                    "overlaps": [],
                }
            )
            continue
        if box is None:
            per_box.append(
                {
                    "source_box_id": source_box_id,
                    "subboxes": len(box_subboxes),
                    "full_coverage": False,
                    "bad_sigma": True,
                    "gaps": [],
                    "overlaps": [],
                }
            )
            continue

        bad_sigma = False
        for subbox in box_subboxes:
            if subbox.sigma_min != box.sigma_min or subbox.sigma_max != box.sigma_max:
                bad_sigma = True
                failed.append(
                    {
                        "box": source_box_id,
                        "subbox": subbox.subbox_id,
                        "check": "bad_sigma_range",
                        "box_sigma_min": frac_to_json(box.sigma_min),
                        "box_sigma_max": frac_to_json(box.sigma_max),
                        "subbox_sigma_min": frac_to_json(subbox.sigma_min),
                        "subbox_sigma_max": frac_to_json(subbox.sigma_max),
                    }
                )
            if subbox.t_min > subbox.t_max:
                failed.append(
                    {
                        "box": source_box_id,
                        "subbox": subbox.subbox_id,
                        "check": "invalid_t_interval",
                        "t_min": frac_to_json(subbox.t_min),
                        "t_max": frac_to_json(subbox.t_max),
                    }
                )

        gaps: list[dict[str, str]] = []
        overlaps: list[dict[str, str]] = []
        cursor = box.t_min
        if box_subboxes[0].t_min > cursor:
            gap = box_subboxes[0].t_min - cursor
            max_gap = max(max_gap, gap)
            gaps.append(
                {
                    "from": frac_to_json(cursor),
                    "to": frac_to_json(box_subboxes[0].t_min),
                    "width": frac_to_json(gap),
                }
            )
        elif box_subboxes[0].t_min < cursor:
            overlap = cursor - box_subboxes[0].t_min
            max_overlap = max(max_overlap, overlap)
            overlaps.append(
                {
                    "from": frac_to_json(box_subboxes[0].t_min),
                    "to": frac_to_json(cursor),
                    "width": frac_to_json(overlap),
                }
            )
        cursor = max(cursor, box_subboxes[0].t_max)

        for prev, current in zip(box_subboxes, box_subboxes[1:]):
            if current.t_min > cursor:
                gap = current.t_min - cursor
                max_gap = max(max_gap, gap)
                gaps.append(
                    {
                        "from": frac_to_json(cursor),
                        "to": frac_to_json(current.t_min),
                        "width": frac_to_json(gap),
                        "after": prev.subbox_id,
                        "before": current.subbox_id,
                    }
                )
            elif current.t_min < cursor:
                overlap = cursor - current.t_min
                max_overlap = max(max_overlap, overlap)
                overlaps.append(
                    {
                        "from": frac_to_json(current.t_min),
                        "to": frac_to_json(cursor),
                        "width": frac_to_json(overlap),
                        "after": prev.subbox_id,
                        "before": current.subbox_id,
                    }
                )
            cursor = max(cursor, current.t_max)

        if cursor < box.t_max:
            gap = box.t_max - cursor
            max_gap = max(max_gap, gap)
            gaps.append(
                {
                    "from": frac_to_json(cursor),
                    "to": frac_to_json(box.t_max),
                    "width": frac_to_json(gap),
                }
            )
        elif cursor > box.t_max:
            overlap = cursor - box.t_max
            max_overlap = max(max_overlap, overlap)
            overlaps.append(
                {
                    "from": frac_to_json(box.t_max),
                    "to": frac_to_json(cursor),
                    "width": frac_to_json(overlap),
                }
            )

        if gaps:
            boxes_with_gaps.append(source_box_id)
            failed.append({"box": source_box_id, "check": "t_coverage_gap", "gaps": gaps})
            worst_box = worst_box or source_box_id
        if overlaps:
            boxes_with_overlaps.append(source_box_id)
            failed.append(
                {"box": source_box_id, "check": "internal_t_overlap", "overlaps": overlaps}
            )
            worst_box = worst_box or source_box_id
        if bad_sigma:
            boxes_with_bad_sigma.append(source_box_id)
            worst_box = worst_box or source_box_id

        full_coverage = (
            len(failed) == box_failed_before
            and not gaps
            and not overlaps
            and not bad_sigma
            and box_subboxes[0].t_min == box.t_min
            and cursor == box.t_max
        )
        if full_coverage:
            boxes_with_full_coverage += 1
        per_box.append(
            {
                "source_box_id": source_box_id,
                "subboxes": len(box_subboxes),
                "sigma_min": frac_to_json(box.sigma_min),
                "sigma_max": frac_to_json(box.sigma_max),
                "t_min": frac_to_json(box.t_min),
                "t_max": frac_to_json(box.t_max),
                "first_subbox_t_min": frac_to_json(box_subboxes[0].t_min),
                "last_subbox_t_max": frac_to_json(box_subboxes[-1].t_max),
                "full_coverage": full_coverage,
                "bad_sigma": bad_sigma,
                "gaps": gaps,
                "overlaps": overlaps,
            }
        )

    s084_t7_count = len(by_box.get("s0.84_t7", []))
    if len(subboxes) != 771:
        failed.append({"check": "unexpected_total_subboxes", "actual": len(subboxes), "expected": 771})
    if len(set(by_box)) != 27:
        failed.append({"check": "unexpected_boxes_count", "actual": len(set(by_box)), "expected": 27})
    if s084_t7_count != 32:
        failed.append(
            {"check": "s084_t7_count_mismatch", "actual": s084_t7_count, "expected": 32}
        )

    result = {
        "timestamp_utc": datetime.now(timezone.utc).isoformat(),
        "checks_passed": 0,
        "checks_failed": len(failed),
        "boxes_count": len(set(by_box)),
        "subboxes_count": len(subboxes),
        "boxes_with_full_coverage": boxes_with_full_coverage,
        "boxes_with_gaps": boxes_with_gaps,
        "boxes_with_bad_sigma": boxes_with_bad_sigma,
        "boxes_with_internal_overlaps": boxes_with_overlaps,
        "max_gap": frac_to_json(max_gap),
        "max_overlap": frac_to_json(max_overlap),
        "worst_box": worst_box,
        "s084_t7_subboxes": s084_t7_count,
        "per_box": per_box,
        "failed_checks": failed,
    }
    checks = [
        len(set(by_box)) == 27,
        len(subboxes) == 771,
        s084_t7_count == 32,
        boxes_with_full_coverage == 27,
        not boxes_with_gaps,
        not boxes_with_bad_sigma,
        not boxes_with_overlaps,
        not failed,
    ]
    result["checks_passed"] = sum(1 for item in checks if item)
    result["checks_failed"] = len(failed)
    return result


def generate_report(result: dict[str, Any]) -> str:
    status = "passou" if result["checks_failed"] == 0 else "falhou"
    lean_promotion = (
        "Sim: os intervalos formam particoes racionais exatas por box."
        if result["checks_failed"] == 0
        else "Nao nesta rodada: ha falhas a resolver antes de gerar prova mecanica."
    )
    return f"""# Audit Projected J0 Positive Box Subbox Coverage Verification

## Resultado

Status: `{status}`.

```text
checks_failed = {result["checks_failed"]}
boxes_count = {result["boxes_count"]}
subboxes_count = {result["subboxes_count"]}
boxes_with_full_coverage = {result["boxes_with_full_coverage"]}
boxes_with_gaps = {len(result["boxes_with_gaps"])}
boxes_with_bad_sigma = {len(result["boxes_with_bad_sigma"])}
boxes_with_internal_overlaps = {len(result["boxes_with_internal_overlaps"])}
max_gap = {result["max_gap"]}
max_overlap = {result["max_overlap"]}
s0.84_t7 subboxes = {result["s084_t7_subboxes"]}
```

## Respostas

1. As 27 boxes sao cobertas pelas subboxes?
   {result["boxes_with_full_coverage"] == 27}.

2. Ha gaps?
   {bool(result["boxes_with_gaps"])}.

3. Ha overlaps internos?
   {bool(result["boxes_with_internal_overlaps"])}.

4. Algum sigma range diverge?
   {bool(result["boxes_with_bad_sigma"])}.

5. Total de subboxes bate com 771?
   {result["subboxes_count"] == 771}.

6. `s0.84_t7` bate com a sentinela manual?
   {result["s084_t7_subboxes"] == 32}.

7. A cobertura pode ser promovida para prova Lean mecanica?
   {lean_promotion}

## Leitura

Esta verificacao usa `Decimal` e `Fraction`, sem passar por float, para comparar
os endpoints dos boxes e subboxes. Ela so verifica cobertura geometrica dos
intervalos de subbox. Os bounds analiticos por subbox continuam externos.
"""


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--subboxes-jsonl", type=Path, required=True)
    parser.add_argument("--boxes-summary", type=Path, required=True)
    parser.add_argument("--sector-rat-csv", type=Path, required=True)
    parser.add_argument("--out-json", type=Path, required=True)
    parser.add_argument("--out-md", type=Path, required=True)
    args = parser.parse_args()

    subboxes = load_subboxes(args.subboxes_jsonl)
    summary_boxes = load_boxes_summary(args.boxes_summary)
    sector_boxes = load_sector_boxes(args.sector_rat_csv)
    result = verify_coverage(subboxes, summary_boxes, sector_boxes)

    args.out_json.parent.mkdir(parents=True, exist_ok=True)
    args.out_json.write_text(json.dumps(result, indent=2, sort_keys=True), encoding="utf-8")
    args.out_md.write_text(generate_report(result), encoding="utf-8")
    print(f"coverage status: checks_failed={result['checks_failed']}")
    print(f"boxes={result['boxes_count']} subboxes={result['subboxes_count']}")


if __name__ == "__main__":
    main()
