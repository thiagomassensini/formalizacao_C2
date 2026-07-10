#!/usr/bin/env python3
"""
Projected-j0 interval box certifier for the finite adjusted quartet.

The script reads candidate boxes from the atlas scout, builds rectangular
enclosures for the finite objects, and emits constants consumable by the
external-certificate layer.  The generated data is an auditable computational
certificate candidate, not a Lean proof.
"""

from __future__ import annotations

import argparse
import csv
import json
import math
import sys
import time
from collections import Counter
from dataclasses import asdict, dataclass
from pathlib import Path
from typing import Any

import numpy as np

try:
    import mpmath as mp
except ImportError as exc:  # pragma: no cover
    raise SystemExit("Install mpmath first: pip install mpmath") from exc

from c2_adjusted_quartet_evaluator import LOG2, odd_addresses, regularized_weight, validate_args
from c2_projected_j0_atlas_scout import safe_label, scalar_ratio


EPS = 1.0e-300
TWOPI = 2.0 * math.pi


@dataclass(frozen=True)
class TermData:
    addresses: np.ndarray
    logs: np.ndarray
    coeffs: np.ndarray
    ks: np.ndarray | None = None
    mode: str = "fast"
    x_scale: float = 1.0
    p: int = 2


@dataclass(frozen=True)
class Rect:
    re_lo: float
    re_hi: float
    im_lo: float
    im_hi: float


@dataclass(frozen=True)
class BoxInput:
    source_box_id: str
    sigma_min: float
    sigma_max: float
    t_min: float
    t_max: float
    point_budget_combined_from_scout: float
    point_budget_separate_from_scout: float
    pass_combined_const: bool
    pass_separate_const: bool


@dataclass(frozen=True)
class CertificateRow:
    label: str
    source_box_id: str
    sigma_min: float
    sigma_max: float
    t_min: float
    t_max: float
    mainNormLowerConst: float
    numeratorUpperConst: float
    parallelUpperConst: float
    restUpperCombinedConst: float
    restUpperSeparateConst: float
    budgetCombinedConst: float
    budgetSeparateConst: float
    certified_combined: bool
    certified_separate: bool
    status: str
    main_lower_method: str
    main_center_abs: float
    main_radius: float
    main_lower_rect: float
    main_lower_improved: float
    main_lower_gain: float
    interval_dps: int
    inflate: float
    point_budget_combined_from_scout: float
    point_budget_separate_from_scout: float
    budget_loss_to_interval_combined: float
    budget_loss_to_interval_separate: float
    notes: str


def rect_zero() -> Rect:
    return Rect(0.0, 0.0, 0.0, 0.0)


def rect_real(lo: float, hi: float | None = None) -> Rect:
    if hi is None:
        hi = lo
    return Rect(float(lo), float(hi), 0.0, 0.0)


def inflate_bounds(lo: float, hi: float, inflate: float) -> tuple[float, float]:
    width = max(abs(lo), abs(hi), 1.0)
    pad = width * max(float(inflate), 0.0) + 8.0 * np.finfo(float).eps * width
    return float(np.nextafter(lo - pad, -np.inf)), float(np.nextafter(hi + pad, np.inf))


def add_rect(a: Rect, b: Rect, inflate: float = 0.0) -> Rect:
    re_lo, re_hi = inflate_bounds(a.re_lo + b.re_lo, a.re_hi + b.re_hi, inflate)
    im_lo, im_hi = inflate_bounds(a.im_lo + b.im_lo, a.im_hi + b.im_hi, inflate)
    return Rect(re_lo, re_hi, im_lo, im_hi)


def neg_rect(a: Rect) -> Rect:
    return Rect(-a.re_hi, -a.re_lo, -a.im_hi, -a.im_lo)


def sub_rect(a: Rect, b: Rect, inflate: float = 0.0) -> Rect:
    return add_rect(a, neg_rect(b), inflate)


def interval_mul(a_lo: float, a_hi: float, b_lo: float, b_hi: float) -> tuple[float, float]:
    vals = (a_lo * b_lo, a_lo * b_hi, a_hi * b_lo, a_hi * b_hi)
    return min(vals), max(vals)


def interval_mul_arrays(
    a_lo: np.ndarray,
    a_hi: np.ndarray,
    b_lo: np.ndarray,
    b_hi: np.ndarray,
) -> tuple[np.ndarray, np.ndarray]:
    vals = np.stack((a_lo * b_lo, a_lo * b_hi, a_hi * b_lo, a_hi * b_hi))
    return np.min(vals, axis=0), np.max(vals, axis=0)


