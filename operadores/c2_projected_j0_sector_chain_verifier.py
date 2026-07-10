#!/usr/bin/env python3
"""
End-to-end consistency verifier for the projected-j0 positive-box sector chain.

This checks data consistency from interval output to sector pack, rationalized
pack, generated Lean algebra data, and the conditional Lean bridge.  It does
not prove the analytic interval enclosures inside Lean.
"""

from __future__ import annotations

import argparse
import csv
import hashlib
import json
import re
import subprocess
import tempfile
from datetime import datetime, timezone
from decimal import Decimal
from pathlib import Path
from typing import Any


SOURCE_PACK_FIELDS = [
    "d0_neg_re_upper",
    "mainNormLowerConst",
    "restUpperCombinedConst",
    "restUpperSeparateConst",
    "sectorBudgetCombined",
    "sectorBudgetSeparate",
]

BOOL_FIELDS = [
    "certified_nondestructive",
    "certified_sector_combined",
    "certified_sector_separate",
]

PACK_REQUIRED = [
    "config.json",
    "boxes.csv",
    "boxes.json",
    "commands.sh",
    "summary.md",
    "README.md",
]

RAT_REQUIRED = [
    "config.json",
    "boxes_sector_rationalized.csv",
    "boxes_sector_rationalized.json",
    "source_config.json",
    "summary.md",
    "README.md",
]


def repo_root() -> Path:
    return Path(__file__).resolve().parents[1]


def resolve(path_text: str) -> Path:
    path = Path(path_text)
    if path.is_absolute():
        return path
    return repo_root() / path


def sha256(path: Path) -> str | None:
    if not path.exists():
        return None
    h = hashlib.sha256()
    with path.open("rb") as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b""):
            h.update(chunk)
    return h.hexdigest()


def load_csv(path: Path) -> list[dict[str, str]]:
    with path.open(newline="", encoding="utf-8") as f:
        return list(csv.DictReader(f))


def load_json(path: Path) -> Any:
    with path.open("r", encoding="utf-8") as f:
        return json.load(f)


def dec(value: Any) -> Decimal:
    return Decimal(str(value))


def bool_field(value: Any) -> bool:
    return str(value).strip().lower() in {"1", "true", "yes", "y"}


def decimal_text(value: Decimal | None) -> str | None:
    if value is None:
        return None
    return format(value, "f")


def add_check(result: dict[str, Any], name: str, ok: bool, detail: str = "") -> None:
    item = {"name": name, "detail": detail}
    if ok:
        result["checks_passed"].append(item)
    else:
        result["checks_failed"].append(item)


def rows_by_id(rows: list[dict[str, str]]) -> dict[str, dict[str, str]]:
    return {row["source_box_id"]: row for row in rows}


def compare_decimals(a: Any, b: Any, tolerance: Decimal) -> Decimal:
    return abs(dec(a) - dec(b))


def file_hashes(paths: dict[str, Path]) -> dict[str, str | None]:
    return {name: sha256(path) for name, path in paths.items()}


def check_existence(result: dict[str, Any], paths: dict[str, Path]) -> None:
    for name, path in paths.items():
        add_check(result, f"exists:{name}", path.exists(), str(path))


def analyze_lean_data(path: Path) -> dict[str, Any]:
    text = path.read_text(encoding="utf-8")
    combined = re.findall(
        r"^def positiveBoxSector_.*_combined_certificate\s*:",
        text,
        flags=re.MULTILINE,
    )
    separate = re.findall(
        r"^def positiveBoxSector_.*_separate_certificate\s*:",
        text,
        flags=re.MULTILINE,
    )
    return {
        "combined_count": len(combined),
        "separate_count": len(separate),
        "has_combined_length": "positiveBoxSectorCombinedCertificates_length" in text,
        "has_separate_length": "positiveBoxSectorSeparateCertificates_length" in text,
    }


def regenerate_lean_data(rat_pack_dir: Path, lean_data: Path) -> tuple[bool, str]:
    generator = repo_root() / "operadores/c2_projected_j0_generate_lean_sector_rationalized_data.py"
    with tempfile.TemporaryDirectory() as tmp:
        out = Path(tmp) / "generated.lean"
        proc = subprocess.run(
            [
                "python3",
                str(generator),
                "--pack-dir",
                str(rat_pack_dir),
                "--out-lean",
                str(out),
            ],
            cwd=repo_root(),
            text=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            check=False,
        )
        if proc.returncode != 0:
            return False, proc.stderr[-2000:] or proc.stdout[-2000:]
        same = out.read_bytes() == lean_data.read_bytes()
        return same, "exact regenerated Lean data match" if same else "generated Lean data differs"


