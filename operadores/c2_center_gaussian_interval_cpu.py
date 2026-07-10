#!/usr/bin/env python3
"""
C2 Center Gaussian: scanner paralelo + auditoria intervalar
===========================================================

Operador estudado
-----------------

    C_X(s) = sum_{c=2^k m} 2 * 2^(-k) * c^(-s) * exp(-(c/X)^2)

com:

    k = 2, ..., bg_kmax
    m impar
    c = 2^k m
    s = sigma + i t

Na linha s = sigma + i t:

    C_X(t) = sum_c w_c * exp(-i t log c)

onde:

    w_c = 2 * 2^(-k) * c^(-sigma) * exp(-(c/X)^2)

O script faz duas coisas:

1. varredura rapida em float64, paralelizada por blocos de t;
2. auditoria intervalar opcional em candidatos selecionados.

Importante
----------

A auditoria intervalar aqui e uma auditoria computacional em Python usando mpmath.iv.
Ela e muito melhor do que confiar apenas em float64, mas nao substitui uma prova formal
em Lean/Arb com arredondamento auditado ponta a ponta. Matemática não aceita recibo de
padaria, infelizmente.

Uso recomendado
---------------

Scan igual ao seu teste, com zeros embutidos ate t < 100:

    python3 c2_center_gaussian_interval_cpu.py \
      --zeros builtin \
      --nmax 200000 \
      --bg-kmax 5 \
      --x-factor 3 \
      --tmin 10 \
      --tmax 100.80911120763446 \
      --dt 0.001 \
      --threshold 0.001 \
      --workers 0

Scan + auditoria intervalar dos matches:

    python3 c2_center_gaussian_interval_cpu.py \
      --zeros builtin \
      --audit matches \
      --audit-radius 0.0005 \
      --audit-mode fast \
      --audit-workers 0

Auditoria intervalar mais pesada, recomputando pesos via mpmath.iv:

    python3 c2_center_gaussian_interval_cpu.py \
      --zeros builtin \
      --audit matches \
      --audit-mode strict \
      --audit-dps 50 \
      --audit-workers 4
"""

from __future__ import annotations

import argparse
import csv
import math
import os
import sys
import time
from concurrent.futures import ProcessPoolExecutor, ThreadPoolExecutor, as_completed
from dataclasses import dataclass
from typing import Iterable, Literal

import numpy as np

try:
    import mpmath as mp
except ImportError as exc:  # pragma: no cover
    raise SystemExit("Instale mpmath primeiro: pip install mpmath") from exc


# Primeiros zeros nao triviais da zeta na linha critica, ate t < 100.
# Usados apenas para comparacao experimental; o scanner nao depende deles.
BUILTIN_ZETA_ZEROS_LT_100 = [
    14.134725141734693,
    21.022039638771555,
    25.010857580145688,
    30.424876125859513,
    32.935061587739189,
    37.586178158825671,
    40.918719012147495,
    43.327073280914999,
    48.005150881167159,
    49.773832477672302,
    52.970321477714460,
    56.446247697063394,
    59.347044002602353,
    60.831778524609809,
    65.112544048081606,
    67.079810529494173,
    69.546401711173980,
    72.067157674481907,
    75.704690699083933,
    77.144840068874805,
    79.337375020249367,
    82.910380854086030,
    84.735492980517050,
    87.425274613125229,
    88.809111207634465,
    92.491899270558484,
    94.651344040519886,
    95.870634228245309,
    98.831194218193692,
]


@dataclass(frozen=True)
class ScanResult:
    t_grid: np.ndarray
    values: np.ndarray
    abs_values: np.ndarray
    minima_idx: np.ndarray
    filtered_idx: np.ndarray


@dataclass(frozen=True)
class MatchRow:
    zero_index: int
    zero: float
    t_min: float
    err: float
    abs_min: float
    percentile: float
    ok: bool


# Globais usados pelos workers da auditoria intervalar.
_G_CENTERS: np.ndarray | None = None
_G_KS: np.ndarray | None = None
_G_LOGC: np.ndarray | None = None
_G_WEIGHTS: np.ndarray | None = None
_G_SIGMA: float | None = None
_G_X_CUT: float | None = None
_G_DERIV_BOUND: float | None = None


