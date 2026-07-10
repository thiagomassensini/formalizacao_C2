#!/usr/bin/env python3
"""Numerical laboratory for C2 continued-quartet horizontal profiles.

This script is diagnostic only.  It compares the old constant-cutoff/unit-half
horizontal profile with a q-ratio profile and simple variable-core schedules.

The active Lean middle route is genuine-first.  The numerical channel values
below may use mpmath's zeta for analytic continuation diagnostics; those values
are not proof inputs and must not be used as Lean middle certificates.
"""

from __future__ import annotations

import argparse
import csv
import json
import math
import sys
from dataclasses import asdict, dataclass
from pathlib import Path
from typing import Callable, Iterable

try:
    import mpmath as mp
except ImportError as exc:  # pragma: no cover - audit environment check
    raise SystemExit("mpmath is required for this audit script") from exc


DEFAULT_DPS = 70
DEFAULT_SIGMAS = "0.15,0.25,0.35,0.45,0.55,0.65,0.75,0.85"
DEFAULT_TS = "5,15,30,60"
DEFAULT_N_VALUES = "9,15,25"
DEFAULT_K_VALUES = "6,10"
DEFAULT_M_VALUES = "9,15,25"
CHANNEL_MODE = "zeta_diagnostic"

ODD_CHANNEL_CACHE: dict[tuple[str, str, int], mp.mpc] = {}
ODD_CORE_STATE: dict[
    tuple[str, str, int], dict[str, object]
] = {}


@dataclass
class SampleResult:
    profile: str
    schedule: str
    sigma: str
    t: str
    N: int
    K: int
    M: int
    q_abs: str
    Q: str
    U: str
    slack: str
    U_over_Q: str
    V_exact: str
    H_up: str
    Cut_exact: str
    horizontal_share: str
    vertical_share: str
    cutoff_share: str
    dominant_u_component: str
    actual_residual_norm: str
    vertical_residual_norm: str
    horizontal_actual_norm: str
    quartet_norm: str
    cos_residual_against_minus_quartet: str
    cos_horizontal_against_minus_quartet: str
    channel_mode: str
    variable_tail_terms: int
    variable_tail_bound: str
    status: str


def parse_csv_mpf(raw: str) -> list[mp.mpf]:
    return [mp.mpf(part.strip()) for part in raw.split(",") if part.strip()]


def parse_csv_int(raw: str) -> list[int]:
    return [int(part.strip()) for part in raw.split(",") if part.strip()]


def fmt(value: mp.mpf | mp.mpc, digits: int = 24) -> str:
    if isinstance(value, mp.mpc):
        return f"({mp.nstr(mp.re(value), digits)} {mp.nstr(mp.im(value), digits)}j)"
    if mp.isinf(value):
        return "inf"
    if mp.isnan(value):
        return "nan"
    return mp.nstr(value, digits)


def point_key(s: mp.mpc) -> tuple[str, str, int]:
    return (mp.nstr(mp.re(s), 80), mp.nstr(mp.im(s), 80), mp.mp.dps)


def coeff(s: mp.mpc, n: int) -> mp.mpc:
    if n <= 0:
        raise ValueError("complexDirichletCoeff is only used for positive n")
    return mp.exp(-s * mp.log(n))


def q_value(s: mp.mpc) -> mp.mpc:
    return mp.mpf("0.5") * coeff(s, 2)


def vertical_depth_tail_from_two(s: mp.mpc) -> mp.mpc:
    q = q_value(s)
    return q**2 / (1 - q)


def vertical_quartet_prefix(q: mp.mpc) -> mp.mpc:
    return 1 + q + q**2 + q**3


def quartet_vector(s: mp.mpc) -> mp.mpc:
    q = q_value(s)
    return q**2 * vertical_quartet_prefix(q)


def quartet_residual_margin(s: mp.mpc) -> mp.mpf:
    q_abs = abs(q_value(s))
    return q_abs**2 * ((1 - q_abs) * (1 + q_abs**2)) - q_abs**6 / (1 - q_abs)


