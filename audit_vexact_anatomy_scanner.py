#!/usr/bin/env python3
"""Anatomy scanner for the continued-quartet V_exact bottleneck.

This is diagnostic numerical code, not proof evidence.  It keeps the q-ratio
horizontal profile as the baseline and decomposes the exact continued vertical
residual

    VVec = tau + rect - 2*C

against the quartet vector K4 = q^2 * P4(q).  The continued odd channel is
evaluated with mpmath zeta in `zeta_diagnostic` mode; do not use these values
as genuine-first Lean middle proof inputs.
"""

from __future__ import annotations

import argparse
import csv
import json
import sys
from dataclasses import asdict, dataclass
from pathlib import Path

import mpmath as mp

from audit_horizontal_qratio_scanner import (
    CHANNEL_MODE,
    continued_central_odd_channel,
    cut_exact,
    fmt,
    h_up_qratio,
    q_value,
    quartet_residual_margin,
    quartet_vector,
    rectangular_genuine,
    residual_upper,
    v_exact,
    vertical_depth_tail_from_two,
)


DEFAULT_DPS = 70
DEFAULT_SIGMAS = "0.75,0.85,0.92"
DEFAULT_TS = "20,30,45"
DEFAULT_N_VALUES = "25,50,100,200"
DEFAULT_M_VALUES = "5,9,15,25,50,100"


@dataclass
class VExactRow:
    sigma: str
    t: str
    N: int
    K: int
    M: int
    q_abs: str
    Q_worst: str
    Q_phase: str
    vertical_tail_upper: str
    K4_norm: str
    tau_norm: str
    rect_norm: str
    C_norm: str
    anchor_norm: str
    Cut_exact: str
    V_exact: str
    anchor_cut_triangle: str
    raw_tau_rect_C_triangle: str
    anchor_cut_cancellation: str
    raw_tau_rect_C_cancellation: str
    H_up_qratio: str
    HVec_norm: str
    H_tail: str
    U_current: str
    U_direct_balanced: str
    U_phase_aware: str
    resolvent_seed_tax: str
    slack_current_Q: str
    slack_direct_Q: str
    slack_phase_Q: str
    slack_current_Qphase: str
    slack_direct_Qphase: str
    slack_phase_Qphase: str
    U_current_over_Q: str
    U_direct_over_Q: str
    U_phase_over_Q: str
    current_pass_Q: str
    direct_pass_Q: str
    phase_pass_Q: str
    current_pass_Qphase: str
    direct_pass_Qphase: str
    phase_pass_Qphase: str
    cos_VVec_minus_K4: str
    cos_tau_minus_K4: str
    cos_rect_minus_K4: str
    cos_C_minus_K4: str
    cos_anchor_minus_K4: str
    cos_CutVec_minus_K4: str
    cos_HVec_minus_K4: str
    bottleneck: str
    channel_mode: str


def parse_csv_mpf(raw: str) -> list[mp.mpf]:
    return [mp.mpf(part.strip()) for part in raw.split(",") if part.strip()]


def parse_csv_int(raw: str) -> list[int]:
    return [int(part.strip()) for part in raw.split(",") if part.strip()]


def parse_k_values(args: argparse.Namespace) -> list[int]:
    if args.K_values:
        return parse_csv_int(args.K_values)
    start, end = args.K_range.split(":")
    return list(range(int(start), int(end) + 1))


def cosine_against_minus(z: mp.mpc, target: mp.mpc) -> mp.mpf:
    if abs(z) == 0 or abs(target) == 0:
        return mp.nan
    minus_target = -target
    return mp.re(z * mp.conj(minus_target)) / (abs(z) * abs(minus_target))


def bool_str(value: bool) -> str:
    return "yes" if value else "no"


def classify_bottleneck(
    Q: mp.mpf,
    Q_phase: mp.mpf,
    U_current: mp.mpf,
    U_direct: mp.mpf,
    U_phase: mp.mpf,
    V: mp.mpf,
    H: mp.mpf,
    Cut: mp.mpf,
) -> str:
    current_pass = U_current < Q
    direct_pass = U_direct < Q
    phase_pass = U_phase < Q
    if current_pass:
        return "current_passes"
    if direct_pass:
        return "resolvent_seed_factor"
    if phase_pass:
        return "phase_cancellation"
    if U_phase < Q_phase and U_phase >= Q:
        return "quartet_margin_pessimism"
    if U_direct < Q_phase and U_direct >= Q:
        return "margin_plus_resolvent"
    components = {"V_exact": V, "H_up": H, "Cut_exact": Cut}
    return max(components.items(), key=lambda item: item[1])[0]


