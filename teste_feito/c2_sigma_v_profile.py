#!/usr/bin/env python3
"""
C2 sigma V-profile + tilt-aware ledger lab
==========================================

Genuine-first numerical lab.  No zeta, no external zero comparison.

Purpose
-------
For each sigma and t-window, this script evaluates the finite C2 center-Gaussian
carrier and compares, on the same grid, the three ledgers described in the
branch/tilt/quartet route:

  A. no explicit tilt:
       surplus_no_tilt = |main| - |rest| - tail_upper

  B. tilt as norm-only debt:
       surplus_tilt_norm_only = |main| - |rest| - |tilt_main| - tail_upper

  C. tilt collected into the oriented main block:
       surplus_tilt_oriented = |main + tilt_main| - |rest| - tail_upper

It also records the V-profile fields:

  min_abs(sigma), argmin_t, branch_defect, normalized tilt curvature summaries,
  phase gap between main and rest, and optional half-disk proxy.

The default operator is the C2 center-Gaussian carrier:

  C_X(s) = sum_{c=2^k m} 2*2^(-k)*c^(-s)*exp(-(c/X)^2)

with k>=2, m odd, c=2^k m.

Important
---------
This is a lab script.  It gives candidate constants and comparisons for Lean,
but does not certify grid-to-continuum, roundoff, or interval bounds.  The bar
still asks for a formal receipt, because apparently mathematics is not impressed
by vibes.
"""

from __future__ import annotations

import argparse
import csv
import json
import math
import os
from dataclasses import asdict, dataclass
from pathlib import Path
from typing import Iterable

import numpy as np


# -----------------------------------------------------------------------------
# Data rows
# -----------------------------------------------------------------------------


@dataclass(frozen=True)
class DetailRow:
    window: str
    split: str
    sigma: float
    t: float
    delta: float
    r_vertical: float
    full_re: float
    full_im: float
    full_abs: float
    main_re: float
    main_im: float
    main_abs: float
    rest_re: float
    rest_im: float
    rest_abs: float
    phase_gap_main_rest: float
    tilt_main_re: float
    tilt_main_im: float
    tilt_abs: float
    tilt_projection_on_main: float
    tilt_orthogonal_to_main: float
    tilted_main_abs: float
    tilted_rest_abs: float
    tail_upper: float
    surplus_no_tilt: float
    surplus_tilt_norm_only: float
    surplus_tilt_oriented: float
    surplus_full_tilted: float
    branch_mass: float
    branch_defect: float
    branch_abs_defect: float
    curvature_mean_all: float
    curvature_abs_mean_all: float
    curvature_weighted_mean_main: float
    curvature_weighted_abs_mean_main: float
    curvature_min_all: float
    curvature_max_all: float
    half_disk_distance_proxy: float | None


@dataclass(frozen=True)
class SummaryRow:
    window: str
    split: str
    sigma: float
    points: int
    argmin_t: float
    min_full_abs: float
    mean_full_abs: float
    worst_no_tilt_t: float
    worst_no_tilt: float
    pass_no_tilt: int
    worst_tilt_norm_only_t: float
    worst_tilt_norm_only: float
    pass_tilt_norm_only: int
    worst_tilt_oriented_t: float
    worst_tilt_oriented: float
    pass_tilt_oriented: int
    worst_full_tilted_t: float
    worst_full_tilted: float
    pass_full_tilted: int
    lean_main_lower: float
    lean_oriented_main_lower: float
    lean_rest_upper: float
    lean_tilt_upper: float
    lean_tail_upper: float
    lean_surplus_no_tilt: float
    lean_surplus_tilt_norm_only: float
    lean_surplus_tilt_oriented: float
    branch_mass: float
    branch_defect: float
    branch_abs_defect: float
    curvature_weighted_mean_main_at_argmin: float
    half_disk_distance_proxy_at_argmin: float | None


# -----------------------------------------------------------------------------
# Basic C2 geometry
# -----------------------------------------------------------------------------


