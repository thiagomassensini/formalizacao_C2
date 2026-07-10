#!/usr/bin/env python3
"""
Finite C2 genuine middle-ledger evaluator.

This script mirrors the active Lean middle bookkeeping as a numerical lab:

  Lean operator:
    c2OddTailContinuedBalancingSeedBulkModel

  Lean local target:
    C2CanonicalClosedScaledLocalData

  Current book-cash target:
    D(s) + G(s) <= (3 / 4) * Q(s)

where Q is the cleared quartet margin, D is the cleared external debit, and G is
the cleared lower-factor cost.  The central infinite/continued objects are
represented here by C2-native finite rectangular reference sums.  Optional
exponential/super-Gaussian reference modes use the finite C2 regularizations
already present in the Lean development; no external analytic proxy is used.
"""

from __future__ import annotations

import argparse
import cmath
import csv
import math
from dataclasses import asdict, dataclass
from pathlib import Path


@dataclass(frozen=True)
class LedgerPoint:
    t: float
    sigma: float
    r: float
    residual_margin: float
    cleared_margin: float
    external_ratio: float
    lower_factor_ratio: float
    total_ratio: float
    quarter_surplus_ratio: float
    defect_anchor_ratio: float
    defect_anchor_surplus_ratio: float
    genuine_ratio: float
    continued_ratio: float
    horizontal_pressure_ratio: float
    cutoff_pressure_ratio: float
    canonical_closed_ratio: float
    anchor_allowance: float
    defect_upper: float
    continued_anchor_abs: float
    defect_allowance: float
    factorization_error: float
    direct_abs: float
    bracket_abs: float
    rectangular_abs: float
    central_ref_abs: float
    cutoff_budget: float
    horizontal_upper: float
    lower_factor_upper: float
    tail_gap_budget: float
    central_ref_delta: float | None


def c2_coeff(s: complex, n: int) -> complex:
    return cmath.exp(-s * math.log(float(n)))


def q_ratio(s: complex) -> complex:
    return 0.5 * c2_coeff(s, 2)


def dyadic_weight(k: int) -> float:
    return 2.0 ** (-k)


def odd_cores_up_to(m_max: int) -> range:
    if m_max < 1:
        return range(1, 0, 2)
    return range(1, int(m_max) + 1, 2)


def depth_factor(s: complex, k_max: int) -> complex:
    q = q_ratio(s)
    return sum(q ** k for k in range(2, int(k_max) + 1))


def odd_core_sum(s: complex, m_max: int) -> complex:
    return sum(c2_coeff(s, m) for m in odd_cores_up_to(m_max))


def rectangular_genuine_factorized(s: complex, k_max: int, m_max: int) -> complex:
    return 2.0 * depth_factor(s, k_max) * odd_core_sum(s, m_max)


def direct_pair_term(s: complex, k: int, m: int) -> complex:
    center = (1 << k) * m
    w = dyadic_weight(k)
    return w * (c2_coeff(s, center - 1) + c2_coeff(s, center + 1))


def bracket_term(s: complex, k: int, m: int) -> complex:
    center = (1 << k) * m
    w = dyadic_weight(k)
    return w * (
        c2_coeff(s, center - 1)
        + c2_coeff(s, center + 1)
        - 2.0 * c2_coeff(s, center)
    )


def rectangular_direct(s: complex, k_max: int, m_max: int) -> complex:
    return sum(
        direct_pair_term(s, k, m)
        for k in range(2, int(k_max) + 1)
        for m in odd_cores_up_to(m_max)
    )


def rectangular_bracket(s: complex, k_max: int, m_max: int) -> complex:
    return sum(
        bracket_term(s, k, m)
        for k in range(2, int(k_max) + 1)
        for m in odd_cores_up_to(m_max)
    )


def vertical_depth_tail(s: complex) -> complex:
    q = q_ratio(s)
    return q * q / (1.0 - q)


def vertical_depth_tail_upper(r: float) -> float:
    return (r * r) / (1.0 - r)


def vertical_depth_tail_lower(r: float) -> float:
    return (r * r) / (1.0 + r)


def residual_margin(r: float) -> float:
    quartet_k2_margin = (r * r) * ((1.0 - r) * (1.0 + r * r))
    quartet_tail_upper = (r**6) / (1.0 - r)
    return quartet_k2_margin - quartet_tail_upper


