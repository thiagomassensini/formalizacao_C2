#!/usr/bin/env python3
"""
Verifier for projected-j0 external certificate packs.

This script checks the reproducible pack layout, recomputes the elementary
budget identities recorded in the pack, optionally reruns the saved command,
and compares the resulting certifier CSV against the packed CSV.

It is an external audit tool.  It does not create Lean theorems.
"""

from __future__ import annotations

import argparse
import csv
import hashlib
import json
import math
import os
import subprocess
import sys
from datetime import datetime, timezone
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
    "mainNormLowerConst",
    "numeratorUpperConst",
    "parallelUpperConst",
    "restUpperCombinedConst",
    "restUpperSeparateConst",
    "budgetCombinedConst",
    "budgetSeparateConst",
]

COMPARE_FIELDS = [
    "mainNormLowerConst",
    "numeratorUpperConst",
    "parallelUpperConst",
    "restUpperCombinedConst",
    "restUpperSeparateConst",
    "budgetCombinedConst",
    "budgetSeparateConst",
]


def repo_root() -> Path:
    return Path(__file__).resolve().parents[1]


def resolve_repo_path(path_text: str | None) -> Path | None:
    if not path_text:
        return None
    path = Path(path_text)
    if path.is_absolute():
        return path
    return repo_root() / path


def sha256_file(path: Path) -> str | None:
    if not path.exists():
        return None
    h = hashlib.sha256()
    with path.open("rb") as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b""):
            h.update(chunk)
    return h.hexdigest()


def git_head() -> str | None:
    try:
        proc = subprocess.run(
            ["git", "rev-parse", "HEAD"],
            cwd=repo_root(),
            check=False,
            text=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
        )
    except OSError:
        return None
    if proc.returncode != 0:
        return None
    return proc.stdout.strip() or None


def load_json(path: Path) -> Any:
    with path.open("r", encoding="utf-8") as f:
        return json.load(f)


def load_csv_rows(path: Path) -> list[dict[str, str]]:
    with path.open("r", encoding="utf-8", newline="") as f:
        return list(csv.DictReader(f))


def json_rows(payload: Any) -> list[dict[str, Any]]:
    if isinstance(payload, list):
        return payload
    if isinstance(payload, dict) and isinstance(payload.get("rows"), list):
        return payload["rows"]
    raise ValueError("JSON payload must be a row list or contain a rows list")


def as_float(row: dict[str, Any], field: str) -> float:
    value = row.get(field)
    if value is None or value == "":
        raise ValueError(f"missing numeric field {field}")
    return float(value)


def as_bool(value: Any) -> bool:
    if isinstance(value, bool):
        return value
    if isinstance(value, (int, float)):
        return bool(value)
    return str(value).strip().lower() in {"true", "1", "yes", "y"}


def row_id(row: dict[str, Any]) -> str:
    return str(row.get("source_box_id", ""))


def add_check(result: dict[str, Any], name: str, ok: bool, detail: str = "") -> None:
    item = {"name": name, "detail": detail}
    if ok:
        result["checks_passed"].append(item)
    else:
        result["checks_failed"].append(item)


def rows_by_id(rows: list[dict[str, Any]]) -> dict[str, dict[str, Any]]:
    out: dict[str, dict[str, Any]] = {}
    for row in rows:
        rid = row_id(row)
        if rid:
            out[rid] = row
    return out


def max_abs_numeric_diffs(
    expected_rows: list[dict[str, Any]],
    actual_rows: list[dict[str, Any]],
) -> tuple[dict[str, float], dict[str, str]]:
    expected = rows_by_id(expected_rows)
    actual = rows_by_id(actual_rows)
    diffs = {field: 0.0 for field in COMPARE_FIELDS}
    diff_boxes = {field: "" for field in COMPARE_FIELDS}
    for rid, exp in expected.items():
        act = actual.get(rid)
        if act is None:
            continue
        for field in COMPARE_FIELDS:
            diff = abs(as_float(exp, field) - as_float(act, field))
            if diff > diffs[field]:
                diffs[field] = diff
                diff_boxes[field] = rid
    return diffs, diff_boxes


