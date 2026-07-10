#!/usr/bin/env python3
"""
C2 center minimal detector
--------------------------

Este script calcula o canal central dos tripletos C2:

    C(t) = sum_c 2 * 2^(-k) * c^(-sigma - i t) * exp(-(c/X)^2)

onde:

    c = 2^k * m
    m impar
    k = profundidade C2 do centro
    sigma = 1/2 por padrão

Depois ele procura e lista os mínimos locais de |C(t)|,
aplicando um threshold para descartar falsos mínimos.

Dependência:
    pip install numpy
"""

import argparse
import csv
import json
import math
import os
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor
import numpy as np


def full_depth_kmax(nmax: int) -> int:
    if nmax <= 1:
        raise ValueError("--full-depth-cutoff exige nmax > 1")
    return int(nmax - 1).bit_length() - 1


def build_c2_centers(nmax: int, bg_kmax: int) -> tuple[np.ndarray, np.ndarray]:
    """
    Constrói centros C2:

        c = 2^k * m

    com:

        k = 2, 3, ..., bg_kmax
        m ímpar
        c - 1 >= 3
        c + 1 <= nmax

    Retorna:
        centers: array dos centros c
        ks: profundidade k de cada centro
    """
    centers = []
    ks = []

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

    centers = np.array(centers, dtype=np.float64)
    ks = np.array(ks, dtype=np.float64)

    return centers, ks


def eval_center_channel(
    t_grid: np.ndarray,
    centers: np.ndarray,
    ks: np.ndarray,
    sigma: float,
    x_cut: float,
    chunk: int,
    workers: int = 1,
) -> np.ndarray:
    """
    Calcula:

        C(t) = sum_c 2 * 2^(-k) * c^(-sigma) * exp(-(c/X)^2) * exp(-i t log c)

    em blocos paralelizados com threads (NumPy libera o GIL em matmul).
    """
    logc = np.log(centers)

    weights = (
        2.0
        * np.exp2(-ks)
        * np.exp(-sigma * logc)
        * np.exp(-(centers / x_cut) ** 2)
    )

    out = np.empty(t_grid.size, dtype=np.complex128)
    starts = range(0, t_grid.size, chunk)

    def _process(start):
        stop = min(start + chunk, t_grid.size)
        tt = t_grid[start:stop]
        phase = np.exp(-1j * tt[:, None] * logc[None, :])
        out[start:stop] = phase @ weights

    n_workers = workers if workers > 0 else (os.cpu_count() or 1)
    with ThreadPoolExecutor(max_workers=n_workers) as ex:
        list(ex.map(_process, starts))

    return out


def eval_center_channel_points(
    sigma_grid: np.ndarray,
    t_grid: np.ndarray,
    centers: np.ndarray,
    ks: np.ndarray,
    x_cut: float,
    chunk: int,
    workers: int = 1,
) -> np.ndarray:
    """
    Calcula o carrier em pontos gerais `s = sigma + i t`:

        C(s) = sum_c 2 * 2^(-k) * c^(-s) * exp(-(c/X)^2)
    """
    logc = np.log(centers)
    base_weights = 2.0 * np.exp2(-ks) * np.exp(-(centers / x_cut) ** 2)

    out = np.empty(t_grid.size, dtype=np.complex128)
    starts = range(0, t_grid.size, chunk)

    def _process(start):
        stop = min(start + chunk, t_grid.size)
        ss = sigma_grid[start:stop]
        tt = t_grid[start:stop]
        coeff = np.exp((-ss[:, None] - 1j * tt[:, None]) * logc[None, :])
        out[start:stop] = coeff @ base_weights

    n_workers = workers if workers > 0 else (os.cpu_count() or 1)
    with ThreadPoolExecutor(max_workers=n_workers) as ex:
        list(ex.map(_process, starts))

    return out


def local_minima(y: np.ndarray) -> np.ndarray:
    """
    Índices i tais que:

        y[i] < y[i-1]
        y[i] < y[i+1]
    """
    return np.where((y[1:-1] < y[:-2]) & (y[1:-1] < y[2:]))[0] + 1


def print_report(
    t_grid: np.ndarray,
    abs_c: np.ndarray,
    minima_idx: np.ndarray,
    filtered_idx: np.ndarray,
    threshold: float,
    top: int,
):
    print("\n=== RESUMO ===")
    print(f"grid t:              [{t_grid[0]:.6f}, {t_grid[-1]:.6f}]")
    print(f"dt:                  {t_grid[1] - t_grid[0]:.8f}")
    print(f"mínimos locais:      {len(minima_idx)}")
    print(f"mínimos válidos:     {len(filtered_idx)} (threshold < {threshold})")

    print("\n|C(t)|:")
    print(f"média no grid todo:  {np.mean(abs_c):.6e}")

    print("\n=== MÍNIMOS VÁLIDOS DE |C(t)| ===")
    
    if len(filtered_idx) == 0:
        print("Nenhum mínimo passou no threshold configurado.")
        return

    print(f"{'#':>3} {'t_min':>13} {'|C|min':>12}")
    print("-" * 31)

    # Ordena os válidos cronologicamente pelo tempo `t` (opcional: ou pode mudar pra ordenar por valor)
    # Aqui mantive a ordenação original pelo valor de |C| (do menor pro maior)
    ordered = filtered_idx[np.argsort(abs_c[filtered_idx])]

    for j, idx in enumerate(ordered[:top], 1):
        t = float(t_grid[idx])
        val = float(abs_c[idx])

        print(
            f"{j:3d} "
            f"{t:13.6f} "
            f"{val:12.4e}"
        )


def build_result_payload(
    args,
    x_cut: float,
    x_mode: str,
    t_grid: np.ndarray,
    centers: np.ndarray,
    ks: np.ndarray,
    abs_c: np.ndarray,
    minima_idx: np.ndarray,
    filtered_idx: np.ndarray,
) -> dict:
    local_minima_rows = [
        {
            "idx": int(idx),
            "t_min": float(t_grid[idx]),
            "abs_c_min": float(abs_c[idx]),
            "filtered": bool(idx in set(map(int, filtered_idx))),
        }
        for idx in minima_idx
    ]
    filtered_rows = [
        {
            "idx": int(idx),
            "t_min": float(t_grid[idx]),
            "abs_c_min": float(abs_c[idx]),
        }
        for idx in filtered_idx
    ]
    return {
        "metadata": {
            "nmax": int(args.nmax),
            "sigma": float(args.sigma),
            "bg_kmax": int(args.bg_kmax),
            "full_depth_cutoff": bool(args.full_depth_cutoff),
            "x_mode": x_mode,
            "x_cut": float(x_cut),
            "x_factor": None if args.x_fixed is not None else float(args.x_factor),
            "x_fixed": None if args.x_fixed is None else float(args.x_fixed),
            "tmin": float(args.tmin),
            "tmax": float(t_grid[-1]),
            "dt": float(t_grid[1] - t_grid[0]) if t_grid.size > 1 else None,
            "threshold": float(args.threshold),
            "chunk": int(args.chunk),
            "workers": int(args.workers),
            "centers_count": int(centers.size),
            "k_min": int(np.min(ks)) if ks.size else None,
            "k_max": int(np.max(ks)) if ks.size else None,
            "local_minima_count": int(minima_idx.size),
            "filtered_minima_count": int(filtered_idx.size),
            "abs_c_mean": float(np.mean(abs_c)) if abs_c.size else None,
        },
        "local_minima": local_minima_rows,
        "filtered_minima": filtered_rows,
    }


