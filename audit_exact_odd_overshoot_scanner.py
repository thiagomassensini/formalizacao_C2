#!/usr/bin/env python3
"""Diagnostic scanner for the exact-odd overshoot reserve.

This is numerical laboratory code only.  It mirrors the active Lean cash
identity

    exact_odd_overshoot <= surplus_after_quarter

in the cleared canonical lower-factor ledger, then compares the same points
with the phase-aware exact-gap weighted ledger.  These sampled values are not
Lean certificates.
"""

from __future__ import annotations

import argparse
import csv
import json
import sys
from collections import defaultdict
from dataclasses import asdict, dataclass
from pathlib import Path
from typing import Iterable

import mpmath as mp

from audit_horizontal_qratio_scanner import (
    CHANNEL_MODE,
    continued_central_odd_channel,
    fmt,
    h_up_qratio,
    odd_dirichlet_channel_diagnostic,
    q_value,
    quartet_residual_margin,
    rectangular_genuine,
    vertical_depth_tail_from_two,
)


DEFAULT_DPS = 90
DEFAULT_BOXES = (
    "positive_pocket:0.84:0.92:32.75:33.0;"
    "early_anchor_fail:0.84:0.92:32.0:32.25;"
    "late_anchor_fail:0.84:0.92:33.5:34.0"
)
DEFAULT_N_VALUES = "25,50,100"
DEFAULT_K_VALUES = "3,4,5"
DEFAULT_M_VALUES = "25,50,100"


@dataclass(frozen=True)
class BoxSpec:
    box_id: str
    sigma0: mp.mpf
    sigma1: mp.mpf
    t0: mp.mpf
    t1: mp.mpf


@dataclass
class PointRow:
    box_id: str
    sigma: str
    t: str
    N: int
    K: int
    M: int
    q_abs: str
    q_band: str
    Q: str
    weighted_margin: str
    cleared_margin: str
    odd_norm: str
    odd_gap_norm: str
    continued_exact_upper: str
    continued_from_odd_upper: str
    exact_odd_overshoot: str
    genuine_proxy_upper: str
    continued_proxy_upper: str
    H_qratio: str
    cutoff_proxy: str
    external_component: str
    weighted_external_debit: str
    cleared_external_debit: str
    anchor_norm: str
    lower_factor_upper: str
    lower_factor_cost: str
    lower_factor_surplus: str
    surplus_after_quarter: str
    overshoot_deficit: str
    overshoot_share: str
    surplus_after_quarter_share: str
    ordinary_spend_share: str
    lower_factor_cost_share: str
    exact_odd_pass: str
    phase_payment: str
    phase_slack: str
    phase_payment_share_weighted: str
    phase_pass: str
    winner: str
    diagnostic_mode: str


@dataclass
class GroupRow:
    group_type: str
    group_id: str
    N: int
    K: int
    M: int
    point_count: int
    exact_odd_passes: int
    phase_passes: int
    min_surplus_after_quarter: str
    min_overshoot_deficit: str
    max_overshoot_share: str
    max_surplus_after_quarter_share: str
    min_phase_slack: str
    max_phase_payment_share_weighted: str
    worst_exact_odd_point: str
    worst_phase_point: str
    read: str


def parse_csv_int(raw: str) -> list[int]:
    return [int(part.strip()) for part in raw.split(",") if part.strip()]


def parse_boxes(raw: str) -> list[BoxSpec]:
    boxes: list[BoxSpec] = []
    for spec in raw.split(";"):
        spec = spec.strip()
        if not spec:
            continue
        parts = spec.split(":")
        if len(parts) != 5:
            raise ValueError("box spec must be id:sigma0:sigma1:t0:t1")
        box_id, sigma0, sigma1, t0, t1 = parts
        boxes.append(
            BoxSpec(
                box_id=box_id,
                sigma0=mp.mpf(sigma0),
                sigma1=mp.mpf(sigma1),
                t0=mp.mpf(t0),
                t1=mp.mpf(t1),
            )
        )
    return boxes


def grid(start: mp.mpf, stop: mp.mpf, steps: int) -> list[mp.mpf]:
    if steps <= 1:
        return [(start + stop) / 2]
    return [start + (stop - start) * j / (steps - 1) for j in range(steps)]


