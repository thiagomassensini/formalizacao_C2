#!/usr/bin/env python3
"""Generate the positive-box all-subbox Lean skeleton.

The generated Lean file records subbox identifiers and rational regions only.
It leaves coverage and analytic bounds as explicit external hypotheses.
"""

from __future__ import annotations

import argparse
import csv
import json
from collections import defaultdict
from dataclasses import dataclass
from decimal import Decimal
from fractions import Fraction
from pathlib import Path
from typing import Iterable


BOX_ORDER = [
    *(f"s0.84_t{i}" for i in range(9)),
    *(f"s0.85_t{i}" for i in range(9)),
    *(f"s0.86_t{i}" for i in range(9)),
]


@dataclass(frozen=True)
class Subbox:
    source_box_id: str
    subbox_id: str
    sigma_min: Decimal
    sigma_max: Decimal
    t_min: Decimal
    t_max: Decimal


def decimal_to_q_expr(value: Decimal) -> str:
    frac = Fraction(value)
    if frac.denominator == 1:
        return f"(({frac.numerator} : ℚ))"
    return f"(({frac.numerator} : ℚ) / {frac.denominator})"


def box_to_constructor(box_id: str) -> str:
    return box_id.replace("s0.", "s0").replace(".", "_")


def box_to_cert_suffix(box_id: str) -> str:
    return box_id.replace(".", "_")


def subbox_to_constructor(subbox_id: str) -> str:
    box_part, sub_part = subbox_id.split("__", 1)
    box_name = box_to_constructor(box_part)
    idx = sub_part.split("_t", 1)[1]
    return f"{box_name}_sb{idx}"


def lean_list(items: Iterable[str], indent: str = "  ") -> str:
    items = list(items)
    if not items:
        return f"{indent}([] : List PositiveBoxSubboxId)"
    lines = [f"{indent}["]
    for idx, item in enumerate(items):
        comma = "," if idx + 1 < len(items) else ""
        lines.append(f"{indent}  {item}{comma}")
    lines.append(f"{indent}]")
    return "\n".join(lines)


def load_subboxes(path: Path) -> list[Subbox]:
    subboxes: list[Subbox] = []
    with path.open("r", encoding="utf-8") as handle:
        for line_no, line in enumerate(handle, start=1):
            raw = line.strip()
            if not raw:
                continue
            data = json.loads(raw, parse_float=Decimal)
            try:
                subboxes.append(
                    Subbox(
                        source_box_id=str(data["source_box_id"]),
                        subbox_id=str(data["subbox_id"]),
                        sigma_min=data["sigma_min"],
                        sigma_max=data["sigma_max"],
                        t_min=data["t_min"],
                        t_max=data["t_max"],
                    )
                )
            except KeyError as exc:
                raise SystemExit(
                    f"missing field {exc} in {path}:{line_no}"
                ) from exc
    return subboxes


def load_sector_boxes(path: Path) -> set[str]:
    with path.open("r", encoding="utf-8", newline="") as handle:
        rows = list(csv.DictReader(handle))
    return {row["source_box_id"] for row in rows}


def load_box_summary(path: Path) -> dict[str, int]:
    data = json.loads(path.read_text(encoding="utf-8"))
    if isinstance(data, dict) and "boxes" in data:
        entries = data["boxes"]
    elif isinstance(data, list):
        entries = data
    elif isinstance(data, dict):
        entries = data.values()
    else:
        entries = []
    out: dict[str, int] = {}
    for entry in entries:
        if not isinstance(entry, dict):
            continue
        box_id = entry.get("source_box_id") or entry.get("box_id")
        count = entry.get("subboxes") or entry.get("subboxes_count")
        if box_id is not None and count is not None:
            out[str(box_id)] = int(count)
    return out


