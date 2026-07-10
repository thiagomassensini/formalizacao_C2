#!/usr/bin/env python3
"""Subbox ledger scanner for the C2 anchor audit.

Diagnostic laboratory only.  This script subdivides `(sigma,t)` boxes, computes
sampled local uppers for `anchor` and `cutVec`, a guarded sampled lower for
`|verticalQuartetPrefix(q)|`, and compares the current q-ratio ledger with the
direct-balanced audit ledger.

Any analytically continued channel evaluation used here is diagnostic only and
is not a proof input for the genuine-first route.
"""

from __future__ import annotations

import argparse
import csv
import json
import sys
from collections import defaultdict
from dataclasses import asdict, dataclass
from pathlib import Path

import mpmath as mp

from audit_anchor_anatomy_scanner import (
    BoxSpec,
    bool_str,
    evaluate_base,
    fmt,
    grid,
    parse_boxes,
    parse_csv_int,
    sector_lower_for_box,
    v_split_direct_balanced_ledger,
    v_split_ledger,
)
from audit_horizontal_qratio_scanner import (
    CHANNEL_MODE,
    h_up_qratio,
    q_value,
    rectangular_genuine,
    vertical_quartet_prefix,
)


DEFAULT_BOXES = (
    "positive_pocket:0.84:0.92:32.75:33.0;"
    "early_anchor_fail:0.84:0.92:32.0:32.25;"
    "late_anchor_fail:0.84:0.92:33.5:34.0"
)


@dataclass(frozen=True)
class SubboxSpec:
    parent_id: str
    subbox_id: str
    sigma0: mp.mpf
    sigma1: mp.mpf
    t0: mp.mpf
    t1: mp.mpf


@dataclass
class SubboxLedgerRow:
    box_id: str
    subbox_id: str
    N: int
    K: int
    M: int
    sigma_box: str
    t_box: str
    sample_count: int
    anchor_sup: str
    cut_sup: str
    P4_lower_sampled: str
    Lsector_guarded: str
    Q_worst_min: str
    Q_sector_min: str
    Q_phase_min: str
    sector_gain_pct: str
    current_pass_Qworst: int
    current_pass_Qsector: int
    current_pass_Qphase: int
    direct_pass_Qworst: int
    direct_pass_Qsector: int
    direct_pass_Qphase: int
    current_worst_slack_Qsector: str
    current_best_slack_Qsector: str
    direct_worst_slack_Qsector: str
    direct_best_slack_Qsector: str
    seed_tax_max: str
    dominant_read: str


@dataclass
class SubboxPointRow:
    box_id: str
    subbox_id: str
    sigma: str
    t: str
    N: int
    K: int
    M: int
    anchor_norm: str
    cut_norm: str
    anchor_sup: str
    cut_sup: str
    H_qratio: str
    q_abs: str
    Q_worst: str
    Q_sector: str
    Q_phase: str
    current_ledger: str
    direct_balanced_ledger: str
    current_slack_Qsector: str
    direct_slack_Qsector: str
    current_pass_Qsector: str
    direct_pass_Qsector: str
    channel_mode: str


def make_subboxes(box: BoxSpec, divisions: int) -> list[SubboxSpec]:
    sigma_edges = grid(box.sigma0, box.sigma1, divisions + 1)
    t_edges = grid(box.t0, box.t1, divisions + 1)
    out: list[SubboxSpec] = []
    for i in range(divisions):
        for j in range(divisions):
            out.append(
                SubboxSpec(
                    parent_id=box.box_id,
                    subbox_id=f"{i},{j}",
                    sigma0=sigma_edges[i],
                    sigma1=sigma_edges[i + 1],
                    t0=t_edges[j],
                    t1=t_edges[j + 1],
                )
            )
    return out


def pct_gain(new: mp.mpf, old: mp.mpf) -> mp.mpf:
    if old == 0:
        return mp.nan
    return 100 * (new - old) / abs(old)


def classify(row: SubboxLedgerRow) -> str:
    if row.current_pass_Qsector == row.sample_count:
        return "current_closes_subbox"
    if row.direct_pass_Qsector == row.sample_count:
        return "direct_closes_resolvent_tax"
    if mp.mpf(row.anchor_sup) > mp.mpf(row.Q_sector_min):
        return "anchor_exceeds_margin"
    if mp.mpf(row.sector_gain_pct) < 0:
        return "sector_not_helpful"
    return "mixed_or_near_boundary"


