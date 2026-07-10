#!/usr/bin/env python3
"""
Generate Lean data for projected-j0 rationalized positive-box constants.

The generated file proves only rational algebraic side conditions.  It does
not prove the analytic enclosure obligations behind the constants.
"""

from __future__ import annotations

import argparse
import csv
from decimal import Decimal
from fractions import Fraction
from pathlib import Path


def repo_root() -> Path:
    return Path(__file__).resolve().parents[1]


def load_rows(pack_dir: Path) -> list[dict[str, str]]:
    with (pack_dir / "boxes_rationalized.csv").open(newline="", encoding="utf-8") as f:
        return list(csv.DictReader(f))


def fraction_from_decimal(text: str) -> Fraction:
    return Fraction(Decimal(str(text)))


def lean_rat(text: str) -> str:
    q = fraction_from_decimal(text)
    if q.denominator == 1:
        return f"({q.numerator} : ℚ)"
    return f"(({q.numerator} : ℚ) / {q.denominator})"


def lean_name(box_id: str) -> str:
    out = []
    for ch in box_id:
        if ch.isalnum():
            out.append(ch)
        else:
            out.append("_")
    return "positiveBox_" + "".join(out)


def constants_def(name: str, row: dict[str, str], rest_field: str) -> str:
    return f"""def {name}_constants : ProjectedJ0RationalizedBoxConstants where
  mainLower := {lean_rat(row["mainNormLowerConst_rat"])}
  numeratorUpper := {lean_rat(row["numeratorUpperConst_rat"])}
  restUpper := {lean_rat(row[rest_field])}
"""


def certificate_def(name: str) -> str:
    return f"""def {name}_certificate : ProjectedJ0RationalizedBoxCertificate where
  constants := {name}_constants
  main_pos := by
    norm_num [{name}_constants]
  numerator_nonneg := by
    norm_num [{name}_constants]
  rest_nonneg := by
    norm_num [{name}_constants]
  budget_pos := by
    norm_num [
      ProjectedJ0RationalizedBudgetPositive,
      ProjectedJ0RationalizedBudgetValue,
      {name}_constants
    ]
"""


def generate(rows: list[dict[str, str]], module_name: str) -> str:
    combined_names: list[str] = []
    separate_names: list[str] = []
    chunks = [
        "import LeanC2.AuditAdjustedQuartetProjectedJ0RationalizedCertificateSchema",
        "",
        "/-!",
        "# Rationalized positive-box data for projected-j0",
        "",
        "This file is generated from the rationalized positive-box pack.  It",
        "checks only rational algebraic budgets and sign side conditions.  It",
        "does not prove the analytic enclosure obligations for the functions.",
        "-/",
        "",
        "namespace C2",
        "namespace AdjustedQuartetProjectedJ0Aliases",
        "",
    ]
    for row in rows:
        base = lean_name(row["source_box_id"])
        combined = f"{base}_combined"
        separate = f"{base}_separate"
        combined_names.append(combined)
        separate_names.append(separate)
        chunks.append(constants_def(combined, row, "restUpperCombinedConst_rat"))
        chunks.append(certificate_def(combined))
        chunks.append(constants_def(separate, row, "restUpperSeparateConst_rat"))
        chunks.append(certificate_def(separate))
    chunks.extend([
        "def positiveBoxCombinedRationalizedCertificates :",
        "    List ProjectedJ0RationalizedBoxCertificate :=",
        "  [",
    ])
    chunks.extend([f"    {name}_certificate," for name in combined_names])
    chunks.extend([
        "  ]",
        "",
        "def positiveBoxSeparateRationalizedCertificates :",
        "    List ProjectedJ0RationalizedBoxCertificate :=",
        "  [",
    ])
    chunks.extend([f"    {name}_certificate," for name in separate_names])
    chunks.extend([
        "  ]",
        "",
        "end AdjustedQuartetProjectedJ0Aliases",
        "end C2",
        "",
    ])
    return "\n".join(chunks)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--pack-dir", required=True)
    parser.add_argument("--out-lean", required=True)
    parser.add_argument("--module-name", required=True)
    args = parser.parse_args()

    pack_dir = Path(args.pack_dir)
    if not pack_dir.is_absolute():
        pack_dir = repo_root() / pack_dir
    out_lean = Path(args.out_lean)
    if not out_lean.is_absolute():
        out_lean = repo_root() / out_lean
    rows = load_rows(pack_dir)
    out_lean.parent.mkdir(parents=True, exist_ok=True)
    out_lean.write_text(generate(rows, args.module_name), encoding="utf-8")
    print(f"generated {out_lean} with {len(rows)} combined and {len(rows)} separate certificates")


if __name__ == "__main__":
    main()