def bool_str(value: bool) -> str:
    return "yes" if value else "no"


def q_band(r: mp.mpf) -> str:
    if r >= mp.mpf("0.45"):
        return "r>=0.45"
    if r >= mp.mpf("0.35"):
        return "0.35<=r<0.45"
    if r >= mp.mpf("0.30"):
        return "0.30<=r<0.35"
    if r >= mp.mpf("0.25"):
        return "0.25<=r<0.30"
    return "r<0.25"


def safe_div(num: mp.mpf, den: mp.mpf) -> mp.mpf:
    if den == 0:
        return mp.inf
    return num / den


def vertical_tail_upper_from_r(r: mp.mpf) -> mp.mpf:
    return r**2 / (1 - r)


def vertical_tail_lower_from_r(r: mp.mpf) -> mp.mpf:
    return r**2 / (1 + r)


def point_label(row: PointRow) -> str:
    return (
        f"{row.box_id} sigma={row.sigma} t={row.t} "
        f"N={row.N} K={row.K} M={row.M}"
    )


def evaluate_point(
    box_id: str,
    sigma: mp.mpf,
    t: mp.mpf,
    N: int,
    K: int,
    M: int,
) -> PointRow:
    s = mp.mpc(sigma, t)
    q = q_value(s)
    r = abs(q)
    Q = quartet_residual_margin(s)
    one_minus_r = 1 - r
    weighted_margin = Q * one_minus_r
    cleared_margin = Q * one_minus_r**2

    odd = odd_dirichlet_channel_diagnostic(s)
    odd_norm = abs(odd)
    odd_gap_norm = abs(1 - 2 * odd)
    tau = vertical_depth_tail_from_two(s)
    tail_upper = vertical_tail_upper_from_r(r)
    tail_lower = vertical_tail_lower_from_r(r)

    continued = continued_central_odd_channel(s)
    continued_exact_upper = abs(continued)
    continued_from_odd_upper = 2 * tail_upper * odd_norm
    exact_odd_overshoot = (
        one_minus_r
        * (1 + r)
        * (continued_from_odd_upper - continued_exact_upper)
    )

    H, _Hvec, _Htail = h_up_qratio(s, N)
    rect = rectangular_genuine(s, K, M)

    # Existing audit scanners use the continued central channel as the
    # diagnostic central proxy.  This keeps the numerical experiment aligned
    # with the previous anatomy scanners; it is not a Lean certificate.
    genuine_proxy_upper = continued_exact_upper
    continued_proxy_upper = continued_exact_upper
    cutoff_proxy = abs(rect - continued)

    external_component = (
        (1 + r) * (genuine_proxy_upper + continued_proxy_upper)
        + 2 * (H + cutoff_proxy)
    )
    weighted_external_debit = external_component
    cleared_external_debit = external_component * one_minus_r

    anchor = tau - continued
    anchor_norm = abs(anchor)
    lower_factor_upper = safe_div(anchor_norm, tail_lower)
    lower_factor_cost = (1 + r) * r**2 * lower_factor_upper

    lower_factor_surplus = (
        cleared_margin - cleared_external_debit - lower_factor_cost
    )
    surplus_after_quarter = lower_factor_surplus - mp.mpf("0.25") * cleared_margin
    overshoot_deficit = exact_odd_overshoot - surplus_after_quarter

    overshoot_share = safe_div(exact_odd_overshoot, cleared_margin)
    surplus_after_quarter_share = safe_div(surplus_after_quarter, cleared_margin)
    ordinary_spend_share = safe_div(
        cleared_external_debit + lower_factor_cost, cleared_margin
    )
    lower_factor_cost_share = safe_div(lower_factor_cost, cleared_margin)

    phase_payment = (1 + r) * tail_upper * odd_gap_norm
    phase_slack = weighted_margin - weighted_external_debit - phase_payment
    phase_payment_share_weighted = safe_div(phase_payment, weighted_margin)

    exact_odd_pass = (
        Q > 0
        and cleared_margin > 0
        and exact_odd_overshoot <= surplus_after_quarter
    )
    phase_pass = Q > 0 and weighted_margin > 0 and phase_slack > 0

    if exact_odd_pass and phase_pass:
        winner = "both_pass"
    elif exact_odd_pass:
        winner = "exact_odd_only"
    elif phase_pass:
        winner = "phase_only"
    elif overshoot_deficit > 0 and phase_slack > 0:
        winner = "exact_odd_deficit_phase_promising"
    else:
        winner = "both_fail"

    return PointRow(
        box_id=box_id,
        sigma=fmt(sigma),
        t=fmt(t),
        N=N,
        K=K,
        M=M,
        q_abs=fmt(r),
        q_band=q_band(r),
        Q=fmt(Q),
        weighted_margin=fmt(weighted_margin),
        cleared_margin=fmt(cleared_margin),
        odd_norm=fmt(odd_norm),
        odd_gap_norm=fmt(odd_gap_norm),
        continued_exact_upper=fmt(continued_exact_upper),
        continued_from_odd_upper=fmt(continued_from_odd_upper),
        exact_odd_overshoot=fmt(exact_odd_overshoot),
        genuine_proxy_upper=fmt(genuine_proxy_upper),
        continued_proxy_upper=fmt(continued_proxy_upper),
        H_qratio=fmt(H),
        cutoff_proxy=fmt(cutoff_proxy),
        external_component=fmt(external_component),
        weighted_external_debit=fmt(weighted_external_debit),
        cleared_external_debit=fmt(cleared_external_debit),
        anchor_norm=fmt(anchor_norm),
        lower_factor_upper=fmt(lower_factor_upper),
        lower_factor_cost=fmt(lower_factor_cost),
        lower_factor_surplus=fmt(lower_factor_surplus),
        surplus_after_quarter=fmt(surplus_after_quarter),
        overshoot_deficit=fmt(overshoot_deficit),
        overshoot_share=fmt(overshoot_share),
        surplus_after_quarter_share=fmt(surplus_after_quarter_share),
        ordinary_spend_share=fmt(ordinary_spend_share),
        lower_factor_cost_share=fmt(lower_factor_cost_share),
        exact_odd_pass=bool_str(exact_odd_pass),
        phase_payment=fmt(phase_payment),
        phase_slack=fmt(phase_slack),
        phase_payment_share_weighted=fmt(phase_payment_share_weighted),
        phase_pass=bool_str(phase_pass),
        winner=winner,
        diagnostic_mode=CHANNEL_MODE,
    )