def full_depth_kmax(nmax: int) -> int:
    if nmax <= 1:
        raise ValueError("nmax must be > 1")
    return int(nmax - 1).bit_length() - 1


def build_c2_centers(nmax: int, bg_kmax: int) -> tuple[np.ndarray, np.ndarray, np.ndarray]:
    centers: list[int] = []
    ks: list[int] = []
    ms: list[int] = []

    for k in range(2, int(bg_kmax) + 1):
        step = 1 << k
        mmax = (int(nmax) - 1) // step
        if mmax < 1:
            continue
        if mmax % 2 == 0:
            mmax -= 1
        for m in range(1, mmax + 1, 2):
            c = step * m
            if c - 1 >= 3 and c + 1 <= nmax:
                centers.append(c)
                ks.append(k)
                ms.append(m)

    if not centers:
        raise ValueError("No C2 centers built. Check nmax/bg_kmax.")
    return (
        np.array(centers, dtype=np.float64),
        np.array(ks, dtype=np.int64),
        np.array(ms, dtype=np.int64),
    )


def parse_float_csv(raw: str | None) -> list[float]:
    if raw is None or not raw.strip():
        return []
    return [float(part.strip()) for part in raw.split(",") if part.strip()]


def sigma_grid_from_args(args: argparse.Namespace) -> list[float]:
    sigmas = parse_float_csv(args.sigmas)
    if sigmas:
        return sigmas
    if args.dsigma <= 0:
        raise ValueError("--dsigma must be positive")
    n = int(math.floor((args.sigma_max - args.sigma_min) / args.dsigma + 0.5))
    return [args.sigma_min + i * args.dsigma for i in range(n + 1)]


def parse_windows(args: argparse.Namespace) -> list[tuple[str, float, float]]:
    """
    Returns list of (label, tmin, tmax).

    --windows syntax:
      label:center:radius,label:center:radius
      center:radius,center:radius

    Examples:
      --windows t14:14.13:0.35,t1429:14.29:0.25
      --windows 14.13:0.35,14.29:0.25
    """
    if not args.windows:
        return [("window0", float(args.tmin), float(args.tmax))]

    out: list[tuple[str, float, float]] = []
    for idx, item in enumerate(args.windows.split(",")):
        item = item.strip()
        if not item:
            continue
        parts = item.split(":")
        if len(parts) == 2:
            label = f"window{idx}"
            center = float(parts[0])
            radius = float(parts[1])
        elif len(parts) == 3:
            label = parts[0]
            center = float(parts[1])
            radius = float(parts[2])
        else:
            raise ValueError(
                "--windows items must be center:radius or label:center:radius"
            )
        out.append((label, center - radius, center + radius))
    if not out:
        raise ValueError("--windows parsed to an empty list")
    return out


def make_t_grid(tmin: float, tmax: float, dt: float) -> np.ndarray:
    if dt <= 0:
        raise ValueError("dt must be positive")
    n = int(math.floor((tmax - tmin) / dt + 0.5))
    return np.array([tmin + i * dt for i in range(n + 1)], dtype=np.float64)


def split_masks(
    centers: np.ndarray,
    ks: np.ndarray,
    ms: np.ndarray,
    x_cut: float,
    args: argparse.Namespace,
) -> dict[str, np.ndarray]:
    requested = [part.strip() for part in args.splits.split(",") if part.strip()]
    masks: dict[str, np.ndarray] = {}
    for split in requested:
        if split == "depth":
            masks[split] = ks <= int(args.main_k_max)
        elif split == "core":
            masks[split] = ms <= int(args.core_main)
        elif split == "center":
            if args.center_main is not None:
                cutoff = float(args.center_main)
            else:
                cutoff = float(args.center_main_factor) * float(x_cut)
            masks[split] = centers <= cutoff
        elif split == "all":
            masks[split] = np.ones_like(centers, dtype=bool)
        else:
            raise ValueError(f"Unknown split: {split}")
    return masks


# -----------------------------------------------------------------------------
# Branch, tilt, tails, optional half-disk proxy
# -----------------------------------------------------------------------------


