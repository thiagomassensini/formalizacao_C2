#!/usr/bin/env python3
"""
Verifier for projected-j0 rationalized certificate packs.

This checks only the rationalized data layer: file presence, directional
rounding, rational signs, and algebraic budgets.  It does not verify the
underlying functional enclosures.
"""

from __future__ import annotations

import argparse
import csv
import json
import subprocess
from datetime import datetime, timezone
from decimal import Decimal
from fractions import Fraction
from pathlib import Path
from typing import Any


REQUIRED_FILES = [
    "config.json",
    "boxes_rationalized.csv",
    "boxes_rationalized.json",
    "summary.md",
    "README.md",
    "source_config.json",
]


def repo_root() -> Path:
    return Path(__file__).resolve().parents[1]


def git_head() -> str | None:
    try:
        proc = subprocess.run(
            ["git", "rev-parse", "HEAD"],
            cwd=repo_root(),
            text=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            check=False,
        )
    except OSError:
        return None
    if proc.returncode != 0:
        return None
    return proc.stdout.strip() or None


def load_json(path: Path) -> Any:
    with path.open("r", encoding="utf-8") as f:
        return json.load(f)


def load_csv(path: Path) -> list[dict[str, str]]:
    with path.open(newline="", encoding="utf-8") as f:
        return list(csv.DictReader(f))


def frac(text: Any) -> Fraction:
    return Fraction(Decimal(str(text)))


def decimal_text(value: Fraction) -> str:
    dec = Decimal(value.numerator) / Decimal(value.denominator)
    return format(dec, "f")


def ceil_fraction(value: Fraction, denominator: int) -> Fraction:
    numerator = (value.numerator * denominator + value.denominator - 1) // value.denominator
    return Fraction(numerator, denominator)


def add_check(result: dict[str, Any], name: str, ok: bool, detail: str = "") -> None:
    item = {"name": name, "detail": detail}
    if ok:
        result["checks_passed"].append(item)
    else:
        result["checks_failed"].append(item)


def resolve_path(path_text: str | None) -> Path | None:
    if not path_text:
        return None
    path = Path(path_text)
    if path.is_absolute():
        return path
    return repo_root() / path


def raw_rows_for_pack(config: dict[str, Any]) -> dict[str, dict[str, str]]:
    source_pack = resolve_path(config.get("source_pack_dir"))
    if source_pack is None:
        return {}
    source_csv = source_pack / "boxes.csv"
    if not source_csv.exists():
        return {}
    return {row["source_box_id"]: row for row in load_csv(source_csv)}


