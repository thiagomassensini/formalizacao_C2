#!/usr/bin/env python3
"""
Rationalize projected-j0 sector certificate packs.

The script directionally rounds sector constants and recomputes the sector
budgets from rounded values.  It creates a data-safety layer, not an analytic
proof of the enclosures behind the constants.
"""

from __future__ import annotations

import argparse
import csv
import hashlib
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
    "d0_neg_re_upper_raw",
    "mainNormLowerConst_raw",
    "restUpperCombinedConst_raw",
    "restUpperSeparateConst_raw",
    "d0_neg_re_upper_rat",
    "mainNormLowerConst_rat",
    "restUpperCombinedConst_rat",
    "restUpperSeparateConst_rat",
    "sectorBudgetCombined_rat",
    "sectorBudgetSeparate_rat",
    "certified_nondestructive_rat",
    "certified_sector_combined_rat",
    "certified_sector_separate_rat",
]


def repo_root() -> Path:
    return Path(__file__).resolve().parents[1]


def git_head() -> str | None:
    proc = subprocess.run(
        ["git", "rev-parse", "HEAD"],
        cwd=repo_root(),
        text=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        check=False,
    )
    if proc.returncode != 0:
        return None
    return proc.stdout.strip() or None


def sha256(path: Path) -> str | None:
    if not path.exists():
        return None
    h = hashlib.sha256()
    with path.open("rb") as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b""):
            h.update(chunk)
    return h.hexdigest()


def q_for(decimals: int) -> Decimal:
    return Decimal(1).scaleb(-int(decimals))


def dec(value: Any) -> Decimal:
    return Decimal(str(value))


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
    d0_raw = dec(row["d0_neg_re_upper"])
    main_raw = dec(row["mainNormLowerConst"])
    rest_combined_raw = dec(row["restUpperCombinedConst"])
    rest_separate_raw = dec(row["restUpperSeparateConst"])

    d0_upper = round_up(d0_raw, quantum)
    main = round_down(main_raw, quantum)
    rest_combined = round_up(rest_combined_raw, quantum)
    rest_separate = round_up(rest_separate_raw, quantum)
    budget_combined = main - rest_combined
    budget_separate = main - rest_separate

    return {
        "source_box_id": row["source_box_id"],
        "sigma_min": row["sigma_min"],
        "sigma_max": row["sigma_max"],
        "t_min": row["t_min"],
        "t_max": row["t_max"],
        "d0_neg_re_upper_raw": row["d0_neg_re_upper"],
        "mainNormLowerConst_raw": row["mainNormLowerConst"],
        "restUpperCombinedConst_raw": row["restUpperCombinedConst"],
        "restUpperSeparateConst_raw": row["restUpperSeparateConst"],
        "d0_neg_re_upper_rat": decimal_text(d0_upper),
        "mainNormLowerConst_rat": decimal_text(main),
        "restUpperCombinedConst_rat": decimal_text(rest_combined),
        "restUpperSeparateConst_rat": decimal_text(rest_separate),
        "sectorBudgetCombined_rat": decimal_text(budget_combined),
        "sectorBudgetSeparate_rat": decimal_text(budget_separate),
        "certified_nondestructive_rat": d0_upper <= 0,
        "certified_sector_combined_rat": d0_upper <= 0 and main > 0 and budget_combined > 0,
        "certified_sector_separate_rat": d0_upper <= 0 and main > 0 and budget_separate > 0,
    }