def write_outputs(payload: dict, out_csv: str | None, out_json: str | None):
    if out_json:
        with open(out_json, "w", encoding="utf-8") as f:
            json.dump(payload, f, indent=2, sort_keys=True)

    if out_csv:
        metadata = payload["metadata"]
        if "refined_minima" in payload:
            fieldnames = [
                "profile_name",
                "nmax",
                "sigma",
                "bg_kmax",
                "x_mode",
                "x_cut",
                "x_factor",
                "x_fixed",
                "refine_window",
                "refine_dt",
                "centers_count",
                "target_t",
                "refined_t",
                "abs_min",
                "re_c",
                "im_c",
                "arg_c",
                "drift_from_target",
            ]
            rows_key = "refined_minima"
        else:
            fieldnames = [
                "nmax",
                "sigma",
                "bg_kmax",
                "x_mode",
                "x_cut",
                "x_factor",
                "x_fixed",
                "tmin",
                "tmax",
                "dt",
                "threshold",
                "centers_count",
                "local_minima_count",
                "filtered_minima_count",
                "idx",
                "t_min",
                "abs_c_min",
                "filtered",
            ]
            rows_key = "local_minima"
        with open(out_csv, "w", newline="", encoding="utf-8") as f:
            writer = csv.DictWriter(f, fieldnames=fieldnames)
            writer.writeheader()
            for row in payload[rows_key]:
                writer.writerow({
                    **{key: metadata.get(key) for key in fieldnames if key in metadata},
                    **row,
                })


def parse_refine_targets(raw: str) -> list[float]:
    if not raw.strip():
        return []
    return [float(part.strip()) for part in raw.split(",") if part.strip()]


def refine_targets(
    targets: list[float],
    centers: np.ndarray,
    ks: np.ndarray,
    sigma: float,
    x_cut: float,
    window: float,
    dt: float,
    chunk: int,
    workers: int,
) -> list[dict]:
    rows = []
    for target in targets:
        t_grid = np.arange(
            target - window,
            target + window + 0.5 * dt,
            dt,
            dtype=np.float64,
        )
        values = eval_center_channel(
            t_grid=t_grid,
            centers=centers,
            ks=ks,
            sigma=sigma,
            x_cut=x_cut,
            chunk=chunk,
            workers=workers,
        )
        abs_values = np.abs(values)
        idx = int(np.argmin(abs_values))
        refined_t = float(t_grid[idx])
        value = values[idx]
        rows.append({
            "target_t": float(target),
            "refined_t": refined_t,
            "abs_min": float(abs_values[idx]),
            "re_c": float(np.real(value)),
            "im_c": float(np.imag(value)),
            "arg_c": float(np.angle(value)),
            "drift_from_target": refined_t - float(target),
        })
    return rows


def build_refine_payload(
    args,
    x_cut: float,
    x_mode: str,
    centers: np.ndarray,
    ks: np.ndarray,
    refined_rows: list[dict],
) -> dict:
    return {
        "metadata": {
            "profile_name": args.profile_name,
            "nmax": int(args.nmax),
            "sigma": float(args.sigma),
            "bg_kmax": int(args.bg_kmax),
            "full_depth_cutoff": bool(args.full_depth_cutoff),
            "x_mode": x_mode,
            "x_cut": float(x_cut),
            "x_factor": None if args.x_fixed is not None else float(args.x_factor),
            "x_fixed": None if args.x_fixed is None else float(args.x_fixed),
            "refine_window": float(args.refine_window),
            "refine_dt": float(args.refine_dt),
            "chunk": int(args.chunk),
            "workers": int(args.workers),
            "centers_count": int(centers.size),
            "k_min": int(np.min(ks)) if ks.size else None,
            "k_max": int(np.max(ks)) if ks.size else None,
            "targets_count": len(refined_rows),
        },
        "refined_minima": refined_rows,
    }


def print_refine_report(refined_rows: list[dict]):
    print("\n=== REFINAMENTO LOCAL ===")
    if not refined_rows:
        print("Nenhum target configurado.")
        return
    print(f"{'target':>12} {'t_refined':>12} {'drift':>12} {'|C|min':>12} {'arg':>12}")
    print("-" * 66)
    for row in refined_rows:
        print(
            f"{row['target_t']:12.6f} "
            f"{row['refined_t']:12.6f} "
            f"{row['drift_from_target']:12.6g} "
            f"{row['abs_min']:12.4e} "
            f"{row['arg_c']:12.6f}"
        )


def _angle_delta(a: float, b: float) -> float:
    return float(np.angle(np.exp(1j * (b - a))))


def micro_refine_one_target(
    target_t: float,
    previous_refined_t: float,
    centers: np.ndarray,
    ks: np.ndarray,
    sigma: float,
    x_cut: float,
    window: float,
    dt: float,
    chunk: int,
    workers: int,
) -> dict:
    t_grid = np.arange(
        previous_refined_t - window,
        previous_refined_t + window + 0.5 * dt,
        dt,
        dtype=np.float64,
    )
    values = eval_center_channel(
        t_grid=t_grid,
        centers=centers,
        ks=ks,
        sigma=sigma,
        x_cut=x_cut,
        chunk=chunk,
        workers=workers,
    )
    abs_values = np.abs(values)
    idx = int(np.argmin(abs_values))
    value = values[idx]
    left_idx = max(idx - 1, 0)
    right_idx = min(idx + 1, t_grid.size - 1)

    if 0 < idx < t_grid.size - 1:
        curvature = float((abs_values[idx - 1] - 2 * abs_values[idx] + abs_values[idx + 1]) / (dt ** 2))
        complex_derivative_abs = float(abs((values[idx + 1] - values[idx - 1]) / (2 * dt)))
        abs_slope = float((abs_values[idx + 1] - abs_values[idx - 1]) / (2 * dt))
    else:
        curvature = None
        complex_derivative_abs = None
        abs_slope = None

    threshold = 2 * abs_values[idx]
    l = idx
    while l > 0 and abs_values[l - 1] <= threshold:
        l -= 1
    r = idx
    while r + 1 < t_grid.size and abs_values[r + 1] <= threshold:
        r += 1
    valley_width = float(t_grid[r] - t_grid[l])

    phase_left = float(np.angle(values[left_idx]))
    phase_right = float(np.angle(values[right_idx]))

    return {
        "target_t": float(target_t),
        "previous_refined_t": float(previous_refined_t),
        "micro_refined_t": float(t_grid[idx]),
        "abs_min": float(abs_values[idx]),
        "re_c": float(np.real(value)),
        "im_c": float(np.imag(value)),
        "arg_c": float(np.angle(value)),
        "drift_from_previous": float(t_grid[idx] - previous_refined_t),
        "drift_from_target": float(t_grid[idx] - target_t),
        "estimated_curvature": curvature,
        "valley_width_at_2x_min": valley_width,
        "complex_derivative_abs": complex_derivative_abs,
        "abs_slope": abs_slope,
        "phase_left": phase_left,
        "phase_right": phase_right,
        "phase_delta_lr": _angle_delta(phase_left, phase_right),
    }