def build_c2_centers(nmax: int, bg_kmax: int) -> tuple[np.ndarray, np.ndarray]:
    """
    Constroi centros c = 2^k m, com m impar, k=2..bg_kmax.

    Mantem a mesma convencao do detector minimal:

        c - 1 >= 3
        c + 1 <= nmax
    """
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

    return np.array(centers, dtype=np.int64), np.array(ks, dtype=np.int64)


def build_float_weights(
    centers: np.ndarray,
    ks: np.ndarray,
    sigma: float,
    x_cut: float,
) -> tuple[np.ndarray, np.ndarray, float]:
    """Precomputa log(c), pesos w_c e uma cota de derivada |C'(t)|."""
    centers_f = centers.astype(np.float64)
    ks_f = ks.astype(np.float64)
    logc = np.log(centers_f)
    weights = (
        2.0
        * np.exp2(-ks_f)
        * np.exp(-float(sigma) * logc)
        * np.exp(-((centers_f / float(x_cut)) ** 2))
    )
    # |C'(t)| <= sum_c w_c log(c)
    deriv_bound = float(np.sum(weights * logc, dtype=np.float64))
    return logc, weights, deriv_bound


def eval_center_channel_parallel(
    t_grid: np.ndarray,
    logc: np.ndarray,
    weights: np.ndarray,
    chunk: int,
    workers: int,
) -> np.ndarray:
    """
    Calcula C(t)=sum w_c exp(-i t log c) em blocos.

    Usa threads porque a multiplicacao matricial do NumPy costuma liberar o GIL.
    Se seu BLAS tambem usa muitas threads, compare workers=1 vs workers=0.
    """
    out = np.empty(t_grid.size, dtype=np.complex128)
    starts = list(range(0, t_grid.size, int(chunk)))
    n_workers = workers if workers > 0 else (os.cpu_count() or 1)

    def process(start: int) -> None:
        stop = min(start + int(chunk), t_grid.size)
        tt = t_grid[start:stop]
        phase = np.exp(-1j * tt[:, None] * logc[None, :])
        out[start:stop] = phase @ weights

    with ThreadPoolExecutor(max_workers=n_workers) as ex:
        list(ex.map(process, starts))

    return out


def local_minima(y: np.ndarray) -> np.ndarray:
    return np.where((y[1:-1] < y[:-2]) & (y[1:-1] < y[2:]))[0] + 1


def percentile_ranks(values: np.ndarray, query_indices: np.ndarray) -> np.ndarray:
    """
    Percentil aproximado: porcentagem dos pontos do grid com |C| <= |C_i|.
    Valores menores sao melhores.
    """
    sorted_values = np.sort(values)
    ranks = np.searchsorted(sorted_values, values[query_indices], side="right")
    return 100.0 * ranks.astype(np.float64) / float(values.size)


def load_zeros(args: argparse.Namespace) -> list[float]:
    if args.zeros == "none":
        return []
    if args.zeros == "builtin":
        return list(BUILTIN_ZETA_ZEROS_LT_100)
    if args.zeros == "file":
        if not args.zeros_file:
            raise SystemExit("Use --zeros-file caminho.txt quando --zeros file.")
        out: list[float] = []
        with open(args.zeros_file, "r", encoding="utf-8") as f:
            for line in f:
                line = line.strip()
                if not line or line.startswith("#"):
                    continue
                # Aceita CSV simples: pega o primeiro campo numerico.
                first = line.replace(",", " ").split()[0]
                out.append(float(first))
        return out
    raise SystemExit(f"Modo de zeros desconhecido: {args.zeros}")


def match_zeros_to_minima(
    zeros: list[float],
    t_grid: np.ndarray,
    abs_values: np.ndarray,
    minima_idx: np.ndarray,
    tolerance: float,
) -> list[MatchRow]:
    if not zeros or minima_idx.size == 0:
        return []

    pct_all = percentile_ranks(abs_values, minima_idx)
    rows: list[MatchRow] = []
    min_t = t_grid[minima_idx]

    for j, z in enumerate(zeros, 1):
        if z < float(t_grid[0]) or z > float(t_grid[-1]):
            continue
        nearest_pos = int(np.argmin(np.abs(min_t - z)))
        idx = int(minima_idx[nearest_pos])
        err = abs(float(t_grid[idx]) - z)
        rows.append(
            MatchRow(
                zero_index=j,
                zero=z,
                t_min=float(t_grid[idx]),
                err=err,
                abs_min=float(abs_values[idx]),
                percentile=float(pct_all[nearest_pos]),
                ok=err <= tolerance,
            )
        )
    return rows


