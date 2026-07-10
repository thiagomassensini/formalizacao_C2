# Audit Projected J0 Rationalized Bridge Lean

Data: 2026-07-08.

Rota: Genuine-First. Esta camada liga os certificados racionalizados do
positive-box ao scaffold `ProjectedJ0ConstantBoxData`, mas somente de forma
condicional: as enclosures analiticas continuam sendo hipoteses externas.

## Arquivo Lean

Criado:

```text
LeanC2/AuditAdjustedQuartetProjectedJ0PositiveBoxRationalizedBridge.lean
```

Imports:

```lean
import LeanC2.AuditAdjustedQuartetProjectedJ0PositiveBoxRationalizedData
import LeanC2.AuditAdjustedQuartetProjectedJ0ConstantAtlas
```

Namespace:

```lean
C2.AdjustedQuartetProjectedJ0Aliases
```

## Hipoteses externas

Estrutura combined:

```lean
ProjectedJ0ExternalAnalyticBoxHypotheses
```

Campos:

```text
mainLower <= ||M(s)||
D0NegReMain(s) <= numeratorUpper
restCostFinite(s) <= restUpper
```

Estrutura separate:

```lean
ProjectedJ0ExternalAnalyticBoxSeparateHypotheses
```

Ela troca o campo de resto por:

```text
separateRestCostFinite(s) <= restUpper
```

## Conversores

O certificado racionalizado gera `ProjectedJ0ConstantBoxData` quando recebe as
hipoteses analiticas externas:

```lean
ProjectedJ0RationalizedBoxCertificate.toConstantBoxData
ProjectedJ0RationalizedBoxCertificate.toConstantBoxSeparateRestData
```

O ponto tecnico e o transporte do budget racional para real:

```lean
ProjectedJ0RationalizedBoxCertificate.budget_pos_real
```

Ele converte a prova racional de:

```text
0 < mainLower - numeratorUpper/mainLower - restUpper
```

para a mesma desigualdade em `Real`.

## Consumidores

Teoremas pointwise por caixa:

```lean
ProjectedJ0RationalizedBoxCertificate.total_ne_zero_of_external_hypotheses
ProjectedJ0RationalizedBoxCertificate.total_ne_zero_of_external_separate_hypotheses
```

Leitura: certificado racionalizado + bounds analiticos externos implicam:

```lean
∀ s ∈ Region, adjustedProjectedJ0_totalFinite tiltSeed coreCutoff K M s ≠ 0
```

## Pior caixa positive-box

Foram instanciados teoremas condicionais para a pior caixa do pack:

```lean
positiveBox_s0_84_t7_combined_total_ne_zero_of_external_hypotheses
positiveBox_s0_84_t7_separate_total_ne_zero_of_external_hypotheses
```

Eles ainda exigem as hipoteses externas correspondentes para a regiao da caixa.

## Atlas condicional

Foi criada a estrutura:

```lean
PositiveBoxRationalizedExternalAtlasHypotheses
```

Ela recebe:

```text
cover do GlobalRegion por caixas;
um certificado racionalizado por box;
hipoteses analiticas externas por box.
```

Teorema:

```lean
PositiveBoxRationalizedExternalAtlasHypotheses.total_ne_zero
```

Esse teorema entrega nonzero no `GlobalRegion` sob essas hipoteses.

## Contagem dos dados

Foram adicionados agregados leves:

```lean
positiveBoxCombinedCertificateCount = 27
positiveBoxSeparateCertificateCount = 27
positiveBoxCombinedCertificates_length
positiveBoxSeparateCertificates_length
```

## Limite

Esta camada nao prova:

```text
mainLower <= ||M(s)||
D0NegReMain(s) <= numeratorUpper
restCostFinite(s) <= restUpper
cobertura analitica global
```

Ela tambem nao transforma CSV em prova Lean. Ela apenas conecta a algebra
racional verificada ao consumidor formal `ConstantAtlas` mediante hipoteses
externas explicitas.