def horizontal_ratio_value(mode: str, ratio: float, r: float) -> float:
    if mode == "qnorm":
        return r
    return ratio


def horizontal_regularized_upper(
    constant: float, scale: float, ratio_value: float
) -> float:
    return (constant / scale) / (1.0 - ratio_value)


def regularized_center_weight(mode: str, x_scale: float, p: int, n: int) -> float:
    if mode == "raw":
        return 1.0
    if x_scale <= 0.0:
        raise ValueError("reference-X must be positive for regularized references")
    if mode == "exponential":
        return math.exp(-(float(n) / x_scale))
    if mode == "supergaussian":
        if p < 1:
            raise ValueError("reference-p must be at least 1")
        return math.exp(-((float(n) / x_scale) ** p))
    raise ValueError(f"unknown reference mode: {mode}")


def finite_central_reference(
    s: complex,
    k_ref: int,
    m_ref: int,
    mode: str,
    x_scale: float,
    p: int,
) -> complex:
    if mode == "raw":
        return rectangular_genuine_factorized(s, k_ref, m_ref)

    q = q_ratio(s)
    total = 0.0 + 0.0j
    for k in range(2, int(k_ref) + 1):
        qk = q**k
        depth = 1 << k
        for m in odd_cores_up_to(m_ref):
            center = depth * m
            total += (
                2.0
                * qk
                * c2_coeff(s, m)
                * regularized_center_weight(mode, x_scale, p, center)
            )
    return total