def complex_audit_one_target(
    target_t: float,
    center_t: float,
    centers: np.ndarray,
    ks: np.ndarray,
    sigma: float,
    x_cut: float,
    window: float,
    dt: float,
    chunk: int,
    workers: int,
) -> dict:
    t_grid = np.arange(
        center_t - window,
        center_t + window + 0.5 * dt,
        dt,
        dtype=np.float64,
    )
    values = eval_center_channel(
        t_grid=t_grid,
        centers=centers,
        ks=ks,
        sigma=sigma,
        x_cut=x_cut,
        chunk=chunk,
        workers=workers,
    )
    abs_values = np.abs(values)
    idx = int(np.argmin(abs_values))
    value = values[idx]
    left_idx = max(idx - 1, 0)
    right_idx = min(idx + 1, t_grid.size - 1)

    if 0 < idx < t_grid.size - 1:
        derivative = (values[idx + 1] - values[idx - 1]) / (2 * dt)
        second_derivative = (values[idx + 1] - 2 * values[idx] + values[idx - 1]) / (dt ** 2)
        abs_curvature = (abs_values[idx - 1] - 2 * abs_values[idx] + abs_values[idx + 1]) / (dt ** 2)
        complex_cross = abs(np.imag(np.conj(value) * derivative))
    else:
        derivative = np.nan + 1j * np.nan
        second_derivative = np.nan + 1j * np.nan
        abs_curvature = np.nan
        complex_cross = np.nan

    phase = np.unwrap(np.angle(values))
    phase_left = float(phase[left_idx])
    phase_right = float(phase[right_idx])
    phase_delta = float(phase_right - phase_left)

    threshold = 2 * abs_values[idx]
    l = idx
    while l > 0 and abs_values[l - 1] <= threshold:
        l -= 1
    r = idx
    while r + 1 < t_grid.size and abs_values[r + 1] <= threshold:
        r += 1
    valley_width = float(t_grid[r] - t_grid[l])

    derivative_abs = float(abs(derivative))
    abs_min = float(abs_values[idx])
    if derivative_abs > 0 and abs_min < 1e-4:
        classification = "transverse_near_zero"
    elif derivative_abs > 0 and valley_width <= 5 * dt:
        classification = "tangent_near_miss"
    elif valley_width > 0.0001:
        classification = "shallow_minimum"
    else:
        classification = "unstable_phase"

    return {
        "target_t": float(target_t),
        "input_center_t": float(center_t),
        "refined_t": float(t_grid[idx]),
        "min_abs": abs_min,
        "re_c": float(np.real(value)),
        "im_c": float(np.imag(value)),
        "arg_c": float(np.angle(value)),
        "phase_left": phase_left,
        "phase_right": phase_right,
        "phase_delta_unwrapped": phase_delta,
        "derivative_re": float(np.real(derivative)),
        "derivative_im": float(np.imag(derivative)),
        "derivative_abs": derivative_abs,
        "second_derivative_abs": float(abs(second_derivative)),
        "abs_curvature": float(abs_curvature),
        "complex_cross": float(complex_cross),
        "valley_width_at_2x_min": valley_width,
        "classification": classification,
    }


def load_micro_refine_records(source: str, target_filter: set[float]) -> list[dict]:
    path = Path(source)

    def use_target(value: float) -> bool:
        return not target_filter or any(abs(value - t) < 5e-7 for t in target_filter)

    def records_from_json(json_path: Path) -> list[dict]:
        data = json.loads(json_path.read_text(encoding="utf-8"))
        if "refined_minima" not in data:
            return []
        metadata = data["metadata"]
        records = []
        for row in data["refined_minima"]:
            target = float(row["target_t"])
            if use_target(target):
                records.append({"metadata": metadata, "row": row})
        return records

    if path.is_dir():
        records = []
        for json_path in sorted(path.glob("refine_*.json")):
            records.extend(records_from_json(json_path))
        return records

    if path.suffix.lower() == ".json":
        return records_from_json(path)

    if path.suffix.lower() == ".csv":
        sidecar_cache: dict[str, dict] = {}
        records = []
        with path.open("r", newline="", encoding="utf-8") as f:
            reader = csv.DictReader(f)
            for row in reader:
                profile = row["profile"]
                target = float(row["target_t"])
                if not use_target(target):
                    continue
                if profile not in sidecar_cache:
                    sidecar = path.parent / f"refine_{profile}.json"
                    data = json.loads(sidecar.read_text(encoding="utf-8"))
                    sidecar_cache[profile] = data["metadata"]
                records.append({
                    "metadata": sidecar_cache[profile],
                    "row": {
                        "target_t": target,
                        "refined_t": float(row["refined_t"]),
                    },
                })
        return records

    raise ValueError(f"Fonte de micro-refinamento não suportada: {source}")


def run_micro_refinement(
    source: str,
    targets: list[float],
    window: float,
    dt: float,
    chunk: int,
    workers: int,
) -> dict:
    records = load_micro_refine_records(source, set(targets))
    grouped: dict[str, dict] = {}
    for record in records:
        metadata = record["metadata"]
        profile = metadata["profile_name"]
        grouped.setdefault(profile, {"metadata": metadata, "rows": []})["rows"].append(record["row"])

    output_rows = []
    for profile, group in grouped.items():
        metadata = group["metadata"]
        nmax = int(metadata["nmax"])
        bg_kmax = int(metadata["bg_kmax"])
        sigma = float(metadata["sigma"])
        x_cut = float(metadata["x_cut"])
        print(f"\nMicro-refinando {profile}: nmax={nmax}, K={bg_kmax}, X={x_cut}")
        centers, ks = build_c2_centers(nmax, bg_kmax)
        for row in group["rows"]:
            refined = micro_refine_one_target(
                target_t=float(row["target_t"]),
                previous_refined_t=float(row["refined_t"]),
                centers=centers,
                ks=ks,
                sigma=sigma,
                x_cut=x_cut,
                window=window,
                dt=dt,
                chunk=chunk,
                workers=workers,
            )
            output_rows.append({
                "profile_name": profile,
                "nmax": nmax,
                "sigma": sigma,
                "bg_kmax": bg_kmax,
                "x_mode": metadata["x_mode"],
                "x_cut": x_cut,
                "target_t": refined["target_t"],
                **refined,
            })

    return {
        "metadata": {
            "source": source,
            "micro_window": float(window),
            "micro_dt": float(dt),
            "chunk": int(chunk),
            "workers": int(workers),
            "profiles_count": len(grouped),
            "rows_count": len(output_rows),
        },
        "micro_refined_minima": output_rows,
    }