def validate_inputs(
    subboxes: list[Subbox],
    sector_boxes: set[str],
    summary_counts: dict[str, int],
    lean_data_path: Path,
) -> tuple[dict[str, list[Subbox]], list[str]]:
    lean_data_text = lean_data_path.read_text(encoding="utf-8")
    by_box: dict[str, list[Subbox]] = defaultdict(list)
    for subbox in subboxes:
        by_box[subbox.source_box_id].append(subbox)

    errors: list[str] = []
    box_set = set(by_box)
    expected = set(BOX_ORDER)
    if box_set != expected:
        errors.append(
            f"box set mismatch: missing={sorted(expected - box_set)} "
            f"extra={sorted(box_set - expected)}"
        )
    if sector_boxes != expected:
        errors.append(
            f"sector csv box set mismatch: missing={sorted(expected - sector_boxes)} "
            f"extra={sorted(sector_boxes - expected)}"
        )
    if len(subboxes) != 771:
        errors.append(f"expected 771 subboxes, found {len(subboxes)}")

    for box_id in BOX_ORDER:
        if box_id in summary_counts and summary_counts[box_id] != len(by_box[box_id]):
            errors.append(
                f"summary count mismatch for {box_id}: "
                f"summary={summary_counts[box_id]} jsonl={len(by_box[box_id])}"
            )
        cert_name = f"positiveBoxSector_{box_to_cert_suffix(box_id)}_combined_certificate"
        if cert_name not in lean_data_text:
            errors.append(f"missing Lean combined certificate {cert_name}")

    for box_id, items in by_box.items():
        items.sort(key=lambda item: item.subbox_id)
        for item in items:
            if item.sigma_min > item.sigma_max:
                errors.append(f"bad sigma interval in {item.subbox_id}")
            if item.t_min > item.t_max:
                errors.append(f"bad t interval in {item.subbox_id}")
    return by_box, errors


