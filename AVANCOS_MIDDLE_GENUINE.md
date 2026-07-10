# Avancos Middle Genuine

Ultima atualizacao: 2026-07-05.

## Regra de rota

Rota ativa: **Genuine-First**.

Nao usar `riemannZeta`, `zeta`, `ExactZeta`, `zetaUpper` ou `zetaDepthCore`
como input analitico, estimativa, majorante ou atalho nas obrigacoes middle.

## Arquivo Lean ativo

```text
LeanC2/AuditContinuedQuartetPositiveBoxOddRefPhase.lean
```

Namespace:

```lean
namespace C2
namespace ContinuedQuartetAudit
```

Comando de verificacao atual:

```bash
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxOddRefPhase.lean
```

Ultimo resultado: passou sem saida.

## Estado fechado

### Box e off-critical

```lean
positiveBox_offCriticalStrip
```

### Interface phase-aware para oddRef abstrato

```lean
PositiveBoxOddRefHalfDiskBound
PositiveBoxOddRefGapBound
positiveBoxOddRefGapUpperFromHalfDisk
PositiveBoxOddRefPhasePayment
PositiveBoxOddRefPhaseData

PositiveBoxOddRefGapBound.of_halfDiskBound
PositiveBoxOddRefPhaseData.gap_lt_allowance
PositiveBoxOddRefPhaseData.to_gapBound
PositiveBoxOddRefPhaseData.to_factorUpperLowerBudgetOnBox
```

### Ponte para continued channel, separada da estimativa de fase

```lean
PositiveBoxOddRefContinuedCompatibility
PositiveBoxContinuedOddGapBoundOnBox
PositiveBoxOddRefGapBound.to_continuedOnBox
```

### Candidatos da allowance por componentes

```lean
positiveBoxAllowanceLowerCandidate : ℂ → ℝ
positiveBoxVerticalTailUpperCandidate : ℂ → ℝ
positiveBoxExactCentralUpperCandidate : ℂ → ℝ
positiveBoxExactVerticalAnchorAllowanceLowerCandidate
```

Valores constantes ja escolhidos:

```lean
positiveBoxAllowanceLowerCandidate = fun _ => (1 : ℝ) / 20
positiveBoxVerticalTailUpperCandidate = fun _ => (49 : ℝ) / 450
```

Campos fechados:

```lean
positiveBox_allowanceLower_nonneg_candidate
positiveBox_allowanceLower_pos_candidate
positiveBox_allowanceLower_lt_one_candidate

positiveBox_verticalDepthTailUpper_bound_candidate

positiveBox_exactCentralUpper_bound_candidate
positiveBox_exactVerticalAnchorAllowanceLower_bound_candidate
```

### Pagamento candidato

Obrigacao componente isolada:

```lean
PositiveBoxExactGapAnchorCandidateComponentPaymentOnBox
```

Forma expanded equivalente:

```lean
PositiveBoxExactGapAnchorCandidateExpandedPaymentOnBox
positiveBox_candidateComponentPayment_iff_expandedPayment
PositiveBoxExactGapAnchorCandidateComponentPaymentOnBox.of_expandedPayment
```

Conectores para scalar budget:

```lean
PositiveBoxExactGapAnchorFactorAllowanceLowerScalarBudgetOnBox.of_candidatePayment
PositiveBoxExactGapAnchorFactorAllowanceLowerScalarBudgetOnBox.of_candidateExpandedPayment
PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_candidatePayment
PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_candidateExpandedPayment
```

### Especializacao ativa da positiveBox

Parametros ativos:

```lean
K = positiveBoxK
M = positiveBoxM
horizontalConstant = constantCoreHorizontalAmplitudeQRatio positiveBoxN
horizontalScale = unitScale
horizontalRatio = qNormHorizontalRatio
```

Nomes:

```lean
PositiveBoxExactGapAnchorActiveExpandedPaymentOnBox
PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeExpandedPayment
```

### Interface intervalar ativa

Estrutura:

```lean
PositiveBoxExactGapAnchorActiveExpandedUpperData
  centralBudget cutoffBudget horizontalBudget marginLower
```

Campos:

```lean
central_upper
cutoff_upper
horizontal_upper
margin_lower
scalar_budget
```

Conectores:

```lean
PositiveBoxExactGapAnchorActiveExpandedUpperData.to_activeExpandedPayment
PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeExpandedUpperData
```

## Forma atual da rota local

Para obter o scalar budget exact-gap na positiveBox basta fornecer:

```lean
PositiveBoxOddRefPhaseData
  oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate

PositiveBoxExactGapAnchorActiveExpandedUpperData
  centralBudget cutoffBudget horizontalBudget marginLower
```

e consumir:

```lean
PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeExpandedUpperData
```

## Proximo passo tecnico

Status: os candidatos exatos ja foram nomeados.

```lean
positiveBoxActiveCentralBudgetExact
positiveBoxActiveCutoffBudgetExact
positiveBoxActiveHorizontalBudgetExact
positiveBoxActiveMarginLowerExact
```

Tambem foi nomeado o scalar budget restante com esses candidatos:

```lean
PositiveBoxExactGapAnchorActiveExactScalarBudgetOnBox
```

e os conectores:

```lean
positiveBox_activeExpandedUpperData_exact_of_scalarBudget
PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeExactScalarBudget
```

Depois disso, foi feita uma reducao horizontal:

```lean
positiveBoxActiveHorizontalBudgetCandidate
PositiveBoxExactGapAnchorActiveHorizontalCandidateScalarBudgetOnBox
PositiveBoxExactGapAnchorActiveHorizontalCandidateScalarBudgetSimplifiedOnBox
PositiveBoxExactGapAnchorActiveHorizontalCandidateScalarBudgetResolventOnBox
```

Constantes novas:

```lean
positiveBoxAllowanceTailDebitCandidate = fun _ => (49 : ℝ) / 9000
positiveBoxActiveResolventFactorCandidate = (16 : ℝ) / 9
```

Lemas/conectores:

```lean
positiveBox_allowance_mul_verticalTail_eq_tailDebit
positiveBox_activeHorizontalCandidateScalarBudget_iff_simplified
positiveBox_activeResolventFactor_le_candidate
positiveBox_activeHorizontalCandidateScalarBudgetSimplified_of_resolventBudget

PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeHorizontalCandidateScalarBudget
PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeHorizontalCandidateScalarBudget_ofOddTruncation
PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeHorizontalCandidateScalarBudgetSimplified
PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeHorizontalCandidateScalarBudgetSimplified_ofOddTruncation
PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeHorizontalCandidateScalarBudgetResolvent
PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeHorizontalCandidateScalarBudgetResolvent_ofOddTruncation
PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeResolventUpperData
PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeResolventUpperData_ofOddTruncation
```

O alvo escalar mais limpo agora e:

```lean
PositiveBoxExactGapAnchorActiveHorizontalCandidateScalarBudgetResolventOnBox
```

Ele tem a forma:

```lean
((49 / 9000 +
    positiveBoxActiveCentralBudgetExact s +
    positiveBoxActiveCutoffBudgetExact s +
    positiveBoxActiveHorizontalBudgetCandidate s) *
  (16 / 9) +
  positiveBoxActiveHorizontalBudgetCandidate s +
  positiveBoxActiveCutoffBudgetExact s
≤ positiveBoxActiveMarginLowerExact s)
```

ponto a ponto na `positiveBox`, apos unfold dos candidatos.

O proximo passo tecnico agora e escolher candidatos intervalares concretos para:

```lean
centralBudget
cutoffBudget
marginLower
```

O candidato ja natural para horizontal e:

```lean
fun _ => positiveBoxHorizontalUpperValue
```

com:

```lean
positiveBoxHorizontalUpperValue = (1 : ℝ) / 100
```

Para `cutoffBudget`, cuidado: a interface mira

```lean
GenuineMiddleAudit.c2RawCentralCutoffNormConstant positiveBoxK positiveBoxM s
```

e nao automaticamente o cutoff continuado antigo.

Para `marginLower`, o pagamento expanded usa:

```lean
c2ExpandedQuartetResidualMargin s
```

nao a margem setorial local `c2ExpandedQuartetSectorResidualMargin`.

Observacao importante: existe ponte de

```lean
c2ExpandedQuartetSectorResidualMargin positiveBoxSectorLower s
```

para a margem baseada no prefixo verdadeiro, mas isso nao e automaticamente a
mesma coisa que a margem canonica:

```lean
c2ExpandedQuartetResidualMargin s
```

Portanto, nao usar a margem setorial como `marginLower` desta interface sem uma
ponte adicional especifica.

## Interface final intervalar

Foi adicionada uma superficie ainda mais curta para o alvo resolvente:

```lean
PositiveBoxExactGapAnchorActiveResolventUpperData
  centralBudget cutoffBudget marginLower
```

Campos:

```lean
central_upper
cutoff_upper
margin_lower
scalar_budget
```

Ela fixa internamente:

```lean
positiveBoxAllowanceTailDebitCandidate = 49 / 9000
positiveBoxActiveHorizontalBudgetCandidate = 1 / 100
positiveBoxActiveResolventFactorCandidate = 16 / 9
```

e prova:

```lean
PositiveBoxExactGapAnchorActiveResolventUpperData.to_resolventBudget
```

Assim, com:

```lean
PositiveBoxOddRefPhaseData
  oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate

PositiveBoxHorizontalUpperData

PositiveBoxExactGapAnchorActiveResolventUpperData
  centralBudget cutoffBudget marginLower
```

consome-se diretamente:

```lean
PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeResolventUpperData
```

A variante com truncamento impar tambem esta pronta:

```lean
PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeResolventUpperData_ofOddTruncation
```

## Escolha atual dos candidatos

Decisao: usar baseline exata para os tres termos sensiveis.

```lean
positiveBoxActiveCentralBudgetBaseline := positiveBoxActiveCentralBudgetExact
positiveBoxActiveCutoffBudgetBaseline := positiveBoxActiveCutoffBudgetExact
positiveBoxActiveMarginLowerBaseline := positiveBoxActiveMarginLowerExact
```

Motivo: essa escolha e semanticamente correta agora e nao mistura ledgers
diferentes. Em particular:

- `positiveBoxAnchorUpperValue` nao e automaticamente um upper para
  `positiveBoxActiveCentralBudgetExact`;
- `positiveBoxCutUpperValue` bounda o `cutVec` local antigo, nao
  automaticamente `c2RawCentralCutoffNormConstant positiveBoxK positiveBoxM`;
- `c2ExpandedQuartetSectorResidualMargin positiveBoxSectorLower` nao deve ser
  usado como lower para a margem canonica sem ponte especifica.

Novos nomes:

```lean
PositiveBoxExactGapAnchorActiveBaselineScalarBudgetOnBox
positiveBox_activeResolventUpperData_baseline_of_scalarBudget

PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeBaselineScalarBudget
PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeBaselineScalarBudget_ofOddTruncation
```

O alvo imediato passa a ser fechar:

```lean
PositiveBoxExactGapAnchorActiveBaselineScalarBudgetOnBox
```

## Avanco seguinte: rota central-defect

Foi aberta uma rota melhor que evita pagar a soma triangular:

```lean
c2GenuineCentralExactUpper s + c2ContinuedCentralExactUpper s
```

e troca esse termo por um upper do defeito real de rebasing:

```lean
‖genuineCentralDoubleSeries s - continuedCentralOddChannel s‖
```

Novos nomes:

```lean
PositiveBoxCentralDefectUpperBoundOnBox
positiveBoxCentralDefectExactUpper
positiveBox_centralDefect_bound_exact

PositiveBoxExactGapAnchorDefectAllowanceLowerScalarBudgetOnBox
PositiveBoxExactGapAnchorDefectAllowanceLowerScalarBudgetOnBox.of_componentPayment
PositiveBoxExactVerticalResidualDominanceOnBox
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_defectAllowanceLower

PositiveBoxExactGapAnchorDefectCandidateComponentPaymentOnBox
PositiveBoxExactGapAnchorDefectAllowanceLowerScalarBudgetOnBox.of_candidatePayment
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_defectCandidatePayment

PositiveBoxExactGapAnchorActiveDefectCandidateComponentPaymentOnBox
PositiveBoxExactGapAnchorActiveDefectCandidateScalarBudgetResolventOnBox
positiveBox_activeDefectCandidateComponentPayment_of_resolventBudget

PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeDefectCandidatePayment
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeDefectCandidateResolventBudget
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeDefectCandidateResolventBudget_ofOddTruncation
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectCandidateResolventBudget
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectCandidateResolventBudget_ofOddTruncation
```

Novo alvo preferido:

```lean
PositiveBoxExactGapAnchorActiveDefectCandidateScalarBudgetResolventOnBox
  positiveBoxCentralDefectExactUpper
```

Forma ponto a ponto:

```lean
((49 / 9000 +
    ‖genuineCentralDoubleSeries s - continuedCentralOddChannel s‖ +
    positiveBoxActiveCutoffBudgetExact s +
    1 / 100) *
  (16 / 9) +
  1 / 100 +
  positiveBoxActiveCutoffBudgetExact s
≤ c2ExpandedQuartetResidualMargin s)
```

Essa e agora a superficie mais promissora: fase/gap paga o anchor continuado, e
o central sensivel vira defeito de rebasing, nao soma de normas.

## Interface intervalar defect-aware

Foi criada a superficie intervalar recomendada para essa rota:

```lean
PositiveBoxExactGapAnchorActiveDefectResolventUpperData
  centralDefectBudget cutoffBudget marginLower
```

Campos:

```lean
central_defect_upper
cutoff_upper
margin_lower
scalar_budget
```

Ela reduz os candidatos exatos ao alvo:

```lean
PositiveBoxExactGapAnchorActiveDefectResolventUpperData.to_exactDefectResolventBudget
```

Baseline exata:

```lean
positiveBoxActiveCentralDefectBudgetExact
PositiveBoxExactGapAnchorActiveExactDefectScalarBudgetOnBox
positiveBox_activeDefectResolventUpperData_exact_of_scalarBudget
```

Conectores finais:

```lean
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeDefectResolventUpperData
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeDefectResolventUpperData_ofOddTruncation
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectScalarBudget
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectScalarBudget_ofOddTruncation
```

Agora o trabalho intervalar esta separado exatamente em:

```lean
centralDefectBudget
cutoffBudget
marginLower
```

## Avanco cutoff bridge

Foi fechada a ponte correta entre cutoff continuado e cutoff bruto/genuine.
O arquivo ativo agora importa:

```lean
LeanC2.AuditContinuedQuartetPositiveBoxCutoff
```

Novos nomes:

```lean
PositiveBoxCutoffUpperData.of_cut_bound

positiveBoxActiveCutoffBudgetFromContinuedAndDefect
positiveBox_activeCutoffBudgetFromContinuedAndDefect_upper

PositiveBoxExactGapAnchorActiveDefectContinuedCutoffScalarBudgetOnBox
positiveBox_activeDefectResolventUpperData_of_continuedCutoffData
PositiveBoxExactGapAnchorActiveExactDefectContinuedCutoffScalarBudgetOnBox
```

Conectores finais:

```lean
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeDefectContinuedCutoffScalarBudget
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeDefectContinuedCutoffScalarBudget_ofOddTruncation
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectContinuedCutoffScalarBudget
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectContinuedCutoffScalarBudget_ofOddTruncation
```

Leitura tecnica:

```lean
raw cutoff ≤ continued cutoff + central defect
```

Tambem foi formalizada a volta semantica:

```lean
‖cutVec positiveBoxK positiveBoxM s‖ ≤ positiveBoxCutUpperValue
→
PositiveBoxCutoffUpperData
```

pois `cutVec` e exatamente o continued cutoff error.

## Avanco cutoff depth/core

O `cut_bound` foi reduzido pela decomposicao genuine-first:

```lean
cutVec =
  2 * rectangularDepthFactor * oddTruncationContinued +
  2 * depthCutoff * continuedOdd
```

Novos campos:

```lean
PositiveBoxDepthFactorUpperBoundOnBox
PositiveBoxContinuedOddTruncationUpperBoundOnBox
PositiveBoxDepthCutoffUpperBoundOnBox
PositiveBoxContinuedOddUpperBoundOnBox
PositiveBoxCutoffDepthCoreScalarBudgetOnBox
```

Redutores:

```lean
positiveBox_cut_bound_of_depthCoreScalarBudget
PositiveBoxCutoffUpperData.of_depthCoreScalarBudget
```

A parte geometrica ja tem produtores concretos:

```lean
positiveBoxDepthFactorExplicitUpper
positiveBoxDepthCutoffExplicitUpper
positiveBox_depthFactor_bound_explicit
positiveBox_depthCutoff_bound_explicit
```

O pacote de truncamento impar continuado tambem entra direto:

```lean
PositiveBoxContinuedOddTruncationData.to_cutoffTruncationUpperBoundOnBox
```

Alvo escalar novo para fechar o cutoff por essa rota:

```lean
PositiveBoxCutoffExplicitDepthCoreScalarBudgetOnBox continuedOddUpper
```

Especializacao exata:

```lean
positiveBoxContinuedOddUpperExact
PositiveBoxCutoffExplicitDepthCoreExactOddScalarBudgetOnBox
PositiveBoxCutoffUpperData.of_explicitDepthCoreScalarBudget
PositiveBoxCutoffUpperData.of_explicitDepthCoreExactOddScalarBudget
```

## Avanco oddRef -> continued truncation -> cutoff

Foi fechada a ponte que faltava entre o certificado genuine/abstrato `oddRef`
e o pacote de truncamento do canal continuado:

```lean
PositiveBoxContinuedOddTruncationData.of_oddRefTruncation
```

Ela consome:

```lean
PositiveBoxOddRefContinuedCompatibility oddRef
PositiveBoxOddRefTruncationData oddRef
```

e produz:

```lean
PositiveBoxContinuedOddTruncationData
```

Com isso, dados de truncamento construidos no lado genuine/`oddRef` agora
alimentam diretamente a rota de cutoff depth/core:

```lean
PositiveBoxCutoffUpperData.of_oddRefTruncation_explicitDepthCoreScalarBudget
PositiveBoxCutoffUpperData.of_oddRefTruncation_explicitDepthCoreExactOddScalarBudget
```

Tambem foram criados wrappers finais para o alvo defect-aware com cutoff
continuado, juntando:

- horizontal via `PositiveBoxOddTruncationData`;
- cutoff via `PositiveBoxOddRefTruncationData oddRef`;
- compatibilidade local `PositiveBoxOddRefContinuedCompatibility oddRef`.

Nomes:

```lean
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectContinuedCutoffScalarBudget_ofOddTruncation_oddRefDepthCore
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectContinuedCutoffScalarBudget_ofOddTruncation_oddRefExactOddDepthCore
```

Depois disso, a mesma rota foi empacotada sobre o pacote ja existente:

```lean
PositiveBoxOddRefBridgeBounds data
```

que carrega internamente:

```lean
truncation : PositiveBoxOddRefTruncationData data.oddRef
```

Novos wrappers:

```lean
PositiveBoxCutoffUpperData.of_oddRefBridgeBounds_explicitDepthCoreScalarBudget
PositiveBoxCutoffUpperData.of_oddRefBridgeBounds_explicitDepthCoreExactOddScalarBudget
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectBridgeBoundsDepthCore
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectBridgeBoundsExactOddDepthCore
```

Observacao: os wrappers `BridgeBounds` finais consomem
`PositiveBoxHorizontalUpperData` separadamente. Isso preserva a diferenca entre:

```lean
PositiveBoxOddTruncationData
```

que alimenta o horizontal ativo contra `oddDirichletChannel`, e

```lean
PositiveBoxOddRefTruncationData data.oddRef
```

que alimenta o cutoff depth/core via `oddRef`.

Leitura tecnica:

```lean
oddRef = continuedOddDirichletChannel on positiveBox
→
‖rectangularOddCoreSum - oddRef‖ ≤ positiveBoxOddTruncationUpperValue
→
‖rectangularOddCoreSum - continuedOddDirichletChannel‖
  ≤ positiveBoxOddTruncationUpperValue
→
PositiveBoxCutoffUpperData
```

Verificacao:

```bash
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxOddRefPhase.lean
```

Resultado: passou sem saida.

## Estado mais recente 2026-07-06: alvo operacional atual

O alvo ativo mais refinado agora e:

```lean
C2ExactGapAnchorCanonicalPrototypePressureComponentSumBoundOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Ele abre a soma normalizada em cinco boletos:

```text
genuine central pressure
continued central pressure
horizontal pressure
cutoff pressure
lower-factor pressure
```

Ponte algébrica fechada:

```lean
c2ExactGapAnchorCanonicalClearedExternalPressureRatio_eq_componentSum
```

Wrappers finais disponiveis:

```lean
C2ExactGapAnchorCanonicalPrototypePressureSumBoundOnMiddle_of_componentSumBound
C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_componentSumBound
C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_of_componentSumBound
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypePressureComponentSumBound
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypePressureComponentSumBound
```

Proximo passo: escolher/provar bounds refinados para esses cinco boletos de
modo que a soma fique `≤ 3 / 4`, sem voltar para os bounds separados mais
grossos `totalBounds/aggregateBounds`.

## Estado mais recente 2026-07-06: continued por oddUpper

O segundo boleto foi refinado mais um passo: `continuedUpper` agora e herdado
de um upper do canal odd:

```lean
c2ContinuedCentralFromOddUpper oddUpper
C2ExactGapAnchorCanonicalCentralPairOddShareBudgetOnMiddle
```

Obrigacao nova:

```text
‖continuedOddDirichletChannel s‖ ≤ oddUpper s
```

com linha de caixa:

```text
genuineShareFromUpper
  + continuedShareFromUpper (c2ContinuedCentralFromOddUpper oddUpper)
  + horizontalPressure + cutoffPressure + lowerFactorPressure ≤ 3 / 4
```

Endpoints novos:

```lean
C2ExactGapAnchorCanonicalComponentSumBoundOnMiddle_of_centralPairOddShare
C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_centralPairOddShare
C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_of_centralPairOddShare
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_centralPairOddShare
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalCentralPairOddShare
```

Proximo alvo: encontrar/refinar `oddUpper` para o canal odd continued e
conferir o saldo antes de abrir horizontal/cutoff/lower-factor.

## Estado mais recente 2026-07-06: oddUpper exact fechado

O `oddUpper` foi provado pela forma no-loss:

```lean
c2ContinuedOddExactUpper
c2ContinuedOddChannelBound_exact
```

Nova superficie operacional:

```lean
C2ExactGapAnchorCanonicalCentralPairExactOddShareBudgetOnMiddle
```

Agora a linha de caixa restante e:

```text
genuineShareFromUpper
  + continuedShareFromUpper
      (c2ContinuedCentralFromOddUpper c2ContinuedOddExactUpper)
  + horizontalPressure + cutoffPressure + lowerFactorPressure ≤ 3 / 4
```

Endpoints novos:

```lean
C2ExactGapAnchorCanonicalComponentSumBoundOnMiddle_of_centralPairExactOdd
C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_centralPairExactOdd
C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_of_centralPairExactOdd
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_centralPairExactOdd
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalCentralPairExactOdd
```

Proximo alvo: testar/fechar essa linha de caixa exact-odd; se estourar,
buscar um upper estrutural menor para o canal odd continued.

## Estado mais recente 2026-07-06: caixa exact-odd isolado

O segundo boleto ficou separado em um alvo proprio:

```lean
C2ExactGapAnchorCanonicalCentralPairExactOddCashBudgetOnMiddle
```

Com a equivalencia:

```lean
C2ExactGapAnchorCanonicalCentralPairExactOddShareBudgetOnMiddle_iff_cash
```

e os aliases:

```lean
C2ExactGapAnchorCanonicalCentralPairExactOddShareBudgetOnMiddle_of_cash
C2ExactGapAnchorCanonicalCentralPairExactOddCashBudgetOnMiddle_of_shareBudget
```

Resultado: `oddUpper` ja esta pago; o caixa ainda precisa ser fechado pela
soma exact-odd `≤ 3 / 4`. Proximo alvo operacional: escolher/provar
`genuineUpper` e atacar esse `CashBudgetOnMiddle`.

## Estado mais recente 2026-07-06: soma exact-odd diagnosticada

O caixa foi limpo para a forma sem denominadores:

```lean
C2ExactGapAnchorCanonicalCentralPairExactOddClearedCashBudgetOnMiddle
```

Com `genuineUpper = c2GenuineCentralExactUpper`, a soma cabe exatamente quando
o custo extra do continued herdado do odd exact cabe no slack:

```lean
c2ExactGapAnchorCanonicalCentralPairExactOddContinuedClearedOvershoot
c2ExactGapAnchorCanonicalExactOddCashSlack
C2ExactGapAnchorCanonicalExactOddOvershootReserve_iff_slack
```

Fechamento condicional do boleto:

```lean
C2ExactGapAnchorCanonicalExactOddShareBudgetOnMiddle_of_overshoot
```

Resultado: a soma ainda nao esta paga automaticamente. Proximo alvo: provar
`C2ExactGapAnchorCanonicalCentralPairExactOddOvershootReserveBudgetOnMiddle`;
se o overshoot estourar o slack, migrar para a rota mais fina por `gapUpper`.

## Estado mais recente 2026-07-06: diagnostico externo descartado

A checagem numerica anterior foi removida como base de decisao porque usava um
canal externo ao objeto C2/genuine. Ela nao deve dizer que a conta cabe, nao
cabe ou que um gargalo esta identificado na rota ativa.

O registro valido desta etapa e apenas o fato formal de que a decomposicao
atual paga dois uppers centrais separados:

```text
‖genuineCentralDoubleSeries‖ + ‖continuedCentralOddChannel‖
```

A rota defect-aware permanece apenas como objeto formal disponivel. Ela nao
foi escolhida nem priorizada por esse diagnostico descartado.

## Estado mais recente 2026-07-06: reserva exact/no-loss sem perda

Foi provada a equivalencia formal entre o ledger exact/no-loss por componentes
e o alvo `PrototypeClearedTotal`:

```lean
C2ExactGapAnchorCanonicalExactComponentLedgerOnMiddle_iff_clearedTotalBound
ExactComponentSurplusReserveMiddleObligation_iff_prototypeClearedTotalMiddleObligation
```

Traducao do livro caixa:

```text
(1 / 4) * Q <= Q - D - G    <->    D + G <= (3 / 4) * Q
```

Conclusao: a rota mais fina atual nao perde saldo por arredondamento. O que
falta e provar a desigualdade real de caixa, refinando componentes de `D` e
`G` se necessario.

## Estado mais recente 2026-07-06: cinco boletos viraram alvo de slack

O alvo `PrototypeClearedTotal` agora tem uma leitura publica equivalente:

```lean
LowerFactorAfterCutoffSlackMiddleObligation
```

Ela diz que o lower-factor precisa caber no slack que sobra apos pagar:

```text
genuine central + continued central + horizontal + cutoff
```

Foram adicionadas equivalencias para recuar um nivel se o boleto final nao
couber:

```lean
C2ExactGapAnchorCanonicalComponentSumBound_iff_lowerFactor_le_slack
C2ExactGapAnchorCanonicalComponentSumBound_iff_cutoff_lower_le_slack
C2ExactGapAnchorCanonicalComponentSumBound_iff_tail_le_centralSlack
PrototypeClearedTotalMiddleObligation_iff_lowerFactorAfterCutoffSlack
```

Horizonte: atacar primeiro o lower-factor contra `slackAfterCutoff`. Se
estourar, o refinamento fica localizado no bloco cutoff/lower; se esse bloco
tambem estiver caro, recuar para horizontal/cutoff/lower.

## Estado mais recente 2026-07-06: alvo publico reduzido a surplus reserve

O alvo `PrototypeClearedTotalMiddleObligation` foi reescrito para a forma que
mede diretamente a folga preservada:

```lean
PrototypeSurplusReserveMiddleObligation
```

Ele abre para:

```lean
C2ExactGapAnchorCanonicalPrototypePressureSurplusReserveBoundOnMiddle
```

Interpretacao:

```text
(1 / 4) * clearedMargin <= lowerFactorClearedSurplus
```

Essa forma e equivalente a `externalDebit + lowerFactorCost <= 3/4 * Q`, mas
e melhor como proximo alvo porque acompanha diretamente o saldo que queremos
proteger.

Endpoints novos:

```lean
C2ExactGapAnchorCanonicalExactGapCollectedSlackOnMiddle_of_prototypeSurplusReserve
PrototypeSurplusReserveMiddleCertificate.toPrototypeClearedTotalCertificate
PrototypeSurplusReserveMiddleCertificate.toCollectedSlackCertificate
PrototypeSurplusReserveMiddleCertificate.nonvanishing
genuineCentral_ne_zero_of_prototypeSurplusReserveMiddleCertificate
```

Proximo alvo: provar `PrototypeSurplusReserveMiddleObligation`.

Validacoes:

```text
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
lake build LeanC2.AuditGenuineMiddleExactGapFrontier
lake build LeanC2.PeerReview
lake build LeanC2
```

A busca zeta nos arquivos Lean ativos tocados nao retornou ocorrencias.

## Estado mais recente 2026-07-06: exact/no-loss por componentes

O bounded ledger foi refinado mais uma vez. Agora o `surplusLower` recomendado
nao e um envelope opaco; ele e construido por componentes:

```text
surplusLower = marginLower - externalDebitUpper - lowerFactorCostUpper
```

Novo alvo publico:

```lean
ComponentSurplusReserveMiddleObligation
```

Escolha mais fina disponivel:

```lean
ExactComponentSurplusReserveMiddleObligation
```

Nessa escolha:

```text
marginUpper          = clearedMargin
marginLower          = clearedMargin
externalDebitUpper   = clearedExternalDebit
lowerFactorCostUpper = clearedLowerFactorCost
```

O boleto restante fica exatamente na contabilidade:

```text
(1 / 4) * clearedMargin
  <= clearedMargin - clearedExternalDebit - clearedLowerFactorCost
```

Isso evita qualquer arredondamento grosseiro. A rota publica ja leva de
`ExactComponentSurplusReserveMiddleCertificate` para collected slack e
nao-anulamento.

Validacoes:

```text
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
lake env lean LeanC2/PeerReview.lean
lake build LeanC2.AuditGenuineMiddleExactGapFrontier
lake build LeanC2.PeerReview
lake build LeanC2
```

A busca zeta nos arquivos Lean ativos tocados nao retornou ocorrencias.

## Estado mais recente 2026-07-06: surplus reserve reduzido a bounded ledger

O alvo ativo foi refinado para uma ledger com envelopes:

```lean
BoundedSurplusReserveMiddleObligation
```

Dados novos do certificado:

```text
marginUpper
surplusLower
```

Boletos restantes:

```text
clearedMargin <= marginUpper
surplusLower <= lowerFactorClearedSurplus
(1 / 4) * marginUpper <= surplusLower
```

Essa decomposicao permite escolher upper/lower refinados antes de tentar
fechar a desigualdade principal. Se o bounded ledger fecha, a cadeia publica
ja leva a collected slack e nao-anulamento.

Endpoints novos:

```lean
C2ExactGapAnchorCanonicalPrototypePressureSurplusReserveBoundOnMiddle_of_boundedLedger
C2ExactGapAnchorCanonicalExactGapCollectedSlackOnMiddle_of_boundedSurplusReserve
BoundedSurplusReserveMiddleCertificate.toPrototypeSurplusReserveCertificate
BoundedSurplusReserveMiddleCertificate.toCollectedSlackCertificate
genuineCentral_ne_zero_of_boundedSurplusReserveMiddleCertificate
```

Proximo alvo: escolher `marginUpper` e `surplusLower` finos e provar a ledger
`(1 / 4) * marginUpper <= surplusLower`.

Validacoes:

```text
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
lake build LeanC2.AuditGenuineMiddleExactGapFrontier
lake build LeanC2.PeerReview
lake build LeanC2
```

A busca zeta nos arquivos Lean ativos tocados nao retornou ocorrencias.

## Estado mais recente 2026-07-06: alvo publico reduzido a cleared total

Depois de expor o cover de razoes como alvo, refinamos mais uma vez para evitar
carregar uma obrigacao mais grossa que o necessario. O novo boleto publico e:

```lean
PrototypeClearedTotalMiddleObligation
```

Ele abre para:

```lean
C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBoundOnMiddle
```

Interpretacao:

```text
externalDebit + lowerFactorCost <= (3 / 4) * clearedMargin
```

Esse e o ponto certo para preservar o objetivo de folga: se a conta fecha aqui,
fica separado automaticamente `1/4 * Q` para o slack coletado. A passagem
`clearedTotal -> totalBounds -> ratioBounds -> ledger -> collectedSlack ->
nonvanishing` ficou conectada na API publica por:

```lean
PrototypeClearedTotalMiddleCertificate.toPrototypeRatioBoundsCertificate
PrototypeClearedTotalMiddleCertificate.toCollectedSlackCertificate
PrototypeClearedTotalMiddleCertificate.nonvanishing
genuineCentral_ne_zero_of_prototypeClearedTotalMiddleCertificate
```

Validacoes:

```text
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
lake build LeanC2.AuditGenuineMiddleExactGapFrontier
lake build LeanC2.PeerReview
lake build LeanC2
```

A busca zeta nos arquivos Lean ativos tocados nao retornou ocorrencias.

## Estado mais recente 2026-07-06: collected slack fechado pela ledger no-loss

A conta phase-aware foi fechada formalmente como consequencia da ledger no-loss:

```lean
C2ExactGapAnchorCanonicalExactGapCollectedSlackOnMiddle_of_exactWeightedEnvelopeLedger
```

Tambem ficaram disponiveis pontes intermediarias por `collected`,
`anchorResidualCleared`, `lowerFactorUnitReserve`, `lowerFactorSurplus`,
`clearedEnvelopeLedger` e `weightedLedger`.

Endpoint novo de nao-anulamento:

```lean
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactGapCollectedSlack
```

API publica atualizada em `LeanC2/PeerReview.lean`:

```lean
CollectedSlackMiddleObligation
CollectedSlackMiddleCertificate
genuineCentral_ne_zero_of_collectedSlackMiddleCertificate
```

Validado com:

```text
lake build LeanC2
```

Status: a rota `CollectedSlack` agora e endpoint formal da frente ativa. O
gargalo que resta nao e mais plumbing; e provar algum certificado que feche
`C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerBudgetOnMiddle` com os
uppers/lowers mais finos.

## Estado mais recente 2026-07-06: ledger reduzida a cover de razoes

O proximo alvo foi refinado no Lean. A ledger no-loss e fechada pelo cover
prototipo de razoes:

```lean
C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioBoundsCover
```

Nova ponte direta para a frente ativa:

```lean
C2ExactGapAnchorCanonicalExactGapCollectedSlackOnMiddle_of_closedPrototypeRatioBoundsCover
```

Nova API publica em `LeanC2/PeerReview.lean`:

```lean
PrototypeRatioBoundsMiddleObligation
PrototypeRatioBoundsMiddleCertificate
PrototypeRatioBoundsMiddleCertificate.toCollectedSlackCertificate
genuineCentral_ne_zero_of_prototypeRatioBoundsMiddleCertificate
```

Leitura: o alvo aberto agora e provar o cover finito das duas pressoes
normalizadas, nao a ledger inteira. Isso e mais fino porque a parte
allowance/reserve ja esta fechada e o atlas paga apenas as razoes
`externalPressureRatio` e `lowerFactorPressureRatio`.

Validado com:

```text
lake build LeanC2
```

## Estado mais recente 2026-07-06: collected slack phase-aware formalizado

Por criterio formal interno, a escolha foi nao abrir um `edge` separado agora.
O proximo alvo formal mais fino foi colocado no Lean como slack canonico da
ledger collected:

```lean
c2ExactGapAnchorCanonicalExactGapCollectedSlack
C2ExactGapAnchorCanonicalExactGapCollectedSlackPositiveOnMiddle
```

O arquivo `LeanC2/AuditGenuineMiddleExactGapFrontier.lean` agora prova:

```lean
c2ExactGapAnchorCanonicalExactGapCollectedSlack_eq_sharpSurplus
C2ExactGapAnchorCanonicalExactGapCollectedBudget_iff_collectedSlackPositive
C2ExactGapAnchorCanonicalExactGapCollectedOnMiddle_iff_collectedSlackPositive
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactGapCollectedSlack
```

Leitura: o budget `ExactGapCollected` virou uma positividade unica e canonica
do saldo phase-aware. Isso evita a rota norm-only do exact-odd e reaproveita a
ponte ja existente para `PhaseReserveBudgetOnMiddle`.

Validacao:

```text
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