def write_micro_outputs(payload: dict, out_csv: str | None, out_json: str | None):
    if out_json:
        with open(out_json, "w", encoding="utf-8") as f:
            json.dump(payload, f, indent=2, sort_keys=True)

    if out_csv:
        fieldnames = [
            "profile_name",
            "nmax",
            "sigma",
            "bg_kmax",
            "x_mode",
            "x_cut",
            "target_t",
            "previous_refined_t",
            "micro_refined_t",
            "abs_min",
            "re_c",
            "im_c",
            "arg_c",
            "drift_from_previous",
            "drift_from_target",
            "estimated_curvature",
            "valley_width_at_2x_min",
            "complex_derivative_abs",
            "abs_slope",
            "phase_left",
            "phase_right",
            "phase_delta_lr",
        ]
        with open(out_csv, "w", newline="", encoding="utf-8") as f:
            writer = csv.DictWriter(f, fieldnames=fieldnames)
            writer.writeheader()
            writer.writerows(payload["micro_refined_minima"])


def run_complex_audit(
    source: str,
    targets: list[float],
    window: float,
    dt: float,
    chunk: int,
    workers: int,
) -> dict:
    records = load_micro_refine_records(source, set(targets))
    grouped: dict[str, dict] = {}
    for record in records:
        metadata = record["metadata"]
        profile = metadata["profile_name"]
        grouped.setdefault(profile, {"metadata": metadata, "rows": []})["rows"].append(record["row"])

    output_rows = []
    for profile, group in grouped.items():
        metadata = group["metadata"]
        nmax = int(metadata["nmax"])
        bg_kmax = int(metadata["bg_kmax"])
        sigma = float(metadata["sigma"])
        x_cut = float(metadata["x_cut"])
        print(f"\nAuditando geometria complexa {profile}: nmax={nmax}, K={bg_kmax}, X={x_cut}")
        centers, ks = build_c2_centers(nmax, bg_kmax)
        for row in group["rows"]:
            audit = complex_audit_one_target(
                target_t=float(row["target_t"]),
                center_t=float(row["refined_t"]),
                centers=centers,
                ks=ks,
                sigma=sigma,
                x_cut=x_cut,
                window=window,
                dt=dt,
                chunk=chunk,
                workers=workers,
            )
            output_rows.append({
                "profile_name": profile,
                "nmax": nmax,
                "sigma": sigma,
                "bg_kmax": bg_kmax,
                "x_mode": metadata["x_mode"],
                "x_cut": x_cut,
                **audit,
            })

    return {
        "metadata": {
            "source": source,
            "complex_window": float(window),
            "complex_dt": float(dt),
            "chunk": int(chunk),
            "workers": int(workers),
            "profiles_count": len(grouped),
            "rows_count": len(output_rows),
        },
        "complex_audit": output_rows,
    }


def write_complex_outputs(payload: dict, out_csv: str | None, out_json: str | None):
    if out_json:
        with open(out_json, "w", encoding="utf-8") as f:
            json.dump(payload, f, indent=2, sort_keys=True)

    if out_csv:
        fieldnames = [
            "profile_name",
            "nmax",
            "sigma",
            "bg_kmax",
            "x_mode",
            "x_cut",
            "target_t",
            "input_center_t",
            "refined_t",
            "min_abs",
            "re_c",
            "im_c",
            "arg_c",
            "phase_left",
            "phase_right",
            "phase_delta_unwrapped",
            "derivative_re",
            "derivative_im",
            "derivative_abs",
            "second_derivative_abs",
            "abs_curvature",
            "complex_cross",
            "valley_width_at_2x_min",
            "classification",
        ]
        with open(out_csv, "w", newline="", encoding="utf-8") as f:
            writer = csv.DictWriter(f, fieldnames=fieldnames)
            writer.writeheader()
            writer.writerows(payload["complex_audit"])


def _parse_csv_set(raw: str) -> set[str]:
    if not raw.strip():
        return set()
    return {part.strip() for part in raw.split(",") if part.strip()}


def box_boundary_points(
    sigma_center: float,
    t_center: float,
    sigma_radius: float,
    t_radius: float,
    samples_per_side: int,
) -> tuple[np.ndarray, np.ndarray]:
    n = max(2, int(samples_per_side))
    s0 = sigma_center - sigma_radius
    s1 = sigma_center + sigma_radius
    t0 = t_center - t_radius
    t1 = t_center + t_radius

    bottom_s = np.linspace(s0, s1, n, endpoint=False)
    bottom_t = np.full(n, t0)
    right_s = np.full(n, s1)
    right_t = np.linspace(t0, t1, n, endpoint=False)
    top_s = np.linspace(s1, s0, n, endpoint=False)
    top_t = np.full(n, t1)
    left_s = np.full(n, s0)
    left_t = np.linspace(t1, t0, n, endpoint=False)

    return (
        np.concatenate([bottom_s, right_s, top_s, left_s]),
        np.concatenate([bottom_t, right_t, top_t, left_t]),
    )


def box_interior_points(
    sigma_center: float,
    t_center: float,
    sigma_radius: float,
    t_radius: float,
    samples: int,
) -> tuple[np.ndarray, np.ndarray]:
    if samples <= 0:
        return np.array([], dtype=np.float64), np.array([], dtype=np.float64)
    sigmas = np.linspace(sigma_center - sigma_radius, sigma_center + sigma_radius, samples)
    ts = np.linspace(t_center - t_radius, t_center + t_radius, samples)
    sigma_grid, t_grid = np.meshgrid(sigmas, ts, indexing="ij")
    return sigma_grid.ravel(), t_grid.ravel()


def winding_number(values: np.ndarray) -> tuple[float, int, float]:
    closed = np.concatenate([values, values[:1]])
    angles = np.unwrap(np.angle(closed))
    total = float(angles[-1] - angles[0])
    winding = total / (2 * np.pi)
    return winding, int(np.rint(winding)), total