def evaluate_subbox(
    subbox: SubboxSpec,
    N_values: list[int],
    K_values: list[int],
    M_values: list[int],
    sample_steps: int,
    sector_steps: int,
    sector_guard: mp.mpf,
) -> tuple[list[SubboxLedgerRow], list[SubboxPointRow]]:
    pseudo_box = BoxSpec(
        subbox.parent_id,
        subbox.sigma0,
        subbox.sigma1,
        subbox.t0,
        subbox.t1,
    )
    P4_min, Lsector = sector_lower_for_box(
        pseudo_box, sector_steps, sector_steps, sector_guard
    )
    samples = [
        evaluate_base(pseudo_box, sigma, t)
        for sigma in grid(subbox.sigma0, subbox.sigma1, sample_steps)
        for t in grid(subbox.t0, subbox.t1, sample_steps)
    ]
    q_worst_min = min(sample.Q_worst for sample in samples)
    q_phase_min = min(sample.Q_phase for sample in samples)
    q_sector_values = [
        sample.q_abs**2 * Lsector - sample.vertical_tail_upper
        for sample in samples
    ]
    q_sector_min = min(q_sector_values)
    anchor_sup = max(abs(sample.anchor) for sample in samples)
    rows: list[SubboxLedgerRow] = []
    point_rows: list[SubboxPointRow] = []

    for N in N_values:
        for K in K_values:
            for M in M_values:
                cut_values = [
                    abs(
                        rectangular_genuine(mp.mpc(sample.sigma, sample.t), K, M)
                        - sample.C
                    )
                    for sample in samples
                ]
                cut_sup = max(cut_values)
                counts = defaultdict(int)
                current_slacks: list[mp.mpf] = []
                direct_slacks: list[mp.mpf] = []
                seed_taxes: list[mp.mpf] = []
                for sample, cut_norm in zip(samples, cut_values):
                    s = mp.mpc(sample.sigma, sample.t)
                    H, _Hvec, _Htail = h_up_qratio(s, N)
                    Q_sector = sample.q_abs**2 * Lsector - sample.vertical_tail_upper
                    current = v_split_ledger(sample.q_abs, H, anchor_sup, cut_sup)
                    direct = v_split_direct_balanced_ledger(H, anchor_sup, cut_sup)
                    seed_tax = current - direct
                    seed_taxes.append(seed_tax)
                    current_slacks.append(Q_sector - current)
                    direct_slacks.append(Q_sector - direct)
                    counts["current_Qworst"] += int(current < sample.Q_worst)
                    counts["current_Qsector"] += int(current < Q_sector)
                    counts["current_Qphase"] += int(current < sample.Q_phase)
                    counts["direct_Qworst"] += int(direct < sample.Q_worst)
                    counts["direct_Qsector"] += int(direct < Q_sector)
                    counts["direct_Qphase"] += int(direct < sample.Q_phase)
                    point_rows.append(
                        SubboxPointRow(
                            box_id=subbox.parent_id,
                            subbox_id=subbox.subbox_id,
                            sigma=fmt(sample.sigma),
                            t=fmt(sample.t),
                            N=N,
                            K=K,
                            M=M,
                            anchor_norm=fmt(abs(sample.anchor)),
                            cut_norm=fmt(cut_norm),
                            anchor_sup=fmt(anchor_sup),
                            cut_sup=fmt(cut_sup),
                            H_qratio=fmt(H),
                            q_abs=fmt(sample.q_abs),
                            Q_worst=fmt(sample.Q_worst),
                            Q_sector=fmt(Q_sector),
                            Q_phase=fmt(sample.Q_phase),
                            current_ledger=fmt(current),
                            direct_balanced_ledger=fmt(direct),
                            current_slack_Qsector=fmt(Q_sector - current),
                            direct_slack_Qsector=fmt(Q_sector - direct),
                            current_pass_Qsector=bool_str(current < Q_sector),
                            direct_pass_Qsector=bool_str(direct < Q_sector),
                            channel_mode=CHANNEL_MODE,
                        )
                    )
                row = SubboxLedgerRow(
                    box_id=subbox.parent_id,
                    subbox_id=subbox.subbox_id,
                    N=N,
                    K=K,
                    M=M,
                    sigma_box=f"[{fmt(subbox.sigma0)},{fmt(subbox.sigma1)}]",
                    t_box=f"[{fmt(subbox.t0)},{fmt(subbox.t1)}]",
                    sample_count=len(samples),
                    anchor_sup=fmt(anchor_sup),
                    cut_sup=fmt(cut_sup),
                    P4_lower_sampled=fmt(P4_min),
                    Lsector_guarded=fmt(Lsector),
                    Q_worst_min=fmt(q_worst_min),
                    Q_sector_min=fmt(q_sector_min),
                    Q_phase_min=fmt(q_phase_min),
                    sector_gain_pct=fmt(pct_gain(q_sector_min, q_worst_min)),
                    current_pass_Qworst=counts["current_Qworst"],
                    current_pass_Qsector=counts["current_Qsector"],
                    current_pass_Qphase=counts["current_Qphase"],
                    direct_pass_Qworst=counts["direct_Qworst"],
                    direct_pass_Qsector=counts["direct_Qsector"],
                    direct_pass_Qphase=counts["direct_Qphase"],
                    current_worst_slack_Qsector=fmt(min(current_slacks)),
                    current_best_slack_Qsector=fmt(max(current_slacks)),
                    direct_worst_slack_Qsector=fmt(min(direct_slacks)),
                    direct_best_slack_Qsector=fmt(max(direct_slacks)),
                    seed_tax_max=fmt(max(seed_taxes)),
                    dominant_read="pending",
                )
                row.dominant_read = classify(row)
                rows.append(row)
    return rows, point_rows