def compute_summary(rows: list[dict[str, Any]]) -> dict[str, Any]:
    budgets_combined = [as_float(row, "budgetCombinedConst") for row in rows]
    budgets_separate = [as_float(row, "budgetSeparateConst") for row in rows]
    combined_true = [row for row in rows if as_bool(row.get("certified_combined"))]
    separate_true = [row for row in rows if as_bool(row.get("certified_separate"))]
    worst_combined = min(rows, key=lambda row: as_float(row, "budgetCombinedConst")) if rows else {}
    worst_separate = min(rows, key=lambda row: as_float(row, "budgetSeparateConst")) if rows else {}
    return {
        "boxes": len(rows),
        "certified_combined": len(combined_true),
        "certified_separate": len(separate_true),
        "all_combined_certified": len(combined_true) == len(rows),
        "all_separate_certified": len(separate_true) == len(rows),
        "min_budget_combined": min(budgets_combined) if budgets_combined else None,
        "min_budget_separate": min(budgets_separate) if budgets_separate else None,
        "worst_box_combined": row_id(worst_combined) if worst_combined else None,
        "worst_box_separate": row_id(worst_separate) if worst_separate else None,
    }


def verify_files(pack_dir: Path, tolerance: float, result: dict[str, Any]) -> dict[str, Any]:
    for name in REQUIRED_FILES:
        path = pack_dir / name
        add_check(result, f"exists:{name}", path.exists(), str(path))

    config_path = pack_dir / "config.json"
    boxes_csv_path = pack_dir / "boxes.csv"
    boxes_json_path = pack_dir / "boxes.json"
    if not (config_path.exists() and boxes_csv_path.exists() and boxes_json_path.exists()):
        return {}

    config = load_json(config_path)
    csv_rows = load_csv_rows(boxes_csv_path)
    json_payload = load_json(boxes_json_path)
    json_pack_rows = json_rows(json_payload)

    add_check(
        result,
        "boxes_csv_json_count",
        len(csv_rows) == len(json_pack_rows),
        f"csv={len(csv_rows)} json={len(json_pack_rows)}",
    )

    csv_ids = [row_id(row) for row in csv_rows]
    json_ids = [row_id(row) for row in json_pack_rows]
    add_check(result, "boxes_csv_json_ids", csv_ids == json_ids, "source_box_id order")

    duplicate_ids = len(set(csv_ids)) != len(csv_ids)
    add_check(result, "no_duplicate_box_ids", not duplicate_ids, "")

    all_combined = all(as_bool(row.get("certified_combined")) for row in csv_rows)
    add_check(result, "all_combined_certified", all_combined, "")

    all_main_positive = all(as_float(row, "mainNormLowerConst") > 0 for row in csv_rows)
    all_num_nonneg = all(as_float(row, "numeratorUpperConst") >= 0 for row in csv_rows)
    add_check(result, "mainNormLowerConst_positive", all_main_positive, "")
    add_check(result, "numeratorUpperConst_nonnegative", all_num_nonneg, "")

    separate_flags_match_budget = all(
        as_bool(row.get("certified_separate"))
        == (as_float(row, "budgetSeparateConst") > 0)
        for row in csv_rows
    )
    combined_flags_match_budget = all(
        as_bool(row.get("certified_combined"))
        == (as_float(row, "budgetCombinedConst") > 0)
        for row in csv_rows
    )
    add_check(result, "combined_flags_match_budget", combined_flags_match_budget, "")
    add_check(result, "separate_flags_match_budget", separate_flags_match_budget, "")

    max_identity_diffs = {
        "parallelUpperConst": 0.0,
        "budgetCombinedConst": 0.0,
        "budgetSeparateConst": 0.0,
    }
    identity_diff_boxes = {key: "" for key in max_identity_diffs}
    for row in csv_rows:
        rid = row_id(row)
        main = as_float(row, "mainNormLowerConst")
        num = as_float(row, "numeratorUpperConst")
        rest_combined = as_float(row, "restUpperCombinedConst")
        rest_separate = as_float(row, "restUpperSeparateConst")
        recorded_parallel = as_float(row, "parallelUpperConst")
        recorded_combined = as_float(row, "budgetCombinedConst")
        recorded_separate = as_float(row, "budgetSeparateConst")
        parallel = num / main
        budget_combined = main - parallel - rest_combined
        budget_separate = main - parallel - rest_separate
        candidates = {
            "parallelUpperConst": abs(parallel - recorded_parallel),
            "budgetCombinedConst": abs(budget_combined - recorded_combined),
            "budgetSeparateConst": abs(budget_separate - recorded_separate),
        }
        for field, diff in candidates.items():
            if diff > max_identity_diffs[field]:
                max_identity_diffs[field] = diff
                identity_diff_boxes[field] = rid

    result["identity_max_abs_diffs"] = max_identity_diffs
    result["identity_diff_boxes"] = identity_diff_boxes
    add_check(
        result,
        "parallel_and_budget_identities",
        all(diff <= tolerance for diff in max_identity_diffs.values()),
        json.dumps(max_identity_diffs, sort_keys=True),
    )

    summary = compute_summary(csv_rows)
    result.update(
        {
            "min_budget_combined": summary["min_budget_combined"],
            "min_budget_separate": summary["min_budget_separate"],
            "worst_box_combined": summary["worst_box_combined"],
            "worst_box_separate": summary["worst_box_separate"],
            "pack_summary": summary,
        }
    )

    source_csv = resolve_repo_path(config.get("source_csv"))
    source_json = resolve_repo_path(config.get("source_json"))
    script_path = resolve_repo_path(config.get("script") or "operadores/c2_projected_j0_interval_box_certifier.py")
    result.update(
        {
            "config_hash": sha256_file(config_path),
            "boxes_csv_hash": sha256_file(boxes_csv_path),
            "boxes_json_hash": sha256_file(boxes_json_path),
            "source_csv_hash": sha256_file(source_csv) if source_csv else None,
            "source_json_hash": sha256_file(source_json) if source_json else None,
            "certifier_script_hash": sha256_file(script_path) if script_path else None,
            "recorded_certifier_script_hash": config.get("script_sha256"),
        }
    )
    add_check(
        result,
        "certifier_script_hash_matches_config",
        result["certifier_script_hash"] == result["recorded_certifier_script_hash"],
        f"current={result['certifier_script_hash']} recorded={result['recorded_certifier_script_hash']}",
    )
    return {"config": config, "rows": csv_rows}