def mul_rect(a: Rect, b: Rect, inflate: float = 0.0) -> Rect:
    ac_lo, ac_hi = interval_mul(a.re_lo, a.re_hi, b.re_lo, b.re_hi)
    bd_lo, bd_hi = interval_mul(a.im_lo, a.im_hi, b.im_lo, b.im_hi)
    ad_lo, ad_hi = interval_mul(a.re_lo, a.re_hi, b.im_lo, b.im_hi)
    bc_lo, bc_hi = interval_mul(a.im_lo, a.im_hi, b.re_lo, b.re_hi)
    re_lo, re_hi = inflate_bounds(ac_lo - bd_hi, ac_hi - bd_lo, inflate)
    im_lo, im_hi = inflate_bounds(ad_lo + bc_lo, ad_hi + bc_hi, inflate)
    return Rect(re_lo, re_hi, im_lo, im_hi)


def scale_rect(a: Rect, k: float, inflate: float = 0.0) -> Rect:
    if k >= 0.0:
        re_lo, re_hi = a.re_lo * k, a.re_hi * k
        im_lo, im_hi = a.im_lo * k, a.im_hi * k
    else:
        re_lo, re_hi = a.re_hi * k, a.re_lo * k
        im_lo, im_hi = a.im_hi * k, a.im_lo * k
    re_lo, re_hi = inflate_bounds(re_lo, re_hi, inflate)
    im_lo, im_hi = inflate_bounds(im_lo, im_hi, inflate)
    return Rect(re_lo, re_hi, im_lo, im_hi)


def conj_rect(a: Rect) -> Rect:
    return Rect(a.re_lo, a.re_hi, -a.im_hi, -a.im_lo)


def square_interval(lo: float, hi: float) -> tuple[float, float]:
    vals = [lo * lo, hi * hi]
    if lo <= 0.0 <= hi:
        return 0.0, max(vals)
    return min(vals), max(vals)


def abs_bounds_rect(a: Rect) -> tuple[float, float]:
    re2_lo, re2_hi = square_interval(a.re_lo, a.re_hi)
    im2_lo, im2_hi = square_interval(a.im_lo, a.im_hi)
    lower = math.sqrt(max(0.0, re2_lo + im2_lo))
    upper = math.sqrt(max(0.0, re2_hi + im2_hi))
    return lower, upper


def center_radius_lower(a: Rect) -> tuple[float, float, float]:
    center_re = 0.5 * (a.re_lo + a.re_hi)
    center_im = 0.5 * (a.im_lo + a.im_hi)
    half_re = 0.5 * max(0.0, a.re_hi - a.re_lo)
    half_im = 0.5 * max(0.0, a.im_hi - a.im_lo)
    center_abs = math.hypot(center_re, center_im)
    radius = math.hypot(half_re, half_im)
    return center_abs, radius, max(0.0, center_abs - radius)


def div_real_interval(x_lo: float, x_hi: float, d_lo: float, d_hi: float) -> tuple[float, float]:
    if d_lo <= 0.0 <= d_hi:
        return -math.inf, math.inf
    vals = (x_lo / d_lo, x_lo / d_hi, x_hi / d_lo, x_hi / d_hi)
    return min(vals), max(vals)


def inv_rect(a: Rect, inflate: float = 0.0) -> Rect:
    re2_lo, re2_hi = square_interval(a.re_lo, a.re_hi)
    im2_lo, im2_hi = square_interval(a.im_lo, a.im_hi)
    denom_lo = re2_lo + im2_lo
    denom_hi = re2_hi + im2_hi
    if denom_lo <= 0.0:
        raise ArithmeticError("complex interval reciprocal contains zero")
    re_lo, re_hi = div_real_interval(a.re_lo, a.re_hi, denom_lo, denom_hi)
    im_lo, im_hi = div_real_interval(-a.im_hi, -a.im_lo, denom_lo, denom_hi)
    re_lo, re_hi = inflate_bounds(re_lo, re_hi, inflate)
    im_lo, im_hi = inflate_bounds(im_lo, im_hi, inflate)
    return Rect(re_lo, re_hi, im_lo, im_hi)


def div_rect(a: Rect, b: Rect, inflate: float = 0.0) -> Rect:
    return mul_rect(a, inv_rect(b, inflate), inflate)


def pow_rect(a: Rect, n: int, inflate: float = 0.0) -> Rect:
    if n == 0:
        return rect_real(1.0)
    out = a
    for _ in range(1, n):
        out = mul_rect(out, a, inflate)
    return out


def interval_product_scalar(
    a_lo: float,
    a_hi: float,
    b_lo: np.ndarray,
    b_hi: np.ndarray,
) -> tuple[np.ndarray, np.ndarray]:
    vals = np.stack((a_lo * b_lo, a_lo * b_hi, a_hi * b_lo, a_hi * b_hi))
    return np.min(vals, axis=0), np.max(vals, axis=0)


