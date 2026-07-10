#!/usr/bin/env python3
"""
C2 close-the-bar report
=======================

Consumes either:

1. c2_sigma_v_profile.py detailed CSV
   Columns include surplus_no_tilt, surplus_tilt_norm_only, surplus_tilt_oriented.

2. c2_middle_genuine_ledger.py CSV
   Columns include total_ratio and quarter_surplus_ratio.

It produces a compact CSV + JSON + Markdown report answering:

  - Who should be compared with whom?
  - Which ledger has pointwise margin?
  - Which ledger still has enough uniform/Lean-style margin after taking
    separate lower/upper constants over the grid?
  - Where is the bottleneck?

No zeta input.  This is an accountant, not a prophet.  The prophet is expensive
and keeps asking for interval arithmetic.
"""

from __future__ import annotations

import argparse
import csv
import json
import math
from collections import defaultdict
from dataclasses import asdict, dataclass
from pathlib import Path
from typing import Any


@dataclass(frozen=True)
class TiltGroupReport:
    window: str
    split: str
    sigma: float
    points: int
    pointwise_pass_no_tilt: int
    pointwise_pass_tilt_norm_only: int
    pointwise_pass_tilt_oriented: int
    pointwise_pass_full_tilted: int
    worst_no_tilt: float
    worst_no_tilt_t: float
    worst_tilt_norm_only: float
    worst_tilt_norm_only_t: float
    worst_tilt_oriented: float
    worst_tilt_oriented_t: float
    worst_full_tilted: float
    worst_full_tilted_t: float
    lean_main_lower: float
    lean_oriented_main_lower: float
    lean_rest_upper: float
    lean_tilt_upper: float
    lean_tail_upper: float
    lean_surplus_no_tilt: float
    lean_surplus_tilt_norm_only: float
    lean_surplus_tilt_oriented: float
    branch_defect: float
    branch_abs_defect: float
    verdict: str


@dataclass(frozen=True)
class MiddleGroupReport:
    sigma: float
    points: int
    worst_total_ratio: float
    worst_total_ratio_t: float
    worst_quarter_surplus_ratio: float
    worst_quarter_surplus_t: float
    max_external_ratio: float
    max_lower_factor_ratio: float
    max_cutoff_pressure_ratio: float
    max_horizontal_pressure_ratio: float
    max_ref_delta: float | None
    pass_quarter_ratio: int
    verdict: str


def f(row: dict[str, str], key: str, default: float = 0.0) -> float:
    val = row.get(key, "")
    if val is None or val == "" or val == "None" or val == "n/a":
        return default
    try:
        return float(val)
    except ValueError:
        return default


def read_rows(path: Path) -> list[dict[str, str]]:
    with path.open("r", newline="", encoding="utf-8") as fh:
        return list(csv.DictReader(fh))


def detect_mode(rows: list[dict[str, str]]) -> str:
    if not rows:
        raise ValueError("CSV has no rows")
    keys = set(rows[0].keys())
    if {"surplus_no_tilt", "surplus_tilt_norm_only", "surplus_tilt_oriented"}.issubset(keys):
        return "tilt"
    if {"total_ratio", "quarter_surplus_ratio"}.issubset(keys):
        return "middle"
    raise ValueError(
        "Could not detect CSV mode. Expected c2_sigma_v_profile detail CSV or c2_middle_genuine_ledger CSV."
    )