Status: compilou limpo e sem ocorrencias zeta no arquivo ativo. Proximo passo:
provar `C2ExactGapAnchorCanonicalExactGapCollectedSlackPositiveOnMiddle` com os
uppers/lowers mais finos disponiveis para debitos externos e lower-factor.

## Estado mais recente 2026-07-06: scanner exact-odd invalidado para rota ativa

O scanner numerico do exact-odd nao deve orientar a rota middle Genuine-First.
Ele usa um canal diagnostico externo ao objeto C2/genuine e nao mede a
contabilidade propria do quarteto como certificado local.

Regra de retomada: ignorar esse laboratorio para decidir se `exact-odd`,
`phase-aware`, `edge split` ou lower-factor sao caros/promissores. A decisao
de rota deve ser refeita apenas por objetos Lean genuine/C2.

## Estado mais recente 2026-07-06: surplus depois do 1/4 isolado

O boleto exact-odd foi refinado para a linguagem do surplus:

```lean
c2ExactGapAnchorCanonicalExactOddSurplusAfterQuarter
c2ExactGapAnchorCanonicalExactOddCashSlack_eq_surplusAfterQuarter
C2ExactGapAnchorCanonicalExactOddOvershootReserve_iff_surplusAfterQuarter
C2ExactGapAnchorCanonicalExactOddOvershootOnMiddle_iff_surplusAfterQuarter
```

Nova ponte operacional:

```lean
C2ExactGapAnchorCanonicalExactOddShareBudgetOnMiddle_of_surplusAfterQuarter
```

Leitura do caixa:

```text
overshoot do continued herdado do odd exact
  ≤ surplus restante depois de separar 1/4 da margem limpa
```

Resultado: o boleto ainda nao fechou automaticamente. A reserva de `1/4`
apenas certifica o pagamento ordinario; para exact-odd precisamos de excedente
real alem disso. Horizonte recomendado: nao insistir nessa rota se esse
excedente ficar caro; seguir pela rota phase-aware `ExactGapCollected` /
`ExactWeightedEnvelopeLedger`, que evita o overshoot do norm-only odd channel.

## Estado mais recente 2026-07-06: genuine por upper pontual

O primeiro boleto agora tem a escolha refinada:

```lean
c2ExactGapAnchorCanonicalGenuinePressureShareFromUpper genuineUpper
C2ExactGapAnchorCanonicalGenuinePressureUpperShareBudgetOnMiddle
```

Ideia: provar somente

```lean
c2GenuineCentralExactUpper s ≤ genuineUpper s
```

e manter exatos o fator geometrico `(1 - ‖q s‖) * (1 + ‖q s‖)`, a margem limpa
e os outros quatro boletos.

Endpoints novos:

```lean
C2ExactGapAnchorCanonicalComponentSumBoundOnMiddle_of_genuineUpperShare
C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_genuineUpperShare
C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_of_genuineUpperShare
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_genuineUpperShare
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalGenuineUpperShare
```

Proximo alvo: construir um `genuineUpper` refinado para esse numerador e
conferir o saldo da linha
`shareFromUpper + continued + horizontal + cutoff + lowerFactor ≤ 3 / 4`.

## Estado mais recente 2026-07-06: par central refinado

O proximo boleto escolhido foi o `continued central pressure`, por ter a mesma
geometria do genuine. Nova share:

```lean
c2ExactGapAnchorCanonicalContinuedPressureShareFromUpper continuedUpper
```

Novo alvo:

```lean
C2ExactGapAnchorCanonicalCentralPairUpperShareBudgetOnMiddle
```

Ele troca os dois boletos centrais por uppers pontuais:

```text
c2GenuineCentralExactUpper s ≤ genuineUpper s
c2ContinuedCentralExactUpper s ≤ continuedUpper s
genuineShareFromUpper + continuedShareFromUpper
  + horizontalPressure + cutoffPressure + lowerFactorPressure ≤ 3 / 4
```

Endpoints novos:

```lean
C2ExactGapAnchorCanonicalComponentSumBoundOnMiddle_of_centralPairUpperShare
C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_centralPairUpperShare
C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_of_centralPairUpperShare
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_centralPairUpperShare
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalCentralPairUpperShare
```

Proximo alvo: provar `continuedUpper` de modo refinado e conferir o saldo do
par central antes de passar para horizontal/cutoff/lower-factor.

## Estado mais recente 2026-07-06: primeiro boleto isolado

O primeiro boleto escolhido foi o genuine central pressure. A nova superficie
troca apenas esse boleto por uma share escolhida:

```lean
C2ExactGapAnchorCanonicalGenuinePressureShareBudget
C2ExactGapAnchorCanonicalGenuinePressureShareBudgetOnMiddle
```

Os outros quatro boletos continuam exatos. O alvo pede:

```text
genuineCentralPressure ≤ genuineShare
genuineShare + continuedCentralPressure + horizontalPressure
  + cutoffPressure + lowerFactorPressure ≤ 3 / 4
```

Conectores fechados:

```lean
C2ExactGapAnchorCanonicalComponentSumBoundOnMiddle_of_genuinePressureShare
C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_genuinePressureShare
C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_of_genuinePressureShare
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_genuinePressureShare
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalGenuinePressureShare
```

Proximo passo: escolher uma `genuineShare` refinada. Essa escolha deve dominar
o pressure genuine central e ainda preservar a soma total abaixo de `3 / 4`.

## Estado mais recente 2026-07-06: cinco shares pontuais

Foi criada a interface flexivel para pagar os cinco boletos por shares
pontuais, sem escolher constantes globais prematuramente:

```lean
C2ExactGapAnchorCanonicalPrototypePressureComponentShareBudget
C2ExactGapAnchorCanonicalPrototypePressureComponentShareBudgetOnMiddle
```

Ela pede, ponto a ponto, cinco inequalities:

```text
genuineCentralPressure ≤ genuineShare
continuedCentralPressure ≤ continuedShare
horizontalPressure ≤ horizontalShare
cutoffPressure ≤ cutoffShare
lowerFactorPressure ≤ lowerFactorShare
```

e uma unica linha de caixa:

```text
genuineShare + continuedShare + horizontalShare
  + cutoffShare + lowerFactorShare ≤ 3 / 4
```

Conectores fechados:

```lean
C2ExactGapAnchorCanonicalPrototypePressureComponentSumBoundOnMiddle_of_componentShareBudget
C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_componentShareBudget
C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_of_componentShareBudget
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypePressureComponentShareBudget
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypePressureComponentShareBudget
```

Proximo passo: escolher shares concretos, de preferencia ainda como funcoes de
`s`, para cada boleto. Esta e a melhor forma atual de evitar constantes
grosseiras que estouram o saldo.

## Estado mais recente 2026-07-06: escolha recomendada

Escolha feita: usar primeiro a baseline exata, sem perda de saldo:

```lean
C2ExactGapAnchorCanonicalPrototypePressureExactComponentShareBudget
C2ExactGapAnchorCanonicalPrototypePressureExactComponentShareBudgetOnMiddle
```

Ela escolhe cada share como exatamente o pressure correspondente. Por isso e
equivalente ao alvo component-sum:

```lean
C2ExactGapAnchorCanonicalExactShareBudget_iff_componentSumBound
C2ExactGapAnchorCanonicalExactShareBudgetOnMiddle_iff_componentSumBoundOnMiddle
```

Wrappers diretos:

```lean
C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_exactShareBudget
C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_of_exactShareBudget
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_exactShareBudget
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactShareBudget
```

Leitura: esta baseline nao tenta provar o caixa sozinha; ela fixa a melhor
regua possivel. O proximo passo e substituir uma share exata por vez por upper
mais manejavel, sempre conferindo se a soma total ainda fica `≤ 3 / 4`.

## Atualizacao 2026-07-06: alvo allowanceLower conectado a bounds normalizados

O boleto

```lean
C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

agora tem duas entradas formais refinadas:

```lean
C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_totalBounds
C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_aggregateBounds
```

Tambem foram fechados os conectores intermediarios para o pagamento limpo:

```lean
C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBound_of_totalBounds
C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBoundOnMiddle_of_totalBounds
C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBound_of_aggregateBounds
C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBoundOnMiddle_of_aggregateBounds
```

E o alvo `allowanceLower` ganhou saida terminal propria:

```lean
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_allowanceLowerTotalBound
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalAllowanceLowerTotalBound
```

Leitura: ainda nao provamos os bounds normalizados para `D` e `G` a partir dos
dados horizontais. Mas a contabilidade foi fechada no nivel certo: basta provar
um destes dois alvos no middle:

```lean
C2ExactGapAnchorCanonicalPrototypePressureTotalBoundsOnMiddle
C2ExactGapAnchorCanonicalPrototypePressureAggregateBoundsOnMiddle
```

O alvo `aggregateBounds` e ligeiramente mais fino para este boleto, porque so
usa a linha da soma `externalPressure + lowerFactorPressure ≤ 3 / 4`; os bounds
individuais `≤ 5 / 8` ficam disponiveis para a atlas, mas nao sao necessarios
para pagar diretamente o `allowanceLower`.

Verificacao feita:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
lake build LeanC2.AuditGenuineMiddleExactGapFrontier
rg -n "sorry|admit|axiom|unsafe|riemannZeta|ExactZeta|zetaUpper|zetaDepthCore|\bzeta\b" \
  LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

Resultado: Lean e build passaram. A varredura nao retornou matches.

## Atualizacao 2026-07-06: lower no-loss para a margem limpa

Foi formalizado o lower mais fino disponivel para o alvo quarter-unit: um
`allowanceLower` canonico que, no middle/off-critical, coincide exatamente com
a margem limpa `Q = c2ExactGapAnchorCanonicalClearedMargin s`.

Novos objetos:

```lean
c2ExactGapAnchorCanonicalResidualMarginAllowanceLower
c2ExactGapAnchorCanonicalClearedMarginAllowanceLower
C2ExactGapAnchorCanonicalAllowanceLowerTotalBound
C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle
```

Formula explicita do lower limpo:

```lean
c2ExactGapAnchorCanonicalClearedMarginAllowanceLower s =
  (‖q s‖ ^ 2 / (1 + ‖q s‖) -
      2 * ‖q s‖ ^ 6 / (1 - ‖q s‖ ^ 2)) *
    (1 - ‖q s‖) ^ 2
```

Conectores fechados:

```lean
c2ExactGapAnchorCanonicalResidualMarginAllowanceLower_eq
c2ExactGapAnchorCanonicalClearedMarginAllowanceLower_eq
C2ExactGapAnchorCanonicalClearedMarginLowerBound_allowanceLower
C2ExactGapAnchorCanonicalClearedMarginLowerBoundOnMiddle_allowanceLower
C2ExactGapAnchorCanonicalAllowanceLowerTotalBound_iff_clearedTotalBound
C2ExactGapAnchorCanonicalAllowanceLowerOnMiddle_iff_clearedTotalBound
C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_iff_allowanceLower
```

Leitura: o alvo quarter-unit agora tambem pode ser atacado como:

```lean
C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

ou seja,

```lean
D + G ≤ (3 / 4) *
  c2ExactGapAnchorCanonicalClearedMarginAllowanceLower s
```

Como esse lower e igual a `Q` no middle, nao introduz perda adicional. O
proximo passo natural e tentar quitar `D + G` diretamente contra essa formula
normada, escolhendo bounds para `D` e `G` que preservem o saldo.

Verificacao feita:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

Resultado: passou sem saida.

## Atualizacao 2026-07-06: SumBound aberto em componentes exatos

O alvo mais fino foi expandido em quatro componentes exatos do debito externo:

```lean
c2ExactGapAnchorCanonicalClearedGenuineCentralPressureRatio
c2ExactGapAnchorCanonicalClearedContinuedCentralPressureRatio
c2ExactGapAnchorCanonicalClearedHorizontalPressureRatio
c2ExactGapAnchorCanonicalClearedCutoffPressureRatio
c2ExactGapAnchorCanonicalClearedExternalPressureComponentSum
```

Identidade fechada:

```lean
c2ExactGapAnchorCanonicalClearedExternalPressureRatio_eq_componentSum
```

Novo alvo operacional ainda mais legivel:

```lean
C2ExactGapAnchorCanonicalPrototypePressureComponentSumBoundOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Ele e apenas o `SumBound` escrito como:

```lean
genuineCentralPressure
  + continuedCentralPressure
  + horizontalPressure
  + cutoffPressure
  + lowerFactorPressure ≤ 3 / 4
```

Conectores diretos:

```lean
C2ExactGapAnchorCanonicalPrototypePressureSumBoundOnMiddle_of_componentSumBound
C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_componentSumBound
C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_of_componentSumBound
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypePressureComponentSumBound
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypePressureComponentSumBound
```

Leitura operacional: o proximo alvo agora tem cinco boletos visiveis. Essa e a
forma mais fina para escolher upper/lower sem estourar o saldo, porque evita
exigir `≤ 5 / 8` separadamente para external e lower-factor.

Verificacao feita:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

Resultado: passou sem saida.

## Atualizacao 2026-07-06: soma normalizada minima virou rota terminal

Foi isolado o alvo mais fino antes do fechamento do caixa:

```lean
C2ExactGapAnchorCanonicalPrototypePressureSumBoundOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Ele exige somente:

```lean
c2ExactGapAnchorCanonicalClearedExternalPressureRatio
    K M horizontalConstant horizontalScale horizontalRatio s +
  c2ExactGapAnchorCanonicalClearedLowerFactorPressureRatio s ≤ 3 / 4
```

Isto e mais refinado que os pacotes:

```lean
C2ExactGapAnchorCanonicalPrototypePressureTotalBoundsOnMiddle
C2ExactGapAnchorCanonicalPrototypePressureAggregateBoundsOnMiddle
```

porque nao exige bounds separados do tipo `≤ 5 / 8`; consome apenas a soma que
realmente precisa caber no caixa.

Novas pontes fechadas:

```lean
C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBoundOnMiddle_of_sumBound
C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_sumBound
C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_of_sumBound
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypePressureSumBound
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypePressureSumBound
```

Leitura operacional: agora basta provar o `SumBoundOnMiddle` mais `scale` e
`horizontal` para chegar de novo a:

```lean
genuineCentralDoubleSeries s ≠ 0
```

Proximo alvo recomendado: decompor a soma normalizada por componentes do debito
externo canonico. Nao tentar provar `scale/horizontal -> SumBound` diretamente,
pois o debito externo contem custos central, continued, horizontal e cutoff.
O passo fino e construir allowances normalizadas para esses componentes sem
voltar aos bounds separados mais grossos.

Verificacao feita:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

Resultado: passou sem saida.

## Atualizacao 2026-07-05: PeerReview alinhado com a rota viva

`LeanC2/PeerReview.lean` foi corrigido para nao expor mais a rota antiga do
middle canonico como endpoint publico ativo. Foram removidos os certificados
publicos antigos baseados no pacote canonico e a API publica passou a apontar
para a rota atual:

```lean
C2.PeerReview.CurrentMiddleRegion
C2.PeerReview.QuarterUnitMiddleObligation
C2.PeerReview.QuarterUnitMiddleCertificate
C2.PeerReview.genuineCentral_ne_zero_of_quarterUnitMiddleCertificate
```

Leitura: o `PeerReview` agora consome `scale`, `horizontal` e
`quarterUnit`, e entrega:

```lean
genuineCentralDoubleSeries s ≠ 0
```

na regiao middle canonica da continuação. Ele nao tenta mais construir o pacote
canonico antigo como checkpoint ativo.

Documentos alinhados nesta atualizacao:

```text
modelo_livro_caixa_middle.md
ORIENTACAO_MIDDLE_GENUINE.md
AUDIT_MIDDLE_ROUTE_LEDGER_CURRENT.md
TEMP_STATUS_MIDDLE_GENUINE.md
```

Verificacao feita:

```bash
lake env lean LeanC2/PeerReview.lean
lake build LeanC2.PeerReview
```

Resultado: passou. O build ainda mostra warnings antigos em dependencias, mas
nenhum erro.

Higiene:

```bash
rg -n "sorry|admit|axiom|unsafe|riemannZeta|ExactZeta|zetaUpper|zetaDepthCore|\bzeta\b" \
  LeanC2/AuditContinuedQuartetPositiveBoxCutoff.lean \
  LeanC2/AuditContinuedQuartetPositiveBoxOddRefPhase.lean
```

Resultado: sem matches.

## Atualizacao: escolha do allowanceLower

Escolha feita: nao usar a familia `tailLowerDistorted/oddMetric` como frente
principal, porque ela passa por uma versao cleared com barreira formal para
slack nao-negativo. Tambem nao usar a allowance exata inteira como alvo
principal, porque isso reempacota a fase sem decompor o problema.

O `allowanceLower` escolhido agora e a reserva fatorada:

```lean
c2ExactGapAnchorExactGapExpandedUpperFactorReserveLower externalDebitUpper
```

Novos nomes no shim:

```lean
C2ExactGapAnchorFactorAllowanceLowerScalarBudget_of_factorReserveLower
C2ExactGapAnchorFactorAllowanceLowerScalarBudgetOnMiddle_of_factorReserveLower
C2ExactGapAnchorFactorUpperLowerBudgetOnMiddle_of_externalFactorBudget
C2ExactGapAnchorCanonicalUpperLowerMiddleData.of_scaleData_factorReserveLower
```

Com essa escolha, a frente fica:

```lean
C2ExactGapAnchorExactGapExpandedUpperExternalDebitUpperBoundOnMiddle
  c2GenuineCentralExactUpper c2ContinuedCentralExactUpper
  (c2HorizontalRegularizedUpper horizontalConstant horizontalScale horizontalRatio)
  (c2RawCentralCutoffNormConstant K M)
  externalDebitUpper near edge

C2ExactGapAnchorExactGapExpandedUpperExternalFactorBudgetOnMiddle
  externalDebitUpper near edge
```

Leitura: o primeiro item diz que `externalDebitUpper` paga os debitos que nao
sao fase. O segundo e a desigualdade sem divisao:

```lean
((1 + ‖q s‖) * verticalDepthTailUpper s) *
    c2ContinuedVerticalAnchorResidualExactFactorUpper s +
  externalDebitUpper s <
    c2ExpandedQuartetResidualMargin s * (1 - ‖q s‖)
```

Esse e o proximo alvo concreto.

## Atualizacao: escolha mais fina do debito externo

Refinamento feito: em vez de deixar `externalDebitUpper` arbitrario, escolhemos
o debito externo canonico exato:

```lean
c2ExactGapAnchorCanonicalExternalDebit
  K M horizontalConstant horizontalScale horizontalRatio
```

Esse objeto e apenas:

```lean
c2ExactGapAnchorExactGapExpandedUpperExternalDebit
  c2GenuineCentralExactUpper c2ContinuedCentralExactUpper
  (c2HorizontalRegularizedUpper horizontalConstant horizontalScale horizontalRatio)
  (c2RawCentralCutoffNormConstant K M)
```

Ou seja: nao usa component upper grosseiro, nao troca horizontal/cutoff por
envelopes externos, e nao adiciona slack.

Novos nomes:

```lean
c2ExactGapAnchorCanonicalExternalDebit
C2ExactGapAnchorExactGapExpandedUpperExternalDebitUpperBoundOnMiddle_canonical
C2ExactGapAnchorCanonicalUpperLowerMiddleData.of_scaleData_canonicalExternalDebit
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExternalFactorBudget
```

Com isso, o alvo mais fino atual e:

```lean
C2ExactGapAnchorExactGapExpandedUpperExternalFactorBudgetOnMiddle
  (c2ExactGapAnchorCanonicalExternalDebit
    K M horizontalConstant horizontalScale horizontalRatio)
  near edge
```

Expandido, ele pede fechar:

```lean
((1 + ‖q s‖) * verticalDepthTailUpper s) *
    c2ContinuedVerticalAnchorResidualExactFactorUpper s +
  c2ExactGapAnchorCanonicalExternalDebit
    K M horizontalConstant horizontalScale horizontalRatio s <
    c2ExpandedQuartetResidualMargin s * (1 - ‖q s‖)
```

Esse e o melhor alvo para evitar estouro de saldo por estimativas grosseiras.

## Atualizacao: budget canonico nomeado e expandido

O alvo mais fino foi nomeado no Lean:

```lean
C2ExactGapAnchorCanonicalExternalFactorBudget
C2ExactGapAnchorCanonicalExternalFactorBudgetOnMiddle
```

Tambem foi provada a equivalencia com a forma escalar expandida:

```lean
C2ExactGapAnchorCanonicalExternalFactorBudget_iff_explicit
C2ExactGapAnchorCanonicalExternalFactorBudgetOnMiddle_iff_explicit
```

E o construtor/wrapper agora consome o alvo nomeado:

```lean
C2ExactGapAnchorCanonicalUpperLowerMiddleData.of_scaleData_canonicalExternalFactorBudget
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExternalFactorBudget
```

Assim, o proximo alvo oficial e:

```lean
C2ExactGapAnchorCanonicalExternalFactorBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Pela equivalencia expandida, isso significa provar no middle:

```lean
((1 + ‖q s‖) * verticalDepthTailUpper s) *
    c2ContinuedVerticalAnchorResidualExactFactorUpper s +
  ((1 + ‖q s‖) *
      (c2GenuineCentralExactUpper s +
        c2ContinuedCentralExactUpper s) +
    2 *
      (c2HorizontalRegularizedUpper
          horizontalConstant horizontalScale horizontalRatio s +
        c2RawCentralCutoffNormConstant K M s)) <
  c2ExpandedQuartetResidualMargin s * (1 - ‖q s‖)
```

## Atualizacao: reserva canonica de fase

O alvo foi reorganizado como uma reserva:

```lean
c2ExactGapAnchorCanonicalPhaseDebit
c2ExactGapAnchorCanonicalPhaseReserve
C2ExactGapAnchorCanonicalPhaseReserveBudget
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle
```

Equivalencias:

```lean
C2ExactGapAnchorCanonicalExternalFactorBudget_iff_phaseReserveBudget
C2ExactGapAnchorCanonicalExternalFactorBudgetOnMiddle_iff_phaseReserveBudgetOnMiddle
```

Wrapper direto:

```lean
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPhaseReserveBudget
```

Novo alvo oficial:

```lean
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Leitura:

```lean
c2ExactGapAnchorCanonicalPhaseDebit s <
  c2ExactGapAnchorCanonicalPhaseReserve
    K M horizontalConstant horizontalScale horizontalRatio s
```

Agora o trabalho fica dividido em dois passos naturais:

1. provar que a reserva canonica e positiva no middle;
2. controlar o phase debit/fator residual abaixo dessa reserva.

## Atualizacao: upper fino para o phase debit

O proximo shim foi formalizado em:

```text
LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

Novos nomes:

```lean
C2ExactGapAnchorCanonicalPhaseDebitUpperBound
C2ExactGapAnchorCanonicalPhaseDebitUpperBoundOnMiddle
C2ExactGapAnchorCanonicalPhaseDebitUpperReserveBudget
C2ExactGapAnchorCanonicalPhaseDebitUpperReserveBudgetOnMiddle
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_phaseDebitUpperReserveBudgetOnMiddle
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPhaseDebitUpperReserveBudget
```

Tambem ficou registrado que o debito de fase canonico e nao-negativo fora da
fronteira critica, e que qualquer `PhaseReserveBudget` fechado torna a reserva
canonica positiva:

```lean
c2ExactGapAnchorCanonicalPhaseDebit_nonneg_of_offCriticalStrip
c2ExactGapAnchorCanonicalPhaseReserve_pos_of_phaseReserveBudget
c2ExactGapAnchorCanonicalPhaseReserve_pos_onMiddle_of_phaseReserveBudgetOnMiddle
```

Com isso, o alvo fino imediato virou produzir um upper `phaseDebitUpper` tal
que, no middle:

```lean
c2ExactGapAnchorCanonicalPhaseDebit s ≤ phaseDebitUpper s
phaseDebitUpper s <
  c2ExactGapAnchorCanonicalPhaseReserve
    K M horizontalConstant horizontalScale horizontalRatio s
```

Essa forma evita reabrir `externalDebitUpper` arbitrario e deixa o saldo
externo no debito canonico exato ja escolhido.

Tambem foi criada a forma por upper do fator normalizado:

```lean
C2ExactGapAnchorCanonicalFactorUpperReserveBudget
C2ExactGapAnchorCanonicalFactorUpperReserveBudgetOnMiddle
C2ExactGapAnchorCanonicalPhaseDebitUpperBoundOnMiddle_of_exactFactorUpperBoundOnMiddle
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_factorUpperReserve
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalFactorUpperReserveBudget
```

Esse e o alvo mais operacional agora:

```lean
C2ExactGapAnchorExactFactorUpperBoundOnMiddle factorUpper near edge

C2ExactGapAnchorCanonicalFactorUpperReserveBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio factorUpper near edge
```

Isto significa: escolher um `factorUpper` fino para o fator residual
normalizado e provar que o pagamento ponderado
`c2ExactGapAnchorExactGapExpandedUpperWeightedPhaseDebit factorUpper s` cabe na
reserva canonica.

## Atualizacao: superficie odd-gap e half-disk

A rota ficou ainda mais concreta no Lean: o `factorUpper` pode ser fornecido
diretamente por um upper do gap impar continuado.

Novos nomes:

```lean
C2ExactGapAnchorCanonicalOddGapReserveBudget
C2ExactGapAnchorCanonicalOddGapReserveBudgetOnMiddle
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_oddGapReserve
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_halfDiskReserve
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalOddGapReserveBudget
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalHalfDiskReserve
```

Alvo recomendado agora:

```lean
C2ContinuedOddGapBoundOnMiddle gapUpper near edge

C2ExactGapAnchorCanonicalOddGapReserveBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio gapUpper near edge
```

Leitura: provar

```lean
‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖ ≤ gapUpper s
```

e mostrar que o pagamento ponderado desse `gapUpper` cabe na reserva canonica.

Especializacao half-disk disponivel:

```lean
C2ContinuedOddHalfDiskBoundOnMiddle halfDiskUpper near edge

C2ExactGapAnchorCanonicalOddGapReserveBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio
  (c2ContinuedOddGapUpperFromHalfDisk halfDiskUpper) near edge
```

Essa e a frente mais fina ate aqui, porque fala diretamente do cancelamento de
fase em `1 - 2 * continuedOddDirichletChannel`.

## Atualizacao: reserva unitaria do odd-gap

O pagamento ponderado do gap foi dividido por seu peso positivo:

```lean
c2ExactGapAnchorCanonicalOddGapWeight
c2ExactGapAnchorCanonicalOddGapUnitReserve
C2ExactGapAnchorCanonicalOddGapUnitReserveBudget
C2ExactGapAnchorCanonicalOddGapUnitReserveBudgetOnMiddle
```

Equivalencia formal:

```lean
C2ExactGapAnchorCanonicalOddGapReserveBudget_iff_unitReserveBudget
C2ExactGapAnchorCanonicalOddGapReserveBudgetOnMiddle_iff_unitReserveBudgetOnMiddle
```

Wrappers diretos:

```lean
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_oddGapUnitReserve
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_halfDiskUnitReserve
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalOddGapUnitReserve
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalHalfDiskUnitReserve
```

Alvo oficial mais legivel:

```lean
C2ContinuedOddGapBoundOnMiddle gapUpper near edge

C2ExactGapAnchorCanonicalOddGapUnitReserveBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio gapUpper near edge
```

Isto quer dizer:

```lean
gapUpper s <
  c2ExactGapAnchorCanonicalOddGapUnitReserve
    K M horizontalConstant horizontalScale horizontalRatio s
```

onde a reserva unitaria e a reserva canonica dividida pelo peso positivo
`(1 + ‖q s‖) * verticalDepthTailUpper s`.

## Atualizacao: reserva de raio half-disk

A especializacao half-disk agora tambem tem sua reserva propria, removendo o
fator `2` do gap:

```lean
c2ExactGapAnchorCanonicalHalfDiskUnitReserve
C2ExactGapAnchorCanonicalHalfDiskUnitReserveBudget
C2ExactGapAnchorCanonicalHalfDiskUnitReserveBudgetOnMiddle
```

Equivalencia:

```lean
C2ExactGapAnchorCanonicalOddGapUnitReserveBudget_iff_halfDiskUnitReserveBudget
C2ExactGapAnchorCanonicalOddGapUnitOnMiddle_iff_halfDiskRadiusOnMiddle
```

Wrapper direto:

```lean
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_halfDiskRadiusReserve
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalHalfDiskRadiusReserve
```

Alvo half-disk mais limpo:

```lean
C2ContinuedOddHalfDiskBoundOnMiddle halfDiskUpper near edge

C2ExactGapAnchorCanonicalHalfDiskUnitReserveBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio halfDiskUpper near edge
```

Isto pede diretamente:

```lean
halfDiskUpper s <
  c2ExactGapAnchorCanonicalHalfDiskUnitReserve
    K M horizontalConstant horizontalScale horizontalRatio s
```

Essa e a forma preferencial se a proxima estimativa for geometrica em torno de
`continuedOddDirichletChannel s ≈ 1 / 2`.

## Atualizacao: raio half-disk exato

Foi adicionada a versao sem perda do alvo half-disk:

```lean
c2ContinuedOddExactHalfDiskUpper
C2ContinuedOddHalfDiskBound_exactHalfDiskUpper
C2ContinuedOddHalfDiskBoundOnMiddle_exactHalfDiskUpper
C2ExactGapAnchorCanonicalExactHalfDiskRadiusBudget
C2ExactGapAnchorCanonicalExactHalfDiskRadiusBudgetOnMiddle
```

Equivalencia com a forma `halfDiskUpper`:

```lean
C2ExactGapAnchorCanonicalExactHalfDiskRadiusBudgetOnMiddle_iff
```

Wrappers diretos:

```lean
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskRadius
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactHalfDiskRadius
```

Alvo oficial mais fino:

```lean
C2ExactGapAnchorCanonicalExactHalfDiskRadiusBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Isto expande para:

```lean
‖(1 / 2 : ℂ) - continuedOddDirichletChannel s‖ <
  c2ExactGapAnchorCanonicalHalfDiskUnitReserve
    K M horizontalConstant horizontalScale horizontalRatio s
```

Conclusao: nao precisamos mais escolher um `halfDiskUpper` artificial para a
rota principal. O proximo fechamento matematico pode atacar diretamente o raio
exato contra a reserva canonica.

## Atualizacao: budget half-disk exato expandido

O alvo de raio exato agora tem duas formas equivalentes mais operacionais:

```lean
C2ExactGapAnchorCanonicalExactHalfDiskClearedBudget
C2ExactGapAnchorCanonicalExactHalfDiskClearedBudgetOnMiddle
C2ExactGapAnchorCanonicalExactHalfDiskExpandedBudget
C2ExactGapAnchorCanonicalExactHalfDiskExpandedBudgetOnMiddle
```

Equivalencias:

```lean
C2ExactGapAnchorCanonicalExactHalfDiskRadiusBudget_iff_cleared
C2ExactGapAnchorCanonicalExactHalfDiskRadiusOnMiddle_iff_cleared
C2ExactGapAnchorCanonicalExactHalfDiskClearedBudget_iff_expanded
C2ExactGapAnchorCanonicalExactHalfDiskClearedOnMiddle_iff_expanded
```

Wrappers diretos:

```lean
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskCleared
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskExpanded
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactHalfDiskCleared
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactHalfDiskExpanded
```

Alvo mais escalar para continuar:

```lean
C2ExactGapAnchorCanonicalExactHalfDiskExpandedBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Leitura expandida:

```lean
2 * ((1 + ‖q s‖) * verticalDepthTailUpper s) *
    ‖(1 / 2 : ℂ) - continuedOddDirichletChannel s‖ <
  c2ExpandedQuartetResidualMargin s * (1 - ‖q s‖) -
    c2ExactGapAnchorCanonicalExternalDebit
      K M horizontalConstant horizontalScale horizontalRatio s
```

Conclusao: a proxima prova pode trabalhar diretamente no livro-caixa escalar:
margem canonica menos debito externo deve pagar o raio half-disk exato com o
peso vertical/horizontal apropriado.

## Atualizacao: split payment/reserve do alvo expanded

O alvo expanded agora foi quebrado em uma interface de upper/lower:

```lean
c2ExactGapAnchorCanonicalExactHalfDiskPayment
c2ExactGapAnchorCanonicalExactHalfDiskReserve
C2ExactGapAnchorCanonicalExactHalfDiskPaymentUpperBoundOnMiddle
C2ExactGapAnchorCanonicalExactHalfDiskReserveLowerBoundOnMiddle
C2ExactGapAnchorCanonicalExactHalfDiskPaymentReserveBudgetOnMiddle
```

Ponte principal:

```lean
C2ExactGapAnchorCanonicalExactHalfDiskExpandedBudgetOnMiddle_of_upperLower
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskUpperLower
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactHalfDiskUpperLower
```

Equivalencia no-loss:

```lean
C2ExactGapAnchorCanonicalExactHalfDiskExpandedOnMiddle_iff_paymentReserve
```

Alvo operacional:

```lean
C2ExactGapAnchorCanonicalExactHalfDiskPaymentUpperBoundOnMiddle
  paymentUpper near edge

C2ExactGapAnchorCanonicalExactHalfDiskReserveLowerBoundOnMiddle
  horizontalConstant horizontalScale horizontalRatio reserveLower near edge

C2ExactGapAnchorCanonicalExactHalfDiskPaymentReserveBudgetOnMiddle
  paymentUpper reserveLower near edge
```

Leitura: produzir um upper fino para o pagamento do raio, produzir um lower
para a reserva escalar depois do debito externo, e fechar apenas
`paymentUpper s < reserveLower s` no middle.

## Atualizacao: split em halfDisk/margem/debito

A interface `payment/reserve` agora foi especializada para os tres dados
matematicos naturais:

```lean
c2ExactGapAnchorCanonicalHalfDiskPaymentUpper
C2ExactGapAnchorCanonicalExternalDebitUpperBoundOnMiddle
C2ExactGapAnchorCanonicalMarginLowerBoundOnMiddle
C2ExactGapAnchorCanonicalWeightedMarginLowerBoundOnMiddle
c2ExactGapAnchorCanonicalReserveLowerFromMarginDebit
```

Construtores:

```lean
C2ExactGapAnchorCanonicalExactHalfDiskPaymentUpperBoundOnMiddle_of_halfDisk
C2ExactGapAnchorCanonicalWeightedMarginLowerBoundOnMiddle_of_marginLower
C2ExactGapAnchorCanonicalExactHalfDiskReserveLowerBoundOnMiddle_of_marginDebit
```

Ponte direta:

```lean
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_halfDiskMarginDebit
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalHalfDiskMarginDebit
```

Alvo operacional atualizado:

```lean
C2ContinuedOddHalfDiskBoundOnMiddle halfDiskUpper near edge

C2ExactGapAnchorCanonicalMarginLowerBoundOnMiddle
  marginLower near edge

C2ExactGapAnchorCanonicalExternalDebitUpperBoundOnMiddle
  horizontalConstant horizontalScale horizontalRatio externalDebitUpper near edge

C2ExactGapAnchorCanonicalExactHalfDiskPaymentReserveBudgetOnMiddle
  (c2ExactGapAnchorCanonicalHalfDiskPaymentUpper halfDiskUpper)
  (c2ExactGapAnchorCanonicalReserveLowerFromMarginDebit
    marginLower externalDebitUpper)
  near edge
```

Leitura: o pagamento vem do raio half-disk, a reserva vem de
`marginLower * (1 - ‖q‖) - externalDebitUpper`, e a ultima obrigacao e so o
saldo estrito entre essas duas funcoes.

## Horizonte imediato

Os proximos blocos restantes agora estao mais separados:

```lean
PositiveBoxOddRefTruncationData oddRef
PositiveBoxOddRefContinuedCompatibility oddRef
PositiveBoxCutoffExplicitDepthCoreScalarBudgetOnBox continuedOddUpper
PositiveBoxOddRefPhaseData
  oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate
PositiveBoxExactGapAnchorActiveDefectContinuedCutoffScalarBudgetOnBox
```

Sugestao de ordem:

1. Fechar ou importar `PositiveBoxOddRefBridgeBounds data`, ou ao menos seu
   campo `PositiveBoxOddRefTruncationData data.oddRef`.
2. Fechar a compatibilidade local `PositiveBoxOddRefContinuedCompatibility`.
3. Provar um upper genuine-first para `continuedOddUpper` ou usar a
   especializacao exata temporaria.
4. Fechar o budget escalar
   `PositiveBoxCutoffExplicitDepthCoreScalarBudgetOnBox continuedOddUpper`.
5. Consumir isso no alvo defect-aware pelo wrapper final acima.

## Fronteira atual compilavel

Para responder exatamente "o que ainda falta", foram criados dois pacotes
checklist em Lean:

```lean
PositiveBoxActiveExactDefectBridgeBoundsDepthCoreFrontier
PositiveBoxActiveExactDefectBridgeBoundsExactOddFrontier
```

Consumidores:

```lean
PositiveBoxActiveExactDefectBridgeBoundsDepthCoreFrontier.to_verticalResidualDominance
PositiveBoxActiveExactDefectBridgeBoundsExactOddFrontier.to_verticalResidualDominance
```

Atualizacao: o campo `horizontal` da fronteira agora tem construtores a partir
de `PositiveBoxOddTruncationData`:

```lean
PositiveBoxActiveExactDefectBridgeBoundsDepthCoreFrontier.ofOddTruncation
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectBridgeBoundsDepthCore_ofOddTruncation

PositiveBoxActiveExactDefectBridgeBoundsExactOddFrontier.ofOddTruncation
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectBridgeBoundsExactOddDepthCore_ofOddTruncation
```

Assim, o horizontal ativo pode ser preenchido por:

```lean
PositiveBoxOddTruncationData
```

via `PositiveBoxHorizontalUpperData.ofOddTruncationAndQUpper positiveBoxQBounds`.

Tambem foram criadas as versoes que aceitam diretamente o pacote explicito:

```lean
PositiveBoxRawOddTruncationData
```

Novos nomes:

```lean
PositiveBoxActiveExactDefectBridgeBoundsDepthCoreFrontier.ofRawOddTruncation
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectBridgeBoundsDepthCore_ofRawOddTruncation

PositiveBoxActiveExactDefectBridgeBoundsExactOddFrontier.ofRawOddTruncation
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectBridgeBoundsExactOddDepthCore_ofRawOddTruncation
```

A versao geral pede:

```lean
continued_compat :
  PositiveBoxOddRefContinuedCompatibility data.oddRef

phase :
  PositiveBoxOddRefPhaseData
    data.oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate

horizontal :
  PositiveBoxHorizontalUpperData

bridge_bounds :
  PositiveBoxOddRefBridgeBounds data

continued_odd_upper :
  PositiveBoxContinuedOddUpperBoundOnBox continuedOddUpper

cutoff_depth_core_budget :
  PositiveBoxCutoffExplicitDepthCoreScalarBudgetOnBox continuedOddUpper

defect_continued_cutoff_budget :
  PositiveBoxExactGapAnchorActiveExactDefectContinuedCutoffScalarBudgetOnBox
```

A versao exata troca os dois campos `continuedOddUpper` por:

```lean
cutoff_depth_core_budget :
  PositiveBoxCutoffExplicitDepthCoreExactOddScalarBudgetOnBox
```

Assim, sim: ainda tem mais. Mas agora o restante esta explicitamente separado
em campos Lean.

Leitura: o cutoff nao foi fechado numericamente ainda, mas deixou de ser uma
caixa preta. Agora falta controlar o truncamento impar continuado e/ou o upper
do canal impar continuado dentro desse scalar budget.

Portanto, quando o cutoff vem de `PositiveBoxCutoffUpperData`, o budget usado
pela superficie defect-aware e:

```lean
positiveBoxCutUpperValue + centralDefectBudget s
```

Isso e deliberadamente honesto: o defeito central aparece uma vez como debito
central e outra vez na ponte do cutoff. Ainda falta provar/fornecer
`PositiveBoxCutoffUpperData`; o avanco aqui foi fechar a conexao sem misturar
o cutoff continuado com o cutoff bruto.

## Ultimo avanco Lean

Arquivo:

```text
LeanC2/AuditContinuedQuartetPositiveBoxCutoff.lean
LeanC2/AuditContinuedQuartetPositiveBoxOddRefPhase.lean
```

Comando:

```bash
lake build LeanC2.AuditContinuedQuartetPositiveBoxContinuedOdd
lake build LeanC2.AuditContinuedQuartetPositiveBoxCutoff
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxOddRefPhase.lean
```

Resultado: passou sem erro. Os comandos `lake build` exibiram apenas warnings
antigos de lint em arquivos grandes ja existentes.

## Proximo passo matematico real

Depois dos candidatos, provar ou deixar como campos intervalares:

```lean
central_defect_upper
cutoff_upper
margin_lower
scalar_budget
```

Com cutoff vindo da ponte continuada, o alvo escalar pratico e:

```lean
PositiveBoxExactGapAnchorActiveDefectContinuedCutoffScalarBudgetOnBox
  centralDefectBudget marginLower
```

com `49 / 9000`, `positiveBoxCutUpperValue`, `1 / 100` e `16 / 9` ja fixos na
interface. Proximos pontos: provar/fornecer `PositiveBoxCutoffUpperData`,
obter um `marginLower` para a margem canonica `c2ExpandedQuartetResidualMargin`
e depois atacar o `centralDefectBudget`.

Entrada equivalente para o cutoff: provar o `cut_bound` antigo sobre `cutVec`,
pois agora ele reconstrói `PositiveBoxCutoffUpperData`.

Entrada mais estruturada: provar
`PositiveBoxCutoffExplicitDepthCoreScalarBudgetOnBox continuedOddUpper` junto
com `PositiveBoxContinuedOddTruncationData` e um upper para
`continuedOddDirichletChannel`.

## Atualizacao: cutoff flexivel

Ao atacar a especializacao exata:

```lean
PositiveBoxCutoffExplicitDepthCoreExactOddScalarBudgetOnBox
```

ficou claro que ela reutiliza o valor horizontal:

```lean
positiveBoxOddTruncationUpperValue = 7 / 180
```

Esse valor e adequado para o ledger horizontal, mas e grosseiro para o cutoff
`positiveBoxCutUpperValue = 3 / 1000`: o primeiro termo

```lean
2 * positiveBoxDepthFactorExplicitUpper s *
  positiveBoxOddTruncationUpperValue
```

ja consome demais do orcamento. Isso nao foi registrado como impossibilidade
formal, mas virou uma decisao operacional: nao insistir no budget fixo como
proximo passo.

Foi criada uma superficie flexivel para o cutoff:

```lean
PositiveBoxCutoffExplicitDepthCoreFlexibleScalarBudgetOnBox
PositiveBoxCutoffExplicitDepthCoreConstantTruncationScalarBudgetOnBox
PositiveBoxCutoffExplicitDepthCoreFlexibleExactOddScalarBudgetOnBox
PositiveBoxCutoffExplicitDepthCoreConstantTruncationExactOddScalarBudgetOnBox

PositiveBoxCutoffUpperData.of_explicitDepthCoreFlexibleScalarBudget
PositiveBoxCutoffUpperData.of_explicitDepthCoreConstantTruncationScalarBudget
PositiveBoxCutoffUpperData.of_explicitDepthCoreFlexibleExactOddScalarBudget
PositiveBoxCutoffUpperData.of_explicitDepthCoreConstantTruncationExactOddScalarBudget
```

E a fronteira final ganhou os pacotes flexiveis:

```lean
PositiveBoxActiveExactDefectFlexibleCutoffDepthCoreFrontier
PositiveBoxActiveExactDefectFlexibleCutoffDepthCoreFrontier.to_verticalResidualDominance

PositiveBoxActiveExactDefectFlexibleCutoffExactOddFrontier
PositiveBoxActiveExactDefectFlexibleCutoffExactOddFrontier.to_verticalResidualDominance
```

Lista curta da fronteira exata flexivel:

```lean
PositiveBoxOddRefContinuedCompatibility data.oddRef
PositiveBoxOddRefPhaseData
  data.oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate
PositiveBoxHorizontalUpperData
PositiveBoxContinuedOddTruncationUpperBoundOnBox oddTruncationUpper
PositiveBoxCutoffExplicitDepthCoreFlexibleExactOddScalarBudgetOnBox
  oddTruncationUpper
PositiveBoxExactGapAnchorActiveExactDefectContinuedCutoffScalarBudgetOnBox
```

Novo proximo passo real: construir um `oddTruncationUpper` dedicado ao cutoff,
mais fino que `7 / 180`, e provar o budget flexivel.

Verificacao:

```bash
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxCutoff.lean
lake build LeanC2.AuditContinuedQuartetPositiveBoxOddRefPhase
```

Resultado: passou. O build do `OddRefPhase` ainda mostra warnings de linha
longa nesse arquivo de auditoria.

## Atualizacao: tentativa phase-cutoff

Foi testada a rota sugerida depois do cutoff flexivel: usar a fase ja
disponivel para produzir tambem um upper de norma para o canal impar
continuado.

Novos nomes em `LeanC2/AuditContinuedQuartetPositiveBoxOddRefPhase.lean`:

```lean
PositiveBoxOddRefTruncationUpperBoundOnBox
PositiveBoxOddRefTruncationData.to_truncationUpperBoundOnBox
PositiveBoxContinuedOddTruncationUpperBoundOnBox.of_oddRefTruncationUpper

positiveBoxContinuedOddUpperFromHalfDisk
positiveBoxContinuedOddUpperPhaseCandidate
PositiveBoxOddRefPhaseData.to_continuedOddUpperBoundOnBox
PositiveBoxOddRefPhaseData.to_continuedOddUpperBoundOnBox_candidate

PositiveBoxActiveExactDefectPhaseCutoffFrontier
PositiveBoxActiveExactDefectPhaseCutoffFrontier.to_verticalResidualDominance
```

A nova fronteira pede:

```lean
PositiveBoxOddRefContinuedCompatibility data.oddRef
PositiveBoxOddRefPhaseData
  data.oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate
PositiveBoxHorizontalUpperData
PositiveBoxOddRefTruncationUpperBoundOnBox
  data.oddRef oddTruncationUpper
PositiveBoxCutoffExplicitDepthCoreFlexibleScalarBudgetOnBox
  oddTruncationUpper positiveBoxContinuedOddUpperPhaseCandidate
PositiveBoxExactGapAnchorActiveExactDefectContinuedCutoffScalarBudgetOnBox
```

Leitura importante:

- a fase com allowance `1 / 20` implica o upper grosseiro
  `‖continuedOddDirichletChannel s‖ ≤ 21 / 40`;
- isso e honesto, mas provavelmente ainda e grande para o budget triangular do
  cutoff depth/core com `K = 3`;
- portanto o proximo passo pode nao ser apenas diminuir
  `oddTruncationUpper`; talvez seja necessario criar uma decomposicao do
  cutoff que preserve cancelamento, ou flexibilizar o cutoff budget no ledger
  defect-aware.

Verificacao:

```bash
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxOddRefPhase.lean
lake build LeanC2.AuditContinuedQuartetPositiveBoxOddRefPhase
```

Resultado: passou. O build mostra apenas warnings de linha longa.

Higiene nos shims ativos:

```bash
rg -n "sorry|admit|axiom|unsafe|riemannZeta|ExactZeta|zetaUpper|zetaDepthCore|\bzeta\b" \
  LeanC2/AuditContinuedQuartetPositiveBoxCutoff.lean \
  LeanC2/AuditContinuedQuartetPositiveBoxOddRefPhase.lean \
  LeanC2/AuditContinuedQuartetPositiveBoxGenuineOddBridge.lean
```

Resultado: sem matches.

## Atualizacao: barreira formal do phase-cutoff triangular

A tentativa `phase-cutoff` agora foi formalmente descartada no Lean.

Novos nomes:

```lean
positiveBox_corner_mem
positiveBox_phaseCandidate_depthCutoffTerm_exceeds_cutUpper
not_positiveBoxCutoffExplicitDepthCoreFlexibleScalarBudgetOnBox_phaseCandidate_at
not_PositiveBoxActiveExactDefectPhaseCutoffFrontier
```

Leitura:

- a fase com allowance ativa produz o upper constante
  `positiveBoxContinuedOddUpperPhaseCandidate = fun _ => 21 / 40`;
- no ponto lower-left da `positiveBox`, usando
  `positiveBox_q_norm_lower_11_40`, o termo de depth-cutoff sozinho ja excede
  `positiveBoxCutUpperValue = 3 / 1000`;
- portanto, mesmo com `oddTruncationUpper s ≥ 0`, nao ha como fechar

```lean
PositiveBoxCutoffExplicitDepthCoreFlexibleScalarBudgetOnBox
  oddTruncationUpper positiveBoxContinuedOddUpperPhaseCandidate
```

pela decomposicao triangular atual;
- consequentemente, o pacote

```lean
PositiveBoxActiveExactDefectPhaseCutoffFrontier
```

nao e habitavel.

Conclusao operacional: nao insistir em diminuir apenas `oddTruncationUpper`
dentro desse mesmo budget triangular. O proximo passo correto e trocar a
decomposicao de cutoff por uma forma phase-aware/cancellation-aware, ou
revisitar o proprio ledger do cutoff antes de forcar
`positiveBoxCutUpperValue = 3 / 1000`.

## Observacoes

O arquivo antigo `AGENTS.md` foi removido do workspace e nao deve ser usado
como orientacao ativa para esta rota.

## Atualizacao: frontier canonical upper/lower exact-gap

Assumimos a frente gap-aware/exact-anchor como rota principal e criamos um shim
isolado:

```text
LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

Nome principal:

```lean
C2ExactGapAnchorCanonicalUpperLowerMiddleData
```

Leitura operacional: o upper do fator residual fica fixado como

```lean
c2ContinuedVerticalAnchorResidualExactFactorUpper
```

Com isso, depois da geometria horizontal/scale, a fronteira ativa vira apenas:

```lean
C2ExactGapAnchorFactorAllowanceLowerBoundOnMiddle
  horizontalConstant horizontalScale horizontalRatio allowanceLower near edge

C2ExactGapAnchorFactorUpperLowerBudgetOnMiddle
  c2ContinuedVerticalAnchorResidualExactFactorUpper allowanceLower near edge
```

O arquivo novo tambem fornece os conversores:

```lean
C2ExactGapAnchorCanonicalUpperLowerMiddleData.of_scaleData
C2ExactGapAnchorCanonicalUpperLowerMiddleData.of_scaleData_scalarBudget
C2ExactGapAnchorCanonicalUpperLowerMiddleData.to_tailNormAnchorResidualFactorBudget
C2ExactGapAnchorCanonicalUpperLowerMiddleData.to_phaseSavingOnMiddle
C2ExactGapAnchorCanonicalUpperLowerMiddleData.to_exactGapExpandedMiddleData
C2ExactGapAnchorCanonicalUpperLowerMiddleData.to_ne_zero_on_middle
```

O construtor `of_scaleData_scalarBudget` permite trocar o lower bound da
allowance por uma obrigacao escalar:

```lean
C2ExactGapAnchorFactorAllowanceLowerScalarBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio allowanceLower near edge
```

Conclusao: se conseguirmos produzir `allowanceLower`, fechar esse scalar budget
e provar que o fator exato fica estritamente abaixo dele no middle, o shim ja
entrega `genuineCentralDoubleSeries s ≠ 0` na regiao middle, sem passar por
zeta e sem reviver a rota triangular `phase-cutoff`.

Verificacao:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
lake build LeanC2.AuditGenuineMiddleExactGapFrontier
```

Resultado: passou. O build mostra warnings antigos em dependencias, mas nenhum
warning novo no arquivo criado.

Higiene:

```bash
rg -n "sorry|admit|axiom|unsafe|riemannZeta|ExactZeta|zetaUpper|zetaDepthCore|\bzeta\b" \
  LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

Resultado: sem matches.

## Atualizacao 2026-07-05: saldo escalar halfDisk/margem/debito

Arquivo ativo:

```text
LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

A frente `halfDisk + margem + debito` foi comprimida em uma obrigacao escalar
explicita, sem precisar expor manualmente `paymentUpper` e `reserveLower`.

Novos nomes:

```lean
C2ExactGapAnchorCanonicalHalfDiskMarginDebitScalarBudget
C2ExactGapAnchorCanonicalHalfDiskMarginDebitScalarBudgetOnMiddle
C2ExactGapAnchorCanonicalHalfDiskMarginDebitScalarBudget_iff_paymentReserve
C2ExactGapAnchorCanonicalHalfDiskMarginDebitScalarBudgetOnMiddle_iff_paymentReserve
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_halfDiskMarginDebitScalar
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalHalfDiskMarginDebitScalar
```

Alvo operacional atualizado:

```lean
C2ContinuedOddHalfDiskBoundOnMiddle halfDiskUpper near edge

C2ExactGapAnchorCanonicalMarginLowerBoundOnMiddle
  marginLower near edge

C2ExactGapAnchorCanonicalExternalDebitUpperBoundOnMiddle
  horizontalConstant horizontalScale horizontalRatio externalDebitUpper near edge

C2ExactGapAnchorCanonicalHalfDiskMarginDebitScalarBudgetOnMiddle
  halfDiskUpper marginLower externalDebitUpper near edge
```

Forma ponto a ponto do saldo final:

```lean
2 * ((1 + ‖q s‖) * verticalDepthTailUpper s) * halfDiskUpper s <
  marginLower s * (1 - ‖q s‖) - externalDebitUpper s
```

Status: a ponte ate `genuineCentralDoubleSeries s ≠ 0` esta compilada. O
trabalho matematico restante e produzir/certificar `halfDiskUpper`,
`marginLower`, `externalDebitUpper` e fechar essa desigualdade escalar no
middle.

Verificacao:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

Resultado: passou sem saida.

## Atualizacao 2026-07-05: saldo canonico halfDisk/phaseReserve

O alvo foi refinado mais uma vez no shim:

```text
LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

Agora `marginLower` e `externalDebitUpper` foram especializados sem perda:

```lean
C2ExactGapAnchorCanonicalMarginLowerBoundOnMiddle_exact
C2ExactGapAnchorCanonicalExternalDebitUpperBoundOnMiddle_canonical
```

Novos nomes:

```lean
C2ExactGapAnchorCanonicalHalfDiskPhaseReserveBudget
C2ExactGapAnchorCanonicalHalfDiskPhaseReserveBudgetOnMiddle
C2ExactGapAnchorCanonicalHalfDiskPhaseReserveBudget_iff_marginDebitScalar
C2ExactGapAnchorCanonicalHalfDiskPhaseReserveBudgetOnMiddle_iff_marginDebitScalar
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_halfDiskPhaseReserve
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalHalfDiskPhaseReserve
```

Novo alvo operacional:

```lean
C2ContinuedOddHalfDiskBoundOnMiddle halfDiskUpper near edge

C2ExactGapAnchorCanonicalHalfDiskPhaseReserveBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio halfDiskUpper near edge
```

Forma ponto a ponto:

```lean
2 * ((1 + ‖q s‖) * verticalDepthTailUpper s) * halfDiskUpper s <
  c2ExactGapAnchorCanonicalPhaseReserve
    K M horizontalConstant horizontalScale horizontalRatio s
```

Ou seja, falta escolher/provar um `halfDiskUpper` genuine-first e mostrar que o
pagamento ponderado desse raio cabe na reserva canonica de fase.

Verificacao:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

Resultado: passou sem saida.

## Atualizacao 2026-07-05: raio exato sem halfDiskUpper

O alvo foi comprimido para uma unica obrigacao, sem o parametro livre
`halfDiskUpper`. A escolha agora e o raio exato:

```lean
c2ContinuedOddExactHalfDiskUpper
```

Novos nomes:

```lean
C2ExactGapAnchorCanonicalExactHalfDiskPhaseReserveBudget
C2ExactGapAnchorCanonicalExactHalfDiskPhaseReserveBudgetOnMiddle
C2ExactGapAnchorCanonicalExactHalfDiskPhaseReserveBudget_iff_halfDiskPhaseReserve
C2ExactGapAnchorCanonicalExactHalfDiskPhaseReserveOnMiddle_iff_halfDiskPhaseReserve
C2ExactGapAnchorCanonicalExactHalfDiskPhaseReserveBudget_iff_expanded
C2ExactGapAnchorCanonicalExactHalfDiskPhaseReserveOnMiddle_iff_expanded
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskPhaseReserve
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactHalfDiskPhaseReserve
```

Novo alvo operacional:

```lean
C2ExactGapAnchorCanonicalExactHalfDiskPhaseReserveBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Forma ponto a ponto:

```lean
2 * ((1 + ‖q s‖) * verticalDepthTailUpper s) *
    ‖(1 / 2 : ℂ) - continuedOddDirichletChannel s‖ <
  c2ExactGapAnchorCanonicalPhaseReserve
    K M horizontalConstant horizontalScale horizontalRatio s
```

Esse alvo e equivalente ao expanded exato antigo:

```lean
C2ExactGapAnchorCanonicalExactHalfDiskExpandedBudgetOnMiddle
```

mas agora fica alinhado com a frente canonica `HalfDiskPhaseReserve`.

Verificacao:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

Resultado: passou sem saida.

## Atualizacao 2026-07-05: split payment/reserve da frente atual

A reserva canonica foi separada como lower proprio, para inspecionar a folga
antes de tentar fechar o raio/fase.

Novos nomes:

```lean
C2ExactGapAnchorCanonicalPhaseReserveLowerBound
C2ExactGapAnchorCanonicalPhaseReserveLowerBoundOnMiddle
C2ExactGapAnchorCanonicalPhaseReserveLowerBoundOnMiddle_exact
C2ExactGapAnchorCanonicalPhaseReserveLowerBoundOnMiddle_of_marginDebit
C2ExactGapAnchorCanonicalExactHalfDiskPaymentUpperBoundOnMiddle_exact
C2ExactGapAnchorCanonicalExactHalfDiskPhaseReserveBudgetOnMiddle_of_upperLower
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskPhaseUpperLower
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactHalfDiskPhaseUpperLower
```

Novo alvo operacional modular:

```lean
C2ExactGapAnchorCanonicalExactHalfDiskPaymentUpperBoundOnMiddle
  paymentUpper near edge

C2ExactGapAnchorCanonicalPhaseReserveLowerBoundOnMiddle
  horizontalConstant horizontalScale horizontalRatio reserveLower near edge

C2ExactGapAnchorCanonicalExactHalfDiskPaymentReserveBudgetOnMiddle
  paymentUpper reserveLower near edge
```

Leitura: primeiro escolhemos um lower verificavel para a reserva canonica; em
paralelo escolhemos um upper para o pagamento do raio exato; depois fechamos o
saldo estrito `paymentUpper s < reserveLower s`.

Verificacao:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

Resultado: passou sem saida.

## Atualizacao 2026-07-05: escolha sharp de upper/lower

Foram escolhidos os dois lados mais refinados disponiveis:

```lean
paymentUpper :=
  c2ExactGapAnchorCanonicalExactHalfDiskPayment

reserveLower :=
  c2ExactGapAnchorCanonicalPhaseReserve
    K M horizontalConstant horizontalScale horizontalRatio
```

Novos nomes:

```lean
C2ExactGapAnchorCanonicalExactHalfDiskSharpUpperLowerBudget
C2ExactGapAnchorCanonicalExactHalfDiskSharpUpperLowerBudgetOnMiddle
C2ExactGapAnchorCanonicalExactHalfDiskSharpUpperLowerBudget_iff_phaseReserve
C2ExactGapAnchorCanonicalExactHalfDiskSharpUpperLowerOnMiddle_iff_phaseReserve
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskSharpUpperLower
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactHalfDiskSharpUpperLower
```

Alvo mais fino atual:

```lean
C2ExactGapAnchorCanonicalExactHalfDiskSharpUpperLowerBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Leitura: nao ha perda de envelope aqui. Esse alvo e exatamente o saldo entre o
pagamento real do raio half-disk e a reserva canonica real.

Verificacao:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

Resultado: passou sem saida.

## Atualizacao 2026-07-05: contabilidade sharp por saldo

A comparacao sharp foi reescrita como positividade de saldo:

```lean
c2ExactGapAnchorCanonicalExactHalfDiskSharpSurplus
  K M horizontalConstant horizontalScale horizontalRatio s
```

Identidade auditada:

```lean
surplus =
  c2ExpandedQuartetResidualMargin s * (1 - ‖q s‖) -
    c2ExactGapAnchorCanonicalExternalDebit
      K M horizontalConstant horizontalScale horizontalRatio s -
    c2ExactGapAnchorCanonicalExactHalfDiskPayment s
```

Novos nomes:

```lean
c2ExactGapAnchorCanonicalExactHalfDiskSharpSurplus
C2ExactGapAnchorCanonicalExactHalfDiskSharpSurplusPositive
C2ExactGapAnchorCanonicalExactHalfDiskSharpSurplusPositiveOnMiddle
c2ExactGapAnchorCanonicalExactHalfDiskSharpSurplus_eq_ledger
c2ExactGapAnchorCanonicalExactHalfDiskSharpSurplus_eq_expandedLedger
C2ExactGapAnchorCanonicalExactHalfDiskSharpUpperLowerBudget_iff_surplus
C2ExactGapAnchorCanonicalExactHalfDiskSharpUpperLowerOnMiddle_iff_surplus
C2ExactGapAnchorCanonicalExactHalfDiskSharpSurplusPositive_iff_expanded
C2ExactGapAnchorCanonicalExactHalfDiskSharpSurplusOnMiddle_iff_expanded
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskSharpSurplus
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactHalfDiskSharpSurplus
```

Alvo operacional agora:

```lean
C2ExactGapAnchorCanonicalExactHalfDiskSharpSurplusPositiveOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Leitura: a contabilidade esta reduzida ao saldo real
`margem ponderada - debito externo - pagamento half-disk`. Nao foi introduzido
nenhum envelope novo.

Checagem de reaproveitamento: nao apareceu um fechamento pronto nas rotas
antigas. O alvo antigo `C2ExactGapAnchorExactHalfDiskBudgetOnMiddle` trabalha
na moeda normalizada `c2ExactGapAnchorFactorAllowance`; o alvo atual trabalha
na moeda ponderada do saldo sharp, entao precisa de ponte propria ou de prova
direta desse saldo.

Verificacao:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

Resultado: passou sem saida.

## Atualizacao 2026-07-05: alvo weighted-ledger

O saldo sharp foi aberto em uma contabilidade de tres pecas:

```lean
externalDebitUpper s + paymentUpper s < weightedMarginLower s
```

Novos nomes:

```lean
C2ExactGapAnchorCanonicalWeightedMarginDebitPaymentBudget
C2ExactGapAnchorCanonicalWeightedMarginDebitPaymentBudgetOnMiddle
C2ExactGapAnchorCanonicalWeightedMarginLowerBound_exact
C2ExactGapAnchorCanonicalWeightedMarginLowerBoundOnMiddle_exact
C2ExactGapAnchorCanonicalExactHalfDiskSharpSurplusPositive_of_weighted
C2ExactGapAnchorCanonicalExactHalfDiskSharpSurplusOnMiddle_of_weighted
C2ExactGapAnchorCanonicalExactHalfDiskWeightedLedgerBudget
C2ExactGapAnchorCanonicalExactHalfDiskWeightedLedgerBudgetOnMiddle
C2ExactGapAnchorCanonicalExactHalfDiskWeightedLedgerBudget_iff_surplus
C2ExactGapAnchorCanonicalExactHalfDiskWeightedLedgerOnMiddle_iff_surplus
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskWeightedLedger
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactHalfDiskWeightedLedger
```

Alvo operacional mais direto agora:

```lean
C2ExactGapAnchorCanonicalExactHalfDiskWeightedLedgerBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Expandido, esse alvo e:

```lean
c2ExactGapAnchorCanonicalExternalDebit
    K M horizontalConstant horizontalScale horizontalRatio s +
  c2ExactGapAnchorCanonicalExactHalfDiskPayment s <
    c2ExpandedQuartetResidualMargin s * (1 - ‖q s‖)
```

Leitura: nao introduzimos perda no alvo principal; apenas trocamos
`0 < surplus` pela forma equivalente `debit + payment < weightedMargin`.

Verificacao:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

Resultado: passou sem saida.

## Atualizacao 2026-07-05: ledger componentizado

O `externalDebit` foi aberto nos quatro componentes canonicos:

```lean
c2GenuineCentralExactUpper
c2ContinuedCentralExactUpper
c2HorizontalRegularizedUpper horizontalConstant horizontalScale horizontalRatio
c2RawCentralCutoffNormConstant K M
```

Novos nomes:

```lean
c2ExactGapAnchorCanonicalExternalDebitComponentUpper
C2ExactGapAnchorCanonicalExternalDebitComponentBounds
C2ExactGapAnchorCanonicalExternalDebitComponentBoundsOnMiddle
C2ExactGapAnchorCanonicalExternalDebitUpperBoundOnMiddle_of_components
C2ExactGapAnchorCanonicalWeightedComponentLedgerBudget
C2ExactGapAnchorCanonicalWeightedComponentLedgerBudgetOnMiddle
C2ExactGapAnchorCanonicalExactHalfDiskSharpSurplusOnMiddle_of_componentLedger
C2ExactGapAnchorCanonicalExactHalfDiskComponentLedgerBudget
C2ExactGapAnchorCanonicalExactHalfDiskComponentLedgerBudgetOnMiddle
C2ExactGapAnchorCanonicalExactHalfDiskComponentLedgerOnMiddle_iff_weighted
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskComponentLedger
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactHalfDiskComponentLedger
```

Alvo operacional atual:

```lean
C2ExactGapAnchorCanonicalExactHalfDiskComponentLedgerBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Forma escalar:

```lean
(1 + ‖q s‖) *
    (c2GenuineCentralExactUpper s + c2ContinuedCentralExactUpper s) +
  2 *
    (c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio s +
      c2RawCentralCutoffNormConstant K M s) +
  c2ExactGapAnchorCanonicalExactHalfDiskPayment s <
    c2ExpandedQuartetResidualMargin s * (1 - ‖q s‖)
```

Leitura: esse e o mesmo weighted-ledger sem perda, mas agora cada custo esta
exposto. O proximo passo natural e tentar pagar esses cinco custos contra a
margem ponderada.

Verificacao:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

Resultado: passou sem saida.

## Atualizacao 2026-07-05: encaixe com collected budget

Foi formalizado que o ledger componentizado e exatamente o collected budget
canonico do exact-gap:

```lean
C2ExactGapAnchorExactGapExpandedUpperCollectedBudgetOnMiddle
  c2GenuineCentralExactUpper
  c2ContinuedCentralExactUpper
  (c2HorizontalRegularizedUpper
    horizontalConstant horizontalScale horizontalRatio)
  (c2RawCentralCutoffNormConstant K M)
  near edge
```

Novos nomes:

```lean
c2ExactGapAnchorCanonicalExactHalfDiskPayment_eq_weightedExactTailGap
C2ExactGapAnchorCanonicalExactHalfDiskComponentLedgerBudget_iff_collected
C2ExactGapAnchorCanonicalExactHalfDiskComponentLedgerOnMiddle_iff_collected
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactGapCollected
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactGapCollected
```

Leitura: o pagamento half-disk e exatamente
`(1 + ‖q s‖) * c2ExactGapAnchorExactTailGapBudget s`, entao os cinco custos do
ledger componentizado sao o collected budget antigo escrito sem perda. O alvo
operacional pode ser retomado nessa moeda collected.

Verificacao:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

Resultado: passou sem saida.

## Atualizacao 2026-07-05: alvo anchor-residual cleared

Foi criada a ponte canonica do orcamento operator-side ja limpo para o
collected budget:

```lean
C2ExactGapAnchorCanonicalAnchorResidualClearedBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Novos nomes:

```lean
C2ExactGapAnchorCanonicalAnchorResidualClearedBudget
C2ExactGapAnchorCanonicalAnchorResidualClearedBudgetOnMiddle
C2ExactGapAnchorCanonicalBaseComponentBoundsOnMiddle_exact
C2ExactGapAnchorCanonicalCollectedOnMiddle_of_anchorResidualCleared
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_anchorResidualCleared
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalAnchorResidualCleared
```

Leitura: esse alvo e mais fino que tentar pagar diretamente o ledger
componentizado. Ele multiplica tudo por `(1 - ‖q s‖)` e troca o custo de fase
pelo residual vertical do operador:

```lean
(1 + ‖q s‖) ^ 2 * ‖c2ContinuedVerticalAnchorResidual s‖ +
    componentUpper s * (1 - ‖q s‖) <
  c2ExpandedQuartetResidualMargin s * (1 - ‖q s‖) ^ 2
```

Se esse `anchorResidualCleared` canonico for provado no middle, a cadeia ja
fecha:

```lean
anchorResidualCleared
  -> collected budget canonico
  -> exact half-disk component ledger
  -> phase reserve
  -> genuineCentralDoubleSeries s ≠ 0
```

Verificacao:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

Resultado: passou sem saida.

## Atualizacao 2026-07-05: unit reserve do lower factor

O alvo `anchorResidualCleared` foi convertido para uma forma unitaria mais
fina:

```lean
C2ExactGapAnchorCanonicalLowerFactorClearedUnitReserveBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Novos nomes:

```lean
C2ExactGapAnchorCanonicalLowerFactorClearedBudget
C2ExactGapAnchorCanonicalLowerFactorClearedBudgetOnMiddle
c2ExactGapAnchorCanonicalLowerFactorClearedWeight
c2ExactGapAnchorCanonicalLowerFactorClearedReserve
c2ExactGapAnchorCanonicalLowerFactorClearedUnitReserve
C2ExactGapAnchorCanonicalLowerFactorClearedUnitReserveBudget
C2ExactGapAnchorCanonicalLowerFactorClearedUnitReserveBudgetOnMiddle
C2ExactGapAnchorCanonicalLowerFactorClearedUnitReserveBudget_iff_cleared
C2ExactGapAnchorCanonicalLowerFactorClearedBudget_iff_anchorResidual
C2ExactGapAnchorCanonicalLowerFactorClearedUnitReserveOnMiddle_iff_anchorResidual
C2ExactGapAnchorCanonicalCollectedOnMiddle_of_lowerFactorUnitReserve
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_lowerFactorUnitReserve
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalLowerFactorUnitReserve
```

Leitura: em vez de carregar a inequacao cleared inteira, dividimos pelo peso
positivo

```lean
(1 + ‖q s‖) * ‖q s‖ ^ 2
```

e o alvo passa a ser somente:

```lean
c2ContinuedVerticalAnchorResidualExactLowerFactorUpper s <
  c2ExactGapAnchorCanonicalLowerFactorClearedUnitReserve
    K M horizontalConstant horizontalScale horizontalRatio s
```

Essa forma e equivalente ao `anchorResidualCleared` no middle e ja liga direto
para collected budget, phase reserve e nao-anulacao.

Verificacao:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
lake build LeanC2.AuditGenuineMiddleExactGapFrontier
```

Resultado: ambos passaram; o build ainda mostra apenas warnings antigos de
linha longa em `LeanC2/AuditGenuineMiddle.lean`.

## Atualizacao 2026-07-05: prototype dyadic pressure atlas

Foi criada a primeira atlas concreta e refinavel para a rota de shares:

```lean
c2ExactGapAnchorCanonicalPressureSharePrototypeAtlas
```

Ela contem janelas dyadic com soma estritamente abaixo de `1`:

```text
(1/4, 1/4), (1/4, 3/8), (3/8, 1/4), (1/4, 1/2),
(1/2, 1/4), (3/8, 3/8), (1/4, 5/8), (5/8, 1/4),
(3/8, 1/2), (1/2, 3/8)
```

O maior consumo total e `7/8`, entao ainda fica reserva `1/8` nas janelas
mais apertadas. A obrigacao concreta agora e:

```lean
C2ExactGapAnchorCanonicalPrototypePressureShareAtlasCover
  horizontalConstant horizontalScale horizontalRatio near edge
```

Novos conectores:

```lean
C2ExactGapAnchorCanonicalPrototypePressureShareAtlasPointwiseCases
C2ExactGapAnchorCanonicalPrototypePressureShareAtlasCover_of_pointwiseCases
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypePressureShareAtlasCover
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypePressureShareAtlasCover
```

Leitura: esta etapa nao afirma que a atlas ja cobre o middle; ela transforma o
proximo alvo em uma obrigacao finita e localizada. Se alguma janela falhar, a
ideia e subdividir apenas esse setor por shares mais finas, preservando a
contabilidade exata e evitando envelopes grosseiros.

Forma mais conveniente do proximo alvo: provar, para cada ponto do middle, uma
das dez alternativas de
`C2ExactGapAnchorCanonicalPrototypePressureShareAtlasPointwiseCases`.

Verificacao:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
lake build LeanC2.AuditGenuineMiddleExactGapFrontier
rg -n "sorry|admit|axiom|unsafe|riemannZeta|ExactZeta|zetaUpper|zetaDepthCore|\bzeta\b" \
  LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

Resultado: Lean e build passaram; a varredura nao encontrou ocorrencias. O
build ainda mostra warnings antigos em modulos de base.

## Atualizacao 2026-07-05: ratio bounds da atlas prototype

O alvo da atlas foi refinado para razoes normalizadas pelo caixa exato:

```lean
c2ExactGapAnchorCanonicalClearedExternalPressureRatio
c2ExactGapAnchorCanonicalClearedLowerFactorPressureRatio
C2ExactGapAnchorCanonicalPressureShareIndexRatioBounds
```

Agora a forma mais fina para continuar e separar:

```lean
C2ExactGapAnchorCanonicalResidualMarginPositiveOnMiddle near edge

C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioBoundsCover
  horizontalConstant horizontalScale horizontalRatio near edge
```

O primeiro item prova `0 < clearedMargin`; o segundo so precisa provar, ponto a
ponto, que as duas pressoes normalizadas cabem em alguma janela dyadic da
atlas.

Conectores novos:

```lean
C2ExactGapAnchorCanonicalClearedMarginPositiveOnMiddle_of_residualMarginPositive
C2ExactGapAnchorCanonicalPressureShareIndexRatioBox_of_ratioBounds
C2ExactGapAnchorCanonicalPressureShareIndexRatioListCover_of_ratioBoundsListCover
C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioCover_of_residualMarginPositive
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypeResidualMarginRatioBoundsCover
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypeResidualRatioBoundsCover
```

Leitura: isso evita uma prova grosseira global. A margem residual fica como
denominador positivo comum; os debitos viram coordenadas locais de pressao
`D/Q` e `G/Q`. Se uma coordenada nao couber numa janela, refinamos so aquela
parte da atlas.

Verificacao:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
lake build LeanC2.AuditGenuineMiddleExactGapFrontier
rg -n "sorry|admit|axiom|unsafe|riemannZeta|ExactZeta|zetaUpper|zetaDepthCore|\bzeta\b" \
  LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

Resultado: Lean e build passaram; a varredura nao encontrou ocorrencias. O
build ainda mostra warnings antigos em modulos de base.

## Atualizacao 2026-07-05: certificado allowance/reserve da margem residual

A positividade da margem residual foi reduzida a um certificado mais fino:

```lean
C2ExactGapAnchorCanonicalAllowanceReserveBudgetOnMiddle near edge
```

isto e:

```lean
c2ExpandedQuartetResidualReserve s < c2AnalyticBulkAllowance s
```

Tambem foi criada a forma por share normalizada:

```lean
C2ExactGapAnchorCanonicalAnalyticAllowancePositiveOnMiddle near edge
C2ExactGapAnchorCanonicalResidualReserveShareLTOneOnMiddle near edge
```

com

```lean
c2ExactGapAnchorCanonicalResidualReserveShare s =
  c2ExpandedQuartetResidualReserve s / c2AnalyticBulkAllowance s
```

Conectores:

```lean
C2ExactGapAnchorCanonicalResidualMarginPositiveOnMiddle_of_allowanceReserveBudget
C2ExactGapAnchorCanonicalResidualMarginPositiveOnMiddle_of_reserveShareLTOne
C2ExactGapAnchorCanonicalPrototypeRatioCover_of_allowanceReserve
C2ExactGapAnchorCanonicalPrototypeRatioCover_of_reserveShare
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypeAllowanceReserve
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypeReserveShare
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypeAllowanceReserve
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypeReserveShare
```

Leitura: agora a frente tem dois blocos separados e finos:

```lean
-- bloco A: margem residual positiva
C2ExactGapAnchorCanonicalAllowanceReserveBudgetOnMiddle near edge
-- ou a versao normalizada por share abaixo de 1

-- bloco B: pressao dos custos no caixa cleared
C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioBoundsCover
  horizontalConstant horizontalScale horizontalRatio near edge
```

Verificacao:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

Resultado: passou sem warnings novos no arquivo da frente.

## Atualizacao 2026-07-05: ledger de envelopes cleared

O surplus cleared do lower factor foi quebrado em tres envelopes independentes:

```lean
C2ExactGapAnchorCanonicalClearedMarginLowerBoundOnMiddle
  marginLower near edge

C2ExactGapAnchorCanonicalClearedExternalDebitUpperBoundOnMiddle
  horizontalConstant horizontalScale horizontalRatio externalDebitUpper near edge

C2ExactGapAnchorCanonicalClearedLowerFactorCostUpperBoundOnMiddle
  lowerFactorCostUpper near edge

C2ExactGapAnchorCanonicalClearedEnvelopeLedgerOnMiddle
  marginLower externalDebitUpper lowerFactorCostUpper near edge
```

O ledger estrito e:

```lean
externalDebitUpper s + lowerFactorCostUpper s < marginLower s
```

Novos nomes principais:

```lean
c2ExactGapAnchorCanonicalClearedMargin
c2ExactGapAnchorCanonicalClearedExternalDebit
c2ExactGapAnchorCanonicalClearedLowerFactorCost
C2ExactGapAnchorCanonicalClearedMarginLowerBound
C2ExactGapAnchorCanonicalClearedExternalDebitUpperBound
C2ExactGapAnchorCanonicalClearedLowerFactorCostUpperBound
C2ExactGapAnchorCanonicalClearedEnvelopeLedger
c2ExactGapAnchorCanonicalLowerFactorClearedSurplus_eq_components
C2ExactGapAnchorCanonicalClearedSurplusPositive_of_envelopeLedger
C2ExactGapAnchorCanonicalLowerFactorClearedSurplusOnMiddle_of_envelopeLedger
C2ExactGapAnchorCanonicalCollectedOnMiddle_of_clearedEnvelopeLedger
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_clearedEnvelopeLedger
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalClearedEnvelopeLedger
```

Tambem existem envelopes exatos canonicos por `le_rfl` para os tres
componentes. A leitura pratica e que agora nao precisamos provar o surplus
inteiro de uma vez: basta escolher envelopes finos para margem, debito externo
cleared e custo do lower factor, e fechar a desigualdade estrita acima.

Verificacao feita:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
lake build LeanC2.AuditGenuineMiddleExactGapFrontier
```

Resultado: ambos passaram; o build ainda mostra warnings antigos em modulos de
base, principalmente linhas longas.

## Atualizacao 2026-07-05: cover finito por lista de shares

O atlas por janelas constantes foi especializado para uma lista finita:

```lean
C2ExactGapAnchorCanonicalPressureShareIndexListCover
  atlas horizontalConstant horizontalScale horizontalRatio near edge
```

Novos conectores:

```lean
C2ExactGapAnchorCanonicalMiddleFilterCover_of_pressureShareIndexListCover
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_pressureShareIndexListCover
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPressureShareIndexListCover
```

Leitura: este e o alvo operacional mais pratico agora. A proxima tentativa pode
escolher uma lista pequena `atlas` de janelas de share. Se a lista cobre o
middle, a cadeia fecha ate nao-anulacao. Se uma janela falhar, refinamos a lista
localmente sem alterar a contabilidade exata.

Verificacao feita neste bloco:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
lake build LeanC2.AuditGenuineMiddleExactGapFrontier
```

Resultado: ambos passaram; o build ainda mostra warnings antigos em modulos de
base, principalmente linhas longas.

## Atualizacao 2026-07-05: atlas por janelas constantes de share

Escolha concreta recomendada para a proxima etapa: usar um atlas de janelas de
share constantes. Cada indice e um par:

```lean
externalShare lowerFactorShare : ℝ
```

com:

```lean
0 ≤ externalShare
0 ≤ lowerFactorShare
externalShare + lowerFactorShare < 1
```

Novos nomes:

```lean
C2ExactGapAnchorCanonicalPressureShareIndex
c2ExactGapAnchorCanonicalPressureExternalShare
c2ExactGapAnchorCanonicalPressureLowerFactorShare
C2ExactGapAnchorCanonicalPressureShareIndexFilter
C2ExactGapAnchorCanonicalPressureShareBounds_of_indexFilter
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_pressureShareIndexCover
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPressureShareIndexCover
```

Leitura: esta e a melhor escolha operacional porque permite refinar o quanto
quisermos por shares, e tambem e amigavel a uma futura escolha dyadica ou
intervalar. O cover restante vira:

```lean
C2ExactGapAnchorCanonicalMiddleFilterCover
  (fun idx =>
    C2ExactGapAnchorCanonicalPressureShareIndexFilter
      K M horizontalConstant horizontalScale horizontalRatio idx)
  near edge
```

Ou seja: todo ponto do middle deve cair em alguma janela de share cuja soma de
pressao fica abaixo de `1`.

Verificacao feita neste bloco:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
lake build LeanC2.AuditGenuineMiddleExactGapFrontier
```

Resultado: ambos passaram; o build ainda mostra warnings antigos em modulos de
base, principalmente linhas longas.

## Atualizacao 2026-07-05: filtragem por shares de pressao

Escolha de filtragem adotada: **pressure-share filters**. Em vez de dividir o
middle por caixas geometricas grosseiras, cada filtro local mede quanto do
caixa exato

```lean
c2ExactGapAnchorCanonicalClearedMargin s
```

e consumido por:

```lean
c2ExactGapAnchorCanonicalClearedExternalDebit
  K M horizontalConstant horizontalScale horizontalRatio s

c2ExactGapAnchorCanonicalClearedLowerFactorCost s
```

Novos nomes:

```lean
C2ExactGapAnchorCanonicalPressureShareBounds
C2ExactGapAnchorCanonicalPressureShareBoundsOnFilter
C2ExactGapAnchorCanonicalMiddleFilterCover
C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerBudget_of_pressureShares
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_pressureFilterCover
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPressureFilterCover
```

A condicao local de cada filtro e:

```lean
0 < c2ExactGapAnchorCanonicalClearedMargin s
externalDebit s ≤ externalShare s * margin s
lowerFactorCost s ≤ lowerFactorShare s * margin s
externalShare s + lowerFactorShare s < 1
```

Leitura: essa e a filtragem mais refinada para o fechamento do caixa. Ela nao
fixa blocos grossos; permite escolher filtros pequenos e shares locais
adaptadas. Se os filtros cobrem o middle e cada um fecha a soma das shares
abaixo de `1`, o ledger exato fecha globalmente.

Verificacao feita neste bloco:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
lake build LeanC2.AuditGenuineMiddleExactGapFrontier
```

Resultado: ambos passaram; o build ainda mostra warnings antigos em modulos de
base, principalmente linhas longas.

## Atualizacao 2026-07-05: escolha no-loss dos envelopes

Escolhemos os envelopes mais finos disponiveis nesta camada: os exatos
canonicos.

```lean
marginLower        := c2ExpandedQuartetResidualMargin
externalDebitUpper :=
  c2ExactGapAnchorCanonicalExternalDebit
    K M horizontalConstant horizontalScale horizontalRatio
lowerFactorUpper   :=
  c2ContinuedVerticalAnchorResidualExactLowerFactorUpper
```

Isso virou o alvo:

```lean
C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Novos conectores:

```lean
C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerBudget_iff_surplus
C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerOnMiddle_iff_surplus
C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerOnMiddle_iff_anchorResidual
C2ExactGapAnchorCanonicalCollectedOnMiddle_of_exactWeightedEnvelopeLedger
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactWeightedEnvelopeLedger
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactWeightedEnvelopeLedger
```

Leitura: essa escolha nao usa folga artificial. Ela e equivalente ao surplus e
ao `anchorResidualCleared`, mas escrita na moeda fina do ledger ponderado:

```lean
D_exact s * (1 - ‖q s‖)
  + W s * G_exact s
  < Q_exact s * (1 - ‖q s‖)^2
```

O horizonte agora e produzir uma margem estrita real para essa desigualdade ou
substituir algum termo exato por um envelope demonstravelmente melhor em uma
sub-regiao, sem engrossar os custos.

Verificacao feita neste bloco:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
lake build LeanC2.AuditGenuineMiddleExactGapFrontier
```

Resultado: ambos passaram; o build ainda mostra warnings antigos em modulos de
base, principalmente linhas longas.

## Atualizacao 2026-07-05: ledger ponderado com envelopes crus

O ledger cleared foi refinado para uma forma mais natural de ataque, ainda na
mesma rota genuine/C2:

```lean
C2ExactGapAnchorCanonicalWeightedEnvelopeLedgerOnMiddle
  marginLower externalDebitUpper lowerFactorUpper near edge
```

Agora os envelopes sao escolhidos antes da limpeza:

```lean
C2ExactGapAnchorCanonicalMarginLowerBoundOnMiddle
  marginLower near edge

C2ExactGapAnchorCanonicalExternalDebitUpperBoundOnMiddle
  horizontalConstant horizontalScale horizontalRatio externalDebitUpper near edge

C2ExactGapAnchorCanonicalLowerFactorUpperBoundOnMiddle
  lowerFactorUpper near edge
```

e o ledger ponderado aplica os pesos exatos:

```lean
externalDebitUpper s * (1 - ‖q s‖)
  + c2ExactGapAnchorCanonicalLowerFactorClearedWeight s * lowerFactorUpper s
  < marginLower s * (1 - ‖q s‖) ^ 2
```

Novos conectores:

```lean
C2ExactGapAnchorCanonicalClearedMarginLowerBoundOnMiddle_of_marginLower
C2ExactGapAnchorCanonicalClearedExternalDebitUpperBoundOnMiddle_of_debitUpper
C2ExactGapAnchorCanonicalClearedLowerFactorCostUpperBoundOnMiddle_of_factorUpper
C2ExactGapAnchorCanonicalClearedEnvelopeLedgerOnMiddle_of_weightedLedger
C2ExactGapAnchorCanonicalLowerFactorClearedSurplusOnMiddle_of_weightedLedger
C2ExactGapAnchorCanonicalCollectedOnMiddle_of_weightedLedger
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_weightedLedger
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalWeightedLedger
```

Leitura: essa e a forma mais fina atual. Em vez de construir envelopes ja
cleared, basta controlar margem crua, debito externo cru e um upper para o
lower factor; os pesos canonicos sao aplicados automaticamente pelos lemas.

Verificacao feita neste bloco:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
lake build LeanC2.AuditGenuineMiddleExactGapFrontier
```

Resultado: ambos passaram; o build ainda mostra warnings antigos em modulos de
base, principalmente linhas longas.

## Atualizacao 2026-07-05: surplus cleared do lower factor

O alvo unitario foi convertido para uma forma de saldo positivo:

```lean
C2ExactGapAnchorCanonicalLowerFactorClearedSurplusPositiveOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Novos nomes:

```lean
c2ExactGapAnchorCanonicalLowerFactorClearedSurplus
C2ExactGapAnchorCanonicalLowerFactorClearedSurplusPositive
C2ExactGapAnchorCanonicalLowerFactorClearedSurplusPositiveOnMiddle
c2ExactGapAnchorCanonicalLowerFactorClearedSurplus_eq_expanded
C2ExactGapAnchorCanonicalLowerFactorClearedBudget_iff_surplus
C2ExactGapAnchorCanonicalLowerFactorClearedOnMiddle_iff_surplus
C2ExactGapAnchorCanonicalLowerFactorClearedUnitReserveBudget_iff_surplus
C2ExactGapAnchorCanonicalLowerFactorClearedUnitReserveOnMiddle_iff_surplus
C2ExactGapAnchorCanonicalLowerFactorClearedSurplusOnMiddle_iff_anchorResidual
C2ExactGapAnchorCanonicalCollectedOnMiddle_of_lowerFactorSurplus
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_lowerFactorSurplus
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalLowerFactorSurplus
```

Leitura: a proxima obrigacao fica sem divisao e sem comparacao de lados:

```lean
0 <
  c2ExactGapAnchorCanonicalLowerFactorClearedSurplus
    K M horizontalConstant horizontalScale horizontalRatio s
```

Expandido, esse surplus e a margem cleared menos o debito externo cleared e
menos o custo do exact lower factor. Se esse saldo for positivo no middle, a
cadeia ja fecha ate `genuineCentralDoubleSeries s ≠ 0`.

Verificacao:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
lake build LeanC2.AuditGenuineMiddleExactGapFrontier
```

Resultado: ambos passaram; o build ainda mostra apenas warnings antigos de
linha longa em `LeanC2/AuditGenuineMiddle.lean`.

## Atualizacao 2026-07-05: certificado allowance/reserve fechado

O certificado

```lean
C2ExactGapAnchorCanonicalAllowanceReserveBudgetOnMiddle near edge
```

foi fechado diretamente no middle, sem hipotese externa e sem uso de zeta. A
prova usa apenas a estimativa genuine/C2

```lean
‖q s‖ < (1 / 2 : ℝ)
```

no off-critical strip para pagar a reserva explicita

```lean
2 * ‖q s‖ ^ 6 / (1 - ‖q s‖ ^ 2)
```

pela allowance

```lean
‖q s‖ ^ 2 / (1 + ‖q s‖)
```

Novos nomes:

```lean
C2ExactGapAnchorCanonicalAllowanceReserveBudget_of_offCriticalStrip
C2ExactGapAnchorCanonicalAllowanceReserveBudgetOnMiddle_closed
C2ExactGapAnchorCanonicalResidualMarginPositiveOnMiddle_closed
C2ExactGapAnchorCanonicalClearedMarginPositiveOnMiddle_closed
C2ExactGapAnchorCanonicalPrototypeRatioCover_of_closedAllowanceReserve
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_closedPrototypeRatioBoundsCover
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypeClosedRatioBoundsCover
```

Leitura: a margem residual positiva nao e mais boleto aberto. O alvo restante
da frente atual e o cover das razoes de pressao pela atlas prototype:

```lean
C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioBoundsCover
  horizontalConstant horizontalScale horizontalRatio near edge