def odd_dirichlet_channel_diagnostic(s: mp.mpc) -> mp.mpc:
    # Diagnostic analytic continuation of the odd channel.  This is not a
    # genuine-first proof input.
    key = point_key(s)
    cached = ODD_CHANNEL_CACHE.get(key)
    if cached is None:
        cached = (1 - coeff(s, 2)) * mp.zeta(s)
        ODD_CHANNEL_CACHE[key] = cached
    return cached


def rectangular_odd_core_sum(s: mp.mpc, cutoff: int) -> mp.mpc:
    if cutoff < 1:
        return mp.mpc(0)
    key = point_key(s)
    state = ODD_CORE_STATE.setdefault(
        key, {"max_odd": -1, "sum": mp.mpc(0), "values": {0: mp.mpc(0)}}
    )
    target = cutoff if cutoff % 2 == 1 else cutoff - 1
    if target < 1:
        return mp.mpc(0)
    values = state["values"]
    assert isinstance(values, dict)
    if target in values:
        return values[target]
    max_odd = int(state["max_odd"])
    total = state["sum"]
    assert isinstance(total, mp.mpc)
    start = max(1, max_odd + 2)
    if start % 2 == 0:
        start += 1
    for m in range(start, target + 1, 2):
        total += coeff(s, m)
        values[m] = total
    state["max_odd"] = max(max_odd, target)
    state["sum"] = total
    return total


def rectangular_depth_factor(s: mp.mpc, K: int) -> mp.mpc:
    q = q_value(s)
    if K < 2:
        return mp.mpc(0)
    return mp.fsum(q**k for k in range(2, K + 1))


def rectangular_genuine(s: mp.mpc, K: int, M: int) -> mp.mpc:
    return 2 * rectangular_depth_factor(s, K) * rectangular_odd_core_sum(s, M)


def continued_central_odd_channel(s: mp.mpc) -> mp.mpc:
    return 2 * vertical_depth_tail_from_two(s) * odd_dirichlet_channel_diagnostic(s)


def odd_truncation_error(s: mp.mpc, cutoff: int) -> mp.mpc:
    return rectangular_odd_core_sum(s, cutoff) - odd_dirichlet_channel_diagnostic(s)


def odd_truncation_norm(s: mp.mpc, cutoff: int) -> mp.mpf:
    return abs(odd_truncation_error(s, cutoff))


def v_exact(s: mp.mpc, K: int, M: int) -> tuple[mp.mpf, mp.mpc]:
    residual = (
        vertical_depth_tail_from_two(s)
        + rectangular_genuine(s, K, M)
        - 2 * continued_central_odd_channel(s)
    )
    return abs(residual), residual


def cut_exact(s: mp.mpc, K: int, M: int) -> tuple[mp.mpf, mp.mpc]:
    cutoff = rectangular_genuine(s, K, M) - continued_central_odd_channel(s)
    return abs(cutoff), cutoff


def h_up_half(s: mp.mpc, N: int) -> tuple[mp.mpf, mp.mpc, mp.mpf]:
    q = q_value(s)
    q_abs = abs(q)
    denom = 1 - 2 * q_abs
    odd_err = odd_truncation_error(s, N)
    odd_norm = abs(odd_err)
    if denom <= 0:
        return mp.inf, 2 * q**2 * odd_err / (1 - q), mp.inf
    upper = 4 * q_abs**2 * odd_norm / denom
    actual = 2 * q**2 * odd_err / (1 - q)
    return upper, actual, mp.mpf("0")


def h_up_qratio(s: mp.mpc, N: int) -> tuple[mp.mpf, mp.mpc, mp.mpf]:
    q = q_value(s)
    q_abs = abs(q)
    denom = 1 - q_abs
    odd_err = odd_truncation_error(s, N)
    odd_norm = abs(odd_err)
    upper = 2 * q_abs**2 * odd_norm / denom
    actual = 2 * q**2 * odd_err / (1 - q)
    return upper, actual, mp.mpf("0")