def contains_periodic_point(
    lo: np.ndarray,
    hi: np.ndarray,
    offset: float,
    period: float = TWOPI,
) -> np.ndarray:
    k_min = np.ceil((lo - offset) / period)
    k_max = np.floor((hi - offset) / period)
    return k_min <= k_max


def trig_bounds(theta_lo: np.ndarray, theta_hi: np.ndarray) -> tuple[np.ndarray, ...]:
    width = theta_hi - theta_lo
    wide = width >= TWOPI

    cos_lo = np.minimum(np.cos(theta_lo), np.cos(theta_hi))
    cos_hi = np.maximum(np.cos(theta_lo), np.cos(theta_hi))
    cos_hi = np.where(contains_periodic_point(theta_lo, theta_hi, 0.0), 1.0, cos_hi)
    cos_lo = np.where(contains_periodic_point(theta_lo, theta_hi, math.pi), -1.0, cos_lo)
    cos_lo = np.where(wide, -1.0, cos_lo)
    cos_hi = np.where(wide, 1.0, cos_hi)

    sin_lo = np.minimum(np.sin(theta_lo), np.sin(theta_hi))
    sin_hi = np.maximum(np.sin(theta_lo), np.sin(theta_hi))
    sin_hi = np.where(contains_periodic_point(theta_lo, theta_hi, math.pi / 2.0), 1.0, sin_hi)
    sin_lo = np.where(contains_periodic_point(theta_lo, theta_hi, 3.0 * math.pi / 2.0), -1.0, sin_lo)
    sin_lo = np.where(wide, -1.0, sin_lo)
    sin_hi = np.where(wide, 1.0, sin_hi)
    return cos_lo, cos_hi, sin_lo, sin_hi


def sum_with_padding(lo_values: np.ndarray, hi_values: np.ndarray, inflate: float) -> tuple[float, float]:
    lo = float(np.sum(lo_values, dtype=np.float64))
    hi = float(np.sum(hi_values, dtype=np.float64))
    magnitude = float(np.sum(np.maximum(np.abs(lo_values), np.abs(hi_values)), dtype=np.float64))
    pad = max(float(inflate), 0.0) * magnitude + 64.0 * np.finfo(float).eps * max(magnitude, 1.0)
    return float(np.nextafter(lo - pad, -np.inf)), float(np.nextafter(hi + pad, np.inf))


def term_sum_fast(
    data: TermData,
    sigma_lo: float,
    sigma_hi: float,
    t_lo: float,
    t_hi: float,
    inflate: float,
) -> Rect:
    if data.logs.size == 0:
        return rect_zero()

    log_pad = np.abs(data.logs) * inflate + inflate
    log_lo = np.nextafter(data.logs - log_pad, -np.inf)
    log_hi = np.nextafter(data.logs + log_pad, np.inf)
    coeff_lo = np.maximum(0.0, data.coeffs * (1.0 - inflate))
    coeff_hi = data.coeffs * (1.0 + inflate)

    exp_lo = np.exp(-sigma_hi * log_hi)
    exp_hi = np.exp(-sigma_lo * log_lo)
    amp_lo = coeff_lo * exp_lo
    amp_hi = coeff_hi * exp_hi

    theta_lo, theta_hi = interval_product_scalar(t_lo, t_hi, log_lo, log_hi)
    cos_lo, cos_hi, sin_lo, sin_hi = trig_bounds(theta_lo, theta_hi)

    re_lo_terms, re_hi_terms = interval_mul_arrays(amp_lo, amp_hi, cos_lo, cos_hi)
    im_lo_terms, im_hi_terms = interval_mul_arrays(amp_lo, amp_hi, -sin_hi, -sin_lo)

    re_lo, re_hi = sum_with_padding(re_lo_terms, re_hi_terms, inflate)
    im_lo, im_hi = sum_with_padding(im_lo_terms, im_hi_terms, inflate)
    return Rect(re_lo, re_hi, im_lo, im_hi)


def iv_bounds_to_float(x: mp.iv.mpf) -> tuple[float, float]:
    return float(x.a), float(x.b)


def term_sum_strict(
    data: TermData,
    sigma_lo: float,
    sigma_hi: float,
    t_lo: float,
    t_hi: float,
    dps: int,
    inflate: float,
) -> Rect:
    mp.iv.dps = int(dps)
    sigma_iv = mp.iv.mpf([str(float(sigma_lo)), str(float(sigma_hi))])
    t_iv = mp.iv.mpf([str(float(t_lo)), str(float(t_hi))])
    re = mp.iv.mpf([0, 0])
    im = mp.iv.mpf([0, 0])

    for idx, address in enumerate(data.addresses):
        addr = mp.iv.mpf(str(float(address)))
        log_addr = mp.iv.log(addr)
        coeff = mp.iv.mpf(str(float(data.coeffs[idx])))
        amp = coeff * mp.iv.exp(-sigma_iv * log_addr)
        theta = t_iv * log_addr
        re += amp * mp.iv.cos(theta)
        im += -amp * mp.iv.sin(theta)

    re_lo, re_hi = iv_bounds_to_float(re)
    im_lo, im_hi = iv_bounds_to_float(im)
    re_lo, re_hi = inflate_bounds(re_lo, re_hi, inflate)
    im_lo, im_hi = inflate_bounds(im_lo, im_hi, inflate)
    return Rect(re_lo, re_hi, im_lo, im_hi)


