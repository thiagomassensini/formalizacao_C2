# C2_CENTER_GAUSSIAN_CARRIER_STATUS

## Status

Este e o mapa limpo atual do carrier C2 center Gaussian.

## 1. Carrier formal Lean

Arquivo:

```text
LeanC2/AuditC2CenterGaussianCarrier.lean
```

Termo local:

```text
2 * 2^(-k) * (2^k*m)^(-s) * exp(-((2^k*m)/X)^2)
```

com:

```text
k >= 2
m impar
c = 2^k*m
```

Objetos principais:

```lean
c2CenterGaussianAddressTerm
c2CenterGaussianRectangle
c2CenterGaussianSeries
```

O carrier infinito e:

```lean
c2CenterGaussianSeries X s
```

## 2. Corte por centro e convergencia

O corte por centro que espelha o script foi formalizado como:

```lean
c2CenterGaussianByCenterCutoff X s nmax K
```

Ele soma exatamente:

```text
2 <= k <= K
m impar
2^k*m + 1 <= nmax
```

Foi provada a reindexacao finita:

```lean
c2CenterGaussianByCenterCutoff_eq_addressSum
```

e a convergencia diagonal para `X` fixo:

```lean
tendsto_c2CenterGaussianByCenterCutoff_diag
```

Hipoteses:

```text
0 < X
0 < s.re
```

## 3. Paridade com o script

O script:

```text
gemini-code-1783101614806.py
```

usa o mesmo termo local e o mesmo corte por centro.

Foi separado o perfil formal de `X` fixo do perfil empirico dinamico:

```lean
c2CenterGaussianScriptProfile xFactor s nmax K
```

que expande para:

```lean
c2CenterGaussianByCenterCutoff ((nmax : ℝ) / xFactor) s nmax K
```

## 4. Evidencia empirica

Relatorios relevantes:

```text
AUDIT_C2_CENTER_GAUSSIAN_STABILITY.md
AUDIT_C2_CENTER_GAUSSIAN_LOCAL_REFINEMENT.md
AUDIT_C2_CENTER_GAUSSIAN_DRIFTING_MICRO_REFINEMENT.md
```

Resultado consolidado na janela:

```text
t in [10,50]
sigma = 0.5
```

Foram encontrados 10 candidatos persistentes:

```text
14.134
21.022
25.010
30.425
32.935
37.586
40.919
43.327
48.005
49.774
```

Classificacao apos refinamento local e micro-refinamento:

```text
locked:      7
flat_valley: 1
true_drift:  2
weak:        0
```

Auditoria complexa posterior dos 7 `locked`:

```text
AUDIT_C2_CENTER_GAUSSIAN_COMPLEX_GEOMETRY.md
```

Resultado:

```text
locked transverse_near_zero: 7
```

Todos os alvos locked apresentaram derivada complexa local nao pequena e
geometria consistente com passagem transversal perto da origem.

Auditoria 2D posterior:

```text
AUDIT_C2_CENTER_GAUSSIAN_ZERO_BOXES.md
```

Resultado:

```text
stable_zero_box: 7
```

Nos 7 alvos locked, o winding numerico da imagem da borda foi `+1` em todos os
5 perfis testados, com minimo de borda acima de `5.4e-4`.

Certificacao numerica posterior:

```text
AUDIT_C2_CENTER_GAUSSIAN_ZERO_BOX_CERTIFICATION.md
```

Resultado:

```text
certified_finite_zero_box: 35/35
certified_all_profiles: 7/7 targets
```

Todas as caixas dos 7 alvos locked foram certificadas para os 5 perfis
testados por uma cota Lipschitz de borda do carrier finito. A menor margem
certificada foi:

```text
target: 21.022
profile: dyn_400k_k6
certified_boundary_margin: 3.399363989581815e-7
```

Esta camada certifica o carrier finito dos perfis testados. O lift para o
carrier infinito ainda depende de uma comparacao de cauda na borda.

Auditoria full-depth posterior:

```text
AUDIT_C2_CENTER_GAUSSIAN_FULL_DEPTH_BOXES.md
```

Resultado:

```text
fixedX_fullDepth_400k_K18: certified_finite_zero_box 7/7
fixedX_fullDepth_800k_K19: certified_finite_zero_box 7/7
```

Esses perfis usam `X` fixo e profundidade cheia:

```text
nmax=400000  K=18  centers=99999
nmax=800000  K=19  centers=199999
```

A menor margem full-depth combinada foi:

```text
target: 32.935
certified_boundary_margin: 1.3525646892630842e-4
```

Esta e a configuracao mais limpa para iniciar a comparacao entre carrier finito
e carrier infinito, pois a cauda restante fica concentrada em centros grandes.

Auditoria de lift por cauda:

```text
AUDIT_C2_CENTER_GAUSSIAN_TAIL_LIFT.md
```

Resultado:

```text
finite_to_infinite_lift_pass: 14/14
```

Parametros:

```text
X = 66666.66666666667
sigma_min = 0.498
```

Caudas:

```text
nmax=400000: 1.0455626826621376e-15
nmax=800000: 4.6204093614534147e-63
```

Maior razao cauda/margem:

```text
7.730223115848086e-12
```

Menor `margin_minus_tail`:

```text
1.3525646892526287e-4
```

Nesta auditoria numerica, as 7 caixas full-depth levantam do carrier finito
para o carrier infinito `c2CenterGaussianSeries X s`, para o `X` fixo testado.
Ainda falta trocar a camada numerica por aritmetica intervalar ou certificado
formal equivalente.

Pack consolidado:

```text
C2_CENTER_GAUSSIAN_ZERO_CERTIFICATE_PACK.md
```

Plano de certificacao intervalar:

```text
AUDIT_C2_CENTER_GAUSSIAN_INTERVAL_CERTIFICATION_PLAN.md
```

Budget funcional Lean da cauda:

```text
AUDIT_C2_CENTER_GAUSSIAN_TAIL_BUDGET_LEAN.md
```

Foi fechado em Lean que a cauda exata fora do corte por centro majoriza o erro
entre `c2CenterGaussianSeries X s` e o corte finito
`c2CenterGaussianByCenterCutoff X s nmax K`. Tambem foi fechada a forma
estrita consumida pelo lift de caixas:

```text
tailBound < boundaryMargin
  -> finite-to-infinite carrier error < boundaryMargin
```

Tambem foi fechada uma camada majorante:

```lean
c2CenterGaussianCenterCutoffMajorantTail X nmax K
```

com:

```lean
c2CenterGaussianCenterCutoffTailNormUpper X s nmax K
  <= c2CenterGaussianCenterCutoffMajorantTail X nmax K
```

e o budget:

```lean
C2CenterGaussianMajorantTailLiftBudget X nmax K margin
```

Esse budget majorante alimenta automaticamente o budget funcional da cauda e a
forma estrita de lift de borda.

Essa camada produtiva e util para summability, mas e grosseira para o lift
full-depth.

Foi adicionada tambem a camada sharp por real-part inferior:

```lean
c2CenterGaussianSeriesSigmaMajorant X sigma p
c2CenterGaussianCenterCutoffSigmaTail X sigma nmax K
C2CenterGaussianSigmaTailLiftBudget X sigma nmax K margin
```

Foi fechado tambem o preparo combinatorio para a cauda escalar por centros:

```lean
c2CenterGaussianAddressCenter_v2
c2CenterGaussianAddressCenter_injective
c2CenterGaussianAddressCenter_eq_iff
```

Assim, o centro inteiro `2^(p.1+2) * (2*p.2+1)` identifica unicamente o
endereco C2. Isso remove uma ambiguidade antes de reindexar a cauda sharp para
uma soma escalar sobre centros naturais.

Esse boleto foi fechado em Lean:

```text
center-threshold sigma tail
  -> scalar/natural center tail
  -> crude integral tail bound
```