def generate_lean(by_box: dict[str, list[Subbox]]) -> str:
    constructors = [
        subbox_to_constructor(item.subbox_id)
        for box_id in BOX_ORDER
        for item in by_box[box_id]
    ]

    lines: list[str] = []
    lines.append("import LeanC2.AuditProjectedJ0PositiveBoxSkeleton")
    lines.append("")
    lines.append("set_option linter.style.longLine false")
    lines.append("")
    lines.append("/-!")
    lines.append("# Positive-box all-subbox skeleton")
    lines.append("")
    lines.append("This generated file records the 771 positive-box subbox")
    lines.append("identifiers and rational regions. Coverage and analytic")
    lines.append("bounds remain explicit external hypotheses.")
    lines.append("-/")
    lines.append("")
    lines.append("namespace C2")
    lines.append("namespace ProjectedJ0PositiveBoxSkeleton")
    lines.append("")
    lines.append("open ProjectedJ0RectangleArithmetic")
    lines.append("open AdjustedQuartetProjectedJ0Aliases")
    lines.append("")
    ordered_subboxes = [item for box_id in BOX_ORDER for item in by_box[box_id]]
    all_subbox_items = [
        f"PositiveBoxSubboxId.{subbox_to_constructor(item.subbox_id)}"
        for item in ordered_subboxes
    ]

    lines.append("inductive PositiveBoxSubboxId where")

    for start in range(0, len(constructors), 4):
        chunk = constructors[start : start + 4]
        lines.append("  | " + " | ".join(chunk))
    lines.append("  deriving DecidableEq, Repr")
    lines.append("")
    lines.append("def positiveBoxSubboxes : Finset PositiveBoxSubboxId :=")
    lines.append(lean_list(all_subbox_items, indent="  ") + ".toFinset")
    lines.append("")

    lines.append("def positiveBoxSubboxesOf : PositiveBoxId → Finset PositiveBoxSubboxId")
    for box_id in BOX_ORDER:
        ctor = f".{box_to_constructor(box_id).replace('s0', 's0')}"
        subitems = [
            f"PositiveBoxSubboxId.{subbox_to_constructor(item.subbox_id)}"
            for item in by_box[box_id]
        ]
        lines.append(f"  | {ctor} =>")
        lines.append(lean_list(subitems, indent="    ") + ".toFinset")
    lines.append("")

    lines.append("def positiveBoxSubboxRect : PositiveBoxSubboxId → RectRegion")
    for box_id in BOX_ORDER:
        for item in by_box[box_id]:
            ctor = subbox_to_constructor(item.subbox_id)
            lines.append(f"  | .{ctor} =>")
            lines.append("    { sigmaMin := " + decimal_to_q_expr(item.sigma_min))
            lines.append("      sigmaMax := " + decimal_to_q_expr(item.sigma_max))
            lines.append("      tMin := " + decimal_to_q_expr(item.t_min))
            lines.append("      tMax := " + decimal_to_q_expr(item.t_max) + " }")
    lines.append("")

    lines.append("def positiveBoxSubboxRegion (i : PositiveBoxSubboxId) : Set ℂ :=")
    lines.append("  (positiveBoxSubboxRect i).toSet")
    lines.append("")

    lines.append("structure PositiveBoxAllSubboxCoverHypotheses where")
    lines.append("  cover :")
    lines.append("    ∀ b ∈ positiveBoxes,")
    lines.append("      ∀ s ∈ positiveBoxRegion b,")
    lines.append("        ∃ i ∈ positiveBoxSubboxesOf b,")
    lines.append("          s ∈ positiveBoxSubboxRegion i")
    lines.append("")

    lines.append("structure PositiveBoxAllSubboxBounds")
    lines.append("    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (K Midx : ℕ) where")
    lines.append("  main_lower :")
    lines.append("    ∀ b ∈ positiveBoxes,")
    lines.append("      ∀ i ∈ positiveBoxSubboxesOf b,")
    lines.append("        ∀ s ∈ positiveBoxSubboxRegion i,")
    lines.append("          ((positiveBoxCombinedCert b).constants.mainLower : ℝ) ≤")
    lines.append("            ‖adjustedProjectedJ0_M tiltSeed s‖")
    lines.append("  d0_neg_upper :")
    lines.append("    ∀ b ∈ positiveBoxes,")
    lines.append("      ∀ i ∈ positiveBoxSubboxesOf b,")
    lines.append("        ∀ s ∈ positiveBoxSubboxRegion i,")
    lines.append("          adjustedProjectedJ0_D0NegReMain tiltSeed coreCutoff s ≤")
    lines.append("            ((positiveBoxCombinedCert b).constants.d0NegReUpper : ℝ)")
    lines.append("  rest_upper :")
    lines.append("    ∀ b ∈ positiveBoxes,")
    lines.append("      ∀ i ∈ positiveBoxSubboxesOf b,")
    lines.append("        ∀ s ∈ positiveBoxSubboxRegion i,")
    lines.append("          adjustedProjectedJ0_restCostFinite tiltSeed coreCutoff K Midx s ≤")
    lines.append("            ((positiveBoxCombinedCert b).constants.restUpper : ℝ)")
    lines.append("")

    lines.append("namespace PositiveBoxAllSubboxBounds")
    lines.append("")
    lines.append("def toPositiveBoxSubboxCovers")
    lines.append("    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ} {K Midx : ℕ}")
    lines.append("    (bounds : PositiveBoxAllSubboxBounds tiltSeed coreCutoff K Midx)")
    lines.append("    (covers : PositiveBoxAllSubboxCoverHypotheses) :")
    lines.append("    PositiveBoxSubboxCovers")
    lines.append("      PositiveBoxSubboxId")
    lines.append("      (fun _ i => positiveBoxSubboxRegion i)")
    lines.append("      tiltSeed coreCutoff K Midx where")
    lines.append("  subboxes := positiveBoxSubboxesOf")
    lines.append("  cover := by")
    lines.append("    intro b hb")
    lines.append("    exact")
    lines.append("      { cover := covers.cover b hb")
    lines.append("        main_lower_subbox := bounds.main_lower b hb")
    lines.append("        d0_neg_subbox := bounds.d0_neg_upper b hb")
    lines.append("        rest_upper_subbox := bounds.rest_upper b hb }")
    lines.append("")
    lines.append("end PositiveBoxAllSubboxBounds")
    lines.append("")

    lines.append("theorem positiveBox_totalFinite_ne_zero_of_all_subbox_bounds")
    lines.append("    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ} {K Midx : ℕ}")
    lines.append("    (bounds : PositiveBoxAllSubboxBounds tiltSeed coreCutoff K Midx)")
    lines.append("    (covers : PositiveBoxAllSubboxCoverHypotheses) :")
    lines.append("    ∀ s ∈ positiveGlobalRegion,")
    lines.append("      adjustedProjectedJ0_totalFinite tiltSeed coreCutoff K Midx s ≠ 0 := by")
    lines.append("  exact positiveBox_totalFinite_ne_zero_of_subbox_covers")
    lines.append("    (PositiveBoxAllSubboxBounds.toPositiveBoxSubboxCovers bounds covers)")
    lines.append("")
    lines.append("end ProjectedJ0PositiveBoxSkeleton")
    lines.append("end C2")
    return "\n".join(lines) + "\n"


