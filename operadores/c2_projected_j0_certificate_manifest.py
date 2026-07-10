#!/usr/bin/env python3
"""
Build an external manifest for verified projected-j0 certificate packs.

The manifest is documentary and reproducibility-oriented.  It records hashes,
verification summaries, and the intended Lean schema target; it does not turn
external data into Lean proofs.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import subprocess
from datetime import datetime, timezone
from pathlib import Path
from typing import Any


PACK_FILES = [
    "config.json",
    "boxes.csv",
    "boxes.json",
    "commands.sh",
    "README.md",
    "summary.md",
]


def repo_root() -> Path:
    return Path(__file__).resolve().parents[1]


def sha256_file(path: Path) -> str | None:
    if not path.exists():
        return None
    h = hashlib.sha256()
    with path.open("rb") as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b""):
            h.update(chunk)
    return h.hexdigest()


def git_head() -> str | None:
    try:
        proc = subprocess.run(
            ["git", "rev-parse", "HEAD"],
            cwd=repo_root(),
            check=False,
            text=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
        )
    except OSError:
        return None
    if proc.returncode != 0:
        return None
    return proc.stdout.strip() or None


def load_json(path: Path) -> Any:
    with path.open("r", encoding="utf-8") as f:
        return json.load(f)


def resolve_repo_path(path_text: str | None) -> Path | None:
    if not path_text:
        return None
    path = Path(path_text)
    if path.is_absolute():
        return path
    return repo_root() / path


def verification_path_for_pack(pack_dir: Path) -> Path | None:
    name = pack_dir.name
    if name == "projected_j0_positive_box_certificate_pack":
        return repo_root() / "audit_outputs/projected_j0_positive_box_pack_verification.json"
    if name == "projected_j0_seed_hurts_certificate_pack":
        return repo_root() / "audit_outputs/projected_j0_seed_hurts_pack_verification.json"
    candidate = repo_root() / "audit_outputs" / f"{name}_verification.json"
    return candidate if candidate.exists() else None


def lean_schema_target(pack_dir: Path) -> str:
    name = pack_dir.name
    if "positive_box" in name:
        return "ProjectedJ0ConstantBoxData / ProjectedJ0ConstantAtlasData"
    if "seed_hurts" in name:
        return "ProjectedJ0ConstantBoxData combined only; separate nao deve ser usado para s0.74_t45"
    return "ProjectedJ0ConstantBoxData"


def max_rerun_diff(verification: dict[str, Any] | None) -> float | None:
    if not verification:
        return None
    diffs = verification.get("max_abs_diffs") or {}
    if not diffs:
        return None
    return max(float(value) for value in diffs.values())


def pack_record(pack_dir_text: str, head: str | None) -> dict[str, Any]:
    pack_dir = Path(pack_dir_text)
    if not pack_dir.is_absolute():
        pack_dir = repo_root() / pack_dir
    pack_dir = pack_dir.resolve()
    config_path = pack_dir / "config.json"
    config = load_json(config_path) if config_path.exists() else {}
    verification_path = verification_path_for_pack(pack_dir)
    verification = (
        load_json(verification_path)
        if verification_path is not None and verification_path.exists()
        else None
    )
    pack_summary = (verification or {}).get("pack_summary") or config.get("summary") or {}
    checks_failed = (verification or {}).get("checks_failed")
    rerun_exit_code = ((verification or {}).get("rerun") or {}).get("exit_code")
    verification_status = "missing"
    if verification is not None:
        verification_status = (
            "verified"
            if checks_failed == [] and rerun_exit_code == 0
            else "failed"
        )
    script_path = resolve_repo_path(
        config.get("script") or "operadores/c2_projected_j0_interval_box_certifier.py"
    )
    hashes = {name.replace(".", "_").replace("-", "_") + "_hash": sha256_file(pack_dir / name)
              for name in PACK_FILES}
    return {
        "pack_name": pack_dir.name,
        "pack_dir": str(pack_dir),
        "config_hash": hashes.get("config_json_hash"),
        "boxes_csv_hash": hashes.get("boxes_csv_hash"),
        "boxes_json_hash": hashes.get("boxes_json_hash"),
        "commands_hash": hashes.get("commands_sh_hash"),
        "readme_hash": hashes.get("README_md_hash"),
        "summary_hash": hashes.get("summary_md_hash"),
        "certifier_script_hash": sha256_file(script_path) if script_path else None,
        "git_head": head,
        "verification_json": str(verification_path) if verification_path and verification_path.exists() else None,
        "verification_status": verification_status,
        "boxes_count": pack_summary.get("boxes"),
        "certified_combined_count": pack_summary.get("certified_combined"),
        "certified_separate_count": pack_summary.get("certified_separate"),
        "min_budget_combined": pack_summary.get("min_budget_combined"),
        "min_budget_separate": pack_summary.get("min_budget_separate"),
        "worst_combined_box": (verification or {}).get("worst_box_combined"),
        "worst_separate_box": (verification or {}).get("worst_box_separate"),
        "rerun_exit_code": rerun_exit_code,
        "max_rerun_diff": max_rerun_diff(verification),
        "lean_schema_target": lean_schema_target(pack_dir),
    }


def write_markdown(path: Path, manifest: dict[str, Any]) -> None:
    lines = [
        "# Audit Projected J0 External Certificate Manifest",
        "",
        f"Data UTC: {manifest['created_at_utc']}.",
        "",
        "Este manifest liga packs externos verificados a documentacao e ao",
        "schema Lean existente. Ele nao insere numeros como teoremas e nao",
        "transforma CSV em prova Lean.",
        "",
        "## Packs",
        "",
    ]
    for pack in manifest["packs"]:
        lines.extend([
            f"### {pack['pack_name']}",
            "",
            f"- Diretório: `{pack['pack_dir']}`",
            f"- Verificação: `{pack['verification_status']}`",
            f"- JSON de verificação: `{pack['verification_json']}`",
            f"- Caixas: {pack['boxes_count']}",
            f"- Combined certificados: {pack['certified_combined_count']}/{pack['boxes_count']}",
            f"- Separate certificados: {pack['certified_separate_count']}/{pack['boxes_count']}",
            f"- Min budget combined: {pack['min_budget_combined']}",
            f"- Min budget separate: {pack['min_budget_separate']}",
            f"- Worst combined box: `{pack['worst_combined_box']}`",
            f"- Worst separate box: `{pack['worst_separate_box']}`",
            f"- Rerun exit code: {pack['rerun_exit_code']}",
            f"- Max rerun diff: {pack['max_rerun_diff']}",
            f"- Lean schema target: `{pack['lean_schema_target']}`",
            "",
        ])
    lines.extend([
        "## Leitura",
        "",
        "O pack positive-box e o bloco robusto atual: foi verificado, reproduziu",
        "com diff maximo zero e certifica todas as caixas em combined e separate.",
        "",
        "O pack seed_hurts e fronteira fina: foi verificado e reproduzido, mas a",
        "primeira caixa so deve ser usada em combined.",
        "",
        "## O Que Falta Para Prova Lean",
        "",
        "Ainda falta uma das seguintes frentes:",
        "",
        "1. um verificador externo confiavel com contrato formal claro;",
        "2. formalizacao da aritmetica intervalar relevante;",
        "3. importacao ou validacao certificada das constantes por caixa;",
        "4. prova regional dos campos analiticos consumidos por",
        "   `ProjectedJ0ConstantBoxData`.",
        "",
        "Nenhum numero dos packs foi inserido como theorem.",
        "",
    ])
    path.write_text("\n".join(lines), encoding="utf-8")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--pack-dir", action="append", required=True)
    parser.add_argument("--out-json", required=True)
    parser.add_argument("--out-md", required=True)
    args = parser.parse_args()

    head = git_head()
    manifest = {
        "created_at_utc": datetime.now(timezone.utc).isoformat(),
        "git_head": head,
        "packs": [pack_record(pack_dir, head) for pack_dir in args.pack_dir],
    }

    out_json = Path(args.out_json)
    if not out_json.is_absolute():
        out_json = repo_root() / out_json
    out_json.parent.mkdir(parents=True, exist_ok=True)
    with out_json.open("w", encoding="utf-8") as f:
        json.dump(manifest, f, indent=2, sort_keys=True)
        f.write("\n")

    out_md = Path(args.out_md)
    if not out_md.is_absolute():
        out_md = repo_root() / out_md
    write_markdown(out_md, manifest)


if __name__ == "__main__":
    main()