def analyze_bridge(path: Path) -> dict[str, bool]:
    text = path.read_text(encoding="utf-8")
    return {
        "hypotheses_found": "structure ProjectedJ0SectorExternalAnalyticBoxHypotheses" in text,
        "to_box_found": (
            "theorem ProjectedJ0SectorRationalizedBoxCertificate.toSectorConstantBoxData"
            in text
        ),
        "total_found": (
            "theorem ProjectedJ0SectorRationalizedBoxCertificate.total_ne_zero_of_external_hypotheses"
            in text
        ),
        "example_found": (
            "positiveBoxSector_s0_84_t7_combined_total_ne_zero_of_external_hypotheses"
            in text
        ),
    }


def verify(args: argparse.Namespace) -> dict[str, Any]:
    tolerance = Decimal(str(args.tolerance))
    source_csv = resolve(args.source_csv)
    source_json = resolve(args.source_json)
    sector_pack = resolve(args.sector_pack_dir)
    rat_pack = resolve(args.sector_rat_pack_dir)
    lean_data = resolve(args.lean_data)
    bridge = resolve(args.bridge)

    result: dict[str, Any] = {
        "timestamp": datetime.now(timezone.utc).isoformat(),
        "checks_passed": [],
        "checks_failed": [],
        "source_hashes": file_hashes({"csv": source_csv, "json": source_json}),
        "pack_hashes": file_hashes({
            "config": sector_pack / "config.json",
            "boxes_csv": sector_pack / "boxes.csv",
            "boxes_json": sector_pack / "boxes.json",
            "commands": sector_pack / "commands.sh",
        }),
        "rationalized_hashes": file_hashes({
            "config": rat_pack / "config.json",
            "boxes_csv": rat_pack / "boxes_sector_rationalized.csv",
            "boxes_json": rat_pack / "boxes_sector_rationalized.json",
        }),
        "lean_hashes": file_hashes({"data": lean_data, "bridge": bridge}),
    }

    required_paths = {
        "source_csv": source_csv,
        "source_json": source_json,
        "lean_data": lean_data,
        "bridge": bridge,
    }
    required_paths.update({f"sector_pack/{name}": sector_pack / name for name in PACK_REQUIRED})
    required_paths.update({f"sector_rat_pack/{name}": rat_pack / name for name in RAT_REQUIRED})
    check_existence(result, required_paths)

    if result["checks_failed"]:
        return result

    source_rows = load_csv(source_csv)
    source_json_data = load_json(source_json)
    pack_rows = load_csv(sector_pack / "boxes.csv")
    pack_json_rows = load_json(sector_pack / "boxes.json")
    rat_rows = load_csv(rat_pack / "boxes_sector_rationalized.csv")
    rat_json_rows = load_json(rat_pack / "boxes_sector_rationalized.json")

    add_check(result, "source_count_27", len(source_rows) == 27, str(len(source_rows)))
    add_check(result, "source_json_count_27", source_json_data.get("boxes") == 27, str(source_json_data.get("boxes")))
    add_check(result, "pack_count_27", len(pack_rows) == 27, str(len(pack_rows)))
    add_check(result, "pack_json_count_27", isinstance(pack_json_rows, list) and len(pack_json_rows) == 27, str(len(pack_json_rows) if isinstance(pack_json_rows, list) else "not-list"))
    add_check(result, "rat_count_27", len(rat_rows) == 27, str(len(rat_rows)))
    add_check(result, "rat_json_count_27", isinstance(rat_json_rows, list) and len(rat_json_rows) == 27, str(len(rat_json_rows) if isinstance(rat_json_rows, list) else "not-list"))

    source_by_id = rows_by_id(source_rows)
    pack_by_id = rows_by_id(pack_rows)
    rat_by_id = rows_by_id(rat_rows)
    ids = set(source_by_id)
    add_check(result, "same_source_pack_ids", ids == set(pack_by_id), "")
    add_check(result, "same_source_rat_ids", ids == set(rat_by_id), "")

    max_raw_to_pack_diff = Decimal("0")
    max_raw_to_pack_field = ""
    max_raw_to_pack_box = ""
    source_pack_ok = True
    pack_consistency_ok = True
    flags_ok = True
    nondestructive_count = 0
    combined_count = 0
    separate_count = 0
    min_budget_c: tuple[Decimal, str] | None = None
    min_budget_s: tuple[Decimal, str] | None = None
    max_d0: tuple[Decimal, str] | None = None

    for box_id in sorted(ids):
        src = source_by_id[box_id]
        pack = pack_by_id[box_id]
        for field in SOURCE_PACK_FIELDS:
            diff = compare_decimals(src[field], pack[field], tolerance)
            if diff > max_raw_to_pack_diff:
                max_raw_to_pack_diff = diff
                max_raw_to_pack_field = field
                max_raw_to_pack_box = box_id
            source_pack_ok = source_pack_ok and diff <= tolerance
        for field in BOOL_FIELDS:
            source_pack_ok = source_pack_ok and bool_field(src[field]) == bool_field(pack[field])

        d0_upper = dec(pack["d0_neg_re_upper"])
        main = dec(pack["mainNormLowerConst"])
        rest_c = dec(pack["restUpperCombinedConst"])
        rest_s = dec(pack["restUpperSeparateConst"])
        budget_c = dec(pack["sectorBudgetCombined"])
        budget_s = dec(pack["sectorBudgetSeparate"])
        pack_consistency_ok = (
            pack_consistency_ok
            and d0_upper <= 0
            and main > 0
            and rest_c >= 0
            and rest_s >= 0
            and abs((main - rest_c) - budget_c) <= tolerance
            and abs((main - rest_s) - budget_s) <= tolerance
            and budget_c > 0
            and budget_s > 0
        )
        flags = [bool_field(pack[field]) for field in BOOL_FIELDS]
        flags_ok = flags_ok and all(flags)
        nondestructive_count += int(flags[0])
        combined_count += int(flags[1])
        separate_count += int(flags[2])
        if min_budget_c is None or budget_c < min_budget_c[0]:
            min_budget_c = (budget_c, box_id)
        if min_budget_s is None or budget_s < min_budget_s[0]:
            min_budget_s = (budget_s, box_id)
        if max_d0 is None or d0_upper > max_d0[0]:
            max_d0 = (d0_upper, box_id)

    add_check(result, "source_to_pack_fields_match", source_pack_ok, f"max_diff={max_raw_to_pack_diff}")
    add_check(result, "sector_pack_internal_consistency", pack_consistency_ok, "")
    add_check(result, "sector_pack_flags_true", flags_ok, "")

    rat_ok = True
    rat_nondestructive_count = 0
    rat_combined_count = 0
    rat_separate_count = 0
    min_rat_budget_c: tuple[Decimal, str] | None = None
    min_rat_budget_s: tuple[Decimal, str] | None = None
    max_round_loss_c: tuple[Decimal, str] = (Decimal("0"), "")
    max_round_loss_s: tuple[Decimal, str] = (Decimal("0"), "")
    max_budget_loss: tuple[Decimal, str] = (Decimal("0"), "")

    for box_id in sorted(ids):
        pack = pack_by_id[box_id]
        rat = rat_by_id[box_id]
        main_raw = dec(rat["mainNormLowerConst_raw"])
        d0_raw = dec(rat["d0_neg_re_upper_raw"])
        rest_c_raw = dec(rat["restUpperCombinedConst_raw"])
        rest_s_raw = dec(rat["restUpperSeparateConst_raw"])
        main_rat = dec(rat["mainNormLowerConst_rat"])
        d0_rat = dec(rat["d0_neg_re_upper_rat"])
        rest_c_rat = dec(rat["restUpperCombinedConst_rat"])
        rest_s_rat = dec(rat["restUpperSeparateConst_rat"])
        budget_c_rat = dec(rat["sectorBudgetCombined_rat"])
        budget_s_rat = dec(rat["sectorBudgetSeparate_rat"])
        rat_ok = (
            rat_ok
            and abs(main_raw - dec(pack["mainNormLowerConst"])) <= tolerance
            and abs(d0_raw - dec(pack["d0_neg_re_upper"])) <= tolerance
            and abs(rest_c_raw - dec(pack["restUpperCombinedConst"])) <= tolerance
            and abs(rest_s_raw - dec(pack["restUpperSeparateConst"])) <= tolerance
            and main_rat <= main_raw
            and rest_c_rat >= rest_c_raw
            and rest_s_rat >= rest_s_raw
            and d0_rat >= d0_raw
            and d0_rat <= 0
            and main_rat - rest_c_rat == budget_c_rat
            and main_rat - rest_s_rat == budget_s_rat
            and budget_c_rat > 0
            and budget_s_rat > 0
        )
        rat_flags = [
            bool_field(rat["certified_nondestructive_rat"]),
            bool_field(rat["certified_sector_combined_rat"]),
            bool_field(rat["certified_sector_separate_rat"]),
        ]
        rat_ok = rat_ok and all(rat_flags)
        rat_nondestructive_count += int(rat_flags[0])
        rat_combined_count += int(rat_flags[1])
        rat_separate_count += int(rat_flags[2])
        if min_rat_budget_c is None or budget_c_rat < min_rat_budget_c[0]:
            min_rat_budget_c = (budget_c_rat, box_id)
        if min_rat_budget_s is None or budget_s_rat < min_rat_budget_s[0]:
            min_rat_budget_s = (budget_s_rat, box_id)
        loss_c = dec(pack["sectorBudgetCombined"]) - budget_c_rat
        loss_s = dec(pack["sectorBudgetSeparate"]) - budget_s_rat
        if loss_c > max_round_loss_c[0]:
            max_round_loss_c = (loss_c, box_id)
        if loss_s > max_round_loss_s[0]:
            max_round_loss_s = (loss_s, box_id)
        if loss_c > max_budget_loss[0]:
            max_budget_loss = (loss_c, box_id)
        if loss_s > max_budget_loss[0]:
            max_budget_loss = (loss_s, box_id)

    add_check(result, "sector_pack_to_rationalized_safe", rat_ok, "")

    lean_info = analyze_lean_data(lean_data)
    add_check(result, "lean_data_combined_count_27", lean_info["combined_count"] == 27, str(lean_info["combined_count"]))
    add_check(result, "lean_data_separate_count_27", lean_info["separate_count"] == 27, str(lean_info["separate_count"]))
    add_check(result, "lean_data_length_theorems", bool(lean_info["has_combined_length"] and lean_info["has_separate_length"]), "")
    lean_regen_ok, lean_regen_detail = regenerate_lean_data(rat_pack, lean_data)
    add_check(result, "lean_data_regenerates_exactly", lean_regen_ok, lean_regen_detail)

    bridge_info = analyze_bridge(bridge)
    add_check(result, "bridge_hypotheses_found", bridge_info["hypotheses_found"], "")
    add_check(result, "bridge_to_box_found", bridge_info["to_box_found"], "")
    add_check(result, "bridge_total_found", bridge_info["total_found"], "")
    add_check(result, "bridge_example_found", bridge_info["example_found"], "")

    result.update({
        "boxes_count": len(source_rows),
        "nondestructive_count": nondestructive_count,
        "combined_count": combined_count,
        "separate_count": separate_count,
        "rationalized_nondestructive_count": rat_nondestructive_count,
        "rationalized_combined_count": rat_combined_count,
        "rationalized_separate_count": rat_separate_count,
        "min_sector_budget_combined": decimal_text(min_budget_c[0] if min_budget_c else None),
        "min_sector_budget_separate": decimal_text(min_budget_s[0] if min_budget_s else None),
        "min_sector_budget_combined_rat": decimal_text(min_rat_budget_c[0] if min_rat_budget_c else None),
        "min_sector_budget_separate_rat": decimal_text(min_rat_budget_s[0] if min_rat_budget_s else None),
        "worst_combined_box": min_budget_c[1] if min_budget_c else None,
        "worst_separate_box": min_budget_s[1] if min_budget_s else None,
        "max_d0_neg_re_upper": decimal_text(max_d0[0] if max_d0 else None),
        "max_d0_neg_re_upper_box": max_d0[1] if max_d0 else None,
        "max_rounding_loss_combined": decimal_text(max_round_loss_c[0]),
        "max_rounding_loss_combined_box": max_round_loss_c[1],
        "max_rounding_loss_separate": decimal_text(max_round_loss_s[0]),
        "max_rounding_loss_separate_box": max_round_loss_s[1],
        "max_raw_to_pack_diff": decimal_text(max_raw_to_pack_diff),
        "max_raw_to_pack_diff_field": max_raw_to_pack_field,
        "max_raw_to_pack_diff_box": max_raw_to_pack_box,
        "max_pack_to_rationalized_budget_loss": decimal_text(max_budget_loss[0]),
        "max_pack_to_rationalized_budget_loss_box": max_budget_loss[1],
        "bridge_example_found": bridge_info["example_found"],
        "lean_data_counts": lean_info,
    })
    return result


