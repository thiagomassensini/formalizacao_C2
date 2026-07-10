#!/usr/bin/env python3
"""
Strict sentinel checker for raw projected-j0 sector subbox rectangles.

The checker reads stored subbox rectangles and recomputes selected subboxes
with an independent mpmath.iv implementation. It compares raw rectangles for
M, D0, Drest, and RvecTail without importing the sector certifier or evaluator.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import math
import subprocess
import sys
import time
from collections import Counter, defaultdict
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Iterable

try:
    import mpmath as mp
except ImportError as exc:  # pragma: no cover
    raise SystemExit("Install mpmath first: pip install mpmath") from exc


LOG2 = math.log(2.0)


@dataclass(frozen=True)
class CRect:
    re_lower: float
    re_upper: float
    im_lower: float
    im_upper: float


@dataclass(frozen=True)
class IRect:
    re: Any
    im: Any


@dataclass(frozen=True)
class TermData:
    addresses: list[float]
    coeffs: list[float]


def file_sha256(path: Path) -> str | None:
    if not path.exists():
        return None
    h = hashlib.sha256()
    with path.open("rb") as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b""):
            h.update(chunk)
    return h.hexdigest()


def git_head() -> str | None:
    try:
        out = subprocess.check_output(
            ["git", "rev-parse", "HEAD"],
            cwd=Path(__file__).resolve().parents[1],
            stderr=subprocess.DEVNULL,
            text=True,
        )
    except Exception:
        return None
    return out.strip()


def regularized_weight(mode: str, address: float, x_scale: float, p: int) -> float:
    if mode == "raw":
        return 1.0
    if x_scale <= 0.0:
        raise ValueError("regularization scale must be positive")
    if mode == "exponential":
        return math.exp(-(address / x_scale))
    if mode == "supergaussian":
        if p < 1:
            raise ValueError("regularization p must be at least 1")
        return math.exp(-((address / x_scale) ** p))
    raise ValueError(f"unknown mode: {mode}")


def odd_addresses(m_max: int) -> Iterable[float]:
    return (float(n) for n in range(1, int(m_max) + 1, 2))


def build_odd_data(m_max: int, mode: str, x_scale: float, p: int) -> TermData:
    addresses: list[float] = []
    coeffs: list[float] = []
    for address in odd_addresses(m_max):
        coeff = regularized_weight(mode, address, x_scale, p)
        if coeff != 0.0:
            addresses.append(address)
            coeffs.append(coeff)
    return TermData(addresses, coeffs)


def build_central_data(k_max: int, m_max: int, mode: str, x_scale: float, p: int) -> TermData:
    addresses: list[float] = []
    coeffs: list[float] = []
    odds = list(odd_addresses(m_max))
    for k in range(2, int(k_max) + 1):
        depth = float(1 << k)
        base_coeff = 2.0 * math.ldexp(1.0, -k)
        for odd in odds:
            address = depth * odd
            coeff = base_coeff * regularized_weight(mode, address, x_scale, p)
            if coeff != 0.0:
                addresses.append(address)
                coeffs.append(coeff)
    return TermData(addresses, coeffs)


def iv_interval(lower: float, upper: float | None = None) -> Any:
    if upper is None:
        upper = lower
    return mp.iv.mpf([str(float(lower)), str(float(upper))])


def izero() -> IRect:
    return IRect(iv_interval(0.0), iv_interval(0.0))


def ireal(value: float) -> IRect:
    return IRect(iv_interval(value), iv_interval(0.0))


def iadd(a: IRect, b: IRect) -> IRect:
    return IRect(a.re + b.re, a.im + b.im)


def ineg(a: IRect) -> IRect:
    return IRect(-a.re, -a.im)


def isub(a: IRect, b: IRect) -> IRect:
    return iadd(a, ineg(b))


def imul(a: IRect, b: IRect) -> IRect:
    return IRect(a.re * b.re - a.im * b.im, a.re * b.im + a.im * b.re)


def iscale(a: IRect, k: float) -> IRect:
    kk = iv_interval(k)
    return IRect(a.re * kk, a.im * kk)


def iconj(a: IRect) -> IRect:
    return IRect(a.re, -a.im)


def iinv(a: IRect) -> IRect:
    denom = a.re * a.re + a.im * a.im
    return IRect(a.re / denom, -a.im / denom)


def idiv(a: IRect, b: IRect) -> IRect:
    return imul(a, iinv(b))


def ipow(a: IRect, n: int) -> IRect:
    if n == 0:
        return ireal(1.0)
    out = a
    for _ in range(1, int(n)):
        out = imul(out, a)
    return out


def term_sum_strict(data: TermData, sigma_min: float, sigma_max: float, t_min: float, t_max: float) -> IRect:
    if not data.addresses:
        return izero()
    sigma = iv_interval(sigma_min, sigma_max)
    t = iv_interval(t_min, t_max)
    re = iv_interval(0.0)
    im = iv_interval(0.0)
    for address, coeff in zip(data.addresses, data.coeffs):
        addr = iv_interval(address)
        log_addr = mp.iv.log(addr)
        coeff_iv = iv_interval(coeff)
        amp = coeff_iv * mp.iv.exp(-sigma * log_addr)
        theta = t * log_addr
        re += amp * mp.iv.cos(theta)
        im += -amp * mp.iv.sin(theta)
    return IRect(re, im)


def q_rect(sigma_min: float, sigma_max: float, t_min: float, t_max: float) -> IRect:
    return term_sum_strict(TermData([2.0], [0.5]), sigma_min, sigma_max, t_min, t_max)


def interval_to_bounds(x: Any) -> tuple[float, float]:
    return float(x.a), float(x.b)


def inflate_bounds(lower: float, upper: float, inflate: float) -> tuple[float, float]:
    width = max(abs(lower), abs(upper), 1.0)
    pad = width * max(float(inflate), 0.0) + 8.0 * math.ulp(1.0) * width
    return math.nextafter(lower - pad, -math.inf), math.nextafter(upper + pad, math.inf)


def irect_to_crect(rect: IRect, inflate: float) -> CRect:
    re_lower, re_upper = interval_to_bounds(rect.re)
    im_lower, im_upper = interval_to_bounds(rect.im)
    re_lower, re_upper = inflate_bounds(re_lower, re_upper, inflate)
    im_lower, im_upper = inflate_bounds(im_lower, im_upper, inflate)
    return CRect(re_lower, re_upper, im_lower, im_upper)


def read_stored_rect(row: dict[str, Any], prefix: str) -> CRect:
    return CRect(
        float(row[f"{prefix}_re_lower"]),
        float(row[f"{prefix}_re_upper"]),
        float(row[f"{prefix}_im_lower"]),
        float(row[f"{prefix}_im_upper"]),
    )


def width(lower: float, upper: float) -> float:
    return max(0.0, float(upper) - float(lower))


def interval_contains(outer_lower: float, outer_upper: float, inner_lower: float, inner_upper: float, tol: float) -> bool:
    return outer_lower <= inner_lower + tol and outer_upper + tol >= inner_upper


def interval_overlaps(a_lower: float, a_upper: float, b_lower: float, b_upper: float, tol: float) -> bool:
    return max(a_lower, b_lower) <= min(a_upper, b_upper) + tol


def compare_rect(stored: CRect, recomputed: CRect, tol: float) -> tuple[bool, bool, str, float, float]:
    contains_re = interval_contains(stored.re_lower, stored.re_upper, recomputed.re_lower, recomputed.re_upper, tol)
    contains_im = interval_contains(stored.im_lower, stored.im_upper, recomputed.im_lower, recomputed.im_upper, tol)
    contains = contains_re and contains_im
    overlaps_re = interval_overlaps(stored.re_lower, stored.re_upper, recomputed.re_lower, recomputed.re_upper, tol)
    overlaps_im = interval_overlaps(stored.im_lower, stored.im_upper, recomputed.im_lower, recomputed.im_upper, tol)
    overlaps = overlaps_re and overlaps_im

    stored_re_width = width(stored.re_lower, stored.re_upper)
    stored_im_width = width(stored.im_lower, stored.im_upper)
    recomputed_re_width = width(recomputed.re_lower, recomputed.re_upper)
    recomputed_im_width = width(recomputed.im_lower, recomputed.im_upper)
    ratio_re = math.inf if stored_re_width == 0.0 and recomputed_re_width > 0.0 else (
        1.0 if stored_re_width == 0.0 else recomputed_re_width / stored_re_width
    )
    ratio_im = math.inf if stored_im_width == 0.0 and recomputed_im_width > 0.0 else (
        1.0 if stored_im_width == 0.0 else recomputed_im_width / stored_im_width
    )

    if contains:
        status = "contains"
    elif not overlaps:
        status = "disjoint_fail"
    elif ratio_re > 1.0 or ratio_im > 1.0:
        status = "strict_wider"
    else:
        status = "inconclusive"
    return contains, overlaps, status, ratio_re, ratio_im


def jsonable(value: Any) -> Any:
    if isinstance(value, float):
        if math.isnan(value):
            return "nan"
        if math.isinf(value):
            return "inf" if value > 0 else "-inf"
    if isinstance(value, Path):
        return str(value)
    return value


def load_jsonl(path: Path) -> list[dict[str, Any]]:
    rows: list[dict[str, Any]] = []
    with path.open() as f:
        for line in f:
            line = line.strip()
            if line:
                rows.append(json.loads(line))
    return rows


def select_subboxes(rows: list[dict[str, Any]], boxes: list[str], max_per_box: int | None) -> list[dict[str, Any]]:
    wanted = set(boxes)
    by_box: dict[str, list[dict[str, Any]]] = defaultdict(list)
    for row in rows:
        box_id = str(row["source_box_id"])
        if not wanted or box_id in wanted:
            by_box[box_id].append(row)
    selected: list[dict[str, Any]] = []
    for box_id in boxes:
        candidates = sorted(
            by_box.get(box_id, []),
            key=lambda row: (float(row.get("D0NegReMain_upper", -math.inf)), -float(row["t_min"])),
            reverse=True,
        )
        if max_per_box is not None:
            candidates = candidates[: max(0, int(max_per_box))]
        selected.extend(candidates)
    return selected


def build_context(params: dict[str, Any]) -> dict[str, TermData]:
    odd_ref_m = params.get("odd_ref_M") or params["ref_M"]
    odd_ref_x = params.get("odd_reference_X") or params["reference_X"]
    odd_ref_p = params.get("odd_reference_p") or params["reference_p"]
    target_x = params.get("target_reference_X") or params["reference_X"]
    target_p = params.get("target_reference_p") or params["reference_p"]
    return {
        "odd_core": build_odd_data(int(params["M"]), "raw", float(params["reference_X"]), int(params["reference_p"])),
        "odd_ref": build_odd_data(int(odd_ref_m), str(params["odd_reference_mode"]), float(odd_ref_x), int(odd_ref_p)),
        "target": build_central_data(int(params["K"]), int(params["M"]), str(params["target_reference_mode"]), float(target_x), int(target_p)),
        "central_ref": build_central_data(int(params["ref_K"]), int(params["ref_M"]), str(params["reference_mode"]), float(params["reference_X"]), int(params["reference_p"])),
    }


def eval_raw_rectangles(ctx: dict[str, TermData], row: dict[str, Any]) -> dict[str, IRect]:
    sigma_min = float(row["sigma_min"])
    sigma_max = float(row["sigma_max"])
    t_min = float(row["t_min"])
    t_max = float(row["t_max"])

    odd_core = term_sum_strict(ctx["odd_core"], sigma_min, sigma_max, t_min, t_max)
    odd_ref = term_sum_strict(ctx["odd_ref"], sigma_min, sigma_max, t_min, t_max)
    horizontal_delta = isub(odd_core, odd_ref)

    target_rect = term_sum_strict(ctx["target"], sigma_min, sigma_max, t_min, t_max)
    central_ref = term_sum_strict(ctx["central_ref"], sigma_min, sigma_max, t_min, t_max)

    q = q_rect(sigma_min, sigma_max, t_min, t_max)
    one_minus_q = isub(ireal(1.0), q)
    q2 = ipow(q, 2)
    q3 = imul(q2, q)
    q4 = imul(q3, q)
    q5 = imul(q4, q)
    q6 = imul(q5, q)

    vertical_depth_tail_from_two = idiv(q2, one_minus_q)
    vertical_rectangular_residual = iadd(
        iadd(vertical_depth_tail_from_two, target_rect),
        iscale(central_ref, -2.0),
    )
    q2_over_one_minus_q = idiv(q2, one_minus_q)
    horizontal_defect_seed = iscale(imul(q2_over_one_minus_q, horizontal_delta), 2.0)
    seed = imul(
        ineg(iadd(vertical_rectangular_residual, horizontal_defect_seed)),
        one_minus_q,
    )

    prefix = iadd(iadd(ireal(1.0), q), iadd(q2, q3))
    main = imul(iadd(q2, seed), prefix)

    d0 = iscale(imul(q2, horizontal_delta), 2.0)
    d1 = iscale(imul(q3, horizontal_delta), 2.0)
    d2 = iscale(imul(q4, horizontal_delta), 2.0)
    d3 = iscale(imul(q5, horizontal_delta), 2.0)
    drest = iadd(iadd(d1, d2), d3)

    vertical_tail = idiv(q6, one_minus_q)
    tilt_tail = imul(seed, idiv(q4, one_minus_q))
    horizontal_tail = iscale(imul(idiv(q6, one_minus_q), horizontal_delta), 2.0)
    cutoff = isub(target_rect, central_ref)
    rvec_tail = iadd(iadd(vertical_tail, tilt_tail), iadd(horizontal_tail, cutoff))

    return {"M": main, "D0": d0, "Drest": drest, "RvecTail": rvec_tail}


def compare_subbox(
    row: dict[str, Any],
    recomputed: dict[str, IRect],
    objects: list[str],
    inflate: float,
    tolerance: float,
) -> list[dict[str, Any]]:
    out: list[dict[str, Any]] = []
    for obj in objects:
        stored = read_stored_rect(row, obj)
        rec = irect_to_crect(recomputed[obj], inflate)
        contains, overlaps, status, ratio_re, ratio_im = compare_rect(stored, rec, tolerance)
        out.append(
            {
                "box_id": row["source_box_id"],
                "subbox_id": row["subbox_id"],
                "object": obj,
                "stored_re_lower": stored.re_lower,
                "stored_re_upper": stored.re_upper,
                "stored_im_lower": stored.im_lower,
                "stored_im_upper": stored.im_upper,
                "recomputed_re_lower": rec.re_lower,
                "recomputed_re_upper": rec.re_upper,
                "recomputed_im_lower": rec.im_lower,
                "recomputed_im_upper": rec.im_upper,
                "contains_recomputed": contains,
                "overlaps_recomputed": overlaps,
                "status": status,
                "width_ratio_re": ratio_re,
                "width_ratio_im": ratio_im,
            }
        )
    return out


def write_markdown(path: Path, summary: dict[str, Any]) -> None:
    path.write_text(
        "# Audit Projected J0 Raw Enclosure Sentinel Check\n\n"
        "Rota: Genuine-First. Este checker recomputa retangulos strict para "
        "subcaixas sentinela e compara com os retangulos brutos armazenados no "
        "certificado por subcaixa. Ele nao recomputa a cadeia inteira.\n\n"
        "## Resultado\n\n"
        f"- Boxes checked: {summary['boxes_checked']}\n"
        f"- Subboxes checked: {summary['subboxes_checked']}\n"
        f"- Objects checked: {summary['objects_checked']}\n"
        f"- Contains: {summary['contains_count']}\n"
        f"- Strict wider: {summary['strict_wider_count']}\n"
        f"- Inconclusive: {summary['inconclusive_count']}\n"
        f"- Disjoint fail: {summary['disjoint_fail_count']}\n"
        f"- Max width ratio: {summary['max_width_ratio']}\n"
        f"- Worst subbox: `{summary['worst_subbox']}`\n"
        f"- Status: {summary['status']}\n\n"
        "## Leitura\n\n"
        "Status `contains` significa que o retangulo armazenado contem a "
        "recomputacao strict. Status `strict_wider` significa que a recomputacao "
        "strict e mais larga, mas ainda sobrepoe o retangulo armazenado. Isso e "
        "auditavel, mas nao prova containment do fast pelo strict. `disjoint_fail` "
        "seria contradicao relevante.\n\n"
        "## Limite\n\n"
        "Esta e uma auditoria sentinela. Ela fortalece a fronteira dos retangulos "
        "brutos nos boxes selecionados, mas nao certifica todas as 771 subcaixas.\n"
    )


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        description="Strict sentinel checker for raw projected-j0 subbox rectangles."
    )
    parser.add_argument("--subbox-cert-dir", type=Path, required=True)
    parser.add_argument("--boxes", type=str, required=True)
    parser.add_argument("--objects", type=str, default="M,D0")
    parser.add_argument("--mode", choices=["strict"], default="strict")
    parser.add_argument("--interval-dps", type=int, default=80)
    parser.add_argument("--inflate", type=float, default=1.0e-14)
    parser.add_argument("--tolerance", type=float, default=1.0e-12)
    parser.add_argument("--max-subboxes-per-box", type=int, default=None)
    parser.add_argument("--out-json", type=Path, required=True)
    parser.add_argument("--out-md", type=Path, required=True)
    return parser


def main() -> None:
    args = build_parser().parse_args()
    boxes = [x.strip() for x in args.boxes.split(",") if x.strip()]
    objects = [x.strip() for x in args.objects.split(",") if x.strip()]
    allowed = {"M", "D0", "Drest", "RvecTail"}
    bad = [obj for obj in objects if obj not in allowed]
    if bad:
        raise SystemExit(f"unknown objects: {bad}")
    if args.mode != "strict":
        raise SystemExit("only strict mode is supported")

    config_path = args.subbox_cert_dir / "config.json"
    subbox_path = args.subbox_cert_dir / "subboxes.jsonl"
    if not config_path.exists() or not subbox_path.exists():
        raise SystemExit("missing subbox certificate config.json or subboxes.jsonl")

    config = json.loads(config_path.read_text())
    rows = load_jsonl(subbox_path)
    selected = select_subboxes(rows, boxes, args.max_subboxes_per_box)
    if not selected:
        raise SystemExit("no subboxes selected")

    mp.iv.dps = int(args.interval_dps)
    params = config["parameters"]

    print("C2 projected-j0 raw enclosure sentinel checker")
    print("==============================================")
    print(f"boxes={boxes}")
    print(f"objects={objects}")
    print(f"selected_subboxes={len(selected)} mode={args.mode} dps={args.interval_dps}")
    print("building strict term context...")
    tic = time.time()
    ctx = build_context(params)
    print(
        "term_counts="
        f"odd_core:{len(ctx['odd_core'].addresses)}, odd_ref:{len(ctx['odd_ref'].addresses)}, "
        f"target:{len(ctx['target'].addresses)}, central_ref:{len(ctx['central_ref'].addresses)}"
    )

    rows_out: list[dict[str, Any]] = []
    for idx, row in enumerate(selected, 1):
        print(f"  [{idx}/{len(selected)}] {row['subbox_id']} recomputing strict rectangles")
        recomputed = eval_raw_rectangles(ctx, row)
        rows_out.extend(compare_subbox(row, recomputed, objects, float(args.inflate), float(args.tolerance)))

    elapsed = time.time() - tic
    counts = Counter(item["status"] for item in rows_out)
    max_ratio = 0.0
    worst_subbox = ""
    for item in rows_out:
        local = max(float(item["width_ratio_re"]), float(item["width_ratio_im"]))
        if local > max_ratio:
            max_ratio = local
            worst_subbox = f"{item['subbox_id']}:{item['object']}"
    disjoint = counts.get("disjoint_fail", 0)
    status = "pass" if disjoint == 0 else "failed"
    if disjoint == 0 and (counts.get("strict_wider", 0) or counts.get("inconclusive", 0)):
        status = "partial"

    summary = {
        "status": status,
        "elapsed_seconds": elapsed,
        "boxes_requested": boxes,
        "boxes_checked": len({row["source_box_id"] for row in selected}),
        "subboxes_checked": len(selected),
        "objects": objects,
        "objects_checked": len(rows_out),
        "contains_count": counts.get("contains", 0),
        "strict_wider_count": counts.get("strict_wider", 0),
        "inconclusive_count": counts.get("inconclusive", 0),
        "disjoint_fail_count": disjoint,
        "max_width_ratio": max_ratio,
        "worst_subbox": worst_subbox,
        "notes": (
            "strict_wider is not treated as failure; disjoint_fail is the hard failure"
        ),
        "parameters": {
            "mode": args.mode,
            "interval_dps": int(args.interval_dps),
            "inflate": float(args.inflate),
            "tolerance": float(args.tolerance),
            "max_subboxes_per_box": args.max_subboxes_per_box,
        },
        "hashes": {
            "script": file_sha256(Path(__file__)),
            "subbox_config": file_sha256(config_path),
            "subboxes": file_sha256(subbox_path),
        },
        "git_head": git_head(),
        "rows": rows_out,
        "command": sys.argv,
    }

    args.out_json.parent.mkdir(parents=True, exist_ok=True)
    args.out_json.write_text(json.dumps(summary, indent=2, sort_keys=True, default=jsonable) + "\n")
    write_markdown(args.out_md, summary)

    print("-" * 72)
    print(f"elapsed={elapsed:.2f}s status={status}")
    print(f"contains={summary['contains_count']} strict_wider={summary['strict_wider_count']} "
          f"inconclusive={summary['inconclusive_count']} disjoint={summary['disjoint_fail_count']}")
    print(f"JSON: {args.out_json}")
    print(f"MD: {args.out_md}")


if __name__ == "__main__":
    main()
