#!/usr/bin/env python3
"""Map connected pockets of positive q-ratio diagnostic points.

The input is a CSV produced by `audit_vexact_anatomy_scanner.py`.  Connectivity
is computed on the `(sigma,t)` grid with four-neighbor adjacency.  Components
are reported both per parameter triple `(N,K,M)` and in an aggregate projection
where a grid point is positive if any parameter triple passes there.
"""

from __future__ import annotations

import argparse
import csv
import json
import math
import sys
from collections import defaultdict, deque
from dataclasses import asdict, dataclass
from pathlib import Path


@dataclass
class Component:
    scope: str
    pass_column: str
    N: str
    K: str
    M: str
    component_id: int
    size: int
    sigma_min: float
    sigma_max: float
    t_min: float
    t_max: float
    sigma_count: int
    t_count: int
    best_slack: float
    best_sigma: float
    best_t: float
    best_N: str
    best_K: str
    best_M: str
    mean_slack: float
    touches_sigma_boundary: str
    touches_t_boundary: str
    likely_grid_accident: str


def as_float(raw: str) -> float:
    return float(raw)


def pass_to_bool(raw: str) -> bool:
    return raw.strip().lower() in {"yes", "true", "1", "pass"}


def componentize(points: set[tuple[float, float]]) -> list[set[tuple[float, float]]]:
    if not points:
        return []
    sigmas = sorted({p[0] for p in points})
    ts = sorted({p[1] for p in points})
    sigma_index = {value: idx for idx, value in enumerate(sigmas)}
    t_index = {value: idx for idx, value in enumerate(ts)}
    by_index = {(sigma_index[sigma], t_index[t]): (sigma, t) for sigma, t in points}
    remaining = set(by_index)
    components: list[set[tuple[float, float]]] = []
    while remaining:
        start = remaining.pop()
        queue: deque[tuple[int, int]] = deque([start])
        comp_idx = {start}
        while queue:
            i, j = queue.popleft()
            for nb in ((i - 1, j), (i + 1, j), (i, j - 1), (i, j + 1)):
                if nb in remaining:
                    remaining.remove(nb)
                    comp_idx.add(nb)
                    queue.append(nb)
        components.append({by_index[idx] for idx in comp_idx})
    return components


def summarize_component(
    scope: str,
    pass_column: str,
    component_id: int,
    comp: set[tuple[float, float]],
    rows_by_point: dict[tuple[float, float], list[dict[str, str]]],
    all_sigmas: set[float],
    all_ts: set[float],
    group_key: tuple[str, str, str] | None,
    slack_column: str,
) -> Component:
    rows = [row for point in comp for row in rows_by_point[point]]
    best = max(rows, key=lambda row: as_float(row[slack_column]))
    slacks = [as_float(row[slack_column]) for row in rows]
    sigmas = [point[0] for point in comp]
    ts = [point[1] for point in comp]
    touches_sigma = min(sigmas) == min(all_sigmas) or max(sigmas) == max(all_sigmas)
    touches_t = min(ts) == min(all_ts) or max(ts) == max(all_ts)
    sigma_count = len(set(sigmas))
    t_count = len(set(ts))
    likely_accident = len(comp) <= 2 or sigma_count == 1 or t_count == 1
    N, K, M = group_key if group_key is not None else ("*", "*", "*")
    return Component(
        scope=scope,
        pass_column=pass_column,
        N=N,
        K=K,
        M=M,
        component_id=component_id,
        size=len(comp),
        sigma_min=min(sigmas),
        sigma_max=max(sigmas),
        t_min=min(ts),
        t_max=max(ts),
        sigma_count=sigma_count,
        t_count=t_count,
        best_slack=as_float(best[slack_column]),
        best_sigma=as_float(best["sigma"]),
        best_t=as_float(best["t"]),
        best_N=best["N"],
        best_K=best["K"],
        best_M=best["M"],
        mean_slack=sum(slacks) / len(slacks),
        touches_sigma_boundary="yes" if touches_sigma else "no",
        touches_t_boundary="yes" if touches_t else "no",
        likely_grid_accident="yes" if likely_accident else "no",
    )