def write_markdown(path: Path, result: dict[str, Any]) -> None:
    lines = [
        "# Audit Projected J0 Positive Box Sector Chain Verification",
        "",
        "Rota: Genuine-First. Esta auditoria verifica a consistencia externa da",
        "cadeia positive-box setorial: output intervalar, pack setorial, pack",
        "racionalizado, dados Lean racionais e bridge condicional. Ela nao prova",
        "as enclosures analiticas no kernel Lean.",
        "",
        "## Resultado",
        "",
        f"- Checks failed: {len(result['checks_failed'])}",
        f"- Boxes: {result.get('boxes_count')}",
        f"- Source/pack nondestructive: {result.get('nondestructive_count')}",
        f"- Source/pack combined: {result.get('combined_count')}",
        f"- Source/pack separate: {result.get('separate_count')}",
        f"- Rationalized nondestructive: {result.get('rationalized_nondestructive_count')}",
        f"- Rationalized combined: {result.get('rationalized_combined_count')}",
        f"- Rationalized separate: {result.get('rationalized_separate_count')}",
        f"- Min sector budget combined: {result.get('min_sector_budget_combined')}",
        f"- Min sector budget separate: {result.get('min_sector_budget_separate')}",
        f"- Min sector budget combined rat: {result.get('min_sector_budget_combined_rat')}",
        f"- Min sector budget separate rat: {result.get('min_sector_budget_separate_rat')}",
        f"- Worst combined box: `{result.get('worst_combined_box')}`",
        f"- Max raw-to-pack diff: {result.get('max_raw_to_pack_diff')} ({result.get('max_raw_to_pack_diff_field')} at `{result.get('max_raw_to_pack_diff_box')}`)",
        f"- Max rationalization budget loss: {result.get('max_pack_to_rationalized_budget_loss')} at `{result.get('max_pack_to_rationalized_budget_loss_box')}`",
        f"- Bridge example found: {result.get('bridge_example_found')}",
        "",
        "## Respostas",
        "",
        "1. A cadeia source -> pack -> rationalized -> Lean data e consistente se `checks failed = 0`.",
        f"2. Checks falhos: {len(result['checks_failed'])}.",
        f"3. Diferenca source/sector pack maxima: {result.get('max_raw_to_pack_diff')}.",
        "4. As direcoes de arredondamento sao seguras quando `sector_pack_to_rationalized_safe` passa.",
        "5. O Lean data bate com o pack racionalizado porque a regeneracao foi comparada byte a byte.",
        f"6. O bridge condicional esta presente: {result.get('bridge_example_found')}.",
        f"7. A caixa mais apertada e `{result.get('worst_combined_box')}`.",
        f"8. Maior perda por racionalizacao: {result.get('max_pack_to_rationalized_budget_loss')}.",
        "9. A cadeia esta pronta como external certificate chain para positive-box se nao houver checks falhos.",
        "10. Limite: isto ainda nao prova as enclosures analiticas no kernel Lean.",
        "",
        "## Failed Checks",
        "",
    ]
    if result["checks_failed"]:
        for item in result["checks_failed"]:
            lines.append(f"- {item['name']}: {item['detail']}")
    else:
        lines.append("- None.")
    path.write_text("\n".join(lines) + "\n", encoding="utf-8")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--source-csv", required=True)
    parser.add_argument("--source-json", required=True)
    parser.add_argument("--sector-pack-dir", required=True)
    parser.add_argument("--sector-rat-pack-dir", required=True)
    parser.add_argument("--lean-data", required=True)
    parser.add_argument("--bridge", required=True)
    parser.add_argument("--out-json", required=True)
    parser.add_argument("--out-md", required=True)
    parser.add_argument("--tolerance", default="1e-12")
    args = parser.parse_args()

    result = verify(args)
    out_json = resolve(args.out_json)
    out_md = resolve(args.out_md)
    out_json.parent.mkdir(parents=True, exist_ok=True)
    with out_json.open("w", encoding="utf-8") as f:
        json.dump(result, f, indent=2, sort_keys=True)
        f.write("\n")
    write_markdown(out_md, result)
    print(f"checks_failed={len(result['checks_failed'])}")
    print(f"wrote {out_json}")
    print(f"wrote {out_md}")


if __name__ == "__main__":
    main()