def branch_mass_sigma(sigma: float) -> float:
    q = 2.0 ** (-2.0 * sigma)
    return 2.0 * (q * q) / (1.0 - q)


def normalized_tilt_curvature(delta: float, centers: np.ndarray) -> np.ndarray:
    """
    normalizedTiltCurvature delta c = c^(delta+2)*tiltBracket(delta,c)

    Stable form:
      c^2 * (expm1(-delta*log1p(-1/c)) + expm1(-delta*log1p(+1/c)))
    """
    if abs(delta) < 1e-15:
        return np.zeros_like(centers, dtype=np.float64)
    inv = 1.0 / centers
    a = -delta * np.log1p(-inv)
    b = -delta * np.log1p(inv)
    return centers * centers * (np.expm1(a) + np.expm1(b))


def gaussian_crude_tail_bound(nmax: int, x_cut: float, sigma: float) -> float:
    """
    Crude center tail used as diagnostic:

      Tail <= 1/2 * X^(1-sigma) * A^(-sigma) * exp(-A^2)/(2A)
      A = (nmax - 1)/X

    Meaningful mainly for full-depth center cutoff.  Use as lab upper only.
    """
    if x_cut <= 0:
        return 0.0
    A = (float(nmax) - 1.0) / float(x_cut)
    if A <= 0:
        return float("inf")
    return 0.5 * (x_cut ** (1.0 - sigma)) * (A ** (-sigma)) * math.exp(-(A * A)) / (2.0 * A)


def c2_coeff_array(sigma: float, t_grid: np.ndarray, n_values: np.ndarray) -> np.ndarray:
    logs = np.log(n_values.astype(np.float64))
    return np.exp((-sigma - 1j * t_grid[:, None]) * logs[None, :])


def half_disk_proxy_values(
    sigma: float,
    t_grid: np.ndarray,
    m_max: int,
    regularizer_x: float | None,
    regularizer_p: int,
) -> np.ndarray | None:
    """
    Optional finite odd-channel proxy, not a proof object.

    odd_proxy(s) = sum_{m odd <= M} m^(-s) * reg(m)
    half_disk_distance_proxy = |1/2 - odd_proxy(s)|

    This is deliberately labelled proxy because the Lean continued odd channel
    may not be this finite object.  Useful only for pattern finding.
    """
    if m_max <= 0:
        return None
    m = np.arange(1, int(m_max) + 1, 2, dtype=np.float64)
    if m.size == 0:
        return None
    reg = np.ones_like(m)
    if regularizer_x is not None and regularizer_x > 0:
        reg = np.exp(-((m / float(regularizer_x)) ** int(regularizer_p)))
    vals = c2_coeff_array(sigma, t_grid, m) @ reg
    return np.abs(0.5 - vals)


def angle_delta(a: complex, b: complex) -> float:
    return float(np.angle(np.exp(1j * (np.angle(b) - np.angle(a)))))


def projection_components(vec: complex, direction: complex) -> tuple[float, float]:
    if abs(direction) == 0.0:
        return 0.0, abs(vec)
    unit = direction / abs(direction)
    rotated = vec * np.conjugate(unit)
    return float(np.real(rotated)), float(np.imag(rotated))


# -----------------------------------------------------------------------------
# Evaluation
# -----------------------------------------------------------------------------


