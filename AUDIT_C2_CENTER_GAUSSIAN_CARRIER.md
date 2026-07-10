# AUDIT_C2_CENTER_GAUSSIAN_CARRIER

## Escopo

Arquivo Lean criado:

```text
LeanC2/AuditC2CenterGaussianCarrier.lean
```

Ele importa `LeanC2/AuditGenuineMiddle.lean` e mantém a construção como
audit-only.

## Definição fonte

`genuineCentralDoubleSeries` foi localizado em:

```text
LeanC2/Analytic/GenuineInfinite.lean
```

A forma atual é uma soma em `p : Nat × Nat`, com coordenadas:

```text
k = p.1 + 2
m = 2 * p.2 + 1
```

## Carrier formalizado

Foram definidos:

```lean
c2CenterGaussianAddressTerm
c2CenterGaussianRectangle
c2CenterGaussianSeries
c2CenterGaussianSeriesAddressTerm
```

O termo novo usa o centro `2^k * m` e o cutoff quadrático:

```lean
superGaussianCutoffWeight 2 X (2 ^ k * m)
```

## Equivalência de coordenadas

Foram provados:

```lean
c2_center_coordinate_coeff_eq
c2CenterGaussianAddressTerm_eq_superGaussianGenuineAddressTerm
superGaussianGenuineAddressTerm_eq_c2CenterGaussianAddressTerm
c2CenterGaussianRectangle_eq_superGaussianFiniteGenuineRectangle
c2CenterGaussianSeriesAddressTerm_eq_superGaussian
```

A identidade central é:

```text
2 * verticalRatio(s)^k * complexDirichletCoeff s m
=
2 * 2^(-k) * complexDirichletCoeff s (2^k * m)
```

formalizada via `dyadicWeight`, `verticalRatio_eq`,
`complexDirichletCoeff_mul` e `complexDirichletCoeff_two_pow`.

## Somabilidade

Foi provada somabilidade absoluta da família completa no regime:

```lean
0 < X
0 < s.re
```

Lemas principais:

```lean
c2CenterGaussianSeriesNormMajorant
superGaussianCutoffWeight_two_norm_le_core_exp
summable_c2CenterGaussianSeriesNormMajorant
c2CenterGaussianSeriesAddressTerm_norm_le_majorant
summable_c2CenterGaussianSeriesAddressTerm_norm
summable_c2CenterGaussianSeriesAddressTerm
hasSum_c2CenterGaussianSeriesAddressTerm
```

A prova separa:

```text
depth: geometric factor (1/2)^(k+2)
odd core: exponential factor from the quadratic cutoff
```

## Convergência de retângulos

Foram provadas duas formas:

```lean
tendsto_c2CenterGaussianRectangle_succ_to_finiteCoreDepthLimit
tendsto_c2CenterGaussianSeries_finsetRectangles
```

A primeira é a convergência já disponível para cutoff horizontal finito.

A segunda é a forma cofinal do carrier infinito: somas sobre retângulos finitos
`Finset Nat × Finset Nat` convergem para `c2CenterGaussianSeries X s`.

## Status

Compilação realizada:

```text
lake env lean LeanC2/AuditC2CenterGaussianCarrier.lean
```

Resultado: passou.

Busca local no arquivo novo por termos bloqueados: sem ocorrências.

## Próximo alvo

O carrier C2 center Gaussian agora está formalizado e tem somabilidade
genuine-first no semiplano direito. O próximo trabalho natural é escolher qual
ponte local deve consumir `c2CenterGaussianSeries X s` como operador regularizado
do centro.
