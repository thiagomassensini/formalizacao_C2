# Positive Box Genuine Odd Bridge Report

## Resultado

Foi criado o bridge audit-only:

```text
LeanC2/AuditContinuedQuartetPositiveBoxGenuineOddBridge.lean
```

Ele conecta a interface `oddRef` a um modelo bulk parametrizado pelo mesmo
canal de referência e isola a compatibilidade que falta para ligar esse modelo
ao objeto genuine real.

Nada foi promovido para a rota principal.

## 1. Objeto genuine real que precisa ser compatível com `oddRef`

O objeto genuine real que a positive box precisa enxergar é:

```lean
genuineFInfinite
```

No caminho continued existente, o modelo:

```lean
c2OddTailContinuedBalancingSeedBulkModel coreCutoff K M
```

fecha primeiro no alvo central:

```lean
continuedCentralOddChannel
```

e depois é comparado com `genuineFInfinite` usando:

```lean
GenuineFInfiniteContinuationData
```

O bridge correto para a rota `oddRef` é, portanto, uma compatibilidade central:

```lean
centralFromOddChannel oddRef s = genuineFInfinite s
```

na positive box.

## 2. O objeto central é parametrizável por um canal ímpar

Sim. O repo já tem:

```lean
centralFromOddChannel (Zodd : OddChannel) (s : ℂ)
```

e o continued central existente é exatamente:

```lean
continuedCentralOddChannel s =
  centralFromOddChannel continuedOddDirichletChannel s
```

Logo a forma semanticamente correta para uma rota genuine-first é trocar o
canal por um parâmetro abstrato:

```lean
positiveBoxOddRefCentral oddRef :=
  centralFromOddChannel oddRef
```

## 3. O que foi criado

No novo arquivo foram definidos:

```lean
positiveBoxOddRefCentral
positiveBoxOddRefAnchor
positiveBoxOddRefCutVec
positiveBoxOddRefVSplit
positiveBoxOddRefVerticalResidual
positiveBoxOddRefBalancingSeed
positiveBoxOddRefBulkModel
```

E foram provadas as identidades algébricas:

```lean
positiveBoxOddRefVerticalResidual_eq_vSplit
positiveBoxOddRefCutVec_eq_cutoffError
positiveBoxOddRefBulkModel_eq_expanded
positiveBoxOddRefRegularizedResidual_balancingSeed
positiveBoxOddRefBulkModel_eq_central_of_re_pos
```

A última é o fechamento algébrico zeta-free do modelo audit-only:

```lean
positiveBoxOddRefBulkModel oddRef N K M s =
  positiveBoxOddRefCentral oddRef s
```

sob `0 < s.re`.

## 4. Compatibilidade abstrata

Foi criada:

```lean
structure PositiveBoxOddRefCompatibility
    (data : GenuineOddContinuationData) : Prop where
  central_compat :
    ∀ s ∈ positiveBox,
      positiveBoxOddRefCentral data.oddRef s = genuineFInfinite s
```

Com esse campo, foi provado:

```lean
positiveBoxOddRefBulkModel_eq_genuine_of_compat
```

ou seja, na positive box:

```lean
positiveBoxOddRefBulkModel data.oddRef positiveBoxN positiveBoxK positiveBoxM s
  = genuineFInfinite s
```

## 5. Transporte condicional criado

Foi criada a estrutura de bounds:

```lean
PositiveBoxOddRefBridgeBounds
```

com campos:

```lean
truncation
anchor_bound
cut_bound
sector_lower
```

Aqui `anchor_bound` e `cut_bound` são os bounds corretos para o modelo `oddRef`,
isto é, usam:

```lean
positiveBoxOddRefAnchor data.oddRef
positiveBoxOddRefCutVec data.oddRef positiveBoxK positiveBoxM
```

Também foi provado:

```lean
PositiveBoxOddRefBridgeBounds.verticalResidual_bound
```

E o transporte principal audit-only:

```lean
positiveBox_oddRef_bridge_result
```

Esse theorem assume:

```lean
PositiveBoxOddRefCompatibility data
PositiveBoxOddRefBridgeBounds data
s ∈ positiveBox
```

e produz:

```lean
PositiveBoxOddRefBridgeResult data s
```

com:

```lean
sector_dominance
true_prefix_residual
vertical_residual_bound
bulk_eq_genuine
```

## 6. Existe ponte pronta no repo?

Existe ponte pronta para o caminho continued existente:

```lean
c2OddTailContinuedBalancingSeedBulkModel_eq_continuedCentral_of_re_pos
GenuineFInfiniteContinuationData.eq_continuedCentralOddChannel_on_punctured
```

Mas essa ponte passa pelo central continued existente. Para a rota `oddRef`, a
ponte concreta ainda não existe; ela está isolada no campo:

```lean
PositiveBoxOddRefCompatibility.central_compat
```

Portanto, a conexão oddRef/genuine está formalizada como obrigação condicional,
não como teorema fechado.

## 7. Campos ainda abertos

Continuam abertos:

```text
oddRef truncation <= 7 / 180
anchor_bound para positiveBoxOddRefAnchor
cut_bound para positiveBoxOddRefCutVec
sector_lower
compatibilidade central oddRef/genuine
existência/analiticidade genuine-first do oddRef
```

Não foi afirmado fechamento do middle.

## 8. Verificações

Compilaram:

```text
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxGenuineOddBridge.lean
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxGenuineOdd.lean
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxContinuedOdd.lean
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxInterval.lean
lake env lean LeanC2/AuditContinuedQuartetPositiveBox.lean
```

Busca textual nos arquivos novos:

```text
rg -n "riemannZeta|zeta|zeta_diagnostic|sorry|admit|axiom|constant" \
  LeanC2/AuditContinuedQuartetPositiveBoxGenuineOddBridge.lean \
  LeanC2/AuditContinuedQuartetPositiveBoxGenuineOdd.lean
```

Resultado: sem ocorrências.

## 9. Promoção

Nada foi promovido para a rota principal.

O bridge é audit-only e parametrizado por `oddRef`. Ele não altera os budgets
principais, não troca a rota raw e não usa diagnósticos numéricos.