def term_sum_rect(
    data: TermData,
    sigma_lo: float,
    sigma_hi: float,
    t_lo: float,
    t_hi: float,
    mode: str,
    dps: int,
    inflate: float,
) -> Rect:
    if mode == "strict":
        return term_sum_strict(data, sigma_lo, sigma_hi, t_lo, t_hi, dps, inflate)
    if mode == "fast":
        return term_sum_fast(data, sigma_lo, sigma_hi, t_lo, t_hi, inflate)
    raise ValueError(f"unknown interval mode: {mode}")


def q_rect(sigma_lo: float, sigma_hi: float, t_lo: float, t_hi: float, inflate: float) -> Rect:
    data = TermData(
        addresses=np.array([2.0], dtype=np.float64),
        logs=np.array([LOG2], dtype=np.float64),
        coeffs=np.array([0.5], dtype=np.float64),
    )
    return term_sum_fast(data, sigma_lo, sigma_hi, t_lo, t_hi, inflate)


def build_odd_data(m_max: int, mode: str, x_scale: float, p: int) -> TermData:
    odds = odd_addresses(m_max)
    logs = np.log(odds)
    coeffs = regularized_weight(mode, odds, x_scale, p)
    keep = coeffs != 0.0
    return TermData(
        addresses=odds[keep].astype(np.float64),
        logs=logs[keep].astype(np.float64),
        coeffs=coeffs[keep].astype(np.float64),
        mode=mode,
        x_scale=float(x_scale),
        p=int(p),
    )


def build_central_data(k_max: int, m_max: int, mode: str, x_scale: float, p: int) -> TermData:
    addresses_by_k: list[np.ndarray] = []
    coeffs_by_k: list[np.ndarray] = []
    ks_by_k: list[np.ndarray] = []
    odds = odd_addresses(m_max)
    for k in range(2, int(k_max) + 1):
        depth = float(1 << k)
        centers = depth * odds
        coeffs = (2.0 * math.ldexp(1.0, -k)) * regularized_weight(mode, centers, x_scale, p)
        keep = coeffs != 0.0
        if np.any(keep):
            addresses_by_k.append(centers[keep].astype(np.float64))
            coeffs_by_k.append(coeffs[keep].astype(np.float64))
            ks_by_k.append(np.full(int(np.count_nonzero(keep)), k, dtype=np.int64))
    if not addresses_by_k:
        return TermData(
            addresses=np.empty(0, dtype=np.float64),
            logs=np.empty(0, dtype=np.float64),
            coeffs=np.empty(0, dtype=np.float64),
            ks=np.empty(0, dtype=np.int64),
            mode=mode,
            x_scale=float(x_scale),
            p=int(p),
        )
    addresses = np.concatenate(addresses_by_k)
    return TermData(
        addresses=addresses,
        logs=np.log(addresses).astype(np.float64),
        coeffs=np.concatenate(coeffs_by_k),
        ks=np.concatenate(ks_by_k),
        mode=mode,
        x_scale=float(x_scale),
        p=int(p),
    )


@dataclass(frozen=True)
class IntervalContext:
    odd_core: TermData
    odd_ref: TermData
    target: TermData
    central_ref: TermData


def build_interval_context(args: argparse.Namespace) -> IntervalContext:
    odd_ref_m = args.odd_ref_M if args.odd_ref_M is not None else args.ref_M
    odd_ref_x = args.odd_reference_X if args.odd_reference_X is not None else args.reference_X
    odd_ref_p = args.odd_reference_p if args.odd_reference_p is not None else args.reference_p
    target_x = args.target_reference_X if args.target_reference_X is not None else args.reference_X
    target_p = args.target_reference_p if args.target_reference_p is not None else args.reference_p
    return IntervalContext(
        odd_core=build_odd_data(args.M, "raw", args.reference_X, args.reference_p),
        odd_ref=build_odd_data(odd_ref_m, args.odd_reference_mode, odd_ref_x, odd_ref_p),
        target=build_central_data(args.K, args.M, args.target_reference_mode, target_x, target_p),
        central_ref=build_central_data(
            args.ref_K, args.ref_M, args.reference_mode, args.reference_X, args.reference_p
        ),
    )


