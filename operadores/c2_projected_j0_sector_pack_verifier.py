#!/usr/bin/env python3
"""
Verifier for projected-j0 sector certificate packs.

This checks the external pack data layer: file presence, signs, sector
condition, and algebraic sector budgets.  Optional rerun/compare modes execute
the recorded command and compare the new output with the packed boxes.
"""

from __future__ import annotations

import argparse
import csv
import hashlib
import json
import subprocess
from datetime import datetime, timezone
from decimal import Decimal
from pathlib import Path
from typing import Any


REQUIRED_FILES = [
    "config.json",
    "boxes.csv",
    "boxes.json",
    "commands.sh",
    "summary.md",
    "README.md",
]

NUMERIC_FIELDS = [
    "d0_neg_re_upper",
    "mainNormLowerConst",
    "restUpperCombinedConst",
    "restUpperSeparateConst",
    "sectorBudgetCombined",
    "sectorBudgetSeparate",
]

INTERNAL_BUDGET_TOLERANCE = Decimal("1e-15")


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


def load_json(path: Path) -> Any:
    with path.open("r", encoding="utf-8") as f:
        return json.load(f)


def load_csv(path: Path) -> list[dict[str, str]]:
    with path.open(newline="", encoding="utf-8") as f:
        return list(csv.DictReader(f))


def dec(value: Any) -> Decimal:
    return Decimal(str(value))


def bool_field(value: Any) -> bool:
    return str(value).strip().lower() in {"1", "true", "yes", "y"}


def decimal_text(value: Decimal | None) -> str | None:
    if value is None:
        return None
    return format(value, "f")


def add_check(result: dict[str, Any], name: str, ok: bool, detail: str = "") -> None:
    item = {"name": name, "detail": detail}
    if ok:
        result["checks_passed"].append(item)
    else:
        result["checks_failed"].append(item)


def verify_files(pack_dir: Path, result: dict[str, Any]) -> list[dict[str, str]]:
    for name in REQUIRED_FILES:
        add_check(result, f"exists:{name}", (pack_dir / name).exists(), str(pack_dir / name))

    boxes_csv = pack_dir / "boxes.csv"
    boxes_json = pack_dir / "boxes.json"
    if not boxes_csv.exists() or not boxes_json.exists():
        return []

    rows = load_csv(boxes_csv)
    json_rows = load_json(boxes_json)
    add_check(result, "boxes_count_27", len(rows) == 27, f"rows={len(rows)}")
    add_check(
        result,
        "boxes_json_count",
        isinstance(json_rows, list) and len(json_rows) == len(rows),
        f"json={len(json_rows) if isinstance(json_rows, list) else 'not-list'} csv={len(rows)}",
    )

    certified_nondestructive = 0
    certified_combined = 0
    certified_separate = 0
    min_combined: tuple[Decimal, str] | None = None
    min_separate: tuple[Decimal, str] | None = None
    max_d0: tuple[Decimal, str] | None = None
    all_flags = True
    all_signs = True
    all_budgets_match = True
    all_positive_budgets = True
    max_internal_budget_diff = Decimal("0")

    for row in rows:
        box_id = row["source_box_id"]
        nondestructive = bool_field(row["certified_nondestructive"])
        combined = bool_field(row["certified_sector_combined"])
        separate = bool_field(row["certified_sector_separate"])
        certified_nondestructive += int(nondestructive)
        certified_combined += int(combined)
        certified_separate += int(separate)
        all_flags = all_flags and nondestructive and combined and separate

        d0_upper = dec(row["d0_neg_re_upper"])
        main = dec(row["mainNormLowerConst"])
        rest_c = dec(row["restUpperCombinedConst"])
        rest_s = dec(row["restUpperSeparateConst"])
        budget_c = dec(row["sectorBudgetCombined"])
        budget_s = dec(row["sectorBudgetSeparate"])
        signs_ok = d0_upper <= 0 and main > 0 and rest_c >= 0 and rest_s >= 0
        all_signs = all_signs and signs_ok

        recomputed_c = main - rest_c
        recomputed_s = main - rest_s
        max_internal_budget_diff = max(
            max_internal_budget_diff,
            abs(recomputed_c - budget_c),
            abs(recomputed_s - budget_s),
        )
        all_budgets_match = (
            all_budgets_match
            and abs(recomputed_c - budget_c) <= INTERNAL_BUDGET_TOLERANCE
            and abs(recomputed_s - budget_s) <= INTERNAL_BUDGET_TOLERANCE
        )
        all_positive_budgets = all_positive_budgets and budget_c > 0 and budget_s > 0

        if min_combined is None or budget_c < min_combined[0]:
            min_combined = (budget_c, box_id)
        if min_separate is None or budget_s < min_separate[0]:
            min_separate = (budget_s, box_id)
        if max_d0 is None or d0_upper > max_d0[0]:
            max_d0 = (d0_upper, box_id)

    add_check(result, "all_certification_flags_true", all_flags, "")
    add_check(result, "sector_signs", all_signs, "")
    add_check(result, "recorded_sector_budgets_match", all_budgets_match, "")
    add_check(result, "positive_sector_budgets", all_positive_budgets, "")
    add_check(result, "certified_nondestructive_27", certified_nondestructive == 27, str(certified_nondestructive))
    add_check(result, "certified_combined_27", certified_combined == 27, str(certified_combined))
    add_check(result, "certified_separate_27", certified_separate == 27, str(certified_separate))

    result.update({
        "boxes_count": len(rows),
        "certified_nondestructive_count": certified_nondestructive,
        "certified_combined_count": certified_combined,
        "certified_separate_count": certified_separate,
        "min_sector_budget_combined": decimal_text(min_combined[0] if min_combined else None),
        "min_sector_budget_separate": decimal_text(min_separate[0] if min_separate else None),
        "worst_combined_box": min_combined[1] if min_combined else None,
        "worst_separate_box": min_separate[1] if min_separate else None,
        "max_d0_neg_re_upper": decimal_text(max_d0[0] if max_d0 else None),
        "max_d0_neg_re_upper_box": max_d0[1] if max_d0 else None,
        "max_internal_budget_diff": decimal_text(max_internal_budget_diff),
    })
    return rows


