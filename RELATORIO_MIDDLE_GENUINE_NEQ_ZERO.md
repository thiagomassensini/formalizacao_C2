# Relatorio interno: fechamento genuine no middle

Este relatorio registra somente a parte genuine do middle: a contabilidade do
quarteto, o certificado local que guarda os debitos visiveis e o fechamento
formal de

```lean
genuineCentralDoubleSeries s ≠ 0
```

O escopo aqui e estritamente local ao middle genuine.

## Status

O fechamento esta formalizado no Lean no seguinte sentido:

```lean
s ∈ adjustedQuartetBalancedGenuineBulkConcreteRegion ... →
  genuineCentralDoubleSeries s ≠ 0
```

O endpoint principal e:

```lean
GenuineMiddleAudit.genuineCentral_ne_zero_of_mem_concreteRegion_ledger
```

Tambem ha uma forma alimentada por dados locais:

```lean
GenuineMiddleAudit.genuineCentral_ne_zero_of_localBulkData_rawBounds
```

Leitura:

```text
dados locais do middle
+ bound do seed balanceado
+ bound do cutoff
⇒ certificado concreto com quartet_dominance
⇒ modelo genuine balanceado nao zera
⇒ genuineCentralDoubleSeries s ≠ 0
```

## Arquivo principal

A auditoria esta em:

```text
LeanC2/AuditGenuineMiddle.lean
```

Os principais blocos aparecem nas regioes:

```text
4461  norm_add_four_le
4475  c2ConcreteAntiMiracleQuartet_norm_ge_K2Margin
4500  c2ExpandedQuartetK2Margin_pos_of_offCriticalStrip
4532  c2ConcreteAntiMiracleQuartet_norm_ge_K2Margin_of_mem_middle
4544  c2ExpandedQuartetK2Margin_pos_of_mem_middle
4566  c2ConcreteAntiMiracleQuartet_ne_zero_of_mem_middle
4579  c2ConcreteAntiMiracleTail_norm_le_fourTermUpper
4614  c2ConcreteAntiMiracleFiniteModel_ne_zero_of_fourTermDominance
8761  quartet_dominance
8771  adjustedQuartetBalancedGenuineBulkConcreteRegion
8889  adjustedQuartetBalancedGenuineBulkModel_ne_zero_of_mem_concreteRegion_ledger
8988  genuineCentralNoCancellation_of_mem_adjustedQuartetBalancedGenuineBulkConcreteRegion_ledger
9007  genuineCentral_ne_zero_of_mem_concreteRegion_ledger
9043  adjustedQuartetBalancedGenuineBulkConcrete_mem_of_localData
9108  genuineCentral_ne_zero_of_localBulkData_rawBounds
```

## Livro-caixa formal

O ponto central e a divisao:

```text
modelo finite genuine = quarteto principal + residual
```

O quarteto principal e a parte que recebe o credito minimo. O residual e a soma
dos quatro debitos visiveis:

```text
vertical debt
tilt
horizontal
cutoff
```

No Lean, a desigualdade triangular de quatro termos foi isolada como:

```lean
GenuineMiddleAudit.norm_add_four_le
```

Forma:

```lean
‖a + b + c + d‖ ≤ ‖a‖ + ‖b‖ + ‖c‖ + ‖d‖
```

Isto e exatamente a regra do livro-caixa:

```text
o residual inteiro nao pode gastar mais que a soma dos quatro tetos.
```

## Credito do quarteto

O lower formal do quarteto esta em:

```lean
GenuineMiddleAudit.c2ConcreteAntiMiracleQuartet_norm_ge_K2Margin
```

Forma:

```lean
c2ExpandedQuartetK2Margin s ≤
  ‖c2ConcreteAntiMiracleQuartet s‖
```

Leitura:

```text
o quarteto concreto tem pelo menos a margem canonica do quarteto.
```

Esse e o lado do credito.

## Bound global no middle

O lower do quarteto foi promovido para todo ponto do middle:

```lean
GenuineMiddleAudit.c2ConcreteAntiMiracleQuartet_norm_ge_K2Margin_of_mem_middle
```