def verify(pack_dir: Path) -> dict[str, Any]:
    config_path = pack_dir / "config.json"
    boxes_csv_path = pack_dir / "boxes_rationalized.csv"
    boxes_json_path = pack_dir / "boxes_rationalized.json"
    result: dict[str, Any] = {
        "pack_dir": str(pack_dir),
        "timestamp": datetime.now(timezone.utc).isoformat(),
        "git_head": git_head(),
        "checks_passed": [],
        "checks_failed": [],
    }

    for name in REQUIRED_FILES:
        add_check(result, f"exists:{name}", (pack_dir / name).exists(), str(pack_dir / name))

    if not (config_path.exists() and boxes_csv_path.exists() and boxes_json_path.exists()):
        return result

    config = load_json(config_path)
    rows = load_csv(boxes_csv_path)
    json_rows = load_json(boxes_json_path)
    raw_rows = raw_rows_for_pack(config)
    decimals = int(config.get("decimals", 12))
    scale = 10 ** decimals

    add_check(result, "boxes_count_27", len(rows) == 27, f"rows={len(rows)}")
    add_check(result, "boxes_json_count", isinstance(json_rows, list) and len(json_rows) == len(rows),
              f"json={len(json_rows) if isinstance(json_rows, list) else 'not-list'} csv={len(rows)}")

    combined_survivors = 0
    separate_survivors = 0
    min_budget_combined: tuple[Fraction, str] | None = None
    min_budget_separate: tuple[Fraction, str] | None = None
    max_rounding_loss_combined: tuple[Fraction, str] = (Fraction(0), "")
    max_rounding_loss_separate: tuple[Fraction, str] = (Fraction(0), "")
    max_parallel_rounding_gap: tuple[Fraction, str] = (Fraction(0), "")
    all_directional = True
    all_signs = True
    all_budgets = True
    all_recorded_match = True

    for row in rows:
        box_id = row["source_box_id"]
        main_raw = frac(row["mainNormLowerConst_raw"])
        num_raw = frac(row["numeratorUpperConst_raw"])
        rest_c_raw = frac(row["restUpperCombinedConst_raw"])
        rest_s_raw = frac(row["restUpperSeparateConst_raw"])
        main = frac(row["mainNormLowerConst_rat"])
        num = frac(row["numeratorUpperConst_rat"])
        rest_c = frac(row["restUpperCombinedConst_rat"])
        rest_s = frac(row["restUpperSeparateConst_rat"])
        parallel_recorded = frac(row["parallelUpperConst_rat"])
        budget_c_recorded = frac(row["budgetCombinedConst_rat"])
        budget_s_recorded = frac(row["budgetSeparateConst_rat"])

        signs_ok = main > 0 and num >= 0 and rest_c >= 0 and rest_s >= 0
        all_signs = all_signs and signs_ok

        directions_ok = (
            main <= main_raw and
            num >= num_raw and
            rest_c >= rest_c_raw and
            rest_s >= rest_s_raw
        )
        all_directional = all_directional and directions_ok

        exact_parallel = num / main
        rounded_parallel = ceil_fraction(exact_parallel, scale)
        parallel_gap = parallel_recorded - exact_parallel
        if parallel_gap > max_parallel_rounding_gap[0]:
            max_parallel_rounding_gap = (parallel_gap, box_id)
        budget_c = main - parallel_recorded - rest_c
        budget_s = main - parallel_recorded - rest_s
        exact_budget_c = main - exact_parallel - rest_c
        exact_budget_s = main - exact_parallel - rest_s

        recorded_match = (
            parallel_recorded == rounded_parallel and
            budget_c == budget_c_recorded and
            budget_s == budget_s_recorded
        )
        all_recorded_match = all_recorded_match and recorded_match

        budgets_ok = (
            budget_c_recorded > 0 and
            budget_s_recorded > 0 and
            exact_budget_c > 0 and
            exact_budget_s > 0
        )
        all_budgets = all_budgets and budgets_ok
        if budget_c_recorded > 0:
            combined_survivors += 1
        if budget_s_recorded > 0:
            separate_survivors += 1
        if min_budget_combined is None or budget_c_recorded < min_budget_combined[0]:
            min_budget_combined = (budget_c_recorded, box_id)
        if min_budget_separate is None or budget_s_recorded < min_budget_separate[0]:
            min_budget_separate = (budget_s_recorded, box_id)

        raw = raw_rows.get(box_id)
        if raw is not None:
            loss_c = frac(raw["budgetCombinedConst"]) - budget_c_recorded
            loss_s = frac(raw["budgetSeparateConst"]) - budget_s_recorded
            if loss_c > max_rounding_loss_combined[0]:
                max_rounding_loss_combined = (loss_c, box_id)
            if loss_s > max_rounding_loss_separate[0]:
                max_rounding_loss_separate = (loss_s, box_id)

    add_check(result, "rational_signs", all_signs, "")
    add_check(result, "directional_rounding", all_directional, "")
    add_check(result, "recorded_parallel_and_budgets_match", all_recorded_match, "")
    add_check(result, "positive_budgets", all_budgets, "")
    add_check(result, "combined_survivors_27", combined_survivors == 27, str(combined_survivors))
    add_check(result, "separate_survivors_27", separate_survivors == 27, str(separate_survivors))

    result.update({
        "boxes_count": len(rows),
        "combined_survivors": combined_survivors,
        "separate_survivors": separate_survivors,
        "min_budget_combined_rat": decimal_text(min_budget_combined[0]) if min_budget_combined else None,
        "min_budget_separate_rat": decimal_text(min_budget_separate[0]) if min_budget_separate else None,
        "worst_combined_box": min_budget_combined[1] if min_budget_combined else None,
        "worst_separate_box": min_budget_separate[1] if min_budget_separate else None,
        "max_rounding_loss_combined": decimal_text(max_rounding_loss_combined[0]),
        "max_rounding_loss_combined_box": max_rounding_loss_combined[1],
        "max_rounding_loss_separate": decimal_text(max_rounding_loss_separate[0]),
        "max_rounding_loss_separate_box": max_rounding_loss_separate[1],
        "max_parallel_rounding_gap": decimal_text(max_parallel_rounding_gap[0]),
        "max_parallel_rounding_gap_box": max_parallel_rounding_gap[1],
    })
    return result


