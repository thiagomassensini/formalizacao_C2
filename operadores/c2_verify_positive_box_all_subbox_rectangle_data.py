#!/usr/bin/env python3
"""Verify the positive-box rectangle data with exact rational arithmetic.

The verifier reads only the raw rectangle endpoints from ``subboxes.jsonl``.
It deliberately ignores the recorded floating-point derived bounds.  The
three inequalities consumed by Lean are recomputed as rational, sqrt-free
inequalities:

* ``mainLower^2 <= M.re.lo^2 + (-M.im.hi)^2``;
* ``-(D0.re.lo*M.re.lo + D0.im.hi*M.im.hi) <= d0NegReUpper``;
* ``maxAbs(rest.re)^2 + maxAbs(rest.im)^2 <= restUpper^2``, where
  ``rest = Drest + RvecTail`` is the coordinate-wise rectangle sum.

This script does not check analytic membership in any rectangle.  That
membership remains an explicit hypothesis in Lean.
"""

from __future__ import annotations

import argparse
import csv
import hashlib
import json
import re
import sys
from collections import Counter, defaultdict
from dataclasses import dataclass
from decimal import Decimal, InvalidOperation
from fractions import Fraction
from pathlib import Path
from typing import Any, Iterable


REPO_ROOT = Path(__file__).resolve().parents[1]
DEFAULT_SUBBOXES = (
    REPO_ROOT
    / "audit_outputs/projected_j0_positive_box_sector_subbox_certificate/subboxes.jsonl"
)
DEFAULT_BOXES = (
    REPO_ROOT
    / "audit_outputs/projected_j0_positive_box_sector_rationalized_pack"
    / "boxes_sector_rationalized.csv"
)
DEFAULT_SKELETON = (
    REPO_ROOT / "LeanC2/AuditProjectedJ0PositiveBoxAllSubboxSkeleton.lean"
)

BOX_ORDER = tuple(
    [*(f"s0.84_t{i}" for i in range(9))]
    + [*(f"s0.85_t{i}" for i in range(9))]
    + [*(f"s0.86_t{i}" for i in range(9))]
)
EXPECTED_BOX_SET = frozenset(BOX_ORDER)
SENTINEL_BOX = "s0.84_t7"
SENTINEL_REGION_TUPLE = (
    Fraction(21, 25),
    Fraction(21, 25),
    Fraction(6571, 200),
    Fraction(32859, 1000),
)
RECT_PREFIXES = ("M", "D0", "Drest", "RvecTail")
REGION_FIELDS = ("sigma_min", "sigma_max", "t_min", "t_max")
RECT_SUFFIXES = ("re_lower", "re_upper", "im_lower", "im_upper")
REQUIRED_SUBBOX_FIELDS = (
    "source_box_id",
    "subbox_id",
    *REGION_FIELDS,
    *(f"{prefix}_{suffix}" for prefix in RECT_PREFIXES for suffix in RECT_SUFFIXES),
)
REQUIRED_BOX_FIELDS = (
    "source_box_id",
    *REGION_FIELDS,
    "d0_neg_re_upper_rat",
    "mainNormLowerConst_rat",
    "restUpperCombinedConst_rat",
)

EXTERNAL_ID_RE = re.compile(
    r"^(?P<box>s0\.(?:84|85|86)_t[0-8])__s(?P<sigma>\d+)_t(?P<t>\d+)$"
)
LEAN_ID_RE = re.compile(r"^s08[456]_t[0-8]_sb\d{3}$")
LEAN_BOX_RE = re.compile(r"^s08[456]_t[0-8]$")


class InputError(RuntimeError):
    """Raised when an input cannot be parsed without a silent fallback."""


@dataclass(frozen=True)
class Interval:
    lo: Fraction
    hi: Fraction

    @property
    def valid(self) -> bool:
        return self.lo <= self.hi

    @property
    def max_abs(self) -> Fraction:
        return max(abs(self.lo), abs(self.hi))

    def add(self, other: "Interval") -> "Interval":
        return Interval(self.lo + other.lo, self.hi + other.hi)