def write_csv(path: Path, rows: list[object]) -> None:
    if not rows:
        return
    with path.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=list(asdict(rows[0]).keys()))
        writer.writeheader()
        for row in rows:
            writer.writerow(asdict(row))


def to_mpf(row: PointRow, field: str) -> mp.mpf:
    return mp.mpf(getattr(row, field))


def median(values: Iterable[mp.mpf]) -> mp.mpf:
    xs = sorted(values)
    if not xs:
        return mp.nan
    n = len(xs)
    if n % 2:
        return xs[n // 2]
    return (xs[n // 2 - 1] + xs[n // 2]) / 2


def classify_group(rows: list[PointRow]) -> str:
    if not rows:
        return "empty"
    exact = sum(row.exact_odd_pass == "yes" for row in rows)
    phase = sum(row.phase_pass == "yes" for row in rows)
    if exact == len(rows):
        return "exact_odd_closes_sample"
    if phase == len(rows):
        return "phase_closes_sample"
    if exact == 0 and phase > 0:
        return "exact_odd_fails_phase_has_signal"
    if phase == 0 and exact > 0:
        return "exact_odd_has_signal_phase_fails"
    if exact == 0 and phase == 0:
        return "both_fail_sample"
    return "mixed"


def summarize_group(group_type: str, group_id: str, rows: list[PointRow]) -> GroupRow:
    worst_exact = max(rows, key=lambda row: to_mpf(row, "overshoot_deficit"))
    worst_phase = min(rows, key=lambda row: to_mpf(row, "phase_slack"))
    return GroupRow(
        group_type=group_type,
        group_id=group_id,
        N=rows[0].N,
        K=rows[0].K,
        M=rows[0].M,
        point_count=len(rows),
        exact_odd_passes=sum(row.exact_odd_pass == "yes" for row in rows),
        phase_passes=sum(row.phase_pass == "yes" for row in rows),
        min_surplus_after_quarter=fmt(
            min(to_mpf(row, "surplus_after_quarter") for row in rows)
        ),
        min_overshoot_deficit=fmt(
            min(to_mpf(row, "overshoot_deficit") for row in rows)
        ),
        max_overshoot_share=fmt(
            max(to_mpf(row, "overshoot_share") for row in rows)
        ),
        max_surplus_after_quarter_share=fmt(
            max(to_mpf(row, "surplus_after_quarter_share") for row in rows)
        ),
        min_phase_slack=fmt(min(to_mpf(row, "phase_slack") for row in rows)),
        max_phase_payment_share_weighted=fmt(
            max(to_mpf(row, "phase_payment_share_weighted") for row in rows)
        ),
        worst_exact_odd_point=point_label(worst_exact),
        worst_phase_point=point_label(worst_phase),
        read=classify_group(rows),
    )


def build_group_rows(rows: list[PointRow]) -> list[GroupRow]:
    buckets: dict[tuple[str, str, int, int, int], list[PointRow]] = defaultdict(list)
    for row in rows:
        buckets[("box", row.box_id, row.N, row.K, row.M)].append(row)
        buckets[("q_band", row.q_band, row.N, row.K, row.M)].append(row)

    out = []
    for (group_type, group_id, _N, _K, _M), group_rows in sorted(buckets.items()):
        out.append(summarize_group(group_type, group_id, group_rows))
    return out


def markdown_table(headers: list[str], rows: list[list[object]]) -> str:
    def cell(value: object) -> str:
        return str(value).replace("|", "\\|")

    out = ["| " + " | ".join(cell(header) for header in headers) + " |"]
    out.append("| " + " | ".join(["---"] * len(headers)) + " |")
    for row in rows:
        out.append("| " + " | ".join(cell(value) for value in row) + " |")
    return "\n".join(out)


def select_rows(rows: list[GroupRow], group_type: str, limit: int) -> list[GroupRow]:
    selected = [row for row in rows if row.group_type == group_type]
    selected.sort(
        key=lambda row: (
            row.group_id,
            row.N,
            row.K,
            row.M,
        )
    )
    return selected[:limit]


def write_report(
    path: Path,
    rows: list[PointRow],
    group_rows: list[GroupRow],
    points_csv: Path,
    groups_csv: Path,
    summary_json: Path,
) -> None:
    exact_passes = sum(row.exact_odd_pass == "yes" for row in rows)
    phase_passes = sum(row.phase_pass == "yes" for row in rows)
    winners = defaultdict(int)
    for row in rows:
        winners[row.winner] += 1

    worst_exact = sorted(
        rows, key=lambda row: to_mpf(row, "overshoot_deficit"), reverse=True
    )[:12]
    best_surplus = sorted(
        rows, key=lambda row: to_mpf(row, "surplus_after_quarter"), reverse=True
    )[:12]
    box_rows = select_rows(group_rows, "box", 36)
    band_rows = select_rows(group_rows, "q_band", 36)

    text = f"""# Exact-Odd Overshoot Scanner

Diagnostic only.  The numerical mode is `{CHANNEL_MODE}` and these sampled
values are not proof input for the genuine-first Lean route.

Generated artifacts:

```text
{points_csv}
{groups_csv}
{summary_json}
```

## Central Proxy

This scanner uses the same diagnostic central proxy as the existing anatomy
scanners:

```text
genuine_proxy_upper = continued_proxy_upper = |continuedCentralOddChannel|
cutoff_proxy = |rectangularGenuine - continuedCentralOddChannel|
```

That makes the output useful for locating pressure, but it is not a formal
replacement for the genuine-side Lean bounds.

## Overall

{markdown_table(
    ["points", "exact-odd passes", "phase passes", "winner counts"],
    [[len(rows), exact_passes, phase_passes, dict(sorted(winners.items()))]],
)}

## Box Summary

{markdown_table(
    [
        "box",
        "N",
        "K",
        "M",
        "points",
        "exact",
        "phase",
        "min surplus",
        "max overshoot share",
        "min phase slack",
        "read",
    ],
    [
        [
            row.group_id,
            row.N,
            row.K,
            row.M,
            row.point_count,
            row.exact_odd_passes,
            row.phase_passes,
            row.min_surplus_after_quarter,
            row.max_overshoot_share,
            row.min_phase_slack,
            row.read,
        ]
        for row in box_rows
    ],
)}

## Q-Band Summary

{markdown_table(
    [
        "q band",
        "N",
        "K",
        "M",
        "points",
        "exact",
        "phase",
        "min surplus",
        "max overshoot share",
        "min phase slack",
        "read",
    ],
    [
        [
            row.group_id,
            row.N,
            row.K,
            row.M,
            row.point_count,
            row.exact_odd_passes,
            row.phase_passes,
            row.min_surplus_after_quarter,
            row.max_overshoot_share,
            row.min_phase_slack,
            row.read,
        ]
        for row in band_rows
    ],
)}

## Worst Exact-Odd Deficits

{markdown_table(
    [
        "box",
        "sigma",
        "t",
        "N",
        "K",
        "M",
        "q",
        "overshoot",
        "surplus after quarter",
        "deficit",
        "ordinary spend share",
        "phase slack",
        "winner",
    ],
    [
        [
            row.box_id,
            row.sigma,
            row.t,
            row.N,
            row.K,
            row.M,
            row.q_abs,
            row.exact_odd_overshoot,
            row.surplus_after_quarter,
            row.overshoot_deficit,
            row.ordinary_spend_share,
            row.phase_slack,
            row.winner,
        ]
        for row in worst_exact
    ],
)}

## Best Surplus After Quarter

{markdown_table(
    [
        "box",
        "sigma",
        "t",
        "N",
        "K",
        "M",
        "q",
        "surplus after quarter",
        "overshoot",
        "deficit",
        "phase slack",
        "winner",
    ],
    [
        [
            row.box_id,
            row.sigma,
            row.t,
            row.N,
            row.K,
            row.M,
            row.q_abs,
            row.surplus_after_quarter,
            row.exact_odd_overshoot,
            row.overshoot_deficit,
            row.phase_slack,
            row.winner,
        ]
        for row in best_surplus
    ],
)}

## Reading

`exact_odd_pass` checks the cleared target isolated in Lean:

```text
exact_odd_overshoot <= surplus_after_quarter
```

`phase_pass` checks the sampled phase-aware weighted ledger at the same points,
with the proxy described above.  If `phase_pass` is positive where
`exact_odd_pass` fails, the pressure is more likely caused by the norm-only
exact-odd ledger than by the geometric cover.  If both fail on the same boxes,
the next audit should localize the box or use a separate local argument.
"""
    path.write_text(text, encoding="utf-8")


def build_summary(
    rows: list[PointRow],
    group_rows: list[GroupRow],
    args: argparse.Namespace,
) -> dict[str, object]:
    deficits = [to_mpf(row, "overshoot_deficit") for row in rows]
    phase_slacks = [to_mpf(row, "phase_slack") for row in rows]
    return {
        "disclaimer": (
            "Diagnostic numerical laboratory only; not proof input for the "
            "genuine-first route."
        ),
        "diagnostic_mode": CHANNEL_MODE,
        "central_proxy_mode": (
            "genuine_proxy_upper = continued_proxy_upper = "
            "|continuedCentralOddChannel|; cutoff_proxy = "
            "|rectangularGenuine - continuedCentralOddChannel|"
        ),
        "settings": vars(args),
        "point_count": len(rows),
        "exact_odd_pass_count": sum(row.exact_odd_pass == "yes" for row in rows),
        "phase_pass_count": sum(row.phase_pass == "yes" for row in rows),
        "winner_counts": {
            name: sum(row.winner == name for row in rows)
            for name in sorted({row.winner for row in rows})
        },
        "overshoot_deficit_min": fmt(min(deficits) if deficits else mp.nan),
        "overshoot_deficit_median": fmt(median(deficits)),
        "overshoot_deficit_max": fmt(max(deficits) if deficits else mp.nan),
        "phase_slack_min": fmt(min(phase_slacks) if phase_slacks else mp.nan),
        "phase_slack_median": fmt(median(phase_slacks)),
        "phase_slack_max": fmt(max(phase_slacks) if phase_slacks else mp.nan),
        "top_worst_exact_odd": [
            asdict(row)
            for row in sorted(
                rows, key=lambda row: to_mpf(row, "overshoot_deficit"), reverse=True
            )[:20]
        ],
        "top_best_surplus": [
            asdict(row)
            for row in sorted(
                rows, key=lambda row: to_mpf(row, "surplus_after_quarter"), reverse=True
            )[:20]
        ],
        "group_rows": [asdict(row) for row in group_rows],
    }


def print_console_summary(rows: list[PointRow], group_rows: list[GroupRow]) -> None:
    exact = sum(row.exact_odd_pass == "yes" for row in rows)
    phase = sum(row.phase_pass == "yes" for row in rows)
    print("exact-odd overshoot scanner")
    print("mode: diagnostic numerical laboratory; not proof evidence")
    print(f"diagnostic_mode: {CHANNEL_MODE}")
    print(f"points: {len(rows)}")
    print(f"exact_odd_passes: {exact}/{len(rows)}")
    print(f"phase_passes: {phase}/{len(rows)}")
    print()

    print("box reads")
    for row in group_rows:
        if row.group_type != "box":
            continue
        print(
            f"  {row.group_id} N={row.N} K={row.K} M={row.M}: "
            f"exact={row.exact_odd_passes}/{row.point_count} "
            f"phase={row.phase_passes}/{row.point_count} "
            f"max_overshoot_share={row.max_overshoot_share} "
            f"min_phase_slack={row.min_phase_slack} read={row.read}"
        )

    worst = max(rows, key=lambda row: to_mpf(row, "overshoot_deficit"))
    print()
    print(
        "worst exact-odd deficit: "
        f"{point_label(worst)} deficit={worst.overshoot_deficit} "
        f"overshoot={worst.exact_odd_overshoot} "
        f"surplus_after_quarter={worst.surplus_after_quarter} "
        f"phase_slack={worst.phase_slack}"
    )


def parse_args(argv: list[str]) -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Scan the exact-odd overshoot reserve against surplus after quarter."
    )
    parser.add_argument("--dps", type=int, default=DEFAULT_DPS)
    parser.add_argument("--boxes", default=DEFAULT_BOXES)
    parser.add_argument("--sigma-steps", type=int, default=5)
    parser.add_argument("--t-steps", type=int, default=5)
    parser.add_argument("--N-values", default=DEFAULT_N_VALUES)
    parser.add_argument("--K-values", default=DEFAULT_K_VALUES)
    parser.add_argument("--M-values", default=DEFAULT_M_VALUES)
    parser.add_argument("--points-csv", default="audit_exact_odd_overshoot_points.csv")
    parser.add_argument("--groups-csv", default="audit_exact_odd_overshoot_groups.csv")
    parser.add_argument("--json", default="audit_exact_odd_overshoot_summary.json")
    parser.add_argument("--report", default="AUDIT_EXACT_ODD_OVERSHOOT_REPORT.md")
    return parser.parse_args(argv)


def main(argv: list[str]) -> int:
    args = parse_args(argv)
    if args.sigma_steps < 1 or args.t_steps < 1:
        print("--sigma-steps and --t-steps must be positive", file=sys.stderr)
        return 2
    mp.mp.dps = args.dps

    rows: list[PointRow] = []
    for box in parse_boxes(args.boxes):
        for sigma in grid(box.sigma0, box.sigma1, args.sigma_steps):
            for t in grid(box.t0, box.t1, args.t_steps):
                for N in parse_csv_int(args.N_values):
                    for K in parse_csv_int(args.K_values):
                        for M in parse_csv_int(args.M_values):
                            rows.append(evaluate_point(box.box_id, sigma, t, N, K, M))

    group_rows = build_group_rows(rows)
    points_csv = Path(args.points_csv)
    groups_csv = Path(args.groups_csv)
    summary_json = Path(args.json)
    report = Path(args.report)

    write_csv(points_csv, rows)
    write_csv(groups_csv, group_rows)
    summary_json.write_text(
        json.dumps(build_summary(rows, group_rows, args), indent=2),
        encoding="utf-8",
    )
    write_report(report, rows, group_rows, points_csv, groups_csv, summary_json)
    print_console_summary(rows, group_rows)
    print()
    print(f"wrote {args.points_csv}")
    print(f"wrote {args.groups_csv}")
    print(f"wrote {args.json}")
    print(f"wrote {args.report}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