def schedule_value(kind: str, j: int, N0: int, a: int, lam: mp.mpf, n_min: int) -> int:
    if kind == "linear":
        value = N0 + a * j
    elif kind == "quadratic":
        value = N0 + a * j * j
    elif kind == "geometric":
        value = int(mp.floor(mp.mpf(N0) * (lam**j)))
    elif kind == "affine_max":
        value = max(n_min, int(mp.floor(mp.mpf(N0 + a * j))))
    else:
        raise ValueError(f"unknown variable schedule: {kind}")
    return max(1, value)


def h_up_variable(
    s: mp.mpc,
    schedule: str,
    N0: int,
    a: int,
    lam: mp.mpf,
    n_min: int,
    terms: int,
    max_core_cutoff: int,
) -> tuple[mp.mpf, mp.mpc, mp.mpf]:
    q = q_value(s)
    q_abs = abs(q)
    prefix_upper = mp.mpf("0")
    prefix_actual = mp.mpc(0)
    last_norm = mp.mpf("0")
    for j in range(terms):
        Nj = schedule_value(schedule, j, N0, a, lam, n_min)
        Nj = min(Nj, max_core_cutoff)
        err = odd_truncation_error(s, Nj)
        last_norm = abs(err)
        prefix_upper += 2 * q_abs ** (j + 2) * last_norm
        prefix_actual += 2 * q ** (j + 2) * err
    tail = 2 * q_abs ** (terms + 2) * last_norm / (1 - q_abs)
    return prefix_upper + tail, prefix_actual, tail


def residual_upper(V: mp.mpf, H: mp.mpf, Cut: mp.mpf, q_abs: mp.mpf) -> mp.mpf:
    return (V + H) * (1 + q_abs) / (1 - q_abs) + H + Cut


def cosine_against_minus_quartet(z: mp.mpc, quartet: mp.mpc) -> mp.mpf:
    if abs(z) == 0 or abs(quartet) == 0:
        return mp.nan
    target = -quartet
    return mp.re(z * mp.conj(target)) / (abs(z) * abs(target))


def classify_failure(Q: mp.mpf, U: mp.mpf, V: mp.mpf, H: mp.mpf, Cut: mp.mpf) -> str:
    if U < Q:
        return "passes_grid_point"
    if Q <= 0:
        return "margin_Q_nonpositive"
    components = {"horizontal": H, "V_exact": V, "cutoff": Cut}
    return max(components.items(), key=lambda item: item[1])[0]


def component_shares(U: mp.mpf, V: mp.mpf, H: mp.mpf, Cut: mp.mpf) -> tuple[mp.mpf, mp.mpf, mp.mpf]:
    if U == 0 or mp.isinf(U) or mp.isnan(U):
        return mp.nan, mp.nan, mp.nan
    return V / U, H / U, Cut / U


