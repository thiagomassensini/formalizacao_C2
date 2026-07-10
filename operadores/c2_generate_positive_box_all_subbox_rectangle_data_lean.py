#!/usr/bin/env python3
"""Generate deterministic Lean shards for positive-box rectangle data.

Each generated definition contains four raw rational rectangles and proofs of
endpoint arithmetic only.  No analytic rectangle membership theorem is
generated.  The input is validated against the 771 constructors, memberships,
and exact rational regions in the all-subbox skeleton before any file is
written.
"""

from __future__ import annotations

import argparse
import sys
from fractions import Fraction
from pathlib import Path

try:
    from c2_verify_positive_box_all_subbox_rectangle_data import (
        BOX_ORDER,
        DEFAULT_BOXES,
        DEFAULT_SKELETON,
        DEFAULT_SUBBOXES,
        REPO_ROOT,
        BoxConstants,
        InputError,
        Rect,
        Skeleton,
        Subbox,
        external_box_to_lean,
        load_box_constants,
        load_subboxes,
        parse_skeleton,
        sha256,
        verify,
    )
except ModuleNotFoundError:  # Supports ``python -m operadores.<module>``.
    from operadores.c2_verify_positive_box_all_subbox_rectangle_data import (
        BOX_ORDER,
        DEFAULT_BOXES,
        DEFAULT_SKELETON,
        DEFAULT_SUBBOXES,
        REPO_ROOT,
        BoxConstants,
        InputError,
        Rect,
        Skeleton,
        Subbox,
        external_box_to_lean,
        load_box_constants,
        load_subboxes,
        parse_skeleton,
        sha256,
        verify,
    )


DEFAULT_OUT_DIR = (
    REPO_ROOT / "LeanC2/Generated/ProjectedJ0PositiveBoxRectangleData"
)
SCHEMA_IMPORT = "LeanC2.AuditProjectedJ0PositiveBoxRectangleCertificateSchema"
SKELETON_IMPORT = "LeanC2.AuditProjectedJ0PositiveBoxAllSubboxSkeleton"
RATIONALIZED_DATA_IMPORT = (
    "LeanC2.AuditAdjustedQuartetProjectedJ0PositiveBoxSectorRationalizedData"
)


def q_expr(value: Fraction) -> str:
    if value.denominator == 1:
        return f"(({value.numerator} : ℚ))"
    return f"(({value.numerator} : ℚ) / {value.denominator})"


def display_path(path: Path) -> str:
    resolved = path.resolve()
    try:
        return resolved.relative_to(REPO_ROOT.resolve()).as_posix()
    except ValueError:
        return resolved.as_posix()


def lean_namespace_for_box(box_id: str) -> str:
    # s0.84_t7 -> S084T7
    sigma, t_index = box_id.removeprefix("s0.").split("_t", 1)
    return f"S0{sigma.replace('.', '')}T{int(t_index)}"


def shard_filename(box_id: str) -> str:
    return f"{lean_namespace_for_box(box_id)}.lean"


def certificate_name(lean_id: str) -> str:
    return f"{lean_id}_certificateData"


def render_rect_assignment(field: str, rect: Rect) -> list[str]:
    lines = [f"  {field} :="]
    lines.append(f"    {{ re := {{ lo := {q_expr(rect.re.lo)}")
    lines.append(f"              hi := {q_expr(rect.re.hi)} }}")
    lines.append(f"      im := {{ lo := {q_expr(rect.im.lo)}")
    lines.append(f"              hi := {q_expr(rect.im.hi)} }} }}")
    return lines


