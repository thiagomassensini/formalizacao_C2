#!/usr/bin/env python3
"""
C2 Center Gaussian sigma sweep
------------------------------

Estuda o operador central Gaussian:

    C_sigma(t) = sum_c 2 * 2^(-k) * c^(-sigma-it) * exp(-(c/X)^2)

com centros:

    c = 2^k m,   m impar,   k=2..bg_kmax.

Objetivo:
    comparar a profundidade dos vales em diferentes sigmas,
    especialmente perto de sigma = 1/2.

Modos:
    exact  -> avalia apenas nos zeros embutidos e nos midpoints. Rapido.
    grid   -> varre o grid inteiro, detecta minimos locais e calcula percentis.

Dependencia:
    pip install numpy
"""

from __future__ import annotations

import argparse
import csv
import math
import os
import time
from concurrent.futures import ThreadPoolExecutor
from dataclasses import dataclass
from typing import Iterable

import numpy as np


# Primeiros zeros nao triviais da zeta no eixo critico, parte imaginaria positiva.
# Lista suficiente para t <= 100.809...
BUILTIN_ZEROS = np.array([
    14.134725141734693790457251983562470270784257115699,
    21.022039638771554992628479593896902777334340524903,
    25.010857580145688763213790992562821818659549672558,
    30.424876125859513210311897530584091320181560023715,
    32.935061587739189690662368964074903488812715603517,
    37.586178158825671257217763480705332821405597350830,
    40.918719012147495187398126914633254395726165962777,
    43.327073280914999519496122165406805782645668371836,
    48.005150881167159727942472749427516041686844001144,
    49.773832477672302181916784678563724057723178299677,
    52.970321477714460644147296608880990063825017888821,
    56.446247697063394804367759476706930346253591635624,
    59.347044002602353079653648674992219031098772806466,
    60.831778524609809844259901824524003802910090451219,
    65.112544048081606660875054253183705029348149295167,
    67.079810529494173714478828896522216770107144951745,
    69.546401711173979252926857526554738443012474209602,
    72.067157674481907582522107969826168390480906621456,
    75.704690699083933168326916762030345922811903530697,
    77.144840068874805372682664856304637015796032449234,
    79.337375020249367922763592877116228190613246743120,
    82.910380854086030183164837494770609497508880593782,
    84.735492981329459783893449415315798532739115176554,
    87.425274613125229406531667850919213252171886401269,
    88.809111207634465423682348079509378395444893409818,
    92.491899270558484296259725241810684878721794027730,
    94.651344040519886966597925815208489064002159869796,
    95.870634228245309758741029219246781695256461224987,
    98.831194218193692233324420138622327820658039063429,
], dtype=np.float64)


@dataclass
class SweepMetrics:
    sigma: float
    mean_zero_exact: float
    mean_mid_exact: float
    exact_ratio: float
    exact_logdiff: float
    minima_count: int | None = None
    below_count: int | None = None
    matches: int | None = None
    true_below: int | None = None
    false_below: int | None = None
    mean_zero_min: float | None = None
    mean_mid_grid: float | None = None
    grid_ratio: float | None = None
    grid_logdiff: float | None = None
    mean_pct: float | None = None
    worst_pct: float | None = None
    worst_zero_min: float | None = None
    first_false_min: float | None = None
    gap_false_over_worst_zero: float | None = None


def parse_sigmas(args: argparse.Namespace) -> list[float]:
    if args.sigmas:
        vals = []
        for part in args.sigmas.split(','):
            part = part.strip()
            if part:
                vals.append(float(part))
        if not vals:
            raise ValueError("--sigmas foi passado, mas nao contem valores")
        return vals

    if args.sigma_step <= 0:
        raise ValueError("--sigma-step precisa ser positivo")

    # Evita erro acumulado em arange quando sigma_max deveria ser incluido.
    n = int(math.floor((args.sigma_max - args.sigma_min) / args.sigma_step + 1e-12))
    sigmas = [args.sigma_min + i * args.sigma_step for i in range(n + 1)]
    if sigmas[-1] < args.sigma_max - 0.5 * args.sigma_step:
        sigmas.append(args.sigma_max)
    return [round(x, 12) for x in sigmas]


