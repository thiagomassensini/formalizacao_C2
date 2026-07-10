#!/usr/bin/env python3
"""V-split upper and sector-margin numerical laboratory.

This is diagnostic code only.  The continued odd channel is evaluated through
the existing `zeta_diagnostic` continuation used by the audit scanners; these
numbers are not proof inputs for the genuine-first Lean middle route.

The script samples small `(sigma,t)` boxes and records candidate data for:

* `anchorUpper`: sampled envelope for `|verticalDepthTailFromTwo - C|`;
* `cutUpper`: sampled envelope for `|rectangularGenuine - C|`;
* `Lsector`: guarded sampled lower for `|verticalQuartetPrefix(q)|`.

The generated `Lsector` is a formalization target, not a certificate.
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
    q_value,
    quartet_residual_margin,
    quartet_vector,
    rectangular_genuine,
    residual_upper,
    vertical_depth_tail_from_two,
    vertical_quartet_prefix,
)


DEFAULT_BOXES = (
    "positive_pocket:0.84:0.92:32.75:33.0;"
    "early_vexact_fail:0.84:0.92:32.0:32.25;"
    "late_anchor_fail:0.84:0.92:33.5:34.0"
)


@dataclass(frozen=True)
class BoxSpec:
    box_id: str
    sigma0: mp.mpf
    sigma1: mp.mpf
    t0: mp.mpf
    t1: mp.mpf


@dataclass
class SectorInfo:
    box_id: str
    sampled_min_P4: mp.mpf
    guarded_Lsector: mp.mpf
    guard_fraction: mp.mpf
    min_sigma: mp.mpf
    min_t: mp.mpf
    theta_min: mp.mpf
    theta_max: mp.mpf
    theta_width: mp.mpf
    samples: int


@dataclass
class PointRow:
    box_id: str
    sigma_box: str
    t_box: str
    sigma: str
    t: str
    N: int
    K: int
    M: int
    q_abs: str
    P4_norm: str
    Lsector_guarded: str
    K4_norm: str
    Q_worst: str
    Q_sector: str
    Q_phase: str
    vertical_tail_upper: str
    anchor_norm: str
    cut_norm: str
    vSplit_norm: str
    anchor_cut_triangle: str
    anchor_cut_cancellation: str
    tau_norm: str
    rect_norm: str
    C_norm: str
    raw_tau_rect_C_triangle: str
    raw_tau_rect_C_cancellation: str
    cos_anchor_minus_K4: str
    cos_cutVec_minus_K4: str
    cos_vSplit_minus_K4: str
    H_up_qratio: str
    U_current: str
    U_direct_balanced: str
    U_phase_aware: str
    resolvent_seed_tax: str
    slack_current_Qworst: str
    slack_current_Qsector: str
    slack_current_Qphase: str
    slack_direct_Qworst: str
    slack_direct_Qsector: str
    slack_phase_Qsector: str
    current_pass_Qworst: str
    current_pass_Qsector: str
    current_pass_Qphase: str
    direct_pass_Qworst: str
    direct_pass_Qsector: str
    phase_pass_Qsector: str
    diagnostic_issue: str
    channel_mode: str


@dataclass
class BoxRow:
    box_id: str
    N: int
    K: int
    M: int
    sigma_box: str
    t_box: str
    point_count: int
    sampled_min_P4: str
    guarded_Lsector: str
    sector_min_at_sigma: str
    sector_min_at_t: str
    theta_width: str
    Q_worst_min: str
    Q_sector_min: str
    Q_phase_min: str
    sector_gain_min_pct: str
    phase_gain_min_pct: str
    anchor_min: str
    anchor_median: str
    anchor_max: str
    anchor_rel_range: str
    cut_min: str
    cut_median: str
    cut_max: str
    cut_rel_range: str
    vSplit_max: str
    anchor_cut_cancellation_median: str
    raw_cancellation_median: str
    cos_anchor_min: str
    cos_anchor_max: str
    cos_cut_min: str
    cos_cut_max: str
    H_max: str
    resolvent_seed_tax_max: str
    current_pass_Qworst: int
    current_pass_Qsector: int
    current_pass_Qphase: int
    direct_pass_Qworst: int
    direct_pass_Qsector: int
    phase_pass_Qsector: int
    worst_slack_current_Qsector: str
    best_slack_current_Qsector: str
    dominant_issue: str


def parse_csv_mpf(raw: str) -> list[mp.mpf]:
    return [mp.mpf(part.strip()) for part in raw.split(",") if part.strip()]


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
            raise ValueError(
                "box spec must be id:sigma0:sigma1:t0:t1; got " + spec
            )
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


def cosine_against_minus(z: mp.mpc, target: mp.mpc) -> mp.mpf:
    if abs(z) == 0 or abs(target) == 0:
        return mp.nan
    minus_target = -target
    return mp.re(z * mp.conj(minus_target)) / (abs(z) * abs(minus_target))


def median(values: Iterable[mp.mpf]) -> mp.mpf:
    xs = sorted(values)
    if not xs:
        return mp.nan
    n = len(xs)
    if n % 2:
        return xs[n // 2]
    return (xs[n // 2 - 1] + xs[n // 2]) / 2


def rel_range(min_value: mp.mpf, max_value: mp.mpf) -> mp.mpf:
    denom = max(abs(min_value), mp.mpf("1e-80"))
    return (max_value - min_value) / denom


def theta_interval(box: BoxSpec) -> tuple[mp.mpf, mp.mpf, mp.mpf]:
    # Use an unwrapped local interval.  The current boxes are short enough that
    # wrapping is not the bottleneck; formal sector proofs should handle wrap.
    theta0 = -box.t1 * mp.log(2)
    theta1 = -box.t0 * mp.log(2)
    return theta0, theta1, abs(theta1 - theta0)


def sector_info(
    box: BoxSpec,
    sigma_steps: int,
    t_steps: int,
    guard_fraction: mp.mpf,
) -> SectorInfo:
    best_norm = mp.inf
    best_sigma = box.sigma0
    best_t = box.t0
    count = 0
    for sigma in grid(box.sigma0, box.sigma1, sigma_steps):
        for t in grid(box.t0, box.t1, t_steps):
            s = mp.mpc(sigma, t)
            p4_norm = abs(vertical_quartet_prefix(q_value(s)))
            count += 1
            if p4_norm < best_norm:
                best_norm = p4_norm
                best_sigma = sigma
                best_t = t
    theta_min, theta_max, theta_width = theta_interval(box)
    return SectorInfo(
        box_id=box.box_id,
        sampled_min_P4=best_norm,
        guarded_Lsector=max(mp.mpf("0"), best_norm * (1 - guard_fraction)),
        guard_fraction=guard_fraction,
        min_sigma=best_sigma,
        min_t=best_t,
        theta_min=theta_min,
        theta_max=theta_max,
        theta_width=theta_width,
        samples=count,
    )


def diagnostic_issue(
    U_current: mp.mpf,
    U_direct: mp.mpf,
    U_phase: mp.mpf,
    Q_worst: mp.mpf,
    Q_sector: mp.mpf,
    anchor_norm: mp.mpf,
    cut_norm: mp.mpf,
    H: mp.mpf,
    seed_tax: mp.mpf,
) -> str:
    if U_current < Q_worst:
        return "current_passes"
    if U_current < Q_sector:
        return "sector_margin_unlocks_current"
    if U_direct < Q_worst:
        return "resolvent_seed_factor"
    if U_direct < Q_sector:
        return "sector_plus_resolvent"
    if U_phase < Q_sector:
        return "phase_cancellation_plus_sector"
    pieces = {
        "anchor_large": anchor_norm,
        "cutVec_large": cut_norm,
        "horizontal_large": H,
        "seed_tax_large": seed_tax,
    }
    return max(pieces.items(), key=lambda item: item[1])[0]


def evaluate_point(
    box: BoxSpec,
    sector: SectorInfo,
    sigma: mp.mpf,
    t: mp.mpf,
    N: int,
    K: int,
    M: int,
) -> tuple[PointRow, dict[str, mp.mpf | str | int]]:
    s = mp.mpc(sigma, t)
    q = q_value(s)
    r = abs(q)
    tau = vertical_depth_tail_from_two(s)
    C = continued_central_odd_channel(s)
    rect = rectangular_genuine(s, K, M)
    anchor = tau - C
    cut = rect - C
    v_split = anchor + cut
    p4_norm = abs(vertical_quartet_prefix(q))
    K4 = quartet_vector(s)
    tail_upper = r**6 / (1 - r)
    Q_worst = quartet_residual_margin(s)
    Q_sector = r**2 * sector.guarded_Lsector - tail_upper
    Q_phase = abs(K4) - tail_upper
    H, Hvec, H_tail = h_up_qratio(s, N)
    U_current = residual_upper(abs(v_split), H, abs(cut), r)
    U_direct = abs(v_split) + 2 * H + abs(cut)
    U_phase = abs(v_split + Hvec) + H_tail + abs(cut)
    seed_tax = U_current - U_direct
    anchor_cut_triangle = abs(anchor) + abs(cut)
    raw_triangle = abs(tau) + abs(rect) + 2 * abs(C)
    anchor_cancel = (
        (anchor_cut_triangle - abs(v_split)) / anchor_cut_triangle
        if anchor_cut_triangle != 0
        else mp.nan
    )
    raw_cancel = (
        (raw_triangle - abs(v_split)) / raw_triangle
        if raw_triangle != 0
        else mp.nan
    )
    issue = diagnostic_issue(
        U_current,
        U_direct,
        U_phase,
        Q_worst,
        Q_sector,
        abs(anchor),
        abs(cut),
        H,
        seed_tax,
    )
    sigma_box = f"[{fmt(box.sigma0)},{fmt(box.sigma1)}]"
    t_box = f"[{fmt(box.t0)},{fmt(box.t1)}]"
    point = PointRow(
        box_id=box.box_id,
        sigma_box=sigma_box,
        t_box=t_box,
        sigma=fmt(sigma),
        t=fmt(t),
        N=N,
        K=K,
        M=M,
        q_abs=fmt(r),
        P4_norm=fmt(p4_norm),
        Lsector_guarded=fmt(sector.guarded_Lsector),
        K4_norm=fmt(abs(K4)),
        Q_worst=fmt(Q_worst),
        Q_sector=fmt(Q_sector),
        Q_phase=fmt(Q_phase),
        vertical_tail_upper=fmt(tail_upper),
        anchor_norm=fmt(abs(anchor)),
        cut_norm=fmt(abs(cut)),
        vSplit_norm=fmt(abs(v_split)),
        anchor_cut_triangle=fmt(anchor_cut_triangle),
        anchor_cut_cancellation=fmt(anchor_cancel),
        tau_norm=fmt(abs(tau)),
        rect_norm=fmt(abs(rect)),
        C_norm=fmt(abs(C)),
        raw_tau_rect_C_triangle=fmt(raw_triangle),
        raw_tau_rect_C_cancellation=fmt(raw_cancel),
        cos_anchor_minus_K4=fmt(cosine_against_minus(anchor, K4)),
        cos_cutVec_minus_K4=fmt(cosine_against_minus(cut, K4)),
        cos_vSplit_minus_K4=fmt(cosine_against_minus(v_split, K4)),
        H_up_qratio=fmt(H),
        U_current=fmt(U_current),
        U_direct_balanced=fmt(U_direct),
        U_phase_aware=fmt(U_phase),
        resolvent_seed_tax=fmt(seed_tax),
        slack_current_Qworst=fmt(Q_worst - U_current),
        slack_current_Qsector=fmt(Q_sector - U_current),
        slack_current_Qphase=fmt(Q_phase - U_current),
        slack_direct_Qworst=fmt(Q_worst - U_direct),
        slack_direct_Qsector=fmt(Q_sector - U_direct),
        slack_phase_Qsector=fmt(Q_sector - U_phase),
        current_pass_Qworst=bool_str(U_current < Q_worst),
        current_pass_Qsector=bool_str(U_current < Q_sector),
        current_pass_Qphase=bool_str(U_current < Q_phase),
        direct_pass_Qworst=bool_str(U_direct < Q_worst),
        direct_pass_Qsector=bool_str(U_direct < Q_sector),
        phase_pass_Qsector=bool_str(U_phase < Q_sector),
        diagnostic_issue=issue,
        channel_mode=CHANNEL_MODE,
    )
    numeric = {
        "box_id": box.box_id,
        "N": N,
        "K": K,
        "M": M,
        "Q_worst": Q_worst,
        "Q_sector": Q_sector,
        "Q_phase": Q_phase,
        "anchor_norm": abs(anchor),
        "cut_norm": abs(cut),
        "vSplit_norm": abs(v_split),
        "anchor_cut_cancellation": anchor_cancel,
        "raw_cancellation": raw_cancel,
        "cos_anchor": cosine_against_minus(anchor, K4),
        "cos_cut": cosine_against_minus(cut, K4),
        "H": H,
        "seed_tax": seed_tax,
        "slack_current_Qsector": Q_sector - U_current,
        "current_pass_Qworst": int(U_current < Q_worst),
        "current_pass_Qsector": int(U_current < Q_sector),
        "current_pass_Qphase": int(U_current < Q_phase),
        "direct_pass_Qworst": int(U_direct < Q_worst),
        "direct_pass_Qsector": int(U_direct < Q_sector),
        "phase_pass_Qsector": int(U_phase < Q_sector),
        "issue": issue,
    }
    return point, numeric


def summarize_box(
    box: BoxSpec,
    sector: SectorInfo,
    N: int,
    K: int,
    M: int,
    values: list[dict[str, mp.mpf | str | int]],
) -> BoxRow:
    def xs(field: str) -> list[mp.mpf]:
        return [mp.mpf(item[field]) for item in values]

    def count(field: str) -> int:
        return sum(int(item[field]) for item in values)

    issues: dict[str, int] = defaultdict(int)
    for item in values:
        issues[str(item["issue"])] += 1
    dominant_issue = max(issues.items(), key=lambda item: item[1])[0]
    anchor_values = xs("anchor_norm")
    cut_values = xs("cut_norm")
    q_worst_values = xs("Q_worst")
    q_sector_values = xs("Q_sector")
    q_phase_values = xs("Q_phase")
    q_worst_min = min(q_worst_values)
    q_sector_min = min(q_sector_values)
    q_phase_min = min(q_phase_values)
    sector_gain = (
        100 * (q_sector_min - q_worst_min) / abs(q_worst_min)
        if q_worst_min != 0
        else mp.nan
    )
    phase_gain = (
        100 * (q_phase_min - q_worst_min) / abs(q_worst_min)
        if q_worst_min != 0
        else mp.nan
    )
    return BoxRow(
        box_id=box.box_id,
        N=N,
        K=K,
        M=M,
        sigma_box=f"[{fmt(box.sigma0)},{fmt(box.sigma1)}]",
        t_box=f"[{fmt(box.t0)},{fmt(box.t1)}]",
        point_count=len(values),
        sampled_min_P4=fmt(sector.sampled_min_P4),
        guarded_Lsector=fmt(sector.guarded_Lsector),
        sector_min_at_sigma=fmt(sector.min_sigma),
        sector_min_at_t=fmt(sector.min_t),
        theta_width=fmt(sector.theta_width),
        Q_worst_min=fmt(q_worst_min),
        Q_sector_min=fmt(q_sector_min),
        Q_phase_min=fmt(q_phase_min),
        sector_gain_min_pct=fmt(sector_gain),
        phase_gain_min_pct=fmt(phase_gain),
        anchor_min=fmt(min(anchor_values)),
        anchor_median=fmt(median(anchor_values)),
        anchor_max=fmt(max(anchor_values)),
        anchor_rel_range=fmt(rel_range(min(anchor_values), max(anchor_values))),
        cut_min=fmt(min(cut_values)),
        cut_median=fmt(median(cut_values)),
        cut_max=fmt(max(cut_values)),
        cut_rel_range=fmt(rel_range(min(cut_values), max(cut_values))),
        vSplit_max=fmt(max(xs("vSplit_norm"))),
        anchor_cut_cancellation_median=fmt(median(xs("anchor_cut_cancellation"))),
        raw_cancellation_median=fmt(median(xs("raw_cancellation"))),
        cos_anchor_min=fmt(min(xs("cos_anchor"))),
        cos_anchor_max=fmt(max(xs("cos_anchor"))),
        cos_cut_min=fmt(min(xs("cos_cut"))),
        cos_cut_max=fmt(max(xs("cos_cut"))),
        H_max=fmt(max(xs("H"))),
        resolvent_seed_tax_max=fmt(max(xs("seed_tax"))),
        current_pass_Qworst=count("current_pass_Qworst"),
        current_pass_Qsector=count("current_pass_Qsector"),
        current_pass_Qphase=count("current_pass_Qphase"),
        direct_pass_Qworst=count("direct_pass_Qworst"),
        direct_pass_Qsector=count("direct_pass_Qsector"),
        phase_pass_Qsector=count("phase_pass_Qsector"),
        worst_slack_current_Qsector=fmt(min(xs("slack_current_Qsector"))),
        best_slack_current_Qsector=fmt(max(xs("slack_current_Qsector"))),
        dominant_issue=dominant_issue,
    )


def write_csv(path: Path, rows: list[object]) -> None:
    if not rows:
        return
    with path.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=list(asdict(rows[0]).keys()))
        writer.writeheader()
        for row in rows:
            writer.writerow(asdict(row))


def key_metric(row: BoxRow) -> tuple[str, int, int, int]:
    return (row.box_id, row.N, row.K, row.M)


def markdown_table(headers: list[str], rows: list[list[object]]) -> str:
    def cell(value: object) -> str:
        return str(value).replace("|", "\\|")

    out = ["| " + " | ".join(cell(header) for header in headers) + " |"]
    out.append("| " + " | ".join(["---"] * len(headers)) + " |")
    for row in rows:
        out.append("| " + " | ".join(cell(value) for value in row) + " |")
    return "\n".join(out)


def write_report(path: Path, box_rows: list[BoxRow], sector_infos: list[SectorInfo]) -> None:
    by_box: dict[str, list[BoxRow]] = defaultdict(list)
    for row in box_rows:
        by_box[row.box_id].append(row)

    sector_table = []
    for sector in sector_infos:
        rows = by_box[sector.box_id]
        first = rows[0]
        sector_table.append(
            [
                sector.box_id,
                first.sigma_box,
                first.t_box,
                fmt(sector.sampled_min_P4, 12),
                fmt(sector.guarded_Lsector, 12),
                first.Q_worst_min,
                first.Q_sector_min,
                first.Q_phase_min,
                first.sector_gain_min_pct,
            ]
        )

    anchor_table = []
    for box_id, rows in by_box.items():
        anchor_table.append(
            [
                box_id,
                max(rows, key=lambda row: mp.mpf(row.anchor_max)).anchor_max,
                median(mp.mpf(row.anchor_median) for row in rows),
                max(rows, key=lambda row: mp.mpf(row.vSplit_max)).vSplit_max,
                rows[0].cos_anchor_min,
                rows[0].cos_anchor_max,
            ]
        )

    cut_rows = sorted(
        box_rows,
        key=lambda row: (row.box_id, -mp.mpf(row.cut_max), row.K, row.M),
    )
    cut_table = [
        [
            row.box_id,
            row.K,
            row.M,
            row.cut_median,
            row.cut_max,
            row.vSplit_max,
            row.current_pass_Qsector,
            row.direct_pass_Qsector,
            row.dominant_issue,
        ]
        for row in cut_rows[:18]
    ]

    pass_table = [
        [
            row.box_id,
            row.K,
            row.M,
            row.current_pass_Qworst,
            row.current_pass_Qsector,
            row.current_pass_Qphase,
            row.direct_pass_Qsector,
            row.phase_pass_Qsector,
            row.best_slack_current_Qsector,
            row.dominant_issue,
        ]
        for row in sorted(box_rows, key=key_metric)
    ]

    text = f"""# V-split upper and sector-margin laboratory