Forma:

```lean
s ∈ c2ExpandedScalarMiddleRegion near edge →
c2ExpandedQuartetK2Margin s ≤
  ‖c2ConcreteAntiMiracleQuartet s‖
```

Tambem foi registrada a positividade estrita da margem:

```lean
GenuineMiddleAudit.c2ExpandedQuartetK2Margin_pos_of_mem_middle
```

Forma:

```lean
s ∈ c2ExpandedScalarMiddleRegion near edge →
0 < c2ExpandedQuartetK2Margin s
```

E portanto o quarteto nao zera no middle:

```lean
GenuineMiddleAudit.c2ConcreteAntiMiracleQuartet_ne_zero_of_mem_middle
```

Forma:

```lean
s ∈ c2ExpandedScalarMiddleRegion near edge →
c2ConcreteAntiMiracleQuartet s ≠ 0
```

Leitura:

```text
em todo ponto do middle, o quarteto tem credito positivo:
ele domina a margem canonica c2ExpandedQuartetK2Margin s.
```

Esse bound e pointwise: a margem depende de `s`. O Lean nao afirma aqui uma
constante positiva uniforme independente de `s`.

## Debitos do residual

O upper formal do residual esta em:

```lean
GenuineMiddleAudit.c2ConcreteAntiMiracleTail_norm_le_fourTermUpper
```

Forma:

```lean
‖c2ConcreteAntiMiracleTail tiltSeed coreCutoff K M s‖ ≤
  c2QuartetVerticalTailUpper s
    + tiltUpper s
    + horizontalUpper s
    + cutoffUpper s
```

Leitura:

```text
residual ≤ vertical debt + tilt + horizontal + cutoff
```

Esse e o lado dos debitos.

## Dominancia estrita

O fechamento finito e:

```lean
GenuineMiddleAudit.c2ConcreteAntiMiracleFiniteModel_ne_zero_of_fourTermDominance
```

Hipotese decisiva:

```lean
c2QuartetVerticalTailUpper s
  + tiltUpper s
  + horizontalUpper s
  + cutoffUpper s
    < c2ExpandedQuartetK2Margin s
```

Conclusao:

```lean
c2ConcreteAntiMiracleFiniteModel tiltSeed coreCutoff K M s ≠ 0
```

Traducao:

```text
se o total maximo dos quatro debitos fica abaixo do credito minimo do quarteto,
entao o modelo finite genuine nao pode zerar.
```

Essa e exatamente a frase:

```text
nao tem saldo para cancelar o quarteto.
```

## Certificado concreto do middle

O pacote local concreto e:

```lean
GenuineMiddleAudit.AdjustedQuartetBalancedGenuineBulkConcreteEstimates
```

Ele guarda:

```lean
offCritical
tiltScale_pos
tiltConstant_nonneg
tilt_scaled_bound
horizontalScale_pos
horizontalConstant_nonneg
horizontalRatio_nonneg
horizontalRatio_lt_one
horizontalLayer_bound
cutoffScale_pos
cutoff_scaled_bound
quartet_dominance
```

O campo essencial e:

```lean
quartet_dominance
```

Forma conceitual:

```text
vertical debt + tilt + horizontal + cutoff < quartet lower
```

A regiao correspondente e:

```lean
GenuineMiddleAudit.adjustedQuartetBalancedGenuineBulkConcreteRegion
```

Ela e apenas a grafia de conjunto para pontos que carregam esse certificado.

## Fechamento do modelo balanceado

O fechamento pelo livro-caixa explicito e:

```lean
GenuineMiddleAudit.adjustedQuartetBalancedGenuineBulkModel_ne_zero_of_mem_concreteRegion_ledger
```

Forma:

```lean
s ∈ adjustedQuartetBalancedGenuineBulkConcreteRegion ... →
  adjustedQuartetBalancedGenuineBulkModel coreCutoff K M s ≠ 0
```

Por dentro, o Lean faz:

```text
1. le o bound do seed;
2. transforma o bound do seed no bound do tilt;
3. soma tilt + horizontal + cutoff com a divida vertical;
4. reescreve quartet_dominance como quatro-debitos < margem;
5. aplica c2ConcreteAntiMiracleFiniteModel_ne_zero_of_fourTermDominance.
```

## Ponte genuine central

Depois que o modelo balanceado nao zera, o Lean usa a identidade local entre o
modelo balanceado e o objeto central genuine. A ponte literal e:

```lean
GenuineMiddleAudit.genuineCentral_ne_zero_of_bulkModel_ne_zero
```

Forma:

```lean
0 < s.re →
adjustedQuartetBalancedGenuineBulkModel coreCutoff K M s ≠ 0 →
genuineCentralDoubleSeries s ≠ 0
```

Com isso, o certificado concreto fecha diretamente:

```lean
GenuineMiddleAudit.genuineCentral_ne_zero_of_mem_concreteRegion_ledger
```

Forma:

```lean
s ∈ adjustedQuartetBalancedGenuineBulkConcreteRegion ... →
  genuineCentralDoubleSeries s ≠ 0
```

Este e o endpoint genuine do middle pelo livro-caixa do quarteto.

## Forma via dados locais

Para usar dados locais do middle, o Lean tem:

```lean
GenuineMiddleAudit.adjustedQuartetBalancedGenuineBulkConcrete_mem_of_localData
```

Forma:

```lean
C2ExpandedScalarLocalBulkData ... s →
seed bound →
cutoff bound →
s ∈ adjustedQuartetBalancedGenuineBulkConcreteRegion ...
```

E entao:

```lean
GenuineMiddleAudit.genuineCentral_ne_zero_of_localBulkData_rawBounds
```

Forma:

```lean
C2ExpandedScalarLocalBulkData ... s →
seed bound →
cutoff bound →
genuineCentralDoubleSeries s ≠ 0
```

Leitura:

```text
se o ponto do middle fornece o pacote local,
e se os dois bounds raw restantes sao pagos,
entao o neq zero genuine esta fechado.
```

## Cadeia completa

```text
C2ExpandedScalarLocalBulkData
  + seed bound
  + cutoff bound
        ↓
adjustedQuartetBalancedGenuineBulkConcreteRegion
        ↓
quartet_dominance
        ↓
four-debt ledger
        ↓
adjustedQuartetBalancedGenuineBulkModel ≠ 0
        ↓
genuineCentralDoubleSeries s ≠ 0
```

## O que esta fechado

Esta fechado:

```text
todo ponto do middle que carrega o certificado concreto
com quartet_dominance satisfaz genuineCentralDoubleSeries s ≠ 0.
```

Tambem esta fechado:

```text
todo ponto com C2ExpandedScalarLocalBulkData
mais os bounds raw de seed e cutoff
gera esse certificado concreto
e portanto satisfaz genuineCentralDoubleSeries s ≠ 0.
```

## O que este relatorio nao afirma

Este relatorio nao afirma que qualquer ponto bruto, sem certificado local, ja
possui automaticamente os campos necessarios. A prova formal fecha o ponto
certificado.

Em termos de auditoria, a pergunta correta para qualquer ponto especifico do
middle e:

```text
o ponto fornece C2ExpandedScalarLocalBulkData?
o seed bound foi pago?
o cutoff bound foi pago?
o campo quartet_dominance esta presente?
```

Se sim, o endpoint genuine e imediato:

```lean
genuineCentralDoubleSeries s ≠ 0
```

## Resumo

O Lean formalizou a conta:

```text
debito maximo dos residuos < credito minimo do quarteto
```

e a transformou no endpoint:

```lean
genuineCentralDoubleSeries s ≠ 0
```

O lema final para usar na auditoria local e:

```lean
GenuineMiddleAudit.genuineCentral_ne_zero_of_localBulkData_rawBounds
```

O lema final para usar quando o certificado concreto ja esta montado e:

```lean
GenuineMiddleAudit.genuineCentral_ne_zero_of_mem_concreteRegion_ledger
```
