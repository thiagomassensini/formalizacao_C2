# AUDIT_C2_CENTER_GAUSSIAN_TAIL_BUDGET_LEAN

## Status

Esta etapa voltou ao Lean e fechou o budget funcional da cauda do carrier C2
center Gaussian.

Arquivo alterado:

```text
LeanC2/AuditC2CenterGaussianCarrier.lean
```

## O Que Foi Criado

Foi definida a cauda exata de normas fora do corte por centro:

```lean
c2CenterGaussianCenterCutoffTailNormUpper X s nmax K
```

Ela e um `tsum` no complemento de:

```lean
c2CenterGaussianByCenterCutoffAddressSet nmax K
```

Tambem foi criada a estrutura:

```lean
C2CenterGaussianTailLiftBudget X s nmax K margin
```

com o campo:

```lean
tail_le_margin :
  c2CenterGaussianCenterCutoffTailNormUpper X s nmax K <= margin
```

Na etapa seguinte foi adicionada uma cauda majorante sem dependencia fina em
`s`:

```lean
c2CenterGaussianCenterCutoffMajorantTail X nmax K
```

e a estrutura:

```lean
C2CenterGaussianMajorantTailLiftBudget X nmax K margin
```

com o campo:

```lean
majorant_tail_le_margin :
  c2CenterGaussianCenterCutoffMajorantTail X nmax K <= margin
```

Nesta etapa foi adicionada a cauda sharp por real-part inferior `sigma`,
mantendo o centro real:

```lean
c2CenterGaussianSeriesSigmaMajorant X sigma p
c2CenterGaussianCenterCutoffSigmaTail X sigma nmax K
```

O termo usa:

```text
c = 2^(p.1+2) * (2*p.2+1)
2 * (1/2)^(p.1+2) * c^(-sigma) * exp(-((c/X)^2))
```

e o budget:

```lean
C2CenterGaussianSigmaTailLiftBudget X sigma nmax K margin
```

com o campo:

```lean
sigma_tail_le_margin :
  c2CenterGaussianCenterCutoffSigmaTail X sigma nmax K <= margin
```

Foi tambem isolada a nocao de corte full-depth:

```lean
C2CenterGaussianFullDepthCutoff nmax K
```

e a cauda sharp por limiar de centro:

```lean
c2CenterGaussianCenterThresholdSigmaTail X sigma nmax
```

Ela soma a mesma majorante sharp apenas nos enderecos com:

```text
nmax < c + 1
```

Foi provado que `nmax <= 2^(K+1)` implica full-depth:

```lean
C2CenterGaussianFullDepthCutoff.of_nmax_le_two_pow_succ
```

e foi criada a estrutura:

```lean
C2CenterGaussianCenterThresholdTailLiftBudget X sigma nmax margin
```

Nesta etapa tambem foi fechada a unicidade dos centros C2:

```lean
c2CenterGaussianAddressCore_odd
c2CenterGaussianAddressCenter_v2
c2CenterGaussianAddressCenter_injective
c2CenterGaussianAddressCenter_eq_iff
```

O ponto formal e:

```text
center(p) = 2^(p.1+2) * (2*p.2+1)
```

determina unicamente o endereco `p`. A prova usa apenas a aritmetica C2:
o core e impar, `v2(center(p)) = p.1+2`, e depois o fator dyadico comum e
cancelado.

## Teoremas Fechados

O erro entre o carrier infinito e o corte finito por centro foi majorado pela
cauda exata:

```lean
norm_c2CenterGaussianSeries_sub_byCenterCutoff_le_tailNormUpper
```

Forma consumidora:

```lean
C2CenterGaussianTailLiftBudget.error_bound
```

Forma estrita usada no lift de caixas:

```lean
C2CenterGaussianTailLiftBudget.error_lt_boundary_margin
```

Esta ultima diz que, se:

```text
tailBound < boundaryMargin
```

entao:

```text
||c2CenterGaussianSeries X s
    - c2CenterGaussianByCenterCutoff X s nmax K||
  < boundaryMargin
```

Tambem foi fechado que a cauda exata e majorada pela cauda produtiva:

```lean
c2CenterGaussianCenterCutoffTailNormUpper_le_majorantTail
```

e que o budget majorante alimenta automaticamente o budget funcional:

```lean
C2CenterGaussianMajorantTailLiftBudget.to_tailLiftBudget
C2CenterGaussianMajorantTailLiftBudget.error_lt_boundary_margin
```

Tambem foi fechado que, se `0 <= sigma` e `sigma <= s.re`, a cauda exata e
majorada pela cauda sharp:

```lean
c2CenterGaussianCenterCutoffTailNormUpper_le_sigmaTail
```

e que o budget sharp alimenta diretamente o lift:

```lean
C2CenterGaussianSigmaTailLiftBudget.to_tailLiftBudget
C2CenterGaussianSigmaTailLiftBudget.error_lt_boundary_margin
```

Tambem foi fechada a reducao full-depth:

```lean
c2CenterGaussianCenterCutoffSigmaTail_le_centerThresholdSigmaTail
```

e os consumidores:

```lean
C2CenterGaussianCenterThresholdTailLiftBudget.to_sigmaTailLiftBudget
C2CenterGaussianCenterThresholdTailLiftBudget.error_lt_boundary_margin
C2CenterGaussianCenterThresholdTailLiftBudget.error_lt_boundary_margin_of_dyadicFullDepth
```

## O Que Ainda Nao Foi Fechado Em Lean

Nesta etapa a desigualdade escalar integral foi formalizada para a moeda
escalar por centro:

```lean
c2CenterGaussianCrudeIntegralTail X sigma nmax
c2CenterGaussianCenterThresholdScalarTail_le_crudeIntegralTail
C2CenterGaussianCrudeIntegralTailLiftBudget
```

O que fechou agora foi a ponte funcional correta, incluindo a troca da cauda
exata pela cauda sharp com `sigma`:

```text
crude integral upper
  -> center-threshold sigma tail
  -> finite-cutoff sigma tail, using full-depth
  -> exact center-cutoff tail
  -> finite-to-infinite carrier error bound
  -> boundary-margin condition
```

A cauda produtiva continua util como prova de summability, mas a cauda sharp e
a moeda correta para o lift numerico full-depth.

Novo preparo combinatorio fechado:

```text
center-address injectivity
```

Tambem foi fechada a reducao:

```text
center-threshold scalar tail
  -> shifted natural center tail
  -> crude integral tail
```

Essa reducao usa a injetividade do centro C2 e o teste integral para uma funcao
decrescente no raio positivo.

## Reducao Escalar Por Centro

Foi adicionada a camada escalar por centro:

```lean
c2CenterGaussianSeriesScalarCenterMajorant X sigma p
c2CenterGaussianCenterThresholdScalarTail X sigma nmax
```

Ela troca o peso C2:

```text
2 * (1/2)^k
```

pela cota uniforme:

```text
1/2
```

usando `k >= 2`.

Tambem foi fechada a comparacao:

```lean
c2CenterGaussianSeriesSigmaMajorant_le_scalarCenterMajorant
c2CenterGaussianCenterThresholdSigmaTail_le_scalarTail
```

Para garantir que essa nova moeda e uma cauda legitima, foi adicionada a
majorante produto:

```lean
c2CenterGaussianSeriesScalarProductMajorant X p
```

e provado:

```lean
c2CenterGaussianAddressIndexSum_le_center_sq
c2CenterGaussianSeriesScalarCenterMajorant_le_scalarProductMajorant
summable_c2CenterGaussianSeriesScalarProductMajorant
summable_c2CenterGaussianSeriesScalarCenterMajorant
summable_c2CenterGaussianCenterThresholdScalarTail_terms
```

O novo budget consumidor e:

```lean
C2CenterGaussianCenterThresholdScalarTailLiftBudget X sigma nmax margin
```

com campo:

```lean
scalar_threshold_tail_le_margin :
  c2CenterGaussianCenterThresholdScalarTail X sigma nmax <= margin
```

Ele alimenta automaticamente:

```lean
C2CenterGaussianCenterThresholdTailLiftBudget
```

e tambem a forma estrita de lift:

```lean
C2CenterGaussianCenterThresholdScalarTailLiftBudget.error_lt_boundary_margin
C2CenterGaussianCenterThresholdScalarTailLiftBudget.error_lt_boundary_margin_of_dyadic
```

O boleto restante agora ficou reduzido para:

```text
crude integral tail
  <= numeric or closed scalar margin
```

## Cota Integral Crua

Foi definido o kernel escalar unidimensional:

```lean
c2CenterGaussianCrudeIntegralKernel X sigma x
```

e as duas caudas auxiliares:

```lean
c2CenterGaussianCrudeNaturalTail X sigma nmax
c2CenterGaussianCrudeIntegralTail X sigma nmax
```

Foram provados:

```lean
c2CenterGaussianCrudeIntegralKernel_antitoneOn_Ici
integrableOn_c2CenterGaussianCrudeIntegralKernel_Ioi
c2CenterGaussianCrudeNaturalTail_sum_range_le_crudeIntegralTail
summable_c2CenterGaussianCrudeNaturalTail_terms
c2CenterGaussianCenterThresholdScalarTail_le_crudeNaturalTail
c2CenterGaussianCenterThresholdScalarTail_le_crudeIntegralTail
```

Hipoteses principais:

```text
0 < X
0 <= sigma
sigma < 1
1 < nmax
```

O novo budget:

```lean
C2CenterGaussianCrudeIntegralTailLiftBudget X sigma nmax margin
```

alimenta:

```lean
C2CenterGaussianCenterThresholdScalarTailLiftBudget
C2CenterGaussianCrudeIntegralTailLiftBudget.error_lt_boundary_margin_of_dyadic
```

Assim o lift full-depth agora pode ser pago por uma cota externa ou fechada da
integral crua.

## Verificacoes

Comandos:

```bash
lake env lean LeanC2/AuditC2CenterGaussianCarrier.lean
lake build LeanC2.AuditC2CenterGaussianCarrier
```

Resultado: ambos passaram.

O build emitiu apenas warnings antigos em arquivos dependentes.