def midpoint_values(zeros: list[float], t_grid: np.ndarray, values: np.ndarray) -> list[float]:
    mids: list[float] = []
    z_in = [z for z in zeros if float(t_grid[0]) <= z <= float(t_grid[-1])]
    for a, b in zip(z_in[:-1], z_in[1:]):
        mid = 0.5 * (a + b)
        idx = int(np.argmin(np.abs(t_grid - mid)))
        mids.append(float(abs(values[idx])))
    return mids


def print_scan_report(
    args: argparse.Namespace,
    centers: np.ndarray,
    ks: np.ndarray,
    x_cut: float,
    result: ScanResult,
    zeros: list[float],
    matches: list[MatchRow],
) -> None:
    t_grid = result.t_grid
    abs_values = result.abs_values
    minima_idx = result.minima_idx
    filtered_idx = result.filtered_idx

    print("\n=== RESUMO ===")
    print(f"grid t:              [{t_grid[0]:.6f}, {t_grid[-1]:.6f}]")
    print(f"dt:                  {t_grid[1] - t_grid[0]:.8f}")
    print(f"centros:             {centers.size:,}")
    print(f"k min/max:           {int(np.min(ks))}/{int(np.max(ks))}")
    print(f"X:                   {x_cut:.12g}")
    print(f"minimos locais:      {minima_idx.size}")
    print(f"minimos < threshold: {filtered_idx.size} (threshold < {args.threshold})")

    print("\n|C(t)|:")
    print(f"media no grid todo:  {np.mean(abs_values):.6e}")

    if zeros:
        z_in = [z for z in zeros if float(t_grid[0]) <= z <= float(t_grid[-1])]
        zero_vals = []
        for z in z_in:
            idx = int(np.argmin(np.abs(t_grid - z)))
            zero_vals.append(float(abs_values[idx]))
        mid_vals = midpoint_values(z_in, t_grid, abs_values)

        if zero_vals:
            print(f"zeros usados:        {len(z_in)}")
            print(f"media nos zeros:     {np.mean(zero_vals):.6e}")
        if mid_vals:
            print(f"media nos midpoints: {np.mean(mid_vals):.6e}")
            print(f"zero/mid ratio:      {np.mean(zero_vals) / np.mean(mid_vals):.6e}")

        if zero_vals and mid_vals:
            log_zero = np.mean(np.log10(np.maximum(zero_vals, np.finfo(float).tiny)))
            log_mid = np.mean(np.log10(np.maximum(mid_vals, np.finfo(float).tiny)))
            print("\nlog10 |C(t)|:")
            print(f"media zeros:         {log_zero:.6f}")
            print(f"media midpoints:     {log_mid:.6f}")
            print(f"diferenca zero-mid:  {log_zero - log_mid:.6f}")

    if matches:
        ok_count = sum(1 for r in matches if r.ok)
        print("\n=== ZERO -> MINIMO MAIS PROXIMO ===")
        print(f"matches: {ok_count}/{len(matches)}  tolerancia=±{args.match_tol}")
        print(f"{'#':>3} {'zero':>13} {'t_min':>13} {'err':>10} {'|C|min':>12} {'pct%':>9} {'ok':>5}")
        print("-" * 76)
        for r in matches:
            print(
                f"{r.zero_index:3d} "
                f"{r.zero:13.6f} "
                f"{r.t_min:13.6f} "
                f"{r.err:10.6f} "
                f"{r.abs_min:12.4e} "
                f"{r.percentile:9.4f} "
                f"{'YES' if r.ok else 'NO':>5}"
            )

        pcts = [r.percentile for r in matches]
        print("\nPercentil dos zeros no grid:")
        print(f"media:               {np.mean(pcts):.6f}%")
        print(f"mediana:             {np.median(pcts):.6f}%")
        print(f"melhor:              {np.min(pcts):.6f}%")
        print(f"pior:                {np.max(pcts):.6f}%")

    print("\n=== TOP MINIMOS DE |C(t)| ===")
    print(f"{'#':>3} {'t_min':>13} {'|C|':>12} {'zero perto':>13} {'err':>10}")
    print("-" * 58)
    ordered = minima_idx[np.argsort(abs_values[minima_idx])]
    zeros_for_near = [z for z in zeros if float(t_grid[0]) <= z <= float(t_grid[-1])]
    for j, idx in enumerate(ordered[: args.top], 1):
        t = float(t_grid[idx])
        val = float(abs_values[idx])
        if zeros_for_near:
            znear = min(zeros_for_near, key=lambda z: abs(z - t))
            err = abs(znear - t)
            print(f"{j:3d} {t:13.6f} {val:12.4e} {znear:13.6f} {err:10.6f}")
        else:
            print(f"{j:3d} {t:13.6f} {val:12.4e}")


