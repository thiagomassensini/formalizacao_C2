# Audit Projected J0 Positive Box Subbox Coverage Lean

## Verificador Externo

Criado:

```text
operadores/c2_verify_positive_box_subbox_coverage.py
```

Resultado:

```text
checks_failed = 0
boxes_count = 27
subboxes_count = 771
boxes_with_full_coverage = 27
boxes_with_gaps = 0
boxes_with_bad_sigma = 0
boxes_with_internal_overlaps = 0
max_gap = 0
max_overlap = 0
s0.84_t7 subboxes = 32
```

O verificador usa `Decimal` e `Fraction`, sem passar por float, para comparar
endpoints. Ele confirmou que as subcaixas formam particoes racionais exatas de
cada box.

## Gerador Lean

Criado:

```text
operadores/c2_generate_positive_box_subbox_coverage_lean.py
```

Arquivo Lean gerado:

```text
LeanC2/AuditProjectedJ0PositiveBoxSubboxCoverage.lean
```

## Prova Lean De Cobertura

Foram gerados e compilados:

```text
positiveBox_subbox_cover_s084_t0
...
positiveBox_subbox_cover_s086_t8
positiveBox_all_subbox_cover
```

Isto prova `PositiveBoxAllSubboxCoverHypotheses` para todos os 27 boxes.

## Theorem Sem Hipotese De Cobertura

Foi criado e compilou:

```text
positiveBox_totalFinite_ne_zero_of_all_subbox_bounds_no_cover_hyp
```

Leitura:

```text
bounds externos por subbox
------------------------------------------------
totalFinite != 0 em positiveGlobalRegion
```

A cobertura por subbox deixou de ser hipotese externa neste theorem. Os bounds
por subbox continuam externos.

## Verificacao

Comandos rodados:

```text
python3 -m py_compile operadores/c2_verify_positive_box_subbox_coverage.py
python3 -m py_compile operadores/c2_generate_positive_box_subbox_coverage_lean.py

python3 operadores/c2_verify_positive_box_subbox_coverage.py \
  --subboxes-jsonl audit_outputs/projected_j0_positive_box_sector_subbox_certificate/subboxes.jsonl \
  --boxes-summary audit_outputs/projected_j0_positive_box_sector_subbox_certificate/boxes_summary.json \
  --sector-rat-csv audit_outputs/projected_j0_positive_box_sector_rationalized_pack/boxes_sector_rationalized.csv \
  --out-json audit_outputs/projected_j0_positive_box_subbox_coverage_verification.json \
  --out-md AUDIT_PROJECTED_J0_POSITIVE_BOX_SUBBOX_COVERAGE_VERIFICATION.md

python3 operadores/c2_generate_positive_box_subbox_coverage_lean.py \
  --skeleton-lean LeanC2/AuditProjectedJ0PositiveBoxAllSubboxSkeleton.lean \
  --subboxes-jsonl audit_outputs/projected_j0_positive_box_sector_subbox_certificate/subboxes.jsonl \
  --boxes-summary audit_outputs/projected_j0_positive_box_sector_subbox_certificate/boxes_summary.json \
  --out-lean LeanC2/AuditProjectedJ0PositiveBoxSubboxCoverage.lean

lake env lean LeanC2/AuditProjectedJ0PositiveBoxSubboxCoverage.lean
lake build LeanC2.AuditProjectedJ0PositiveBoxSubboxCoverage
```

Resultados:

```text
py_compile: passou para os dois scripts;
verificador externo: passou, checks_failed = 0;
gerador Lean: passou, boxes=27, subboxes=771;
lake env lean: passou;
lake build: passou, modulo construido em 264s.
```

O build reproduziu warnings antigos em dependencias ja existentes. O modulo de
cobertura foi construido com sucesso.

## O Que Ainda Fica Externo

Continuam externos:

```text
bounds por subbox;
retangulos brutos;
pertencimento dos objetos aos retangulos;
geracao analitica das enclosures;
transcendentais.
```