def render_certificate(item: Subbox, constants: BoxConstants) -> list[str]:
    name = certificate_name(item.lean_id)
    main_lower = constants.main_lower
    d0_upper = constants.d0_upper
    rest_upper = constants.rest_upper
    lines = [
        f"def {name} :",
        "    ProjectedJ0SubboxRectangleCertificateData",
        f"      {q_expr(main_lower)}",
        f"      {q_expr(d0_upper)}",
        f"      {q_expr(rest_upper)} where",
    ]
    lines.extend(render_rect_assignment("MRect", item.rects["M"]))
    lines.extend(render_rect_assignment("D0Rect", item.rects["D0"]))
    lines.extend(render_rect_assignment("DrestRect", item.rects["Drest"]))
    lines.extend(render_rect_assignment("RvecTailRect", item.rects["RvecTail"]))
    lines.extend(
        [
            "  MRect_valid := by",
            "    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]",
            "  D0Rect_valid := by",
            "    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]",
            "  DrestRect_valid := by",
            "    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]",
            "  RvecTailRect_valid := by",
            "    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]",
            "  M_re_nonneg := by norm_num",
            "  M_im_nonpos := by norm_num",
            "  D0_re_nonneg := by norm_num",
            "  D0_im_nonpos := by norm_num",
            "  mainLower_nonneg := by norm_num",
            "  mainLower_sq := by norm_num",
            "  d0_endpoint_upper_le := by",
            "    norm_num [",
            "      projectedJ0D0NegReUpperRat,",
            "      RationalRealInterval.mulNonneg,",
            "      RationalRealInterval.mulNonpos",
            "    ]",
            "  restUpper_nonneg := by norm_num",
            "  rest_endpoint_sq_le := by",
            "    norm_num [",
            "      projectedJ0RestCombinedReAbsUpperRat,",
            "      projectedJ0RestCombinedImAbsUpperRat,",
            "      projectedJ0RestCombinedRectRat,",
            "      RationalComplexRect.add,",
            "      RationalRealInterval.add,",
            "      RationalRealInterval.absEndpointMax,",
            "      abs_of_nonneg, abs_of_nonpos, max_def",
            "    ]",
            "",
        ]
    )
    return lines


def render_dispatcher(box_id: str, items: list[Subbox]) -> list[str]:
    box_lean = external_box_to_lean(box_id)
    lines = [
        "/--",
        "Return rectangle data only for a subbox formally belonging to this box.",
        "The membership argument rules out every constructor from the other boxes;",
        "there is no default or fallback certificate.",
        "-/",
        "def certificate (i : PositiveBoxSubboxId)",
        f"    (hi : i ∈ positiveBoxSubboxesOf .{box_lean}) :",
        "    ProjectedJ0SubboxRectangleCertificateData",
        f"      ((positiveBoxCombinedCert .{box_lean}).constants.mainLower)",
        f"      ((positiveBoxCombinedCert .{box_lean}).constants.d0NegReUpper)",
        f"      ((positiveBoxCombinedCert .{box_lean}).constants.restUpper) := by",
    ]
    hypotheses: list[str] = []
    for index, item in enumerate(items):
        hypothesis = f"h{index}"
        hypotheses.append(hypothesis)
        prefix = "if" if index == 0 else "else if"
        lines.append(
            f"  {prefix} {hypothesis} : i = .{item.lean_id} then"
        )
        lines.append(f"    exact {certificate_name(item.lean_id)}")
    lines.append("  else")
    excluded = ", ".join(hypotheses)
    lines.append(f"    simp [positiveBoxSubboxesOf, {excluded}] at hi")
    lines.append("")
    return lines


def render_shard(
    box_id: str,
    items: list[Subbox],
    constants: BoxConstants,
    skeleton: Skeleton,
    subboxes_path: Path,
    boxes_path: Path,
    skeleton_path: Path,
) -> str:
    namespace = lean_namespace_for_box(box_id)
    expected_ids = skeleton.members_by_box[external_box_to_lean(box_id)]
    if tuple(item.lean_id for item in items) != expected_ids:
        raise InputError(
            f"internal generation order mismatch for {box_id}: source rows do not "
            "match the skeleton membership order"
        )

    lines = [
        f"import {SCHEMA_IMPORT}",
        f"import {SKELETON_IMPORT}",
        f"import {RATIONALIZED_DATA_IMPORT}",
        "",
        "set_option linter.style.longLine false",
        "",
        "/-!",
        f"# Generated rectangle data for {box_id}",
        "",
        "This file contains exact rational endpoints and kernel-checkable",
        "rectangle arithmetic. It intentionally contains no theorem asserting",
        "analytic membership of M, D0, Drest, or RvecTail in these rectangles.",
        "",
        f"Source subboxes: {display_path(subboxes_path)}",
        f"Source subboxes SHA256: {sha256(subboxes_path)}",
        f"Source box constants: {display_path(boxes_path)}",
        f"Source box constants SHA256: {sha256(boxes_path)}",
        f"Skeleton: {display_path(skeleton_path)}",
        f"Skeleton SHA256: {sha256(skeleton_path)}",
        "-/",
        "",
        "namespace C2",
        "namespace ProjectedJ0PositiveBoxSkeleton",
        "namespace ProjectedJ0PositiveBoxRectangleData",
        f"namespace {namespace}",
        "",
        "open ProjectedJ0RectangleArithmetic",
        "",
    ]
    for item in items:
        lines.extend(render_certificate(item, constants))
    lines.extend(render_dispatcher(box_id, items))
    lines.extend(
        [
            f"end {namespace}",
            "end ProjectedJ0PositiveBoxRectangleData",
            "end ProjectedJ0PositiveBoxSkeleton",
            "end C2",
            "",
        ]
    )
    return "\n".join(lines)