def summarize(raw_rows: list[dict[str, str]], rat_rows: list[dict[str, Any]]) -> dict[str, Any]:
    budgets_c = [dec(row["sectorBudgetCombined_rat"]) for row in rat_rows]
    budgets_s = [dec(row["sectorBudgetSeparate_rat"]) for row in rat_rows]
    d0_uppers = [dec(row["d0_neg_re_upper_rat"]) for row in rat_rows]
    raw_by_id = {row["source_box_id"]: row for row in raw_rows}
    losses_c: list[tuple[Decimal, str]] = []
    losses_s: list[tuple[Decimal, str]] = []
    for row in rat_rows:
        raw = raw_by_id[row["source_box_id"]]
        losses_c.append((
            dec(raw["sectorBudgetCombined"]) - dec(row["sectorBudgetCombined_rat"]),
            row["source_box_id"],
        ))
        losses_s.append((
            dec(raw["sectorBudgetSeparate"]) - dec(row["sectorBudgetSeparate_rat"]),
            row["source_box_id"],
        ))
    worst_c = min(rat_rows, key=lambda row: dec(row["sectorBudgetCombined_rat"])) if rat_rows else None
    worst_s = min(rat_rows, key=lambda row: dec(row["sectorBudgetSeparate_rat"])) if rat_rows else None
    max_d0 = max(rat_rows, key=lambda row: dec(row["d0_neg_re_upper_rat"])) if rat_rows else None
    max_loss_c = max(losses_c, default=(Decimal(0), ""))
    max_loss_s = max(losses_s, default=(Decimal(0), ""))
    return {
        "input_boxes": len(raw_rows),
        "output_boxes": len(rat_rows),
        "certified_nondestructive": sum(bool(row["certified_nondestructive_rat"]) for row in rat_rows),
        "certified_sector_combined": sum(bool(row["certified_sector_combined_rat"]) for row in rat_rows),
        "certified_sector_separate": sum(bool(row["certified_sector_separate_rat"]) for row in rat_rows),
        "min_sector_budget_combined": decimal_text(min(budgets_c)) if budgets_c else None,
        "min_sector_budget_separate": decimal_text(min(budgets_s)) if budgets_s else None,
        "worst_combined_box": worst_c["source_box_id"] if worst_c else None,
        "worst_separate_box": worst_s["source_box_id"] if worst_s else None,
        "max_d0_neg_re_upper": decimal_text(max(d0_uppers)) if d0_uppers else None,
        "max_d0_neg_re_upper_box": max_d0["source_box_id"] if max_d0 else None,
        "max_rounding_loss_combined": decimal_text(max_loss_c[0]),
        "max_rounding_loss_combined_box": max_loss_c[1],
        "max_rounding_loss_separate": decimal_text(max_loss_s[0]),
        "max_rounding_loss_separate_box": max_loss_s[1],
    }


def write_pack(out_dir: Path, config: dict[str, Any], rows: list[dict[str, Any]]) -> None:
    out_dir.mkdir(parents=True, exist_ok=True)
    write_csv(out_dir / "boxes_sector_rationalized.csv", rows)
    with (out_dir / "boxes_sector_rationalized.json").open("w", encoding="utf-8") as f:
        json.dump(rows, f, indent=2, sort_keys=True)
        f.write("\n")
    with (out_dir / "config.json").open("w", encoding="utf-8") as f:
        json.dump(config, f, indent=2, sort_keys=True)
        f.write("\n")
    (out_dir / "README.md").write_text(
        "# Projected J0 Positive Box Sector Rationalized Pack\n\n"
        "This pack contains directionally rounded sector constants. It checks\n"
        "only data-level algebra and does not prove the analytic enclosures.\n",
        encoding="utf-8",
    )
    summary = config["summary"]
    (out_dir / "summary.md").write_text(
        "# Sector Rationalized Pack Summary\n\n"
        f"- Input boxes: {summary['input_boxes']}\n"
        f"- Output boxes: {summary['output_boxes']}\n"
        f"- Nondestructive: {summary['certified_nondestructive']}/{summary['output_boxes']}\n"
        f"- Sector combined: {summary['certified_sector_combined']}/{summary['output_boxes']}\n"
        f"- Sector separate: {summary['certified_sector_separate']}/{summary['output_boxes']}\n"
        f"- Min sector budget combined: {summary['min_sector_budget_combined']}\n"
        f"- Min sector budget separate: {summary['min_sector_budget_separate']}\n"
        f"- Worst combined box: {summary['worst_combined_box']}\n"
        f"- Max d0 neg-real upper: {summary['max_d0_neg_re_upper']}"
        f" at {summary['max_d0_neg_re_upper_box']}\n",
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
        if row["certified_nondestructive_rat"]
        and row["certified_sector_combined_rat"]
        and row["certified_sector_separate_rat"]
    ]
    summary = summarize(raw_rows, rat_rows)
    config = {
        "created_at_utc": datetime.now(timezone.utc).isoformat(),
        "source_pack_dir": str(pack_dir),
        "decimals": int(args.decimals),
        "rounding": {
            "mainNormLowerConst": "down",
            "restUpperCombinedConst": "up",
            "restUpperSeparateConst": "up",
            "d0_neg_re_upper": "up",
        },
        "source_boxes_csv_sha256": sha256(pack_dir / "boxes.csv"),
        "source_boxes_json_sha256": sha256(pack_dir / "boxes.json"),
        "script_sha256": sha256(Path(__file__)),
        "git_head": git_head(),
        "summary": summary,
    }
    write_pack(out_dir, config, rat_rows)
    shutil.copy2(pack_dir / "config.json", out_dir / "source_config.json")
    print(json.dumps(summary, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