def evaluate_point(args: argparse.Namespace, t: float) -> LedgerPoint:
    s = complex(args.sigma, t)
    q = q_ratio(s)
    r = abs(q)
    if not (0.0 < r < 1.0):
        raise ValueError(f"|q| must be in (0, 1), got {r}")

    ratio_value = horizontal_ratio_value(args.horizontal_ratio_mode, args.horizontal_ratio, r)
    if not (0.0 <= ratio_value < 1.0):
        raise ValueError(f"horizontal ratio must be in [0, 1), got {ratio_value}")
    if args.horizontal_scale <= 0.0:
        raise ValueError("horizontal scale must be positive")
    if args.horizontal_constant < 0.0:
        raise ValueError("horizontal constant must be nonnegative")

    direct = rectangular_direct(s, args.K, args.M)
    bracket = rectangular_bracket(s, args.K, args.M)
    rectangular_from_db = direct - bracket
    raw_rectangular = rectangular_genuine_factorized(s, args.K, args.M)
    factorization_error = abs(rectangular_from_db - raw_rectangular)
    if args.target_reference_mode == "raw":
        target_central = raw_rectangular
    else:
        target_x = (
            args.target_reference_X
            if args.target_reference_X is not None
            else args.reference_X
        )
        target_p = (
            args.target_reference_p
            if args.target_reference_p is not None
            else args.reference_p
        )
        target_central = finite_central_reference(
            s,
            args.K,
            args.M,
            args.target_reference_mode,
            target_x,
            target_p,
        )

    genuine_ref = finite_central_reference(
        s,
        args.ref_K,
        args.ref_M,
        args.reference_mode,
        args.reference_X,
        args.reference_p,
    )
    continued_ref = finite_central_reference(
        s,
        args.continued_ref_K,
        args.continued_ref_M,
        args.reference_mode,
        args.reference_X,
        args.reference_p,
    )
    central_ref_delta = None
    if args.check_ref_K is not None and args.check_ref_M is not None:
        check_ref = finite_central_reference(
            s,
            args.check_ref_K,
            args.check_ref_M,
            args.reference_mode,
            args.reference_X,
            args.reference_p,
        )
        central_ref_delta = abs(check_ref - genuine_ref)

    margin = residual_margin(r)
    cleared_margin = margin * ((1.0 - r) ** 2)
    if cleared_margin <= 0.0:
        inf = float("inf")
        return LedgerPoint(
            t=t,
            sigma=args.sigma,
            r=r,
            residual_margin=margin,
            cleared_margin=cleared_margin,
            external_ratio=inf,
            lower_factor_ratio=inf,
            total_ratio=inf,
            quarter_surplus_ratio=-inf,
            defect_anchor_ratio=inf,
            defect_anchor_surplus_ratio=-inf,
            genuine_ratio=inf,
            continued_ratio=inf,
            horizontal_pressure_ratio=inf,
            cutoff_pressure_ratio=inf,
            canonical_closed_ratio=inf,
            anchor_allowance=-inf,
            defect_upper=inf,
            continued_anchor_abs=inf,
            defect_allowance=-inf,
            factorization_error=factorization_error,
            direct_abs=abs(direct),
            bracket_abs=abs(bracket),
            rectangular_abs=abs(target_central),
            central_ref_abs=abs(genuine_ref),
            cutoff_budget=inf,
            horizontal_upper=inf,
            lower_factor_upper=inf,
            tail_gap_budget=inf,
            central_ref_delta=central_ref_delta,
        )

    cutoff_budget = abs(target_central - genuine_ref)
    horizontal_upper = horizontal_regularized_upper(
        args.horizontal_constant, args.horizontal_scale, ratio_value
    )
    exact_vertical_residual_allowance = (
        (margin - horizontal_upper - cutoff_budget) * ((1.0 - r) / (1.0 + r))
        - horizontal_upper
    )
    anchor_allowance = exact_vertical_residual_allowance - cutoff_budget

    genuine_budget = abs(genuine_ref)
    continued_budget = abs(continued_ref)
    external_component_upper = (
        (1.0 + r) * (genuine_budget + continued_budget)
        + 2.0 * (horizontal_upper + cutoff_budget)
    )
    cleared_external_debit = external_component_upper * (1.0 - r)

    tail = vertical_depth_tail(s)
    tail_lower = vertical_depth_tail_lower(r)
    defect_upper = abs(genuine_ref - continued_ref)
    continued_anchor_abs = abs(tail - continued_ref)
    defect_allowance = anchor_allowance - defect_upper
    if anchor_allowance > 0.0:
        defect_anchor_ratio = (continued_anchor_abs + defect_upper) / anchor_allowance
        defect_anchor_surplus_ratio = 1.0 - defect_anchor_ratio
    else:
        defect_anchor_ratio = float("inf")
        defect_anchor_surplus_ratio = float("-inf")
    lower_factor_upper = abs(tail - continued_ref) / tail_lower
    lower_factor_cost = ((1.0 + r) * (r * r)) * lower_factor_upper

    external_ratio = cleared_external_debit / cleared_margin
    lower_factor_ratio = lower_factor_cost / cleared_margin
    total_ratio = external_ratio + lower_factor_ratio
    quarter_surplus_ratio = 0.75 - total_ratio

    genuine_ratio = ((1.0 - r) * (1.0 + r) * genuine_budget) / cleared_margin
    continued_ratio = ((1.0 - r) * (1.0 + r) * continued_budget) / cleared_margin
    horizontal_pressure_ratio = ((1.0 - r) * 2.0 * horizontal_upper) / cleared_margin
    cutoff_pressure_ratio = ((1.0 - r) * 2.0 * cutoff_budget) / cleared_margin

    vertical_closed_upper = (
        vertical_depth_tail_upper(r)
        + abs(direct)
        + abs(bracket)
        + 2.0 * continued_budget
    )
    canonical_closed_upper = (
        (vertical_closed_upper + horizontal_upper) * ((1.0 + r) / (1.0 - r))
        + horizontal_upper
        + cutoff_budget
    )
    canonical_closed_ratio = canonical_closed_upper / margin if margin > 0.0 else float("inf")

    odd_ref = continued_ref / (2.0 * tail) if tail != 0.0 else complex("nan")
    tail_gap_budget = vertical_depth_tail_upper(r) * abs(1.0 - 2.0 * odd_ref)

    return LedgerPoint(
        t=t,
        sigma=args.sigma,
        r=r,
        residual_margin=margin,
        cleared_margin=cleared_margin,
        external_ratio=external_ratio,
        lower_factor_ratio=lower_factor_ratio,
        total_ratio=total_ratio,
        quarter_surplus_ratio=quarter_surplus_ratio,
        defect_anchor_ratio=defect_anchor_ratio,
        defect_anchor_surplus_ratio=defect_anchor_surplus_ratio,
        genuine_ratio=genuine_ratio,
        continued_ratio=continued_ratio,
        horizontal_pressure_ratio=horizontal_pressure_ratio,
        cutoff_pressure_ratio=cutoff_pressure_ratio,
        canonical_closed_ratio=canonical_closed_ratio,
        anchor_allowance=anchor_allowance,
        defect_upper=defect_upper,
        continued_anchor_abs=continued_anchor_abs,
        defect_allowance=defect_allowance,
        factorization_error=factorization_error,
        direct_abs=abs(direct),
        bracket_abs=abs(bracket),
        rectangular_abs=abs(target_central),
        central_ref_abs=genuine_budget,
        cutoff_budget=cutoff_budget,
        horizontal_upper=horizontal_upper,
        lower_factor_upper=lower_factor_upper,
        tail_gap_budget=tail_gap_budget,
        central_ref_delta=central_ref_delta,
    )