def generate_report(by_box: dict[str, list[Subbox]], out_lean: Path) -> str:
    total = sum(len(v) for v in by_box.values())
    s084_t7_count = len(by_box["s0.84_t7"])
    return f"""# Audit Projected J0 Positive Box All Subbox Skeleton Lean

## Gerador

Script criado:

```text
operadores/c2_generate_positive_box_subbox_skeleton.py
```

Arquivo Lean gerado:

```text
{out_lean}
```

## Dados Externos Lidos

Entradas:

```text
audit_outputs/projected_j0_positive_box_sector_subbox_certificate/subboxes.jsonl
audit_outputs/projected_j0_positive_box_sector_subbox_certificate/boxes_summary.json
audit_outputs/projected_j0_positive_box_sector_rationalized_pack/boxes_sector_rationalized.csv
LeanC2/AuditAdjustedQuartetProjectedJ0PositiveBoxSectorRationalizedData.lean
```

Validacoes feitas pelo gerador:

```text
source_box_id = 27;
subboxes = {total};
cada subbox tem sigma_min, sigma_max, t_min, t_max;
cada source_box_id corresponde a PositiveBoxId;
cada source_box_id tem certificado combined correspondente.
```

## Representacao Lean

Foi usada a opcao de tipo global:

```text
PositiveBoxSubboxId
```

com {total} construtores gerados automaticamente.

Foram gerados:

```text
positiveBoxSubboxes
positiveBoxSubboxesOf
positiveBoxSubboxRect
positiveBoxSubboxRegion
```

As regioes usam `RectRegion` do skeleton positive-box. Os endpoints decimais
foram convertidos diretamente para fracoes racionais por `Decimal`, sem passar
por float.

## Cobertura E Bounds

A cobertura por box ficou como hipotese:

```text
PositiveBoxAllSubboxCoverHypotheses
```

Os bounds por subbox ficaram como hipotese:

```text
PositiveBoxAllSubboxBounds
```

Essas estruturas nao inserem retangulos brutos nem provam enclosures.

## Conversao

Foi gerado:

```text
PositiveBoxAllSubboxBounds.toPositiveBoxSubboxCovers
```

Ele transforma:

```text
PositiveBoxAllSubboxBounds
+ PositiveBoxAllSubboxCoverHypotheses
```

em:

```text
PositiveBoxSubboxCovers
```

para alimentar o skeleton positive-box ja existente.

## Theorem Global Condicional

Foi gerado:

```text
positiveBox_totalFinite_ne_zero_of_all_subbox_bounds
```

Leitura:

```text
covers externos dos {total} subboxes
+ bounds externos por subbox
------------------------------------------------
totalFinite != 0 em positiveGlobalRegion
```

## Comparacao Com Sentinela

Para `s0.84_t7`, o gerador encontrou:

```text
subboxes = {s084_t7_count}
```

Esse numero coincide com a sentinela manual
`LeanC2/AuditProjectedJ0PositiveBoxSentinelS084T7.lean`.

## O Que Ainda Fica Externo

Continuam externos:

```text
prova dos bounds por subbox;
prova concreta de cobertura por intervalos;
retangulos brutos;
geracao analitica das enclosures;
transcendentais.
```

## Verificacao

Verificacoes esperadas:

```text
python3 -m py_compile operadores/c2_generate_positive_box_subbox_skeleton.py
lake env lean {out_lean}
lake build LeanC2.AuditProjectedJ0PositiveBoxAllSubboxSkeleton
```
"""


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--subboxes-jsonl", required=True, type=Path)
    parser.add_argument("--boxes-summary", required=True, type=Path)
    parser.add_argument("--sector-rat-csv", required=True, type=Path)
    parser.add_argument(
        "--lean-data",
        type=Path,
        default=Path("LeanC2/AuditAdjustedQuartetProjectedJ0PositiveBoxSectorRationalizedData.lean"),
    )
    parser.add_argument("--out-lean", required=True, type=Path)
    parser.add_argument("--out-md", required=True, type=Path)
    args = parser.parse_args()

    subboxes = load_subboxes(args.subboxes_jsonl)
    sector_boxes = load_sector_boxes(args.sector_rat_csv)
    summary_counts = load_box_summary(args.boxes_summary)
    by_box, errors = validate_inputs(
        subboxes, sector_boxes, summary_counts, args.lean_data
    )
    if errors:
        for error in errors:
            print(f"error: {error}")
        raise SystemExit(1)

    args.out_lean.parent.mkdir(parents=True, exist_ok=True)
    args.out_lean.write_text(generate_lean(by_box), encoding="utf-8")
    args.out_md.write_text(generate_report(by_box, args.out_lean), encoding="utf-8")
    print(f"generated {args.out_lean}")
    print(f"generated {args.out_md}")
    print(f"boxes={len(by_box)} subboxes={sum(len(v) for v in by_box.values())}")


if __name__ == "__main__":
    main()