def write_csv(path: str, result: ScanResult) -> None:
    with open(path, "w", newline="", encoding="utf-8") as f:
        writer = csv.writer(f)
        writer.writerow(["t", "real", "imag", "abs", "is_local_min"])
        minima_set = set(map(int, result.minima_idx.tolist()))
        for i, (t, z, a) in enumerate(zip(result.t_grid, result.values, result.abs_values)):
            writer.writerow([float(t), float(z.real), float(z.imag), float(a), int(i in minima_set)])


def _init_interval_worker(
    centers: np.ndarray,
    ks: np.ndarray,
    logc: np.ndarray,
    weights: np.ndarray,
    sigma: float,
    x_cut: float,
    deriv_bound: float,
) -> None:
    global _G_CENTERS, _G_KS, _G_LOGC, _G_WEIGHTS, _G_SIGMA, _G_X_CUT, _G_DERIV_BOUND
    _G_CENTERS = centers
    _G_KS = ks
    _G_LOGC = logc
    _G_WEIGHTS = weights
    _G_SIGMA = float(sigma)
    _G_X_CUT = float(x_cut)
    _G_DERIV_BOUND = float(deriv_bound)


def _iv_bounds_to_float(x: mp.iv.mpf) -> tuple[float, float]:
    return float(x.a), float(x.b)


def _abs_interval_bounds(re_iv: mp.iv.mpf, im_iv: mp.iv.mpf) -> tuple[float, float]:
    re_lo, re_hi = _iv_bounds_to_float(re_iv)
    im_lo, im_hi = _iv_bounds_to_float(im_iv)

    def square_bounds(lo: float, hi: float) -> tuple[float, float]:
        vals = [lo * lo, hi * hi]
        if lo <= 0.0 <= hi:
            return 0.0, max(vals)
        return min(vals), max(vals)

    re2_lo, re2_hi = square_bounds(re_lo, re_hi)
    im2_lo, im2_hi = square_bounds(im_lo, im_hi)
    lower = math.sqrt(max(0.0, re2_lo + im2_lo))
    upper = math.sqrt(max(0.0, re2_hi + im2_hi))
    return lower, upper


def _center_term_interval_fast(
    t_iv: mp.iv.mpf,
    logc_f: float,
    weight_f: float,
    inflate: float,
) -> tuple[mp.iv.mpf, mp.iv.mpf]:
    """
    Intervalo rapido: usa log/peso float64 inflados.

    Nao e tao forte quanto strict, mas e muito mais rapido e ainda audita a fase com intervalos.
    """
    log_lo = np.nextafter(logc_f, -np.inf)
    log_hi = np.nextafter(logc_f, np.inf)
    if inflate > 0.0:
        log_pad = abs(logc_f) * inflate + inflate
        log_lo -= log_pad
        log_hi += log_pad

    w_lo = max(0.0, weight_f * (1.0 - inflate))
    w_hi = weight_f * (1.0 + inflate)

    log_iv = mp.iv.mpf([log_lo, log_hi])
    w_iv = mp.iv.mpf([w_lo, w_hi])
    theta = t_iv * log_iv
    return w_iv * mp.iv.cos(theta), -w_iv * mp.iv.sin(theta)


