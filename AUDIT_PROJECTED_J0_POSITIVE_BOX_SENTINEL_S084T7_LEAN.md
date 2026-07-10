# Audit Projected J0 Positive Box Sentinel S084T7 Lean

## Arquivo Lean

Criado:

```text
LeanC2/AuditProjectedJ0PositiveBoxSentinelS084T7.lean
```

Import:

```text
LeanC2.AuditProjectedJ0PositiveBoxSkeleton
```

Namespace:

```text
C2.ProjectedJ0PositiveBoxSkeleton
```

## Origem Dos Dados

Os intervalos das subcaixas foram lidos de:

```text
audit_outputs/projected_j0_positive_box_sector_subbox_certificate/subboxes.jsonl
audit_outputs/projected_j0_positive_box_sector_subbox_certificate/boxes_summary.json
audit_outputs/projected_j0_positive_box_sector_rationalized_pack/boxes_sector_rationalized.csv
LeanC2/AuditAdjustedQuartetProjectedJ0PositiveBoxSectorRationalizedData.lean
```

Para `s0.84_t7`, o certificado externo registra:

```text
subboxes = 32
sigma_min = sigma_max = 0.84
t_min = 32.855
t_max = 32.859
```

O certificado combined Lean correspondente e:

```text
positiveBoxSector_s0_84_t7_combined_certificate
```

via:

```text
positiveBoxCombinedCert PositiveBoxId.s084_t7
```

## SubboxId

Foi criado:

```text
S084T7SubboxId
```

com 32 construtores:

```text
sb0 ... sb31
```

e:

```text
s084T7Subboxes := Finset.univ
mem_s084T7Subboxes_all
```

## Regioes Das Subcaixas

Foi criado:

```text
s084T7SubboxRect : S084T7SubboxId -> RectRegion
s084T7SubboxRegion : S084T7SubboxId -> Set C
```

Os endpoints em `t` foram copiados das strings decimais do JSONL externo. Para
preservar exatamente esses valores no skeleton, foi usado:

```text
q15 n = n / 10^15
```

Exemplos:

```text
32.855124999999994 = 32855124999999994 / 10^15
32.858875000000005 = 32858875000000005 / 10^15
```

## Cobertura

A cobertura concreta:

```text
positiveBoxRegion PositiveBoxId.s084_t7
  coberta por s084T7SubboxRegion i, i em s084T7Subboxes
```

foi deixada como hipotese explicita:

```text
S084T7SubboxCoverHypothesis
```

Motivo: a prova por 32 intervalos e mecanica, mas adicionaria ruido a esta
camada. Esta etapa fixa o formato da caixa sentinela e o consumidor condicional.

## Bounds Externos Por Subbox

Foi criada:

```text
S084T7SubboxBounds
```

Campos:

```text
main_lower:
  mainLower_s084_t7 <= ||adjustedProjectedJ0_M tiltSeed s||

d0_neg_upper:
  adjustedProjectedJ0_D0NegReMain tiltSeed coreCutoff s <= d0NegReUpper_s084_t7

rest_upper:
  adjustedProjectedJ0_restCostFinite tiltSeed coreCutoff K Midx s <= restUpper_s084_t7
```

Esses campos sao exigidos por subcaixa e usam as constantes do certificado
combined de `s0.84_t7`.

## Conversao Para SubboxCoverData

Foi provado:

```text
S084T7SubboxBounds.toSubboxCoverData
```

Ele transforma:

```text
S084T7SubboxBounds
+ S084T7SubboxCoverHypothesis
```

em:

```text
ProjectedJ0SubboxCoverData
```

para a regiao:

```text
positiveBoxRegion PositiveBoxId.s084_t7
```

## Theorem Condicional

Foi provado:

```text
s084T7_totalFinite_ne_zero_of_subbox_bounds
```

Leitura:

```text
bounds externos por subbox
+ cobertura externa das 32 subcaixas
------------------------------------------------
totalFinite != 0 em s0.84_t7
```

Tambem foi criada a estrutura opcional:

```text
PositiveBoxPartialCoversS084T7
```

com o theorem:

```text
PositiveBoxPartialCoversS084T7.totalFinite_ne_zero_on_s084T7
```

## O Que Ainda Fica Externo

Esta camada nao inclui:

```text
retangulos brutos por subbox;
prova de pertencimento analitico aos retangulos;
prova dos bounds analiticos por subbox;
prova concreta de cobertura por intervalos;
cobertura das outras 26 boxes;
atlas global completo com dados;
formalizacao de transcendentes/enclosures.
```

## Verificacao

Comando rodado:

```text
lake env lean LeanC2/AuditProjectedJ0PositiveBoxSentinelS084T7.lean
lake build LeanC2.AuditProjectedJ0PositiveBoxSentinelS084T7
```

Resultado: ambos passaram. O build reexecutou dependencias antigas e emitiu
avisos de lint ja existentes fora do arquivo novo; nao houve erro na sentinela.