def box_audit_one_target(
    target_t: float,
    center_t: float,
    centers: np.ndarray,
    ks: np.ndarray,
    x_cut: float,
    sigma_center: float,
    sigma_radius: float,
    t_radius: float,
    box_samples: int,
    interior_samples: int,
    boundary_threshold: float,
    interior_threshold: float,
    chunk: int,
    workers: int,
) -> dict:
    sigma_boundary, t_boundary = box_boundary_points(
        sigma_center=sigma_center,
        t_center=center_t,
        sigma_radius=sigma_radius,
        t_radius=t_radius,
        samples_per_side=box_samples,
    )
    boundary_values = eval_center_channel_points(
        sigma_grid=sigma_boundary,
        t_grid=t_boundary,
        centers=centers,
        ks=ks,
        x_cut=x_cut,
        chunk=chunk,
        workers=workers,
    )
    boundary_abs = np.abs(boundary_values)
    boundary_idx = int(np.argmin(boundary_abs))
    raw_winding, rounded_winding, total_arg = winding_number(boundary_values)

    sigma_interior, t_interior = box_interior_points(
        sigma_center=sigma_center,
        t_center=center_t,
        sigma_radius=sigma_radius,
        t_radius=t_radius,
        samples=interior_samples,
    )
    if sigma_interior.size:
        interior_values = eval_center_channel_points(
            sigma_grid=sigma_interior,
            t_grid=t_interior,
            centers=centers,
            ks=ks,
            x_cut=x_cut,
            chunk=chunk,
            workers=workers,
        )
        interior_abs = np.abs(interior_values)
        interior_idx = int(np.argmin(interior_abs))
        interior_min_abs = float(interior_abs[interior_idx])
        interior_sigma = float(sigma_interior[interior_idx])
        interior_t = float(t_interior[interior_idx])
    else:
        interior_min_abs = None
        interior_sigma = None
        interior_t = None

    boundary_min_abs = float(boundary_abs[boundary_idx])
    if abs(rounded_winding) == 1 and boundary_min_abs > boundary_threshold:
        classification = "zero_box_candidate"
    elif abs(rounded_winding) == 1:
        classification = "boundary_unsafe"
    elif interior_min_abs is not None and interior_min_abs < interior_threshold:
        classification = "near_miss"
    else:
        classification = "near_miss"

    return {
        "target_t": float(target_t),
        "box_center_t": float(center_t),
        "sigma_center": float(sigma_center),
        "sigma_radius": float(sigma_radius),
        "t_radius": float(t_radius),
        "box_samples": int(box_samples),
        "boundary_min_abs": boundary_min_abs,
        "boundary_min_sigma": float(sigma_boundary[boundary_idx]),
        "boundary_min_t": float(t_boundary[boundary_idx]),
        "raw_winding": raw_winding,
        "rounded_winding": rounded_winding,
        "total_arg_variation": total_arg,
        "interior_min_abs": interior_min_abs,
        "interior_min_sigma": interior_sigma,
        "interior_min_t": interior_t,
        "classification": classification,
    }


def run_box_audit(
    source: str,
    targets: list[float],
    profiles: set[str],
    sigma_center: float,
    sigma_radius: float,
    t_radius: float,
    box_samples: int,
    interior_samples: int,
    boundary_threshold: float,
    interior_threshold: float,
    chunk: int,
    workers: int,
) -> dict:
    records = load_micro_refine_records(source, set(targets))
    grouped: dict[str, dict] = {}
    for record in records:
        metadata = record["metadata"]
        profile = metadata["profile_name"]
        if profiles and profile not in profiles:
            continue
        grouped.setdefault(profile, {"metadata": metadata, "rows": []})["rows"].append(record["row"])

    output_rows = []
    for profile, group in grouped.items():
        metadata = group["metadata"]
        nmax = int(metadata["nmax"])
        bg_kmax = int(metadata["bg_kmax"])
        x_cut = float(metadata["x_cut"])
        print(f"\nAuditando caixas {profile}: nmax={nmax}, K={bg_kmax}, X={x_cut}")
        centers, ks = build_c2_centers(nmax, bg_kmax)
        for row in group["rows"]:
            audit = box_audit_one_target(
                target_t=float(row["target_t"]),
                center_t=float(row["refined_t"]),
                centers=centers,
                ks=ks,
                x_cut=x_cut,
                sigma_center=sigma_center,
                sigma_radius=sigma_radius,
                t_radius=t_radius,
                box_samples=box_samples,
                interior_samples=interior_samples,
                boundary_threshold=boundary_threshold,
                interior_threshold=interior_threshold,
                chunk=chunk,
                workers=workers,
            )
            output_rows.append({
                "profile_name": profile,
                "nmax": nmax,
                "bg_kmax": bg_kmax,
                "x_mode": metadata["x_mode"],
                "x_cut": x_cut,
                **audit,
            })

    return {
        "metadata": {
            "source": source,
            "sigma_center": float(sigma_center),
            "sigma_radius": float(sigma_radius),
            "t_radius": float(t_radius),
            "box_samples": int(box_samples),
            "interior_samples": int(interior_samples),
            "boundary_threshold": float(boundary_threshold),
            "interior_threshold": float(interior_threshold),
            "chunk": int(chunk),
            "workers": int(workers),
            "profiles_count": len(grouped),
            "rows_count": len(output_rows),
        },
        "box_audit": output_rows,
    }


def write_box_outputs(payload: dict, out_csv: str | None, out_json: str | None):
    if out_json:
        with open(out_json, "w", encoding="utf-8") as f:
            json.dump(payload, f, indent=2, sort_keys=True)

    if out_csv:
        fieldnames = [
            "profile_name",
            "nmax",
            "bg_kmax",
            "x_mode",
            "x_cut",
            "target_t",
            "box_center_t",
            "sigma_center",
            "sigma_radius",
            "t_radius",
            "box_samples",
            "boundary_min_abs",
            "boundary_min_sigma",
            "boundary_min_t",
            "raw_winding",
            "rounded_winding",
            "total_arg_variation",
            "interior_min_abs",
            "interior_min_sigma",
            "interior_min_t",
            "classification",
        ]
        with open(out_csv, "w", newline="", encoding="utf-8") as f:
            writer = csv.DictWriter(f, fieldnames=fieldnames)
            writer.writeheader()
            writer.writerows(payload["box_audit"])


def finite_carrier_derivative_upper(
    centers: np.ndarray,
    ks: np.ndarray,
    x_cut: float,
    sigma_min: float,
) -> float:
    logc = np.log(centers)
    weights_abs = (
        2.0
        * np.exp2(-ks)
        * np.exp(-sigma_min * logc)
        * np.exp(-(centers / x_cut) ** 2)
    )
    return float(np.sum(logc * weights_abs))


def certify_one_box(
    row: dict,
    centers: np.ndarray,
    ks: np.ndarray,
    max_samples: int,
    start_samples: int,
    precision: int,
    chunk: int,
    workers: int,
) -> dict:
    sigma_center = float(row["sigma_center"])
    sigma_radius = float(row["sigma_radius"])
    t_radius = float(row["t_radius"])
    center_t = float(row["box_center_t"])
    x_cut = float(row["x_cut"])
    sigma_min = sigma_center - sigma_radius
    derivative_upper = finite_carrier_derivative_upper(
        centers=centers,
        ks=ks,
        x_cut=x_cut,
        sigma_min=sigma_min,
    )

    sample_schedule = []
    n = max(4, int(start_samples))
    while n < max_samples:
        sample_schedule.append(n)
        n *= 2
    if not sample_schedule or sample_schedule[-1] != max_samples:
        sample_schedule.append(max_samples)

    last = None
    for samples in sample_schedule:
        sigma_boundary, t_boundary = box_boundary_points(
            sigma_center=sigma_center,
            t_center=center_t,
            sigma_radius=sigma_radius,
            t_radius=t_radius,
            samples_per_side=samples,
        )
        values = eval_center_channel_points(
            sigma_grid=sigma_boundary,
            t_grid=t_boundary,
            centers=centers,
            ks=ks,
            x_cut=x_cut,
            chunk=chunk,
            workers=workers,
        )
        abs_values = np.abs(values)
        boundary_idx = int(np.argmin(abs_values))
        raw_winding, rounded_winding, total_arg = winding_number(values)
        step_size = max(2 * sigma_radius / samples, 2 * t_radius / samples)
        interpolation_error_bound = derivative_upper * step_size / 2
        boundary_min_sample = float(abs_values[boundary_idx])
        certified_margin = boundary_min_sample - interpolation_error_bound
        last = {
            "profile_name": row["profile_name"],
            "nmax": int(row["nmax"]),
            "bg_kmax": int(row["bg_kmax"]),
            "x_mode": row["x_mode"],
            "x_cut": x_cut,
            "target_t": float(row["target_t"]),
            "box_center_t": center_t,
            "sigma_center": sigma_center,
            "sigma_radius": sigma_radius,
            "t_radius": t_radius,
            "certify_precision": int(precision),
            "certify_samples": int(samples),
            "boundary_min_sample": boundary_min_sample,
            "boundary_min_sigma": float(sigma_boundary[boundary_idx]),
            "boundary_min_t": float(t_boundary[boundary_idx]),
            "derivative_upper": derivative_upper,
            "step_size": float(step_size),
            "interpolation_error_bound": float(interpolation_error_bound),
            "certified_boundary_margin": float(certified_margin),
            "raw_winding": raw_winding,
            "rounded_winding": rounded_winding,
            "total_arg_variation": total_arg,
            "sample_schedule": ",".join(str(x) for x in sample_schedule),
        }
        if abs(rounded_winding) == 1 and certified_margin > 0:
            last["status"] = "certified_finite_zero_box"
            return last

    assert last is not None
    if last["certified_boundary_margin"] <= 0 and int(last["certify_samples"]) >= max_samples:
        last["status"] = "boundary_margin_failed"
    else:
        last["status"] = "needs_more_subdivision"
    return last