def float_range(start: float, stop: float, step: float) -> list[float]:
    if step <= 0.0:
        raise ValueError("dt must be positive")
    n = int(math.floor((stop - start) / step + 0.5))
    return [start + i * step for i in range(n + 1)]


def fmt(x: float | None) -> str:
    if x is None:
        return "n/a"
    if math.isinf(x):
        return "inf" if x > 0 else "-inf"
    if math.isnan(x):
        return "nan"
    return f"{x:.6e}"


def write_csv(path: Path, rows: list[LedgerPoint]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=list(asdict(rows[0]).keys()))
        writer.writeheader()
        for row in rows:
            writer.writerow(asdict(row))


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        description="Finite C2 genuine evaluator for the active middle ledger."
    )
    parser.add_argument("--sigma", type=float, default=0.5)
    parser.add_argument("--t", type=float, default=None, help="Evaluate a single height.")
    parser.add_argument("--t-min", type=float, default=1.0)
    parser.add_argument("--t-max", type=float, default=50.0)
    parser.add_argument("--dt", type=float, default=0.25)
    parser.add_argument("--K", type=int, default=5, help="Lean rectangle depth cutoff.")
    parser.add_argument("--M", type=int, default=3, help="Lean rectangle odd-core cutoff.")
    parser.add_argument("--ref-K", type=int, default=40)
    parser.add_argument("--ref-M", type=int, default=401)
    parser.add_argument("--continued-ref-K", type=int, default=40)
    parser.add_argument("--continued-ref-M", type=int, default=401)
    parser.add_argument("--check-ref-K", type=int, default=None)
    parser.add_argument("--check-ref-M", type=int, default=None)
    parser.add_argument(
        "--reference-mode",
        choices=["raw", "exponential", "supergaussian"],
        default="raw",
        help="Finite C2 reference used for central channels.",
    )
    parser.add_argument(
        "--target-reference-mode",
        choices=["raw", "exponential", "supergaussian"],
        default="raw",
        help="Finite C2 target used in the cutoff debit; defaults to Lean's raw rectangle.",
    )
    parser.add_argument("--reference-X", type=float, default=10661.0)
    parser.add_argument("--reference-p", type=int, default=2)
    parser.add_argument("--target-reference-X", type=float, default=None)
    parser.add_argument("--target-reference-p", type=int, default=None)
    parser.add_argument("--horizontal-constant", type=float, default=0.0)
    parser.add_argument("--horizontal-scale", type=float, default=1.0)
    parser.add_argument("--horizontal-ratio", type=float, default=0.0)
    parser.add_argument(
        "--horizontal-ratio-mode",
        choices=["constant", "qnorm"],
        default="constant",
        help="Use a constant ratio or |q(s)| as horizontalRatio.",
    )
    parser.add_argument("--top", type=int, default=8, help="Rows to print from worst total ratio.")
    parser.add_argument("--csv", type=Path, default=None)
    return parser