def load_zeros(kind: str, tmin: float, tmax: float, path: str | None = None) -> np.ndarray:
    if kind == "builtin":
        zeros = BUILTIN_ZEROS.copy()
    elif kind == "file":
        if not path:
            raise ValueError("--zeros file exige --zeros-file")
        vals = []
        with open(path, "r", encoding="utf-8") as f:
            for line in f:
                line = line.strip()
                if not line or line.startswith("#"):
                    continue
                vals.append(float(line.split()[0].replace(',', '.')))
        zeros = np.array(vals, dtype=np.float64)
    else:
        raise ValueError("--zeros deve ser builtin ou file")

    return zeros[(zeros >= tmin) & (zeros <= tmax)]


def build_c2_centers(nmax: int, bg_kmax: int) -> tuple[np.ndarray, np.ndarray]:
    centers: list[int] = []
    ks: list[int] = []

    for k in range(2, bg_kmax + 1):
        step = 1 << k
        mmax = (nmax - 1) // step
        if mmax < 1:
            continue
        if mmax % 2 == 0:
            mmax -= 1

        for m in range(1, mmax + 1, 2):
            c = step * m
            if c - 1 >= 3 and c + 1 <= nmax:
                centers.append(c)
                ks.append(k)

    return np.array(centers, dtype=np.float64), np.array(ks, dtype=np.float64)


def local_minima(y: np.ndarray) -> np.ndarray:
    return np.where((y[1:-1] < y[:-2]) & (y[1:-1] < y[2:]))[0] + 1


def nearest_grid_values(t_grid: np.ndarray, abs_c: np.ndarray, points: np.ndarray) -> np.ndarray:
    if points.size == 0:
        return np.array([], dtype=np.float64)
    idx = np.rint((points - t_grid[0]) / (t_grid[1] - t_grid[0])).astype(np.int64)
    idx = np.clip(idx, 0, t_grid.size - 1)
    return abs_c[idx]


def eval_center_channel(
    t_values: np.ndarray,
    logc: np.ndarray,
    weight_prefactor: np.ndarray,
    sigma: float,
    chunk: int,
    workers: int,
) -> np.ndarray:
    """
    Calcula C_sigma(t) = sum_j weight_j(sigma) exp(-i t log c_j).

    weight_prefactor ja inclui:
        2 * 2^(-k) * exp(-(c/X)^2)

    e aqui multiplicamos por exp(-sigma log c).
    """
    t_values = np.asarray(t_values, dtype=np.float64)
    weights = np.ascontiguousarray(weight_prefactor * np.exp(-float(sigma) * logc))
    out = np.empty(t_values.size, dtype=np.complex128)

    if t_values.size == 0:
        return out

    starts = list(range(0, t_values.size, max(1, int(chunk))))
    n_workers = workers if workers > 0 else (os.cpu_count() or 1)

    def _process(start: int) -> None:
        stop = min(start + chunk, t_values.size)
        tt = t_values[start:stop]
        phase = np.exp(-1j * tt[:, None] * logc[None, :])
        out[start:stop] = phase @ weights

    if n_workers == 1 or len(starts) == 1:
        for s in starts:
            _process(s)
    else:
        with ThreadPoolExecutor(max_workers=n_workers) as ex:
            list(ex.map(_process, starts))

    return out


def percentiles_for_values(sorted_abs: np.ndarray, vals: np.ndarray) -> np.ndarray:
    # percentil = fracao do grid com |C| <= valor.
    ranks = np.searchsorted(sorted_abs, vals, side="right")
    return 100.0 * ranks.astype(np.float64) / float(sorted_abs.size)


def classify_minima_near_zeros(t_minima: np.ndarray, zeros: np.ndarray, tol: float) -> np.ndarray:
    if zeros.size == 0 or t_minima.size == 0:
        return np.zeros(t_minima.size, dtype=bool)
    # Como a lista eh pequena, loop direto eh mais simples e robusto.
    out = np.zeros(t_minima.size, dtype=bool)
    for i, t in enumerate(t_minima):
        out[i] = np.min(np.abs(zeros - t)) <= tol
    return out