def group_tilt_rows(rows: list[dict[str, str]]) -> list[TiltGroupReport]:
    groups: dict[tuple[str, str, float], list[dict[str, str]]] = defaultdict(list)
    for row in rows:
        window = row.get("window", "window0")
        split = row.get("split", "unknown")
        sigma = f(row, "sigma")
        groups[(window, split, sigma)].append(row)

    reports: list[TiltGroupReport] = []
    for (window, split, sigma), grows in sorted(groups.items(), key=lambda kv: (kv[0][0], kv[0][1], kv[0][2])):
        def min_row(key: str) -> dict[str, str]:
            return min(grows, key=lambda r: f(r, key, float("inf")))

        worst_no = min_row("surplus_no_tilt")
        worst_norm = min_row("surplus_tilt_norm_only")
        worst_oriented = min_row("surplus_tilt_oriented")
        worst_full = min_row("surplus_full_tilted")

        main_lower = min(f(r, "main_abs", float("inf")) for r in grows)
        oriented_main_lower = min(f(r, "tilted_main_abs", float("inf")) for r in grows)
        rest_upper = max(f(r, "rest_abs") for r in grows)
        tilt_upper = max(f(r, "tilt_abs") for r in grows)
        tail_upper = max(f(r, "tail_upper") for r in grows)
        lean_no = main_lower - rest_upper - tail_upper
        lean_norm = main_lower - rest_upper - tilt_upper - tail_upper
        lean_oriented = oriented_main_lower - rest_upper - tail_upper

        pass_no = sum(1 for r in grows if f(r, "surplus_no_tilt") > 0.0)
        pass_norm = sum(1 for r in grows if f(r, "surplus_tilt_norm_only") > 0.0)
        pass_oriented = sum(1 for r in grows if f(r, "surplus_tilt_oriented") > 0.0)
        pass_full = sum(1 for r in grows if f(r, "surplus_full_tilted") > 0.0)

        if lean_oriented > 0.0:
            verdict = "lean_candidate_oriented_pass"
        elif f(worst_oriented, "surplus_tilt_oriented") > 0.0:
            verdict = "pointwise_oriented_pass_but_uniform_constants_fail"
        elif f(worst_no, "surplus_no_tilt") > 0.0:
            verdict = "base_pointwise_pass_tilt_not_needed"
        else:
            verdict = "fails_on_grid"

        reports.append(
            TiltGroupReport(
                window=window,
                split=split,
                sigma=sigma,
                points=len(grows),
                pointwise_pass_no_tilt=pass_no,
                pointwise_pass_tilt_norm_only=pass_norm,
                pointwise_pass_tilt_oriented=pass_oriented,
                pointwise_pass_full_tilted=pass_full,
                worst_no_tilt=f(worst_no, "surplus_no_tilt"),
                worst_no_tilt_t=f(worst_no, "t"),
                worst_tilt_norm_only=f(worst_norm, "surplus_tilt_norm_only"),
                worst_tilt_norm_only_t=f(worst_norm, "t"),
                worst_tilt_oriented=f(worst_oriented, "surplus_tilt_oriented"),
                worst_tilt_oriented_t=f(worst_oriented, "t"),
                worst_full_tilted=f(worst_full, "surplus_full_tilted"),
                worst_full_tilted_t=f(worst_full, "t"),
                lean_main_lower=main_lower,
                lean_oriented_main_lower=oriented_main_lower,
                lean_rest_upper=rest_upper,
                lean_tilt_upper=tilt_upper,
                lean_tail_upper=tail_upper,
                lean_surplus_no_tilt=lean_no,
                lean_surplus_tilt_norm_only=lean_norm,
                lean_surplus_tilt_oriented=lean_oriented,
                branch_defect=f(grows[0], "branch_defect"),
                branch_abs_defect=f(grows[0], "branch_abs_defect"),
                verdict=verdict,
            )
        )
    return reports


def group_middle_rows(rows: list[dict[str, str]]) -> list[MiddleGroupReport]:
    groups: dict[float, list[dict[str, str]]] = defaultdict(list)
    for row in rows:
        groups[f(row, "sigma")].append(row)

    reports: list[MiddleGroupReport] = []
    for sigma, grows in sorted(groups.items()):
        worst_total = max(grows, key=lambda r: f(r, "total_ratio", -float("inf")))
        worst_surplus = min(grows, key=lambda r: f(r, "quarter_surplus_ratio", float("inf")))
        ref_vals = [f(r, "central_ref_delta", float("nan")) for r in grows if row_has_number(r, "central_ref_delta")]
        max_ref_delta = max(ref_vals) if ref_vals else None
        pass_quarter = sum(1 for r in grows if f(r, "quarter_surplus_ratio") >= 0.0)
        worst_surplus_val = f(worst_surplus, "quarter_surplus_ratio")
        verdict = "quarter_unit_candidate_pass" if worst_surplus_val >= 0.0 else "quarter_unit_fails_on_grid"
        reports.append(
            MiddleGroupReport(
                sigma=sigma,
                points=len(grows),
                worst_total_ratio=f(worst_total, "total_ratio"),
                worst_total_ratio_t=f(worst_total, "t"),
                worst_quarter_surplus_ratio=worst_surplus_val,
                worst_quarter_surplus_t=f(worst_surplus, "t"),
                max_external_ratio=max(f(r, "external_ratio") for r in grows),
                max_lower_factor_ratio=max(f(r, "lower_factor_ratio") for r in grows),
                max_cutoff_pressure_ratio=max(f(r, "cutoff_pressure_ratio") for r in grows),
                max_horizontal_pressure_ratio=max(f(r, "horizontal_pressure_ratio") for r in grows),
                max_ref_delta=max_ref_delta,
                pass_quarter_ratio=pass_quarter,
                verdict=verdict,
            )
        )
    return reports


