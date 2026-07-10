#!/usr/bin/env python3
"""
Batch strict checker for raw projected-j0 sector subbox rectangles.

This checker reads the positive-box sector subbox certificate and recomputes
selected raw rectangles with strict interval arithmetic. It is meant for the
critical M,D0 audit first; it does not import the sector certifier or evaluator.
It reuses only the independent sentinel-checker interval helpers.
"""

from __future__ import annotations

import argparse
import csv
import json
import math
import sys
import time
import traceback
from concurrent.futures import FIRST_COMPLETED, ProcessPoolExecutor, wait
from collections import Counter, defaultdict
from pathlib import Path
from typing import Any

try:
    import mpmath as mp
except ImportError as exc:  # pragma: no cover
    raise SystemExit("Install mpmath first: pip install mpmath") from exc

from c2_projected_j0_raw_enclosure_sentinel_checker import (
    IRect,
    compare_subbox,
    file_sha256,
    git_head,
    iadd,
    iconj,
    idiv,
    imul,
    ineg,
    interval_to_bounds,
    inflate_bounds,
    ipow,
    ireal,
    iscale,
    isub,
    jsonable,
    load_jsonl,
    q_rect,
    term_sum_strict,
    build_context,
    eval_raw_rectangles,
)


ROW_FIELDS = [
    "box_id",
    "subbox_id",
    "object",
    "stored_re_lower",
    "stored_re_upper",
    "stored_im_lower",
    "stored_im_upper",
    "recomputed_re_lower",
    "recomputed_re_upper",
    "recomputed_im_lower",
    "recomputed_im_upper",
    "contains_recomputed",
    "overlaps_recomputed",
    "status",
    "width_ratio_re",
    "width_ratio_im",
    "elapsed_sec",
    "d0_neg_re_upper_strict",
    "d0_neg_re_upper_stored",
    "d0_neg_re_upper_rat",
    "strict_sector_nondestructive",
]


def parse_list(value: str | None) -> list[str]:
    if not value:
        return []
    return [item.strip() for item in value.split(",") if item.strip()]


def bool_from_any(value: Any) -> bool:
    if isinstance(value, bool):
        return value
    if isinstance(value, str):
        return value.strip().lower() in {"true", "1", "yes", "y"}
    return bool(value)


def load_rationalized_d0_upper(pack_dir: Path) -> dict[str, float]:
    path = pack_dir / "boxes_sector_rationalized.csv"
    if not path.exists():
        return {}
    out: dict[str, float] = {}
    with path.open(newline="") as f:
        for row in csv.DictReader(f):
            out[str(row["source_box_id"])] = float(row["d0_neg_re_upper_rat"])
    return out


def select_rows(
    rows: list[dict[str, Any]],
    all_subboxes: bool,
    box_ids: list[str],
    start_index: int,
    max_subboxes: int | None,
) -> list[dict[str, Any]]:
    wanted = set(box_ids)
    if all_subboxes and wanted:
        selected = [row for row in rows if str(row["source_box_id"]) in wanted]
    elif all_subboxes:
        selected = list(rows)
    elif wanted:
        selected = [row for row in rows if str(row["source_box_id"]) in wanted]
    elif max_subboxes is not None:
        selected = list(rows)
    else:
        raise SystemExit("pass --all-subboxes or --box-id-list")

    selected = selected[max(0, int(start_index)) :]
    if max_subboxes is not None:
        selected = selected[: max(0, int(max_subboxes))]
    return sorted(
        selected,
        key=lambda row: (
            str(row["source_box_id"]),
            str(row["subbox_id"]),
            float(row.get("sigma_min", 0.0)),
            float(row.get("t_min", 0.0)),
        ),
    )