@dataclass(frozen=True)
class Rect:
    re: Interval
    im: Interval

    @property
    def valid(self) -> bool:
        return self.re.valid and self.im.valid

    def add(self, other: "Rect") -> "Rect":
        return Rect(self.re.add(other.re), self.im.add(other.im))


@dataclass(frozen=True)
class Region:
    sigma_min: Fraction
    sigma_max: Fraction
    t_min: Fraction
    t_max: Fraction

    @property
    def valid(self) -> bool:
        return self.sigma_min <= self.sigma_max and self.t_min <= self.t_max


@dataclass(frozen=True)
class Subbox:
    source_box_id: str
    external_id: str
    lean_id: str
    region: Region
    rects: dict[str, Rect]
    line_no: int


@dataclass(frozen=True)
class BoxConstants:
    source_box_id: str
    region: Region
    main_lower: Fraction
    d0_upper: Fraction
    rest_upper: Fraction
    row_no: int


@dataclass(frozen=True)
class Skeleton:
    constructors: tuple[str, ...]
    members_by_box: dict[str, tuple[str, ...]]
    regions: dict[str, Region]


class Report:
    def __init__(self) -> None:
        self.failures: list[dict[str, str]] = []

    def fail(self, check: str, detail: str) -> None:
        self.failures.append({"check": check, "detail": detail})


def reject_json_constant(token: str) -> None:
    raise InputError(f"non-finite JSON token {token!r}")


def parse_fraction(value: Any, *, context: str) -> Fraction:
    if isinstance(value, bool):
        raise InputError(f"{context}: boolean is not a rational number")
    if isinstance(value, int):
        return Fraction(value)
    if isinstance(value, Decimal):
        if not value.is_finite():
            raise InputError(f"{context}: non-finite decimal {value!r}")
        return Fraction(value)
    if isinstance(value, str):
        token = value.strip()
        if not token:
            raise InputError(f"{context}: empty numeric token")
        try:
            number = Decimal(token)
        except InvalidOperation as exc:
            raise InputError(f"{context}: invalid decimal token {value!r}") from exc
        if not number.is_finite():
            raise InputError(f"{context}: non-finite decimal {value!r}")
        return Fraction(number)
    raise InputError(f"{context}: unsupported numeric value {value!r}")


def fraction_string(value: Fraction) -> str:
    if value.denominator == 1:
        return str(value.numerator)
    return f"{value.numerator}/{value.denominator}"


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def require_fields(
    row: dict[str, Any], fields: Iterable[str], *, context: str
) -> None:
    missing = [field for field in fields if field not in row]
    if missing:
        raise InputError(f"{context}: missing fields {missing}")


def external_to_lean_id(external_id: str) -> str:
    match = EXTERNAL_ID_RE.fullmatch(external_id)
    if match is None:
        raise InputError(f"invalid external subbox id {external_id!r}")
    if int(match.group("sigma")) != 0:
        raise InputError(
            f"unsupported nonzero sigma subdivision in {external_id!r}; "
            "the current skeleton has one degenerate sigma slice"
        )
    box = match.group("box").replace("s0.", "s0")
    t_index = int(match.group("t"))
    lean_id = f"{box}_sb{t_index:03d}"
    if LEAN_ID_RE.fullmatch(lean_id) is None:
        raise InputError(f"external id {external_id!r} maps to invalid Lean id {lean_id!r}")
    return lean_id


def external_box_to_lean(box_id: str) -> str:
    if box_id not in EXPECTED_BOX_SET:
        raise InputError(f"unexpected positive-box id {box_id!r}")
    lean_id = box_id.replace("s0.", "s0")
    if LEAN_BOX_RE.fullmatch(lean_id) is None:
        raise InputError(f"box id {box_id!r} maps to invalid Lean id {lean_id!r}")
    return lean_id