def run_rerun(pack_dir: Path, result: dict[str, Any]) -> None:
    commands = pack_dir / "commands.sh"
    if not commands.exists():
        add_check(result, "rerun_commands_exists", False, str(commands))
        result["rerun_exit_code"] = None
        return
    proc = subprocess.run(
        ["bash", str(commands)],
        cwd=repo_root(),
        text=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        check=False,
    )
    result["rerun_exit_code"] = proc.returncode
    result["rerun_stdout_tail"] = proc.stdout[-4000:]
    result["rerun_stderr_tail"] = proc.stderr[-4000:]
    add_check(result, "rerun_exit_code_0", proc.returncode == 0, str(proc.returncode))


def compare_rows(pack_dir: Path, result: dict[str, Any], tolerance: Decimal) -> None:
    config_path = pack_dir / "config.json"
    if not config_path.exists():
        add_check(result, "compare_config_exists", False, str(config_path))
        return
    config = load_json(config_path)
    source_csv = Path(config.get("source_csv", ""))
    if not source_csv.is_absolute():
        source_csv = repo_root() / source_csv
    pack_rows = {row["source_box_id"]: row for row in load_csv(pack_dir / "boxes.csv")}
    if not source_csv.exists():
        add_check(result, "compare_source_csv_exists", False, str(source_csv))
        return
    new_rows = {row["source_box_id"]: row for row in load_csv(source_csv)}
    add_check(result, "compare_same_box_ids", set(pack_rows) == set(new_rows), "")
    max_diff: dict[str, str] = {}
    max_any = Decimal("0")
    max_any_field = ""
    max_any_box = ""
    all_within = True
    for field in NUMERIC_FIELDS:
        field_max = Decimal("0")
        field_box = ""
        for box_id, old in pack_rows.items():
            if box_id not in new_rows:
                continue
            diff = abs(dec(new_rows[box_id][field]) - dec(old[field]))
            if diff > field_max:
                field_max = diff
                field_box = box_id
            if diff > max_any:
                max_any = diff
                max_any_field = field
                max_any_box = box_id
        max_diff[field] = f"{decimal_text(field_max)} at {field_box}"
        all_within = all_within and field_max <= tolerance
    result["max_rerun_diff"] = decimal_text(max_any)
    result["max_rerun_diff_field"] = max_any_field
    result["max_rerun_diff_box"] = max_any_box
    result["max_abs_diffs"] = max_diff
    add_check(result, "compare_within_tolerance", all_within, f"tol={tolerance}")


