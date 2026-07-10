# Audit Projected J0 Positive Box Sector Rationalized Lean Data

Data: 2026-07-09.

Rota: Genuine-First. Este relatorio registra a geracao de dados Lean para o
pack setorial racionalizado. O arquivo Lean prova apenas algebra racional.

## Scripts E Arquivos

Script criado:

```text
operadores/c2_projected_j0_generate_lean_sector_rationalized_data.py
```

Schema criado:

```text
LeanC2/AuditAdjustedQuartetProjectedJ0SectorRationalizedCertificateSchema.lean
```

Arquivo Lean gerado:

```text
LeanC2/AuditAdjustedQuartetProjectedJ0PositiveBoxSectorRationalizedData.lean
```

Comando:

```bash
python3 operadores/c2_projected_j0_generate_lean_sector_rationalized_data.py \
  --pack-dir audit_outputs/projected_j0_positive_box_sector_rationalized_pack/ \
  --out-lean LeanC2/AuditAdjustedQuartetProjectedJ0PositiveBoxSectorRationalizedData.lean
```

## Schema

O schema define:

```lean
structure ProjectedJ0SectorRationalizedBoxConstants where
  mainLower : ℚ
  d0NegReUpper : ℚ
  restUpper : ℚ
```

Predicados:

```lean
ProjectedJ0SectorRationalizedBudgetPositive
ProjectedJ0SectorRationalizedNonDestructive
```

Certificado:

```lean
structure ProjectedJ0SectorRationalizedBoxCertificate
```

Campos checados:

```text
mainLower > 0
restUpper >= 0
d0NegReUpper <= 0
mainLower - restUpper > 0
```

## Dados Gerados

Foram gerados:

```text
27 certificados combined
27 certificados separate
```

Tambem foram geradas listas:

```lean
positiveBoxSectorCombinedRationalizedCertificates
positiveBoxSectorSeparateRationalizedCertificates
```

e os teoremas de tamanho:

```lean
positiveBoxSectorCombinedCertificates_length
positiveBoxSectorSeparateCertificates_length
```

## Verificacao

Passaram:

```bash
lake env lean LeanC2/AuditAdjustedQuartetProjectedJ0SectorRationalizedCertificateSchema.lean
lake env lean LeanC2/AuditAdjustedQuartetProjectedJ0PositiveBoxSectorRationalizedData.lean
```

O build do modulo de dados tambem passou.

## Limite

Estes teoremas nao provam que as constantes majoram/minoram as funcoes
analiticas. Eles provam apenas a algebra racional dos dados arredondados.