def eval_m_d0_rectangles(ctx: dict[str, Any], row: dict[str, Any]) -> dict[str, IRect]:
    """Recompute only the M and D0 raw rectangles.

    This mirrors the independent sentinel checker formula but skips the tail
    terms used only for Drest/RvecTail.
    """
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

    vertical_depth_tail_from_two = idiv(q2, one_minus_q)
    vertical_rectangular_residual = iadd(
        iadd(vertical_depth_tail_from_two, target_rect),
        iscale(central_ref, -2.0),
    )
    q2_over_one_minus_q = idiv(q2, one_minus_q)
    horizontal_defect_seed = iscale(imul(q2_over_one_minus_q, horizontal_delta), 2.0)
    seed = imul(ineg(iadd(vertical_rectangular_residual, horizontal_defect_seed)), one_minus_q)

    prefix = iadd(iadd(ireal(1.0), q), iadd(q2, q3))
    main = imul(iadd(q2, seed), prefix)
    d0 = iscale(imul(q2, horizontal_delta), 2.0)
    return {"M": main, "D0": d0}


def eval_selected_rectangles(ctx: dict[str, Any], row: dict[str, Any], objects: list[str]) -> dict[str, IRect]:
    if set(objects).issubset({"M", "D0"}):
        return eval_m_d0_rectangles(ctx, row)
    return eval_raw_rectangles(ctx, row)


def d0_neg_re_upper_from_rectangles(rects: dict[str, IRect], inflate: float) -> float | None:
    if "M" not in rects or "D0" not in rects:
        return None
    product = imul(rects["D0"], iconj(rects["M"]))
    lower, upper = interval_to_bounds(-product.re)
    _lower, upper = inflate_bounds(lower, upper, inflate)
    return upper


def write_rows_csv(path: Path, rows: list[dict[str, Any]]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=ROW_FIELDS, extrasaction="ignore")
        writer.writeheader()
        writer.writerows(rows)