def _center_term_interval_strict(
    t_iv: mp.iv.mpf,
    c: int,
    k: int,
    sigma: float,
    x_cut: float,
) -> tuple[mp.iv.mpf, mp.iv.mpf]:
    """
    Intervalo mais pesado: recomputa log(c) e peso a partir do inteiro c via mpmath.iv.
    """
    c_iv = mp.iv.mpf(int(c))
    k_int = int(k)
    sigma_iv = mp.iv.mpf(str(float(sigma)))
    x_iv = mp.iv.mpf(str(float(x_cut)))
    logc = mp.iv.log(c_iv)

    # 2 * 2^(-k) e exato como racional dyadico em representacao binaria,
    # mas aqui fica sob controle do mpmath.iv.
    two = mp.iv.mpf(2)
    w = two * (two ** (-k_int))
    w *= mp.iv.exp(-sigma_iv * logc)
    w *= mp.iv.exp(-((c_iv / x_iv) ** 2))

    theta = t_iv * logc
    return w * mp.iv.cos(theta), -w * mp.iv.sin(theta)


def interval_audit_one(task: tuple[str, float, float, str, int, float]) -> dict[str, float | str]:
    """
    Audita um t0.

    Retorna:
      - intervalo para Re C(t0) e Im C(t0) no ponto t0;
      - upper bound de |C(t0)|;
      - upper bound de |C(t)| em |t-t0| <= radius usando |C'| <= sum w log c.
    """
    label, t0, radius, mode, dps, inflate = task

    if _G_CENTERS is None or _G_KS is None or _G_LOGC is None or _G_WEIGHTS is None:
        raise RuntimeError("Interval worker nao inicializado.")
    if _G_SIGMA is None or _G_X_CUT is None or _G_DERIV_BOUND is None:
        raise RuntimeError("Interval worker sem parametros globais.")

    mp.iv.dps = int(dps)
    t_point = mp.iv.mpf([str(float(t0)), str(float(t0))])

    re = mp.iv.mpf([0, 0])
    im = mp.iv.mpf([0, 0])

    if mode == "strict":
        for c, k in zip(_G_CENTERS, _G_KS):
            tre, tim = _center_term_interval_strict(t_point, int(c), int(k), _G_SIGMA, _G_X_CUT)
            re += tre
            im += tim
    elif mode == "fast":
        for logc_f, weight_f in zip(_G_LOGC, _G_WEIGHTS):
            tre, tim = _center_term_interval_fast(t_point, float(logc_f), float(weight_f), float(inflate))
            re += tre
            im += tim
    else:
        raise ValueError(f"audit mode desconhecido: {mode}")

    abs_lower, abs_upper = _abs_interval_bounds(re, im)

    # Bound em uma janela: |C(t)-C(t0)| <= M1 |t-t0|.
    # Inflamos M1 um pouquinho no modo fast.
    deriv = float(_G_DERIV_BOUND) * (1.0 + max(float(inflate), 1e-15))
    window_upper = abs_upper + deriv * float(radius)

    re_lo, re_hi = _iv_bounds_to_float(re)
    im_lo, im_hi = _iv_bounds_to_float(im)

    return {
        "label": label,
        "t0": float(t0),
        "radius": float(radius),
        "re_lo": re_lo,
        "re_hi": re_hi,
        "im_lo": im_lo,
        "im_hi": im_hi,
        "abs_lower": abs_lower,
        "abs_upper": abs_upper,
        "deriv_bound": deriv,
        "window_abs_upper": window_upper,
    }


def choose_audit_targets(
    audit: str,
    result: ScanResult,
    matches: list[MatchRow],
    zeros: list[float],
    top: int,
) -> list[tuple[str, float]]:
    t_grid = result.t_grid
    abs_values = result.abs_values
    minima_idx = result.minima_idx
    filtered_idx = result.filtered_idx

    if audit == "none":
        return []
    if audit == "matches":
        return [(f"zero#{r.zero_index}", r.t_min) for r in matches if r.ok]
    if audit == "zeros":
        return [(f"zero#{j}", z) for j, z in enumerate(zeros, 1) if float(t_grid[0]) <= z <= float(t_grid[-1])]
    if audit == "top":
        ordered = minima_idx[np.argsort(abs_values[minima_idx])]
        return [(f"top#{j}", float(t_grid[idx])) for j, idx in enumerate(ordered[:top], 1)]
    if audit == "threshold":
        ordered = filtered_idx[np.argsort(abs_values[filtered_idx])]
        return [(f"thr#{j}", float(t_grid[idx])) for j, idx in enumerate(ordered, 1)]
    raise SystemExit(f"--audit desconhecido: {audit}")