def write_markdown(path: Path, result: dict[str, Any]) -> None:
    lines = [
        "# Audit Projected J0 Positive Box Sector Pack Verification",
        "",
        "Rota: Genuine-First. Esta verificacao cobre a consistencia externa do",
        "sector pack e a algebra dos budgets setoriais. Ela nao prova as",
        "enclosures analiticas.",
        "",
        "## Resultado",
        "",
        f"- Checks failed: {len(result['checks_failed'])}",
        f"- Boxes: {result.get('boxes_count')}",
        f"- Nondestructive: {result.get('certified_nondestructive_count')}",
        f"- Combined: {result.get('certified_combined_count')}",
        f"- Separate: {result.get('certified_separate_count')}",
        f"- Min sector budget combined: {result.get('min_sector_budget_combined')}",
        f"- Min sector budget separate: {result.get('min_sector_budget_separate')}",
        f"- Worst combined box: `{result.get('worst_combined_box')}`",
        f"- Worst separate box: `{result.get('worst_separate_box')}`",
        f"- Max d0_neg_re_upper: {result.get('max_d0_neg_re_upper')} at `{result.get('max_d0_neg_re_upper_box')}`",
        f"- Rerun exit code: {result.get('rerun_exit_code')}",
        f"- Max rerun diff: {result.get('max_rerun_diff')}",
        "",
        "## Respostas",
        "",
        "1. O sector pack e internamente consistente se `checks failed = 0`.",
        "2. O rerun reproduz os dados quando `rerun_exit_code = 0` e `max_rerun_diff` fica dentro da tolerancia.",
        f"3. A caixa mais apertada e `{result.get('worst_combined_box')}`.",
        f"4. O maior `d0_neg_re_upper` e {result.get('max_d0_neg_re_upper')} em `{result.get('max_d0_neg_re_upper_box')}`.",
        "5. Para positive-box, o pack setorial substitui o pack racionalizado generico porque fixa `parallelUpper = 0`.",
        "6. Ainda falta uma verificacao formal ou certificada das enclosures que produzem os bounds.",
        "7. Esta camada ainda nao prova as enclosures analiticas.",
        "",
        "## Failed Checks",
        "",
    ]
    if result["checks_failed"]:
        for item in result["checks_failed"]:
            lines.append(f"- {item['name']}: {item['detail']}")
    else:
        lines.append("- None.")
    path.write_text("\n".join(lines) + "\n", encoding="utf-8")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--pack-dir", required=True)
    parser.add_argument("--mode", action="append", choices=["verify-files", "rerun", "compare"], default=None)
    parser.add_argument("--tolerance", default="1e-10")
    parser.add_argument("--out-json", required=True)
    parser.add_argument("--out-md", required=True)
    args = parser.parse_args()

    pack_dir = Path(args.pack_dir)
    if not pack_dir.is_absolute():
        pack_dir = repo_root() / pack_dir
    modes = args.mode or ["verify-files"]
    result: dict[str, Any] = {
        "pack_dir": str(pack_dir),
        "timestamp": datetime.now(timezone.utc).isoformat(),
        "git_head": git_head(),
        "config_hash": sha256(pack_dir / "config.json"),
        "boxes_csv_hash": sha256(pack_dir / "boxes.csv"),
        "boxes_json_hash": sha256(pack_dir / "boxes.json"),
        "commands_hash": sha256(pack_dir / "commands.sh"),
        "script_hash": sha256(Path(__file__)),
        "checks_passed": [],
        "checks_failed": [],
        "rerun_exit_code": None,
        "max_rerun_diff": None,
    }
    if "verify-files" in modes or "compare" in modes:
        verify_files(pack_dir, result)
    if "rerun" in modes:
        run_rerun(pack_dir, result)
    if "compare" in modes:
        compare_rows(pack_dir, result, Decimal(str(args.tolerance)))

    out_json = Path(args.out_json)
    if not out_json.is_absolute():
        out_json = repo_root() / out_json
    out_md = Path(args.out_md)
    if not out_md.is_absolute():
        out_md = repo_root() / out_md
    out_json.parent.mkdir(parents=True, exist_ok=True)
    with out_json.open("w", encoding="utf-8") as f:
        json.dump(result, f, indent=2, sort_keys=True)
        f.write("\n")
    write_markdown(out_md, result)
    print(f"checks_failed={len(result['checks_failed'])}")
    print(f"wrote {out_json}")
    print(f"wrote {out_md}")


if __name__ == "__main__":
    main()