def eval_subbox(
    ctx: IntervalContext,
    sigma_lo: float,
    sigma_hi: float,
    t_lo: float,
    t_hi: float,
    mode: str,
    dps: int,
    inflate: float,
) -> tuple[Rect, Rect, Rect, Rect, Rect, Rect]:
    odd_core = term_sum_rect(ctx.odd_core, sigma_lo, sigma_hi, t_lo, t_hi, mode, dps, inflate)
    odd_ref = term_sum_rect(ctx.odd_ref, sigma_lo, sigma_hi, t_lo, t_hi, mode, dps, inflate)
    horizontal_delta = sub_rect(odd_core, odd_ref, inflate)

    target_rect = term_sum_rect(ctx.target, sigma_lo, sigma_hi, t_lo, t_hi, mode, dps, inflate)
    central_ref = term_sum_rect(ctx.central_ref, sigma_lo, sigma_hi, t_lo, t_hi, mode, dps, inflate)

    q = q_rect(sigma_lo, sigma_hi, t_lo, t_hi, inflate)
    one_minus_q = sub_rect(rect_real(1.0), q, inflate)
    q2 = pow_rect(q, 2, inflate)
    q3 = mul_rect(q2, q, inflate)
    q4 = mul_rect(q3, q, inflate)
    q5 = mul_rect(q4, q, inflate)
    q6 = mul_rect(q5, q, inflate)

    vertical_depth_tail_from_two = div_rect(q2, one_minus_q, inflate)
    vertical_rectangular_residual = add_rect(
        add_rect(vertical_depth_tail_from_two, target_rect, inflate),
        scale_rect(central_ref, -2.0, inflate),
        inflate,
    )
    q2_over_one_minus_q = div_rect(q2, one_minus_q, inflate)
    horizontal_defect_seed = scale_rect(
        mul_rect(q2_over_one_minus_q, horizontal_delta, inflate),
        2.0,
        inflate,
    )
    seed = mul_rect(
        neg_rect(add_rect(vertical_rectangular_residual, horizontal_defect_seed, inflate)),
        one_minus_q,
        inflate,
    )

    prefix = add_rect(add_rect(rect_real(1.0), q, inflate), add_rect(q2, q3, inflate), inflate)
    main = mul_rect(add_rect(q2, seed, inflate), prefix, inflate)

    d0 = scale_rect(mul_rect(q2, horizontal_delta, inflate), 2.0, inflate)
    d1 = scale_rect(mul_rect(q3, horizontal_delta, inflate), 2.0, inflate)
    d2 = scale_rect(mul_rect(q4, horizontal_delta, inflate), 2.0, inflate)
    d3 = scale_rect(mul_rect(q5, horizontal_delta, inflate), 2.0, inflate)
    drest = add_rect(add_rect(d1, d2, inflate), d3, inflate)
    total_quartet = add_rect(add_rect(main, d0, inflate), drest, inflate)

    vertical_tail = div_rect(q6, one_minus_q, inflate)
    tilt_tail = mul_rect(seed, div_rect(q4, one_minus_q, inflate), inflate)
    horizontal_tail = scale_rect(
        mul_rect(div_rect(q6, one_minus_q, inflate), horizontal_delta, inflate),
        2.0,
        inflate,
    )
    cutoff = sub_rect(target_rect, central_ref, inflate)
    rvec_tail = add_rect(
        add_rect(vertical_tail, tilt_tail, inflate),
        add_rect(horizontal_tail, cutoff, inflate),
        inflate,
    )
    total_finite = add_rect(total_quartet, rvec_tail, inflate)
    return main, d0, drest, rvec_tail, total_quartet, total_finite


def split_range(lo: float, hi: float, parts: int) -> list[tuple[float, float]]:
    if parts <= 1 or lo == hi:
        return [(lo, hi)]
    edges = np.linspace(lo, hi, parts + 1)
    return [(float(edges[i]), float(edges[i + 1])) for i in range(parts)]


def lower_out(value: float) -> float:
    if value <= 0.0 or not math.isfinite(value):
        return 0.0
    return max(0.0, float(np.nextafter(value, -np.inf)))


def upper_out(value: float) -> float:
    if not math.isfinite(value):
        return value
    return float(np.nextafter(max(0.0, value), np.inf))