def run_interval_audit(
    args: argparse.Namespace,
    centers: np.ndarray,
    ks: np.ndarray,
    logc: np.ndarray,
    weights: np.ndarray,
    deriv_bound: float,
    x_cut: float,
    targets: list[tuple[str, float]],
) -> list[dict[str, float | str]]:
    if not targets:
        return []

    workers = args.audit_workers if args.audit_workers > 0 else (os.cpu_count() or 1)
    tasks = [
        (label, t0, float(args.audit_radius), args.audit_mode, int(args.audit_dps), float(args.audit_inflate))
        for label, t0 in targets
    ]

    print("\n=== AUDITORIA INTERVALAR ===")
    print(f"targets:             {len(tasks)}")
    print(f"mode:                {args.audit_mode}")
    print(f"dps:                 {args.audit_dps}")
    print(f"radius:              ±{args.audit_radius}")
    print(f"workers:             {workers}")
    print(f"derivative bound M1: {deriv_bound:.6e}")
    print("Observacao: window_abs_upper usa |C(t)| <= |C(t0)| + M1*radius.")

    tic = time.time()
    rows: list[dict[str, float | str]] = []

    # Para poucos targets, o overhead de processo ainda compensa no strict.
    with ProcessPoolExecutor(
        max_workers=workers,
        initializer=_init_interval_worker,
        initargs=(centers, ks, logc, weights, float(args.sigma), float(x_cut), float(deriv_bound)),
    ) as ex:
        future_map = {ex.submit(interval_audit_one, task): task[0] for task in tasks}
        for fut in as_completed(future_map):
            rows.append(fut.result())

    rows.sort(key=lambda r: float(r["t0"]))
    elapsed = time.time() - tic

    print(f"tempo auditoria:     {elapsed:.2f}s")
    print(
        f"{'label':>10} {'t0':>13} {'abs_iv_upper':>14} "
        f"{'window_upper':>14} {'Re interval':>27} {'Im interval':>27}"
    )
    print("-" * 112)
    for r in rows:
        print(
            f"{str(r['label']):>10} "
            f"{float(r['t0']):13.6f} "
            f"{float(r['abs_upper']):14.6e} "
            f"{float(r['window_abs_upper']):14.6e} "
            f"[{float(r['re_lo']): .3e}, {float(r['re_hi']): .3e}] "
            f"[{float(r['im_lo']): .3e}, {float(r['im_hi']): .3e}]"
        )

    if args.audit_csv:
        with open(args.audit_csv, "w", newline="", encoding="utf-8") as f:
            writer = csv.DictWriter(f, fieldnames=list(rows[0].keys()))
            writer.writeheader()
            writer.writerows(rows)
        print(f"\nCSV intervalar salvo em: {args.audit_csv}")

    return rows