```

Com `hscale`, `hhorizontal` e esse cover, o wrapper fechado ja entrega
`genuineCentralDoubleSeries s ≠ 0`.

Verificacao feita:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
lake build LeanC2.AuditGenuineMiddleExactGapFrontier
rg -n "sorry|admit|axiom|unsafe|riemannZeta|ExactZeta|zetaUpper|zetaDepthCore|\bzeta\b" \
  LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

Resultado: Lean e build passaram. A varredura nao retornou matches. O build
ainda mostra warnings antigos em modulos de base, principalmente linhas longas.

## Atualizacao 2026-07-05: cover da atlas reduzido a bounds agregados

O cover que restava

```lean
C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioBoundsCover
  horizontalConstant horizontalScale horizontalRatio near edge
```

foi reduzido a um alvo escalar agregado:

```lean
C2ExactGapAnchorCanonicalPrototypePressureAggregateBoundsOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Esse alvo exige, ponto a ponto no middle:

```lean
externalPressureRatio ≤ 5 / 8
lowerFactorPressureRatio ≤ 5 / 8
externalPressureRatio + lowerFactorPressureRatio ≤ 3 / 4
```

Novos nomes:

```lean
C2ExactGapAnchorCanonicalPrototypePressureAggregateBounds
C2ExactGapAnchorCanonicalPrototypePressureAggregateBoundsOnMiddle
C2ExactGapAnchorCanonicalPrototypePressureAtlasRatioBounds_of_aggregateBounds
C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioBoundsCover_of_aggregateBounds
C2ExactGapAnchorCanonicalPrototypeRatioCover_of_aggregateBounds
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypeAggregateBounds
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypeAggregateBounds
```

Leitura: o cover disjuntivo da atlas nao precisa mais ser atacado diretamente.
Basta provar os tres bounds agregados acima. A reserva dyadic preservada nessa
redução e `1/8`, pois a soma de pressoes fica em `≤ 3/4`.

Verificacao feita:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
lake build LeanC2.AuditGenuineMiddleExactGapFrontier
rg -n "sorry|admit|axiom|unsafe|riemannZeta|ExactZeta|zetaUpper|zetaDepthCore|\bzeta\b" \
  LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

Resultado: Lean e build passaram. A varredura nao retornou matches. O build
ainda mostra warnings antigos em modulos de base, principalmente linhas longas.

## Atualizacao 2026-07-05: tres bounds reduzidos a um surplus reserve

Os tres bounds agregados de pressao foram refinados para evitar pagar com
hipoteses separadas e grosseiras:

```lean
externalPressureRatio ≤ 5 / 8
lowerFactorPressureRatio ≤ 5 / 8
externalPressureRatio + lowerFactorPressureRatio ≤ 3 / 4
```

A atlas prototype foi ampliada com duas janelas dyadic extremas:

```lean
c2ExactGapAnchorCanonicalPressureShareIndexEighthThreeQuarter
c2ExactGapAnchorCanonicalPressureShareIndexThreeQuarterEighth
```

Com isso, o cover da atlas agora tambem segue de um alvo total:

```lean
C2ExactGapAnchorCanonicalPrototypePressureTotalBoundsOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Esse alvo total foi reduzido a uma desigualdade sem divisao:

```lean
C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBoundOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

E, finalmente, a forma mais limpa para continuar virou o alvo de reserve:

```lean
C2ExactGapAnchorCanonicalPrototypePressureSurplusReserveBoundOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Leitura: nao precisamos mais provar os tres bounds normalizados diretamente.
Basta provar que, depois de pagar o custo externo e o custo lower-factor, ainda
sobra pelo menos `1 / 4` da margem exata limpa. Essa forma preserva a reserva
`1 / 8` da atlas e evita escolher bounds separados que possam engrossar o
orcamento.

Conectores fechados:

```lean
C2ExactGapAnchorCanonicalPrototypePressureSurplusReserveBound_of_clearedTotalBound
C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBound_iff_surplusReserve
C2ExactGapAnchorCanonicalPrototypePressureSurplusReserveBoundOnMiddle_of_clearedTotalBound
C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBoundOnMiddle_iff_surplusReserve
C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBound_of_surplusReserve
C2ExactGapAnchorCanonicalPrototypePressureTotalBounds_of_clearedTotalBound
C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioBoundsCover_of_totalBounds
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypeSurplusReserve
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypeSurplusReserve
```

Nota: `ClearedTotalBoundOnMiddle` e `SurplusReserveBoundOnMiddle` ficaram
equivalentes. O target de reserve e apenas a forma contabil mais legivel do
pagamento total `D + G ≤ 3 / 4 * Q`.

Verificacao feita:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
lake build LeanC2.AuditGenuineMiddleExactGapFrontier
rg -n "sorry|admit|axiom|unsafe|riemannZeta|ExactZeta|zetaUpper|zetaDepthCore|\bzeta\b" \
  LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

Resultado: Lean e build passaram. A varredura nao retornou matches.

## Atualizacao 2026-07-05: surplus reserve virou quarter unit reserve

O alvo equivalente de surplus reserve foi reescrito na linguagem da rota
antiga de lower-factor unit reserve. Novo alvo operacional:

```lean
C2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserveBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Ele diz que o exact lower factor cabe no unit reserve depois de reservar
explicitamente `1 / 4` da margem limpa:

```lean
c2ContinuedVerticalAnchorResidualExactLowerFactorUpper s ≤
  c2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserve
    K M horizontalConstant horizontalScale horizontalRatio s
```

Novos nomes:

```lean
c2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserve
C2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserveBudget
C2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserveBudgetOnMiddle
C2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserveBudget_iff_surplusReserve
C2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserveBudgetOnMiddle_iff_surplusReserve
C2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserveBudget_iff_clearedTotalBound
C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_iff_clearedTotalBound
C2ExactGapAnchorCanonicalLowerFactorClearedUnitReserveBudget_of_quarterUnitReserve
C2ExactGapAnchorCanonicalLowerFactorClearedUnitReserveBudgetOnMiddle_of_quarterUnitReserve
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_quarterUnitReserve
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalQuarterUnitReserve
```

Leitura: o unit reserve antigo ainda nao basta, porque ele so garante
positividade do surplus. O novo alvo e estritamente mais forte: ele implica o
unit reserve antigo, mas guarda a folga quantitativa `1 / 4` da margem limpa.
Tambem ficou provado que esse alvo e exatamente o mesmo que o pagamento
division-free `D + G ≤ 3 / 4 * Q`.

Verificacao feita:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

Resultado: passou sem saida.

## Estado mais recente 2026-07-06: alvo operacional atual

O alvo ativo mais refinado agora e:

```lean
C2ExactGapAnchorCanonicalPrototypePressureComponentSumBoundOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Ele abre a soma normalizada em cinco boletos:

```text
genuine central pressure
continued central pressure
horizontal pressure
cutoff pressure
lower-factor pressure
```

Ponte algébrica fechada:

```lean
c2ExactGapAnchorCanonicalClearedExternalPressureRatio_eq_componentSum
```

Wrappers finais disponiveis:

```lean
C2ExactGapAnchorCanonicalPrototypePressureSumBoundOnMiddle_of_componentSumBound
C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_componentSumBound
C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_of_componentSumBound
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypePressureComponentSumBound
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypePressureComponentSumBound
```

Proximo passo: escolher/provar bounds refinados para esses cinco boletos de
modo que a soma fique `≤ 3 / 4`, sem voltar para os bounds separados mais
grossos `totalBounds/aggregateBounds`.

## Estado mais recente 2026-07-06: continued por oddUpper

O segundo boleto foi refinado mais um passo: `continuedUpper` agora e herdado
de um upper do canal odd:

```lean
c2ContinuedCentralFromOddUpper oddUpper
C2ExactGapAnchorCanonicalCentralPairOddShareBudgetOnMiddle
```

Obrigacao nova:

```text
‖continuedOddDirichletChannel s‖ ≤ oddUpper s
```

com linha de caixa:

```text
genuineShareFromUpper
  + continuedShareFromUpper (c2ContinuedCentralFromOddUpper oddUpper)
  + horizontalPressure + cutoffPressure + lowerFactorPressure ≤ 3 / 4
```

Endpoints novos:

```lean
C2ExactGapAnchorCanonicalComponentSumBoundOnMiddle_of_centralPairOddShare
C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_centralPairOddShare
C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_of_centralPairOddShare
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_centralPairOddShare
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalCentralPairOddShare
```

Proximo alvo: encontrar/refinar `oddUpper` para o canal odd continued e
conferir o saldo antes de abrir horizontal/cutoff/lower-factor.

## Estado mais recente 2026-07-06: oddUpper exact fechado

O `oddUpper` foi provado pela forma no-loss:

```lean
c2ContinuedOddExactUpper
c2ContinuedOddChannelBound_exact
```

Nova superficie operacional:

```lean
C2ExactGapAnchorCanonicalCentralPairExactOddShareBudgetOnMiddle
```

Agora a linha de caixa restante e:

```text
genuineShareFromUpper
  + continuedShareFromUpper
      (c2ContinuedCentralFromOddUpper c2ContinuedOddExactUpper)
  + horizontalPressure + cutoffPressure + lowerFactorPressure ≤ 3 / 4
```

Endpoints novos:

```lean
C2ExactGapAnchorCanonicalComponentSumBoundOnMiddle_of_centralPairExactOdd
C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_centralPairExactOdd
C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_of_centralPairExactOdd
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_centralPairExactOdd
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalCentralPairExactOdd
```

Proximo alvo: testar/fechar essa linha de caixa exact-odd; se estourar,
buscar um upper estrutural menor para o canal odd continued.

## Estado mais recente 2026-07-06: soma exact-odd diagnosticada

O caixa foi limpo para a forma sem denominadores:

```lean
C2ExactGapAnchorCanonicalCentralPairExactOddClearedCashBudgetOnMiddle
```

Com `genuineUpper = c2GenuineCentralExactUpper`, a soma cabe exatamente quando
o custo extra do continued herdado do odd exact cabe no slack:

```lean
c2ExactGapAnchorCanonicalCentralPairExactOddContinuedClearedOvershoot
c2ExactGapAnchorCanonicalExactOddCashSlack
C2ExactGapAnchorCanonicalExactOddOvershootReserve_iff_slack
```

Fechamento condicional do boleto:

```lean
C2ExactGapAnchorCanonicalExactOddShareBudgetOnMiddle_of_overshoot
```

Resultado: a soma ainda nao esta paga automaticamente. Proximo alvo: provar
`C2ExactGapAnchorCanonicalCentralPairExactOddOvershootReserveBudgetOnMiddle`;
se o overshoot estourar o slack, migrar para a rota mais fina por `gapUpper`.

## Estado mais recente 2026-07-06: correcao de procedimento

A checagem numerica anterior veio de um canal externo ao objeto C2/genuine.
Pela regra Genuine-First, ela nao deve ser usada para decidir o horizonte
ativo do middle.

O ponto formal que permanece correto e que a forma atual paga dois uppers
centrais separados:

```text
‖genuineCentralDoubleSeries‖ + ‖continuedCentralOddChannel‖
```

O proximo avanco deve ser escolhido por uma justificativa genuine/C2 interna.
Nenhuma rota foi morta por essa checagem invalida. A superficie defect-aware
existe no Lean, mas so deve ser usada se a propria geometria C2 pedir isso.

```lean
positiveBoxCentralDefectExactUpper
PositiveBoxCentralDefectUpperBoundOnBox
PositiveBoxExactGapAnchorActiveDefectCandidateScalarBudgetResolventOnBox
```

## Estado mais recente 2026-07-06: laboratorio finito do ledger

Objeto Lean publico correto da frente atual:

```lean
C2.PeerReview.CollectedSlackMiddleObligation
C2.PeerReview.PrototypeClearedTotalMiddleObligation
C2.PeerReview.PrototypeSurplusReserveMiddleObligation
```

O operador formal que liga near-axis e middle e:

```lean
c2OddTailContinuedBalancingSeedBulkModel
```

Para medir a folga antes de tentar provar bounds no Lean, foi criado:

```text
operadores/c2_middle_genuine_ledger.py
```

Esse script e C2/genuine-first: usa `q`, `rectangularDirect`,
`rectangularBracket`, `rectangularGenuine` e a contabilidade limpa
`Q, D, G` da rota exact-gap. O script existente mais proximo era
`operadores/c2_genuine_operator_only_cpu.py`, mas ele e um scanner global do
operador, nao um medidor do livro-caixa do middle.

Modos de referencia disponiveis:

```text
--reference-mode raw
--reference-mode exponential
--reference-mode supergaussian --reference-X <X> --reference-p <p>
```

Os modos `exponential` e `supergaussian` seguem regularizacoes finitas C2 que
ja aparecem no Lean (`rectangularExponentialGenuine` e
`superGaussianFiniteGenuineRectangle`). Eles sao diagnosticos para estabilidade
numerica, nao substituem o alvo exato do Lean.

Comando de smoke test:

```bash
python3 operadores/c2_middle_genuine_ledger.py \
  --t-min 1 --t-max 5 --dt 1 \
  --ref-K 12 --ref-M 101 \
  --continued-ref-K 12 --continued-ref-M 101 \
  --check-ref-K 14 --check-ref-M 151 \
  --horizontal-ratio-mode qnorm \
  --horizontal-constant 0 \
  --csv audit_outputs/c2_middle_genuine_ledger_smoke.csv
```

Leitura do resultado: `direct - bracket` bate com a forma fatorada do Lean
ate erro numerico de ordem `1e-16`. A coluna `ref_delta` ainda saiu grande nas
amostras pequenas, inclusive em modo supergaussiano com cortes baixos. Entao o
proximo passo numerico e estudar estabilidade das referencias C2 finitas em
`K/M/X/p` antes de levar qualquer bound para o Lean.

## Estado mais recente 2026-07-06: cortes escolhidos

Foi criado o varredor paralelo:

```text
operadores/c2_middle_reference_stability_sweep.py
```

Rodada principal em `sigma=1/2`, `t=[1,50]`, `dt=0.25`, usando 56 threads:

```bash
python3 operadores/c2_middle_reference_stability_sweep.py \
  --t-min 1 --t-max 50 --dt 0.25 \
  --levels 12:4001,13:6001,14:8001,15:10001,16:12001,17:16001,18:24001 \
  --modes supergaussian --x-list 10661 --p-list 2 \
  --threads 56 \
  --csv audit_outputs/c2_middle_stability_super_p2_x10661_refined_dt025.csv
```

Resultado:

```text
K=14, M=8001  passa por pouco:
  max_ref_delta ~= 6.976e-05
  max_total_delta ~= 9.211e-03

K=15, M=10001 recomendado:
  max_ref_delta ~= 3.228e-07
  max_total_delta ~= 4.250e-05

K=16, M=12001 alta confianca:
  max_ref_delta ~= 5.087e-10
  max_total_delta ~= 6.740e-08
```

Escolha operacional:

```text
referencia padrao conservadora:
  --reference-mode supergaussian --reference-X 10661 --reference-p 2
  --ref-K 15 --ref-M 10001

referencia de alta confianca:
  --reference-mode supergaussian --reference-X 10661 --reference-p 2
  --ref-K 16 --ref-M 12001
```

O modo `raw` foi testado e nao estabilizou:

```text
audit_outputs/c2_middle_stability_raw_dt025.csv
```

Comparativo com outras escalas/potencias:

```text
audit_outputs/c2_middle_stability_modes_x_p_dt025.csv
```

Existem cortes menores com regularizacao mais agressiva, como
`supergaussian X=5000 p=4 K=11 M=3001`, mas eles sao menos fieis ao operador
por causa da escala menor/cutoff mais forte. Devem ficar como diagnostico
auxiliar, nao como padrao principal.

CSVs detalhados do ledger:

```text
audit_outputs/c2_middle_ledger_recommended_super_p2_x10661_K15_M10001.csv
audit_outputs/c2_middle_ledger_high_conf_super_p2_x10661_K16_M12001.csv
```

Observacao: com esses cortes estaveis, a versao numerica que paga os uppers
centrais separados ainda fica muito acima de `3/4`. Isso nao mata a rota; indica
que o proximo alvo deve ser uma conta central/lower-factor mais fina, agora com
referencias numericas confiaveis para orientar os bounds.

## Refinamento do upper: cutoff resolvido, anchor nao fecha

Foi acrescentada ao avaliador uma conta defect/anchor:

```text
defect_anchor_ratio =
  (continued_anchor_abs + defect_upper) / anchor_allowance
```

E um modo para alinhar o alvo finito com a referencia:

```text
--target-reference-mode supergaussian
```

Com alvo cru versus referencia supergaussiana, o cutoff era o principal estouro
artificial. Com alvo e referencia ambos supergaussianos (`X=10661`, `p=2`), o
cutoff caiu para `~1.8e-8`.

CSV:

```text
audit_outputs/c2_middle_ledger_high_conf_super_p2_x10661_K16_M12001_target_super_ref17_defect_refined.csv
```

Mesmo assim:

```text
worst_defect_anchor_ratio ~= 143.44
anchor_allowance ~= 0.0419733
continued_anchor_abs ~= 6.02068 em t=1
```

Varredura de `X,p`:

```text
melhor caso fiel testado: X=2500, p=1 -> max_ratio ~= 49.46
caso artificial pequeno: X=10, p=1 -> max_ratio ~= 2.58
```

Conclusao: escolher cortes maiores/refinar o cutoff nao basta. O gargalo real
e o anchor/lower-factor. A frente recomendada agora e a rota do quarteto
ajustado/margem oscilatoria, evitando insistir no ledger exact-gap que paga esse
anchor caro.

No Lean, `PeerReview.lean` agora expoe os nomes publicos canônicos
`CanonicalMiddleObligation` e `ContinuationTerminalCertificate`; o arquivo
compilou com `lake env lean LeanC2/PeerReview.lean`.