def eval_blocks_for_sigma(
    sigma: float,
    t_grid: np.ndarray,
    centers: np.ndarray,
    ks: np.ndarray,
    ms: np.ndarray,
    masks: dict[str, np.ndarray],
    x_cut: float,
    args: argparse.Namespace,
) -> tuple[dict[str, dict[str, np.ndarray]], np.ndarray, np.ndarray, np.ndarray]:
    logc = np.log(centers)
    ks_float = ks.astype(np.float64)
    weights = (
        2.0
        * np.exp2(-ks_float)
        * np.exp(-sigma * logc)
        * np.exp(-((centers / x_cut) ** 2))
    )
    delta = sigma - 0.5
    curvature = normalized_tilt_curvature(delta, centers)
    tilt_weights = float(args.tilt_lambda) * curvature * weights

    out: dict[str, dict[str, np.ndarray]] = {}
    for split in masks:
        n = t_grid.size
        out[split] = {
            "main": np.empty(n, dtype=np.complex128),
            "rest": np.empty(n, dtype=np.complex128),
            "tilt_main": np.empty(n, dtype=np.complex128),
            "tilt_rest": np.empty(n, dtype=np.complex128),
        }

    chunk = int(args.chunk)
    for start in range(0, t_grid.size, chunk):
        stop = min(start + chunk, t_grid.size)
        tt = t_grid[start:stop]
        phase = np.exp(-1j * tt[:, None] * logc[None, :])
        full = phase @ weights
        tilt_full = phase @ tilt_weights
        for split, mask in masks.items():
            main = phase[:, mask] @ weights[mask]
            tilt_main = phase[:, mask] @ tilt_weights[mask]
            out[split]["main"][start:stop] = main
            out[split]["rest"][start:stop] = full - main
            out[split]["tilt_main"][start:stop] = tilt_main
            out[split]["tilt_rest"][start:stop] = tilt_full - tilt_main

    return out, weights, curvature, logc


