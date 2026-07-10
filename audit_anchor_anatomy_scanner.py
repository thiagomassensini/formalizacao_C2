#!/usr/bin/env python3
"""Anchor anatomy scanner for the C2 continued-quartet V-split audit.

Diagnostic laboratory only.  The continued odd channel is evaluated with the
same `zeta_diagnostic` continuation used by the other audit scanners; these
values are not proof inputs for the genuine-first Lean middle route.
"""

from __future__ import annotations

import argparse
import csv
import json
import sys
from collections import Counter, defaultdict
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
    quartet_vector,
    rectangular_genuine,
    residual_upper,
    vertical_depth_tail_from_two,
    vertical_quartet_prefix,
)


DEFAULT_BOXES = (
    "positive_pocket:0.84:0.92:32.75:33.0;"
    "early_anchor_fail:0.84:0.92:32.0:32.25;"
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
class BaseSample:
    box_id: str
    sigma: mp.mpf
    t: mp.mpf
    q_abs: mp.mpf
    P4_norm: mp.mpf
    Q_worst: mp.mpf
    Q_phase: mp.mpf
    vertical_tail_upper: mp.mpf
    tau: mp.mpc
    odd: mp.mpc
    C: mp.mpc
    factor: mp.mpc
    anchor: mp.mpc
    K4: mp.mpc


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
    Q_worst: str
    Q_sector: str
    Q_phase: str
    tau_norm: str
    odd_norm: str
    central_norm: str
    factor_norm: str
    anchor_norm: str
    tau_factor_product: str
    factorization_abs_error: str
    cos_tau_minus_K4: str
    cos_C_minus_K4: str
    cos_anchor_minus_K4: str
    cut_norm: str
    H_up_qratio: str
    anchorUpper_direct: str
    anchorUpper_factored: str
    cutUpper_observed: str
    ledger_direct_anchor_Qworst: str
    ledger_direct_anchor_Qsector: str
    ledger_direct_anchor_Qphase: str
    ledger_factored_anchor_Qworst: str
    ledger_factored_anchor_Qsector: str
    ledger_direct_balanced_Qsector: str
    seed_tax_direct_upper: str
    pass_direct_anchor_Qworst: str
    pass_direct_anchor_Qsector: str
    pass_direct_anchor_Qphase: str
    pass_factored_anchor_Qsector: str
    pass_direct_balanced_Qsector: str
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
    Q_worst_min: str
    Q_sector_min: str
    Q_phase_min: str
    sector_gain_min_pct: str
    tau_min: str
    tau_median: str
    tau_max: str
    factor_min: str
    factor_median: str
    factor_max: str
    anchor_min: str
    anchor_median: str
    anchor_max: str
    anchor_rel_range: str
    anchor_sigma_slope_est: str
    anchor_t_slope_est: str
    cos_anchor_min: str
    cos_anchor_median: str
    cos_anchor_max: str
    cutUpper_observed: str
    anchorUpper_direct: str
    anchorUpper_factored: str
    factored_over_direct: str
    ledger_direct_pass_Qworst: int
    ledger_direct_pass_Qsector: int
    ledger_direct_pass_Qphase: int
    ledger_factored_pass_Qsector: int
    direct_balanced_pass_Qsector: int
    worst_slack_direct_anchor_Qsector: str
    best_slack_direct_anchor_Qsector: str
    seed_tax_direct_upper_max: str
    dominant_anchor_growth: str
    formalization_read: str


@dataclass
class SubboxRow:
    box_id: str
    subbox_id: str
    sigma_box: str
    t_box: str
    sample_count: int
    anchor_max: str
    tau_max: str
    factor_max: str
    cos_anchor_min: str
    cos_anchor_max: str
    Q_worst_min: str
    Q_phase_min: str


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


def cosine_against_minus(z: mp.mpc, target: mp.mpc) -> mp.mpf:
    if abs(z) == 0 or abs(target) == 0:
        return mp.nan
    minus_target = -target
    return mp.re(z * mp.conj(minus_target)) / (abs(z) * abs(minus_target))


def v_split_ledger(
    r: mp.mpf,
    H: mp.mpf,
    anchor_upper: mp.mpf,
    cut_upper: mp.mpf,
) -> mp.mpf:
    return ((anchor_upper + cut_upper + H) * (1 + r)) / (1 - r) + H + cut_upper


def v_split_direct_balanced_ledger(
    H: mp.mpf,
    anchor_upper: mp.mpf,
    cut_upper: mp.mpf,
) -> mp.mpf:
    return anchor_upper + cut_upper + 2 * H + cut_upper


def sector_lower_for_box(
    box: BoxSpec,
    sigma_steps: int,
    t_steps: int,
    guard: mp.mpf,
) -> tuple[mp.mpf, mp.mpf]:
    sampled_min = mp.inf
    for sigma in grid(box.sigma0, box.sigma1, sigma_steps):
        for t in grid(box.t0, box.t1, t_steps):
            sampled_min = min(
                sampled_min,
                abs(vertical_quartet_prefix(q_value(mp.mpc(sigma, t)))),
            )
    return sampled_min, max(mp.mpf("0"), sampled_min * (1 - guard))


def evaluate_base(box: BoxSpec, sigma: mp.mpf, t: mp.mpf) -> BaseSample:
    s = mp.mpc(sigma, t)
    q = q_value(s)
    r = abs(q)
    tau = vertical_depth_tail_from_two(s)
    odd = odd_dirichlet_channel_diagnostic(s)
    C = continued_central_odd_channel(s)
    factor = 1 - 2 * odd
    anchor = tau - C
    K4 = quartet_vector(s)
    tail_upper = r**6 / (1 - r)
    return BaseSample(
        box_id=box.box_id,
        sigma=sigma,
        t=t,
        q_abs=r,
        P4_norm=abs(vertical_quartet_prefix(q)),
        Q_worst=quartet_residual_margin(s),
        Q_phase=abs(K4) - tail_upper,
        vertical_tail_upper=tail_upper,
        tau=tau,
        odd=odd,
        C=C,
        factor=factor,
        anchor=anchor,
        K4=K4,
    )


def classify_anchor_growth(
    row: BoxRow,
    positive_reference: dict[str, mp.mpf] | None,
) -> str:
    anchor_max = mp.mpf(row.anchor_max)
    tau_max = mp.mpf(row.tau_max)
    factor_max = mp.mpf(row.factor_max)
    sector_gain = mp.mpf(row.sector_gain_min_pct)
    cos_med = mp.mpf(row.cos_anchor_median)
    rel = mp.mpf(row.anchor_rel_range)
    tags: list[str] = []
    if positive_reference:
        if tau_max > 1.25 * positive_reference["tau_max"]:
            tags.append("tau_larger")
        if factor_max > 1.50 * positive_reference["factor_max"]:
            tags.append("factor_larger")
        if anchor_max > 2 * positive_reference["anchor_max"]:
            tags.append("anchor_much_larger")
    if cos_med > mp.mpf("0.75"):
        tags.append("anchor_phase_aligned")
    if rel > mp.mpf("0.50"):
        tags.append("strong_box_variation")
    if sector_gain < 0:
        tags.append("sector_unhelpful")
    if not tags:
        tags.append("localized_or_mixed")
    return "+".join(tags)


def formalization_read(row: BoxRow) -> str:
    if row.ledger_direct_pass_Qsector == row.point_count:
        return "box_upper_closes_with_sector"
    if row.direct_balanced_pass_Qsector == row.point_count:
        return "resolvent_factor_is_main_tax"
    if mp.mpf(row.anchor_max) > mp.mpf(row.Q_sector_min):
        return "anchor_exceeds_margin_scale"
    if mp.mpf(row.sector_gain_min_pct) < 0:
        return "sector_box_not_promising"
    return "needs_anchor_structure_or_subboxes"


def slope_estimates(samples: list[BaseSample]) -> tuple[mp.mpf, mp.mpf]:
    by_point = {(s.sigma, s.t): abs(s.anchor) for s in samples}
    sigmas = sorted({s.sigma for s in samples})
    ts = sorted({s.t for s in samples})
    sigma_slope = mp.mpf("0")
    t_slope = mp.mpf("0")
    for t in ts:
        for a, b in zip(sigmas, sigmas[1:]):
            if (a, t) in by_point and (b, t) in by_point and b != a:
                sigma_slope = max(
                    sigma_slope,
                    abs(by_point[(b, t)] - by_point[(a, t)]) / abs(b - a),
                )
    for sigma in sigmas:
        for a, b in zip(ts, ts[1:]):
            if (sigma, a) in by_point and (sigma, b) in by_point and b != a:
                t_slope = max(
                    t_slope,
                    abs(by_point[(sigma, b)] - by_point[(sigma, a)]) / abs(b - a),
                )
    return sigma_slope, t_slope


def summarize_subboxes(
    box: BoxSpec,
    samples: list[BaseSample],
    divisions: int,
) -> list[SubboxRow]:
    if divisions <= 1:
        return []
    rows: list[SubboxRow] = []
    sigma_edges = grid(box.sigma0, box.sigma1, divisions + 1)
    t_edges = grid(box.t0, box.t1, divisions + 1)
    for i in range(divisions):
        for j in range(divisions):
            s0, s1 = sigma_edges[i], sigma_edges[i + 1]
            t0, t1 = t_edges[j], t_edges[j + 1]
            local = [
                sample
                for sample in samples
                if s0 <= sample.sigma <= s1 and t0 <= sample.t <= t1
            ]
            if not local:
                continue
            rows.append(
                SubboxRow(
                    box_id=box.box_id,
                    subbox_id=f"{i},{j}",
                    sigma_box=f"[{fmt(s0)},{fmt(s1)}]",
                    t_box=f"[{fmt(t0)},{fmt(t1)}]",
                    sample_count=len(local),
                    anchor_max=fmt(max(abs(s.anchor) for s in local)),
                    tau_max=fmt(max(abs(s.tau) for s in local)),
                    factor_max=fmt(max(abs(s.factor) for s in local)),
                    cos_anchor_min=fmt(
                        min(cosine_against_minus(s.anchor, s.K4) for s in local)
                    ),
                    cos_anchor_max=fmt(
                        max(cosine_against_minus(s.anchor, s.K4) for s in local)
                    ),
                    Q_worst_min=fmt(min(s.Q_worst for s in local)),
                    Q_phase_min=fmt(min(s.Q_phase for s in local)),
                )
            )
    return rows


def build_outputs(
    boxes: list[BoxSpec],
    N_values: list[int],
    K_values: list[int],
    M_values: list[int],
    sigma_steps: int,
    t_steps: int,
    sector_sigma_steps: int,
    sector_t_steps: int,
    sector_guard: mp.mpf,
    subbox_divisions: int,
) -> tuple[list[PointRow], list[BoxRow], list[SubboxRow], dict[str, object]]:
    samples_by_box: dict[str, list[BaseSample]] = {}
    sector_by_box: dict[str, tuple[mp.mpf, mp.mpf]] = {}
    subbox_rows: list[SubboxRow] = []

    for box in boxes:
        sector_by_box[box.box_id] = sector_lower_for_box(
            box, sector_sigma_steps, sector_t_steps, sector_guard
        )
        samples = [
            evaluate_base(box, sigma, t)
            for sigma in grid(box.sigma0, box.sigma1, sigma_steps)
            for t in grid(box.t0, box.t1, t_steps)
        ]
        samples_by_box[box.box_id] = samples
        subbox_rows.extend(summarize_subboxes(box, samples, subbox_divisions))

    anchor_stats: dict[str, dict[str, mp.mpf]] = {}
    for box_id, samples in samples_by_box.items():
        anchor_stats[box_id] = {
            "anchor_direct": max(abs(s.anchor) for s in samples),
            "tau_sup": max(abs(s.tau) for s in samples),
            "factor_sup": max(abs(s.factor) for s in samples),
        }
        anchor_stats[box_id]["anchor_factored"] = (
            anchor_stats[box_id]["tau_sup"] * anchor_stats[box_id]["factor_sup"]
        )

    positive_reference = None
    if "positive_pocket" in anchor_stats:
        positive_reference = {
            "anchor_max": anchor_stats["positive_pocket"]["anchor_direct"],
            "tau_max": anchor_stats["positive_pocket"]["tau_sup"],
            "factor_max": anchor_stats["positive_pocket"]["factor_sup"],
        }

    point_rows: list[PointRow] = []
    box_rows: list[BoxRow] = []
    box_by_id = {box.box_id: box for box in boxes}

    for box_id, samples in samples_by_box.items():
        box = box_by_id[box_id]
        sampled_min_P4, Lsector = sector_by_box[box_id]
        sigma_box = f"[{fmt(box.sigma0)},{fmt(box.sigma1)}]"
        t_box = f"[{fmt(box.t0)},{fmt(box.t1)}]"
        tau_values = [abs(s.tau) for s in samples]
        factor_values = [abs(s.factor) for s in samples]
        anchor_values = [abs(s.anchor) for s in samples]
        cos_anchor_values = [cosine_against_minus(s.anchor, s.K4) for s in samples]
        sigma_slope, t_slope = slope_estimates(samples)

        for N in N_values:
            for K in K_values:
                for M in M_values:
                    cut_values = [
                        abs(rectangular_genuine(mp.mpc(s.sigma, s.t), K, M) - s.C)
                        for s in samples
                    ]
                    cut_upper = max(cut_values)
                    anchor_direct = anchor_stats[box_id]["anchor_direct"]
                    anchor_factored = anchor_stats[box_id]["anchor_factored"]
                    pass_counts = Counter()
                    direct_slacks: list[mp.mpf] = []
                    seed_taxes: list[mp.mpf] = []
                    issues: Counter[str] = Counter()

                    for sample, cut_norm in zip(samples, cut_values):
                        s = mp.mpc(sample.sigma, sample.t)
                        H, _Hvec, _Htail = h_up_qratio(s, N)
                        Q_sector = sample.q_abs**2 * Lsector - sample.vertical_tail_upper
                        ledger_direct = v_split_ledger(
                            sample.q_abs, H, anchor_direct, cut_upper
                        )
                        ledger_factored = v_split_ledger(
                            sample.q_abs, H, anchor_factored, cut_upper
                        )
                        direct_balanced = v_split_direct_balanced_ledger(
                            H, anchor_direct, cut_upper
                        )
                        seed_tax = ledger_direct - direct_balanced
                        seed_taxes.append(seed_tax)
                        direct_slacks.append(Q_sector - ledger_direct)
                        pass_counts["direct_Qworst"] += int(ledger_direct < sample.Q_worst)
                        pass_counts["direct_Qsector"] += int(ledger_direct < Q_sector)
                        pass_counts["direct_Qphase"] += int(ledger_direct < sample.Q_phase)
                        pass_counts["factored_Qsector"] += int(
                            ledger_factored < Q_sector
                        )
                        pass_counts["balanced_Qsector"] += int(
                            direct_balanced < Q_sector
                        )
                        if ledger_direct < sample.Q_worst:
                            issue = "box_upper_closes_worst"
                        elif ledger_direct < Q_sector:
                            issue = "sector_margin_suffices"
                        elif direct_balanced < Q_sector:
                            issue = "resolvent_seed_factor"
                        elif anchor_direct > Q_sector:
                            issue = "anchor_exceeds_margin_scale"
                        elif Lsector <= sampled_min_P4 * mp.mpf("0.99"):
                            issue = "sector_guard_or_margin"
                        else:
                            issue = "mixed_anchor_cut"
                        issues[issue] += 1

                        point_rows.append(
                            PointRow(
                                box_id=box_id,
                                sigma_box=sigma_box,
                                t_box=t_box,
                                sigma=fmt(sample.sigma),
                                t=fmt(sample.t),
                                N=N,
                                K=K,
                                M=M,
                                q_abs=fmt(sample.q_abs),
                                P4_norm=fmt(sample.P4_norm),
                                Lsector_guarded=fmt(Lsector),
                                Q_worst=fmt(sample.Q_worst),
                                Q_sector=fmt(Q_sector),
                                Q_phase=fmt(sample.Q_phase),
                                tau_norm=fmt(abs(sample.tau)),
                                odd_norm=fmt(abs(sample.odd)),
                                central_norm=fmt(abs(sample.C)),
                                factor_norm=fmt(abs(sample.factor)),
                                anchor_norm=fmt(abs(sample.anchor)),
                                tau_factor_product=fmt(
                                    abs(sample.tau) * abs(sample.factor)
                                ),
                                factorization_abs_error=fmt(
                                    abs(sample.anchor - sample.tau * sample.factor)
                                ),
                                cos_tau_minus_K4=fmt(
                                    cosine_against_minus(sample.tau, sample.K4)
                                ),
                                cos_C_minus_K4=fmt(
                                    cosine_against_minus(sample.C, sample.K4)
                                ),
                                cos_anchor_minus_K4=fmt(
                                    cosine_against_minus(sample.anchor, sample.K4)
                                ),
                                cut_norm=fmt(cut_norm),
                                H_up_qratio=fmt(H),
                                anchorUpper_direct=fmt(anchor_direct),
                                anchorUpper_factored=fmt(anchor_factored),
                                cutUpper_observed=fmt(cut_upper),
                                ledger_direct_anchor_Qworst=fmt(
                                    sample.Q_worst - ledger_direct
                                ),
                                ledger_direct_anchor_Qsector=fmt(
                                    Q_sector - ledger_direct
                                ),
                                ledger_direct_anchor_Qphase=fmt(
                                    sample.Q_phase - ledger_direct
                                ),
                                ledger_factored_anchor_Qworst=fmt(
                                    sample.Q_worst - ledger_factored
                                ),
                                ledger_factored_anchor_Qsector=fmt(
                                    Q_sector - ledger_factored
                                ),
                                ledger_direct_balanced_Qsector=fmt(
                                    Q_sector - direct_balanced
                                ),
                                seed_tax_direct_upper=fmt(seed_tax),
                                pass_direct_anchor_Qworst=bool_str(
                                    ledger_direct < sample.Q_worst
                                ),
                                pass_direct_anchor_Qsector=bool_str(
                                    ledger_direct < Q_sector
                                ),
                                pass_direct_anchor_Qphase=bool_str(
                                    ledger_direct < sample.Q_phase
                                ),
                                pass_factored_anchor_Qsector=bool_str(
                                    ledger_factored < Q_sector
                                ),
                                pass_direct_balanced_Qsector=bool_str(
                                    direct_balanced < Q_sector
                                ),
                                diagnostic_issue=issue,
                                channel_mode=CHANNEL_MODE,
                            )
                        )

                    Q_worst_min = min(s.Q_worst for s in samples)
                    Q_phase_min = min(s.Q_phase for s in samples)
                    q_sector_values = [
                        s.q_abs**2 * Lsector - s.vertical_tail_upper for s in samples
                    ]
                    Q_sector_min = min(q_sector_values)
                    sector_gain = (
                        100 * (Q_sector_min - Q_worst_min) / abs(Q_worst_min)
                        if Q_worst_min != 0
                        else mp.nan
                    )
                    row = BoxRow(
                        box_id=box_id,
                        N=N,
                        K=K,
                        M=M,
                        sigma_box=sigma_box,
                        t_box=t_box,
                        point_count=len(samples),
                        sampled_min_P4=fmt(sampled_min_P4),
                        guarded_Lsector=fmt(Lsector),
                        Q_worst_min=fmt(Q_worst_min),
                        Q_sector_min=fmt(Q_sector_min),
                        Q_phase_min=fmt(Q_phase_min),
                        sector_gain_min_pct=fmt(sector_gain),
                        tau_min=fmt(min(tau_values)),
                        tau_median=fmt(median(tau_values)),
                        tau_max=fmt(max(tau_values)),
                        factor_min=fmt(min(factor_values)),
                        factor_median=fmt(median(factor_values)),
                        factor_max=fmt(max(factor_values)),
                        anchor_min=fmt(min(anchor_values)),
                        anchor_median=fmt(median(anchor_values)),
                        anchor_max=fmt(max(anchor_values)),
                        anchor_rel_range=fmt(
                            rel_range(min(anchor_values), max(anchor_values))
                        ),
                        anchor_sigma_slope_est=fmt(sigma_slope),
                        anchor_t_slope_est=fmt(t_slope),
                        cos_anchor_min=fmt(min(cos_anchor_values)),
                        cos_anchor_median=fmt(median(cos_anchor_values)),
                        cos_anchor_max=fmt(max(cos_anchor_values)),
                        cutUpper_observed=fmt(cut_upper),
                        anchorUpper_direct=fmt(anchor_direct),
                        anchorUpper_factored=fmt(anchor_factored),
                        factored_over_direct=fmt(
                            anchor_factored / anchor_direct
                            if anchor_direct != 0
                            else mp.inf
                        ),
                        ledger_direct_pass_Qworst=pass_counts["direct_Qworst"],
                        ledger_direct_pass_Qsector=pass_counts["direct_Qsector"],
                        ledger_direct_pass_Qphase=pass_counts["direct_Qphase"],
                        ledger_factored_pass_Qsector=pass_counts["factored_Qsector"],
                        direct_balanced_pass_Qsector=pass_counts["balanced_Qsector"],
                        worst_slack_direct_anchor_Qsector=fmt(min(direct_slacks)),
                        best_slack_direct_anchor_Qsector=fmt(max(direct_slacks)),
                        seed_tax_direct_upper_max=fmt(max(seed_taxes)),
                        dominant_anchor_growth="pending",
                        formalization_read="pending",
                    )
                    row.dominant_anchor_growth = classify_anchor_growth(
                        row, positive_reference
                    )
                    row.formalization_read = formalization_read(row)
                    box_rows.append(row)

    summary = {
        "disclaimer": (
            "Diagnostic numerical laboratory only; continued channel uses "
            "zeta_diagnostic evaluation and is not proof input."
        ),
        "channel_mode": CHANNEL_MODE,
        "sample_counts": {
            "points": len(point_rows),
            "boxes": len(box_rows),
            "subboxes": len(subbox_rows),
        },
        "settings": {
            "sigma_steps": sigma_steps,
            "t_steps": t_steps,
            "sector_sigma_steps": sector_sigma_steps,
            "sector_t_steps": sector_t_steps,
            "sector_guard": fmt(sector_guard),
            "N_values": N_values,
            "K_values": K_values,
            "M_values": M_values,
        },
        "box_rows": [asdict(row) for row in box_rows],
        "subbox_rows": [asdict(row) for row in subbox_rows],
    }
    return point_rows, box_rows, subbox_rows, summary


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


def report_anchor_table(box_rows: list[BoxRow]) -> str:
    first_by_box: dict[str, BoxRow] = {}
    for row in box_rows:
        first_by_box.setdefault(row.box_id, row)
    rows = []
    for row in first_by_box.values():
        rows.append(
            [
                row.box_id,
                row.tau_max,
                row.factor_max,
                row.anchor_max,
                row.anchor_rel_range,
                row.cos_anchor_median,
                row.dominant_anchor_growth,
            ]
        )
    return markdown_table(
        [
            "box",
            "max |tau|",
            "max |1-2 odd|",
            "max |anchor|",
            "anchor rel range",
            "median cos(anchor,-K4)",
            "growth read",
        ],
        rows,
    )


def report_ledger_table(box_rows: list[BoxRow]) -> str:
    rows = []
    for row in box_rows:
        rows.append(
            [
                row.box_id,
                row.K,
                row.M,
                row.anchorUpper_direct,
                row.anchorUpper_factored,
                row.cutUpper_observed,
                row.ledger_direct_pass_Qsector,
                row.direct_balanced_pass_Qsector,
                row.worst_slack_direct_anchor_Qsector,
                row.formalization_read,
            ]
        )
    return markdown_table(
        [
            "box",
            "K",
            "M",
            "anchor direct",
            "anchor factored",
            "cut upper",
            "q-ledger/Qsector",
            "direct/Qsector",
            "worst q-ledger slack",
            "read",
        ],
        rows,
    )


def report_subbox_table(subbox_rows: list[SubboxRow]) -> str:
    rows = []
    for row in subbox_rows:
        rows.append(
            [
                row.box_id,
                row.subbox_id,
                row.sigma_box,
                row.t_box,
                row.anchor_max,
                row.factor_max,
                row.cos_anchor_min,
                row.cos_anchor_max,
            ]
        )
    return markdown_table(
        [
            "box",
            "subbox",
            "sigma",
            "t",
            "max |anchor|",
            "max factor",
            "min cos",
            "max cos",
        ],
        rows,
    )


def write_report(path: Path, box_rows: list[BoxRow], subbox_rows: list[SubboxRow]) -> None:
    text = f"""# Anchor anatomy audit

This is a diagnostic report only.  The continued odd channel is evaluated in
`{CHANNEL_MODE}` mode and is not proof input for the genuine-first Lean middle
route.

Generated artifacts:

```text
audit_anchor_anatomy_points.csv
audit_anchor_anatomy_boxes.csv
audit_anchor_anatomy_subboxes.csv
audit_anchor_anatomy_summary.json
```

## Algebraic Form

The relevant Lean definitions give:

```text
continuedCentralOddChannel s =
  centralFromOddChannel continuedOddDirichletChannel s
```

and the existing audit route already proves the factorization:

```text
anchor s =
  verticalDepthTailFromTwo s *
    (1 - 2 * continuedOddDirichletChannel s)
```

So the scanner measures both `|anchor|` and the diagnostic product:

```text
|tau| * |1 - 2 * continuedOddDirichletChannel|
```

## Anchor Growth

{report_anchor_table(box_rows)}

## Ledger With Box Anchor Uppers

`anchor direct` is sampled `sup |anchor|` on the box.  `anchor factored` is
`sup |tau| * sup |1 - 2 odd|` on the same box.

{report_ledger_table(box_rows)}

## Subbox Probe

The subbox probe checks whether interval boxes could localize the large anchor.
It does not produce a certificate.

{report_subbox_table(subbox_rows)}

## Reading

The positive pocket is small because both the factor and the anchor remain
small.  The failure boxes are not primarily a `cutVec` problem: the sampled
box upper for `anchor` is already comparable to or larger than the available
quartet margin scale.

In the early failure box the anchor is also strongly aligned against `-K4`,
so a pure triangle upper is especially expensive.  In the late failure box the
sector margin improves the quartet side, but the anchor upper is too large for
the current q-ratio resolvent ledger.

The most plausible next formal work is:

```text
1. Prove the anchor factorization in the new audit file as a local lemma.
2. Create abstract AnchorUpperData over regions/boxes.
3. Try interval bounds for |1 - 2 * continuedOddDirichletChannel|.
4. If interval boxes stay too large, look for a structural cancellation
   criterion for anchor + cutVec or for the seed-resolvent factor.
```
"""
    path.write_text(text, encoding="utf-8")


def parse_args(argv: list[str]) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Scan C2 anchor anatomy by box.")
    parser.add_argument("--dps", type=int, default=90)
    parser.add_argument("--boxes", default=DEFAULT_BOXES)
    parser.add_argument("--sigma-steps", type=int, default=5)
    parser.add_argument("--t-steps", type=int, default=5)
    parser.add_argument("--sector-sigma-steps", type=int, default=31)
    parser.add_argument("--sector-t-steps", type=int, default=151)
    parser.add_argument("--sector-guard", default="0.002")
    parser.add_argument("--subbox-divisions", type=int, default=2)
    parser.add_argument("--N-values", default="50")
    parser.add_argument("--K-values", default="3,4,5")
    parser.add_argument("--M-values", default="25,50,100")
    parser.add_argument("--points-csv", default="audit_anchor_anatomy_points.csv")
    parser.add_argument("--boxes-csv", default="audit_anchor_anatomy_boxes.csv")
    parser.add_argument("--subboxes-csv", default="audit_anchor_anatomy_subboxes.csv")
    parser.add_argument("--json", default="audit_anchor_anatomy_summary.json")
    parser.add_argument("--report", default="AUDIT_ANCHOR_ANATOMY_REPORT.md")
    return parser.parse_args(argv)


def main(argv: list[str]) -> int:
    args = parse_args(argv)
    mp.mp.dps = args.dps
    point_rows, box_rows, subbox_rows, summary = build_outputs(
        boxes=parse_boxes(args.boxes),
        N_values=parse_csv_int(args.N_values),
        K_values=parse_csv_int(args.K_values),
        M_values=parse_csv_int(args.M_values),
        sigma_steps=args.sigma_steps,
        t_steps=args.t_steps,
        sector_sigma_steps=args.sector_sigma_steps,
        sector_t_steps=args.sector_t_steps,
        sector_guard=mp.mpf(args.sector_guard),
        subbox_divisions=args.subbox_divisions,
    )
    write_csv(Path(args.points_csv), point_rows)
    write_csv(Path(args.boxes_csv), box_rows)
    write_csv(Path(args.subboxes_csv), subbox_rows)
    Path(args.json).write_text(json.dumps(summary, indent=2), encoding="utf-8")
    write_report(Path(args.report), box_rows, subbox_rows)

    print("Anchor anatomy scanner")
    print("mode: diagnostic numerical laboratory; not proof evidence")
    print(f"channel_mode: {CHANNEL_MODE}")
    print(f"points: {len(point_rows)}")
    print(f"box rows: {len(box_rows)}")
    for row in box_rows:
        print(
            f"{row.box_id} N={row.N} K={row.K} M={row.M}: "
            f"anchor_max={row.anchor_max}, factor_max={row.factor_max}, "
            f"q-ledger/Qsector={row.ledger_direct_pass_Qsector}/{row.point_count}, "
            f"direct/Qsector={row.direct_balanced_pass_Qsector}/{row.point_count}, "
            f"read={row.formalization_read}"
        )
    print(f"wrote {args.points_csv}")
    print(f"wrote {args.boxes_csv}")
    print(f"wrote {args.subboxes_csv}")
    print(f"wrote {args.json}")
    print(f"wrote {args.report}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