def main() -> None:
    args = build_parser().parse_args()
    if args.K < 2 or args.ref_K < 2 or args.continued_ref_K < 2:
        raise SystemExit("K, ref-K, and continued-ref-K must be at least 2")
    if args.M < 1 or args.ref_M < 1 or args.continued_ref_M < 1:
        raise SystemExit("M, ref-M, and continued-ref-M must be at least 1")

    if args.t is not None:
        t_values = [args.t]
    else:
        t_values = float_range(args.t_min, args.t_max, args.dt)

    rows = [evaluate_point(args, t) for t in t_values]
    worst = sorted(rows, key=lambda row: row.total_ratio, reverse=True)
    worst_defect_anchor = sorted(rows, key=lambda row: row.defect_anchor_ratio, reverse=True)
    best_surplus = min(rows, key=lambda row: row.quarter_surplus_ratio)
    best_defect_anchor_surplus = min(rows, key=lambda row: row.defect_anchor_surplus_ratio)
    max_factorization_error = max(row.factorization_error for row in rows)
    ref_deltas = [row.central_ref_delta for row in rows if row.central_ref_delta is not None]
    max_ref_delta = max(ref_deltas) if ref_deltas else None
    min_margin = min(rows, key=lambda row: row.cleared_margin)

    print("C2 genuine finite middle ledger")
    print("================================")
    print(
        "Lean anchors: rectangularGenuine, c2ExactGapAnchorCanonicalClearedMargin, "
        "c2ExactGapAnchorCanonicalClearedExternalDebit, "
        "c2ExactGapAnchorCanonicalClearedLowerFactorCost"
    )
    print(
        f"Region sample: sigma={args.sigma}, "
        f"t={'single ' + str(args.t) if args.t is not None else f'[{args.t_min}, {args.t_max}] dt={args.dt}'}"
    )
    print(
        f"Rectangle: K={args.K}, M={args.M}; "
        f"central ref=({args.ref_K}, {args.ref_M}); "
        f"continued ref=({args.continued_ref_K}, {args.continued_ref_M}); "
        f"reference_mode={args.reference_mode}; "
        f"target_reference_mode={args.target_reference_mode}"
    )
    if args.reference_mode != "raw":
        print(f"Reference regularization: X={args.reference_X}, p={args.reference_p}")
    if args.target_reference_mode != "raw":
        target_x = args.target_reference_X if args.target_reference_X is not None else args.reference_X
        target_p = args.target_reference_p if args.target_reference_p is not None else args.reference_p
        print(f"Target regularization: X={target_x}, p={target_p}")
    print(
        "Horizontal: "
        f"constant={args.horizontal_constant}, scale={args.horizontal_scale}, "
        f"ratio_mode={args.horizontal_ratio_mode}, ratio={args.horizontal_ratio}"
    )
    print()
    print(
        "Summary: "
        f"points={len(rows)}, "
        f"max_factorization_error={fmt(max_factorization_error)}, "
        f"max_ref_delta={fmt(max_ref_delta)}, "
        f"min_cleared_margin={fmt(min_margin.cleared_margin)} at t={min_margin.t:.6f}, "
        f"worst_total={fmt(worst[0].total_ratio)} at t={worst[0].t:.6f}, "
        f"worst_quarter_surplus={fmt(best_surplus.quarter_surplus_ratio)} "
        f"at t={best_surplus.t:.6f}, "
        f"worst_defect_anchor={fmt(worst_defect_anchor[0].defect_anchor_ratio)} "
        f"at t={worst_defect_anchor[0].t:.6f}, "
        f"worst_defect_anchor_surplus={fmt(best_defect_anchor_surplus.defect_anchor_surplus_ratio)} "
        f"at t={best_defect_anchor_surplus.t:.6f}"
    )
    print()
    print(
        f"{'t':>10} {'total':>12} {'q_surplus':>12} {'external':>12} "
        f"{'lower':>12} {'def_anchor':>12} {'def_surplus':>12} "
        f"{'cutoff':>12} {'horiz':>12} {'closed':>12} {'ref_delta':>12}"
    )
    print("-" * 145)
    for row in worst[: max(1, args.top)]:
        print(
            f"{row.t:10.6f} {fmt(row.total_ratio):>12} "
            f"{fmt(row.quarter_surplus_ratio):>12} {fmt(row.external_ratio):>12} "
            f"{fmt(row.lower_factor_ratio):>12} {fmt(row.defect_anchor_ratio):>12} "
            f"{fmt(row.defect_anchor_surplus_ratio):>12} {fmt(row.cutoff_pressure_ratio):>12} "
            f"{fmt(row.horizontal_pressure_ratio):>12} {fmt(row.canonical_closed_ratio):>12} "
            f"{fmt(row.central_ref_delta):>12}"
        )

    if args.csv is not None:
        write_csv(args.csv, rows)
        print()
        print(f"CSV written: {args.csv}")


if __name__ == "__main__":
    main()