def compute_metrics_for_sigma(
    sigma: float,
    zeros: np.ndarray,
    midpoints: np.ndarray,
    t_grid: np.ndarray | None,
    logc: np.ndarray,
    weight_prefactor: np.ndarray,
    args: argparse.Namespace,
) -> SweepMetrics:
    # Avaliacao exata em zeros/midpoints, barata e boa para ver a curva transversal.
    cz = eval_center_channel(zeros, logc, weight_prefactor, sigma, args.chunk, max(1, min(args.workers if args.workers > 0 else os.cpu_count() or 1, args.exact_workers)))
    cm = eval_center_channel(midpoints, logc, weight_prefactor, sigma, args.chunk, max(1, min(args.workers if args.workers > 0 else os.cpu_count() or 1, args.exact_workers)))

    az = np.abs(cz)
    am = np.abs(cm)
    mean_zero_exact = float(np.mean(az)) if az.size else float("nan")
    mean_mid_exact = float(np.mean(am)) if am.size else float("nan")
    exact_ratio = mean_zero_exact / mean_mid_exact if mean_mid_exact > 0 else float("inf")
    exact_logdiff = float(np.mean(np.log10(np.maximum(az, 1e-300))) - np.mean(np.log10(np.maximum(am, 1e-300)))) if az.size and am.size else float("nan")

    metrics = SweepMetrics(
        sigma=float(sigma),
        mean_zero_exact=mean_zero_exact,
        mean_mid_exact=mean_mid_exact,
        exact_ratio=exact_ratio,
        exact_logdiff=exact_logdiff,
    )

    if args.mode == "exact":
        return metrics

    assert t_grid is not None
    c_grid = eval_center_channel(t_grid, logc, weight_prefactor, sigma, args.chunk, args.workers)
    abs_c = np.abs(c_grid)
    minima_idx = local_minima(abs_c)
    below_idx = minima_idx[abs_c[minima_idx] < args.threshold]

    t_minima = t_grid[minima_idx]
    abs_minima = abs_c[minima_idx]
    is_true_min = classify_minima_near_zeros(t_minima, zeros, args.match_tol)

    matches = 0
    matched_vals: list[float] = []
    matched_pcts: list[float] = []
    sorted_abs = np.sort(abs_c)

    for z in zeros:
        if minima_idx.size == 0:
            continue
        j = int(np.argmin(np.abs(t_minima - z)))
        if abs(t_minima[j] - z) <= args.match_tol:
            matches += 1
            val = float(abs_minima[j])
            matched_vals.append(val)
            matched_pcts.append(float(percentiles_for_values(sorted_abs, np.array([val]))[0]))

    mid_grid_vals = nearest_grid_values(t_grid, abs_c, midpoints)
    mean_zero_min = float(np.mean(matched_vals)) if matched_vals else float("nan")
    mean_mid_grid = float(np.mean(mid_grid_vals)) if mid_grid_vals.size else float("nan")
    grid_ratio = mean_zero_min / mean_mid_grid if mean_mid_grid > 0 else float("inf")
    grid_logdiff = (
        float(np.mean(np.log10(np.maximum(np.array(matched_vals), 1e-300))) - np.mean(np.log10(np.maximum(mid_grid_vals, 1e-300))))
        if matched_vals and mid_grid_vals.size
        else float("nan")
    )

    true_below = int(np.sum(is_true_min & (abs_minima < args.threshold)))
    false_below = int(np.sum((~is_true_min) & (abs_minima < args.threshold)))

    false_vals = abs_minima[~is_true_min]
    first_false = float(np.min(false_vals)) if false_vals.size else float("nan")
    worst_zero_min = float(np.max(matched_vals)) if matched_vals else float("nan")
    gap = first_false / worst_zero_min if worst_zero_min > 0 and not math.isnan(first_false) else float("nan")

    metrics.minima_count = int(minima_idx.size)
    metrics.below_count = int(below_idx.size)
    metrics.matches = int(matches)
    metrics.true_below = true_below
    metrics.false_below = false_below
    metrics.mean_zero_min = mean_zero_min
    metrics.mean_mid_grid = mean_mid_grid
    metrics.grid_ratio = grid_ratio
    metrics.grid_logdiff = grid_logdiff
    metrics.mean_pct = float(np.mean(matched_pcts)) if matched_pcts else float("nan")
    metrics.worst_pct = float(np.max(matched_pcts)) if matched_pcts else float("nan")
    metrics.worst_zero_min = worst_zero_min
    metrics.first_false_min = first_false
    metrics.gap_false_over_worst_zero = gap

    return metrics