def run_box_certification(
    input_path: str,
    max_samples: int,
    start_samples: int,
    precision: int,
    chunk: int,
    workers: int,
) -> dict:
    data = json.loads(Path(input_path).read_text(encoding="utf-8"))
    rows = data["box_audit"]
    cache: dict[tuple[int, int], tuple[np.ndarray, np.ndarray]] = {}
    certified_rows = []
    for row in rows:
        key = (int(row["nmax"]), int(row["bg_kmax"]))
        if key not in cache:
            print(f"Construindo centros para nmax={key[0]}, K={key[1]}")
            cache[key] = build_c2_centers(*key)
        print(f"Certificando {row['profile_name']} target={float(row['target_t']):.3f}")
        centers, ks = cache[key]
        certified_rows.append(certify_one_box(
            row=row,
            centers=centers,
            ks=ks,
            max_samples=max_samples,
            start_samples=start_samples,
            precision=precision,
            chunk=chunk,
            workers=workers,
        ))

    return {
        "metadata": {
            "input": input_path,
            "certify_samples": int(max_samples),
            "certify_start_samples": int(start_samples),
            "certify_precision": int(precision),
            "chunk": int(chunk),
            "workers": int(workers),
            "rows_count": len(certified_rows),
        },
        "certified_boxes": certified_rows,
    }


def write_certification_outputs(payload: dict, out_csv: str | None, out_json: str | None):
    if out_json:
        with open(out_json, "w", encoding="utf-8") as f:
            json.dump(payload, f, indent=2, sort_keys=True)

    if out_csv:
        fieldnames = [
            "profile_name",
            "nmax",
            "bg_kmax",
            "x_mode",
            "x_cut",
            "target_t",
            "box_center_t",
            "sigma_center",
            "sigma_radius",
            "t_radius",
            "certify_precision",
            "certify_samples",
            "boundary_min_sample",
            "boundary_min_sigma",
            "boundary_min_t",
            "derivative_upper",
            "step_size",
            "interpolation_error_bound",
            "certified_boundary_margin",
            "raw_winding",
            "rounded_winding",
            "total_arg_variation",
            "status",
            "sample_schedule",
        ]
        with open(out_csv, "w", newline="", encoding="utf-8") as f:
            writer = csv.DictWriter(f, fieldnames=fieldnames)
            writer.writeheader()
            writer.writerows(payload["certified_boxes"])


def crude_integral_tail_bound(nmax: int, x_cut: float, sigma_min: float) -> float:
    if nmax <= 1:
        raise ValueError("tail lift exige nmax > 1")
    if x_cut <= 0:
        raise ValueError("tail lift exige X > 0")
    if sigma_min <= 0:
        raise ValueError("tail lift exige sigma_min > 0")

    lower = float(nmax - 1)
    a = lower / float(x_cut)
    if a <= 0:
        raise ValueError("tail lift exige (nmax - 1) / X > 0")

    # For u >= a, u^(-sigma) <= a^(-sigma), and
    # integral_a^inf exp(-u^2) du <= exp(-a^2) / (2a).
    gaussian_tail = math.exp(-(a ** 2)) / (2.0 * a)
    integral_upper = (float(x_cut) ** (1.0 - sigma_min)) * (a ** (-sigma_min)) * gaussian_tail
    return 0.5 * integral_upper


def run_tail_lift(input_path: str, sigma_min_arg: float | None, method: str) -> dict:
    if method != "crude_integral":
        raise ValueError(f"Metodo de tail lift nao suportado: {method}")

    data = json.loads(Path(input_path).read_text(encoding="utf-8"))
    rows = data.get("certified_boxes")
    if rows is None:
        raise ValueError("--tail-input deve apontar para JSON de certificacao com certified_boxes")

    output_rows = []
    for row in rows:
        sigma_min = (
            float(sigma_min_arg)
            if sigma_min_arg is not None
            else float(row["sigma_center"]) - float(row["sigma_radius"])
        )
        nmax = int(row["nmax"])
        x_cut = float(row["x_cut"])
        margin = float(row["certified_boundary_margin"])
        tail = crude_integral_tail_bound(nmax=nmax, x_cut=x_cut, sigma_min=sigma_min)
        margin_minus_tail = margin - tail
        ratio = tail / margin if margin > 0 else math.inf
        output_rows.append({
            "profile_name": row["profile_name"],
            "target_t": float(row["target_t"]),
            "nmax": nmax,
            "bg_kmax": int(row["bg_kmax"]),
            "x_cut": x_cut,
            "sigma_min": sigma_min,
            "certified_boundary_margin": margin,
            "tail_method": method,
            "tail_bound": tail,
            "margin_minus_tail": margin_minus_tail,
            "tail_to_margin_ratio": ratio,
            "finite_box_status": row["status"],
            "lift_status": (
                "finite_to_infinite_lift_pass"
                if row["status"] == "certified_finite_zero_box" and tail < margin
                else "lift_failed"
            ),
        })

    return {
        "metadata": {
            "input": input_path,
            "tail_method": method,
            "tail_sigma_min": sigma_min_arg,
            "rows_count": len(output_rows),
            "tail_formula": (
                "0.5 * integral_{nmax-1}^inf x^(-sigma_min) "
                "* exp(-(x/X)^2) dx, bounded by gaussian tail"
            ),
        },
        "tail_lift": output_rows,
    }