def parse_q_expr(expr: str, *, context: str) -> Fraction:
    compact = re.sub(r"\s+", "", expr)
    match = re.fullmatch(r"\(\((-?\d+):ℚ\)(?:/(\d+))?\)", compact)
    if match is None:
        raise InputError(f"{context}: unsupported generated rational expression {expr!r}")
    denominator = int(match.group(2) or "1")
    if denominator == 0:
        raise InputError(f"{context}: zero denominator")
    return Fraction(int(match.group(1)), denominator)


def parse_skeleton(path: Path) -> Skeleton:
    text = path.read_text(encoding="utf-8")

    inductive_match = re.search(
        r"inductive\s+PositiveBoxSubboxId\s+where(?P<body>.*?)\s+deriving\b",
        text,
        flags=re.DOTALL,
    )
    if inductive_match is None:
        raise InputError(f"{path}: cannot find PositiveBoxSubboxId declaration")
    constructors = tuple(
        re.findall(r"\b(s08[456]_t[0-8]_sb\d{3})\b", inductive_match.group("body"))
    )
    if not constructors:
        raise InputError(f"{path}: PositiveBoxSubboxId has no recognized constructors")
    if len(constructors) != len(set(constructors)):
        raise InputError(f"{path}: duplicate PositiveBoxSubboxId constructors")

    members_match = re.search(
        r"def\s+positiveBoxSubboxesOf\b(?P<body>.*?)"
        r"\ndef\s+positiveBoxSubboxRect\b",
        text,
        flags=re.DOTALL,
    )
    if members_match is None:
        raise InputError(f"{path}: cannot isolate positiveBoxSubboxesOf")
    members_by_box: dict[str, tuple[str, ...]] = {}
    for case in re.finditer(
        r"\|\s+\.(?P<box>s08[456]_t[0-8])\s*=>\s*"
        r"\[(?P<items>.*?)\]\.toFinset",
        members_match.group("body"),
        flags=re.DOTALL,
    ):
        box = case.group("box")
        if box in members_by_box:
            raise InputError(f"{path}: duplicate positiveBoxSubboxesOf case {box}")
        members_by_box[box] = tuple(
            re.findall(
                r"PositiveBoxSubboxId\.(s08[456]_t[0-8]_sb\d{3})",
                case.group("items"),
            )
        )

    rect_match = re.search(
        r"def\s+positiveBoxSubboxRect\b(?P<body>.*?)"
        r"\ndef\s+positiveBoxSubboxRegion\b",
        text,
        flags=re.DOTALL,
    )
    if rect_match is None:
        raise InputError(f"{path}: cannot isolate positiveBoxSubboxRect")
    regions: dict[str, Region] = {}
    rect_case_re = re.compile(
        r"\|\s+\.(?P<id>s08[456]_t[0-8]_sb\d{3})\s*=>\s*"
        r"\{\s*sigmaMin\s*:=\s*(?P<sigma_min>[^\n]+)\n"
        r"\s*sigmaMax\s*:=\s*(?P<sigma_max>[^\n]+)\n"
        r"\s*tMin\s*:=\s*(?P<t_min>[^\n]+)\n"
        r"\s*tMax\s*:=\s*(?P<t_max>[^\n}]+)\s*\}",
    )
    for case in rect_case_re.finditer(rect_match.group("body")):
        lean_id = case.group("id")
        if lean_id in regions:
            raise InputError(f"{path}: duplicate positiveBoxSubboxRect case {lean_id}")
        regions[lean_id] = Region(
            sigma_min=parse_q_expr(
                case.group("sigma_min"), context=f"{path}:{lean_id}:sigmaMin"
            ),
            sigma_max=parse_q_expr(
                case.group("sigma_max"), context=f"{path}:{lean_id}:sigmaMax"
            ),
            t_min=parse_q_expr(case.group("t_min"), context=f"{path}:{lean_id}:tMin"),
            t_max=parse_q_expr(case.group("t_max"), context=f"{path}:{lean_id}:tMax"),
        )

    return Skeleton(constructors, members_by_box, regions)


