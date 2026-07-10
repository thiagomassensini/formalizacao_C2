#!/usr/bin/env python3
"""
Rationalize projected-j0 external certificate packs by directional rounding.

This script rounds box constants in the safe direction and recomputes the
budget identities from the rounded values.  It creates a data artifact for
future checking layers; it does not prove the analytic enclosures.
"""

from __future__ import annotations

import argparse
import csv
import json
import shutil
import subprocess
from datetime import datetime, timezone
from decimal import Decimal, ROUND_CEILING, ROUND_FLOOR, getcontext
from pathlib import Path
from typing import Any


FIELDS = [
    "source_box_id",
    "sigma_min",
    "sigma_max",
    "t_min",
    "t_max",
    "mainNormLowerConst_raw",
    "numeratorUpperConst_raw",
    "restUpperCombinedConst_raw",
    "restUpperSeparateConst_raw",
    "mainNormLowerConst_rat",
    "numeratorUpperConst_rat",
    "parallelUpperConst_rat",
    "restUpperCombinedConst_rat",
    "restUpperSeparateConst_rat",
    "budgetCombinedConst_rat",
    "budgetSeparateConst_rat",
    "certified_combined_rat",
    "certified_separate_rat",
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


def q_for(decimals: int) -> Decimal:
    return Decimal(1).scaleb(-int(decimals))


def dec(text: Any) -> Decimal:
    return Decimal(str(text))


def round_down(value: Decimal, quantum: Decimal) -> Decimal:
    return value.quantize(quantum, rounding=ROUND_FLOOR)


def round_up(value: Decimal, quantum: Decimal) -> Decimal:
    return value.quantize(quantum, rounding=ROUND_CEILING)


def decimal_text(value: Decimal) -> str:
    return format(value, "f")


def read_csv(path: Path) -> list[dict[str, str]]:
    with path.open(newline="", encoding="utf-8") as f:
        return list(csv.DictReader(f))


def write_csv(path: Path, rows: list[dict[str, Any]]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=FIELDS)
        writer.writeheader()
        writer.writerows(rows)


def rationalize_row(row: dict[str, str], quantum: Decimal) -> dict[str, Any]:
    main_raw = dec(row["mainNormLowerConst"])
    numerator_raw = dec(row["numeratorUpperConst"])
    rest_combined_raw = dec(row["restUpperCombinedConst"])
    rest_separate_raw = dec(row["restUpperSeparateConst"])

    main = round_down(main_raw, quantum)
    numerator = round_up(numerator_raw, quantum)
    rest_combined = round_up(rest_combined_raw, quantum)
    rest_separate = round_up(rest_separate_raw, quantum)
    if main <= 0:
        parallel = Decimal("Infinity")
        budget_combined = Decimal("-Infinity")
        budget_separate = Decimal("-Infinity")
    else:
        parallel = round_up(numerator / main, quantum)
        budget_combined = main - parallel - rest_combined
        budget_separate = main - parallel - rest_separate

    return {
        "source_box_id": row["source_box_id"],
        "sigma_min": row["sigma_min"],
        "sigma_max": row["sigma_max"],
        "t_min": row["t_min"],
        "t_max": row["t_max"],
        "mainNormLowerConst_raw": row["mainNormLowerConst"],
        "numeratorUpperConst_raw": row["numeratorUpperConst"],
        "restUpperCombinedConst_raw": row["restUpperCombinedConst"],
        "restUpperSeparateConst_raw": row["restUpperSeparateConst"],
        "mainNormLowerConst_rat": decimal_text(main),
        "numeratorUpperConst_rat": decimal_text(numerator),
        "parallelUpperConst_rat": decimal_text(parallel),
        "restUpperCombinedConst_rat": decimal_text(rest_combined),
        "restUpperSeparateConst_rat": decimal_text(rest_separate),
        "budgetCombinedConst_rat": decimal_text(budget_combined),
        "budgetSeparateConst_rat": decimal_text(budget_separate),
        "certified_combined_rat": budget_combined > 0,
        "certified_separate_rat": budget_separate > 0,
    }


def summarize(raw_rows: list[dict[str, str]], rat_rows: list[dict[str, Any]]) -> dict[str, Any]:
    combined = [row for row in rat_rows if row["certified_combined_rat"]]
    separate = [row for row in rat_rows if row["certified_separate_rat"]]
    budgets_c = [dec(row["budgetCombinedConst_rat"]) for row in rat_rows]
    budgets_s = [dec(row["budgetSeparateConst_rat"]) for row in rat_rows]
    raw_by_id = {row["source_box_id"]: row for row in raw_rows}
    combined_losses: list[tuple[Decimal, str]] = []
    separate_losses: list[tuple[Decimal, str]] = []
    for row in rat_rows:
        raw = raw_by_id[row["source_box_id"]]
        combined_losses.append(
            (dec(raw["budgetCombinedConst"]) - dec(row["budgetCombinedConst_rat"]), row["source_box_id"])
        )
        separate_losses.append(
            (dec(raw["budgetSeparateConst"]) - dec(row["budgetSeparateConst_rat"]), row["source_box_id"])
        )
    worst_c = min(rat_rows, key=lambda row: dec(row["budgetCombinedConst_rat"])) if rat_rows else None
    worst_s = min(rat_rows, key=lambda row: dec(row["budgetSeparateConst_rat"])) if rat_rows else None
    max_loss_c = max(combined_losses, default=(Decimal(0), "")) if combined_losses else (Decimal(0), "")
    max_loss_s = max(separate_losses, default=(Decimal(0), "")) if separate_losses else (Decimal(0), "")
    return {
        "input_boxes": len(raw_rows),
        "output_boxes": len(rat_rows),
        "certified_combined": len(combined),
        "certified_separate": len(separate),
        "min_budget_combined": decimal_text(min(budgets_c)) if budgets_c else None,
        "min_budget_separate": decimal_text(min(budgets_s)) if budgets_s else None,
        "worst_combined_box": worst_c["source_box_id"] if worst_c else None,
        "worst_separate_box": worst_s["source_box_id"] if worst_s else None,
        "max_rounding_loss_combined": decimal_text(max_loss_c[0]),
        "max_rounding_loss_combined_box": max_loss_c[1],
        "max_rounding_loss_separate": decimal_text(max_loss_s[0]),
        "max_rounding_loss_separate_box": max_loss_s[1],
    }


def write_pack(out_dir: Path, config: dict[str, Any], rows: list[dict[str, Any]]) -> None:
    out_dir.mkdir(parents=True, exist_ok=True)
    write_csv(out_dir / "boxes_rationalized.csv", rows)
    with (out_dir / "boxes_rationalized.json").open("w", encoding="utf-8") as f:
        json.dump(rows, f, indent=2, sort_keys=True)
        f.write("\n")
    with (out_dir / "config.json").open("w", encoding="utf-8") as f:
        json.dump(config, f, indent=2, sort_keys=True)
        f.write("\n")
    (out_dir / "README.md").write_text(
        "# Projected J0 Positive Box Rationalized Pack\n\n"
        "This pack contains directionally rounded constants derived from the\n"
        "verified external positive-box pack. It is a data-safety layer, not an\n"
        "analytic proof of the interval enclosures.\n",
        encoding="utf-8",
    )
    summary = config["summary"]
    (out_dir / "summary.md").write_text(
        "# Rationalized Pack Summary\n\n"
        f"- Input boxes: {summary['input_boxes']}\n"
        f"- Output boxes: {summary['output_boxes']}\n"
        f"- Certified combined: {summary['certified_combined']}/{summary['output_boxes']}\n"
        f"- Certified separate: {summary['certified_separate']}/{summary['output_boxes']}\n"
        f"- Min budget combined: {summary['min_budget_combined']}\n"
        f"- Min budget separate: {summary['min_budget_separate']}\n"
        f"- Worst combined box: {summary['worst_combined_box']}\n"
        f"- Worst separate box: {summary['worst_separate_box']}\n"
        f"- Max rounding loss combined: {summary['max_rounding_loss_combined']}"
        f" at {summary['max_rounding_loss_combined_box']}\n",
        encoding="utf-8",
    )


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--pack-dir", required=True)
    parser.add_argument("--decimals", type=int, default=12)
    parser.add_argument("--out-dir", required=True)
    args = parser.parse_args()

    getcontext().prec = max(80, int(args.decimals) + 40)
    pack_dir = Path(args.pack_dir)
    if not pack_dir.is_absolute():
        pack_dir = repo_root() / pack_dir
    out_dir = Path(args.out_dir)
    if not out_dir.is_absolute():
        out_dir = repo_root() / out_dir

    raw_rows = read_csv(pack_dir / "boxes.csv")
    quantum = q_for(args.decimals)
    rat_rows_all = [rationalize_row(row, quantum) for row in raw_rows]
    rat_rows = [
        row for row in rat_rows_all
        if row["certified_combined_rat"] and row["certified_separate_rat"]
    ]
    summary = summarize(raw_rows, rat_rows)
    config = {
        "created_at_utc": datetime.now(timezone.utc).isoformat(),
        "source_pack_dir": str(pack_dir),
        "decimals": int(args.decimals),
        "rounding": {
            "mainNormLowerConst": "down",
            "numeratorUpperConst": "up",
            "restUpperCombinedConst": "up",
            "restUpperSeparateConst": "up",
            "parallelUpperConst": "recomputed and rounded up",
            "budget": "recomputed from rounded values",
        },
        "git_head": git_head(),
        "summary": summary,
    }
    write_pack(out_dir, config, rat_rows)
    if out_dir != pack_dir:
        source_config = pack_dir / "config.json"
        if source_config.exists():
            shutil.copyfile(source_config, out_dir / "source_config.json")
    print(json.dumps(summary, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
