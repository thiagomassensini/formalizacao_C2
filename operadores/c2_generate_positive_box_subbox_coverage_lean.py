#!/usr/bin/env python3
"""Generate Lean coverage proofs for the positive-box subbox skeleton."""

from __future__ import annotations

import argparse
import json
from collections import defaultdict
from dataclasses import dataclass
from decimal import Decimal
from fractions import Fraction
from pathlib import Path
from typing import Any


BOX_ORDER = [
    *(f"s0.84_t{i}" for i in range(9)),
    *(f"s0.85_t{i}" for i in range(9)),
    *(f"s0.86_t{i}" for i in range(9)),
]

SIMP_REGION_DEFS = (
    "positiveBoxRegion, positiveBoxRect, mkSigmaLineRect, RectRegion.toSet, "
    "q084, q085, q086, "
    "t0Min, t0Max, t1Min, t1Max, t2Min, t2Max, t3Min, t3Max, "
    "t4Min, t4Max, t5Min, t5Max, t6Min, t6Max, t7Min, t7Max, "
    "t8Min, t8Max"
)


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


def decimal_to_q_expr(value: Fraction) -> str:
    if value.denominator == 1:
        return f"(({value.numerator} : ℚ))"
    return f"(({value.numerator} : ℚ) / {value.denominator})"


def box_to_constructor(box_id: str) -> str:
    return box_id.replace("s0.", "s0").replace(".", "_")


def subbox_to_constructor(subbox_id: str) -> str:
    box_part, sub_part = subbox_id.split("__", 1)
    box_name = box_to_constructor(box_part)
    idx = sub_part.split("_t", 1)[1]
    return f"{box_name}_sb{idx}"


def theorem_suffix(box_id: str) -> str:
    return box_to_constructor(box_id)


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


def load_box_summary(path: Path) -> dict[str, int]:
    data = json.loads(path.read_text(encoding="utf-8"), parse_float=Decimal)
    if isinstance(data, dict) and "boxes" in data:
        entries = data["boxes"]
    elif isinstance(data, list):
        entries = data
    elif isinstance(data, dict):
        entries = list(data.values())
    else:
        entries = []
    out: dict[str, int] = {}
    for entry in entries:
        if not isinstance(entry, dict):
            continue
        box_id = entry.get("source_box_id") or entry.get("box_id")
        count = entry.get("subboxes") or entry.get("subboxes_count")
        if box_id is not None and count is not None:
            out[str(box_id)] = int(count)
    return out


def validate_inputs(
    by_box: dict[str, list[Subbox]],
    summary_counts: dict[str, int],
    skeleton_path: Path,
) -> None:
    if set(by_box) != set(BOX_ORDER):
        raise SystemExit(f"unexpected source_box_id set: {sorted(set(by_box) ^ set(BOX_ORDER))}")
    total = sum(len(items) for items in by_box.values())
    if total != 771:
        raise SystemExit(f"expected 771 subboxes, found {total}")
    if len(by_box["s0.84_t7"]) != 32:
        raise SystemExit("expected 32 subboxes for s0.84_t7")
    for box_id in BOX_ORDER:
        if summary_counts and summary_counts.get(box_id) != len(by_box[box_id]):
            raise SystemExit(
                f"box summary mismatch for {box_id}: "
                f"{summary_counts.get(box_id)} != {len(by_box[box_id])}"
            )
    skeleton_text = skeleton_path.read_text(encoding="utf-8")
    for box_id in BOX_ORDER:
        if f"| .{box_to_constructor(box_id)} =>" not in skeleton_text:
            raise SystemExit(f"missing PositiveBoxId constructor for {box_id}")
        for subbox in by_box[box_id]:
            needle = f"| {subbox_to_constructor(subbox.subbox_id)}"
            if needle not in skeleton_text:
                raise SystemExit(f"missing PositiveBoxSubboxId constructor for {subbox.subbox_id}")


def emit_region_membership(lines: list[str], indent: str, lower_var: str, upper_var: str) -> None:
    lines.append(f"{indent}· simp [positiveBoxSubboxRegion, positiveBoxSubboxRect, RectRegion.toSet]")
    lines.append(f"{indent}  exact ⟨hSigmaMin, hSigmaMax, {lower_var}, {upper_var}⟩")


def emit_case(
    lines: list[str],
    indent: str,
    subbox: Subbox,
    lower_var: str,
    upper_var: str,
) -> None:
    ctor = subbox_to_constructor(subbox.subbox_id)
    lines.append(f"{indent}refine ⟨PositiveBoxSubboxId.{ctor}, ?_, ?_⟩")
    lines.append(f"{indent}· simp [positiveBoxSubboxesOf]")
    emit_region_membership(lines, indent, lower_var, upper_var)