def format_float(x: float | None, spec: str = ".6e") -> str:
    if x is None:
        return "-"
    try:
        if math.isnan(float(x)):
            return "nan"
    except Exception:
        pass
    return format(float(x), spec)


def print_exact_table(metrics: list[SweepMetrics]) -> None:
    print("\n=== SIGMA SWEEP: EXACT ZEROS/MIDPOINTS ===")
    print(f"{'sigma':>8} {'mean_zero':>13} {'mean_mid':>13} {'ratio':>13} {'logdiff':>10}")
    print("-" * 64)
    for m in metrics:
        print(
            f"{m.sigma:8.4f} "
            f"{m.mean_zero_exact:13.6e} "
            f"{m.mean_mid_exact:13.6e} "
            f"{m.exact_ratio:13.6e} "
            f"{m.exact_logdiff:10.4f}"
        )


def print_grid_table(metrics: list[SweepMetrics], zeros_count: int, threshold: float) -> None:
    print("\n=== SIGMA SWEEP: GRID/MINIMA ===")
    print(f"zeros esperados: {zeros_count}, threshold={threshold:g}")
    print(
        f"{'sigma':>7} {'match':>8} {'min':>5} {'<thr':>5} "
        f"{'T/F<thr':>9} {'meanZ':>11} {'meanMid':>11} {'ratio':>11} "
        f"{'logD':>8} {'pctAvg':>8} {'pctWorst':>8} {'gapFalse':>9}"
    )
    print("-" * 116)
    for m in metrics:
        match_s = "-" if m.matches is None else f"{m.matches}/{zeros_count}"
        tf_s = "-" if m.true_below is None else f"{m.true_below}/{m.false_below}"
        print(
            f"{m.sigma:7.4f} "
            f"{match_s:>8} "
            f"{m.minima_count if m.minima_count is not None else '-':>5} "
            f"{m.below_count if m.below_count is not None else '-':>5} "
            f"{tf_s:>9} "
            f"{format_float(m.mean_zero_min, '.3e'):>11} "
            f"{format_float(m.mean_mid_grid, '.3e'):>11} "
            f"{format_float(m.grid_ratio, '.3e'):>11} "
            f"{format_float(m.grid_logdiff, '.3f'):>8} "
            f"{format_float(m.mean_pct, '.4f'):>8} "
            f"{format_float(m.worst_pct, '.4f'):>8} "
            f"{format_float(m.gap_false_over_worst_zero, '.2f'):>9}"
        )


def write_csv(path: str, metrics: list[SweepMetrics]) -> None:
    fields = list(SweepMetrics.__dataclass_fields__.keys())
    with open(path, "w", newline="", encoding="utf-8") as f:
        w = csv.DictWriter(f, fieldnames=fields)
        w.writeheader()
        for m in metrics:
            w.writerow({name: getattr(m, name) for name in fields})