def write_csv(path: Path, rows: list[object]) -> None:
    if not rows:
        return
    with path.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=list(asdict(rows[0]).keys()))
        writer.writeheader()
        for row in rows:
            writer.writerow(asdict(row))


def markdown_table(headers: list[str], rows: list[list[object]]) -> str:
    def cell(value: object) -> str:
        return str(value).replace("|", "\\|")

    out = ["| " + " | ".join(cell(header) for header in headers) + " |"]
    out.append("| " + " | ".join(["---"] * len(headers)) + " |")
    for row in rows:
        out.append("| " + " | ".join(cell(value) for value in row) + " |")
    return "\n".join(out)


def write_report(path: Path, rows: list[SubboxLedgerRow]) -> None:
    by_box: dict[str, list[SubboxLedgerRow]] = defaultdict(list)
    for row in rows:
        by_box[row.box_id].append(row)

    overview_rows = []
    for box_id, box_rows in by_box.items():
        total = sum(row.sample_count for row in box_rows)
        current = sum(row.current_pass_Qsector for row in box_rows)
        direct = sum(row.direct_pass_Qsector for row in box_rows)
        overview_rows.append(
            [
                box_id,
                len({row.subbox_id for row in box_rows}),
                max(mp.mpf(row.anchor_sup) for row in box_rows),
                max(mp.mpf(row.cut_sup) for row in box_rows),
                current,
                total,
                direct,
                total,
            ]
        )

    promising = [
        row
        for row in rows
        if row.box_id == "positive_pocket"
        and row.N == 50
        and row.dominant_read != "anchor_exceeds_margin"
    ][:24]
    promising_rows = [
        [
            row.subbox_id,
            row.N,
            row.K,
            row.M,
            row.anchor_sup,
            row.cut_sup,
            row.current_pass_Qsector,
            row.direct_pass_Qsector,
            row.current_best_slack_Qsector,
            row.dominant_read,
        ]
        for row in promising
    ]

    bad_rows = [
        [
            row.box_id,
            row.subbox_id,
            row.N,
            row.K,
            row.M,
            row.anchor_sup,
            row.Q_sector_min,
            row.current_pass_Qsector,
            row.direct_pass_Qsector,
            row.dominant_read,
        ]
        for row in rows
        if row.box_id != "positive_pocket" and row.N == 50 and row.K == 4 and row.M == 50
    ]

    text = f"""# Anchor Subbox Ledger Audit

Diagnostic only.  The numerical channel mode is `{CHANNEL_MODE}` and none of
these sampled values is a Lean certificate or active-route proof input.

Generated artifacts:

```text
audit_anchor_subbox_ledger_points.csv
audit_anchor_subbox_ledger_boxes.csv
audit_anchor_subbox_ledger_summary.json
```

## Overview

{markdown_table(
    [
        "box",
        "subboxes",
        "max anchor sup",
        "max cut sup",
        "current/Qsector",
        "current total",
        "direct/Qsector",
        "direct total",
    ],
    overview_rows,
)}

## Positive Pocket Candidates

Rows shown for `N=50`.  `direct_closes_resolvent_tax` means the audit-only
direct-balanced ledger closes the sampled subbox while the current q-ratio
ledger may still fail.

{markdown_table(
    [
        "subbox",
        "N",
        "K",
        "M",
        "anchor sup",
        "cut sup",
        "current/Qsector",
        "direct/Qsector",
        "best current slack",
        "read",
    ],
    promising_rows,
)}

## Bad-Box Confirmation

Representative rows for `N=50, K=4, M=50`.

{markdown_table(
    [
        "box",
        "subbox",
        "N",
        "K",
        "M",
        "anchor sup",
        "Qsector min",
        "current/Qsector",
        "direct/Qsector",
        "read",
    ],
    bad_rows,
)}

## Reading

Subdividing the positive pocket helps localize `anchor`, but the current
q-ratio ledger still often pays the resolvent tax.  The direct-balanced audit
ledger is the signal that the local geometry is promising; turning that into a
route theorem would require a genuine proof that the direct-balanced ledger
controls the actual residual, not just this diagnostic replacement.

The early and late boxes remain negative under subboxing with triangle-style
`anchorUpper`.  Those boxes need a structural cancellation or a different
anchor treatment.
"""
    path.write_text(text, encoding="utf-8")