def rerun_pack(pack_dir: Path, result: dict[str, Any]) -> None:
    commands_path = pack_dir / "commands.sh"
    if not commands_path.exists():
        add_check(result, "rerun_commands_sh_exists", False, str(commands_path))
        return
    proc = subprocess.run(
        ["bash", str(commands_path.resolve())],
        cwd=repo_root(),
        text=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        check=False,
    )
    result["rerun"] = {
        "command": ["bash", str(commands_path.resolve())],
        "exit_code": proc.returncode,
        "stdout_tail": proc.stdout[-4000:],
        "stderr_tail": proc.stderr[-4000:],
    }
    add_check(result, "rerun_exit_code_zero", proc.returncode == 0, f"exit={proc.returncode}")


def compare_rerun(pack_dir: Path, tolerance: float, result: dict[str, Any]) -> None:
    config_path = pack_dir / "config.json"
    boxes_csv_path = pack_dir / "boxes.csv"
    if not config_path.exists() or not boxes_csv_path.exists():
        add_check(result, "compare_inputs_exist", False, "")
        return

    config = load_json(config_path)
    source_csv = resolve_repo_path(config.get("source_csv"))
    if source_csv is None or not source_csv.exists():
        add_check(result, "compare_source_csv_exists", False, str(source_csv))
        return

    expected_rows = load_csv_rows(boxes_csv_path)
    actual_rows = load_csv_rows(source_csv)

    expected_ids = [row_id(row) for row in expected_rows]
    actual_ids = [row_id(row) for row in actual_rows]
    add_check(
        result,
        "compare_row_ids",
        expected_ids == actual_ids,
        f"pack={len(expected_ids)} rerun={len(actual_ids)}",
    )

    diffs, diff_boxes = max_abs_numeric_diffs(expected_rows, actual_rows)
    result["max_abs_diffs"] = diffs
    result["max_abs_diff_boxes"] = diff_boxes
    add_check(
        result,
        "compare_numeric_fields_within_tolerance",
        all(diff <= tolerance for diff in diffs.values()),
        json.dumps(diffs, sort_keys=True),
    )

    source_payload_path = resolve_repo_path(config.get("source_json"))
    if source_payload_path is not None and source_payload_path.exists():
        source_payload = load_json(source_payload_path)
        source_rows = json_rows(source_payload)
        add_check(
            result,
            "compare_source_json_row_count",
            len(source_rows) == len(expected_rows),
            f"source_json_rows={len(source_rows)} pack_rows={len(expected_rows)}",
        )