def emit_nested_coverage_cases(
    lines: list[str],
    subboxes: list[Subbox],
    idx: int,
    indent: str,
    lower_var: str,
) -> None:
    if idx == len(subboxes) - 1:
        emit_case(lines, indent, subboxes[idx], lower_var, "htMax")
        return

    boundary = decimal_to_q_expr(subboxes[idx].t_max)
    hname = f"h{idx}"
    next_lower = f"htLower{idx + 1}"
    lines.append(f"{indent}by_cases {hname} : s.im ≤ ({boundary} : ℝ)")
    lines.append(f"{indent}·")
    emit_case(lines, indent + "  ", subboxes[idx], lower_var, hname)
    lines.append(f"{indent}·")
    lines.append(
        f"{indent}  have {next_lower} : ({boundary} : ℝ) ≤ s.im := "
        f"le_of_lt (not_le.mp {hname})"
    )
    emit_nested_coverage_cases(lines, subboxes, idx + 1, indent + "  ", next_lower)


def emit_box_theorem(lines: list[str], box_id: str, subboxes: list[Subbox]) -> None:
    suffix = theorem_suffix(box_id)
    box_ctor = box_to_constructor(box_id)
    lines.append(f"theorem positiveBox_subbox_cover_{suffix} :")
    lines.append(f"    ∀ s ∈ positiveBoxRegion PositiveBoxId.{box_ctor},")
    lines.append(f"      ∃ i ∈ positiveBoxSubboxesOf PositiveBoxId.{box_ctor},")
    lines.append("        s ∈ positiveBoxSubboxRegion i := by")
    lines.append("  intro s hs")
    lines.append(f"  simp [{SIMP_REGION_DEFS}] at hs")
    lines.append("  rcases hs with ⟨hSigmaMin, hSigmaMax, htMin, htMax⟩")
    lines.append(f"  norm_num [{SIMP_REGION_DEFS}] at hSigmaMin hSigmaMax htMin htMax")

    if len(subboxes) == 1:
        emit_case(lines, "  ", subboxes[0], "htMin", "htMax")
        lines.append("")
        return

    emit_nested_coverage_cases(lines, subboxes, 0, "  ", "htMin")
    lines.append("")


def generate_lean(by_box: dict[str, list[Subbox]]) -> str:
    lines: list[str] = []
    lines.append("import LeanC2.AuditProjectedJ0PositiveBoxAllSubboxSkeleton")
    lines.append("")
    lines.append("set_option linter.style.longLine false")
    lines.append("set_option linter.style.setOption false")
    lines.append("set_option linter.flexible false")
    lines.append("set_option linter.style.cdot false")
    lines.append("set_option linter.unusedSimpArgs false")
    lines.append("set_option maxHeartbeats 0")
    lines.append("")
    lines.append("/-!")
    lines.append("# Positive-box subbox coverage proofs")
    lines.append("")
    lines.append("This generated file proves the geometric coverage of each positive-box")
    lines.append("region by its generated subbox regions. Analytic bounds remain external.")
    lines.append("-/")
    lines.append("")
    lines.append("namespace C2")
    lines.append("namespace ProjectedJ0PositiveBoxSkeleton")
    lines.append("")
    lines.append("open AdjustedQuartetProjectedJ0Aliases")
    lines.append("")

    for box_id in BOX_ORDER:
        emit_box_theorem(lines, box_id, by_box[box_id])

    lines.append("theorem positiveBox_all_subbox_cover :")
    lines.append("    PositiveBoxAllSubboxCoverHypotheses where")
    lines.append("  cover := by")
    lines.append("    intro b hb")
    lines.append("    cases b")
    for box_id in BOX_ORDER:
        suffix = theorem_suffix(box_id)
        lines.append(f"    · simpa using positiveBox_subbox_cover_{suffix}")
    lines.append("")
    lines.append("theorem positiveBox_totalFinite_ne_zero_of_all_subbox_bounds_no_cover_hyp")
    lines.append("    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ} {K Midx : ℕ}")
    lines.append("    (bounds : PositiveBoxAllSubboxBounds tiltSeed coreCutoff K Midx) :")
    lines.append("    ∀ s ∈ positiveGlobalRegion,")
    lines.append("      adjustedProjectedJ0_totalFinite tiltSeed coreCutoff K Midx s ≠ 0 := by")
    lines.append("  exact positiveBox_totalFinite_ne_zero_of_all_subbox_bounds")
    lines.append("    bounds")
    lines.append("    positiveBox_all_subbox_cover")
    lines.append("")
    lines.append("end ProjectedJ0PositiveBoxSkeleton")
    lines.append("end C2")
    return "\n".join(lines) + "\n"


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--skeleton-lean", type=Path, required=True)
    parser.add_argument("--subboxes-jsonl", type=Path, required=True)
    parser.add_argument("--boxes-summary", type=Path, required=True)
    parser.add_argument("--out-lean", type=Path, required=True)
    args = parser.parse_args()

    subboxes = load_subboxes(args.subboxes_jsonl)
    by_box: dict[str, list[Subbox]] = defaultdict(list)
    for subbox in subboxes:
        by_box[subbox.source_box_id].append(subbox)
    for box_id in list(by_box):
        by_box[box_id].sort(key=lambda item: (item.t_min, item.t_max, item.subbox_id))
    summary_counts = load_box_summary(args.boxes_summary)
    validate_inputs(by_box, summary_counts, args.skeleton_lean)

    args.out_lean.write_text(generate_lean(by_box), encoding="utf-8")
    print(f"generated {args.out_lean}")
    print(f"boxes={len(by_box)} subboxes={sum(len(items) for items in by_box.values())}")


if __name__ == "__main__":
    main()
