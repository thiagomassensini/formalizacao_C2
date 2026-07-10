#!/usr/bin/env python3
"""Diagnostic scanner for the positive-box odd truncation target.

This script is audit-only.  The formal Lean target is the raw truncation

    |rectangularOddCoreSum(s, 50) - oddDirichletChannel(s)|.

In the positive box, `Re(s) < 1`, so the raw Dirichlet series is not evaluated
as a convergent series.  For diagnostics only, this scanner uses the same
continued odd-channel mode as the existing horizontal q-ratio scanner.
"""

from __future__ import annotations

import argparse
import csv
import json
import sys
from dataclasses import asdict, dataclass
from fractions import Fraction
from pathlib import Path

import mpmath as mp

from audit_horizontal_qratio_scanner import (
    CHANNEL_MODE,
    fmt,
    odd_dirichlet_channel_diagnostic,
    q_value,
    rectangular_odd_core_sum,
)


DEFAULT_CUTOFF = 50

SIGMA_MIN = mp.mpf("nan")
SIGMA_MAX = mp.mpf("nan")
T_MIN = mp.mpf("nan")
T_MAX = mp.mpf("nan")
TARGET = mp.mpf("nan")
HORIZONTAL_TARGET = mp.mpf("nan")


def reset_constants() -> None:
    global SIGMA_MIN, SIGMA_MAX, T_MIN, T_MAX, TARGET, HORIZONTAL_TARGET
    SIGMA_MIN = mp.mpf(21) / 25
    SIGMA_MAX = mp.mpf(43) / 50
    T_MIN = mp.mpf(525) / 16
    T_MAX = mp.mpf(263) / 8
    TARGET = mp.mpf(7) / 180
    HORIZONTAL_TARGET = mp.mpf(1) / 100


reset_constants()


@dataclass
class PointRow:
    subbox_id: str
    sigma: str
    t: str
    cutoff: int
    q_abs: str
    odd_trunc_norm: str
    odd_trunc_over_target: str
    h_qratio: str
    raw_core_sum: str
    continued_odd_target: str
    odd_trunc_vector: str
    channel_mode: str


@dataclass
class SubboxRow:
    subbox_id: str
    sigma_box: str
    t_box: str
    cutoff: int
    sample_count: int
    odd_trunc_sup_sampled: str
    odd_trunc_guarded: str
    odd_trunc_target: str
    odd_trunc_slack_sampled: str
    odd_trunc_slack_guarded: str
    odd_trunc_sup_over_target: str
    h_qratio_sup_sampled: str
    h_qratio_target: str
    max_q_abs_sampled: str
    max_sigma: str
    max_t: str
    max_raw_core_sum: str
    max_continued_odd_target: str
    max_odd_trunc_vector: str
    channel_mode: str
    status_sampled: str
    status_guarded: str


def parse_args(argv: list[str]) -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Scan the positive-box odd truncation diagnostic target."
    )
    parser.add_argument("--dps", type=int, default=80)
    parser.add_argument("--cutoff", type=int, default=DEFAULT_CUTOFF)
    parser.add_argument("--sigma-divisions", type=int, default=8)
    parser.add_argument("--t-divisions", type=int, default=8)
    parser.add_argument(
        "--local-grid",
        type=int,
        default=7,
        help="Sample points per axis inside each subbox, including endpoints.",
    )
    parser.add_argument(
        "--guard-factor",
        default="1.10",
        help="Purely diagnostic multiplier applied to each sampled subbox sup.",
    )
    parser.add_argument("--csv", default="audit_positive_box_odd_truncation_subboxes.csv")
    parser.add_argument("--points-csv", default="audit_positive_box_odd_truncation_points.csv")
    parser.add_argument("--json", default="audit_positive_box_odd_truncation_summary.json")
    return parser.parse_args(argv)


def grid(a: mp.mpf, b: mp.mpf, count: int) -> list[mp.mpf]:
    if count < 2:
        return [a]
    step = (b - a) / (count - 1)
    return [a + i * step for i in range(count)]


def boxes(sigma_divisions: int, t_divisions: int) -> list[tuple[str, mp.mpf, mp.mpf, mp.mpf, mp.mpf]]:
    sigma_edges = grid(SIGMA_MIN, SIGMA_MAX, sigma_divisions + 1)
    t_edges = grid(T_MIN, T_MAX, t_divisions + 1)
    out = []
    for i in range(sigma_divisions):
        for j in range(t_divisions):
            out.append(
                (
                    f"S{i:02d}_T{j:02d}",
                    sigma_edges[i],
                    sigma_edges[i + 1],
                    t_edges[j],
                    t_edges[j + 1],
                )
            )
    return out


def odd_truncation_diagnostic(s: mp.mpc, cutoff: int) -> tuple[mp.mpf, mp.mpc, mp.mpc, mp.mpc]:
    raw_core = rectangular_odd_core_sum(s, cutoff)
    continued_target = odd_dirichlet_channel_diagnostic(s)
    vector = raw_core - continued_target
    return abs(vector), vector, raw_core, continued_target