def rect_from_row(row: dict[str, Any], prefix: str, *, context: str) -> Rect:
    return Rect(
        re=Interval(
            parse_fraction(row[f"{prefix}_re_lower"], context=f"{context}:{prefix}.re.lo"),
            parse_fraction(row[f"{prefix}_re_upper"], context=f"{context}:{prefix}.re.hi"),
        ),
        im=Interval(
            parse_fraction(row[f"{prefix}_im_lower"], context=f"{context}:{prefix}.im.lo"),
            parse_fraction(row[f"{prefix}_im_upper"], context=f"{context}:{prefix}.im.hi"),
        ),
    )


def load_subboxes(path: Path) -> list[Subbox]:
    rows: list[Subbox] = []
    with path.open("r", encoding="utf-8") as handle:
        for line_no, line in enumerate(handle, start=1):
            token = line.strip()
            if not token:
                continue
            try:
                raw = json.loads(
                    token,
                    parse_float=Decimal,
                    parse_constant=reject_json_constant,
                )
            except (json.JSONDecodeError, InputError) as exc:
                raise InputError(f"{path}:{line_no}: invalid JSON: {exc}") from exc
            if not isinstance(raw, dict):
                raise InputError(f"{path}:{line_no}: expected a JSON object")
            context = f"{path}:{line_no}"
            require_fields(raw, REQUIRED_SUBBOX_FIELDS, context=context)
            source_box_id = str(raw["source_box_id"])
            external_id = str(raw["subbox_id"])
            match = EXTERNAL_ID_RE.fullmatch(external_id)
            if match is None:
                raise InputError(f"{context}: malformed subbox_id {external_id!r}")
            if match.group("box") != source_box_id:
                raise InputError(
                    f"{context}: source_box_id {source_box_id!r} disagrees with "
                    f"subbox_id {external_id!r}"
                )
            region = Region(
                **{
                    field: parse_fraction(raw[field], context=f"{context}:{field}")
                    for field in REGION_FIELDS
                }
            )
            rows.append(
                Subbox(
                    source_box_id=source_box_id,
                    external_id=external_id,
                    lean_id=external_to_lean_id(external_id),
                    region=region,
                    rects={
                        prefix: rect_from_row(raw, prefix, context=context)
                        for prefix in RECT_PREFIXES
                    },
                    line_no=line_no,
                )
            )
    return rows


def load_box_constants(path: Path) -> dict[str, BoxConstants]:
    out: dict[str, BoxConstants] = {}
    with path.open("r", encoding="utf-8", newline="") as handle:
        reader = csv.DictReader(handle)
        if reader.fieldnames is None:
            raise InputError(f"{path}: missing CSV header")
        missing_headers = [field for field in REQUIRED_BOX_FIELDS if field not in reader.fieldnames]
        if missing_headers:
            raise InputError(f"{path}: missing CSV columns {missing_headers}")
        for row_no, row in enumerate(reader, start=2):
            context = f"{path}:{row_no}"
            box_id = row["source_box_id"]
            if box_id in out:
                raise InputError(f"{context}: duplicate source_box_id {box_id!r}")
            out[box_id] = BoxConstants(
                source_box_id=box_id,
                region=Region(
                    **{
                        field: parse_fraction(row[field], context=f"{context}:{field}")
                        for field in REGION_FIELDS
                    }
                ),
                main_lower=parse_fraction(
                    row["mainNormLowerConst_rat"], context=f"{context}:mainLower"
                ),
                d0_upper=parse_fraction(
                    row["d0_neg_re_upper_rat"], context=f"{context}:d0NegReUpper"
                ),
                rest_upper=parse_fraction(
                    row["restUpperCombinedConst_rat"], context=f"{context}:restUpper"
                ),
                row_no=row_no,
            )
    return out


def interval_mul(a: Interval, b: Interval) -> Interval:
    products = (a.lo * b.lo, a.lo * b.hi, a.hi * b.lo, a.hi * b.hi)
    return Interval(min(products), max(products))