def evaluate(sigma: mp.mpf, t: mp.mpf, N: int, K: int, M: int) -> VExactRow:
    s = mp.mpc(sigma, t)
    q = q_value(s)
    r = abs(q)
    tau = vertical_depth_tail_from_two(s)
    rect = rectangular_genuine(s, K, M)
    C = continued_central_odd_channel(s)
    anchor = tau - C
    CutVec = rect - C
    VVec = tau + rect - 2 * C
    V, _ = v_exact(s, K, M)
    Cut, _ = cut_exact(s, K, M)
    H, HVec, H_tail = h_up_qratio(s, N)
    K4 = quartet_vector(s)
    tail_upper = r**6 / (1 - r)
    Q = quartet_residual_margin(s)
    Q_phase = abs(K4) - tail_upper
    U_current = residual_upper(V, H, Cut, r)
    U_direct = V + 2 * H + Cut
    U_phase = abs(VVec + HVec) + H_tail + Cut
    anchor_cut_triangle = abs(anchor) + abs(CutVec)
    raw_triangle = abs(tau) + abs(rect) + 2 * abs(C)
    anchor_cancel = (
        (anchor_cut_triangle - abs(VVec)) / anchor_cut_triangle
        if anchor_cut_triangle != 0
        else mp.nan
    )
    raw_cancel = (
        (raw_triangle - abs(VVec)) / raw_triangle
        if raw_triangle != 0
        else mp.nan
    )

    return VExactRow(
        sigma=fmt(sigma),
        t=fmt(t),
        N=N,
        K=K,
        M=M,
        q_abs=fmt(r),
        Q_worst=fmt(Q),
        Q_phase=fmt(Q_phase),
        vertical_tail_upper=fmt(tail_upper),
        K4_norm=fmt(abs(K4)),
        tau_norm=fmt(abs(tau)),
        rect_norm=fmt(abs(rect)),
        C_norm=fmt(abs(C)),
        anchor_norm=fmt(abs(anchor)),
        Cut_exact=fmt(Cut),
        V_exact=fmt(V),
        anchor_cut_triangle=fmt(anchor_cut_triangle),
        raw_tau_rect_C_triangle=fmt(raw_triangle),
        anchor_cut_cancellation=fmt(anchor_cancel),
        raw_tau_rect_C_cancellation=fmt(raw_cancel),
        H_up_qratio=fmt(H),
        HVec_norm=fmt(abs(HVec)),
        H_tail=fmt(H_tail),
        U_current=fmt(U_current),
        U_direct_balanced=fmt(U_direct),
        U_phase_aware=fmt(U_phase),
        resolvent_seed_tax=fmt(U_current - U_direct),
        slack_current_Q=fmt(Q - U_current),
        slack_direct_Q=fmt(Q - U_direct),
        slack_phase_Q=fmt(Q - U_phase),
        slack_current_Qphase=fmt(Q_phase - U_current),
        slack_direct_Qphase=fmt(Q_phase - U_direct),
        slack_phase_Qphase=fmt(Q_phase - U_phase),
        U_current_over_Q=fmt(U_current / Q if Q != 0 else mp.inf),
        U_direct_over_Q=fmt(U_direct / Q if Q != 0 else mp.inf),
        U_phase_over_Q=fmt(U_phase / Q if Q != 0 else mp.inf),
        current_pass_Q=bool_str(U_current < Q),
        direct_pass_Q=bool_str(U_direct < Q),
        phase_pass_Q=bool_str(U_phase < Q),
        current_pass_Qphase=bool_str(U_current < Q_phase),
        direct_pass_Qphase=bool_str(U_direct < Q_phase),
        phase_pass_Qphase=bool_str(U_phase < Q_phase),
        cos_VVec_minus_K4=fmt(cosine_against_minus(VVec, K4)),
        cos_tau_minus_K4=fmt(cosine_against_minus(tau, K4)),
        cos_rect_minus_K4=fmt(cosine_against_minus(rect, K4)),
        cos_C_minus_K4=fmt(cosine_against_minus(C, K4)),
        cos_anchor_minus_K4=fmt(cosine_against_minus(anchor, K4)),
        cos_CutVec_minus_K4=fmt(cosine_against_minus(CutVec, K4)),
        cos_HVec_minus_K4=fmt(cosine_against_minus(HVec, K4)),
        bottleneck=classify_bottleneck(Q, Q_phase, U_current, U_direct, U_phase, V, H, Cut),
        channel_mode=CHANNEL_MODE,
    )


def write_csv(path: Path, rows: list[VExactRow]) -> None:
    if not rows:
        return
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=list(asdict(rows[0]).keys()))
        writer.writeheader()
        for row in rows:
            writer.writerow(asdict(row))