def h_qratio_from_odd_norm(s: mp.mpc, odd_norm: mp.mpf) -> mp.mpf:
    q_abs = abs(q_value(s))
    return 2 * q_abs**2 * odd_norm / (1 - q_abs)


def point_row(subbox_id: str, sigma: mp.mpf, t: mp.mpf, cutoff: int) -> PointRow:
    s = mp.mpc(sigma, t)
    odd_norm, vector, raw_core, continued_target = odd_truncation_diagnostic(s, cutoff)
    q_abs = abs(q_value(s))
    h_qratio = h_qratio_from_odd_norm(s, odd_norm)
    return PointRow(
        subbox_id=subbox_id,
        sigma=fmt(sigma),
        t=fmt(t),
        cutoff=cutoff,
        q_abs=fmt(q_abs),
        odd_trunc_norm=fmt(odd_norm),
        odd_trunc_over_target=fmt(odd_norm / TARGET),
        h_qratio=fmt(h_qratio),
        raw_core_sum=fmt(raw_core),
        continued_odd_target=fmt(continued_target),
        odd_trunc_vector=fmt(vector),
        channel_mode=CHANNEL_MODE,
    )


def as_mpf(row: PointRow, field: str) -> mp.mpf:
    return mp.mpf(getattr(row, field))


def scan_subbox(
    subbox_id: str,
    sigma0: mp.mpf,
    sigma1: mp.mpf,
    t0: mp.mpf,
    t1: mp.mpf,
    cutoff: int,
    local_grid: int,
    guard_factor: mp.mpf,
) -> tuple[SubboxRow, list[PointRow]]:
    points: list[PointRow] = []
    for sigma in grid(sigma0, sigma1, local_grid):
        for t in grid(t0, t1, local_grid):
            points.append(point_row(subbox_id, sigma, t, cutoff))

    max_point = max(points, key=lambda row: as_mpf(row, "odd_trunc_norm"))
    sup = as_mpf(max_point, "odd_trunc_norm")
    guarded = guard_factor * sup
    h_sup = max(as_mpf(row, "h_qratio") for row in points)
    q_sup = max(as_mpf(row, "q_abs") for row in points)
    row = SubboxRow(
        subbox_id=subbox_id,
        sigma_box=f"[{fmt(sigma0)}, {fmt(sigma1)}]",
        t_box=f"[{fmt(t0)}, {fmt(t1)}]",
        cutoff=cutoff,
        sample_count=len(points),
        odd_trunc_sup_sampled=fmt(sup),
        odd_trunc_guarded=fmt(guarded),
        odd_trunc_target=fmt(TARGET),
        odd_trunc_slack_sampled=fmt(TARGET - sup),
        odd_trunc_slack_guarded=fmt(TARGET - guarded),
        odd_trunc_sup_over_target=fmt(sup / TARGET),
        h_qratio_sup_sampled=fmt(h_sup),
        h_qratio_target=fmt(HORIZONTAL_TARGET),
        max_q_abs_sampled=fmt(q_sup),
        max_sigma=max_point.sigma,
        max_t=max_point.t,
        max_raw_core_sum=max_point.raw_core_sum,
        max_continued_odd_target=max_point.continued_odd_target,
        max_odd_trunc_vector=max_point.odd_trunc_vector,
        channel_mode=CHANNEL_MODE,
        status_sampled="pass" if sup <= TARGET else "fail",
        status_guarded="pass" if guarded <= TARGET else "fail",
    )
    return row, points


def write_csv(path: Path, rows: list[object]) -> None:
    if not rows:
        return
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=list(asdict(rows[0]).keys()))
        writer.writeheader()
        for row in rows:
            writer.writerow(asdict(row))


def rational_above(x: mp.mpf, max_denominator: int = 10000) -> str:
    frac = Fraction(str(mp.nstr(x, 50))).limit_denominator(max_denominator)
    if mp.mpf(frac.numerator) / frac.denominator < x:
        frac = Fraction(frac.numerator + 1, frac.denominator)
    return f"{frac.numerator} / {frac.denominator}"