def main() -> None:
    parser = argparse.ArgumentParser(description="Sigma sweep do operador C2 center Gaussian.")
    parser.add_argument("--mode", choices=["exact", "grid"], default="grid", help="exact=rapido em zeros/midpoints; grid=varredura completa.")

    parser.add_argument("--zeros", choices=["builtin", "file"], default="builtin")
    parser.add_argument("--zeros-file", type=str, default=None)

    parser.add_argument("--nmax", type=int, default=200_000)
    parser.add_argument("--bg-kmax", type=int, default=5)
    parser.add_argument("--x-factor", type=float, default=3.0)
    parser.add_argument("--tmin", type=float, default=10.0)
    parser.add_argument("--tmax", type=float, default=100.80911120763446)
    parser.add_argument("--dt", type=float, default=0.001)
    parser.add_argument("--threshold", type=float, default=0.001)
    parser.add_argument("--match-tol", type=float, default=0.08)

    parser.add_argument("--sigmas", type=str, default=None, help="Lista separada por virgula, ex: 0.45,0.5,0.55")
    parser.add_argument("--sigma-min", type=float, default=0.40)
    parser.add_argument("--sigma-max", type=float, default=0.60)
    parser.add_argument("--sigma-step", type=float, default=0.01)

    parser.add_argument("--chunk", type=int, default=128)
    parser.add_argument("--workers", type=int, default=0, help="0=todos os CPUs para grid.")
    parser.add_argument("--exact-workers", type=int, default=4, help="limite de threads para avaliacao pequena em zeros/midpoints.")
    parser.add_argument("--out-csv", type=str, default=None)

    args = parser.parse_args()

    if args.tmax <= args.tmin:
        raise SystemExit("tmax precisa ser maior que tmin")

    sigmas = parse_sigmas(args)
    zeros = load_zeros(args.zeros, args.tmin, args.tmax, args.zeros_file)
    if zeros.size < 2:
        raise SystemExit("Preciso de pelo menos dois zeros no intervalo para calcular midpoints.")
    midpoints = 0.5 * (zeros[:-1] + zeros[1:])

    x_cut = args.nmax / args.x_factor

    print("=== C2 CENTER GAUSSIAN SIGMA SWEEP ===")
    print(f"mode:                 {args.mode}")
    print(f"zeros usados:          {zeros.size}")
    print(f"nmax:                  {args.nmax}")
    print(f"bg_kmax:               {args.bg_kmax}")
    print(f"X = nmax/x_factor:     {x_cut}")
    print(f"scan:                  [{args.tmin}, {args.tmax}]")
    print(f"dt:                    {args.dt}")
    print(f"sigmas:                {sigmas[0]} .. {sigmas[-1]}  count={len(sigmas)}")
    print(f"threshold:             {args.threshold}")
    print(f"match tolerance:       +/-{args.match_tol}")

    print("\nConstruindo centros c = 2^k m...")
    centers, ks = build_c2_centers(args.nmax, args.bg_kmax)
    if centers.size == 0:
        raise SystemExit("Nenhum centro construido; confira nmax/bg-kmax.")
    print(f"centros:               {centers.size:,}")
    print(f"k min/max:             {int(np.min(ks))}/{int(np.max(ks))}")

    logc = np.ascontiguousarray(np.log(centers))
    weight_prefactor = np.ascontiguousarray(2.0 * np.exp2(-ks) * np.exp(-(centers / x_cut) ** 2))

    t_grid = None
    if args.mode == "grid":
        t_grid = np.arange(args.tmin, args.tmax + 0.5 * args.dt, args.dt, dtype=np.float64)
        print(f"grid points:           {t_grid.size:,}")
        print(f"workers:               {args.workers if args.workers > 0 else (os.cpu_count() or 1)}")

    metrics: list[SweepMetrics] = []
    total_tic = time.time()

    print("\nRodando sweep...")
    for i, sigma in enumerate(sigmas, 1):
        tic = time.time()
        m = compute_metrics_for_sigma(sigma, zeros, midpoints, t_grid, logc, weight_prefactor, args)
        metrics.append(m)
        elapsed = time.time() - tic
        if args.mode == "exact":
            print(f"[{i:02d}/{len(sigmas):02d}] sigma={sigma:.4f} ratio={m.exact_ratio:.3e} logdiff={m.exact_logdiff:.3f} tempo={elapsed:.2f}s")
        else:
            print(f"[{i:02d}/{len(sigmas):02d}] sigma={sigma:.4f} match={m.matches}/{zeros.size} <thr={m.below_count} ratio={m.grid_ratio:.3e} tempo={elapsed:.2f}s")

    print(f"\ntempo total:           {time.time() - total_tic:.2f}s")

    print_exact_table(metrics)
    if args.mode == "grid":
        print_grid_table(metrics, zeros.size, args.threshold)

    best_exact = min(metrics, key=lambda m: m.exact_ratio)
    print("\n=== MELHOR SIGMA POR RAZAO EXACT ZERO/MID ===")
    print(f"sigma={best_exact.sigma:.6f}, ratio={best_exact.exact_ratio:.6e}, logdiff={best_exact.exact_logdiff:.6f}")

    if args.mode == "grid":
        valid = [m for m in metrics if m.grid_ratio is not None and not math.isnan(float(m.grid_ratio))]
        if valid:
            best_grid = min(valid, key=lambda m: float(m.grid_ratio))
            print("\n=== MELHOR SIGMA POR RAZAO GRID ZERO/MID ===")
            print(f"sigma={best_grid.sigma:.6f}, ratio={best_grid.grid_ratio:.6e}, matches={best_grid.matches}/{zeros.size}, below={best_grid.below_count}")

    if args.out_csv:
        write_csv(args.out_csv, metrics)
        print(f"\nCSV salvo em: {args.out_csv}")


if __name__ == "__main__":
    main()