def rows_for_window_sigma(
    window_label: str,
    sigma: float,
    t_grid: np.ndarray,
    centers: np.ndarray,
    ks: np.ndarray,
    ms: np.ndarray,
    masks: dict[str, np.ndarray],
    x_cut: float,
    args: argparse.Namespace,
) -> tuple[list[DetailRow], list[SummaryRow]]:
    blocks, weights, curvature, _logc = eval_blocks_for_sigma(
        sigma, t_grid, centers, ks, ms, masks, x_cut, args
    )
    delta = sigma - 0.5
    r_vertical = 2.0 ** (-(1.0 + sigma))
    bmass = branch_mass_sigma(sigma)
    bdef = bmass - 1.0

    if args.tail_mode == "crude-integral":
        tail_upper = gaussian_crude_tail_bound(args.nmax, x_cut, max(args.tail_sigma_min, sigma if args.tail_sigma_min < 0 else args.tail_sigma_min))
    else:
        tail_upper = 0.0

    hd_proxy = half_disk_proxy_values(
        sigma,
        t_grid,
        args.odd_channel_m,
        args.odd_regularizer_x,
        args.odd_regularizer_p,
    )

    detail_rows: list[DetailRow] = []
    summary_rows: list[SummaryRow] = []

    for split, data in blocks.items():
        mask = masks[split]
        main_values = data["main"]
        rest_values = data["rest"]
        full_values = main_values + rest_values
        tilt_main_values = data["tilt_main"]
        tilt_rest_values = data["tilt_rest"]
        tilted_main_values = main_values + tilt_main_values
        tilted_rest_values = rest_values + tilt_rest_values

        full_abs = np.abs(full_values)
        main_abs = np.abs(main_values)
        rest_abs = np.abs(rest_values)
        tilt_abs = np.abs(tilt_main_values)
        tilted_main_abs = np.abs(tilted_main_values)
        tilted_rest_abs = np.abs(tilted_rest_values)

        surplus_no = main_abs - rest_abs - tail_upper
        surplus_norm = main_abs - rest_abs - tilt_abs - tail_upper
        surplus_oriented = tilted_main_abs - rest_abs - tail_upper
        surplus_full_tilted = tilted_main_abs - tilted_rest_abs - tail_upper

        curv_main = curvature[mask]
        w_main = np.abs(weights[mask])
        if w_main.size and float(np.sum(w_main)) > 0.0:
            curv_w_mean = float(np.sum(curv_main * w_main) / np.sum(w_main))
            curv_w_abs_mean = float(np.sum(np.abs(curv_main) * w_main) / np.sum(w_main))
        else:
            curv_w_mean = 0.0
            curv_w_abs_mean = 0.0

        for i, t in enumerate(t_grid):
            phase_gap = angle_delta(main_values[i], rest_values[i]) if main_abs[i] > 0 and rest_abs[i] > 0 else 0.0
            proj, orth = projection_components(tilt_main_values[i], main_values[i])
            detail_rows.append(
                DetailRow(
                    window=window_label,
                    split=split,
                    sigma=float(sigma),
                    t=float(t),
                    delta=float(delta),
                    r_vertical=float(r_vertical),
                    full_re=float(np.real(full_values[i])),
                    full_im=float(np.imag(full_values[i])),
                    full_abs=float(full_abs[i]),
                    main_re=float(np.real(main_values[i])),
                    main_im=float(np.imag(main_values[i])),
                    main_abs=float(main_abs[i]),
                    rest_re=float(np.real(rest_values[i])),
                    rest_im=float(np.imag(rest_values[i])),
                    rest_abs=float(rest_abs[i]),
                    phase_gap_main_rest=float(phase_gap),
                    tilt_main_re=float(np.real(tilt_main_values[i])),
                    tilt_main_im=float(np.imag(tilt_main_values[i])),
                    tilt_abs=float(tilt_abs[i]),
                    tilt_projection_on_main=proj,
                    tilt_orthogonal_to_main=orth,
                    tilted_main_abs=float(tilted_main_abs[i]),
                    tilted_rest_abs=float(tilted_rest_abs[i]),
                    tail_upper=float(tail_upper),
                    surplus_no_tilt=float(surplus_no[i]),
                    surplus_tilt_norm_only=float(surplus_norm[i]),
                    surplus_tilt_oriented=float(surplus_oriented[i]),
                    surplus_full_tilted=float(surplus_full_tilted[i]),
                    branch_mass=float(bmass),
                    branch_defect=float(bdef),
                    branch_abs_defect=float(abs(bdef)),
                    curvature_mean_all=float(np.mean(curvature)),
                    curvature_abs_mean_all=float(np.mean(np.abs(curvature))),
                    curvature_weighted_mean_main=curv_w_mean,
                    curvature_weighted_abs_mean_main=curv_w_abs_mean,
                    curvature_min_all=float(np.min(curvature)),
                    curvature_max_all=float(np.max(curvature)),
                    half_disk_distance_proxy=None if hd_proxy is None else float(hd_proxy[i]),
                )
            )

        argmin_idx = int(np.argmin(full_abs))
        worst_no_idx = int(np.argmin(surplus_no))
        worst_norm_idx = int(np.argmin(surplus_norm))
        worst_oriented_idx = int(np.argmin(surplus_oriented))
        worst_full_tilted_idx = int(np.argmin(surplus_full_tilted))

        lean_main_lower = float(np.min(main_abs))
        lean_oriented_main_lower = float(np.min(tilted_main_abs))
        lean_rest_upper = float(np.max(rest_abs))
        lean_tilt_upper = float(np.max(tilt_abs))
        lean_tail_upper = float(tail_upper)

        summary_rows.append(
            SummaryRow(
                window=window_label,
                split=split,
                sigma=float(sigma),
                points=int(t_grid.size),
                argmin_t=float(t_grid[argmin_idx]),
                min_full_abs=float(full_abs[argmin_idx]),
                mean_full_abs=float(np.mean(full_abs)),
                worst_no_tilt_t=float(t_grid[worst_no_idx]),
                worst_no_tilt=float(surplus_no[worst_no_idx]),
                pass_no_tilt=int(np.sum(surplus_no > 0.0)),
                worst_tilt_norm_only_t=float(t_grid[worst_norm_idx]),
                worst_tilt_norm_only=float(surplus_norm[worst_norm_idx]),
                pass_tilt_norm_only=int(np.sum(surplus_norm > 0.0)),
                worst_tilt_oriented_t=float(t_grid[worst_oriented_idx]),
                worst_tilt_oriented=float(surplus_oriented[worst_oriented_idx]),
                pass_tilt_oriented=int(np.sum(surplus_oriented > 0.0)),
                worst_full_tilted_t=float(t_grid[worst_full_tilted_idx]),
                worst_full_tilted=float(surplus_full_tilted[worst_full_tilted_idx]),
                pass_full_tilted=int(np.sum(surplus_full_tilted > 0.0)),
                lean_main_lower=lean_main_lower,
                lean_oriented_main_lower=lean_oriented_main_lower,
                lean_rest_upper=lean_rest_upper,
                lean_tilt_upper=lean_tilt_upper,
                lean_tail_upper=lean_tail_upper,
                lean_surplus_no_tilt=lean_main_lower - lean_rest_upper - lean_tail_upper,
                lean_surplus_tilt_norm_only=lean_main_lower - lean_rest_upper - lean_tilt_upper - lean_tail_upper,
                lean_surplus_tilt_oriented=lean_oriented_main_lower - lean_rest_upper - lean_tail_upper,
                branch_mass=float(bmass),
                branch_defect=float(bdef),
                branch_abs_defect=float(abs(bdef)),
                curvature_weighted_mean_main_at_argmin=curv_w_mean,
                half_disk_distance_proxy_at_argmin=None if hd_proxy is None else float(hd_proxy[argmin_idx]),
            )
        )

    return detail_rows, summary_rows