def evaluate_point(
    profile: str,
    schedule: str,
    sigma: mp.mpf,
    t: mp.mpf,
    N: int,
    K: int,
    M: int,
    args: argparse.Namespace,
) -> SampleResult:
    s = mp.mpc(sigma, t)
    q = q_value(s)
    q_abs = abs(q)
    Q = quartet_residual_margin(s)
    V, vertical_residual = v_exact(s, K, M)
    Cut, cutoff_residual = cut_exact(s, K, M)

    if profile == "half":
        H, horizontal_actual, tail_bound = h_up_half(s, N)
    elif profile == "qratio":
        H, horizontal_actual, tail_bound = h_up_qratio(s, N)
    elif profile == "variable":
        H, horizontal_actual, tail_bound = h_up_variable(
            s,
            schedule,
            args.N0 if args.N0 is not None else N,
            args.a,
            mp.mpf(args.lam),
            args.n_min,
            args.variable_terms,
            args.max_core_cutoff,
        )
    else:
        raise ValueError(f"unknown profile: {profile}")

    U = residual_upper(V, H, Cut, q_abs)
    slack = Q - U
    U_over_Q = U / Q if Q != 0 else mp.inf
    v_share, h_share, c_share = component_shares(U, V, H, Cut)
    quartet = quartet_vector(s)
    actual_residual = vertical_residual + horizontal_actual + cutoff_residual
    dominant = classify_failure(Q, U, V, H, Cut)
    status = "pass" if slack > 0 else "fail"

    return SampleResult(
        profile=profile,
        schedule=schedule if profile == "variable" else "constant",
        sigma=fmt(sigma),
        t=fmt(t),
        N=N,
        K=K,
        M=M,
        q_abs=fmt(q_abs),
        Q=fmt(Q),
        U=fmt(U),
        slack=fmt(slack),
        U_over_Q=fmt(U_over_Q),
        V_exact=fmt(V),
        H_up=fmt(H),
        Cut_exact=fmt(Cut),
        horizontal_share=fmt(h_share),
        vertical_share=fmt(v_share),
        cutoff_share=fmt(c_share),
        dominant_u_component=dominant,
        actual_residual_norm=fmt(abs(actual_residual)),
        vertical_residual_norm=fmt(abs(vertical_residual)),
        horizontal_actual_norm=fmt(abs(horizontal_actual)),
        quartet_norm=fmt(abs(quartet)),
        cos_residual_against_minus_quartet=fmt(
            cosine_against_minus_quartet(actual_residual, quartet)
        ),
        cos_horizontal_against_minus_quartet=fmt(
            cosine_against_minus_quartet(horizontal_actual, quartet)
        ),
        channel_mode=CHANNEL_MODE,
        variable_tail_terms=args.variable_terms if profile == "variable" else 0,
        variable_tail_bound=fmt(tail_bound),
        status=status,
    )


def iter_profiles(raw: str) -> list[str]:
    if raw == "all":
        return ["half", "qratio", "variable"]
    return [part.strip() for part in raw.split(",") if part.strip()]


def write_csv(path: Path, rows: list[SampleResult]) -> None:
    if not rows:
        return
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=list(asdict(rows[0]).keys()))
        writer.writeheader()
        for row in rows:
            writer.writerow(asdict(row))


def mp_from_row(row: SampleResult, field: str) -> mp.mpf:
    return mp.mpf(getattr(row, field))


def build_summary(rows: list[SampleResult]) -> dict[str, object]:
    by_profile: dict[str, dict[str, object]] = {}
    for profile in sorted({row.profile for row in rows}):
        subset = [row for row in rows if row.profile == profile]
        passes = [row for row in subset if row.status == "pass"]
        best = max(subset, key=lambda row: mp_from_row(row, "slack")) if subset else None
        worst = min(subset, key=lambda row: mp_from_row(row, "slack")) if subset else None
        by_profile[profile] = {
            "count": len(subset),
            "passes": len(passes),
            "best": asdict(best) if best else None,
            "worst": asdict(worst) if worst else None,
            "dominant_failures": {
                name: sum(1 for row in subset if row.dominant_u_component == name)
                for name in sorted({row.dominant_u_component for row in subset})
            },
        }
    positives = sorted(rows, key=lambda row: mp_from_row(row, "slack"), reverse=True)[:10]
    negatives = sorted(rows, key=lambda row: mp_from_row(row, "slack"))[:10]
    return {
        "disclaimer": (
            "Diagnostic numerical laboratory only; zeta-based channel evaluation "
            "is not proof input for the genuine-first middle route."
        ),
        "channel_mode": CHANNEL_MODE,
        "profiles": by_profile,
        "top_positive_slack": [asdict(row) for row in positives],
        "top_negative_slack": [asdict(row) for row in negatives],
    }