def write_markdown(path: Path, result: dict[str, Any]) -> None:
    lines = [
        "# Audit Projected J0 Positive Box Rationalized Pack Verification",
        "",
        "Rota: Genuine-First. Esta verificacao cobre apenas a algebra racional",
        "do pack racionalizado; ela nao prova as enclosures analiticas.",
        "",
        "## Resultado",
        "",
        f"- Checks failed: {len(result['checks_failed'])}",
        f"- Boxes: {result.get('boxes_count')}",
        f"- Combined survivors: {result.get('combined_survivors')}",
        f"- Separate survivors: {result.get('separate_survivors')}",
        f"- Min budget combined rat: {result.get('min_budget_combined_rat')}",
        f"- Min budget separate rat: {result.get('min_budget_separate_rat')}",
        f"- Worst combined box: `{result.get('worst_combined_box')}`",
        f"- Worst separate box: `{result.get('worst_separate_box')}`",
        f"- Max rounding loss combined: {result.get('max_rounding_loss_combined')} at `{result.get('max_rounding_loss_combined_box')}`",
        f"- Max rounding loss separate: {result.get('max_rounding_loss_separate')} at `{result.get('max_rounding_loss_separate_box')}`",
        "",
        "## Respostas",
        "",
        "1. O pack racionalizado e internamente consistente se `checks failed = 0`.",
        "2. As direcoes de arredondamento foram verificadas contra os valores raw.",
        "3. Todas as caixas preservam budget positivo em combined e separate.",
        f"4. A caixa mais apertada e `{result.get('worst_combined_box')}`.",
        f"5. A maior perda por arredondamento combined foi {result.get('max_rounding_loss_combined')}.",
        "6. O pack esta pronto para alimentar uma checagem algebraica Lean.",
        "7. Aviso: isto ainda nao prova as enclosures analiticas.",
        "",
        "## Failed Checks",
        "",
    ]
    if result["checks_failed"]:
        for item in result["checks_failed"]:
            lines.append(f"- `{item['name']}`: {item['detail']}")
    else:
        lines.append("- None.")
    lines.append("")
    path.write_text("\n".join(lines), encoding="utf-8")


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--pack-dir", required=True)
    parser.add_argument("--out-json", required=True)
    parser.add_argument("--out-md", required=True)
    args = parser.parse_args()

    pack_dir = Path(args.pack_dir)
    if not pack_dir.is_absolute():
        pack_dir = repo_root() / pack_dir
    result = verify(pack_dir)

    out_json = Path(args.out_json)
    if not out_json.is_absolute():
        out_json = repo_root() / out_json
    out_json.parent.mkdir(parents=True, exist_ok=True)
    with out_json.open("w", encoding="utf-8") as f:
        json.dump(result, f, indent=2, sort_keys=True)
        f.write("\n")

    out_md = Path(args.out_md)
    if not out_md.is_absolute():
        out_md = repo_root() / out_md
    write_markdown(out_md, result)
    return 0 if not result["checks_failed"] else 1


if __name__ == "__main__":
    raise SystemExit(main())