def write_rows_csv_atomic(path: Path, rows: list[dict[str, Any]]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    tmp = path.with_name(f"{path.name}.tmp.{time.time_ns()}")
    with tmp.open("w", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=ROW_FIELDS, extrasaction="ignore")
        writer.writeheader()
        writer.writerows(rows)
    tmp.replace(path)


def load_batch_json(path: Path) -> tuple[list[dict[str, Any]], dict[str, Any]]:
    data = json.loads(path.read_text())
    return list(data.get("rows", [])), dict(data.get("summary", {}))


def batch_paths(out_dir: Path, batch_id: int) -> tuple[Path, Path, Path, Path]:
    csv_path = out_dir / f"batch_{batch_id:03d}.csv"
    json_path = out_dir / f"batch_{batch_id:03d}.json"
    done_path = out_dir / f"batch_{batch_id:03d}.done"
    failed_path = out_dir / f"batch_{batch_id:03d}.failed.json"
    return csv_path, json_path, done_path, failed_path


def batch_is_done(out_dir: Path, batch_id: int) -> bool:
    csv_path, json_path, done_path, _failed_path = batch_paths(out_dir, batch_id)
    return csv_path.exists() and json_path.exists() and done_path.exists()


def write_text_atomic(path: Path, text: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    tmp = path.with_name(f"{path.name}.tmp.{time.time_ns()}")
    tmp.write_text(text)
    tmp.replace(path)


def summarize_rows(
    rows: list[dict[str, Any]],
    selected_subbox_count: int,
    total_available_subboxes: int,
    elapsed_seconds: float,
    command: list[str],
    hashes: dict[str, Any],
    parameters: dict[str, Any],
) -> dict[str, Any]:
    counts = Counter(str(row["status"]) for row in rows)
    unique_subboxes = {(row["box_id"], row["subbox_id"]) for row in rows}
    unique_boxes = {row["box_id"] for row in rows}
    max_width_ratio = 0.0
    worst_subbox = ""
    for row in rows:
        local = max(float(row["width_ratio_re"]), float(row["width_ratio_im"]))
        if local > max_width_ratio:
            max_width_ratio = local
            worst_subbox = f"{row['subbox_id']}:{row['object']}"

    d0_by_subbox: dict[tuple[str, str], float] = {}
    d0_stored_by_subbox: dict[tuple[str, str], float] = {}
    d0_rat_by_box: dict[str, float] = {}
    for row in rows:
        value = row.get("d0_neg_re_upper_strict")
        if value in (None, ""):
            continue
        key = (str(row["box_id"]), str(row["subbox_id"]))
        d0_by_subbox[key] = float(value)
        stored = row.get("d0_neg_re_upper_stored")
        if stored not in (None, ""):
            d0_stored_by_subbox[key] = float(stored)
        rat = row.get("d0_neg_re_upper_rat")
        if rat not in (None, ""):
            d0_rat_by_box[str(row["box_id"])] = float(rat)

    d0_by_box: dict[str, float] = defaultdict(lambda: -math.inf)
    for (box_id, _subbox_id), value in d0_by_subbox.items():
        d0_by_box[box_id] = max(d0_by_box[box_id], value)

    max_d0_upper_strict = max(d0_by_subbox.values()) if d0_by_subbox else None
    max_d0_upper_stored = max(d0_stored_by_subbox.values()) if d0_stored_by_subbox else None
    max_d0_upper_rat = max(d0_rat_by_box.values()) if d0_rat_by_box else None
    worst_box_strict = None
    if d0_by_box:
        worst_box_strict = max(d0_by_box.items(), key=lambda item: item[1])[0]

    elapsed_per_subbox = elapsed_seconds / max(len(unique_subboxes), 1)
    estimated_total_seconds = elapsed_per_subbox * max(total_available_subboxes, 1)
    disjoint = counts.get("disjoint_fail", 0)
    if disjoint:
        status = "failed"
    elif len(unique_subboxes) < selected_subbox_count:
        status = "partial"
    elif counts.get("strict_wider", 0) or counts.get("inconclusive", 0):
        status = "partial"
    else:
        status = "pass"

    return {
        "status": status,
        "checks_passed": len(rows) - disjoint,
        "checks_failed": disjoint,
        "selected_subboxes": selected_subbox_count,
        "missing_subboxes": max(0, selected_subbox_count - len(unique_subboxes)),
        "total_available_subboxes": total_available_subboxes,
        "boxes_checked": len(unique_boxes),
        "subboxes_checked": len(unique_subboxes),
        "objects_checked": len(rows),
        "contains_count": counts.get("contains", 0),
        "strict_wider_count": counts.get("strict_wider", 0),
        "inconclusive_count": counts.get("inconclusive", 0),
        "disjoint_fail_count": disjoint,
        "max_width_ratio": max_width_ratio,
        "worst_subbox": worst_subbox,
        "elapsed_seconds": elapsed_seconds,
        "elapsed_seconds_per_subbox": elapsed_per_subbox,
        "estimated_seconds_for_all_available_subboxes": estimated_total_seconds,
        "d0_upper": {
            "subboxes_strict_nondestructive": sum(1 for value in d0_by_subbox.values() if value <= 0.0),
            "subboxes_with_d0_strict": len(d0_by_subbox),
            "boxes_strict_nondestructive": sum(1 for value in d0_by_box.values() if value <= 0.0),
            "boxes_with_d0_strict": len(d0_by_box),
            "max_d0_upper_strict": max_d0_upper_strict,
            "max_d0_upper_stored": max_d0_upper_stored,
            "max_d0_upper_rat": max_d0_upper_rat,
            "worst_box_strict": worst_box_strict,
        },
        "parameters": parameters,
        "hashes": hashes,
        "git_head": git_head(),
        "command": command,
    }


def batch_summary(rows: list[dict[str, Any]], batch_id: int, elapsed: float) -> dict[str, Any]:
    counts = Counter(str(row["status"]) for row in rows)
    return {
        "batch_id": batch_id,
        "rows": len(rows),
        "subboxes": len({(row["box_id"], row["subbox_id"]) for row in rows}),
        "objects": len(rows),
        "contains": counts.get("contains", 0),
        "strict_wider": counts.get("strict_wider", 0),
        "inconclusive": counts.get("inconclusive", 0),
        "disjoint_fail": counts.get("disjoint_fail", 0),
        "elapsed_seconds": elapsed,
    }


def process_batch(
    ctx: dict[str, Any],
    batch_rows: list[dict[str, Any]],
    objects: list[str],
    inflate: float,
    tolerance: float,
    rat_d0: dict[str, float],
    batch_id: int,
) -> tuple[list[dict[str, Any]], dict[str, Any]]:
    tic = time.time()
    out: list[dict[str, Any]] = []
    for idx, row in enumerate(batch_rows, 1):
        row_tic = time.time()
        print(
            f"  batch {batch_id:03d} [{idx}/{len(batch_rows)}] "
            f"{row['subbox_id']} recomputing {','.join(objects)}",
            flush=True,
        )
        rects = eval_selected_rectangles(ctx, row, objects)
        d0_upper = d0_neg_re_upper_from_rectangles(rects, inflate)
        compared = compare_subbox(row, rects, objects, inflate, tolerance)
        elapsed = time.time() - row_tic
        for item in compared:
            item["elapsed_sec"] = elapsed
            item["d0_neg_re_upper_strict"] = d0_upper
            item["d0_neg_re_upper_stored"] = float(row["D0NegReMain_upper"]) if d0_upper is not None else None
            item["d0_neg_re_upper_rat"] = rat_d0.get(str(row["source_box_id"]))
            item["strict_sector_nondestructive"] = (d0_upper <= 0.0) if d0_upper is not None else None
        out.extend(compared)
    return out, batch_summary(out, batch_id, time.time() - tic)


def process_batch_worker(payload: dict[str, Any]) -> tuple[int, list[dict[str, Any]], dict[str, Any]]:
    mp.iv.dps = int(payload["interval_dps"])
    ctx = build_context(payload["params"])
    rows_out, summary = process_batch(
        ctx,
        payload["batch_rows"],
        payload["objects"],
        float(payload["inflate"]),
        float(payload["tolerance"]),
        payload["rat_d0"],
        int(payload["batch_id"]),
    )
    return int(payload["batch_id"]), rows_out, summary


def write_batch(out_dir: Path, batch_id: int, rows: list[dict[str, Any]], summary: dict[str, Any]) -> None:
    out_dir.mkdir(parents=True, exist_ok=True)
    csv_path, json_path, done_path, failed_path = batch_paths(out_dir, batch_id)
    payload = {"done": True, "summary": summary, "rows": rows}
    write_rows_csv_atomic(csv_path, rows)
    write_text_atomic(
        json_path,
        json.dumps(payload, indent=2, sort_keys=True, default=jsonable) + "\n",
    )
    if failed_path.exists():
        failed_path.unlink()
    write_text_atomic(done_path, f"done {time.time()}\n")


def write_failed_batch(out_dir: Path, batch_id: int, exc: BaseException, subboxes: list[str]) -> None:
    _csv_path, _json_path, _done_path, failed_path = batch_paths(out_dir, batch_id)
    payload = {
        "done": False,
        "batch_id": batch_id,
        "exception": repr(exc),
        "traceback": traceback.format_exc(),
        "subboxes": subboxes,
        "created_at_unix": time.time(),
    }
    write_text_atomic(failed_path, json.dumps(payload, indent=2, sort_keys=True) + "\n")


def write_summary_csv(path: Path, rows: list[dict[str, Any]]) -> None:
    write_rows_csv(path, rows)


def write_summary_json(path: Path, summary: dict[str, Any], rows: list[dict[str, Any]]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    payload = dict(summary)
    payload["rows"] = rows
    path.write_text(json.dumps(payload, indent=2, sort_keys=True, default=jsonable) + "\n")


def write_markdown(path: Path, title: str, summary: dict[str, Any], note: str | None) -> None:
    d0 = summary.get("d0_upper", {})
    est = float(summary.get("estimated_seconds_for_all_available_subboxes", 0.0))
    path.write_text(
        f"# {title}\n\n"
        "Rota: Genuine-First. Este relatorio audita retangulos brutos por "
        "recomputacao strict independente para os objetos selecionados. O script "
        "nao importa o certifier setorial nem o evaluator; ele reaproveita apenas "
        "os helpers intervalares independentes do checker sentinela.\n\n"
        "## Resultado\n\n"
        f"- Status: `{summary.get('status')}`\n"
        f"- Boxes checados: {summary.get('boxes_checked')}\n"
        f"- Subcaixas checadas: {summary.get('subboxes_checked')}\n"
        f"- Objetos checados: {summary.get('objects_checked')}\n"
        f"- Contains: {summary.get('contains_count')}\n"
        f"- Strict wider: {summary.get('strict_wider_count')}\n"
        f"- Inconclusive: {summary.get('inconclusive_count')}\n"
        f"- Disjoint fail: {summary.get('disjoint_fail_count')}\n"
        f"- Max width ratio: {summary.get('max_width_ratio')}\n"
        f"- Worst subbox: `{summary.get('worst_subbox')}`\n"
        f"- Tempo total: {float(summary.get('elapsed_seconds', 0.0)):.2f}s\n"
        f"- Tempo por subcaixa: {float(summary.get('elapsed_seconds_per_subbox', 0.0)):.2f}s\n"
        f"- Estimativa para todas as subcaixas disponiveis: {est:.2f}s\n\n"
        "## Setor Recomputado M,D0\n\n"
        f"- Subcaixas com D0 upper strict: {d0.get('subboxes_with_d0_strict')}\n"
        f"- Subcaixas strict nondestructive: {d0.get('subboxes_strict_nondestructive')}\n"
        f"- Boxes com D0 upper strict: {d0.get('boxes_with_d0_strict')}\n"
        f"- Boxes strict nondestructive: {d0.get('boxes_strict_nondestructive')}\n"
        f"- Max D0NegReMain upper strict: {d0.get('max_d0_upper_strict')}\n"
        f"- Max D0NegReMain upper stored: {d0.get('max_d0_upper_stored')}\n"
        f"- Max D0NegReMain upper rationalized: {d0.get('max_d0_upper_rat')}\n"
        f"- Worst box strict: `{d0.get('worst_box_strict')}`\n\n"
        "## Leitura\n\n"
        "Status `contains` significa que o retangulo armazenado contem a "
        "recomputacao strict. Status `strict_wider` significa que a recomputacao "
        "strict ficou mais larga, mas ainda sobrepoe o retangulo armazenado. "
        "`disjoint_fail` seria a falha dura que suspende a cadeia.\n\n"
        + (f"## Nota\n\n{note}\n\n" if note else "")
        + "## Limite\n\n"
        "Esta auditoria recomputa retangulos brutos por modo strict, mas ainda "
        "permanece externa ao kernel Lean e nao formaliza as enclosures analiticas.\n"
    )


def make_batches(
    selected: list[dict[str, Any]],
    batch_size: int,
    start_index: int,
) -> list[tuple[int, list[dict[str, Any]]]]:
    out: list[tuple[int, list[dict[str, Any]]]] = []
    batch_size = max(1, int(batch_size))
    for offset in range(0, len(selected), batch_size):
        batch_rows = selected[offset : offset + batch_size]
        batch_id = (max(0, int(start_index)) + offset) // batch_size
        out.append((batch_id, batch_rows))
    return out


def load_existing_batch_rows(out_dir: Path, batches: list[tuple[int, list[dict[str, Any]]]]) -> list[dict[str, Any]]:
    rows: list[dict[str, Any]] = []
    for batch_id, _batch_rows in batches:
        if batch_is_done(out_dir, batch_id):
            _csv_path, json_path, _done_path, _failed_path = batch_paths(out_dir, batch_id)
            batch_rows_out, _summary = load_batch_json(json_path)
            rows.extend(batch_rows_out)
    return rows


def write_all_outputs(
    args: argparse.Namespace,
    summary: dict[str, Any],
    rows: list[dict[str, Any]],
) -> None:
    summary_json = args.summary_json or (args.out_dir / "summary.json")
    summary_csv = args.summary_csv or (args.out_dir / "summary.csv")
    write_summary_json(summary_json, summary, rows)
    write_summary_csv(summary_csv, rows)
    if args.report_md:
        write_markdown(args.report_md, args.report_title, summary, args.report_note or None)
    print("-" * 72)
    print(f"elapsed={summary['elapsed_seconds']:.2f}s status={summary['status']}")
    print(
        f"contains={summary['contains_count']} strict_wider={summary['strict_wider_count']} "
        f"inconclusive={summary['inconclusive_count']} disjoint={summary['disjoint_fail_count']}"
    )
    print(f"summary_json: {summary_json}")
    print(f"summary_csv: {summary_csv}")
    if args.report_md:
        print(f"report_md: {args.report_md}")


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        description="Batch strict checker for raw projected-j0 sector subbox rectangles."
    )
    parser.add_argument("--subbox-cert-dir", type=Path, required=True)
    parser.add_argument(
        "--sector-rat-pack-dir",
        type=Path,
        default=Path("audit_outputs/projected_j0_positive_box_sector_rationalized_pack"),
    )
    parser.add_argument("--objects", type=str, default="M,D0")
    parser.add_argument("--all-subboxes", action="store_true")
    parser.add_argument("--box-id-list", type=str, default="")
    parser.add_argument("--batch-size", type=int, default=50)
    parser.add_argument("--start-index", type=int, default=0)
    parser.add_argument("--max-subboxes", type=int, default=None)
    parser.add_argument("--resume", action="store_true")
    parser.add_argument("--workers", type=int, default=1)
    parser.add_argument("--batch-timeout-sec", type=float, default=None)
    parser.add_argument("--fail-fast", action="store_true")
    parser.add_argument("--only-missing-batches", action="store_true")
    parser.add_argument("--summary-only", action="store_true")
    parser.add_argument("--dry-run", action="store_true")
    parser.add_argument("--out-dir", type=Path, required=True)
    parser.add_argument("--summary-json", type=Path, default=None)
    parser.add_argument("--summary-csv", type=Path, default=None)
    parser.add_argument("--report-md", type=Path, default=None)
    parser.add_argument("--report-title", type=str, default="Audit Projected J0 Raw Enclosure Batch Check")
    parser.add_argument("--report-note", type=str, default="")
    parser.add_argument("--interval-dps", type=int, default=80)
    parser.add_argument("--inflate", type=float, default=1.0e-14)
    parser.add_argument("--tolerance", type=float, default=1.0e-12)
    parser.add_argument("--mode", choices=["strict"], default="strict")
    return parser


def main() -> None:
    args = build_parser().parse_args()
    objects = parse_list(args.objects)
    allowed = {"M", "D0", "Drest", "RvecTail"}
    bad = [obj for obj in objects if obj not in allowed]
    if bad:
        raise SystemExit(f"unknown objects: {bad}")
    if not objects:
        raise SystemExit("empty --objects")
    if args.mode != "strict":
        raise SystemExit("only strict mode is supported")

    config_path = args.subbox_cert_dir / "config.json"
    subbox_path = args.subbox_cert_dir / "subboxes.jsonl"
    if not config_path.exists() or not subbox_path.exists():
        raise SystemExit("missing subbox certificate config.json or subboxes.jsonl")

    config = json.loads(config_path.read_text())
    all_rows = load_jsonl(subbox_path)
    selected = select_rows(
        all_rows,
        bool(args.all_subboxes),
        parse_list(args.box_id_list),
        int(args.start_index),
        args.max_subboxes,
    )
    if not selected:
        raise SystemExit("no subboxes selected")

    params = config["parameters"]
    rat_d0 = load_rationalized_d0_upper(args.sector_rat_pack_dir)
    batches = make_batches(selected, int(args.batch_size), int(args.start_index))
    missing_batch_ids = [
        batch_id for batch_id, _batch_rows in batches if not batch_is_done(args.out_dir, batch_id)
    ]

    print("C2 projected-j0 raw enclosure batch checker")
    print("===========================================")
    print(f"objects={objects} selected_subboxes={len(selected)} all_available={len(all_rows)}")
    print(
        f"batch_size={args.batch_size} batches={len(batches)} workers={args.workers} "
        f"resume={args.resume} summary_only={args.summary_only} dry_run={args.dry_run}"
    )
    print(f"missing_batches={missing_batch_ids}")

    if args.dry_run:
        print("dry-run: no strict recomputation performed")
        return

    tic_all = time.time()

    args.out_dir.mkdir(parents=True, exist_ok=True)
    aggregate_rows = load_existing_batch_rows(args.out_dir, batches)
    failed_batches: list[dict[str, Any]] = []

    if args.summary_only:
        print("summary-only: aggregating completed batches only")
    else:
        skip_existing = bool(args.resume or args.only_missing_batches)
        batches_to_run = [
            (batch_id, batch_rows)
            for batch_id, batch_rows in batches
            if not (skip_existing and batch_is_done(args.out_dir, batch_id))
        ]

        if args.only_missing_batches and not batches_to_run:
            print("only-missing-batches: nothing to recompute")

        if batches_to_run and int(args.workers) <= 1:
            mp.iv.dps = int(args.interval_dps)
            print("building strict term context...")
            ctx = build_context(params)
            print(
                "term_counts="
                f"odd_core:{len(ctx['odd_core'].addresses)}, odd_ref:{len(ctx['odd_ref'].addresses)}, "
                f"target:{len(ctx['target'].addresses)}, central_ref:{len(ctx['central_ref'].addresses)}"
            )
            for batch_id, batch_rows in batches_to_run:
                try:
                    rows_out, summary = process_batch(
                        ctx,
                        batch_rows,
                        objects,
                        float(args.inflate),
                        float(args.tolerance),
                        rat_d0,
                        batch_id,
                    )
                    write_batch(args.out_dir, batch_id, rows_out, summary)
                    aggregate_rows.extend(rows_out)
                    print(
                        f"  batch {batch_id:03d} done: contains={summary['contains']} "
                        f"strict_wider={summary['strict_wider']} inconclusive={summary['inconclusive']} "
                        f"disjoint={summary['disjoint_fail']} elapsed={summary['elapsed_seconds']:.2f}s",
                        flush=True,
                    )
                except BaseException as exc:
                    subboxes = [str(row["subbox_id"]) for row in batch_rows]
                    write_failed_batch(args.out_dir, batch_id, exc, subboxes)
                    failed_batches.append(
                        {"batch_id": batch_id, "exception": repr(exc), "subboxes": subboxes}
                    )
                    print(f"  batch {batch_id:03d} failed: {exc!r}", flush=True)
                    if args.fail_fast:
                        break

        elif batches_to_run:
            max_workers = max(1, int(args.workers))
            print(f"running {len(batches_to_run)} batches with workers={max_workers}")
            executor = ProcessPoolExecutor(max_workers=max_workers)
            pending: dict[Any, tuple[int, list[dict[str, Any]], float]] = {}
            try:
                for batch_id, batch_rows in batches_to_run:
                    payload = {
                        "batch_id": batch_id,
                        "batch_rows": batch_rows,
                        "objects": objects,
                        "inflate": float(args.inflate),
                        "tolerance": float(args.tolerance),
                        "rat_d0": rat_d0,
                        "interval_dps": int(args.interval_dps),
                        "params": params,
                    }
                    future = executor.submit(process_batch_worker, payload)
                    pending[future] = (batch_id, batch_rows, time.time())

                stop = False
                while pending and not stop:
                    done, _not_done = wait(pending, timeout=1.0, return_when=FIRST_COMPLETED)
                    if not done:
                        if args.batch_timeout_sec is not None:
                            now = time.time()
                            for future, (batch_id, batch_rows, started) in list(pending.items()):
                                if now - started > float(args.batch_timeout_sec):
                                    exc = TimeoutError(
                                        f"batch {batch_id:03d} exceeded {args.batch_timeout_sec}s"
                                    )
                                    subboxes = [str(row["subbox_id"]) for row in batch_rows]
                                    write_failed_batch(args.out_dir, batch_id, exc, subboxes)
                                    failed_batches.append(
                                        {
                                            "batch_id": batch_id,
                                            "exception": repr(exc),
                                            "subboxes": subboxes,
                                        }
                                    )
                                    future.cancel()
                                    pending.pop(future, None)
                                    print(f"  batch {batch_id:03d} timed out", flush=True)
                                    if args.fail_fast:
                                        stop = True
                                        break
                        continue

                    for future in sorted(done, key=lambda item: pending[item][0]):
                        batch_id, batch_rows, _started = pending.pop(future)
                        try:
                            _result_batch_id, rows_out, summary = future.result()
                            write_batch(args.out_dir, batch_id, rows_out, summary)
                            aggregate_rows.extend(rows_out)
                            print(
                                f"  batch {batch_id:03d} done: contains={summary['contains']} "
                                f"strict_wider={summary['strict_wider']} "
                                f"inconclusive={summary['inconclusive']} "
                                f"disjoint={summary['disjoint_fail']} "
                                f"elapsed={summary['elapsed_seconds']:.2f}s",
                                flush=True,
                            )
                        except BaseException as exc:
                            subboxes = [str(row["subbox_id"]) for row in batch_rows]
                            write_failed_batch(args.out_dir, batch_id, exc, subboxes)
                            failed_batches.append(
                                {"batch_id": batch_id, "exception": repr(exc), "subboxes": subboxes}
                            )
                            print(f"  batch {batch_id:03d} failed: {exc!r}", flush=True)
                            if args.fail_fast:
                                stop = True
                                break
                if stop:
                    executor.shutdown(wait=False, cancel_futures=True)
                else:
                    executor.shutdown()
            except BaseException:
                executor.shutdown(wait=False, cancel_futures=True)
                raise

    aggregate_rows = sorted(
        aggregate_rows,
        key=lambda row: (str(row["box_id"]), str(row["subbox_id"]), str(row["object"])),
    )

    elapsed = time.time() - tic_all
    missing_batch_ids_after = [
        batch_id for batch_id, _batch_rows in batches if not batch_is_done(args.out_dir, batch_id)
    ]
    hashes = {
        "script": file_sha256(Path(__file__)),
        "sentinel_helper": file_sha256(Path(__file__).with_name("c2_projected_j0_raw_enclosure_sentinel_checker.py")),
        "subbox_config": file_sha256(config_path),
        "subboxes": file_sha256(subbox_path),
        "sector_rationalized_csv": file_sha256(args.sector_rat_pack_dir / "boxes_sector_rationalized.csv"),
    }
    parameters = {
        "mode": args.mode,
        "objects": objects,
        "interval_dps": int(args.interval_dps),
        "inflate": float(args.inflate),
        "tolerance": float(args.tolerance),
        "batch_size": int(args.batch_size),
        "workers": int(args.workers),
        "batch_timeout_sec": args.batch_timeout_sec,
        "fail_fast": bool(args.fail_fast),
        "only_missing_batches": bool(args.only_missing_batches),
        "summary_only": bool(args.summary_only),
        "start_index": int(args.start_index),
        "max_subboxes": args.max_subboxes,
        "all_subboxes": bool(args.all_subboxes),
        "box_id_list": parse_list(args.box_id_list),
        "subbox_cert_dir": str(args.subbox_cert_dir),
        "sector_rat_pack_dir": str(args.sector_rat_pack_dir),
    }
    summary = summarize_rows(
        aggregate_rows,
        selected_subbox_count=len(selected),
        total_available_subboxes=len(all_rows),
        elapsed_seconds=elapsed,
        command=sys.argv,
        hashes=hashes,
        parameters=parameters,
    )
    summary["missing_batches"] = missing_batch_ids_after
    summary["failed_batches"] = failed_batches
    if failed_batches:
        summary["status"] = "failed"
        summary["checks_failed"] = int(summary.get("checks_failed", 0)) + len(failed_batches)

    write_all_outputs(args, summary, aggregate_rows)


if __name__ == "__main__":
    main()