def certify_box(ctx: IntervalContext, box: BoxInput, args: argparse.Namespace) -> CertificateRow:
    main_lower_rect = math.inf
    main_lower_center_radius = math.inf
    min_main_center_abs = math.inf
    max_main_radius = 0.0
    numerator_upper = 0.0
    rest_combined_upper = 0.0
    rest_separate_upper = 0.0
    notes: list[str] = []

    sigma_parts = split_range(box.sigma_min, box.sigma_max, int(args.subdiv_sigma))
    t_parts = split_range(box.t_min, box.t_max, int(args.subdiv_t))

    try:
        for sigma_lo, sigma_hi in sigma_parts:
            for t_lo, t_hi in t_parts:
                main, d0, drest, rvec_tail, _total_quartet, _total_finite = eval_subbox(
                    ctx,
                    sigma_lo,
                    sigma_hi,
                    t_lo,
                    t_hi,
                    args.mode,
                    int(args.interval_dps),
                    float(args.inflate),
                )
                main_abs_lower, _main_abs_upper = abs_bounds_rect(main)
                center_abs, radius, center_radius_bound = center_radius_lower(main)
                main_lower_rect = min(main_lower_rect, main_abs_lower)
                main_lower_center_radius = min(main_lower_center_radius, center_radius_bound)
                min_main_center_abs = min(min_main_center_abs, center_abs)
                max_main_radius = max(max_main_radius, radius)

                product = mul_rect(d0, conj_rect(main), float(args.inflate))
                numerator_upper = max(numerator_upper, 0.0, -product.re_lo)

                rest_combined = add_rect(drest, rvec_tail, float(args.inflate))
                _rest_combined_lower, sub_rest_combined_upper = abs_bounds_rect(rest_combined)
                _drest_lower, drest_upper = abs_bounds_rect(drest)
                _rvec_lower, rvec_upper = abs_bounds_rect(rvec_tail)
                rest_combined_upper = max(rest_combined_upper, sub_rest_combined_upper)
                rest_separate_upper = max(rest_separate_upper, drest_upper + rvec_upper)
    except ArithmeticError as exc:
        notes.append(str(exc))
        main_lower_rect = 0.0
        main_lower_center_radius = 0.0

    main_lower_rect = lower_out(main_lower_rect)
    main_lower_center_radius = lower_out(main_lower_center_radius)
    if args.main_lower_method == "rect":
        main_lower = main_lower_rect
    elif args.main_lower_method == "center-radius":
        main_lower = max(main_lower_rect, main_lower_center_radius)
    else:
        raise ValueError(f"unknown main lower method: {args.main_lower_method}")
    main_lower = max(0.0, main_lower)
    min_main_center_abs = 0.0 if not math.isfinite(min_main_center_abs) else min_main_center_abs
    max_main_radius = 0.0 if not math.isfinite(max_main_radius) else max_main_radius
    numerator_upper = upper_out(numerator_upper)
    rest_combined_upper = upper_out(rest_combined_upper)
    rest_separate_upper = upper_out(rest_separate_upper)
    parallel_upper = scalar_ratio(numerator_upper, main_lower)
    budget_combined = main_lower - parallel_upper - rest_combined_upper
    budget_separate = main_lower - parallel_upper - rest_separate_upper
    certified_combined = main_lower > 0.0 and budget_combined > 0.0
    certified_separate = main_lower > 0.0 and budget_separate > 0.0

    if main_lower <= 0.0:
        status = "fail_main_contains_zero"
    elif certified_combined and certified_separate:
        status = "certified_combined_and_separate"
    elif certified_combined:
        status = "certified_combined"
    elif certified_separate:
        status = "certified_separate"
    elif box.point_budget_combined_from_scout > 0.0 and budget_combined <= 0.0:
        status = "fail_interval_inflation"
    elif budget_combined <= 0.0:
        status = "fail_budget_combined"
    elif budget_separate <= 0.0:
        status = "fail_budget_separate"
    else:
        status = "fail_unknown"

    notes.append(
        f"mode={args.mode}; subdiv_sigma={args.subdiv_sigma}; subdiv_t={args.subdiv_t}; "
        f"main_lower_method={args.main_lower_method}"
    )
    return CertificateRow(
        label=args.label,
        source_box_id=box.source_box_id,
        sigma_min=box.sigma_min,
        sigma_max=box.sigma_max,
        t_min=box.t_min,
        t_max=box.t_max,
        mainNormLowerConst=main_lower,
        numeratorUpperConst=numerator_upper,
        parallelUpperConst=parallel_upper,
        restUpperCombinedConst=rest_combined_upper,
        restUpperSeparateConst=rest_separate_upper,
        budgetCombinedConst=budget_combined,
        budgetSeparateConst=budget_separate,
        certified_combined=certified_combined,
        certified_separate=certified_separate,
        status=status,
        main_lower_method=args.main_lower_method,
        main_center_abs=min_main_center_abs,
        main_radius=max_main_radius,
        main_lower_rect=main_lower_rect,
        main_lower_improved=main_lower,
        main_lower_gain=max(0.0, main_lower - main_lower_rect),
        interval_dps=int(args.interval_dps),
        inflate=float(args.inflate),
        point_budget_combined_from_scout=box.point_budget_combined_from_scout,
        point_budget_separate_from_scout=box.point_budget_separate_from_scout,
        budget_loss_to_interval_combined=box.point_budget_combined_from_scout - budget_combined,
        budget_loss_to_interval_separate=box.point_budget_separate_from_scout - budget_separate,
        notes="; ".join(notes),
    )