This report is diagnostic only.  The continued channel mode is
`{CHANNEL_MODE}`; none of the sampled numbers is a Lean certificate or proof
input for the genuine-first middle route.

Generated artifacts:

```text
audit_vsplit_upper_sector_points.csv
audit_vsplit_upper_sector_boxes.csv
audit_vsplit_upper_sector_summary.json
```

## Sector Margin Candidates

`Lsector` below is a guarded sampled lower for `|verticalQuartetPrefix(q)|`.
It is a formalization target for interval/sector proof, not a certified lower.

{markdown_table(
    [
        "box",
        "sigma",
        "t",
        "sample min |P4|",
        "guarded Lsector",
        "min Q_worst",
        "min Q_sector",
        "min Q_phase",
        "sector gain %",
    ],
    sector_table,
)}

## Anchor Variation

{markdown_table(
    [
        "box",
        "max |anchor|",
        "median |anchor|",
        "max |vSplit|",
        "min cos(anchor,-K4)",
        "max cos(anchor,-K4)",
    ],
    anchor_table,
)}

## CutVec Dependence

Rows are sorted by largest sampled `|cutVec|` inside each box.

{markdown_table(
    [
        "box",
        "K",
        "M",
        "median |cutVec|",
        "max |cutVec|",
        "max |vSplit|",
        "current/Qsector pass",
        "direct/Qsector pass",
        "dominant issue",
    ],
    cut_table,
)}

