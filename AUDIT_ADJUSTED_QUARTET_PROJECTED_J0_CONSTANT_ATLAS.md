# Audit Adjusted Quartet Projected J0 Constant Atlas

Data: 2026-07-08.

Rota: Genuine-First. Esta camada Lean consome constantes por caixa para a rota
`numeratorUpper / mainNormLower`. Ela nao prova as constantes, nao prova
cobertura global e nao fecha o middle.

## Arquivo Lean

Criado:

```text
LeanC2/AuditAdjustedQuartetProjectedJ0ConstantAtlas.lean
```

Import:

```lean
import LeanC2.AuditAdjustedQuartetProjectedJ0RatioUpper
```

Namespace:

```lean
C2.AdjustedQuartetProjectedJ0Aliases
```

## Box data combined

Estrutura criada:

```lean
structure ProjectedJ0ConstantBoxData
```

Campos:

```text
0 < mainNormLowerConst
mainNormLowerConst ≤ ‖M(s)‖
0 ≤ numeratorUpperConst
D0NegReMain(s) ≤ numeratorUpperConst
restCostFinite(s) ≤ restUpperConst
0 < mainNormLowerConst
  - numeratorUpperConst / mainNormLowerConst
  - restUpperConst
```

Teoremas que compilam:

```lean
ProjectedJ0ConstantBoxData.toConstantRatioUpperData
ProjectedJ0ConstantBoxData.toFiniteRatioBoundedData
ProjectedJ0ConstantBoxData.total_ne_zero
```

O ponto tecnico e que o budget constante usa `mainNormLowerConst`, enquanto o
bounded ledger usa `mainExactLower = ‖M‖`. A prova usa:

```text
mainNormLowerConst ≤ ‖M(s)‖
```

para transportar a positividade do budget constante para o budget regional.

## Variante separate rest

Estrutura criada:

```lean
structure ProjectedJ0ConstantBoxSeparateRestData
```

Ela troca o campo de resto por:

```lean
adjustedProjectedJ0_separateRestCostFinite tiltSeed coreCutoff K M s ≤
  restUpperConst
```

Teoremas que compilam:

```lean
ProjectedJ0ConstantBoxSeparateRestData.toConstantRatioUpperData
ProjectedJ0ConstantBoxSeparateRestData.total_ne_zero
```

A prova chama o consumidor regional separate do bounded ledger.

## Atlas finito

Estrutura criada:

```lean
structure ProjectedJ0ConstantAtlasData
```

Campos principais:

```text
cover :
  ∀ s ∈ GlobalRegion, ∃ i ∈ boxes, s ∈ BoxRegion i

boxData :
  ∀ i ∈ boxes, ProjectedJ0ConstantBoxData (BoxRegion i) ...
```

Teorema que compila:

```lean
ProjectedJ0ConstantAtlasData.total_ne_zero
```

Leitura: se uma familia finita de caixas cobre `GlobalRegion`, e cada caixa
for preenchida com `ProjectedJ0ConstantBoxData`, entao o total finito e nao
nulo em `GlobalRegion`.

## O que esta camada nao faz

Nao prova `mainNormLowerConst`.

Nao prova `numeratorUpperConst`.

Nao prova `restUpperConst`.

Nao prova a cobertura `cover`.

Nao transforma diagnostico numerico em prova.

Nao importa `PeerReview` nem rotas terminais.

## Formato esperado para certificado futuro

Para cada caixa, um certificado intervalar ou geometrico deve preencher:

```text
mainNormLowerConst
numeratorUpperConst
restUpperConst
budget positivo
```

Depois, a camada `ConstantAtlas` consome esses campos e entrega:

```lean
∀ s ∈ Region, adjustedProjectedJ0_totalFinite tiltSeed coreCutoff K M s ≠ 0
```

## Verificacao

Comandos executados:

```bash
lake env lean LeanC2/AuditAdjustedQuartetProjectedJ0ConstantAtlas.lean
lake build LeanC2.AuditAdjustedQuartetProjectedJ0ConstantAtlas
```