def parse_bool(text: str) -> bool:
    return str(text).strip().lower() in {"1", "true", "yes", "y"}


def read_boxes(path: Path, args: argparse.Namespace) -> list[BoxInput]:
    rows: list[BoxInput] = []
    box_id_set = {
        item.strip()
        for item in str(args.box_id_list).split(",")
        if item.strip()
    }
    with path.open(newline="") as f:
        reader = csv.DictReader(f)
        for row in reader:
            if args.only_status and row.get("status", "") != args.only_status:
                continue
            box_id = row["box_id"] if "box_id" in row else row["source_box_id"]
            if box_id_set and box_id not in box_id_set:
                continue
            pass_combined = parse_bool(
                row.get("pass_combined_const", row.get("certified_combined", "false"))
            )
            pass_separate = parse_bool(
                row.get("pass_separate_const", row.get("certified_separate", "false"))
            )
            if args.only_pass_combined and not pass_combined:
                continue
            if args.only_pass_separate and not pass_separate:
                continue
            if args.box_id and box_id != args.box_id:
                continue
            point_budget_combined = float(
                row.get("budgetCombinedConst", row.get("point_budget_combined_from_scout", "nan"))
            )
            point_budget_separate = float(
                row.get("budgetSeparateConst", row.get("point_budget_separate_from_scout", "nan"))
            )
            if "point_budget_combined_from_scout" in row:
                point_budget_combined = float(row["point_budget_combined_from_scout"])
            if "point_budget_separate_from_scout" in row:
                point_budget_separate = float(row["point_budget_separate_from_scout"])
            rows.append(
                BoxInput(
                    source_box_id=box_id,
                    sigma_min=float(row["sigma_min"]),
                    sigma_max=float(row["sigma_max"]),
                    t_min=float(row["t_min"]),
                    t_max=float(row["t_max"]),
                    point_budget_combined_from_scout=point_budget_combined,
                    point_budget_separate_from_scout=point_budget_separate,
                    pass_combined_const=pass_combined,
                    pass_separate_const=pass_separate,
                )
            )
    if args.max_boxes is not None:
        rows = rows[: max(0, int(args.max_boxes))]
    return rows


def default_output_paths(label: str) -> tuple[Path, Path]:
    stem = safe_label(label)
    out_dir = Path("audit_outputs")
    return (
        out_dir / f"c2_projected_j0_interval_box_certifier_{stem}.csv",
        out_dir / f"c2_projected_j0_interval_box_certifier_{stem}.json",
    )


def write_csv(path: Path, rows: list[CertificateRow]) -> None:
    if not rows:
        return
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=list(asdict(rows[0]).keys()))
        writer.writeheader()
        for row in rows:
            writer.writerow(asdict(row))


def jsonable(value: Any) -> Any:
    if isinstance(value, Path):
        return str(value)
    if isinstance(value, float):
        if math.isnan(value):
            return "nan"
        if math.isinf(value):
            return "inf" if value > 0 else "-inf"
    return value


