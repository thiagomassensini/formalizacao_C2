#!/usr/bin/env python3
"""
Independent rectangle-arithmetic verifier for projected-j0 sector subboxes.

This verifier does not import the certifier or evaluator. It reads the raw
complex rectangles emitted in subboxes.jsonl and recomputes the derived
quantities used by the sector certificate:

  - D0NegReMain upper from D0 and M rectangles;
  - main norm lower from the M rectangle;
  - combined rest norm upper from Drest + RvecTail rectangles.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import math
import subprocess
from collections import defaultdict
from dataclasses import dataclass
from decimal import Decimal, localcontext
from pathlib import Path
from typing import Any


REQUIRED_RECT_FIELDS = [
    "M_re_lower", "M_re_upper", "M_im_lower", "M_im_upper",
    "D0_re_lower", "D0_re_upper", "D0_im_lower", "D0_im_upper",
    "Drest_re_lower", "Drest_re_upper", "Drest_im_lower", "Drest_im_upper",
    "RvecTail_re_lower", "RvecTail_re_upper", "RvecTail_im_lower", "RvecTail_im_upper",
]


@dataclass(frozen=True)
class DRect:
    re_lower: Decimal
    re_upper: Decimal
    im_lower: Decimal
    im_upper: Decimal


class CheckLog:
    def __init__(self) -> None:
        self.passed: list[dict[str, str]] = []
        self.failed: list[dict[str, str]] = []

    def ok(self, name: str, detail: str = "") -> None:
        self.passed.append({"name": name, "detail": detail})

    def fail(self, name: str, detail: str = "") -> None:
        self.failed.append({"name": name, "detail": detail})


def d(value: Any) -> Decimal:
    if isinstance(value, Decimal):
        return value
    return Decimal(str(value))


def dec_to_str(value: Decimal) -> str:
    if value.is_nan():
        return "nan"
    if value == Decimal("Infinity"):
        return "inf"
    if value == Decimal("-Infinity"):
        return "-inf"
    return format(value, "f")


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


def read_json(path: Path) -> Any:
    return json.loads(path.read_text(), parse_float=Decimal)


def read_jsonl(path: Path) -> list[dict[str, Any]]:
    rows: list[dict[str, Any]] = []
    with path.open() as f:
        for line_no, line in enumerate(f, 1):
            text = line.strip()
            if not text:
                continue
            row = json.loads(text, parse_float=Decimal)
            row["_line_no"] = line_no
            rows.append(row)
    return rows


def rect_from_row(row: dict[str, Any], prefix: str) -> DRect:
    return DRect(
        re_lower=d(row[f"{prefix}_re_lower"]),
        re_upper=d(row[f"{prefix}_re_upper"]),
        im_lower=d(row[f"{prefix}_im_lower"]),
        im_upper=d(row[f"{prefix}_im_upper"]),
    )


def interval_mul(a_lower: Decimal, a_upper: Decimal, b_lower: Decimal, b_upper: Decimal) -> tuple[Decimal, Decimal]:
    values = (
        a_lower * b_lower,
        a_lower * b_upper,
        a_upper * b_lower,
        a_upper * b_upper,
    )
    return min(values), max(values)


def interval_add(a: tuple[Decimal, Decimal], b: tuple[Decimal, Decimal]) -> tuple[Decimal, Decimal]:
    return a[0] + b[0], a[1] + b[1]


def interval_neg(a: tuple[Decimal, Decimal]) -> tuple[Decimal, Decimal]:
    return -a[1], -a[0]


def interval_contains_zero(lower: Decimal, upper: Decimal) -> bool:
    return lower <= 0 <= upper


def min_abs_interval(lower: Decimal, upper: Decimal) -> Decimal:
    if interval_contains_zero(lower, upper):
        return Decimal(0)
    return min(abs(lower), abs(upper))


def sqrt_decimal(value: Decimal, prec: int) -> Decimal:
    if value < 0:
        raise ValueError(f"sqrt of negative Decimal: {value}")
    with localcontext() as ctx:
        ctx.prec = int(prec)
        return ctx.sqrt(value)


def sqrt_floor(value: Decimal, prec: int, inflate: Decimal) -> Decimal:
    out = sqrt_decimal(value, prec) - inflate
    return max(Decimal(0), out)


def sqrt_ceil(value: Decimal, prec: int, inflate: Decimal) -> Decimal:
    return sqrt_decimal(value, prec) + inflate


def rect_abs_lower(rect: DRect, prec: int, inflate: Decimal) -> Decimal:
    re_abs = min_abs_interval(rect.re_lower, rect.re_upper)
    im_abs = min_abs_interval(rect.im_lower, rect.im_upper)
    return sqrt_floor(re_abs * re_abs + im_abs * im_abs, prec, inflate)


def rect_abs_upper(rect: DRect, prec: int, inflate: Decimal) -> Decimal:
    values = []
    for re in (rect.re_lower, rect.re_upper):
        for im in (rect.im_lower, rect.im_upper):
            values.append(re * re + im * im)
    return sqrt_ceil(max(values), prec, inflate)


def rect_add(a: DRect, b: DRect) -> DRect:
    return DRect(
        re_lower=a.re_lower + b.re_lower,
        re_upper=a.re_upper + b.re_upper,
        im_lower=a.im_lower + b.im_lower,
        im_upper=a.im_upper + b.im_upper,
    )


def d0_neg_re_interval(d0: DRect, main: DRect) -> tuple[Decimal, Decimal]:
    xu = interval_mul(d0.re_lower, d0.re_upper, main.re_lower, main.re_upper)
    yv = interval_mul(d0.im_lower, d0.im_upper, main.im_lower, main.im_upper)
    real_part = interval_add(xu, yv)
    return interval_neg(real_part)


def le_with_tol(a: Decimal, b: Decimal, tol: Decimal) -> bool:
    return a <= b + tol


def ge_with_tol(a: Decimal, b: Decimal, tol: Decimal) -> bool:
    return a + tol >= b


def require_files(log: CheckLog, paths: dict[str, Path]) -> None:
    for name, path in paths.items():
        if path.exists():
            log.ok(f"exists:{name}", str(path))
        else:
            log.fail(f"exists:{name}", str(path))


def verify_required_fields(log: CheckLog, subboxes: list[dict[str, Any]]) -> None:
    missing: dict[str, list[str]] = {}
    for row in subboxes:
        absent = [field for field in REQUIRED_RECT_FIELDS if field not in row]
        if absent:
            missing[str(row.get("subbox_id", row.get("_line_no", "?")))] = absent
    if missing:
        detail = "; ".join(f"{k}:{','.join(v)}" for k, v in list(missing.items())[:10])
        log.fail("required_rectangle_fields", detail)
    else:
        log.ok("required_rectangle_fields")


def verify_coverage(
    log: CheckLog,
    subboxes_by_box: dict[str, list[dict[str, Any]]],
    summaries_by_box: dict[str, dict[str, Any]],
    tol: Decimal,
) -> None:
    for box_id, summary in summaries_by_box.items():
        rows = sorted(
            subboxes_by_box.get(box_id, []),
            key=lambda row: (d(row["sigma_min"]), d(row["t_min"]), str(row["subbox_id"])),
        )
        if not rows:
            log.fail(f"coverage:{box_id}", "no subboxes")
            continue
        sigma_min = d(summary["sigma_min"])
        sigma_max = d(summary["sigma_max"])
        t_min = d(summary["t_min"])
        t_max = d(summary["t_max"])
        if all(abs(d(row["sigma_min"]) - sigma_min) <= tol and abs(d(row["sigma_max"]) - sigma_max) <= tol for row in rows):
            log.ok(f"coverage_sigma:{box_id}")
        else:
            log.fail(f"coverage_sigma:{box_id}")
        if abs(d(rows[0]["t_min"]) - t_min) <= tol and abs(d(rows[-1]["t_max"]) - t_max) <= tol:
            log.ok(f"coverage_t_endpoints:{box_id}")
        else:
            log.fail(
                f"coverage_t_endpoints:{box_id}",
                f"[{rows[0]['t_min']},{rows[-1]['t_max']}] vs [{t_min},{t_max}]",
            )
        ok_grid = True
        for prev, cur in zip(rows, rows[1:]):
            gap = d(cur["t_min"]) - d(prev["t_max"])
            if abs(gap) > tol:
                ok_grid = False
                log.fail(f"coverage_t_gap:{box_id}", f"{prev['subbox_id']} -> {cur['subbox_id']} gap={gap}")
                break
        if ok_grid:
            log.ok(f"coverage_t_no_gaps:{box_id}")
        ok_overlap = True
        for prev, cur in zip(rows, rows[1:]):
            overlap = d(prev["t_max"]) - d(cur["t_min"])
            if overlap > tol:
                ok_overlap = False
                log.fail(f"coverage_t_overlap:{box_id}", f"{prev['subbox_id']} -> {cur['subbox_id']} overlap={overlap}")
                break
        if ok_overlap:
            log.ok(f"coverage_t_no_overlap:{box_id}")


def recompute_subboxes(
    log: CheckLog,
    subboxes: list[dict[str, Any]],
    prec: int,
    sqrt_inflate: Decimal,
    tol: Decimal,
) -> tuple[list[dict[str, Any]], dict[str, Any]]:
    recomputed: list[dict[str, Any]] = []
    max_d0_recomputed = Decimal("-Infinity")
    max_d0_recorded = Decimal("-Infinity")
    min_main_recomputed = Decimal("Infinity")
    min_main_recorded = Decimal("Infinity")
    max_rest_recomputed = Decimal("-Infinity")
    max_rest_recorded = Decimal("-Infinity")
    max_rest_separate_recomputed = Decimal("-Infinity")
    max_rest_separate_recorded = Decimal("-Infinity")
    max_subbox_d0_violation = Decimal(0)
    max_subbox_main_violation = Decimal(0)
    max_subbox_rest_violation = Decimal(0)

    for row in subboxes:
        subbox_id = str(row["subbox_id"])
        main = rect_from_row(row, "M")
        d0 = rect_from_row(row, "D0")
        drest = rect_from_row(row, "Drest")
        rvec = rect_from_row(row, "RvecTail")

        d0_neg = d0_neg_re_interval(d0, main)
        d0_upper_recomputed = d0_neg[1]
        main_lower_recomputed = rect_abs_lower(main, prec, sqrt_inflate)
        rest_combined = rect_add(drest, rvec)
        rest_upper_recomputed = rect_abs_upper(rest_combined, prec, sqrt_inflate)
        drest_upper_recomputed = rect_abs_upper(drest, prec, sqrt_inflate)
        rvec_upper_recomputed = rect_abs_upper(rvec, prec, sqrt_inflate)
        rest_separate_upper_recomputed = drest_upper_recomputed + rvec_upper_recomputed

        d0_recorded = d(row["D0NegReMain_upper"])
        main_recorded = d(row["main_abs_lower"])
        rest_recorded = d(row["rest_combined_upper"])
        rest_separate_recorded = d(row.get("rest_separate_upper", "NaN"))

        if ge_with_tol(d0_recorded, d0_upper_recomputed, tol):
            log.ok(f"subbox_d0_upper:{subbox_id}")
        else:
            violation = d0_upper_recomputed - d0_recorded
            max_subbox_d0_violation = max(max_subbox_d0_violation, violation)
            log.fail(f"subbox_d0_upper:{subbox_id}", f"recorded={d0_recorded} recomputed={d0_upper_recomputed}")

        if le_with_tol(main_recorded, main_lower_recomputed, tol):
            log.ok(f"subbox_main_lower:{subbox_id}")
        else:
            violation = main_recorded - main_lower_recomputed
            max_subbox_main_violation = max(max_subbox_main_violation, violation)
            log.fail(f"subbox_main_lower:{subbox_id}", f"recorded={main_recorded} recomputed={main_lower_recomputed}")

        if ge_with_tol(rest_recorded, rest_upper_recomputed, tol):
            log.ok(f"subbox_rest_upper:{subbox_id}")
        else:
            violation = rest_upper_recomputed - rest_recorded
            max_subbox_rest_violation = max(max_subbox_rest_violation, violation)
            log.fail(f"subbox_rest_upper:{subbox_id}", f"recorded={rest_recorded} recomputed={rest_upper_recomputed}")

        if not rest_separate_recorded.is_nan():
            if ge_with_tol(rest_separate_recorded, rest_separate_upper_recomputed, tol):
                log.ok(f"subbox_rest_separate_upper:{subbox_id}")
            else:
                log.fail(
                    f"subbox_rest_separate_upper:{subbox_id}",
                    f"recorded={rest_separate_recorded} recomputed={rest_separate_upper_recomputed}",
                )

        max_d0_recomputed = max(max_d0_recomputed, d0_upper_recomputed)
        max_d0_recorded = max(max_d0_recorded, d0_recorded)
        min_main_recomputed = min(min_main_recomputed, main_lower_recomputed)
        min_main_recorded = min(min_main_recorded, main_recorded)
        max_rest_recomputed = max(max_rest_recomputed, rest_upper_recomputed)
        max_rest_recorded = max(max_rest_recorded, rest_recorded)
        max_rest_separate_recomputed = max(max_rest_separate_recomputed, rest_separate_upper_recomputed)
        if not rest_separate_recorded.is_nan():
            max_rest_separate_recorded = max(max_rest_separate_recorded, rest_separate_recorded)

        recomputed.append(
            {
                "source_box_id": row["source_box_id"],
                "subbox_id": subbox_id,
                "d0_upper_recomputed": d0_upper_recomputed,
                "d0_upper_recorded": d0_recorded,
                "main_lower_recomputed": main_lower_recomputed,
                "main_lower_recorded": main_recorded,
                "rest_upper_recomputed": rest_upper_recomputed,
                "rest_upper_recorded": rest_recorded,
                "rest_separate_upper_recomputed": rest_separate_upper_recomputed,
                "rest_separate_upper_recorded": rest_separate_recorded,
            }
        )

    metrics = {
        "max_d0_upper_recomputed": max_d0_recomputed,
        "max_d0_upper_recorded": max_d0_recorded,
        "min_main_lower_recomputed": min_main_recomputed,
        "min_main_lower_recorded": min_main_recorded,
        "max_rest_upper_recomputed": max_rest_recomputed,
        "max_rest_upper_recorded": max_rest_recorded,
        "max_rest_separate_upper_recomputed": max_rest_separate_recomputed,
        "max_rest_separate_upper_recorded": max_rest_separate_recorded,
        "max_subbox_d0_violation": max_subbox_d0_violation,
        "max_subbox_main_violation": max_subbox_main_violation,
        "max_subbox_rest_violation": max_subbox_rest_violation,
    }
    return recomputed, metrics


def verify_box_rationals(
    log: CheckLog,
    recomputed: list[dict[str, Any]],
    summaries_by_box: dict[str, dict[str, Any]],
    rat_rows: list[dict[str, Any]],
    tol: Decimal,
) -> dict[str, Decimal | str]:
    by_box: dict[str, list[dict[str, Any]]] = defaultdict(list)
    for row in recomputed:
        by_box[str(row["source_box_id"])].append(row)
    rat_by_box = {str(row["source_box_id"]): row for row in rat_rows}

    max_d0_rat = Decimal("-Infinity")
    min_main_rat = Decimal("Infinity")
    max_rest_rat = Decimal("-Infinity")
    max_rest_separate_rat = Decimal("-Infinity")
    min_budget_rat = Decimal("Infinity")
    worst_box = ""
    max_slack_d0 = Decimal("-Infinity")
    min_slack_main = Decimal("Infinity")
    max_slack_rest = Decimal("-Infinity")
    min_slack_rest = Decimal("Infinity")

    for box_id, summary in summaries_by_box.items():
        rows = by_box.get(box_id, [])
        rat = rat_by_box.get(box_id)
        if not rows or rat is None:
            log.fail(f"box_rat_exists:{box_id}", "missing recomputed rows or rationalized row")
            continue
        main_min = min(row["main_lower_recomputed"] for row in rows)
        d0_max = max(row["d0_upper_recomputed"] for row in rows)
        rest_max = max(row["rest_upper_recomputed"] for row in rows)
        rest_separate_max = max(row["rest_separate_upper_recomputed"] for row in rows)

        main_rat = d(rat["mainNormLowerConst_rat"])
        d0_rat = d(rat["d0_neg_re_upper_rat"])
        rest_rat = d(rat["restUpperCombinedConst_rat"])
        rest_separate_rat = d(rat["restUpperSeparateConst_rat"])
        budget_rat = main_rat - rest_rat

        if le_with_tol(main_rat, main_min, tol):
            log.ok(f"rat_main_lower:{box_id}")
        else:
            log.fail(f"rat_main_lower:{box_id}", f"rat={main_rat} recomputed_min={main_min}")
        if ge_with_tol(d0_rat, d0_max, tol):
            log.ok(f"rat_d0_upper:{box_id}")
        else:
            log.fail(f"rat_d0_upper:{box_id}", f"rat={d0_rat} recomputed_max={d0_max}")
        if ge_with_tol(rest_rat, rest_max, tol):
            log.ok(f"rat_rest_upper:{box_id}")
        else:
            log.fail(f"rat_rest_upper:{box_id}", f"rat={rest_rat} recomputed_max={rest_max}")
        if ge_with_tol(rest_separate_rat, rest_separate_max, tol):
            log.ok(f"rat_rest_separate_upper:{box_id}")
        else:
            log.fail(
                f"rat_rest_separate_upper:{box_id}",
                f"rat={rest_separate_rat} recomputed_max={rest_separate_max}",
            )
        if d0_rat <= 0:
            log.ok(f"rat_d0_nonpositive:{box_id}")
        else:
            log.fail(f"rat_d0_nonpositive:{box_id}", str(d0_rat))
        if main_rat > 0:
            log.ok(f"rat_main_positive:{box_id}")
        else:
            log.fail(f"rat_main_positive:{box_id}", str(main_rat))
        if rest_rat >= 0:
            log.ok(f"rat_rest_nonnegative:{box_id}")
        else:
            log.fail(f"rat_rest_nonnegative:{box_id}", str(rest_rat))
        if budget_rat > 0:
            log.ok(f"rat_budget_positive:{box_id}")
        else:
            log.fail(f"rat_budget_positive:{box_id}", str(budget_rat))

        max_d0_rat = max(max_d0_rat, d0_rat)
        min_main_rat = min(min_main_rat, main_rat)
        max_rest_rat = max(max_rest_rat, rest_rat)
        max_rest_separate_rat = max(max_rest_separate_rat, rest_separate_rat)
        if budget_rat < min_budget_rat:
            min_budget_rat = budget_rat
            worst_box = box_id
        max_slack_d0 = max(max_slack_d0, d0_rat - d0_max)
        main_slack = main_min - main_rat
        min_slack_main = min(min_slack_main, main_slack)
        rest_slack = rest_rat - rest_max
        max_slack_rest = max(max_slack_rest, rest_slack)
        min_slack_rest = min(min_slack_rest, rest_slack)

    return {
        "max_d0_upper_rat": max_d0_rat,
        "min_main_lower_rat": min_main_rat,
        "max_rest_upper_rat": max_rest_rat,
        "max_rest_separate_upper_rat": max_rest_separate_rat,
        "min_sector_budget_rat": min_budget_rat,
        "worst_box": worst_box,
        "max_slack_d0_upper": max_slack_d0,
        "min_slack_main_lower": min_slack_main,
        "max_slack_rest_upper": max_slack_rest,
        "min_slack_rest_upper": min_slack_rest,
    }


def stringify(obj: Any) -> Any:
    if isinstance(obj, Decimal):
        return dec_to_str(obj)
    if isinstance(obj, Path):
        return str(obj)
    if isinstance(obj, dict):
        return {k: stringify(v) for k, v in obj.items()}
    if isinstance(obj, list):
        return [stringify(v) for v in obj]
    return obj


def write_report(path: Path, result: dict[str, Any]) -> None:
    failed_count = len(result["checks_failed"])
    status = "passa" if failed_count == 0 else "falha"
    path.write_text(
        "# Audit Projected J0 Positive Box Sector Rect Verification\n\n"
        "Rota: Genuine-First. Este verificador e independente do certifier: "
        "ele le os retangulos complexos ja emitidos por subcaixa e recomputa "
        "apenas a algebra retangular derivada.\n\n"
        "## Resultado\n\n"
        f"- Status: {status}\n"
        f"- Checks failed: {failed_count}\n"
        f"- Boxes: {result['boxes_count']}\n"
        f"- Subboxes: {result['subboxes_count']}\n"
        f"- Max d0 upper recomputed: {result['max_d0_upper_recomputed']}\n"
        f"- Max d0 upper recorded: {result['max_d0_upper_recorded']}\n"
        f"- Max d0 upper rat: {result['max_d0_upper_rat']}\n"
        f"- Min main lower recomputed: {result['min_main_lower_recomputed']}\n"
        f"- Min main lower recorded: {result['min_main_lower_recorded']}\n"
        f"- Min main lower rat: {result['min_main_lower_rat']}\n"
        f"- Max rest upper recomputed: {result['max_rest_upper_recomputed']}\n"
        f"- Max rest upper recorded: {result['max_rest_upper_recorded']}\n"
        f"- Max rest upper rat: {result['max_rest_upper_rat']}\n"
        f"- Min sector budget rat: {result['min_sector_budget_rat']}\n"
        f"- Worst box: `{result['worst_box']}`\n"
        f"- Min slack main lower: {result['min_slack_main_lower']}\n"
        f"- Max slack rest upper: {result['max_slack_rest_upper']}\n\n"
        "## Respostas\n\n"
        f"1. O verificador retangular independente {status}.\n"
        "2. Ele recomputa `D0NegReMain` a partir dos retangulos de `D0` e `M`.\n"
        "3. Ele recomputa o lower de main a partir do retangulo de `M`.\n"
        "4. Ele recomputa o upper do resto combinado a partir de `Drest + RvecTail`.\n"
        "5. Os racionais do pack continuam seguros quando nao ha checks falhos.\n"
        f"6. Menor folga main: {result['min_slack_main_lower']}.\n"
        f"7. Maior folga rest: {result['max_slack_rest_upper']}.\n"
        f"8. Maior d0 upper recomputado: {result['max_d0_upper_recomputed']}.\n"
        "9. O resultado aumenta a confianca no fast/sub32 porque remove uma parte "
        "da dependencia no codigo do certifier para as quantidades derivadas.\n"
        "10. Limite: ainda se confia nos retangulos brutos produzidos pelo certifier.\n\n"
        "## Failed Checks\n\n"
        + ("\n".join(f"- {x['name']}: {x.get('detail', '')}" for x in result["checks_failed"]) or "- None")
        + "\n"
    )


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        description="Independent rectangle verifier for projected-j0 sector subboxes."
    )
    parser.add_argument("--subbox-cert-dir", type=Path, required=True)
    parser.add_argument("--sector-rat-pack-dir", type=Path, required=True)
    parser.add_argument("--out-json", type=Path, required=True)
    parser.add_argument("--out-md", type=Path, required=True)
    parser.add_argument("--decimal-prec", type=int, default=80)
    parser.add_argument("--sqrt-inflate", type=str, default="1e-70")
    parser.add_argument("--tolerance", type=str, default="1e-15")
    return parser


def main() -> None:
    args = build_parser().parse_args()
    log = CheckLog()
    paths = {
        "subbox_config": args.subbox_cert_dir / "config.json",
        "subboxes": args.subbox_cert_dir / "subboxes.jsonl",
        "boxes_summary": args.subbox_cert_dir / "boxes_summary.json",
        "rat_config": args.sector_rat_pack_dir / "config.json",
        "rat_boxes": args.sector_rat_pack_dir / "boxes_sector_rationalized.json",
    }
    require_files(log, paths)
    if any(not path.exists() for path in paths.values()):
        result = {
            "checks_passed": log.passed,
            "checks_failed": log.failed,
            "boxes_count": 0,
            "subboxes_count": 0,
        }
        args.out_json.write_text(json.dumps(stringify(result), indent=2, sort_keys=True) + "\n")
        write_report(args.out_md, result)
        raise SystemExit(1)

    config = read_json(paths["subbox_config"])
    subboxes = read_jsonl(paths["subboxes"])
    summaries = read_json(paths["boxes_summary"])
    rat_rows = read_json(paths["rat_boxes"])
    summaries_by_box = {str(row["source_box_id"]): row for row in summaries}
    subboxes_by_box: dict[str, list[dict[str, Any]]] = defaultdict(list)
    for row in subboxes:
        subboxes_by_box[str(row["source_box_id"])].append(row)

    verify_required_fields(log, subboxes)
    tol = Decimal(str(args.tolerance))
    sqrt_inflate = Decimal(str(args.sqrt_inflate))

    if len(summaries) == 27:
        log.ok("boxes_count_27", str(len(summaries)))
    else:
        log.fail("boxes_count_27", str(len(summaries)))
    if len(subboxes) == 771:
        log.ok("subboxes_count_771", str(len(subboxes)))
    else:
        log.fail("subboxes_count_771", str(len(subboxes)))

    verify_coverage(log, subboxes_by_box, summaries_by_box, tol)
    recomputed, subbox_metrics = recompute_subboxes(
        log, subboxes, int(args.decimal_prec), sqrt_inflate, tol
    )
    box_metrics = verify_box_rationals(log, recomputed, summaries_by_box, rat_rows, tol)

    hashes = {
        "subbox_config": file_sha256(paths["subbox_config"]),
        "subboxes": file_sha256(paths["subboxes"]),
        "boxes_summary": file_sha256(paths["boxes_summary"]),
        "rat_config": file_sha256(paths["rat_config"]),
        "rat_boxes": file_sha256(paths["rat_boxes"]),
        "rect_verifier_script": file_sha256(Path(__file__)),
    }

    result: dict[str, Any] = {
        "git_head": git_head(),
        "decimal_prec": int(args.decimal_prec),
        "sqrt_inflate": Decimal(str(args.sqrt_inflate)),
        "tolerance": tol,
        "checks_passed": log.passed,
        "checks_failed": log.failed,
        "failed_checks": log.failed,
        "hashes": hashes,
        "boxes_count": len(summaries),
        "subboxes_count": len(subboxes),
        "subbox_cert_dir": str(args.subbox_cert_dir),
        "sector_rat_pack_dir": str(args.sector_rat_pack_dir),
        **subbox_metrics,
        **box_metrics,
    }
    result["max_rest_upper_rat"] = result["max_rest_upper_rat"]

    args.out_json.parent.mkdir(parents=True, exist_ok=True)
    args.out_json.write_text(json.dumps(stringify(result), indent=2, sort_keys=True) + "\n")
    write_report(args.out_md, stringify(result))

    print("C2 projected-j0 sector rectangle verifier")
    print("=========================================")
    print(f"checks_failed={len(log.failed)} boxes={len(summaries)} subboxes={len(subboxes)}")
    print(f"max_d0_upper_recomputed={dec_to_str(subbox_metrics['max_d0_upper_recomputed'])}")
    print(f"min_sector_budget_rat={dec_to_str(box_metrics['min_sector_budget_rat'])}")
    print(f"JSON: {args.out_json}")
    print(f"MD: {args.out_md}")
    if log.failed:
        for item in log.failed[:20]:
            print(f"FAIL {item['name']}: {item.get('detail', '')}")


if __name__ == "__main__":
    main()