## Ledger Pass Counts

Each row has the same number of sampled points inside its box.  `Qsector` uses
the guarded sampled sector lower.

{markdown_table(
    [
        "box",
        "K",
        "M",
        "current/Qworst",
        "current/Qsector",
        "current/Qphase",
        "direct/Qsector",
        "phase/Qsector",
        "best current slack Qsector",
        "dominant issue",
    ],
    pass_table,
)}

## Reading

The useful next Lean targets are still conditional:

```text
|anchor s| <= anchorUpper s
|cutVec K M s| <= cutUpper s
Lsector s <= |verticalQuartetPrefix (q s)|
```

The sector numbers here only identify small boxes where an interval proof of
the prefix lower looks worth attempting.  A formal sector certificate should
bound the product expression for `|P4(q)|` over the whole `(sigma,t)` box, not
reuse pointwise phase samples.
"""
    path.write_text(text, encoding="utf-8")


def parse_args(argv: list[str]) -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Sample V-split upper candidates and sector margins by box."
    )
    parser.add_argument("--dps", type=int, default=80)
    parser.add_argument("--boxes", default=DEFAULT_BOXES)
    parser.add_argument("--sigma-steps", type=int, default=5)
    parser.add_argument("--t-steps", type=int, default=5)
    parser.add_argument("--sector-sigma-steps", type=int, default=25)
    parser.add_argument("--sector-t-steps", type=int, default=101)
    parser.add_argument("--sector-guard", default="0.002")
    parser.add_argument("--N-values", default="50")
    parser.add_argument("--K-values", default="3,4,5")
    parser.add_argument("--M-values", default="25,50,100")
    parser.add_argument("--points-csv", default="audit_vsplit_upper_sector_points.csv")
    parser.add_argument("--boxes-csv", default="audit_vsplit_upper_sector_boxes.csv")
    parser.add_argument("--json", default="audit_vsplit_upper_sector_summary.json")
    parser.add_argument("--report", default="AUDIT_VSPLIT_UPPER_SECTOR_REPORT.md")
    return parser.parse_args(argv)


def main(argv: list[str]) -> int:
    args = parse_args(argv)
    mp.mp.dps = args.dps
    boxes = parse_boxes(args.boxes)
    N_values = parse_csv_int(args.N_values)
    K_values = parse_csv_int(args.K_values)
    M_values = parse_csv_int(args.M_values)
    guard = mp.mpf(args.sector_guard)

    sector_infos = [
        sector_info(box, args.sector_sigma_steps, args.sector_t_steps, guard)
        for box in boxes
    ]
    sector_by_box = {sector.box_id: sector for sector in sector_infos}

    point_rows: list[PointRow] = []
    accum: dict[tuple[str, int, int, int], list[dict[str, mp.mpf | str | int]]] = (
        defaultdict(list)
    )

    for box in boxes:
        sector = sector_by_box[box.box_id]
        for sigma in grid(box.sigma0, box.sigma1, args.sigma_steps):
            for t in grid(box.t0, box.t1, args.t_steps):
                for N in N_values:
                    for K in K_values:
                        for M in M_values:
                            row, numeric = evaluate_point(
                                box, sector, sigma, t, N, K, M
                            )
                            point_rows.append(row)
                            accum[(box.box_id, N, K, M)].append(numeric)

    box_rows: list[BoxRow] = []
    box_by_id = {box.box_id: box for box in boxes}
    for (box_id, N, K, M), values in sorted(accum.items()):
        box_rows.append(
            summarize_box(box_by_id[box_id], sector_by_box[box_id], N, K, M, values)
        )

    write_csv(Path(args.points_csv), point_rows)
    write_csv(Path(args.boxes_csv), box_rows)
    write_report(Path(args.report), box_rows, sector_infos)

    summary = {
        "disclaimer": (
            "Diagnostic numerical laboratory only; continued channel uses "
            "zeta_diagnostic evaluation and is not proof input."
        ),
        "channel_mode": CHANNEL_MODE,
        "sample_counts": {
            "points": len(point_rows),
            "box_rows": len(box_rows),
            "boxes": len(boxes),
        },
        "settings": {
            "dps": args.dps,
            "sigma_steps": args.sigma_steps,
            "t_steps": args.t_steps,
            "sector_sigma_steps": args.sector_sigma_steps,
            "sector_t_steps": args.sector_t_steps,
            "sector_guard": str(guard),
            "N_values": N_values,
            "K_values": K_values,
            "M_values": M_values,
        },
        "sectors": [asdict(info) | {
            "sampled_min_P4": fmt(info.sampled_min_P4),
            "guarded_Lsector": fmt(info.guarded_Lsector),
            "guard_fraction": fmt(info.guard_fraction),
            "min_sigma": fmt(info.min_sigma),
            "min_t": fmt(info.min_t),
            "theta_min": fmt(info.theta_min),
            "theta_max": fmt(info.theta_max),
            "theta_width": fmt(info.theta_width),
        } for info in sector_infos],
        "box_rows": [asdict(row) for row in box_rows],
    }
    Path(args.json).write_text(json.dumps(summary, indent=2), encoding="utf-8")

    print("V-split upper/sector scanner")
    print("mode: diagnostic numerical laboratory; not proof evidence")
    print(f"channel_mode: {CHANNEL_MODE}")
    print(f"points: {len(point_rows)}")
    print(f"box rows: {len(box_rows)}")
    for row in box_rows:
        print(
            f"{row.box_id} N={row.N} K={row.K} M={row.M}: "
            f"pass current/Qsector={row.current_pass_Qsector}/{row.point_count}, "
            f"direct/Qsector={row.direct_pass_Qsector}/{row.point_count}, "
            f"anchor_max={row.anchor_max}, cut_max={row.cut_max}, "
            f"issue={row.dominant_issue}"
        )
    print(f"wrote {args.points_csv}")
    print(f"wrote {args.boxes_csv}")
    print(f"wrote {args.json}")
    print(f"wrote {args.report}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