def write_tail_lift_outputs(payload: dict, out_csv: str | None, out_json: str | None):
    if out_json:
        with open(out_json, "w", encoding="utf-8") as f:
            json.dump(payload, f, indent=2, sort_keys=True)

    if out_csv:
        fieldnames = [
            "profile_name",
            "target_t",
            "nmax",
            "bg_kmax",
            "x_cut",
            "sigma_min",
            "certified_boundary_margin",
            "tail_method",
            "tail_bound",
            "margin_minus_tail",
            "tail_to_margin_ratio",
            "finite_box_status",
            "lift_status",
        ]
        with open(out_csv, "w", newline="", encoding="utf-8") as f:
            writer = csv.DictWriter(f, fieldnames=fieldnames)
            writer.writeheader()
            writer.writerows(payload["tail_lift"])


def main():
    parser = argparse.ArgumentParser()

    parser.add_argument("--nmax", type=int, default=200_000)
    parser.add_argument("--sigma", type=float, default=0.5)
    parser.add_argument("--bg-kmax", type=int, default=5)
    parser.add_argument("--full-depth-cutoff", action="store_true",
                        help="Usa bg_kmax = floor(log2(nmax - 1))")

    parser.add_argument("--x-factor", type=float, default=3.0)
    parser.add_argument("--x-fixed", type=float, default=None,
                        help="Usa X fixo em vez de X = nmax/x_factor")
    parser.add_argument("--tmin", type=float, default=10.0)
    parser.add_argument("--tmax", type=float, default=50.0)
    parser.add_argument("--dt", type=float, default=0.001)
    
    parser.add_argument("--threshold", type=float, default=0.01,
                        help="Corte para descartar falsos mínimos de |C(t)| (padrão: 0.01)")

    parser.add_argument("--chunk", type=int, default=128)
    parser.add_argument("--workers", type=int, default=0,
                        help="Threads para eval_center_channel (0 = todos os CPUs)")
    parser.add_argument("--top", type=int, default=40)
    parser.add_argument("--out-csv", type=str, default=None,
                        help="Salva mínimos locais e metadados em CSV")
    parser.add_argument("--out-json", type=str, default=None,
                        help="Salva metadados e mínimos locais/filtrados em JSON")
    parser.add_argument("--profile-name", type=str, default=None,
                        help="Nome do perfil salvo no CSV/JSON")
    parser.add_argument("--refine", action="store_true",
                        help="Refina mínimos em janelas locais em vez de fazer scan global")
    parser.add_argument("--refine-window", type=float, default=0.02,
                        help="Semi-largura da janela local de refinamento")
    parser.add_argument("--refine-dt", type=float, default=0.00001,
                        help="Passo do grid local de refinamento")
    parser.add_argument("--refine-targets", type=str, default="",
                        help="Lista separada por vírgulas dos t alvo")
    parser.add_argument("--refine-from-json", type=str, default=None,
                        help="Diretório/JSON/CSV com refinamentos prévios para micro-refinar")
    parser.add_argument("--micro-window", type=float, default=0.002,
                        help="Semi-largura da janela de micro-refinamento")
    parser.add_argument("--micro-dt", type=float, default=0.000001,
                        help="Passo do grid de micro-refinamento")
    parser.add_argument("--micro-targets", type=str, default="",
                        help="Targets a micro-refinar, separados por vírgula")
    parser.add_argument("--complex-audit", type=str, default=None,
                        help="Diretório/JSON/CSV com refinamentos prévios para auditar geometria complexa")
    parser.add_argument("--complex-window", type=float, default=0.002,
                        help="Semi-largura da janela de auditoria complexa")
    parser.add_argument("--complex-dt", type=float, default=0.000001,
                        help="Passo do grid de auditoria complexa")
    parser.add_argument("--complex-targets", type=str, default="",
                        help="Targets da auditoria complexa, separados por vírgula")
    parser.add_argument("--box-audit", nargs="?", const="audit_outputs/c2_center_gaussian_local_refinement",
                        default=None,
                        help="Diretório/JSON/CSV com refinamentos prévios para auditoria 2D de caixas")
    parser.add_argument("--box-targets", type=str, default="",
                        help="Targets da auditoria de caixas, separados por vírgula")
    parser.add_argument("--box-profiles", type=str, default="",
                        help="Perfis da auditoria de caixas, separados por vírgula")
    parser.add_argument("--sigma-center", type=float, default=0.5)
    parser.add_argument("--sigma-radius", type=float, default=0.002)
    parser.add_argument("--t-radius", type=float, default=0.002)
    parser.add_argument("--box-samples", type=int, default=400,
                        help="Amostras por lado da borda da caixa")
    parser.add_argument("--box-interior-samples", type=int, default=0,
                        help="Grid interno opcional por eixo; 0 desativa")
    parser.add_argument("--box-boundary-threshold", type=float, default=1e-4)
    parser.add_argument("--box-interior-threshold", type=float, default=1e-4)
    parser.add_argument("--certify-boxes", action="store_true",
                        help="Certifica semi-rigorosamente as bordas de caixas ja auditadas")
    parser.add_argument("--certify-input", type=str, default=None,
                        help="JSON de entrada produzido por --box-audit")
    parser.add_argument("--certify-samples", type=int, default=2000,
                        help="Maximo de amostras por lado para certificacao")
    parser.add_argument("--certify-start-samples", type=int, default=400,
                        help="Amostras iniciais por lado antes de subdividir")
    parser.add_argument("--certify-precision", type=int, default=80,
                        help="Precisao alvo registrada para auditoria")
    parser.add_argument("--tail-lift", action="store_true",
                        help="Compara margem finita certificada com cota de cauda")
    parser.add_argument("--tail-input", type=str, default=None,
                        help="JSON produzido por certificacao de caixas")
    parser.add_argument("--tail-sigma-min", type=float, default=None,
                        help="sigma_min usado na cota da cauda; se omitido, usa sigma_center - sigma_radius")
    parser.add_argument("--tail-method", type=str, default="crude_integral",
                        choices=["crude_integral"],
                        help="Metodo para majorar a cauda")

    args = parser.parse_args()
    if args.full_depth_cutoff:
        args.bg_kmax = full_depth_kmax(args.nmax)

    if args.tail_lift:
        if not args.tail_input:
            raise SystemExit("--tail-lift exige --tail-input")
        print("=== C2 CENTER TAIL LIFT ===")
        print(f"input:                {args.tail_input}")
        print(f"method:               {args.tail_method}")
        print(f"sigma_min:            {args.tail_sigma_min if args.tail_sigma_min is not None else 'box sigma_center - sigma_radius'}")
        payload = run_tail_lift(
            input_path=args.tail_input,
            sigma_min_arg=args.tail_sigma_min,
            method=args.tail_method,
        )
        write_tail_lift_outputs(payload, args.out_csv, args.out_json)
        if args.out_csv:
            print(f"\nCSV salvo em:          {args.out_csv}")
        if args.out_json:
            print(f"JSON salvo em:         {args.out_json}")
        return

    if args.certify_boxes:
        if not args.certify_input:
            raise SystemExit("--certify-boxes exige --certify-input")
        print("=== C2 CENTER ZERO BOX CERTIFICATION ===")
        print(f"input:                {args.certify_input}")
        print(f"max samples:          {args.certify_samples}")
        print(f"start samples:        {args.certify_start_samples}")
        print(f"precision:            {args.certify_precision}")
        payload = run_box_certification(
            input_path=args.certify_input,
            max_samples=args.certify_samples,
            start_samples=args.certify_start_samples,
            precision=args.certify_precision,
            chunk=args.chunk,
            workers=args.workers,
        )
        write_certification_outputs(payload, args.out_csv, args.out_json)
        if args.out_csv:
            print(f"\nCSV salvo em:          {args.out_csv}")
        if args.out_json:
            print(f"JSON salvo em:         {args.out_json}")
        return

    if args.box_audit:
        targets = parse_refine_targets(args.box_targets)
        profiles = _parse_csv_set(args.box_profiles)
        print("=== C2 CENTER ZERO BOX AUDIT ===")
        print(f"source:               {args.box_audit}")
        print(f"targets:              {targets if targets else 'todos'}")
        print(f"profiles:             {sorted(profiles) if profiles else 'todos'}")
        print(f"sigma center/radius:  {args.sigma_center} / {args.sigma_radius}")
        print(f"t radius:             {args.t_radius}")
        print(f"box samples:          {args.box_samples}")
        print(f"interior samples:     {args.box_interior_samples}")
        payload = run_box_audit(
            source=args.box_audit,
            targets=targets,
            profiles=profiles,
            sigma_center=args.sigma_center,
            sigma_radius=args.sigma_radius,
            t_radius=args.t_radius,
            box_samples=args.box_samples,
            interior_samples=args.box_interior_samples,
            boundary_threshold=args.box_boundary_threshold,
            interior_threshold=args.box_interior_threshold,
            chunk=args.chunk,
            workers=args.workers,
        )
        write_box_outputs(payload, args.out_csv, args.out_json)
        if args.out_csv:
            print(f"\nCSV salvo em:          {args.out_csv}")
        if args.out_json:
            print(f"JSON salvo em:         {args.out_json}")
        return

    if args.complex_audit:
        targets = parse_refine_targets(args.complex_targets)
        print("=== C2 CENTER COMPLEX GEOMETRY AUDIT ===")
        print(f"source:               {args.complex_audit}")
        print(f"complex window:       {args.complex_window}")
        print(f"complex dt:           {args.complex_dt}")
        print(f"targets:              {targets if targets else 'todos'}")
        payload = run_complex_audit(
            source=args.complex_audit,
            targets=targets,
            window=args.complex_window,
            dt=args.complex_dt,
            chunk=args.chunk,
            workers=args.workers,
        )
        write_complex_outputs(payload, args.out_csv, args.out_json)
        if args.out_csv:
            print(f"\nCSV salvo em:          {args.out_csv}")
        if args.out_json:
            print(f"JSON salvo em:         {args.out_json}")
        return

    if args.refine_from_json:
        targets = parse_refine_targets(args.micro_targets)
        print("=== C2 CENTER MICRO REFINEMENT ===")
        print(f"source:               {args.refine_from_json}")
        print(f"micro window:         {args.micro_window}")
        print(f"micro dt:             {args.micro_dt}")
        print(f"targets:              {targets if targets else 'todos'}")
        payload = run_micro_refinement(
            source=args.refine_from_json,
            targets=targets,
            window=args.micro_window,
            dt=args.micro_dt,
            chunk=args.chunk,
            workers=args.workers,
        )
        write_micro_outputs(payload, args.out_csv, args.out_json)
        if args.out_csv:
            print(f"\nCSV salvo em:          {args.out_csv}")
        if args.out_json:
            print(f"JSON salvo em:         {args.out_json}")
        return

    if args.profile_name is None:
        if args.x_fixed is None:
            args.profile_name = f"dyn_n{args.nmax}_k{args.bg_kmax}_xf{args.x_factor:g}"
        else:
            args.profile_name = f"fixedX_n{args.nmax}_k{args.bg_kmax}_X{args.x_fixed:g}"

    tmax = args.tmax
    if tmax <= args.tmin:
        tmax = args.tmin + 40.0  # fallback caso o usuário passe um tmax menor ou igual ao tmin

    x_cut = args.x_fixed if args.x_fixed is not None else args.nmax / args.x_factor
    x_mode = "fixed" if args.x_fixed is not None else "nmax/x_factor"

    print("=== C2 CENTER MINIMAL ===")
    print(f"nmax:                 {args.nmax}")
    print(f"sigma:                {args.sigma}")
    print(f"bg_kmax:              {args.bg_kmax}")
    print(f"profile:              {args.profile_name}")
    print(f"X mode:               {x_mode}")
    print(f"X:                    {x_cut}")
    if args.refine:
        print(f"refine window:        {args.refine_window}")
        print(f"refine dt:            {args.refine_dt}")
    else:
        print(f"scan:                 [{args.tmin}, {tmax}]")
        print(f"dt:                   {args.dt}")
    print(f"threshold:            {args.threshold}")

    print("\nConstruindo centros c = 2^k m...")
    centers, ks = build_c2_centers(args.nmax, args.bg_kmax)

    print(f"centros:              {len(centers):,}")
    print(f"k min/max:            {int(np.min(ks))}/{int(np.max(ks))}")

    if args.refine:
        targets = parse_refine_targets(args.refine_targets)
        print("\nRefinando janelas locais...")
        refined_rows = refine_targets(
            targets=targets,
            centers=centers,
            ks=ks,
            sigma=args.sigma,
            x_cut=x_cut,
            window=args.refine_window,
            dt=args.refine_dt,
            chunk=args.chunk,
            workers=args.workers,
        )
        print_refine_report(refined_rows)
        payload = build_refine_payload(
            args=args,
            x_cut=x_cut,
            x_mode=x_mode,
            centers=centers,
            ks=ks,
            refined_rows=refined_rows,
        )
        write_outputs(payload, args.out_csv, args.out_json)
        if args.out_csv:
            print(f"\nCSV salvo em:          {args.out_csv}")
        if args.out_json:
            print(f"JSON salvo em:         {args.out_json}")
        return

    t_grid = np.arange(args.tmin, tmax + 0.5 * args.dt, args.dt, dtype=np.float64)

    print("\nCalculando C(t)...")
    C = eval_center_channel(
        t_grid=t_grid,
        centers=centers,
        ks=ks,
        sigma=args.sigma,
        x_cut=x_cut,
        chunk=args.chunk,
        workers=args.workers,
    )

    abs_c = np.abs(C)
    minima_idx = local_minima(abs_c)
    
    # Aplica o threshold
    filtered_idx = minima_idx[abs_c[minima_idx] < args.threshold]

    print_report(
        t_grid=t_grid,
        abs_c=abs_c,
        minima_idx=minima_idx,
        filtered_idx=filtered_idx,
        threshold=args.threshold,
        top=args.top,
    )

    payload = build_result_payload(
        args=args,
        x_cut=x_cut,
        x_mode=x_mode,
        t_grid=t_grid,
        centers=centers,
        ks=ks,
        abs_c=abs_c,
        minima_idx=minima_idx,
        filtered_idx=filtered_idx,
    )
    write_outputs(payload, args.out_csv, args.out_json)
    if args.out_csv:
        print(f"\nCSV salvo em:          {args.out_csv}")
    if args.out_json:
        print(f"JSON salvo em:         {args.out_json}")


if __name__ == "__main__":
    main()