def row_has_number(row: dict[str, str], key: str) -> bool:
    val = row.get(key, "")
    if val in {"", "None", "n/a"}:
        return False
    try:
        x = float(val)
        return not math.isnan(x)
    except ValueError:
        return False


def write_csv(path: Path, rows: list[Any]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    if not rows:
        raise ValueError(f"No rows to write to {path}")
    with path.open("w", newline="", encoding="utf-8") as fh:
        writer = csv.DictWriter(fh, fieldnames=list(asdict(rows[0]).keys()))
        writer.writeheader()
        for row in rows:
            writer.writerow(asdict(row))


def fmt(x: float | None) -> str:
    if x is None:
        return "n/a"
    if math.isnan(x):
        return "nan"
    if math.isinf(x):
        return "inf" if x > 0 else "-inf"
    return f"{x:.6e}"


def write_markdown(path: Path, mode: str, reports: list[Any], source: Path) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    lines: list[str] = []
    lines.append("# C2 close-the-bar report")
    lines.append("")
    lines.append(f"Source CSV: `{source}`")
    lines.append(f"Detected mode: `{mode}`")
    lines.append("")
    lines.append("## Quem compara com quem")
    lines.append("")
    if mode == "tilt":
        lines.extend([
            "Para o laboratório tilt-aware:",
            "",
            "- Ledger A compara `|main|` contra `|rest| + tail_upper`.",
            "- Ledger B compara `|main|` contra `|rest| + |tilt_main| + tail_upper`; esse é o controle negativo, porque trata tilt como imposto.",
            "- Ledger C compara `|main + tilt_main|` contra `|rest| + tail_upper`; esse é o candidato orientado.",
            "- A coluna `lean_surplus_*` é mais dura que a pontual: usa mínimo do main e máximo do rest/tail no grid inteiro.",
        ])
        ordered = sorted(reports, key=lambda r: r.lean_surplus_tilt_oriented)
        lines.append("")
        lines.append("## Piores grupos por margem Lean-style orientada")
        lines.append("")
        lines.append("| window | split | sigma | pointwise C worst | Lean C surplus | pass C | verdict |")
        lines.append("|---|---|---:|---:|---:|---:|---|")
        for r in ordered[:20]:
            lines.append(
                f"| {r.window} | {r.split} | {r.sigma:.6f} | {fmt(r.worst_tilt_oriented)} | "
                f"{fmt(r.lean_surplus_tilt_oriented)} | {r.pointwise_pass_tilt_oriented}/{r.points} | {r.verdict} |"
            )
        best = sorted(reports, key=lambda r: r.lean_surplus_tilt_oriented, reverse=True)[:10]
        lines.append("")
        lines.append("## Melhores candidatos")
        lines.append("")
        lines.append("| window | split | sigma | Lean C surplus | constants to try in Lean |")
        lines.append("|---|---|---:|---:|---|")
        for r in best:
            constants = (
                f"main≥{fmt(r.lean_oriented_main_lower)}, "
                f"rest≤{fmt(r.lean_rest_upper)}, tail≤{fmt(r.lean_tail_upper)}"
            )
            lines.append(
                f"| {r.window} | {r.split} | {r.sigma:.6f} | {fmt(r.lean_surplus_tilt_oriented)} | {constants} |"
            )
    else:
        lines.extend([
            "Para o livro-caixa middle formal:",
            "",
            "- Comparar `D + G` com `(3/4) * Q`.",
            "- Em razão normalizada, isso é `total_ratio <= 0.75`.",
            "- A margem que sobra é `quarter_surplus_ratio = 0.75 - total_ratio`.",
            "- Se `quarter_surplus_ratio` fica negativa no grid, o bar ainda não fechou. Choque de realidade, mas pelo menos o garçom não mentiu.",
        ])
        ordered = sorted(reports, key=lambda r: r.worst_quarter_surplus_ratio)
        lines.append("")
        lines.append("## Piores sigmas")
        lines.append("")
        lines.append("| sigma | worst total ratio | worst quarter surplus | t | cutoff max | lower max | verdict |")
        lines.append("|---:|---:|---:|---:|---:|---:|---|")
        for r in ordered[:20]:
            lines.append(
                f"| {r.sigma:.6f} | {fmt(r.worst_total_ratio)} | {fmt(r.worst_quarter_surplus_ratio)} | "
                f"{r.worst_quarter_surplus_t:.6f} | {fmt(r.max_cutoff_pressure_ratio)} | "
                f"{fmt(r.max_lower_factor_ratio)} | {r.verdict} |"
            )
    lines.append("")
    lines.append("## Aviso honesto")
    lines.append("")
    lines.append("Este relatório não prova bounds no Lean. Ele escolhe a comparação certa e mede se há folga numérica suficiente para valer a pena formalizar.")
    path.write_text("\n".join(lines) + "\n", encoding="utf-8")


def build_parser() -> argparse.ArgumentParser:
    p = argparse.ArgumentParser(description="Summarize C2 ledger CSVs and extract candidate Lean margins.")
    p.add_argument("csv", type=Path, help="Input CSV from c2_sigma_v_profile.py or c2_middle_genuine_ledger.py")
    p.add_argument("--out-csv", type=Path, default=Path("audit_outputs/c2_bar_report_summary.csv"))
    p.add_argument("--out-json", type=Path, default=Path("audit_outputs/c2_bar_report_summary.json"))
    p.add_argument("--out-md", type=Path, default=Path("audit_outputs/c2_bar_report.md"))
    p.add_argument("--mode", choices=["auto", "tilt", "middle"], default="auto")
    return p


def main() -> None:
    args = build_parser().parse_args()
    rows = read_rows(args.csv)
    mode = detect_mode(rows) if args.mode == "auto" else args.mode
    if mode == "tilt":
        reports: list[Any] = group_tilt_rows(rows)
    else:
        reports = group_middle_rows(rows)

    write_csv(args.out_csv, reports)
    args.out_json.parent.mkdir(parents=True, exist_ok=True)
    args.out_json.write_text(
        json.dumps(
            {
                "source": str(args.csv),
                "mode": mode,
                "reports": [asdict(r) for r in reports],
            },
            indent=2,
            sort_keys=True,
        ),
        encoding="utf-8",
    )
    write_markdown(args.out_md, mode, reports, args.csv)

    print("C2 close-the-bar report")
    print("=======================")
    print(f"source={args.csv}")
    print(f"mode={mode}")
    print(f"groups={len(reports)}")
    if mode == "tilt":
        worst = min(reports, key=lambda r: r.lean_surplus_tilt_oriented)
        best = max(reports, key=lambda r: r.lean_surplus_tilt_oriented)
        print(
            "worst oriented Lean-style surplus: "
            f"{fmt(worst.lean_surplus_tilt_oriented)} "
            f"at window={worst.window}, split={worst.split}, sigma={worst.sigma}"
        )
        print(
            "best oriented Lean-style surplus:  "
            f"{fmt(best.lean_surplus_tilt_oriented)} "
            f"at window={best.window}, split={best.split}, sigma={best.sigma}"
        )
    else:
        worst = min(reports, key=lambda r: r.worst_quarter_surplus_ratio)
        print(
            "worst quarter surplus ratio: "
            f"{fmt(worst.worst_quarter_surplus_ratio)} at sigma={worst.sigma}, "
            f"t={worst.worst_quarter_surplus_t}"
        )
    print("outputs:")
    print(f"  csv:  {args.out_csv}")
    print(f"  json: {args.out_json}")
    print(f"  md:   {args.out_md}")


if __name__ == "__main__":
    main()