# -----------------------------------------------------------------------------
# I/O and CLI
# -----------------------------------------------------------------------------


def write_csv(path: Path, rows: list[object]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    if not rows:
        raise ValueError(f"No rows to write to {path}")
    with path.open("w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=list(asdict(rows[0]).keys()))
        writer.writeheader()
        for row in rows:
            writer.writerow(asdict(row))


def build_parser() -> argparse.ArgumentParser:
    p = argparse.ArgumentParser(description="C2 sigma V-profile and tilt-aware ledger lab")
    p.add_argument("--nmax", type=int, default=200000)
    p.add_argument("--bg-kmax", type=int, default=12)
    p.add_argument("--full-depth-cutoff", action="store_true")
    p.add_argument("--x-factor", type=float, default=3.0)
    p.add_argument("--x-fixed", type=float, default=None)
    p.add_argument("--sigmas", type=str, default="0.5,0.6,0.7,0.74,0.75")
    p.add_argument("--sigma-min", type=float, default=0.45)
    p.add_argument("--sigma-max", type=float, default=0.75)
    p.add_argument("--dsigma", type=float, default=0.01)
    p.add_argument("--tmin", type=float, default=13.8)
    p.add_argument("--tmax", type=float, default=14.5)
    p.add_argument("--dt", type=float, default=0.001)
    p.add_argument("--windows", type=str, default=None)
    p.add_argument("--splits", type=str, default="depth,core,center")
    p.add_argument("--main-k-max", type=int, default=5)
    p.add_argument("--core-main", type=int, default=401)
    p.add_argument("--center-main", type=float, default=None)
    p.add_argument("--center-main-factor", type=float, default=1.5)
    p.add_argument("--tilt-lambda", type=float, default=1.0)
    p.add_argument("--tail-mode", choices=["none", "crude-integral"], default="none")
    p.add_argument("--tail-sigma-min", type=float, default=-1.0, help="If >=0, use this sigma in crude tail bound.")
    p.add_argument("--odd-channel-m", type=int, default=0, help="Optional finite odd-channel proxy M for half-disk distance.")
    p.add_argument("--odd-regularizer-x", type=float, default=None)
    p.add_argument("--odd-regularizer-p", type=int, default=2)
    p.add_argument("--chunk", type=int, default=64)
    p.add_argument("--csv", type=Path, default=Path("audit_outputs/c2_sigma_v_profile_detail.csv"))
    p.add_argument("--summary-csv", type=Path, default=Path("audit_outputs/c2_sigma_v_profile_summary.csv"))
    p.add_argument("--json", type=Path, default=Path("audit_outputs/c2_sigma_v_profile_config.json"))
    p.add_argument("--top", type=int, default=10)
    return p


def main() -> None:
    args = build_parser().parse_args()
    if args.full_depth_cutoff:
        args.bg_kmax = full_depth_kmax(args.nmax)
    x_cut = float(args.x_fixed) if args.x_fixed is not None else float(args.nmax) / float(args.x_factor)
    sigmas = sigma_grid_from_args(args)
    windows = parse_windows(args)

    centers, ks, ms = build_c2_centers(args.nmax, args.bg_kmax)
    masks = split_masks(centers, ks, ms, x_cut, args)

    all_details: list[DetailRow] = []
    all_summaries: list[SummaryRow] = []

    print("C2 sigma V-profile / tilt-aware ledger")
    print("=======================================")
    print(f"nmax={args.nmax}, bg_kmax={args.bg_kmax}, centers={centers.size:,}, X={x_cut:.12g}")
    print(f"sigmas={sigmas}")
    print(f"splits={list(masks.keys())}, windows={windows}")
    print("No zeta input; this is operator-only diagnostics. Sim, até bêbado a gente respeita o guardrail.")

    for label, tmin, tmax in windows:
        t_grid = make_t_grid(tmin, tmax, args.dt)
        print(f"\nWindow {label}: t=[{tmin:.6f}, {tmax:.6f}], dt={args.dt}, points={t_grid.size}")
        for sigma in sigmas:
            details, summaries = rows_for_window_sigma(
                label, sigma, t_grid, centers, ks, ms, masks, x_cut, args
            )
            all_details.extend(details)
            all_summaries.extend(summaries)
            # Print compact best/worst for requested splits.
            for srow in summaries:
                print(
                    f"sigma={sigma:.6f} split={srow.split:>6} "
                    f"min|C|={srow.min_full_abs:.4e}@{srow.argmin_t:.6f} "
                    f"worst A={srow.worst_no_tilt:.4e} "
                    f"B={srow.worst_tilt_norm_only:.4e} "
                    f"C={srow.worst_tilt_oriented:.4e} "
                    f"LeanC={srow.lean_surplus_tilt_oriented:.4e}"
                )

    write_csv(args.csv, all_details)
    write_csv(args.summary_csv, all_summaries)
    args.json.parent.mkdir(parents=True, exist_ok=True)
    args.json.write_text(
        json.dumps(
            {
                "script": "c2_sigma_v_profile.py",
                "nmax": args.nmax,
                "bg_kmax": args.bg_kmax,
                "centers": int(centers.size),
                "x_cut": x_cut,
                "sigmas": sigmas,
                "windows": windows,
                "splits": list(masks.keys()),
                "tilt_lambda": args.tilt_lambda,
                "tail_mode": args.tail_mode,
                "notes": [
                    "Genuine-first diagnostic; no zeta input.",
                    "Ledger C is the oriented tilt ledger: |main + tilt_main| - |rest| - tail.",
                    "Lean-style surplus uses min main/oriented main and max rest/tail over the grid, hence it is more conservative than pointwise surplus.",
                ],
            },
            indent=2,
            sort_keys=True,
        ),
        encoding="utf-8",
    )

    print("\nArquivos escritos:")
    print(f"  detail:  {args.csv}")
    print(f"  summary: {args.summary_csv}")
    print(f"  config:  {args.json}")

    # Top bottlenecks by oriented Lean surplus.
    worst = sorted(all_summaries, key=lambda r: r.lean_surplus_tilt_oriented)[: max(1, args.top)]
    print("\nPiores candidatos para Lean-style oriented surplus:")
    print(f"{'window':>10} {'split':>8} {'sigma':>9} {'LeanC':>13} {'pointC':>13} {'argmin_t':>11}")
    print("-" * 72)
    for row in worst:
        print(
            f"{row.window:>10} {row.split:>8} {row.sigma:9.6f} "
            f"{row.lean_surplus_tilt_oriented:13.6e} {row.worst_tilt_oriented:13.6e} "
            f"{row.argmin_t:11.6f}"
        )


if __name__ == "__main__":
    main()