def parse_args(argv: list[str]) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Scan anchor ledgers by subbox.")
    parser.add_argument("--dps", type=int, default=90)
    parser.add_argument("--boxes", default=DEFAULT_BOXES)
    parser.add_argument("--divisions", type=int, default=4)
    parser.add_argument("--sample-steps", type=int, default=5)
    parser.add_argument("--sector-steps", type=int, default=41)
    parser.add_argument("--sector-guard", default="0.002")
    parser.add_argument("--N-values", default="25,50")
    parser.add_argument("--K-values", default="3,4,5")
    parser.add_argument("--M-values", default="25,50,100")
    parser.add_argument("--points-csv", default="audit_anchor_subbox_ledger_points.csv")
    parser.add_argument("--boxes-csv", default="audit_anchor_subbox_ledger_boxes.csv")
    parser.add_argument("--json", default="audit_anchor_subbox_ledger_summary.json")
    parser.add_argument("--report", default="AUDIT_ANCHOR_SUBBOX_LEDGER_REPORT.md")
    return parser.parse_args(argv)


def main(argv: list[str]) -> int:
    args = parse_args(argv)
    mp.mp.dps = args.dps
    rows: list[SubboxLedgerRow] = []
    point_rows: list[SubboxPointRow] = []
    for box in parse_boxes(args.boxes):
        for subbox in make_subboxes(box, args.divisions):
            sub_rows, sub_points = evaluate_subbox(
                subbox=subbox,
                N_values=parse_csv_int(args.N_values),
                K_values=parse_csv_int(args.K_values),
                M_values=parse_csv_int(args.M_values),
                sample_steps=args.sample_steps,
                sector_steps=args.sector_steps,
                sector_guard=mp.mpf(args.sector_guard),
            )
            rows.extend(sub_rows)
            point_rows.extend(sub_points)

    write_csv(Path(args.boxes_csv), rows)
    write_csv(Path(args.points_csv), point_rows)
    write_report(Path(args.report), rows)
    summary = {
        "disclaimer": (
            "Diagnostic numerical laboratory only; not proof input for the "
            "genuine-first route."
        ),
        "channel_mode": CHANNEL_MODE,
        "settings": vars(args),
        "row_count": len(rows),
        "point_count": len(point_rows),
        "box_rows": [asdict(row) for row in rows],
    }
    Path(args.json).write_text(json.dumps(summary, indent=2), encoding="utf-8")

    print("Anchor subbox ledger scanner")
    print("mode: diagnostic numerical laboratory; not proof evidence")
    print(f"channel_mode: {CHANNEL_MODE}")
    print(f"box rows: {len(rows)}")
    print(f"point rows: {len(point_rows)}")
    for box_id in sorted({row.box_id for row in rows}):
        local = [row for row in rows if row.box_id == box_id]
        total = sum(row.sample_count for row in local)
        print(
            f"{box_id}: current/Qsector="
            f"{sum(row.current_pass_Qsector for row in local)}/{total}, "
            f"direct/Qsector={sum(row.direct_pass_Qsector for row in local)}/{total}, "
            f"max_anchor={fmt(max(mp.mpf(row.anchor_sup) for row in local))}"
        )
    print(f"wrote {args.points_csv}")
    print(f"wrote {args.boxes_csv}")
    print(f"wrote {args.json}")
    print(f"wrote {args.report}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