def write_json(
    path: Path,
    args: argparse.Namespace,
    rows: list[CertificateRow],
    elapsed: float,
    command: list[str],
) -> dict[str, Any]:
    status_counts = Counter(row.status for row in rows)
    summary = {
        "label": args.label,
        "elapsed_seconds": elapsed,
        "boxes": len(rows),
        "certified_combined": sum(1 for row in rows if row.certified_combined),
        "certified_separate": sum(1 for row in rows if row.certified_separate),
        "status_counts": dict(status_counts),
        "min_budget_combined": min((row.budgetCombinedConst for row in rows), default=math.nan),
        "min_budget_separate": min((row.budgetSeparateConst for row in rows), default=math.nan),
        "max_budget_loss_combined": max(
            (row.budget_loss_to_interval_combined for row in rows), default=math.nan
        ),
        "max_budget_loss_separate": max(
            (row.budget_loss_to_interval_separate for row in rows), default=math.nan
        ),
        "parameters": {key: jsonable(value) for key, value in vars(args).items()},
        "command": command,
        "rows": [asdict(row) for row in rows],
    }
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w") as f:
        json.dump(summary, f, indent=2, sort_keys=True, default=jsonable)
        f.write("\n")
    return summary


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        description="Interval certifier for projected-j0 constant boxes."
    )
    parser.add_argument("--boxes-csv", type=Path, required=True)
    parser.add_argument("--label", type=str, required=True)
    parser.add_argument("--K", type=int, default=16)
    parser.add_argument("--M", type=int, default=12001)
    parser.add_argument("--ref-K", type=int, default=17)
    parser.add_argument("--ref-M", type=int, default=16001)
    parser.add_argument(
        "--reference-mode",
        choices=["raw", "exponential", "supergaussian"],
        default="supergaussian",
    )
    parser.add_argument("--reference-X", type=float, default=10661.0)
    parser.add_argument("--reference-p", type=int, default=2)
    parser.add_argument(
        "--target-reference-mode",
        choices=["raw", "exponential", "supergaussian"],
        default="supergaussian",
    )
    parser.add_argument("--target-reference-X", type=float, default=None)
    parser.add_argument("--target-reference-p", type=int, default=None)
    parser.add_argument(
        "--odd-reference-mode",
        choices=["raw", "exponential", "supergaussian"],
        default="supergaussian",
    )
    parser.add_argument("--odd-ref-M", type=int, default=None)
    parser.add_argument("--odd-reference-X", type=float, default=None)
    parser.add_argument("--odd-reference-p", type=int, default=None)
    parser.add_argument("--interval-dps", type=int, default=50)
    parser.add_argument("--inflate", type=float, default=1.0e-12)
    parser.add_argument("--mode", choices=["fast", "strict"], default="fast")
    parser.add_argument("--main-lower-method", choices=["rect", "center-radius"], default="rect")
    parser.add_argument("--subdiv-sigma", type=int, default=1)
    parser.add_argument("--subdiv-t", type=int, default=1)
    parser.add_argument("--only-pass-combined", action="store_true")
    parser.add_argument("--only-pass-separate", action="store_true")
    parser.add_argument("--only-status", type=str, default="")
    parser.add_argument("--max-boxes", type=int, default=None)
    parser.add_argument("--box-id", type=str, default="")
    parser.add_argument("--box-id-list", type=str, default="")
    parser.add_argument("--out-csv", type=Path, default=None)
    parser.add_argument("--out-json", type=Path, default=None)
    parser.add_argument("--top", type=int, default=8)
    parser.add_argument("--threads", type=int, default=None)
    return parser


def main() -> None:
    args = build_parser().parse_args()
    if args.target_reference_X is None:
        args.target_reference_X = args.reference_X
    if args.target_reference_p is None:
        args.target_reference_p = args.reference_p
    if args.odd_reference_X is None:
        args.odd_reference_X = args.reference_X
    if args.odd_reference_p is None:
        args.odd_reference_p = args.reference_p
    if args.subdiv_sigma < 1 or args.subdiv_t < 1:
        raise SystemExit("subdivision counts must be positive")
    validate_args(args)

    default_csv, default_json = default_output_paths(args.label)
    if args.out_csv is None:
        args.out_csv = default_csv
    if args.out_json is None:
        args.out_json = default_json

    boxes = read_boxes(args.boxes_csv, args)
    print("C2 projected-j0 interval box certifier")
    print("======================================")
    print(f"label={args.label}")
    print(f"boxes_csv={args.boxes_csv}")
    print(f"boxes_selected={len(boxes)} mode={args.mode} dps={args.interval_dps}")
    print(
        f"inflate={args.inflate} subdiv_sigma={args.subdiv_sigma} "
        f"subdiv_t={args.subdiv_t} main_lower_method={args.main_lower_method}"
    )

    tic = time.time()
    ctx = build_interval_context(args)
    print(
        "term_counts="
        f"odd_core:{ctx.odd_core.logs.size}, odd_ref:{ctx.odd_ref.logs.size}, "
        f"target:{ctx.target.logs.size}, central_ref:{ctx.central_ref.logs.size}"
    )

    rows: list[CertificateRow] = []
    for idx, box in enumerate(boxes, 1):
        row = certify_box(ctx, box, args)
        rows.append(row)
        print(
            f"  [{idx}/{len(boxes)}] {box.source_box_id} "
            f"budget={row.budgetCombinedConst:.6e} status={row.status}"
        )

    elapsed = time.time() - tic
    write_csv(args.out_csv, rows)
    summary = write_json(args.out_json, args, rows, elapsed, sys.argv)

    print("-" * 72)
    print(f"elapsed={elapsed:.2f}s boxes={len(rows)}")
    print(
        f"certified_combined={summary['certified_combined']} "
        f"certified_separate={summary['certified_separate']}"
    )
    print(f"status_counts={summary['status_counts']}")
    print(f"CSV: {args.out_csv}")
    print(f"JSON: {args.out_json}")

    if args.top > 0 and rows:
        print("\nWorst interval budgets:")
        for row in sorted(rows, key=lambda r: r.budgetCombinedConst)[: args.top]:
            print(
                f"  {row.source_box_id} budget={row.budgetCombinedConst:.6e} "
                f"main={row.mainNormLowerConst:.6e} "
                f"num={row.numeratorUpperConst:.6e} "
                f"rest={row.restUpperCombinedConst:.6e} "
                f"status={row.status}"
            )


if __name__ == "__main__":
    main()