def print_console_summary(rows: list[SampleResult]) -> None:
    summary = build_summary(rows)
    print("horizontal q-ratio scanner")
    print("mode: diagnostic numerical laboratory; not proof evidence")
    print(f"channel_mode: {CHANNEL_MODE}")
    print()
    for profile, data in summary["profiles"].items():
        best = data["best"]
        worst = data["worst"]
        print(
            f"{profile}: count={data['count']} passes={data['passes']} "
            f"best_slack={best['slack'] if best else 'n/a'} "
            f"worst_slack={worst['slack'] if worst else 'n/a'}"
        )
        print(f"  dominant failures: {data['dominant_failures']}")
    print()
    print("top 5 slack values")
    for row in summary["top_positive_slack"][:5]:
        print(
            f"  {row['profile']}/{row['schedule']} "
            f"sigma={row['sigma']} t={row['t']} N={row['N']} K={row['K']} M={row['M']} "
            f"slack={row['slack']} U/Q={row['U_over_Q']} Hshare={row['horizontal_share']}"
        )


def parse_args(argv: list[str]) -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Scan C2 horizontal profiles for the continued quartet audit."
    )
    parser.add_argument("--dps", type=int, default=DEFAULT_DPS)
    parser.add_argument("--sigmas", default=DEFAULT_SIGMAS)
    parser.add_argument("--ts", default=DEFAULT_TS)
    parser.add_argument("--N-values", default=DEFAULT_N_VALUES)
    parser.add_argument("--K-values", default=DEFAULT_K_VALUES)
    parser.add_argument("--M-values", default=DEFAULT_M_VALUES)
    parser.add_argument(
        "--profiles",
        default="all",
        help="Comma list from half,qratio,variable or 'all'.",
    )
    parser.add_argument(
        "--variable-schedules",
        default="linear,quadratic,geometric,affine_max",
        help="Comma list from linear,quadratic,geometric,affine_max.",
    )
    parser.add_argument("--N0", type=int, default=None)
    parser.add_argument("--a", type=int, default=2)
    parser.add_argument("--lam", default="1.35")
    parser.add_argument("--n-min", type=int, default=3)
    parser.add_argument("--variable-terms", type=int, default=40)
    parser.add_argument(
        "--max-core-cutoff",
        type=int,
        default=5000,
        help="Diagnostic cap for variable schedules, especially geometric.",
    )
    parser.add_argument("--csv", default="audit_horizontal_qratio_scanner.csv")
    parser.add_argument("--json", default="audit_horizontal_qratio_scanner.json")
    return parser.parse_args(argv)


def main(argv: list[str]) -> int:
    args = parse_args(argv)
    if args.variable_terms < 1:
        print("--variable-terms must be positive", file=sys.stderr)
        return 2
    if args.max_core_cutoff < 1:
        print("--max-core-cutoff must be positive", file=sys.stderr)
        return 2
    mp.mp.dps = args.dps

    sigmas = parse_csv_mpf(args.sigmas)
    ts = parse_csv_mpf(args.ts)
    n_values = parse_csv_int(args.N_values)
    k_values = parse_csv_int(args.K_values)
    m_values = parse_csv_int(args.M_values)
    profiles = iter_profiles(args.profiles)
    schedules = [part.strip() for part in args.variable_schedules.split(",") if part.strip()]

    rows: list[SampleResult] = []
    for profile in profiles:
        profile_schedules = schedules if profile == "variable" else ["constant"]
        for schedule in profile_schedules:
            for sigma in sigmas:
                for t in ts:
                    for N in n_values:
                        for K in k_values:
                            for M in m_values:
                                rows.append(
                                    evaluate_point(profile, schedule, sigma, t, N, K, M, args)
                                )

    write_csv(Path(args.csv), rows)
    summary = build_summary(rows)
    Path(args.json).write_text(json.dumps(summary, indent=2), encoding="utf-8")
    print_console_summary(rows)
    print()
    print(f"wrote {args.csv}")
    print(f"wrote {args.json}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