def write_json(path: Path, result: dict[str, Any]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", encoding="utf-8") as f:
        json.dump(result, f, indent=2, sort_keys=True)
        f.write("\n")


def write_markdown(path: Path, result: dict[str, Any]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    pack_summary = result.get("pack_summary", {})
    max_diffs = result.get("max_abs_diffs", {})
    max_field = None
    if max_diffs:
        max_field = max(max_diffs, key=lambda field: max_diffs[field])
    separate_failures = []
    pack_dir = Path(result["pack_dir"])
    boxes_csv_path = pack_dir / "boxes.csv"
    if boxes_csv_path.exists():
        rows = load_csv_rows(boxes_csv_path)
        separate_failures = [
            row for row in rows
            if not as_bool(row.get("certified_separate"))
        ]

    lines = [
        f"# Projected J0 Certificate Pack Verification",
        "",
        f"Pack: `{result['pack_dir']}`",
        "",
        "This is an external reproducibility check. It is not a Lean proof.",
        "",
        "## Result",
        "",
        f"- Checks passed: {len(result['checks_passed'])}",
        f"- Checks failed: {len(result['checks_failed'])}",
        f"- Boxes: {pack_summary.get('boxes')}",
        f"- Certified combined: {pack_summary.get('certified_combined')}/{pack_summary.get('boxes')}",
        f"- Certified separate: {pack_summary.get('certified_separate')}/{pack_summary.get('boxes')}",
        f"- Min budget combined: {result.get('min_budget_combined')}",
        f"- Min budget separate: {result.get('min_budget_separate')}",
        f"- Worst combined box: `{result.get('worst_box_combined')}`",
        f"- Worst separate box: `{result.get('worst_box_separate')}`",
    ]
    if result.get("rerun") is not None:
        lines.extend([
            f"- Rerun exit code: {result['rerun'].get('exit_code')}",
        ])
    if max_diffs:
        lines.extend([
            f"- Largest rerun diff field: `{max_field}` = {max_diffs[max_field]}",
        ])
    lines.extend(["", "## Internal Identities", ""])
    for field, diff in result.get("identity_max_abs_diffs", {}).items():
        box = result.get("identity_diff_boxes", {}).get(field, "")
        lines.append(f"- `{field}` max abs identity diff: {diff} at `{box}`")
    lines.extend(["", "## Rerun Diffs", ""])
    if max_diffs:
        for field in COMPARE_FIELDS:
            box = result.get("max_abs_diff_boxes", {}).get(field, "")
            lines.append(f"- `{field}` max abs diff: {max_diffs.get(field)} at `{box}`")
    else:
        lines.append("- Rerun comparison not requested.")
    if separate_failures:
        lines.extend(["", "## Separate Failures", ""])
        for row in separate_failures:
            lines.append(
                f"- `{row_id(row)}`: budgetSeparateConst = {row.get('budgetSeparateConst')}"
            )
    lines.extend(["", "## Failed Checks", ""])
    if result["checks_failed"]:
        for item in result["checks_failed"]:
            lines.append(f"- `{item['name']}`: {item['detail']}")
    else:
        lines.append("- None.")
    lines.extend([
        "",
        "## Lean Status",
        "",
        "The pack is only an external certificate artifact. Turning it into a",
        "formal proof still requires a trusted checker or a formalized interval",
        "certificate path that supplies the analytic fields consumed by",
        "`ProjectedJ0ConstantBoxData`.",
        "",
    ])
    path.write_text("\n".join(lines), encoding="utf-8")


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--pack-dir", required=True)
    parser.add_argument(
        "--mode",
        choices=["verify-files", "rerun", "compare"],
        action="append",
        default=[],
        help="May be passed more than once. Defaults to verify-files.",
    )
    parser.add_argument("--tolerance", type=float, default=1e-10)
    parser.add_argument("--out-json", default="")
    parser.add_argument("--out-md", default="")
    args = parser.parse_args(argv)

    modes = args.mode or ["verify-files"]
    pack_dir = Path(args.pack_dir).resolve()

    result: dict[str, Any] = {
        "pack_dir": str(pack_dir),
        "timestamp": datetime.now(timezone.utc).isoformat(),
        "modes": modes,
        "tolerance": args.tolerance,
        "git_head": git_head(),
        "checks_passed": [],
        "checks_failed": [],
    }

    pack_data: dict[str, Any] = {}
    if "verify-files" in modes or "compare" in modes:
        pack_data = verify_files(pack_dir, args.tolerance, result)

    if "rerun" in modes:
        rerun_pack(pack_dir, result)

    if "compare" in modes:
        if not pack_data and not result["checks_failed"]:
            verify_files(pack_dir, args.tolerance, result)
        compare_rerun(pack_dir, args.tolerance, result)

    if args.out_json:
        write_json(Path(args.out_json), result)
    if args.out_md:
        write_markdown(Path(args.out_md), result)

    return 0 if not result["checks_failed"] else 1


if __name__ == "__main__":
    raise SystemExit(main())
