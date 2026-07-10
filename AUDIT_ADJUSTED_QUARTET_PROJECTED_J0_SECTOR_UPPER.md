# Audit Adjusted Quartet Projected J0 Sector Upper

Data: 2026-07-09.

Rota: Genuine-First. Esta camada formaliza o caso setorial em que o termo
dominante `D0` nao tem componente destrutiva contra o main.

## Arquivo Lean

Criado:

```text
LeanC2/AuditAdjustedQuartetProjectedJ0SectorUpper.lean
```

Imports:

```lean
import LeanC2.AuditAdjustedQuartetProjectedJ0D0NumeratorUpper
import LeanC2.AuditAdjustedQuartetProjectedJ0ConstantAtlas
```

Namespace:

```lean
C2.AdjustedQuartetProjectedJ0Aliases
```

## Setor Nao Destrutivo

Estrutura criada:

```lean
structure ProjectedJ0D0NonDestructiveSectorData
```

Campos:

```text
adjustedProjectedJ0_M tiltSeed s != 0
adjustedProjectedJ0_D0NegReMain tiltSeed coreCutoff s <= 0
```

Leitura:

```text
D0NegReMain = -Re(D0 * conj(M)) <= 0.
```

Isso implica:

```text
destructiveNumerator(M,D0) = 0
parallelUpper = 0
```

## Conversores

Teoremas que compilam:

```lean
ProjectedJ0D0NonDestructiveSectorData.toNegReUpperData
ProjectedJ0D0NonDestructiveSectorData.toParallelUpperData
```

Eles geram:

```text
numeratorUpper(s) = 0
parallelUpper(s) = 0
```

e alimentam diretamente a camada `ProjectedJ0ParallelUpperData`.

## Consumidor Finite Regional

Estrutura criada:

```lean
structure AdjustedProjectedJ0FiniteSectorBoundedData
```

Campos principais:

```text
setor nao destrutivo
restCostFinite(s) <= restUpper(s)
0 < mainExactLower(s) - restUpper(s)
```

Teoremas:

```lean
AdjustedProjectedJ0FiniteSectorBoundedData.toFiniteBoundedData
AdjustedProjectedJ0FiniteSectorBoundedData.total_ne_zero
```

Conclusao:

```lean
∀ s ∈ Region,
  adjustedProjectedJ0_totalFinite tiltSeed coreCutoff K M s ≠ 0
```

## Caixa Constante Setorial

Estrutura criada:

```lean
structure ProjectedJ0SectorConstantBoxData
```

Campos:

```text
0 < mainNormLowerConst
mainNormLowerConst <= ||M(s)||
D0NegReMain(s) <= 0
restCostFinite(s) <= restUpperConst
0 < mainNormLowerConst - restUpperConst
```

Teoremas:

```lean
ProjectedJ0SectorConstantBoxData.toFiniteSectorBoundedData
ProjectedJ0SectorConstantBoxData.total_ne_zero
```

## Leitura Para Positive-Box

O scout angular indicou `lambda = 0` nos pontos da positive-box. A camada
setorial e a forma abstrata para transformar um certificado de
`D0NegReMain <= 0` em:

```text
parallelUpper = 0
```

Assim a obrigacao da caixa deixa de ser:

```text
mainLower - numeratorUpper/mainLower - restUpper > 0
```

e passa a ser:

```text
mainLower - restUpper > 0.
```

## Limite

Esta camada nao prova o setor. Ela apenas consome a hipotese setorial ou um
certificado externo futuro que a forneca.

## Proximo Passo

Certificar por intervalo, nas caixas positive-box, que:

```text
-Re(D0 * conj(M)) <= 0.
```

Se as 27 caixas passarem, o positive-box pode usar um pack setorial com
`numeratorUpper = 0`.