def analyze(
    rows: list[dict[str, str]],
    pass_column: str,
    slack_column: str,
    min_slack: float,
) -> list[Component]:
    all_sigmas = {as_float(row["sigma"]) for row in rows}
    all_ts = {as_float(row["t"]) for row in rows}
    passed = [
        row
        for row in rows
        if pass_to_bool(row[pass_column]) and as_float(row[slack_column]) >= min_slack
    ]
    components: list[Component] = []

    grouped: dict[tuple[str, str, str], list[dict[str, str]]] = defaultdict(list)
    for row in passed:
        grouped[(row["N"], row["K"], row["M"])].append(row)

    for group_id, (key, group_rows) in enumerate(sorted(grouped.items()), start=1):
        rows_by_point: dict[tuple[float, float], list[dict[str, str]]] = defaultdict(list)
        for row in group_rows:
            rows_by_point[(as_float(row["sigma"]), as_float(row["t"]))].append(row)
        comps = componentize(set(rows_by_point))
        for cid, comp in enumerate(sorted(comps, key=lambda c: (-len(c), min(c))), start=1):
            components.append(
                summarize_component(
                    "per_parameter",
                    pass_column,
                    cid,
                    comp,
                    rows_by_point,
                    all_sigmas,
                    all_ts,
                    key,
                    slack_column,
                )
            )

    aggregate_rows_by_point: dict[tuple[float, float], list[dict[str, str]]] = defaultdict(list)
    for row in passed:
        aggregate_rows_by_point[(as_float(row["sigma"]), as_float(row["t"]))].append(row)
    aggregate_comps = componentize(set(aggregate_rows_by_point))
    for cid, comp in enumerate(sorted(aggregate_comps, key=lambda c: (-len(c), min(c))), start=1):
        components.append(
            summarize_component(
                "aggregate_any_parameter",
                pass_column,
                cid,
                comp,
                aggregate_rows_by_point,
                all_sigmas,
                all_ts,
                None,
                slack_column,
            )
        )
    return components


def write_csv(path: Path, components: list[Component]) -> None:
    if not components:
        path.write_text("", encoding="utf-8")
        return
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=list(asdict(components[0]).keys()))
        writer.writeheader()
        for comp in components:
            writer.writerow(asdict(comp))


def parse_args(argv: list[str]) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Map connected q-ratio positive pockets.")
    parser.add_argument("csv_path")
    parser.add_argument("--pass-column", default="current_pass_Q")
    parser.add_argument("--slack-column", default="slack_current_Q")
    parser.add_argument("--min-slack", type=float, default=0.0)
    parser.add_argument("--out-csv", default="audit_qratio_pockets.csv")
    parser.add_argument("--out-json", default="audit_qratio_pockets.json")
    return parser.parse_args(argv)


def main(argv: list[str]) -> int:
    args = parse_args(argv)
    rows = list(csv.DictReader(open(args.csv_path, newline="")))
    if not rows:
        print("empty input CSV", file=sys.stderr)
        return 2
    if args.pass_column not in rows[0]:
        print(f"missing pass column: {args.pass_column}", file=sys.stderr)
        return 2
    if args.slack_column not in rows[0]:
        print(f"missing slack column: {args.slack_column}", file=sys.stderr)
        return 2
    components = analyze(rows, args.pass_column, args.slack_column, args.min_slack)
    write_csv(Path(args.out_csv), components)
    summary = {
        "input": args.csv_path,
        "pass_column": args.pass_column,
        "slack_column": args.slack_column,
        "min_slack": args.min_slack,
        "component_count": len(components),
        "aggregate_components": [
            asdict(comp) for comp in components if comp.scope == "aggregate_any_parameter"
        ],
        "top_components": [
            asdict(comp)
            for comp in sorted(components, key=lambda c: (c.scope != "aggregate_any_parameter", -c.size, -c.best_slack))[:20]
        ],
    }
    Path(args.out_json).write_text(json.dumps(summary, indent=2), encoding="utf-8")
    print("q-ratio pocket map")
    print(f"input: {args.csv_path}")
    print(f"components: {len(components)}")
    print(f"aggregate components: {len(summary['aggregate_components'])}")
    for comp in summary["aggregate_components"]:
        print(
            "aggregate "
            f"id={comp['component_id']} size={comp['size']} "
            f"sigma=[{comp['sigma_min']},{comp['sigma_max']}] "
            f"t=[{comp['t_min']},{comp['t_max']}] "
            f"best_slack={comp['best_slack']} best=(sigma={comp['best_sigma']},t={comp['best_t']},"
            f"N={comp['best_N']},K={comp['best_K']},M={comp['best_M']}) "
            f"accident={comp['likely_grid_accident']}"
        )
    print(f"wrote {args.out_csv}")
    print(f"wrote {args.out_json}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