def build_summary(
    args: argparse.Namespace,
    subbox_rows: list[SubboxRow],
    point_rows: list[PointRow],
    guard_factor: mp.mpf,
) -> dict[str, object]:
    worst_subbox = max(subbox_rows, key=lambda row: mp.mpf(row.odd_trunc_sup_sampled))
    worst_point = max(point_rows, key=lambda row: as_mpf(row, "odd_trunc_norm"))
    global_sup = as_mpf(worst_point, "odd_trunc_norm")
    global_guarded = guard_factor * global_sup

    ledger_h_budget = mp.mpf(1) / 100
    odd_from_current_h_budget = TARGET
    ledger_h_max = (mp.mpf(14663) / 250000 - (mp.mpf(13) / 7) * (mp.mpf(1) / 125 + mp.mpf(3) / 1000) - mp.mpf(3) / 1000) / (
        mp.mpf(20) / 7
    )
    odd_from_ledger_h_max = ledger_h_max * mp.mpf(35) / 9

    return {
        "disclaimer": (
            "Diagnostic only. The formal Lean target uses oddDirichletChannel; "
            "the numerical values below use the continued odd-channel diagnostic "
            "mode from audit_horizontal_qratio_scanner.py."
        ),
        "channel_mode": CHANNEL_MODE,
        "box": {
            "sigma": [fmt(SIGMA_MIN), fmt(SIGMA_MAX)],
            "t": [fmt(T_MIN), fmt(T_MAX)],
        },
        "cutoff": args.cutoff,
        "sample_shape": {
            "sigma_divisions": args.sigma_divisions,
            "t_divisions": args.t_divisions,
            "local_grid": args.local_grid,
            "subboxes": len(subbox_rows),
            "points": len(point_rows),
            "guard_factor": fmt(guard_factor),
        },
        "target": {
            "odd_truncation": "7 / 180",
            "odd_truncation_decimal": fmt(TARGET),
            "horizontal_upper": "1 / 100",
            "horizontal_upper_decimal": fmt(ledger_h_budget),
        },
        "global": {
            "sampled_sup": fmt(global_sup),
            "guarded_sup": fmt(global_guarded),
            "sampled_slack": fmt(TARGET - global_sup),
            "guarded_slack": fmt(TARGET - global_guarded),
            "sampled_sup_over_target": fmt(global_sup / TARGET),
            "guarded_sup_over_target": fmt(global_guarded / TARGET),
            "sampled_status": "pass" if global_sup <= TARGET else "fail",
            "guarded_status": "pass" if global_guarded <= TARGET else "fail",
            "worst_subbox": asdict(worst_subbox),
            "worst_point": asdict(worst_point),
        },
        "ledger_sensitivity": {
            "odd_from_current_horizontal_budget": fmt(odd_from_current_h_budget),
            "ledger_h_max_with_existing_q_anchor_cut_sector_bounds": fmt(ledger_h_max),
            "odd_from_ledger_h_max_at_q_eq_3_over_10": fmt(odd_from_ledger_h_max),
            "rational_above_guarded_sup": rational_above(global_guarded),
            "rational_above_sampled_sup": rational_above(global_sup),
        },
    }


def print_summary(summary: dict[str, object]) -> None:
    global_data = summary["global"]
    target = summary["target"]
    sample = summary["sample_shape"]
    ledger = summary["ledger_sensitivity"]
    print("positive-box odd truncation scanner")
    print("mode: diagnostic numerical laboratory; not proof evidence")
    print(f"channel_mode: {summary['channel_mode']}")
    print(
        f"points={sample['points']} subboxes={sample['subboxes']} "
        f"local_grid={sample['local_grid']} guard_factor={sample['guard_factor']}"
    )
    print(f"target odd <= {target['odd_truncation']} = {target['odd_truncation_decimal']}")
    print(
        f"sampled_sup={global_data['sampled_sup']} "
        f"sampled_slack={global_data['sampled_slack']} "
        f"ratio={global_data['sampled_sup_over_target']} "
        f"status={global_data['sampled_status']}"
    )
    print(
        f"guarded_sup={global_data['guarded_sup']} "
        f"guarded_slack={global_data['guarded_slack']} "
        f"ratio={global_data['guarded_sup_over_target']} "
        f"status={global_data['guarded_status']}"
    )
    worst_point = global_data["worst_point"]
    print(
        f"worst point: sigma={worst_point['sigma']} t={worst_point['t']} "
        f"odd={worst_point['odd_trunc_norm']} h_qratio={worst_point['h_qratio']}"
    )
    print(
        "ledger sensitivity: "
        f"odd_from_current_H={ledger['odd_from_current_horizontal_budget']} "
        f"odd_from_max_H={ledger['odd_from_ledger_h_max_at_q_eq_3_over_10']}"
    )


def main(argv: list[str]) -> int:
    args = parse_args(argv)
    if args.cutoff < 1:
        print("--cutoff must be positive", file=sys.stderr)
        return 2
    if args.sigma_divisions < 1 or args.t_divisions < 1:
        print("division counts must be positive", file=sys.stderr)
        return 2
    if args.local_grid < 2:
        print("--local-grid must be at least 2", file=sys.stderr)
        return 2

    mp.mp.dps = args.dps
    reset_constants()
    guard_factor = mp.mpf(args.guard_factor)

    subbox_rows: list[SubboxRow] = []
    point_rows: list[PointRow] = []
    for box in boxes(args.sigma_divisions, args.t_divisions):
        row, points = scan_subbox(*box, args.cutoff, args.local_grid, guard_factor)
        subbox_rows.append(row)
        point_rows.extend(points)

    write_csv(Path(args.csv), subbox_rows)
    write_csv(Path(args.points_csv), point_rows)
    summary = build_summary(args, subbox_rows, point_rows, guard_factor)
    Path(args.json).write_text(json.dumps(summary, indent=2), encoding="utf-8")
    print_summary(summary)
    print()
    print(f"wrote {args.csv}")
    print(f"wrote {args.points_csv}")
    print(f"wrote {args.json}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