def to_mpf(row: VExactRow, field: str) -> mp.mpf:
    return mp.mpf(getattr(row, field))


def summarize(rows: list[VExactRow]) -> dict[str, object]:
    best_current = max(rows, key=lambda row: to_mpf(row, "slack_current_Q"))
    best_direct = max(rows, key=lambda row: to_mpf(row, "slack_direct_Q"))
    best_phase = max(rows, key=lambda row: to_mpf(row, "slack_phase_Q"))
    best_phase_margin = max(rows, key=lambda row: to_mpf(row, "slack_phase_Qphase"))
    return {
        "disclaimer": (
            "Diagnostic numerical laboratory only; continued channel uses "
            "zeta_diagnostic evaluation and is not genuine-first proof input."
        ),
        "channel_mode": CHANNEL_MODE,
        "count": len(rows),
        "passes": {
            "current_Q": sum(row.current_pass_Q == "yes" for row in rows),
            "direct_Q": sum(row.direct_pass_Q == "yes" for row in rows),
            "phase_Q": sum(row.phase_pass_Q == "yes" for row in rows),
            "current_Qphase": sum(row.current_pass_Qphase == "yes" for row in rows),
            "direct_Qphase": sum(row.direct_pass_Qphase == "yes" for row in rows),
            "phase_Qphase": sum(row.phase_pass_Qphase == "yes" for row in rows),
        },
        "bottlenecks": {
            name: sum(row.bottleneck == name for row in rows)
            for name in sorted({row.bottleneck for row in rows})
        },
        "best_current_Q": asdict(best_current),
        "best_direct_Q": asdict(best_direct),
        "best_phase_Q": asdict(best_phase),
        "best_phase_Qphase": asdict(best_phase_margin),
        "top_current_Q": [
            asdict(row)
            for row in sorted(rows, key=lambda row: to_mpf(row, "slack_current_Q"), reverse=True)[:10]
        ],
        "top_direct_Q": [
            asdict(row)
            for row in sorted(rows, key=lambda row: to_mpf(row, "slack_direct_Q"), reverse=True)[:10]
        ],
        "top_phase_Q": [
            asdict(row)
            for row in sorted(rows, key=lambda row: to_mpf(row, "slack_phase_Q"), reverse=True)[:10]
        ],
    }


def print_summary(rows: list[VExactRow]) -> None:
    summary = summarize(rows)
    print("V_exact anatomy scanner")
    print("mode: diagnostic numerical laboratory; not proof evidence")
    print(f"channel_mode: {CHANNEL_MODE}")
    print(f"count: {summary['count']}")
    print(f"passes: {summary['passes']}")
    print(f"bottlenecks: {summary['bottlenecks']}")
    print()
    for label in ["best_current_Q", "best_direct_Q", "best_phase_Q", "best_phase_Qphase"]:
        row = summary[label]
        print(
            f"{label}: sigma={row['sigma']} t={row['t']} N={row['N']} K={row['K']} M={row['M']} "
            f"slack_current={row['slack_current_Q']} slack_direct={row['slack_direct_Q']} "
            f"slack_phase={row['slack_phase_Q']} slack_phase_Qphase={row['slack_phase_Qphase']} "
            f"bottleneck={row['bottleneck']}"
        )


def parse_args(argv: list[str]) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Scan anatomy of V_exact bottleneck.")
    parser.add_argument("--dps", type=int, default=DEFAULT_DPS)
    parser.add_argument("--sigmas", default=DEFAULT_SIGMAS)
    parser.add_argument("--ts", default=DEFAULT_TS)
    parser.add_argument("--N-values", default=DEFAULT_N_VALUES)
    parser.add_argument("--K-range", default="2:20")
    parser.add_argument("--K-values", default="")
    parser.add_argument("--M-values", default=DEFAULT_M_VALUES)
    parser.add_argument("--csv", default="audit_vexact_anatomy.csv")
    parser.add_argument("--json", default="audit_vexact_anatomy.json")
    return parser.parse_args(argv)


def main(argv: list[str]) -> int:
    args = parse_args(argv)
    mp.mp.dps = args.dps
    rows: list[VExactRow] = []
    for sigma in parse_csv_mpf(args.sigmas):
        for t in parse_csv_mpf(args.ts):
            for N in parse_csv_int(args.N_values):
                for K in parse_k_values(args):
                    for M in parse_csv_int(args.M_values):
                        rows.append(evaluate(sigma, t, N, K, M))
    write_csv(Path(args.csv), rows)
    summary = summarize(rows)
    Path(args.json).write_text(json.dumps(summary, indent=2), encoding="utf-8")
    print_summary(rows)
    print()
    print(f"wrote {args.csv}")
    print(f"wrote {args.json}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
