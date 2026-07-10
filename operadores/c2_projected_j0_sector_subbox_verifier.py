#!/usr/bin/env python3
"""
Verify the projected-j0 sector subbox certificate chain.

This verifier checks coverage, aggregation, safe rationalized rounding, hashes,
and budgets. It does not recompute the finite interval sums.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import math
import subprocess
from collections import defaultdict
from dataclasses import dataclass
from decimal import Decimal, getcontext
from pathlib import Path
from typing import Any

import numpy as np

from c2_projected_j0_interval_box_certifier import split_range


getcontext().prec = 80


@dataclass
class CheckLog:
    passed: list[dict[str, str]]
    failed: list[dict[str, str]]

    def ok(self, name: str, detail: str = "") -> None:
        self.passed.append({"name": name, "detail": detail})

    def fail(self, name: str, detail: str = "") -> None:
        self.failed.append({"name": name, "detail": detail})


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


def dec(value: Any) -> Decimal:
    return Decimal(str(value))


def read_jsonl(path: Path) -> list[dict[str, Any]]:
    rows: list[dict[str, Any]] = []
    with path.open() as f:
        for line in f:
            line = line.strip()
            if line:
                rows.append(json.loads(line))
    return rows


def near(a: float, b: float, tol: float) -> bool:
    return abs(float(a) - float(b)) <= tol


def require_file(log: CheckLog, name: str, path: Path) -> None:
    if path.exists():
        log.ok(f"exists:{name}", str(path))
    else:
        log.fail(f"exists:{name}", str(path))


def verify_coverage(
    log: CheckLog,
    subboxes_by_box: dict[str, list[dict[str, Any]]],
    summaries_by_box: dict[str, dict[str, Any]],
    subdiv_sigma: int,
    subdiv_t: int,
    tol: float,
) -> None:
    for box_id, summary in summaries_by_box.items():
        rows = subboxes_by_box.get(box_id, [])
        expected_sigmas = split_range(
            float(summary["sigma_min"]), float(summary["sigma_max"]), int(subdiv_sigma)
        )
        expected_ts = split_range(float(summary["t_min"]), float(summary["t_max"]), int(subdiv_t))
        expected_count = len(expected_sigmas) * len(expected_ts)
        if len(rows) == expected_count:
            log.ok(f"coverage_count:{box_id}", str(len(rows)))
        else:
            log.fail(f"coverage_count:{box_id}", f"{len(rows)} != {expected_count}")
        expected = {
            (
                round(slo, 15),
                round(shi, 15),
                round(tlo, 15),
                round(thi, 15),
            )
            for slo, shi in expected_sigmas
            for tlo, thi in expected_ts
        }
        actual = {
            (
                round(float(row["sigma_min"]), 15),
                round(float(row["sigma_max"]), 15),
                round(float(row["t_min"]), 15),
                round(float(row["t_max"]), 15),
            )
            for row in rows
        }
        if expected == actual:
            log.ok(f"coverage_grid:{box_id}")
        else:
            log.fail(
                f"coverage_grid:{box_id}",
                f"missing={len(expected - actual)} extra={len(actual - expected)}",
            )

        sigma_min = min(float(row["sigma_min"]) for row in rows) if rows else math.nan
        sigma_max = max(float(row["sigma_max"]) for row in rows) if rows else math.nan
        t_min = min(float(row["t_min"]) for row in rows) if rows else math.nan
        t_max = max(float(row["t_max"]) for row in rows) if rows else math.nan
        if (
            near(sigma_min, float(summary["sigma_min"]), tol)
            and near(sigma_max, float(summary["sigma_max"]), tol)
            and near(t_min, float(summary["t_min"]), tol)
            and near(t_max, float(summary["t_max"]), tol)
        ):
            log.ok(f"coverage_bounds:{box_id}")
        else:
            log.fail(
                f"coverage_bounds:{box_id}",
                f"sigma=[{sigma_min},{sigma_max}] t=[{t_min},{t_max}]",
            )


def verify_aggregation(
    log: CheckLog,
    subboxes_by_box: dict[str, list[dict[str, Any]]],
    summaries_by_box: dict[str, dict[str, Any]],
    tol: float,
) -> dict[str, Any]:
    max_pack_diff = Decimal("0")
    max_pack_diff_box = ""
    max_pack_diff_field = ""
    max_subbox_d0 = Decimal("-Infinity")

    for box_id, summary in summaries_by_box.items():
        rows = subboxes_by_box.get(box_id, [])
        if not rows:
            log.fail(f"aggregation:{box_id}", "no subboxes")
            continue
        min_main = min(dec(row["main_abs_lower"]) for row in rows)
        max_d0 = max(dec(row["D0NegReMain_upper"]) for row in rows)
        max_rest_combined = max(dec(row["rest_combined_upper"]) for row in rows)
        max_rest_separate = max(dec(row["rest_separate_upper"]) for row in rows)
        max_subbox_d0 = max(max_subbox_d0, max_d0)

        checks = [
            ("mainNormLowerConst", dec(summary["mainNormLowerConst"]), min_main, "<="),
            ("d0_neg_re_upper", dec(summary["d0_neg_re_upper"]), max_d0, ">="),
            ("restUpperCombinedConst", dec(summary["restUpperCombinedConst"]), max_rest_combined, ">="),
            ("restUpperSeparateConst", dec(summary["restUpperSeparateConst"]), max_rest_separate, ">="),
        ]
        for field, box_value, aggregate, direction in checks:
            if direction == "<=":
                passed = box_value <= aggregate + dec(tol)
                diff = abs(box_value - aggregate)
            else:
                passed = box_value + dec(tol) >= aggregate
                diff = abs(box_value - aggregate)
            if diff > max_pack_diff:
                max_pack_diff = diff
                max_pack_diff_box = box_id
                max_pack_diff_field = field
            if passed:
                log.ok(f"aggregation_{field}:{box_id}", f"diff={diff}")
            else:
                log.fail(
                    f"aggregation_{field}:{box_id}",
                    f"box={box_value} aggregate={aggregate}",
                )

    if max_subbox_d0 <= 0:
        log.ok("sector_all_subboxes", f"max={max_subbox_d0}")
    else:
        log.fail("sector_all_subboxes", f"max={max_subbox_d0}")

    return {
        "max_pack_aggregate_diff": str(max_pack_diff),
        "max_pack_aggregate_diff_box": max_pack_diff_box,
        "max_pack_aggregate_diff_field": max_pack_diff_field,
        "max_subbox_d0_neg_re_upper": str(max_subbox_d0),
    }


def verify_rationalized(
    log: CheckLog,
    summaries_by_box: dict[str, dict[str, Any]],
    rat_rows: list[dict[str, Any]],
) -> dict[str, Any]:
    rat_by_box = {row["source_box_id"]: row for row in rat_rows}
    min_combined = Decimal("Infinity")
    min_separate = Decimal("Infinity")
    worst_combined = ""
    worst_separate = ""
    max_budget_loss = Decimal("0")
    max_budget_loss_box = ""

    for box_id, summary in summaries_by_box.items():
        rat = rat_by_box.get(box_id)
        if rat is None:
            log.fail(f"rat_exists:{box_id}")
            continue
        log.ok(f"rat_exists:{box_id}")

        main_box = dec(summary["mainNormLowerConst"])
        d0_box = dec(summary["d0_neg_re_upper"])
        rest_combined_box = dec(summary["restUpperCombinedConst"])
        rest_separate_box = dec(summary["restUpperSeparateConst"])

        main_rat = dec(rat["mainNormLowerConst_rat"])
        d0_rat = dec(rat["d0_neg_re_upper_rat"])
        rest_combined_rat = dec(rat["restUpperCombinedConst_rat"])
        rest_separate_rat = dec(rat["restUpperSeparateConst_rat"])
        budget_combined_rat = main_rat - rest_combined_rat
        budget_separate_rat = main_rat - rest_separate_rat

        checks = [
            ("main_round_down", main_rat <= main_box),
            ("d0_round_up", d0_rat >= d0_box),
            ("rest_combined_round_up", rest_combined_rat >= rest_combined_box),
            ("rest_separate_round_up", rest_separate_rat >= rest_separate_box),
            ("d0_nonpositive", d0_rat <= 0),
            ("budget_combined_positive", budget_combined_rat > 0),
            ("budget_separate_positive", budget_separate_rat > 0),
        ]
        for name, passed in checks:
            if passed:
                log.ok(f"{name}:{box_id}")
            else:
                log.fail(f"{name}:{box_id}")

        if budget_combined_rat < min_combined:
            min_combined = budget_combined_rat
            worst_combined = box_id
        if budget_separate_rat < min_separate:
            min_separate = budget_separate_rat
            worst_separate = box_id

        raw_budget_combined = dec(summary["sectorBudgetCombined"])
        budget_loss = raw_budget_combined - budget_combined_rat
        if budget_loss > max_budget_loss:
            max_budget_loss = budget_loss
            max_budget_loss_box = box_id

    return {
        "min_sector_budget_combined_rat": str(min_combined),
        "min_sector_budget_separate_rat": str(min_separate),
        "worst_combined_box": worst_combined,
        "worst_separate_box": worst_separate,
        "max_rationalized_budget_loss": str(max_budget_loss),
        "max_rationalized_budget_loss_box": max_budget_loss_box,
    }


def write_markdown(path: Path, result: dict[str, Any]) -> None:
    path.write_text(
        "# Audit Projected J0 Positive Box Sector Subbox Verification\n\n"
        "Rota: Genuine-First. Esta verificacao confere cobertura, agregacao, "
        "direcoes de arredondamento e budgets do certificado externo por "
        "subcaixa. Ela nao recomputa as somas intervalares.\n\n"
        "## Resultado\n\n"
        f"- Checks failed: {len(result['checks_failed'])}\n"
        f"- Boxes: {result['boxes_count']}\n"
        f"- Subboxes: {result['subboxes_count']}\n"
        f"- Max subbox D0NegReMain upper: {result['max_subbox_d0_neg_re_upper']}\n"
        f"- Min sector budget combined rat: {result['min_sector_budget_combined_rat']}\n"
        f"- Min sector budget separate rat: {result['min_sector_budget_separate_rat']}\n"
        f"- Worst combined box: `{result['worst_combined_box']}`\n"
        f"- Max rationalized budget loss: {result['max_rationalized_budget_loss']}\n\n"
        "## Respostas\n\n"
        "1. As subcaixas cobrem cada caixa se os checks `coverage_*` passam.\n"
        "2. A agregacao box-level e consistente se os checks `aggregation_*` passam.\n"
        "3. O setor passa quando `sector_all_subboxes` passa.\n"
        "4. O pack racionalizado e seguro contra os agregados quando os checks "
        "`*_round_*`, `d0_nonpositive` e `budget_*_positive` passam.\n"
        "5. Este nivel ainda nao prova que as enclosures por subcaixa sao "
        "corretas; ele verifica a trilha externa granular.\n\n"
        "## Failed Checks\n\n"
        + ("\n".join(f"- {x['name']}: {x.get('detail', '')}" for x in result["checks_failed"]) or "- None")
        + "\n"
    )


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        description="Verify projected-j0 sector subbox certificate artifacts."
    )
    parser.add_argument("--subbox-cert-dir", type=Path, required=True)
    parser.add_argument("--rationalized-pack-dir", type=Path, required=True)
    parser.add_argument("--out-json", type=Path, required=True)
    parser.add_argument("--out-md", type=Path, required=True)
    parser.add_argument("--tolerance", type=float, default=1.0e-12)
    return parser


def main() -> None:
    args = build_parser().parse_args()
    log = CheckLog([], [])
    config_path = args.subbox_cert_dir / "config.json"
    subbox_path = args.subbox_cert_dir / "subboxes.jsonl"
    summary_path = args.subbox_cert_dir / "boxes_summary.json"
    readme_path = args.subbox_cert_dir / "README.md"
    rat_config_path = args.rationalized_pack_dir / "config.json"
    rat_boxes_path = args.rationalized_pack_dir / "boxes_sector_rationalized.json"

    for name, path in [
        ("config", config_path),
        ("subboxes", subbox_path),
        ("boxes_summary", summary_path),
        ("README", readme_path),
        ("rat_config", rat_config_path),
        ("rat_boxes", rat_boxes_path),
    ]:
        require_file(log, name, path)

    config = json.loads(config_path.read_text())
    subboxes = read_jsonl(subbox_path)
    summaries = json.loads(summary_path.read_text())
    rat_rows = json.loads(rat_boxes_path.read_text())
    summaries_by_box = {row["source_box_id"]: row for row in summaries}
    subboxes_by_box: dict[str, list[dict[str, Any]]] = defaultdict(list)
    for row in subboxes:
        subboxes_by_box[row["source_box_id"]].append(row)

    if len(summaries) == int(config["boxes_count"]):
        log.ok("boxes_count", str(len(summaries)))
    else:
        log.fail("boxes_count", f"{len(summaries)} != {config['boxes_count']}")
    if len(subboxes) == int(config["subboxes_count"]):
        log.ok("subboxes_count", str(len(subboxes)))
    else:
        log.fail("subboxes_count", f"{len(subboxes)} != {config['subboxes_count']}")

    params = config["parameters"]
    verify_coverage(
        log,
        subboxes_by_box,
        summaries_by_box,
        int(params["subdiv_sigma"]),
        int(params["subdiv_t"]),
        float(args.tolerance),
    )
    aggregate_info = verify_aggregation(
        log, subboxes_by_box, summaries_by_box, float(args.tolerance)
    )
    rat_info = verify_rationalized(log, summaries_by_box, rat_rows)

    hashes = {
        "config": file_sha256(config_path),
        "subboxes": file_sha256(subbox_path),
        "boxes_summary": file_sha256(summary_path),
        "readme": file_sha256(readme_path),
        "rationalized_config": file_sha256(rat_config_path),
        "rationalized_boxes": file_sha256(rat_boxes_path),
        "source_script": config.get("script_sha256"),
    }

    result = {
        "git_head": git_head(),
        "checks_passed": log.passed,
        "checks_failed": log.failed,
        "hashes": hashes,
        "boxes_count": len(summaries),
        "subboxes_count": len(subboxes),
        "subbox_cert_dir": str(args.subbox_cert_dir),
        "rationalized_pack_dir": str(args.rationalized_pack_dir),
        **aggregate_info,
        **rat_info,
    }

    args.out_json.parent.mkdir(parents=True, exist_ok=True)
    args.out_json.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    write_markdown(args.out_md, result)

    print("C2 projected-j0 sector subbox verifier")
    print("======================================")
    print(f"checks_failed={len(log.failed)} boxes={len(summaries)} subboxes={len(subboxes)}")
    print(f"JSON: {args.out_json}")
    print(f"MD: {args.out_md}")
    if log.failed:
        for item in log.failed[:20]:
            print(f"FAIL {item['name']}: {item.get('detail', '')}")


if __name__ == "__main__":
    main()
