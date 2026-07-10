# Audit Projected J0 Positive Box All Subbox Skeleton Lean

## Gerador

Script criado:

```text
operadores/c2_generate_positive_box_subbox_skeleton.py
```

Arquivo Lean gerado:

```text
LeanC2/AuditProjectedJ0PositiveBoxAllSubboxSkeleton.lean
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
subboxes = 771;
cada subbox tem sigma_min, sigma_max, t_min, t_max;
cada source_box_id corresponde a PositiveBoxId;
cada source_box_id tem certificado combined correspondente.
```

## Representacao Lean

Foi usada a opcao de tipo global:

```text
PositiveBoxSubboxId
```

com 771 construtores gerados automaticamente.

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
covers externos dos 771 subboxes
+ bounds externos por subbox
------------------------------------------------
totalFinite != 0 em positiveGlobalRegion
```

## Comparacao Com Sentinela

Para `s0.84_t7`, o gerador encontrou:

```text
subboxes = 32
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

Verificacoes executadas:

```text
python3 -m py_compile operadores/c2_generate_positive_box_subbox_skeleton.py
python3 operadores/c2_generate_positive_box_subbox_skeleton.py \
  --subboxes-jsonl audit_outputs/projected_j0_positive_box_sector_subbox_certificate/subboxes.jsonl \
  --boxes-summary audit_outputs/projected_j0_positive_box_sector_subbox_certificate/boxes_summary.json \
  --sector-rat-csv audit_outputs/projected_j0_positive_box_sector_rationalized_pack/boxes_sector_rationalized.csv \
  --out-lean LeanC2/AuditProjectedJ0PositiveBoxAllSubboxSkeleton.lean \
  --out-md AUDIT_PROJECTED_J0_POSITIVE_BOX_ALL_SUBBOX_SKELETON_LEAN.md
lake env lean LeanC2/AuditProjectedJ0PositiveBoxAllSubboxSkeleton.lean
lake build LeanC2.AuditProjectedJ0PositiveBoxAllSubboxSkeleton
```

Resultados:

```text
py_compile: passou;
gerador: passou, boxes=27, subboxes=771;
lake env lean: passou;
lake build: passou.
```

Observacao: o build reproduziu warnings antigos em dependencias ja existentes,
mas o modulo novo `LeanC2.AuditProjectedJ0PositiveBoxAllSubboxSkeleton`
foi construido com sucesso.