Esse primeiro passo agora tambem esta fechado em Lean por uma moeda escalar por
centro:

```lean
c2CenterGaussianSeriesScalarCenterMajorant
c2CenterGaussianCenterThresholdScalarTail
C2CenterGaussianCenterThresholdScalarTailLiftBudget
```

Foram provados:

```lean
c2CenterGaussianSeriesSigmaMajorant_le_scalarCenterMajorant
c2CenterGaussianCenterThresholdSigmaTail_le_scalarTail
C2CenterGaussianCenterThresholdScalarTailLiftBudget.error_lt_boundary_margin_of_dyadic
```

Para a summability da nova moeda, foi usada a majorante produto:

```lean
c2CenterGaussianSeriesScalarProductMajorant
```

com o lema aritmetico:

```lean
c2CenterGaussianAddressIndexSum_le_center_sq
```

Camada escalar por centro:

```text
center-threshold scalar tail
  -> crude integral / incomplete-Gamma tail bound
```

com o centro:

```text
c = 2^(p.1+2) * (2*p.2+1)
```

e termo:

```text
2 * (1/2)^(p.1+2) * c^(-sigma) * exp(-((c/X)^2))
```

Foi fechado que, para `0 <= sigma` e `sigma <= s.re`, essa cauda sharp
majora a cauda exata e tambem alimenta a forma estrita de lift de borda.

Foi adicionada ainda a reducao full-depth para uma cauda por limiar de centro:

```lean
C2CenterGaussianFullDepthCutoff nmax K
c2CenterGaussianCenterThresholdSigmaTail X sigma nmax
C2CenterGaussianCenterThresholdTailLiftBudget X sigma nmax margin
```

Com:

```text
nmax < c + 1
```

Tambem foi fechado:

```lean
C2CenterGaussianFullDepthCutoff.of_nmax_le_two_pow_succ
c2CenterGaussianCenterCutoffSigmaTail_le_centerThresholdSigmaTail
C2CenterGaussianCenterThresholdTailLiftBudget.error_lt_boundary_margin_of_dyadicFullDepth
```

Assim, para os perfis full-depth, basta provar uma cota escalar para a cauda
por centro depois de `nmax`.

A cota integral escalar dessa cauda por centro tambem foi formalizada:

```lean
c2CenterGaussianCrudeIntegralKernel
c2CenterGaussianCrudeNaturalTail
c2CenterGaussianCrudeIntegralTail
c2CenterGaussianCrudeIntegralKernel_antitoneOn_Ici
c2CenterGaussianCrudeNaturalTail_le_crudeIntegralTail
c2CenterGaussianCenterThresholdScalarTail_le_crudeIntegralTail
C2CenterGaussianCrudeIntegralTailLiftBudget
C2CenterGaussianCrudeIntegralTailLiftBudget.error_lt_boundary_margin_of_dyadic
```

Hipoteses da camada integral:

```text
0 < X
0 <= sigma
sigma < 1
1 < nmax
```

O proximo boleto Lean e pagar:

```text
c2CenterGaussianCrudeIntegralTail X sigma nmax <= numeric margin
```

por uma cota fechada da integral crua.

## 5. Nucleo locked

```text
21.022
32.935
37.586
40.919
43.327
48.005
49.774
```

Estes sao os alvos mais rigidos do carrier na bateria atual.

## 6. Nucleo flexivel

```text
14.134  flat_valley
25.010  true_drift
30.425  true_drift
```

`14.134` parece um vale largo/raso. `25.010` e `30.425` preservam identidade,
mas apresentam drift real entre perfis.

## 7. Proximos alvos

Proximo alvo empirico:

```text
trocar a certificacao numerica de borda por aritmetica intervalar
```

Proximo alvo Lean:

```text
c2CenterGaussianCenterThresholdSigmaTail X sigma nmax
  <= scalar/integral tail upper
```

Pergunta seguinte:

```text
como registrar as 7 caixas infinitas com certificado de borda mais forte?
```