def d0_neg_re_general(d0: Rect, main: Rect) -> Interval:
    re_product = interval_mul(d0.re, main.re)
    im_product = interval_mul(d0.im, main.im)
    real_part = re_product.add(im_product)
    return Interval(-real_part.hi, -real_part.lo)


def verify(
    subboxes_path: Path,
    boxes_path: Path,
    skeleton_path: Path,
) -> dict[str, Any]:
    for path in (subboxes_path, boxes_path, skeleton_path):
        if not path.is_file():
            raise InputError(f"required input does not exist: {path}")

    subboxes = load_subboxes(subboxes_path)
    boxes = load_box_constants(boxes_path)
    skeleton = parse_skeleton(skeleton_path)
    report = Report()

    external_counts = Counter(item.external_id for item in subboxes)
    lean_counts = Counter(item.lean_id for item in subboxes)
    duplicate_external = sorted(key for key, count in external_counts.items() if count != 1)
    duplicate_lean = sorted(key for key, count in lean_counts.items() if count != 1)
    if duplicate_external:
        report.fail("duplicate_external_ids", ", ".join(duplicate_external[:20]))
    if duplicate_lean:
        report.fail("duplicate_lean_ids", ", ".join(duplicate_lean[:20]))

    constructor_set = set(skeleton.constructors)
    external_lean_set = set(lean_counts)
    missing_ids = sorted(constructor_set - external_lean_set)
    extra_ids = sorted(external_lean_set - constructor_set)
    if missing_ids:
        report.fail("missing_skeleton_ids", ", ".join(missing_ids[:20]))
    if extra_ids:
        report.fail("extra_external_ids", ", ".join(extra_ids[:20]))

    expected_lean_boxes = {external_box_to_lean(box_id) for box_id in BOX_ORDER}
    member_box_set = set(skeleton.members_by_box)
    if member_box_set != expected_lean_boxes:
        report.fail(
            "skeleton_member_boxes",
            f"missing={sorted(expected_lean_boxes - member_box_set)} "
            f"extra={sorted(member_box_set - expected_lean_boxes)}",
        )
    member_ids = [
        lean_id
        for box_id in sorted(skeleton.members_by_box)
        for lean_id in skeleton.members_by_box[box_id]
    ]
    member_counts = Counter(member_ids)
    duplicate_members = sorted(key for key, count in member_counts.items() if count != 1)
    if duplicate_members:
        report.fail("duplicate_skeleton_members", ", ".join(duplicate_members[:20]))
    if set(member_ids) != constructor_set:
        report.fail(
            "skeleton_membership_bijection",
            f"missing={sorted(constructor_set - set(member_ids))[:20]} "
            f"extra={sorted(set(member_ids) - constructor_set)[:20]}",
        )
    if set(skeleton.regions) != constructor_set:
        report.fail(
            "skeleton_region_bijection",
            f"missing={sorted(constructor_set - set(skeleton.regions))[:20]} "
            f"extra={sorted(set(skeleton.regions) - constructor_set)[:20]}",
        )

    box_set = set(boxes)
    if box_set != EXPECTED_BOX_SET:
        report.fail(
            "box_csv_bijection",
            f"missing={sorted(EXPECTED_BOX_SET - box_set)} "
            f"extra={sorted(box_set - EXPECTED_BOX_SET)}",
        )

    by_box: dict[str, list[Subbox]] = defaultdict(list)
    invalid_regions = 0
    region_mismatches = 0
    membership_mismatches = 0
    invalid_rectangles = 0
    sign_failures = 0
    comparison_failures = 0
    for item in subboxes:
        by_box[item.source_box_id].append(item)
        if not item.region.valid:
            invalid_regions += 1
            report.fail("invalid_subbox_region", item.external_id)
        skeleton_region = skeleton.regions.get(item.lean_id)
        if skeleton_region != item.region:
            region_mismatches += 1
            report.fail(
                "subbox_region_mismatch",
                f"{item.external_id}: external={item.region!r} skeleton={skeleton_region!r}",
            )
        expected_member_box = external_box_to_lean(item.source_box_id)
        if item.lean_id not in skeleton.members_by_box.get(expected_member_box, ()):
            membership_mismatches += 1
            report.fail(
                "subbox_membership_mismatch",
                f"{item.external_id} is not in {expected_member_box}",
            )

        invalid = [prefix for prefix, rect in item.rects.items() if not rect.valid]
        if invalid:
            invalid_rectangles += 1
            report.fail("invalid_rectangle", f"{item.external_id}: {invalid}")
            continue

        main = item.rects["M"]
        d0 = item.rects["D0"]
        signs = {
            "M.re.lo_nonneg": main.re.lo >= 0,
            "M.im.hi_nonpos": main.im.hi <= 0,
            "D0.re.lo_nonneg": d0.re.lo >= 0,
            "D0.im.hi_nonpos": d0.im.hi <= 0,
        }
        for name, ok in signs.items():
            if not ok:
                sign_failures += 1
                report.fail("sign_condition", f"{item.external_id}: {name}")

        constants = boxes.get(item.source_box_id)
        if constants is None:
            comparison_failures += 1
            report.fail("missing_box_constants", item.source_box_id)
            continue

        main_sq_available = main.re.lo**2 + (-main.im.hi) ** 2
        main_ok = (
            constants.main_lower >= 0
            and constants.main_lower**2 <= main_sq_available
        )

        d0_endpoint_upper = -(
            d0.re.lo * main.re.lo + d0.im.hi * main.im.hi
        )
        general_upper = d0_neg_re_general(d0, main).hi
        d0_ok = (
            d0_endpoint_upper == general_upper
            and d0_endpoint_upper <= constants.d0_upper
            and constants.d0_upper <= 0
        )

        rest = item.rects["Drest"].add(item.rects["RvecTail"])
        rest_sq_needed = rest.re.max_abs**2 + rest.im.max_abs**2
        rest_ok = (
            constants.rest_upper >= 0
            and rest_sq_needed <= constants.rest_upper**2
        )
        budget_ok = constants.main_lower - constants.rest_upper > 0

        for name, ok, detail in (
            (
                "main_lower_sq",
                main_ok,
                f"{fraction_string(constants.main_lower**2)} <= "
                f"{fraction_string(main_sq_available)}",
            ),
            (
                "d0_upper",
                d0_ok,
                f"{fraction_string(d0_endpoint_upper)} <= "
                f"{fraction_string(constants.d0_upper)} <= 0",
            ),
            (
                "rest_combined_upper_sq",
                rest_ok,
                f"{fraction_string(rest_sq_needed)} <= "
                f"{fraction_string(constants.rest_upper**2)}",
            ),
            (
                "sector_budget",
                budget_ok,
                f"{fraction_string(constants.main_lower - constants.rest_upper)} > 0",
            ),
        ):
            if not ok:
                comparison_failures += 1
                report.fail(name, f"{item.external_id}: {detail}")

    box_region_mismatches = 0
    for box_id in BOX_ORDER:
        constants = boxes.get(box_id)
        items = by_box.get(box_id, [])
        if constants is None or not items:
            continue
        aggregate = Region(
            sigma_min=min(item.region.sigma_min for item in items),
            sigma_max=max(item.region.sigma_max for item in items),
            t_min=min(item.region.t_min for item in items),
            t_max=max(item.region.t_max for item in items),
        )
        if constants.region != aggregate:
            box_region_mismatches += 1
            report.fail(
                "box_region_mismatch",
                f"{box_id}: csv={constants.region!r} aggregate={aggregate!r}",
            )
        expected_members = set(
            skeleton.members_by_box.get(external_box_to_lean(box_id), ())
        )
        actual_members = {item.lean_id for item in items}
        if expected_members != actual_members:
            membership_mismatches += 1
            report.fail(
                "box_member_set_mismatch",
                f"{box_id}: missing={sorted(expected_members - actual_members)[:20]} "
                f"extra={sorted(actual_members - expected_members)[:20]}",
            )

    counts_by_box = {box_id: len(by_box.get(box_id, ())) for box_id in BOX_ORDER}
    if len(skeleton.constructors) != 771:
        report.fail(
            "skeleton_constructor_count", f"expected 771, got {len(skeleton.constructors)}"
        )
    if len(subboxes) != 771:
        report.fail("subbox_count", f"expected 771, got {len(subboxes)}")
    if len(boxes) != 27:
        report.fail("box_count", f"expected 27, got {len(boxes)}")
    if counts_by_box.get(SENTINEL_BOX) != 32:
        report.fail(
            "sentinel_count",
            f"expected 32, got {counts_by_box.get(SENTINEL_BOX, 0)}",
        )
    sentinel_expected_region = Region(*SENTINEL_REGION_TUPLE)
    sentinel_constants = boxes.get(SENTINEL_BOX)
    if sentinel_constants is None or sentinel_constants.region != sentinel_expected_region:
        report.fail(
            "sentinel_region",
            f"expected={sentinel_expected_region!r} "
            f"actual={getattr(sentinel_constants, 'region', None)!r}",
        )

    return {
        "status": "pass" if not report.failures else "fail",
        "checks_failed": len(report.failures),
        "boxes_count": len(boxes),
        "subboxes_count": len(subboxes),
        "skeleton_ids_count": len(skeleton.constructors),
        "sentinel_box": SENTINEL_BOX,
        "sentinel_subboxes_count": counts_by_box.get(SENTINEL_BOX, 0),
        "missing_ids_count": len(missing_ids),
        "extra_ids_count": len(extra_ids),
        "duplicate_external_ids_count": len(duplicate_external),
        "duplicate_lean_ids_count": len(duplicate_lean),
        "region_mismatches_count": region_mismatches,
        "box_region_mismatches_count": box_region_mismatches,
        "membership_mismatches_count": membership_mismatches,
        "invalid_regions_count": invalid_regions,
        "invalid_rectangles_count": invalid_rectangles,
        "sign_failures_count": sign_failures,
        "rational_comparison_failures_count": comparison_failures,
        "combined_rest": True,
        "counts_by_box": counts_by_box,
        "inputs": {
            "subboxes_jsonl": str(subboxes_path),
            "subboxes_jsonl_sha256": sha256(subboxes_path),
            "boxes_rationalized_csv": str(boxes_path),
            "boxes_rationalized_csv_sha256": sha256(boxes_path),
            "skeleton_lean": str(skeleton_path),
            "skeleton_lean_sha256": sha256(skeleton_path),
        },
        "failures": report.failures,
        "statement": (
            "Exact rational rectangle data and arithmetic only; analytic "
            "rectangle membership is not proved by this verifier."
        ),
    }


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        description=(
            "Independently verify all 27/771 positive-box raw rectangles and "
            "their exact rational projected-j0 inequalities."
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
        "--json-output",
        type=Path,
        help="optional path for the deterministic JSON verification report",
    )
    parser.add_argument(
        "--quiet",
        action="store_true",
        help="suppress the JSON report on stdout",
    )
    return parser


def main() -> int:
    args = build_parser().parse_args()
    try:
        result = verify(args.subboxes_jsonl, args.boxes_csv, args.skeleton_lean)
    except (InputError, OSError) as exc:
        print(f"error: {exc}", file=sys.stderr)
        return 2

    rendered = json.dumps(result, indent=2, sort_keys=True) + "\n"
    if args.json_output is not None:
        args.json_output.parent.mkdir(parents=True, exist_ok=True)
        args.json_output.write_text(rendered, encoding="utf-8")
    if not args.quiet:
        print(rendered, end="")
    return 0 if result["status"] == "pass" else 1


if __name__ == "__main__":
    raise SystemExit(main())