def parse_args(argv: list[str]) -> argparse.Namespace:
    p = argparse.ArgumentParser(description="C2 center Gaussian scanner paralelo com auditoria intervalar.")

    p.add_argument("--nmax", type=int, default=200_000)
    p.add_argument("--sigma", type=float, default=0.5)
    p.add_argument("--bg-kmax", type=int, default=5)
    p.add_argument("--x-factor", type=float, default=3.0)
    p.add_argument("--tmin", type=float, default=10.0)
    p.add_argument("--tmax", type=float, default=100.80911120763446)
    p.add_argument("--dt", type=float, default=0.001)
    p.add_argument("--threshold", type=float, default=0.001)
    p.add_argument("--match-tol", type=float, default=0.08)
    p.add_argument("--chunk", type=int, default=128)
    p.add_argument("--workers", type=int, default=0, help="threads do scan float64; 0 = todos os CPUs")
    p.add_argument("--top", type=int, default=40)
    p.add_argument("--csv", type=str, default="", help="salva grid completo em CSV, se informado")

    p.add_argument("--zeros", choices=["none", "builtin", "file"], default="builtin")
    p.add_argument("--zeros-file", type=str, default="")

    p.add_argument(
        "--audit",
        choices=["none", "matches", "zeros", "top", "threshold"],
        default="none",
        help="executa auditoria intervalar em candidatos selecionados",
    )
    p.add_argument("--audit-top", type=int, default=30)
    p.add_argument("--audit-radius", type=float, default=0.0005)
    p.add_argument("--audit-workers", type=int, default=0, help="processos da auditoria; 0 = todos os CPUs")
    p.add_argument("--audit-dps", type=int, default=40)
    p.add_argument("--audit-mode", choices=["fast", "strict"], default="fast")
    p.add_argument(
        "--audit-inflate",
        type=float,
        default=1e-14,
        help="inflacao relativa usada no modo fast para log/peso float64",
    )
    p.add_argument("--audit-csv", type=str, default="")

    return p.parse_args(argv)


def main(argv: list[str] | None = None) -> int:
    args = parse_args(sys.argv[1:] if argv is None else argv)

    if args.tmax <= args.tmin:
        raise SystemExit("--tmax precisa ser maior que --tmin")
    if args.dt <= 0:
        raise SystemExit("--dt precisa ser positivo")
    if args.x_factor <= 0:
        raise SystemExit("--x-factor precisa ser positivo")
    if args.bg_kmax < 2:
        raise SystemExit("--bg-kmax precisa ser >= 2 para C2")

    x_cut = float(args.nmax) / float(args.x_factor)
    zeros = load_zeros(args)

    print("=== C2 CENTER GAUSSIAN PARALLEL + INTERVAL ===")
    print(f"zeros usados:         {len([z for z in zeros if args.tmin <= z <= args.tmax])}")
    print(f"nmax:                 {args.nmax}")
    print(f"sigma:                {args.sigma}")
    print(f"bg_kmax:              {args.bg_kmax}")
    print(f"X = nmax/x_factor:    {x_cut}")
    print(f"scan:                 [{args.tmin}, {args.tmax}]")
    print(f"dt:                   {args.dt}")
    print(f"threshold:            {args.threshold}")
    print(f"tolerancia match:     ±{args.match_tol}")

    print("\nConstruindo centros c = 2^k m...")
    centers, ks = build_c2_centers(args.nmax, args.bg_kmax)
    if centers.size == 0:
        raise SystemExit("Nenhum centro construido. Confira nmax/bg-kmax.")
    print(f"centros:              {centers.size:,}")
    print(f"k min/max:            {int(np.min(ks))}/{int(np.max(ks))}")

    logc, weights, deriv_bound = build_float_weights(centers, ks, args.sigma, x_cut)

    t_grid = np.arange(args.tmin, args.tmax + 0.5 * args.dt, args.dt, dtype=np.float64)

    print("\nCalculando C(t) em paralelo...")
    tic = time.time()
    values = eval_center_channel_parallel(
        t_grid=t_grid,
        logc=logc,
        weights=weights,
        chunk=args.chunk,
        workers=args.workers,
    )
    elapsed = time.time() - tic
    print(f"tempo scan:           {elapsed:.2f}s")

    abs_values = np.abs(values)
    minima_idx = local_minima(abs_values)
    filtered_idx = minima_idx[abs_values[minima_idx] < args.threshold]

    result = ScanResult(
        t_grid=t_grid,
        values=values,
        abs_values=abs_values,
        minima_idx=minima_idx,
        filtered_idx=filtered_idx,
    )

    matches = match_zeros_to_minima(zeros, t_grid, abs_values, minima_idx, args.match_tol)
    print_scan_report(args, centers, ks, x_cut, result, zeros, matches)

    if args.csv:
        write_csv(args.csv, result)
        print(f"\nCSV do scan salvo em: {args.csv}")

    targets = choose_audit_targets(args.audit, result, matches, zeros, args.audit_top)
    if targets:
        run_interval_audit(args, centers, ks, logc, weights, deriv_bound, x_cut, targets)

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