def select_and_order(
    subboxes: list[Subbox], skeleton: Skeleton, box_id: str
) -> list[Subbox]:
    by_lean_id: dict[str, Subbox] = {}
    for item in subboxes:
        if item.lean_id in by_lean_id:
            raise InputError(f"duplicate Lean subbox id {item.lean_id}")
        by_lean_id[item.lean_id] = item
    expected = skeleton.members_by_box.get(external_box_to_lean(box_id))
    if expected is None:
        raise InputError(f"skeleton has no membership case for {box_id}")
    missing = [lean_id for lean_id in expected if lean_id not in by_lean_id]
    if missing:
        raise InputError(f"{box_id}: missing source ids {missing}")
    items = [by_lean_id[lean_id] for lean_id in expected]
    extras = [item.external_id for item in subboxes if item.source_box_id == box_id and item.lean_id not in expected]
    if extras:
        raise InputError(f"{box_id}: extra source ids {extras}")
    return items


def write_if_changed(path: Path, content: str) -> str:
    encoded = content.encode("utf-8")
    if path.exists() and path.read_bytes() == encoded:
        return "unchanged"
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_name(path.name + ".tmp")
    temporary.write_bytes(encoded)
    temporary.replace(path)
    return "written"


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        description=(
            "Generate deterministic per-box Lean shards containing four raw "
            "rational rectangles and exact endpoint proofs."
        )
    )
    parser.add_argument(
        "--subboxes-jsonl",
        type=Path,
        default=DEFAULT_SUBBOXES,
        help=f"raw subbox certificate JSONL (default: {DEFAULT_SUBBOXES})",
    )
    parser.add_argument(
        "--boxes-csv",
        type=Path,
        default=DEFAULT_BOXES,
        help=f"rationalized sector box CSV (default: {DEFAULT_BOXES})",
    )
    parser.add_argument(
        "--skeleton-lean",
        type=Path,
        default=DEFAULT_SKELETON,
        help=f"Lean all-subbox skeleton (default: {DEFAULT_SKELETON})",
    )
    parser.add_argument(
        "--out-dir",
        type=Path,
        default=DEFAULT_OUT_DIR,
        help=f"directory for per-box Lean shards (default: {DEFAULT_OUT_DIR})",
    )
    parser.add_argument(
        "--only-box",
        choices=BOX_ORDER,
        help=(
            "generate one box only; use s0.84_t7 for the 32-subbox sentinel "
            "(default: generate all 27 shards)"
        ),
    )
    parser.add_argument(
        "--check-only",
        action="store_true",
        help="validate and render in memory without writing Lean files",
    )
    return parser


def main() -> int:
    args = build_parser().parse_args()
    try:
        validation = verify(args.subboxes_jsonl, args.boxes_csv, args.skeleton_lean)
        if validation["status"] != "pass":
            first = validation["failures"][:10]
            raise InputError(
                f"exact input validation failed ({validation['checks_failed']} checks): {first}"
            )
        subboxes = load_subboxes(args.subboxes_jsonl)
        constants_by_box = load_box_constants(args.boxes_csv)
        skeleton = parse_skeleton(args.skeleton_lean)
        selected_boxes = (args.only_box,) if args.only_box else BOX_ORDER
        rendered: list[tuple[Path, str]] = []
        for box_id in selected_boxes:
            items = select_and_order(subboxes, skeleton, box_id)
            content = render_shard(
                box_id,
                items,
                constants_by_box[box_id],
                skeleton,
                args.subboxes_jsonl,
                args.boxes_csv,
                args.skeleton_lean,
            )
            rendered.append((args.out_dir / shard_filename(box_id), content))
    except (InputError, OSError) as exc:
        print(f"error: {exc}", file=sys.stderr)
        return 2

    if args.check_only:
        total = sum(
            len(select_and_order(subboxes, skeleton, box_id))
            for box_id in selected_boxes
        )
        print(
            f"validated and rendered {len(rendered)} shard(s), {total} subbox "
            "certificate(s); no files written"
        )
        return 0

    states = {"written": 0, "unchanged": 0}
    for path, content in rendered:
        state = write_if_changed(path, content)
        states[state] += 1
        print(f"{state}: {display_path(path)}")
    print(
        f"generated {len(rendered)} deterministic shard(s): "
        f"written={states['written']} unchanged={states['unchanged']}"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
