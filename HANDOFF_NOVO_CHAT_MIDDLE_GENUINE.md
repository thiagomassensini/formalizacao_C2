# Handoff para novo chat: Middle Genuine / PositiveBox OddRef Phase

Data do handoff: 2026-07-05.

## Instrucao para o novo chat

Leia este arquivo primeiro:

```text
HANDOFF_NOVO_CHAT_MIDDLE_GENUINE.md
```

Depois leia, nesta ordem:

```text
ORIENTACAO_MIDDLE_GENUINE.md
LeanC2/AuditContinuedQuartetPositiveBoxOddRefPhase.lean
```

Observacao: o `AGENTS.md` antigo foi removido do workspace e nao deve mais ser
usado como orientacao ativa para esta rota.

Regra principal: manter a rota **Genuine-First**. Nao usar `riemannZeta`,
`zeta`, `ExactZeta`, `zetaUpper` ou `zetaDepthCore` como input analitico,
estimativa ou atalho na middle route. Zeta so entra como camada terminal,
historica ou auditoria/diagnostico.

## Estado atual

A rota direta canonical middle antiga nao e o alvo certo agora, porque ha
barreiras formais contra a versao fechada/canonica atual. O foco foi deslocado
para a rota exact-gap / phase-aware:

```lean
C2ExactGapAnchorPhaseDisk
C2ExactGapAnchorPhaseSaving
C2ExactGapAnchorGapUpperScalarBudget
C2ExactGapAnchorFactorAllowanceLowerScalarBudget
```

Decisao tomada: a moeda principal deve ser a allowance global do exact-gap
anchor, nao a margem local `positiveBox`.

Motivo: a margem local

```lean
c2ExpandedQuartetSectorResidualMargin positiveBoxSectorLower s
```

paga um ledger setorial do quartet prefix. Ela nao paga diretamente o budget:

```lean
verticalDepthTailUpper s * gapUpper s +
  c2GenuineCentralExactUpper s +
  c2ContinuedCentralExactUpper s
```

Por isso, `positiveBox` fica como laboratorio local para produzir bounds de
fase, mas o pagamento final usa `allowanceLower` global.

## Arquivos principais criados/alterados nesta sessao

### Novo shim Lean

```text
LeanC2/AuditContinuedQuartetPositiveBoxOddRefPhase.lean
```

Este arquivo esta `untracked` no git no momento do handoff.

Ele cria uma interface audit-only para fase do odd reference abstrato:

```lean
PositiveBoxOddRefHalfDiskBound
PositiveBoxOddRefGapBound
positiveBoxOddRefGapUpperFromHalfDisk
PositiveBoxOddRefPhasePayment
PositiveBoxOddRefPhaseData
PositiveBoxOddRefGapBound.of_halfDiskBound
PositiveBoxOddRefPhaseData.gap_lt_allowance
```

Tambem conecta essa interface ao spine global exact-gap:

```lean
PositiveBoxOddRefFactorUpperLowerBudgetOnBox
PositiveBoxOddRefPhaseData.to_gapBound
PositiveBoxOddRefPhaseData.to_factorUpperLowerBudgetOnBox
```

Depois foi adicionada a versao local na `positiveBox`, usando allowance global:

```lean
positiveBox_offCriticalStrip

PositiveBoxOddRefContinuedCompatibility
PositiveBoxContinuedOddGapBoundOnBox
PositiveBoxOddRefGapBound.to_continuedOnBox

PositiveBoxExactGapAnchorFactorAllowanceLowerScalarBudgetOnBox
PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox
PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_allowanceLower
```

Por fim foi criada a certificacao da `allowanceLower` por componentes:

```lean
PositiveBoxAllowanceLowerNonnegOnBox
PositiveBoxVerticalDepthTailUpperBoundOnBox
PositiveBoxExactCentralUpperBoundOnBox
PositiveBoxExactVerticalAnchorAllowanceLowerBoundOnBox
PositiveBoxAllowanceLowerComponentPaymentOnBox
PositiveBoxExactGapAnchorAllowanceLowerComponentData
PositiveBoxExactGapAnchorAllowanceLowerComponentData.to_scalarBudgetOnBox
```

O resultado principal local e:

```lean
PositiveBoxOddRefPhaseData oddRef halfDiskUpper allowanceLower
→
PositiveBoxExactGapAnchorFactorAllowanceLowerScalarBudgetOnBox
    K M horizontalConstant horizontalScale horizontalRatio allowanceLower
→
PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox
    K M horizontalConstant horizontalScale horizontalRatio
    (positiveBoxOddRefGapUpperFromHalfDisk halfDiskUpper)
```

### Caderno de orientacao

```text
ORIENTACAO_MIDDLE_GENUINE.md
```

Este arquivo tambem esta `untracked` no git no momento do handoff. Ele contem o
log da orientacao, decisoes e proximos passos.

Atualizacao da retomada: registra que o primeiro campo concreto da allowance
por componentes, o upper constante de `verticalDepthTailUpper`, ja foi fechado.

### Livro-caixa anterior

```text
modelo_livro_caixa_middle.md
```

Tambem esta `untracked`. Ele registra ledger/quartet bookkeeping anterior, mas
deve ser lido com cuidado: a rota atual foi refinada depois da descoberta das
barreiras formais da canonical closed/scaled local data.

## Verificacoes Lean ja passadas

Comandos que passaram sem saida:

```bash
lake env lean LeanC2/PeerReview.lean
lake env lean LeanC2/AuditGenuineMiddle.lean
lake env lean LeanC2/AuditContinuedQuartetDominance.lean
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxContinuedOdd.lean
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxGenuineOddBridge.lean
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxOddRefPhase.lean
lake build LeanC2.AuditContinuedQuartetPositiveBoxCutoff
```

Tambem foi feita varredura no shim novo:

```bash
rg -n "sorry|admit|axiom|unsafe" LeanC2/AuditContinuedQuartetPositiveBoxOddRefPhase.lean
```

Sem matches.

Varredura posterior feita tambem nos shims ativos:

```bash
rg -n "sorry|admit|axiom|unsafe|riemannZeta|ExactZeta|zetaUpper|zetaDepthCore|\bzeta\b" \
  LeanC2/AuditContinuedQuartetPositiveBoxCutoff.lean \
  LeanC2/AuditContinuedQuartetPositiveBoxOddRefPhase.lean
```

Resultado: sem matches.

## Atualizacao 2026-07-05: escolha do `allowanceLower`

Escolha feita: usar a reserva fatorada como lower da allowance:

```lean
c2ExactGapAnchorExactGapExpandedUpperFactorReserveLower externalDebitUpper
```

Novos nomes compilados em:

```text
LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

```lean
C2ExactGapAnchorFactorAllowanceLowerScalarBudget_of_factorReserveLower
C2ExactGapAnchorFactorAllowanceLowerScalarBudgetOnMiddle_of_factorReserveLower
C2ExactGapAnchorFactorUpperLowerBudgetOnMiddle_of_externalFactorBudget
C2ExactGapAnchorCanonicalUpperLowerMiddleData.of_scaleData_factorReserveLower
```

O construtor final consome:

```lean
C2ExactGapAnchorExactGapExpandedUpperExternalDebitUpperBoundOnMiddle
  c2GenuineCentralExactUpper c2ContinuedCentralExactUpper
  (c2HorizontalRegularizedUpper horizontalConstant horizontalScale horizontalRatio)
  (c2RawCentralCutoffNormConstant K M)
  externalDebitUpper near edge

C2ExactGapAnchorExactGapExpandedUpperExternalFactorBudgetOnMiddle
  externalDebitUpper near edge
```

Leitura operacional: `externalDebitUpper` deve pagar os debitos externos
central/horizontal/cutoff. Depois resta fechar a desigualdade de fase fatorada
sem divisao:

```lean
((1 + ‖q s‖) * verticalDepthTailUpper s) *
    c2ContinuedVerticalAnchorResidualExactFactorUpper s +
  externalDebitUpper s <
    c2ExpandedQuartetResidualMargin s * (1 - ‖q s‖)
```

Nao seguir como frente principal pela familia `tailLowerDistorted/oddMetric`;
ela tem uma barreira formal para a forma cleared com slack nao-negativo.

## Atualizacao 2026-07-05: debito externo mais fino

Refinamento feito no mesmo shim:

```text
LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

Foi especializado:

```lean
externalDebitUpper :=
  c2ExactGapAnchorCanonicalExternalDebit
    K M horizontalConstant horizontalScale horizontalRatio
```

Esse e o debito externo canonico exato:

```lean
c2ExactGapAnchorExactGapExpandedUpperExternalDebit
  c2GenuineCentralExactUpper c2ContinuedCentralExactUpper
  (c2HorizontalRegularizedUpper horizontalConstant horizontalScale horizontalRatio)
  (c2RawCentralCutoffNormConstant K M)
```

Novos nomes:

```lean
c2ExactGapAnchorCanonicalExternalDebit
C2ExactGapAnchorExactGapExpandedUpperExternalDebitUpperBoundOnMiddle_canonical
C2ExactGapAnchorCanonicalUpperLowerMiddleData.of_scaleData_canonicalExternalDebit
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExternalFactorBudget
```

O alvo remanescente mais fino e:

```lean
C2ExactGapAnchorExactGapExpandedUpperExternalFactorBudgetOnMiddle
  (c2ExactGapAnchorCanonicalExternalDebit
    K M horizontalConstant horizontalScale horizontalRatio)
  near edge
```

Expandido:

```lean
((1 + ‖q s‖) * verticalDepthTailUpper s) *
    c2ContinuedVerticalAnchorResidualExactFactorUpper s +
  c2ExactGapAnchorCanonicalExternalDebit
    K M horizontalConstant horizontalScale horizontalRatio s <
    c2ExpandedQuartetResidualMargin s * (1 - ‖q s‖)
```

Essa e a frente mais fina no momento: sem component upper, sem debito externo
grosseiro e sem slack artificial.

## Atualizacao 2026-07-05: budget canonico nomeado

O alvo mais fino foi nomeado no shim:

```lean
C2ExactGapAnchorCanonicalExternalFactorBudget
C2ExactGapAnchorCanonicalExternalFactorBudgetOnMiddle
```

Equivalencias para abrir a desigualdade escalar:

```lean
C2ExactGapAnchorCanonicalExternalFactorBudget_iff_explicit
C2ExactGapAnchorCanonicalExternalFactorBudgetOnMiddle_iff_explicit
```

Construtor e wrapper finais agora consomem esse alvo nomeado:

```lean
C2ExactGapAnchorCanonicalUpperLowerMiddleData.of_scaleData_canonicalExternalFactorBudget
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExternalFactorBudget
```

Proximo alvo oficial:

```lean
C2ExactGapAnchorCanonicalExternalFactorBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Forma expandida:

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

## Atualizacao 2026-07-05: reserva canonica de fase

O alvo foi reescrito como reserva:

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

Ele diz:

```lean
c2ExactGapAnchorCanonicalPhaseDebit s <
  c2ExactGapAnchorCanonicalPhaseReserve
    K M horizontalConstant horizontalScale horizontalRatio s
```

Proximo passo recomendado: primeiro nomear/provar positividade da reserva no
middle; depois atacar o phase debit/fator residual contra essa reserva.

## Atualizacao 2026-07-05: upper fino do phase debit

O modulo `LeanC2/AuditGenuineMiddleExactGapFrontier.lean` agora tambem tem uma
ponte fina para fechar a reserva por um upper apenas do debito de fase:

```lean
C2ExactGapAnchorCanonicalPhaseDebitUpperBound
C2ExactGapAnchorCanonicalPhaseDebitUpperBoundOnMiddle
C2ExactGapAnchorCanonicalPhaseDebitUpperReserveBudget
C2ExactGapAnchorCanonicalPhaseDebitUpperReserveBudgetOnMiddle
```

Ponte principal:

```lean
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_phaseDebitUpperReserveBudgetOnMiddle
```

Wrapper direto para nao-nulidade:

```lean
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPhaseDebitUpperReserveBudget
```

Fatos auxiliares de positividade:

```lean
c2ExactGapAnchorCanonicalPhaseDebit_nonneg_of_offCriticalStrip
c2ExactGapAnchorCanonicalPhaseReserve_pos_of_phaseReserveBudget
c2ExactGapAnchorCanonicalPhaseReserve_pos_onMiddle_of_phaseReserveBudgetOnMiddle
```

Alvo operacional novo:

```lean
C2ExactGapAnchorCanonicalPhaseDebitUpperBoundOnMiddle
  phaseDebitUpper near edge

C2ExactGapAnchorCanonicalPhaseDebitUpperReserveBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio phaseDebitUpper near edge
```

Leitura: escolher um `phaseDebitUpper` fino, provar que domina exatamente o
`c2ExactGapAnchorCanonicalPhaseDebit`, e provar que esse upper cabe na reserva
canonica. Nao voltar para `externalDebitUpper` arbitrario nesta frente.

Mais operacional ainda: foi criada a ponte por upper do fator normalizado:

```lean
C2ExactGapAnchorCanonicalFactorUpperReserveBudget
C2ExactGapAnchorCanonicalFactorUpperReserveBudgetOnMiddle
C2ExactGapAnchorCanonicalPhaseDebitUpperBoundOnMiddle_of_exactFactorUpperBoundOnMiddle
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_factorUpperReserve
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalFactorUpperReserveBudget
```

Alvo recomendado para seguir:

```lean
C2ExactGapAnchorExactFactorUpperBoundOnMiddle factorUpper near edge

C2ExactGapAnchorCanonicalFactorUpperReserveBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio factorUpper near edge
```

Esse alvo preserva o debito externo canonico e concentra o trabalho novo em um
upper fino para o fator residual.

## Atualizacao 2026-07-05: superficie odd-gap/half-disk

Foi adicionada uma ponte direta da reserva canonica para um upper do gap impar:

```lean
C2ExactGapAnchorCanonicalOddGapReserveBudget
C2ExactGapAnchorCanonicalOddGapReserveBudgetOnMiddle
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_oddGapReserve
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalOddGapReserveBudget
```

Alvo operacional recomendado:

```lean
C2ContinuedOddGapBoundOnMiddle gapUpper near edge

C2ExactGapAnchorCanonicalOddGapReserveBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio gapUpper near edge
```

Tambem foi adicionada a especializacao half-disk:

```lean
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_halfDiskReserve
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalHalfDiskReserve
```

Alvo half-disk correspondente:

```lean
C2ContinuedOddHalfDiskBoundOnMiddle halfDiskUpper near edge

C2ExactGapAnchorCanonicalOddGapReserveBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio
  (c2ContinuedOddGapUpperFromHalfDisk halfDiskUpper) near edge
```

Este e o horizonte mais fino atual: controlar diretamente
`‖1 - 2 * continuedOddDirichletChannel s‖` ou, equivalentemente, uma regiao
half-disk em torno de `1/2`.

## Atualizacao 2026-07-05: reserva unitaria do odd-gap

A frente `oddGap` agora tem uma forma sem pagamento ponderado:

```lean
c2ExactGapAnchorCanonicalOddGapWeight
c2ExactGapAnchorCanonicalOddGapUnitReserve
C2ExactGapAnchorCanonicalOddGapUnitReserveBudget
C2ExactGapAnchorCanonicalOddGapUnitReserveBudgetOnMiddle
```

Equivalencia:

```lean
C2ExactGapAnchorCanonicalOddGapReserveBudgetOnMiddle_iff_unitReserveBudgetOnMiddle
```

Wrappers diretos:

```lean
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_oddGapUnitReserve
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_halfDiskUnitReserve
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalOddGapUnitReserve
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalHalfDiskUnitReserve
```

Alvo recomendado para continuar:

```lean
C2ContinuedOddGapBoundOnMiddle gapUpper near edge

C2ExactGapAnchorCanonicalOddGapUnitReserveBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio gapUpper near edge
```

Leitura: escolher/provar um `gapUpper` fino e comparar diretamente com a
reserva unitaria disponivel para o gap, sem reabrir debito externo.

## Atualizacao 2026-07-05: reserva de raio half-disk

Foi adicionada uma reserva especifica para o raio da half-disk:

```lean
c2ExactGapAnchorCanonicalHalfDiskUnitReserve
C2ExactGapAnchorCanonicalHalfDiskUnitReserveBudget
C2ExactGapAnchorCanonicalHalfDiskUnitReserveBudgetOnMiddle
```

Equivalencia com a forma odd-gap unitaria:

```lean
C2ExactGapAnchorCanonicalOddGapUnitOnMiddle_iff_halfDiskRadiusOnMiddle
```

Wrapper direto:

```lean
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_halfDiskRadiusReserve
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalHalfDiskRadiusReserve
```

Alvo recomendado se seguirmos via half-disk:

```lean
C2ContinuedOddHalfDiskBoundOnMiddle halfDiskUpper near edge

C2ExactGapAnchorCanonicalHalfDiskUnitReserveBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio halfDiskUpper near edge
```

Leitura: provar que o canal impar continuado fica dentro do raio
`halfDiskUpper` ao redor de `1/2`, e que esse raio e menor que a reserva
canonica disponivel para half-disk.

## Atualizacao 2026-07-05: raio half-disk exato

O alvo half-disk foi comprimido para a forma sem upper artificial:

```lean
c2ContinuedOddExactHalfDiskUpper
C2ContinuedOddHalfDiskBoundOnMiddle_exactHalfDiskUpper
C2ExactGapAnchorCanonicalExactHalfDiskRadiusBudgetOnMiddle
```

Ponte e wrapper:

```lean
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskRadius
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactHalfDiskRadius
```

Alvo recomendado agora:

```lean
C2ExactGapAnchorCanonicalExactHalfDiskRadiusBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Leitura expandida:

```lean
‖(1 / 2 : ℂ) - continuedOddDirichletChannel s‖ <
  c2ExactGapAnchorCanonicalHalfDiskUnitReserve
    K M horizontalConstant horizontalScale horizontalRatio s
```

Status: rota viva/promissora e mais fina. O trabalho matematico restante e
provar diretamente esse raio exato contra a reserva canonica, sem escolher um
`halfDiskUpper` intermediario.

## Atualizacao 2026-07-05: budget expanded do raio exato

Foi aberta a forma sem divisoes do alvo half-disk exato:

```lean
C2ExactGapAnchorCanonicalExactHalfDiskClearedBudgetOnMiddle
C2ExactGapAnchorCanonicalExactHalfDiskExpandedBudgetOnMiddle
```

Pontes:

```lean
C2ExactGapAnchorCanonicalExactHalfDiskRadiusOnMiddle_iff_cleared
C2ExactGapAnchorCanonicalExactHalfDiskClearedOnMiddle_iff_expanded
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskExpanded
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactHalfDiskExpanded
```

Alvo recomendado agora:

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

Status: rota viva/promissora e ainda mais operacional. O proximo alvo real e
provar esse budget escalar no middle, de preferencia por uma estimativa
phase-aware/cancellation-aware do raio half-disk exato.

## Atualizacao 2026-07-05: split payment/reserve

Foi adicionada uma interface de fechamento por upper/lower para o budget
expanded:

```lean
c2ExactGapAnchorCanonicalExactHalfDiskPayment
c2ExactGapAnchorCanonicalExactHalfDiskReserve
C2ExactGapAnchorCanonicalExactHalfDiskPaymentUpperBoundOnMiddle
C2ExactGapAnchorCanonicalExactHalfDiskReserveLowerBoundOnMiddle
C2ExactGapAnchorCanonicalExactHalfDiskPaymentReserveBudgetOnMiddle
```

Pontes:

```lean
C2ExactGapAnchorCanonicalExactHalfDiskExpandedBudgetOnMiddle_of_upperLower
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskUpperLower
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactHalfDiskUpperLower
```

Alvo recomendado agora:

```lean
C2ExactGapAnchorCanonicalExactHalfDiskPaymentUpperBoundOnMiddle
  paymentUpper near edge

C2ExactGapAnchorCanonicalExactHalfDiskReserveLowerBoundOnMiddle
  horizontalConstant horizontalScale horizontalRatio reserveLower near edge

C2ExactGapAnchorCanonicalExactHalfDiskPaymentReserveBudgetOnMiddle
  paymentUpper reserveLower near edge
```

Status: rota viva/promissora. A prova matematica pode agora separar o problema:
upper phase-aware para o pagamento do raio, lower para a reserva, e uma
desigualdade escalar final `paymentUpper < reserveLower`.

## Atualizacao 2026-07-05: halfDisk + margem + debito

A interface foi refinada para os tres insumos praticos:

```lean
C2ContinuedOddHalfDiskBoundOnMiddle halfDiskUpper near edge
C2ExactGapAnchorCanonicalMarginLowerBoundOnMiddle marginLower near edge
C2ExactGapAnchorCanonicalExternalDebitUpperBoundOnMiddle
  horizontalConstant horizontalScale horizontalRatio externalDebitUpper near edge
```

Eles geram:

```lean
c2ExactGapAnchorCanonicalHalfDiskPaymentUpper halfDiskUpper
c2ExactGapAnchorCanonicalReserveLowerFromMarginDebit
  marginLower externalDebitUpper
```

Ponte terminal:

```lean
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_halfDiskMarginDebit
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalHalfDiskMarginDebit
```

Alvo recomendado agora:

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

Status: rota viva/promissora. Agora o saldo final e uma desigualdade entre o
pagamento do raio e a reserva `marginLower * (1 - ‖q‖) - externalDebitUpper`.

## Conceitos importantes

### OddRef abstrato

O arquivo `AuditContinuedQuartetPositiveBoxGenuineOdd.lean` define:

```lean
GenuineOddContinuationData
PositiveBoxOddRefTruncationData
PositiveBoxOddRefAuditCertificate
```

Essa e a melhor superficie Genuine-First: a prova local fala de um `oddRef`
abstrato. A compatibilidade com o canal continuado fica separada:

```lean
PositiveBoxOddRefContinuedCompatibility
```

Nao usar a definicao zeta-escrita de `continuedOddDirichletChannel` como
estimativa de fase.

Atualizacao: o truncamento genuine/`oddRef` agora pode ser transportado para o
pacote de truncamento continuado e depois para o cutoff depth/core:

```lean
PositiveBoxContinuedOddTruncationData.of_oddRefTruncation
PositiveBoxCutoffUpperData.of_oddRefTruncation_explicitDepthCoreScalarBudget
PositiveBoxCutoffUpperData.of_oddRefTruncation_explicitDepthCoreExactOddScalarBudget
```

Wrappers finais adicionados para consumir essa ponte no alvo defect-aware com
cutoff continuado:

```lean
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectContinuedCutoffScalarBudget_ofOddTruncation_oddRefDepthCore
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectContinuedCutoffScalarBudget_ofOddTruncation_oddRefExactOddDepthCore
```

Atualizacao adicional: a rota tambem foi empacotada sobre:

```lean
PositiveBoxOddRefBridgeBounds data
```

Novos nomes:

```lean
PositiveBoxCutoffUpperData.of_oddRefBridgeBounds_explicitDepthCoreScalarBudget
PositiveBoxCutoffUpperData.of_oddRefBridgeBounds_explicitDepthCoreExactOddScalarBudget
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectBridgeBoundsDepthCore
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectBridgeBoundsExactOddDepthCore
```

Esses wrappers finais ainda recebem `PositiveBoxHorizontalUpperData`
separadamente. Nao confundir:

```lean
PositiveBoxOddTruncationData
```

e o pacote horizontal ativo contra `oddDirichletChannel`, enquanto

```lean
PositiveBoxOddRefTruncationData data.oddRef
```

entra no cutoff depth/core via `PositiveBoxOddRefBridgeBounds`.

Fronteira atual compilavel:

```lean
PositiveBoxActiveExactDefectBridgeBoundsDepthCoreFrontier
PositiveBoxActiveExactDefectBridgeBoundsDepthCoreFrontier.to_verticalResidualDominance

PositiveBoxActiveExactDefectBridgeBoundsExactOddFrontier
PositiveBoxActiveExactDefectBridgeBoundsExactOddFrontier.to_verticalResidualDominance
```

Essa e a melhor lista curta do que ainda precisa ser fornecido para fechar o
alvo local defect-aware.

Atalho novo para o campo horizontal:

```lean
PositiveBoxActiveExactDefectBridgeBoundsDepthCoreFrontier.ofOddTruncation
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectBridgeBoundsDepthCore_ofOddTruncation

PositiveBoxActiveExactDefectBridgeBoundsExactOddFrontier.ofOddTruncation
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectBridgeBoundsExactOddDepthCore_ofOddTruncation
```

Ou seja, `PositiveBoxOddTruncationData` ja preenche `PositiveBoxHorizontalUpperData`
nessa fronteira.

Tambem ha versoes diretas para `PositiveBoxRawOddTruncationData`:

```lean
PositiveBoxActiveExactDefectBridgeBoundsDepthCoreFrontier.ofRawOddTruncation
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectBridgeBoundsDepthCore_ofRawOddTruncation

PositiveBoxActiveExactDefectBridgeBoundsExactOddFrontier.ofRawOddTruncation
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectBridgeBoundsExactOddDepthCore_ofRawOddTruncation
```

Assim, para produzir `PositiveBoxCutoffUpperData` pela rota nova, basta:

```lean
PositiveBoxOddRefContinuedCompatibility oddRef
PositiveBoxOddRefTruncationData oddRef
PositiveBoxCutoffExplicitDepthCoreScalarBudgetOnBox continuedOddUpper
```

mais o bound escolhido para `continuedOddUpper`.

### PositiveBox

Subcaixa atual:

```lean
positiveBoxSigmaMin = 21 / 25
positiveBoxSigmaMax = 43 / 50
positiveBoxTMin     = 1641 / 50
positiveBoxTMax     = 1643 / 50
positiveBoxN        = 50
positiveBoxK        = 3
positiveBoxM        = 50
```

Ja foi provado no shim:

```lean
positiveBox_offCriticalStrip
```

### Allowance global

A certificacao local consome:

```lean
PositiveBoxExactGapAnchorFactorAllowanceLowerScalarBudgetOnBox
```

que e a versao `positiveBox` de:

```lean
GenuineMiddleAudit.C2ExactGapAnchorFactorAllowanceLowerScalarBudget
```

Forma escalar:

```lean
allowanceLower s * verticalDepthTailUpper s +
  c2GenuineCentralExactUpper s +
  c2ContinuedCentralExactUpper s ≤
    GenuineMiddleAudit.c2ExactVerticalAnchorResidualNormAllowance
      K M horizontalConstant horizontalScale horizontalRatio s
```

## Proximo passo recomendado

Escolher candidatos concretos para:

```lean
allowanceLower
verticalTailUpper
centralUpper
anchorAllowanceLower
```

e fechar primeiro os campos mais baratos da estrutura:

```lean
PositiveBoxExactGapAnchorAllowanceLowerComponentData
```

Ordem recomendada:

1. Fechado: `PositiveBoxVerticalDepthTailUpperBoundOnBox` usando apenas bounds
   de `q` na positiveBox.
2. Fechado: candidato constante `positiveBoxAllowanceLowerCandidate` e
   `PositiveBoxAllowanceLowerNonnegOnBox`.
3. Fechado: candidatos exatos para `centralUpper` e `anchorAllowanceLower`.
4. Proximo alvo: fechar `PositiveBoxAllowanceLowerComponentPaymentOnBox`.

O primeiro alvo pratico fechado na retomada:

```lean
def positiveBoxVerticalTailUpperCandidate : ℂ → ℝ :=
  fun _ => (49 : ℝ) / 450

theorem positiveBox_verticalDepthTailUpper_bound_candidate :
  PositiveBoxVerticalDepthTailUpperBoundOnBox
    positiveBoxVerticalTailUpperCandidate := by
  -- fechado em Lean
```

Provavelmente usar os q-bounds ja existentes em:

```lean
LeanC2/AuditContinuedQuartetPositiveBoxInterval.lean
LeanC2/AuditContinuedQuartetPositiveBoxSector.lean
```

especialmente:

```lean
positiveBox_q_norm_upper_7_25
positiveBox_q_norm_lower_11_40
positiveBoxQUpperCandidate
positiveBox_q_norm_lt_one
```

Formula util:

```lean
verticalDepthTailUpper s = ‖q s‖ ^ 2 / (1 - ‖q s‖)
```

Se preferir um candidato racional conservador, com `‖q s‖ ≤ 7 / 25`:

```text
(7/25)^2 / (1 - 7/25) = 49/450
```

Entao um bom primeiro candidato e:

```lean
fun _ => (49 : ℝ) / 450
```

Segundo alvo pratico fechado na retomada:

```lean
def positiveBoxAllowanceLowerCandidate : ℂ → ℝ :=
  fun _ => (1 : ℝ) / 20

theorem positiveBox_allowanceLower_nonneg_candidate :
  PositiveBoxAllowanceLowerNonnegOnBox
    positiveBoxAllowanceLowerCandidate
```

Tambem foram fechados os auxiliares:

```lean
positiveBox_allowanceLower_pos_candidate
positiveBox_allowanceLower_lt_one_candidate
```

Terceiro alvo pratico fechado na retomada:

```lean
positiveBoxExactCentralUpperCandidate
positiveBoxExactVerticalAnchorAllowanceLowerCandidate

positiveBox_exactCentralUpper_bound_candidate
positiveBox_exactVerticalAnchorAllowanceLower_bound_candidate
```

Redutor principal agora disponivel:

```lean
positiveBox_exactGapAnchorAllowanceLowerComponentData_candidate
```

Ele deixa uma unica hipotese sensivel, agora nomeada por:

```lean
PositiveBoxExactGapAnchorCandidateComponentPaymentOnBox
  K M horizontalConstant horizontalScale horizontalRatio
```

Conectores finais locais disponiveis:

```lean
PositiveBoxExactGapAnchorFactorAllowanceLowerScalarBudgetOnBox.of_candidatePayment
PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_candidatePayment
```

Forma consumivel da rota local:

```lean
PositiveBoxOddRefPhaseData
  oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate

PositiveBoxExactGapAnchorCandidateComponentPaymentOnBox
  K M horizontalConstant horizontalScale horizontalRatio

→

PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox
  K M horizontalConstant horizontalScale horizontalRatio
  (positiveBoxOddRefGapUpperFromHalfDisk halfDiskUpper)
```

Atualizacao: o pagamento sensivel tambem foi aberto na forma expanded:

```lean
PositiveBoxExactGapAnchorCandidateExpandedPaymentOnBox
  K M horizontalConstant horizontalScale horizontalRatio
```

com equivalencia:

```lean
positiveBox_candidateComponentPayment_iff_expandedPayment
```

e conectores:

```lean
PositiveBoxExactGapAnchorCandidateComponentPaymentOnBox.of_expandedPayment
PositiveBoxExactGapAnchorFactorAllowanceLowerScalarBudgetOnBox.of_candidateExpandedPayment
PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_candidateExpandedPayment
```

Nova forma consumivel:

```lean
PositiveBoxOddRefPhaseData
  oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate

PositiveBoxExactGapAnchorCandidateExpandedPaymentOnBox
  K M horizontalConstant horizontalScale horizontalRatio

→

PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox
  K M horizontalConstant horizontalScale horizontalRatio
  (positiveBoxOddRefGapUpperFromHalfDisk halfDiskUpper)
```

Proximo alvo recomendado: especializar o expanded payment para
`positiveBoxK`, `positiveBoxM`,
`constantCoreHorizontalAmplitudeQRatio positiveBoxN`, `unitScale` e
`qNormHorizontalRatio`.

Atualizacao: essa especializacao ja esta nomeada:

```lean
PositiveBoxExactGapAnchorActiveExpandedPaymentOnBox
PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeExpandedPayment
```

Tambem foi criada a superficie intervalar para certificar o expanded ativo:

```lean
PositiveBoxExactGapAnchorActiveExpandedUpperData
PositiveBoxExactGapAnchorActiveExpandedUpperData.to_activeExpandedPayment
PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeExpandedUpperData
```

Campos da estrutura:

```lean
central_upper
cutoff_upper
horizontal_upper
margin_lower
scalar_budget
```

O proximo alvo e escolher bounds concretos para:

```lean
centralBudget
cutoffBudget
horizontalBudget
marginLower
```

Cuidado: o `cutoffBudget` dessa estrutura mira

```lean
GenuineMiddleAudit.c2RawCentralCutoffNormConstant positiveBoxK positiveBoxM s
```

nao automaticamente o cutoff continuado antigo.

Atualizacao: candidatos exatos para esses budgets ja foram nomeados:

```lean
positiveBoxActiveCentralBudgetExact
positiveBoxActiveCutoffBudgetExact
positiveBoxActiveHorizontalBudgetExact
positiveBoxActiveMarginLowerExact
```

Novo alvo curto:

```lean
PositiveBoxExactGapAnchorActiveExactScalarBudgetOnBox
```

Conectores:

```lean
positiveBox_activeExpandedUpperData_exact_of_scalarBudget
PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeExactScalarBudget
```

Arquivo de retomada curto criado:

```text
AVANCOS_MIDDLE_GENUINE.md
```

Atualizacao adicional: tambem foi criada uma reducao horizontal/resolvente.

Novos nomes:

```lean
positiveBoxActiveHorizontalBudgetCandidate
positiveBoxAllowanceTailDebitCandidate
positiveBoxActiveResolventFactorCandidate

PositiveBoxExactGapAnchorActiveHorizontalCandidateScalarBudgetOnBox
PositiveBoxExactGapAnchorActiveHorizontalCandidateScalarBudgetSimplifiedOnBox
PositiveBoxExactGapAnchorActiveHorizontalCandidateScalarBudgetResolventOnBox
```

Pontes principais:

```lean
positiveBox_activeResolventFactor_le_candidate
positiveBox_activeHorizontalCandidateScalarBudgetSimplified_of_resolventBudget
PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeHorizontalCandidateScalarBudgetResolvent
PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeHorizontalCandidateScalarBudgetResolvent_ofOddTruncation
```

Alvo escalar mais limpo:

```lean
PositiveBoxExactGapAnchorActiveHorizontalCandidateScalarBudgetResolventOnBox
```

Atualizacao final desta retomada: foi adicionada uma interface intervalar ainda
mais curta para esse alvo:

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

Redutor e conectores:

```lean
PositiveBoxExactGapAnchorActiveResolventUpperData.to_resolventBudget
PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeResolventUpperData
PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeResolventUpperData_ofOddTruncation
```

Esse e o melhor ponto de retomada: escolher candidatos concretos para
`centralBudget`, `cutoffBudget` e `marginLower`, mantendo a margem canonica
`c2ExpandedQuartetResidualMargin` como destino do pagamento.

Escolha feita na retomada seguinte: baseline exata.

```lean
positiveBoxActiveCentralBudgetBaseline := positiveBoxActiveCentralBudgetExact
positiveBoxActiveCutoffBudgetBaseline := positiveBoxActiveCutoffBudgetExact
positiveBoxActiveMarginLowerBaseline := positiveBoxActiveMarginLowerExact
```

Novos nomes:

```lean
PositiveBoxExactGapAnchorActiveBaselineScalarBudgetOnBox
positiveBox_activeResolventUpperData_baseline_of_scalarBudget
PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeBaselineScalarBudget
PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeBaselineScalarBudget_ofOddTruncation
```

Nao trocar essa baseline por `positiveBoxAnchorUpperValue`,
`positiveBoxCutUpperValue` ou pela margem setorial sem provar pontes
especificas. O proximo alvo direto e:

```lean
PositiveBoxExactGapAnchorActiveBaselineScalarBudgetOnBox
```

Atualizacao posterior: foi aberta uma rota defect-aware melhor. Ela evita pagar
a soma triangular dos dois canais centrais e usa um upper para:

```lean
‖genuineCentralDoubleSeries s - continuedCentralOddChannel s‖
```

Novos nomes principais:

```lean
PositiveBoxCentralDefectUpperBoundOnBox
positiveBoxCentralDefectExactUpper
PositiveBoxExactGapAnchorActiveDefectCandidateScalarBudgetResolventOnBox
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectCandidateResolventBudget
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectCandidateResolventBudget_ofOddTruncation
```

Novo alvo recomendado para retomada:

```lean
PositiveBoxExactGapAnchorActiveDefectCandidateScalarBudgetResolventOnBox
  positiveBoxCentralDefectExactUpper
```

Forma informal:

```lean
((49 / 9000 + centralDefectExact + rawCutoff + 1 / 100) *
  (16 / 9) + 1 / 100 + rawCutoff ≤ canonicalMargin)
```

Atualizacao seguinte: esse alvo foi encapsulado numa interface intervalar:

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

Novos nomes:

```lean
PositiveBoxExactGapAnchorActiveDefectResolventUpperData.to_exactDefectResolventBudget
positiveBoxActiveCentralDefectBudgetExact
PositiveBoxExactGapAnchorActiveExactDefectScalarBudgetOnBox
positiveBox_activeDefectResolventUpperData_exact_of_scalarBudget
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeDefectResolventUpperData
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeDefectResolventUpperData_ofOddTruncation
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectScalarBudget
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectScalarBudget_ofOddTruncation
```

O proximo trabalho e escolher/provar bounds para:

```lean
centralDefectBudget
cutoffBudget
marginLower
```

## Atualizacao 2026-07-05: cutoff bridge fechado

O shim ativo agora tambem importa:

```lean
LeanC2.AuditContinuedQuartetPositiveBoxCutoff
```

Foi fechada a ponte:

```lean
raw cutoff ≤ continued cutoff + central defect
```

No Lean:

```lean
PositiveBoxCutoffUpperData.of_cut_bound
positiveBoxActiveCutoffBudgetFromContinuedAndDefect
positiveBox_activeCutoffBudgetFromContinuedAndDefect_upper
```

Logo, `PositiveBoxCutoffUpperData` nao deve ser usado como bound direto para
`positiveBoxActiveCutoffBudgetExact`. O budget correto e:

```lean
positiveBoxCutUpperValue + centralDefectBudget s
```

Novo alvo escalar preferido quando o cutoff vem do certificado continuado:

```lean
PositiveBoxExactGapAnchorActiveDefectContinuedCutoffScalarBudgetOnBox
  centralDefectBudget marginLower
```

Especializacao exata:

```lean
PositiveBoxExactGapAnchorActiveExactDefectContinuedCutoffScalarBudgetOnBox
```

Conectores finais disponiveis:

```lean
positiveBox_activeDefectResolventUpperData_of_continuedCutoffData

PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeDefectContinuedCutoffScalarBudget
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeDefectContinuedCutoffScalarBudget_ofOddTruncation
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectContinuedCutoffScalarBudget
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectContinuedCutoffScalarBudget_ofOddTruncation
```

Atalhos no shim ativo:

```lean
PositiveBoxAnalyticBounds.to_cutoffUpperData
PositiveBoxIntervalData.to_cutoffUpperData
PositiveBoxOddRefAuditCertificate.to_cutoffUpperData
```

Atualizacao adicional: foi aberta a rota depth/core para provar o `cut_bound`
sem usar upper zeta.

Novos nomes em `LeanC2/AuditContinuedQuartetPositiveBoxCutoff.lean`:

```lean
PositiveBoxDepthFactorUpperBoundOnBox
PositiveBoxContinuedOddTruncationUpperBoundOnBox
PositiveBoxDepthCutoffUpperBoundOnBox
PositiveBoxContinuedOddUpperBoundOnBox
PositiveBoxCutoffDepthCoreScalarBudgetOnBox

positiveBox_cut_bound_of_depthCoreScalarBudget
PositiveBoxCutoffUpperData.of_depthCoreScalarBudget
```

A parte geometrica ja esta fechada por formulas explicitas:

```lean
positiveBoxDepthFactorExplicitUpper
positiveBoxDepthCutoffExplicitUpper
positiveBox_depthFactor_bound_explicit
positiveBox_depthCutoff_bound_explicit
```

Entradas restantes:

```lean
PositiveBoxContinuedOddTruncationData
PositiveBoxCutoffExplicitDepthCoreScalarBudgetOnBox continuedOddUpper
```

Especializacao exata disponivel:

```lean
positiveBoxContinuedOddUpperExact
PositiveBoxCutoffExplicitDepthCoreExactOddScalarBudgetOnBox
PositiveBoxCutoffUpperData.of_explicitDepthCoreScalarBudget
PositiveBoxCutoffUpperData.of_explicitDepthCoreExactOddScalarBudget
```

Comando verificado depois dessa atualizacao:

```bash
lake build LeanC2.AuditContinuedQuartetPositiveBoxContinuedOdd
lake build LeanC2.AuditContinuedQuartetPositiveBoxCutoff
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxOddRefPhase.lean
```

Resultado: passou sem erro. Os builds exibiram apenas warnings antigos de lint
em arquivos grandes ja existentes.

Retomada recomendada:

1. provar/fornecer `PositiveBoxContinuedOddTruncationData`;
2. escolher um `continuedOddUpper` genuine-first e provar
   `PositiveBoxCutoffExplicitDepthCoreScalarBudgetOnBox continuedOddUpper`;
3. consumir `PositiveBoxCutoffUpperData.of_explicitDepthCoreScalarBudget`;
4. encontrar um `marginLower` para a margem canonica
   `c2ExpandedQuartetResidualMargin`;
5. reduzir o `centralDefectBudget`;
6. fechar a fase: `PositiveBoxOddRefPhaseData` com half-disk pagando
   `positiveBoxAllowanceLowerCandidate`.

## Atualizacao 2026-07-05: cutoff flexivel e novo proximo alvo

Ao tentar usar:

```lean
PositiveBoxCutoffExplicitDepthCoreExactOddScalarBudgetOnBox
```

o gargalo ficou claro: esse alvo fixa o truncamento impar em:

```lean
positiveBoxOddTruncationUpperValue = 7 / 180
```

Esse valor nasceu para o ledger horizontal. Para o cutoff, ele parece grosseiro
demais diante de:

```lean
positiveBoxCutUpperValue = 3 / 1000
```

Nao ha uma prova formal de impossibilidade registrada. A decisao pratica e:
nao insistir agora no budget fixo; usar um truncamento dedicado ao cutoff.

Novas superficies em `LeanC2/AuditContinuedQuartetPositiveBoxCutoff.lean`:

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

Novas fronteiras em
`LeanC2/AuditContinuedQuartetPositiveBoxOddRefPhase.lean`:

```lean
PositiveBoxActiveExactDefectFlexibleCutoffDepthCoreFrontier
PositiveBoxActiveExactDefectFlexibleCutoffDepthCoreFrontier.to_verticalResidualDominance

PositiveBoxActiveExactDefectFlexibleCutoffExactOddFrontier
PositiveBoxActiveExactDefectFlexibleCutoffExactOddFrontier.to_verticalResidualDominance
```

A fronteira exata flexivel pede agora:

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

Proximo alvo recomendado para o novo chat:

```lean
PositiveBoxContinuedOddTruncationUpperBoundOnBox oddTruncationUpper
PositiveBoxCutoffExplicitDepthCoreFlexibleExactOddScalarBudgetOnBox
  oddTruncationUpper
```

com `oddTruncationUpper` menor que `7 / 180`, construido por geometria
genuine/C2 ou certificado intervalar local, sem usar zeta como insumo.

Verificacao feita:

```bash
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxCutoff.lean
lake build LeanC2.AuditContinuedQuartetPositiveBoxOddRefPhase
```

Resultado: passou. Restam warnings de linha longa no arquivo de auditoria.

## Atualizacao 2026-07-05: tentativa phase-cutoff

A rota flexivel foi refinada para usar o dado de fase como upper de norma do
canal continuado.

Novos nomes em `LeanC2/AuditContinuedQuartetPositiveBoxOddRefPhase.lean`:

```lean
PositiveBoxOddRefTruncationUpperBoundOnBox
PositiveBoxContinuedOddTruncationUpperBoundOnBox.of_oddRefTruncationUpper

positiveBoxContinuedOddUpperFromHalfDisk
positiveBoxContinuedOddUpperPhaseCandidate
PositiveBoxOddRefPhaseData.to_continuedOddUpperBoundOnBox
PositiveBoxOddRefPhaseData.to_continuedOddUpperBoundOnBox_candidate

PositiveBoxActiveExactDefectPhaseCutoffFrontier
PositiveBoxActiveExactDefectPhaseCutoffFrontier.to_verticalResidualDominance
```

A fronteira nova consome:

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

O candidato vindo da fase e:

```lean
positiveBoxContinuedOddUpperPhaseCandidate = fun _ => 21 / 40
```

Diagnostico: isso separa corretamente truncamento e upper do canal continuado,
mas o budget triangular do cutoff ainda parece caro com `K = 3`. Nao ha uma
barreira formal registrada aqui; a leitura operacional e que talvez seja
necessario preservar cancelamento no cutoff, em vez de fechar tudo por
triangulo.

Verificacao feita:

```bash
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxOddRefPhase.lean
lake build LeanC2.AuditContinuedQuartetPositiveBoxOddRefPhase
```

Resultado: passou, com warnings de linha longa.

## Atualizacao 2026-07-05: phase-cutoff triangular descartado

A decisao tecnica acima foi resolvida: a fronteira

```lean
PositiveBoxActiveExactDefectPhaseCutoffFrontier
```

foi provada impossivel no Lean.

Nomes novos:

```lean
positiveBox_corner_mem
positiveBox_phaseCandidate_depthCutoffTerm_exceeds_cutUpper
not_positiveBoxCutoffExplicitDepthCoreFlexibleScalarBudgetOnBox_phaseCandidate_at
not_PositiveBoxActiveExactDefectPhaseCutoffFrontier
```

Conteudo da barreira:

```lean
positiveBoxContinuedOddUpperPhaseCandidate = fun _ => 21 / 40
```

Com `‖q s‖ ≥ 11 / 40` na `positiveBox`, o termo

```lean
2 * positiveBoxDepthCutoffExplicitUpper s *
  positiveBoxContinuedOddUpperPhaseCandidate s
```

sozinho ja fica maior que:

```lean
positiveBoxCutUpperValue = 3 / 1000
```

Logo, se `oddTruncationUpper s ≥ 0`, o budget flexivel triangular nao pode
fechar. Isso independe de melhorar o truncamento impar dentro da mesma forma.

Novo horizonte para o proximo chat:

1. nao tentar mais provar `PositiveBoxActiveExactDefectPhaseCutoffFrontier`;
2. criar uma decomposicao do cutoff que preserve cancelamento/fase, em vez de
   pagar `depthCutoff * ‖continuedOdd‖` por triangulo;
3. ou revisar o ledger/valor permitido para cutoff antes de exigir
   `positiveBoxCutUpperValue = 3 / 1000`.

Verificacao adicional feita:

```bash
rg -n "sorry|admit|axiom|unsafe|riemannZeta|ExactZeta|zetaUpper|zetaDepthCore|\bzeta\b" \
  LeanC2/AuditContinuedQuartetPositiveBoxCutoff.lean \
  LeanC2/AuditContinuedQuartetPositiveBoxOddRefPhase.lean \
  LeanC2/AuditContinuedQuartetPositiveBoxGenuineOddBridge.lean
```

Resultado: sem matches.

## Cuidado tecnico

O namespace do shim e:

```lean
namespace C2
namespace ContinuedQuartetAudit
```

Alguns nomes do spine global estao em:

```lean
GenuineMiddleAudit.*
```

Exemplos:

```lean
GenuineMiddleAudit.C2ExactGapAnchorFactorUpperLowerBudget
GenuineMiddleAudit.C2ExactGapAnchorFactorAllowanceLowerScalarBudget
GenuineMiddleAudit.C2ExactGapAnchorGapUpperScalarBudget
GenuineMiddleAudit.c2ExactVerticalAnchorResidualNormAllowance
```

Evite mover nomes ou refatorar os arquivos grandes. Mantenha a rota audit-only
em `LeanC2/AuditContinuedQuartetPositiveBoxOddRefPhase.lean` ate o alvo local
estar claro.

## Atualizacao 2026-07-05: frente ativa exact-gap upper/lower

Foi criado um novo shim pequeno para assumir a frente mais promissora sem mexer
no spine grande:

```text
LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

Objeto principal:

```lean
GenuineMiddleAudit.C2ExactGapAnchorCanonicalUpperLowerMiddleData
```

Ele fixa o upper canônico:

```lean
GenuineMiddleAudit.c2ContinuedVerticalAnchorResidualExactFactorUpper
```

e reduz a frente, apos scale/horizontal, a duas obrigacoes:

```lean
GenuineMiddleAudit.C2ExactGapAnchorFactorAllowanceLowerBoundOnMiddle
GenuineMiddleAudit.C2ExactGapAnchorFactorUpperLowerBudgetOnMiddle
```

na forma especifica:

```lean
C2ExactGapAnchorFactorUpperLowerBudgetOnMiddle
  c2ContinuedVerticalAnchorResidualExactFactorUpper allowanceLower near edge
```

Conversores novos:

```lean
C2ExactGapAnchorCanonicalUpperLowerMiddleData.of_scaleData
C2ExactGapAnchorCanonicalUpperLowerMiddleData.of_scaleData_scalarBudget
C2ExactGapAnchorCanonicalUpperLowerMiddleData.to_tailNormAnchorResidualFactorBudget
C2ExactGapAnchorCanonicalUpperLowerMiddleData.to_phaseSavingOnMiddle
C2ExactGapAnchorCanonicalUpperLowerMiddleData.to_exactGapExpandedMiddleData
C2ExactGapAnchorCanonicalUpperLowerMiddleData.to_ne_zero_on_middle
```

Leitura para continuar: o proximo alvo real e construir um `allowanceLower`
compatível com a geometria horizontal ativa, fechar o budget escalar

```lean
C2ExactGapAnchorFactorAllowanceLowerScalarBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio allowanceLower near edge
```

e provar, no middle,

```lean
c2ContinuedVerticalAnchorResidualExactFactorUpper s < allowanceLower s
```

Se isso fechar, o shim ja entrega `genuineCentralDoubleSeries s ≠ 0` na middle.
Isso preserva a disciplina Genuine-First e nao usa zeta.

Verificacao feita:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
lake build LeanC2.AuditGenuineMiddleExactGapFrontier
```

Resultado: passou. Warnings antigos aparecem em dependencias, mas nao no novo
arquivo.

Higiene:

```bash
rg -n "sorry|admit|axiom|unsafe|riemannZeta|ExactZeta|zetaUpper|zetaDepthCore|\bzeta\b" \
  LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

Resultado: sem matches.

## Atualizacao 2026-07-05: alvo mais recente

O alvo atual no shim:

```text
LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

foi refinado para a forma escalar direta `halfDisk + margem + debito`.

Novos nomes compilados:

```lean
C2ExactGapAnchorCanonicalHalfDiskMarginDebitScalarBudget
C2ExactGapAnchorCanonicalHalfDiskMarginDebitScalarBudgetOnMiddle
C2ExactGapAnchorCanonicalHalfDiskMarginDebitScalarBudget_iff_paymentReserve
C2ExactGapAnchorCanonicalHalfDiskMarginDebitScalarBudgetOnMiddle_iff_paymentReserve
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_halfDiskMarginDebitScalar
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalHalfDiskMarginDebitScalar
```

Para retomar, o alvo operacional e fornecer:

```lean
C2ContinuedOddHalfDiskBoundOnMiddle halfDiskUpper near edge

C2ExactGapAnchorCanonicalMarginLowerBoundOnMiddle
  marginLower near edge

C2ExactGapAnchorCanonicalExternalDebitUpperBoundOnMiddle
  horizontalConstant horizontalScale horizontalRatio externalDebitUpper near edge

C2ExactGapAnchorCanonicalHalfDiskMarginDebitScalarBudgetOnMiddle
  halfDiskUpper marginLower externalDebitUpper near edge
```

O ultimo item e exatamente:

```lean
2 * ((1 + ‖q s‖) * verticalDepthTailUpper s) * halfDiskUpper s <
  marginLower s * (1 - ‖q s‖) - externalDebitUpper s
```

Com esses quatro itens, mais `hscale` e `hhorizontal`, o wrapper

```lean
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalHalfDiskMarginDebitScalar
```

entrega:

```lean
genuineCentralDoubleSeries s ≠ 0
```

no middle.

Verificacao feita:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

Resultado: passou sem saida.

## Atualizacao 2026-07-06: SumBound expandido em cinco boletos

O `SumBoundOnMiddle` foi aberto em componentes exatos. Novos nomes:

```lean
c2ExactGapAnchorCanonicalClearedGenuineCentralPressureRatio
c2ExactGapAnchorCanonicalClearedContinuedCentralPressureRatio
c2ExactGapAnchorCanonicalClearedHorizontalPressureRatio
c2ExactGapAnchorCanonicalClearedCutoffPressureRatio
c2ExactGapAnchorCanonicalClearedExternalPressureComponentSum
```

A igualdade algébrica entre external pressure e soma dos quatro componentes
foi fechada:

```lean
c2ExactGapAnchorCanonicalClearedExternalPressureRatio_eq_componentSum
```

Novo alvo recomendado:

```lean
C2ExactGapAnchorCanonicalPrototypePressureComponentSumBoundOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Ele prova a rota terminal via:

```lean
C2ExactGapAnchorCanonicalPrototypePressureSumBoundOnMiddle_of_componentSumBound
C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_componentSumBound
C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_of_componentSumBound
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypePressureComponentSumBound
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypePressureComponentSumBound
```

Leitura para o novo chat: agora a contabilidade esta separada exatamente em:

```text
genuine central pressure
continued central pressure
horizontal pressure
cutoff pressure
lower-factor pressure
```

O proximo passo deve escolher bounds para esses cinco boletos, tentando manter
a soma total abaixo de `3 / 4`. Essa e a forma mais fina atual.

Verificacao feita:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

Resultado: passou sem saida.

## Atualizacao 2026-07-06: alvo mais fino por soma normalizada

O alvo refinado atual nao e mais exigir `totalBounds` ou `aggregateBounds`.
Foi isolada a obrigacao minima:

```lean
C2ExactGapAnchorCanonicalPrototypePressureSumBoundOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Forma pontual:

```lean
c2ExactGapAnchorCanonicalClearedExternalPressureRatio
    K M horizontalConstant horizontalScale horizontalRatio s +
  c2ExactGapAnchorCanonicalClearedLowerFactorPressureRatio s ≤
    (3 / 4 : ℝ)
```

Esse alvo fecha todo o restante por conectores Lean:

```lean
C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBoundOnMiddle_of_sumBound
C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_sumBound
C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_of_sumBound
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypePressureSumBound
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypePressureSumBound
```

Leitura para o novo chat: esta e a melhor superficie para preservar saldo. Ela
nao pede bounds individuais `≤ 5 / 8`; pede apenas que a soma real das duas
pressoes normalizadas caiba em `3 / 4`.

Proximo passo tecnico:

```lean
C2ExactGapAnchorCanonicalPrototypePressureSumBoundOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

deve ser atacado por uma decomposicao de:

```lean
c2ExactGapAnchorCanonicalClearedExternalPressureRatio
```

em componentes central, continued, horizontal e cutoff, somando diretamente
contra o lower-factor pressure. Nao tentar provar esse alvo so a partir de
`scale` e `horizontal`: esses dados nao controlam sozinhos todo o debito
externo.

Verificacao feita:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

Resultado: passou sem saida.

## Atualizacao 2026-07-06: proximo alvo reduzido a bounds normalizados

Foi fechado o conector do alvo `allowanceLower`:

```lean
C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_totalBounds
C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_aggregateBounds
```

Tambem ha saida terminal direta:

```lean
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_allowanceLowerTotalBound
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalAllowanceLowerTotalBound
```

Portanto o novo chat deve continuar por aqui:

```lean
C2ExactGapAnchorCanonicalPrototypePressureAggregateBoundsOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

ou, se for mais conveniente:

```lean
C2ExactGapAnchorCanonicalPrototypePressureTotalBoundsOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Leitura: nao tentar provar `AllowanceLowerTotalBoundOnMiddle` diretamente do
nada; ele depende de controlar as pressoes normalizadas de `D` e `G`. A rota
mais fina agora e provar a soma normalizada:

```lean
c2ExactGapAnchorCanonicalClearedExternalPressureRatio
    K M horizontalConstant horizontalScale horizontalRatio s +
  c2ExactGapAnchorCanonicalClearedLowerFactorPressureRatio s ≤
    (3 / 4 : ℝ)
```

no middle. Isso paga `D + G ≤ 3 / 4 * allowanceLower` sem trocar a margem por
um bound grosseiro.

Verificacao feita:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
lake build LeanC2.AuditGenuineMiddleExactGapFrontier
```

Resultado: passou. Warnings remanescentes sao antigos/de dependencias.

## Atualizacao 2026-07-05: alvo atual apos especializacao canonica

O alvo mais recente removeu os parametros `marginLower` e
`externalDebitUpper` da frente operacional, escolhendo as formas exatas:

```lean
C2ExactGapAnchorCanonicalMarginLowerBoundOnMiddle_exact
C2ExactGapAnchorCanonicalExternalDebitUpperBoundOnMiddle_canonical
```

Novos nomes no shim:

```lean
C2ExactGapAnchorCanonicalHalfDiskPhaseReserveBudget
C2ExactGapAnchorCanonicalHalfDiskPhaseReserveBudgetOnMiddle
C2ExactGapAnchorCanonicalHalfDiskPhaseReserveBudget_iff_marginDebitScalar
C2ExactGapAnchorCanonicalHalfDiskPhaseReserveBudgetOnMiddle_iff_marginDebitScalar
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_halfDiskPhaseReserve
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalHalfDiskPhaseReserve
```

Para retomar, o alvo operacional agora e:

```lean
C2ContinuedOddHalfDiskBoundOnMiddle halfDiskUpper near edge

C2ExactGapAnchorCanonicalHalfDiskPhaseReserveBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio halfDiskUpper near edge
```

Expandido ponto a ponto:

```lean
2 * ((1 + ‖q s‖) * verticalDepthTailUpper s) * halfDiskUpper s <
  c2ExactGapAnchorCanonicalPhaseReserve
    K M horizontalConstant horizontalScale horizontalRatio s
```

Com estes dois itens, mais `hscale` e `hhorizontal`, o wrapper

```lean
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalHalfDiskPhaseReserve
```

entrega `genuineCentralDoubleSeries s ≠ 0` no middle.

Verificacao feita:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

Resultado: passou sem saida.

## Atualizacao 2026-07-05: proximo alvo operacional

Foi aberta a interface modular para atacar primeiro a reserva:

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

Para retomar, o alvo modular e:

```lean
C2ExactGapAnchorCanonicalExactHalfDiskPaymentUpperBoundOnMiddle
  paymentUpper near edge

C2ExactGapAnchorCanonicalPhaseReserveLowerBoundOnMiddle
  horizontalConstant horizontalScale horizontalRatio reserveLower near edge

C2ExactGapAnchorCanonicalExactHalfDiskPaymentReserveBudgetOnMiddle
  paymentUpper reserveLower near edge
```

Leitura operacional: escolher um `reserveLower` para a reserva canonica, um
`paymentUpper` para o pagamento do raio exato, e fechar:

```lean
paymentUpper s < reserveLower s
```

Esse e o alvo certo para inspecionar folga da reserva antes de tentar uma
estimativa fina do raio/fase.

Verificacao feita:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

Resultado: passou sem saida.

## Atualizacao 2026-07-05: escolha mais refinada de upper/lower

Foi fixada a escolha sharp dos dois lados:

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

Para retomar, o alvo mais fino e:

```lean
C2ExactGapAnchorCanonicalExactHalfDiskSharpUpperLowerBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Ele nao introduz nenhum envelope adicional: e exatamente o saldo entre o
pagamento real do raio half-disk e a reserva canonica real.

Verificacao feita:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

Resultado: passou sem saida.

## Atualizacao 2026-07-05: alvo atual sem halfDiskUpper

O alvo mais recente remove tambem o envelope livre `halfDiskUpper`, escolhendo
o raio exato ja existente:

```lean
c2ContinuedOddExactHalfDiskUpper
```

Novos nomes no shim:

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

Para retomar, o alvo operacional agora e apenas:

```lean
C2ExactGapAnchorCanonicalExactHalfDiskPhaseReserveBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Expandido ponto a ponto:

```lean
2 * ((1 + ‖q s‖) * verticalDepthTailUpper s) *
    ‖(1 / 2 : ℂ) - continuedOddDirichletChannel s‖ <
  c2ExactGapAnchorCanonicalPhaseReserve
    K M horizontalConstant horizontalScale horizontalRatio s
```

Este alvo e equivalente ao expanded exato antigo:

```lean
C2ExactGapAnchorCanonicalExactHalfDiskExpandedBudgetOnMiddle
```

Com `hscale` e `hhorizontal`, o wrapper

```lean
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactHalfDiskPhaseReserve
```

entrega `genuineCentralDoubleSeries s ≠ 0` no middle.

Verificacao feita:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

Resultado: passou sem saida.

## Atualizacao 2026-07-05: contabilidade sharp por saldo

Estado de retomada mais recente: o alvo sharp foi reescrito como positividade
do saldo real.

```lean
C2ExactGapAnchorCanonicalExactHalfDiskSharpSurplusPositiveOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Identidade principal:

```lean
surplus =
  c2ExpandedQuartetResidualMargin s * (1 - ‖q s‖) -
    c2ExactGapAnchorCanonicalExternalDebit
      K M horizontalConstant horizontalScale horizontalRatio s -
    c2ExactGapAnchorCanonicalExactHalfDiskPayment s
```

Novos nomes importantes:

```lean
c2ExactGapAnchorCanonicalExactHalfDiskSharpSurplus
C2ExactGapAnchorCanonicalExactHalfDiskSharpSurplusPositiveOnMiddle
c2ExactGapAnchorCanonicalExactHalfDiskSharpSurplus_eq_ledger
c2ExactGapAnchorCanonicalExactHalfDiskSharpSurplus_eq_expandedLedger
C2ExactGapAnchorCanonicalExactHalfDiskSharpUpperLowerOnMiddle_iff_surplus
C2ExactGapAnchorCanonicalExactHalfDiskSharpSurplusOnMiddle_iff_expanded
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskSharpSurplus
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactHalfDiskSharpSurplus
```

Leitura para continuar: provar o saldo positivo acima fecha o budget expanded,
fecha o phase reserve, e com `hscale`/`hhorizontal` entrega nao anulamento no
middle. Essa forma preserva o upper/lower mais refinado e nao acrescenta
envelope.

Checagem de reaproveitamento: nao apareceu fechamento pronto nas rotas antigas.
`C2ExactGapAnchorExactHalfDiskBudgetOnMiddle` esta na moeda normalizada
`c2ExactGapAnchorFactorAllowance`; o alvo atual esta na moeda ponderada do
saldo sharp.

Verificacao feita:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

Resultado: passou sem saida.

## Atualizacao 2026-07-05: alvo weighted-ledger

Estado de retomada mais recente: o saldo sharp foi convertido para a
contabilidade equivalente:

```lean
C2ExactGapAnchorCanonicalExactHalfDiskWeightedLedgerBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Forma ponto a ponto:

```lean
c2ExactGapAnchorCanonicalExternalDebit
    K M horizontalConstant horizontalScale horizontalRatio s +
  c2ExactGapAnchorCanonicalExactHalfDiskPayment s <
    c2ExpandedQuartetResidualMargin s * (1 - ‖q s‖)
```

Conectores novos:

```lean
C2ExactGapAnchorCanonicalWeightedMarginDebitPaymentBudgetOnMiddle
C2ExactGapAnchorCanonicalExactHalfDiskSharpSurplusOnMiddle_of_weighted
C2ExactGapAnchorCanonicalExactHalfDiskWeightedLedgerBudgetOnMiddle
C2ExactGapAnchorCanonicalExactHalfDiskWeightedLedgerOnMiddle_iff_surplus
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskWeightedLedger
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactHalfDiskWeightedLedger
```

Leitura para continuar: atacar diretamente
`external debit + exact half-disk payment < weighted quartet margin`.
Esse alvo e equivalente ao saldo sharp, entao nao ha perda de envelope.

Verificacao feita:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

Resultado: passou sem saida.

## Atualizacao 2026-07-05: ledger componentizado

Estado de retomada mais recente: o alvo weighted-ledger foi aberto nos
componentes do `externalDebit`.

```lean
C2ExactGapAnchorCanonicalExactHalfDiskComponentLedgerBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Forma ponto a ponto:

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

Conectores novos:

```lean
C2ExactGapAnchorCanonicalExternalDebitComponentBoundsOnMiddle
C2ExactGapAnchorCanonicalExternalDebitUpperBoundOnMiddle_of_components
C2ExactGapAnchorCanonicalWeightedComponentLedgerBudgetOnMiddle
C2ExactGapAnchorCanonicalExactHalfDiskSharpSurplusOnMiddle_of_componentLedger
C2ExactGapAnchorCanonicalExactHalfDiskComponentLedgerBudgetOnMiddle
C2ExactGapAnchorCanonicalExactHalfDiskComponentLedgerOnMiddle_iff_weighted
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskComponentLedger
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactHalfDiskComponentLedger
```

Leitura para continuar: pagar explicitamente os custos
`genuine + continued + horizontal + cutoff + halfDiskPayment` contra a margem
ponderada. Essa e a mesma rota, sem perda de envelope.

Verificacao feita:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

Resultado: passou sem saida.

## Atualizacao 2026-07-05: encaixe com collected budget

Estado de retomada mais recente: o ledger componentizado foi identificado com
o collected budget canonico do exact-gap.

```lean
C2ExactGapAnchorExactGapExpandedUpperCollectedBudgetOnMiddle
  c2GenuineCentralExactUpper
  c2ContinuedCentralExactUpper
  (c2HorizontalRegularizedUpper
    horizontalConstant horizontalScale horizontalRatio)
  (c2RawCentralCutoffNormConstant K M)
  near edge
```

Conectores novos:

```lean
c2ExactGapAnchorCanonicalExactHalfDiskPayment_eq_weightedExactTailGap
C2ExactGapAnchorCanonicalExactHalfDiskComponentLedgerOnMiddle_iff_collected
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactGapCollected
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactGapCollected
```

Leitura para continuar: o custo half-disk virou exatamente o custo
`exactTailGapBudget` ponderado. Entao o alvo atual pode ser atacado como
`C2ExactGapAnchorExactGapExpandedUpperCollectedBudgetOnMiddle` canonico.

Verificacao feita:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

Resultado: passou sem saida.

## Atualizacao 2026-07-05: alvo anchor-residual cleared

Estado de retomada mais recente: o melhor proximo alvo e provar o orcamento
canonico limpo pelo residual vertical:

```lean
C2ExactGapAnchorCanonicalAnchorResidualClearedBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Conectores novos:

```lean
C2ExactGapAnchorCanonicalAnchorResidualClearedBudgetOnMiddle
C2ExactGapAnchorCanonicalCollectedOnMiddle_of_anchorResidualCleared
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_anchorResidualCleared
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalAnchorResidualCleared
```

Leitura para continuar: esse alvo e a forma limpa que paga o collected budget
canonico. A cadeia ja formalizada e:

```lean
anchorResidualCleared
  -> collected budget canonico
  -> phase reserve
  -> genuineCentralDoubleSeries s ≠ 0
```

Verificacao feita:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

Resultado: passou sem saida.

## Atualizacao 2026-07-05: unit reserve do lower factor

Estado de retomada mais recente: o alvo atual mais fino e:

```lean
C2ExactGapAnchorCanonicalLowerFactorClearedUnitReserveBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Esse alvo e equivalente a:

```lean
C2ExactGapAnchorCanonicalAnchorResidualClearedBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Conectores novos:

```lean
C2ExactGapAnchorCanonicalLowerFactorClearedUnitReserveOnMiddle_iff_anchorResidual
C2ExactGapAnchorCanonicalCollectedOnMiddle_of_lowerFactorUnitReserve
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_lowerFactorUnitReserve
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalLowerFactorUnitReserve
```

Leitura para continuar: basta provar que o exact lower factor fica abaixo da
unit reserve limpa:

```lean
c2ContinuedVerticalAnchorResidualExactLowerFactorUpper s <
  c2ExactGapAnchorCanonicalLowerFactorClearedUnitReserve
    K M horizontalConstant horizontalScale horizontalRatio s
```

Verificacao feita:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
lake build LeanC2.AuditGenuineMiddleExactGapFrontier
```

Resultado: ambos passaram; o build ainda mostra apenas warnings antigos de
linha longa em `LeanC2/AuditGenuineMiddle.lean`.

## Atualizacao 2026-07-05: prototype dyadic pressure atlas

Estado de retomada mais recente: foi criada uma atlas dyadic concreta para a
frente de shares:

```lean
c2ExactGapAnchorCanonicalPressureSharePrototypeAtlas
```

Janelas incluidas:

```text
(1/4, 1/4), (1/4, 3/8), (3/8, 1/4), (1/4, 1/2),
(1/2, 1/4), (3/8, 3/8), (1/4, 5/8), (5/8, 1/4),
(3/8, 1/2), (1/2, 3/8)
```

Todas tem soma `< 1`; as mais apertadas somam `7/8`, deixando reserva `1/8`.
O alvo operacional para continuar e provar:

```lean
C2ExactGapAnchorCanonicalPrototypePressureShareAtlasCover
  horizontalConstant horizontalScale horizontalRatio near edge
```

Com esse cover, ja existem pontes para fechar o ledger e a nao-anulacao:

```lean
C2ExactGapAnchorCanonicalPrototypePressureShareAtlasPointwiseCases
C2ExactGapAnchorCanonicalPrototypePressureShareAtlasCover_of_pointwiseCases
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypePressureShareAtlasCover
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypePressureShareAtlasCover
```

Orientacao para o proximo chat: nao engrossar para uma estimativa global. Tentar
provar os casos ponto a ponto da atlas; se falhar em uma zona, subdividir so
aquela zona ou trocar a janela local por shares dyadic mais finas, sempre
mantendo soma `< 1`.

Verificacao feita:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
lake build LeanC2.AuditGenuineMiddleExactGapFrontier
rg -n "sorry|admit|axiom|unsafe|riemannZeta|ExactZeta|zetaUpper|zetaDepthCore|\bzeta\b" \
  LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

Resultado: Lean e build passaram; a varredura nao encontrou ocorrencias. O
build ainda mostra warnings antigos em modulos de base.

## Atualizacao 2026-07-05: ratio bounds da atlas prototype

Estado de retomada mais recente: a frente da atlas agora foi reduzida a razoes
normalizadas pelo caixa cleared:

```lean
c2ExactGapAnchorCanonicalClearedExternalPressureRatio
c2ExactGapAnchorCanonicalClearedLowerFactorPressureRatio
C2ExactGapAnchorCanonicalPressureShareIndexRatioBounds
```

Novo alvo operacional recomendado:

```lean
C2ExactGapAnchorCanonicalResidualMarginPositiveOnMiddle near edge

C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioBoundsCover
  horizontalConstant horizontalScale horizontalRatio near edge
```

Com esses dois blocos, a cadeia ja fecha:

```lean
C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioCover_of_residualMarginPositive
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypeResidualMarginRatioBoundsCover
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypeResidualRatioBoundsCover
```

Orientacao para continuar: provar primeiro a positividade da margem residual.
Depois provar o cover das razoes `D/Q` e `G/Q` pela atlas dyadic. Se algum
ponto falhar, subdividir a janela/localidade, sem trocar por envelope global
mais grosso.

Verificacao feita:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
lake build LeanC2.AuditGenuineMiddleExactGapFrontier
rg -n "sorry|admit|axiom|unsafe|riemannZeta|ExactZeta|zetaUpper|zetaDepthCore|\bzeta\b" \
  LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

Resultado: Lean e build passaram; a varredura nao encontrou ocorrencias. O
build ainda mostra warnings antigos em modulos de base.

## Atualizacao 2026-07-05: certificado allowance/reserve da margem residual

Estado de retomada mais recente: a positividade da margem residual foi reduzida
ao budget direto:

```lean
C2ExactGapAnchorCanonicalAllowanceReserveBudgetOnMiddle near edge
```

ou, de forma ainda mais refinavel, ao share normalizado:

```lean
C2ExactGapAnchorCanonicalAnalyticAllowancePositiveOnMiddle near edge
C2ExactGapAnchorCanonicalResidualReserveShareLTOneOnMiddle near edge
```

Conectores principais:

```lean
C2ExactGapAnchorCanonicalResidualMarginPositiveOnMiddle_of_allowanceReserveBudget
C2ExactGapAnchorCanonicalResidualMarginPositiveOnMiddle_of_reserveShareLTOne
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypeAllowanceReserve
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypeReserveShare
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypeAllowanceReserve
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypeReserveShare
```

Proximo alvo recomendado: fechar o bloco A por allowance/reserve e o bloco B
por `C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioBoundsCover`.
Evitar envelope global grosso; se precisar, usar shares locais para o reserve e
para as duas pressoes `D/Q`, `G/Q`.

Verificacao feita:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

Resultado: passou sem warnings novos no arquivo da frente.

## Atualizacao 2026-07-05: ledger de envelopes cleared

Estado de retomada mais recente: o alvo operacional mais modular agora e:

```lean
C2ExactGapAnchorCanonicalClearedEnvelopeLedgerOnMiddle
  marginLower externalDebitUpper lowerFactorCostUpper near edge
```

com as tres hipoteses de envelope:

```lean
C2ExactGapAnchorCanonicalClearedMarginLowerBoundOnMiddle
  marginLower near edge

C2ExactGapAnchorCanonicalClearedExternalDebitUpperBoundOnMiddle
  horizontalConstant horizontalScale horizontalRatio externalDebitUpper near edge

C2ExactGapAnchorCanonicalClearedLowerFactorCostUpperBoundOnMiddle
  lowerFactorCostUpper near edge
```

Conectores novos:

```lean
C2ExactGapAnchorCanonicalLowerFactorClearedSurplusOnMiddle_of_envelopeLedger
C2ExactGapAnchorCanonicalCollectedOnMiddle_of_clearedEnvelopeLedger
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_clearedEnvelopeLedger
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalClearedEnvelopeLedger
```

Leitura para continuar: a rota segue Genuine-First e nao usa zeta. O saldo a
fechar foi separado em margem cleared, debito externo cleared e custo do exact
lower factor. A prova restante pode escolher envelopes mais finos que os exatos
canonicos, desde que feche:

```lean
externalDebitUpper s + lowerFactorCostUpper s < marginLower s
```

Os envelopes exatos canonicos existem para os tres componentes, entao a nova
camada nao perde informacao; ela so permite atacar a contabilidade por partes.

Verificacao feita:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
lake build LeanC2.AuditGenuineMiddleExactGapFrontier
```

Resultado: ambos passaram; o build ainda mostra warnings antigos em modulos de
base, principalmente linhas longas.

## Atualizacao 2026-07-05: cover finito por lista de shares

Estado de retomada mais recente: a forma mais operacional agora e uma lista
finita de janelas:

```lean
C2ExactGapAnchorCanonicalPressureShareIndexListCover
  atlas horizontalConstant horizontalScale horizontalRatio near edge
```

Conectores:

```lean
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_pressureShareIndexListCover
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPressureShareIndexListCover
```

Leitura para continuar: montar uma primeira `atlas : List
C2ExactGapAnchorCanonicalPressureShareIndex`, com poucos pares de shares. O
criterio e cobrir o middle por janelas onde `externalShare + lowerFactorShare <
1`. A vantagem e que a lista pode ser refinada seletivamente, preservando o
caixa exato.

Verificacao feita neste bloco:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
lake build LeanC2.AuditGenuineMiddleExactGapFrontier
```

Resultado: ambos passaram; o build ainda mostra warnings antigos em modulos de
base, principalmente linhas longas.

## Atualizacao 2026-07-05: atlas por janelas constantes de share

Decisao operacional mais recente: usar primeiro um atlas de janelas constantes
de share, antes de qualquer divisao geometrica grosseira.

Indice:

```lean
C2ExactGapAnchorCanonicalPressureShareIndex
```

Filtro concreto:

```lean
C2ExactGapAnchorCanonicalPressureShareIndexFilter
  K M horizontalConstant horizontalScale horizontalRatio idx
```

Cover que fecha o ledger exato:

```lean
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_pressureShareIndexCover
```

Wrapper ate nao-anulacao:

```lean
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPressureShareIndexCover
```

Leitura para continuar: tentar construir um cover por poucos indices primeiro,
por exemplo:

```text
external baixo / lower baixo
external medio / lower baixo
external baixo / lower medio
zona balanceada
```

Se algum ponto estourar, refinamos a janela de share, nao engrossamos os
custos. Essa escolha preserva o caixa e prepara uma eventual certificacao
dyadica/intervalar.

Verificacao feita neste bloco:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
lake build LeanC2.AuditGenuineMiddleExactGapFrontier
```

Resultado: ambos passaram; o build ainda mostra warnings antigos em modulos de
base, principalmente linhas longas.

## Atualizacao 2026-07-05: filtragem por shares de pressao

Estado de retomada mais recente: a filtragem escolhida para evitar estimativas
grosseiras e por **shares locais de pressao**.

Alvo estrutural:

```lean
C2ExactGapAnchorCanonicalMiddleFilterCover filters near edge

∀ i,
  C2ExactGapAnchorCanonicalPressureShareBoundsOnFilter
    (filters i)
    horizontalConstant horizontalScale horizontalRatio
    (externalShare i) (lowerFactorShare i) near edge
```

Conectores:

```lean
C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerBudget_of_pressureShares
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_pressureFilterCover
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPressureFilterCover
```

O criterio local em cada filtro e:

```lean
externalShare s + lowerFactorShare s < 1
```

com cada share dominando, respectivamente, o debito externo cleared e o custo
do lower factor como fracao da margem cleared exata.

Leitura para continuar: escolher uma familia pequena de filtros primeiro
provavelmente por regimes de pressao relativa (`external` dominante,
`lower-factor` dominante, balanceado). A cada tentativa, manter os filtros
pequenos o suficiente para que as shares locais fiquem abaixo de `1` sem
engrossar o caixa.

Verificacao feita neste bloco:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
lake build LeanC2.AuditGenuineMiddleExactGapFrontier
```

Resultado: ambos passaram; o build ainda mostra warnings antigos em modulos de
base, principalmente linhas longas.

## Atualizacao 2026-07-05: escolha no-loss dos envelopes

Estado de retomada mais recente: os envelopes mais finos foram escolhidos como
os exatos canonicos:

```lean
C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Esse alvo e o weighted ledger com:

```lean
c2ExpandedQuartetResidualMargin
c2ExactGapAnchorCanonicalExternalDebit
  K M horizontalConstant horizontalScale horizontalRatio
c2ContinuedVerticalAnchorResidualExactLowerFactorUpper
```

Conectores principais:

```lean
C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerOnMiddle_iff_surplus
C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerOnMiddle_iff_anchorResidual
C2ExactGapAnchorCanonicalCollectedOnMiddle_of_exactWeightedEnvelopeLedger
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactWeightedEnvelopeLedger
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactWeightedEnvelopeLedger
```

Leitura para continuar: essa e a forma sem perda do alvo atual. A desigualdade
restante e exatamente a contabilidade fina do surplus. Se ela nao fechar
diretamente, o proximo passo natural e procurar margem estrita/local ou algum
upper/lower local melhor que o exato canonico em sub-regioes do middle.

Verificacao feita neste bloco:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
lake build LeanC2.AuditGenuineMiddleExactGapFrontier
```

Resultado: ambos passaram; o build ainda mostra warnings antigos em modulos de
base, principalmente linhas longas.

## Atualizacao 2026-07-05: ledger ponderado com envelopes crus

Estado de retomada mais recente: o alvo operacional mais fino agora e:

```lean
C2ExactGapAnchorCanonicalWeightedEnvelopeLedgerOnMiddle
  marginLower externalDebitUpper lowerFactorUpper near edge
```

Hipoteses de envelope associadas:

```lean
C2ExactGapAnchorCanonicalMarginLowerBoundOnMiddle
  marginLower near edge

C2ExactGapAnchorCanonicalExternalDebitUpperBoundOnMiddle
  horizontalConstant horizontalScale horizontalRatio externalDebitUpper near edge

C2ExactGapAnchorCanonicalLowerFactorUpperBoundOnMiddle
  lowerFactorUpper near edge
```

O ledger a provar ponto a ponto e:

```lean
externalDebitUpper s * (1 - ‖q s‖)
  + c2ExactGapAnchorCanonicalLowerFactorClearedWeight s * lowerFactorUpper s
  < marginLower s * (1 - ‖q s‖) ^ 2
```

Conectores principais:

```lean
C2ExactGapAnchorCanonicalLowerFactorClearedSurplusOnMiddle_of_weightedLedger
C2ExactGapAnchorCanonicalCollectedOnMiddle_of_weightedLedger
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_weightedLedger
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalWeightedLedger
```

Leitura para continuar: escolher envelopes finos para `marginLower`,
`externalDebitUpper` e `lowerFactorUpper`. Os lemas ja convertem esses envelopes
para o ledger cleared e fecham a cadeia ate nao-anulacao genuine.

Verificacao feita neste bloco:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
lake build LeanC2.AuditGenuineMiddleExactGapFrontier
```

Resultado: ambos passaram; o build ainda mostra warnings antigos em modulos de
base, principalmente linhas longas.

## Atualizacao 2026-07-05: surplus cleared do lower factor

Estado de retomada mais recente: o alvo atual mais fino e:

```lean
C2ExactGapAnchorCanonicalLowerFactorClearedSurplusPositiveOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Conectores novos:

```lean
C2ExactGapAnchorCanonicalLowerFactorClearedSurplusOnMiddle_iff_anchorResidual
C2ExactGapAnchorCanonicalCollectedOnMiddle_of_lowerFactorSurplus
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_lowerFactorSurplus
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalLowerFactorSurplus
```

Leitura para continuar: basta provar positividade do saldo cleared:

```lean
0 <
  c2ExactGapAnchorCanonicalLowerFactorClearedSurplus
    K M horizontalConstant horizontalScale horizontalRatio s
```

Esse saldo ja esta expandido por:

```lean
c2ExactGapAnchorCanonicalLowerFactorClearedSurplus_eq_expanded
```

Verificacao feita:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
lake build LeanC2.AuditGenuineMiddleExactGapFrontier
```

Resultado: ambos passaram; o build ainda mostra apenas warnings antigos de
linha longa em `LeanC2/AuditGenuineMiddle.lean`.

## Atualizacao 2026-07-05: allowance/reserve fechado

O boleto `C2ExactGapAnchorCanonicalAllowanceReserveBudgetOnMiddle` foi quitado
em `LeanC2/AuditGenuineMiddleExactGapFrontier.lean`.

Novos nomes publicos:

```lean
C2ExactGapAnchorCanonicalAllowanceReserveBudget_of_offCriticalStrip
C2ExactGapAnchorCanonicalAllowanceReserveBudgetOnMiddle_closed
C2ExactGapAnchorCanonicalResidualMarginPositiveOnMiddle_closed
C2ExactGapAnchorCanonicalClearedMarginPositiveOnMiddle_closed
C2ExactGapAnchorCanonicalPrototypeRatioCover_of_closedAllowanceReserve
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_closedPrototypeRatioBoundsCover
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypeClosedRatioBoundsCover
```

Leitura operacional: nao precisa mais assumir margem residual positiva nem
allowance/reserve como hipotese. A frente atual reduz a provar:

```lean
C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioBoundsCover
  horizontalConstant horizontalScale horizontalRatio near edge
```

Com `hscale`, `hhorizontal` e esse cover, o wrapper fechado ja entrega
`genuineCentralDoubleSeries s ≠ 0`.

Verificacoes feitas:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
lake build LeanC2.AuditGenuineMiddleExactGapFrontier
rg -n "sorry|admit|axiom|unsafe|riemannZeta|ExactZeta|zetaUpper|zetaDepthCore|\bzeta\b" \
  LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

Resultado: Lean e build passaram; varredura sem matches. O build ainda mostra
warnings antigos de estilo em modulos de base.

## Atualizacao 2026-07-05: alvo agregado para o cover da atlas

O cover da atlas prototype foi reduzido a um alvo agregado em:

```text
LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

Novo alvo operacional:

```lean
C2ExactGapAnchorCanonicalPrototypePressureAggregateBoundsOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Ele pede, para cada ponto do middle:

```lean
c2ExactGapAnchorCanonicalClearedExternalPressureRatio
  K M horizontalConstant horizontalScale horizontalRatio s ≤ 5 / 8

c2ExactGapAnchorCanonicalClearedLowerFactorPressureRatio s ≤ 5 / 8

c2ExactGapAnchorCanonicalClearedExternalPressureRatio
    K M horizontalConstant horizontalScale horizontalRatio s +
  c2ExactGapAnchorCanonicalClearedLowerFactorPressureRatio s ≤ 3 / 4
```

Conectores novos:

```lean
C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioBoundsCover_of_aggregateBounds
C2ExactGapAnchorCanonicalPrototypeRatioCover_of_aggregateBounds
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypeAggregateBounds
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypeAggregateBounds
```

Leitura para retomada: com `hscale`, `hhorizontal` e o alvo agregado acima, a
cadeia ja entrega `genuineCentralDoubleSeries s ≠ 0`. O proximo trabalho real
e provar essas tres desigualdades de pressao normalizada sem engrossar os
custos.

Verificacoes feitas:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
lake build LeanC2.AuditGenuineMiddleExactGapFrontier
rg -n "sorry|admit|axiom|unsafe|riemannZeta|ExactZeta|zetaUpper|zetaDepthCore|\bzeta\b" \
  LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

Resultado: Lean e build passaram; varredura sem matches. O build ainda mostra
warnings antigos de estilo em modulos de base.

## Atualizacao 2026-07-05: proximo alvo ficou unico e sem divisao

O alvo anterior era provar tres bounds normalizados:

```lean
externalPressureRatio ≤ 5 / 8
lowerFactorPressureRatio ≤ 5 / 8
externalPressureRatio + lowerFactorPressureRatio ≤ 3 / 4
```

Isso foi refinado. A atlas ganhou duas janelas extremas:

```lean
c2ExactGapAnchorCanonicalPressureShareIndexEighthThreeQuarter
c2ExactGapAnchorCanonicalPressureShareIndexThreeQuarterEighth
```

Agora a rota passa por:

```lean
C2ExactGapAnchorCanonicalPrototypePressureTotalBoundsOnMiddle
C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBoundOnMiddle
C2ExactGapAnchorCanonicalPrototypePressureSurplusReserveBoundOnMiddle
```

`ClearedTotalBoundOnMiddle` e `SurplusReserveBoundOnMiddle` sao equivalentes:

```lean
C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBoundOnMiddle_iff_surplusReserve
```

Para retomar em novo chat, o alvo operacional mais fino e:

```lean
C2ExactGapAnchorCanonicalPrototypePressureSurplusReserveBoundOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Interpretacao: para cada `s` no middle, provar que o surplus limpo conserva
pelo menos `1 / 4` da margem exata limpa:

```lean
(1 / 4) * c2ExactGapAnchorCanonicalClearedMargin s ≤
  c2ExactGapAnchorCanonicalLowerFactorClearedSurplus
    K M horizontalConstant horizontalScale horizontalRatio s
```

Com `hscale`, `hhorizontal` e esse alvo, a cadeia ja entrega:

```lean
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypeSurplusReserve
```

Verificacoes feitas:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
lake build LeanC2.AuditGenuineMiddleExactGapFrontier
rg -n "sorry|admit|axiom|unsafe|riemannZeta|ExactZeta|zetaUpper|zetaDepthCore|\bzeta\b" \
  LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

Resultado: Lean e build passaram; varredura sem matches.

## Atualizacao 2026-07-05: retomada pelo quarter unit reserve

O alvo `SurplusReserveBoundOnMiddle` foi convertido para a forma unitaria do
lower factor:

```lean
C2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserveBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Equivalencia formal:

```lean
C2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserveBudgetOnMiddle_iff_surplusReserve
C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_iff_clearedTotalBound
```

Essa forma e:

```lean
c2ContinuedVerticalAnchorResidualExactLowerFactorUpper s ≤
  (clearedReserve - (1 / 4) * clearedMargin) / clearedWeight
```

Ela implica o unit reserve antigo:

```lean
C2ExactGapAnchorCanonicalLowerFactorClearedUnitReserveBudgetOnMiddle_of_quarterUnitReserve
```

e ja tem conector terminal:

```lean
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalQuarterUnitReserve
```

Leitura para novo chat: nao confundir com o unit reserve antigo. O antigo
prova apenas `0 < surplus`; o novo prova que sobra `1 / 4` da margem limpa.
Esse e agora o alvo mais fino para tentar quitar o custo lower-factor sem
estourar o caixa.

## Atualizacao 2026-07-05: PeerReview aponta para quarter unit reserve

O arquivo publico `LeanC2/PeerReview.lean` foi realinhado com a rota viva.
Ele nao expõe mais o endpoint antigo de middle canonico como certificado ativo.

API publica atual:

```lean
C2.PeerReview.CurrentMiddleRegion
C2.PeerReview.QuarterUnitMiddleObligation
C2.PeerReview.QuarterUnitMiddleCertificate
C2.PeerReview.genuineCentral_ne_zero_of_quarterUnitMiddleCertificate
```

O certificado publico atual carrega:

```lean
scale      : C2ExpandedScalarScaleData ...
horizontal : C2ExpandedHorizontalLayerBudget ...
quarterUnit :
  C2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserveBudgetOnMiddle ...
```

e entrega:

```lean
genuineCentralDoubleSeries s ≠ 0
```

na `CurrentMiddleRegion`.

Arquivos documentais tambem alinhados:

```text
modelo_livro_caixa_middle.md
ORIENTACAO_MIDDLE_GENUINE.md
AUDIT_MIDDLE_ROUTE_LEDGER_CURRENT.md
TEMP_STATUS_MIDDLE_GENUINE.md
```

Verificacao:

```bash
lake env lean LeanC2/PeerReview.lean
lake build LeanC2.PeerReview
```

Resultado: passou. Warnings remanescentes sao antigos/de dependencias.

## Atualizacao 2026-07-06: lower fino escolhido para o quarter-unit

O lower mais fino escolhido foi o lower no-loss da margem limpa:

```lean
c2ExactGapAnchorCanonicalClearedMarginAllowanceLower
```

Ele tem formula normada explicita:

```lean
c2ExactGapAnchorCanonicalClearedMarginAllowanceLower s =
  (‖q s‖ ^ 2 / (1 + ‖q s‖) -
      2 * ‖q s‖ ^ 6 / (1 - ‖q s‖ ^ 2)) *
    (1 - ‖q s‖) ^ 2
```

e no off-critical/middle coincide exatamente com:

```lean
c2ExactGapAnchorCanonicalClearedMargin s
```

Conector principal para continuar:

```lean
C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_iff_allowanceLower
```

Assim, o alvo vivo

```lean
C2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserveBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

pode ser tratado de forma equivalente como:

```lean
C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Leitura para novo chat: o proximo boleto e provar

```lean
D + G ≤ (3 / 4) *
  c2ExactGapAnchorCanonicalClearedMarginAllowanceLower s
```

com `D` sendo o external debit limpo e `G` o lower-factor cost limpo. Essa e a
forma mais refinada atual, porque nao troca `Q` por uma cota inferior mais
grossa.

Verificacao feita:

```bash
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

Resultado: passou sem saida.

## Estado mais recente 2026-07-06: retomar daqui

Retomar pelo alvo:

```lean
C2ExactGapAnchorCanonicalPrototypePressureComponentSumBoundOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Ele e o `SumBound` escrito como cinco boletos:

```text
genuine central pressure
continued central pressure
horizontal pressure
cutoff pressure
lower-factor pressure
```

Novos nomes principais:

```lean
c2ExactGapAnchorCanonicalClearedExternalPressureRatio_eq_componentSum
C2ExactGapAnchorCanonicalPrototypePressureSumBoundOnMiddle_of_componentSumBound
C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_componentSumBound
C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_of_componentSumBound
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypePressureComponentSumBound
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypePressureComponentSumBound
```

Proximo movimento: escolher bounds para os cinco boletos acima e provar que a
soma fica `≤ 3 / 4`. Nao voltar para `totalBounds/aggregateBounds` como alvo
principal, porque eles pedem bounds separados mais grossos.

## Estado mais recente 2026-07-06: cinco shares pontuais

Retomar preferencialmente pela interface:

```lean
C2ExactGapAnchorCanonicalPrototypePressureComponentShareBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio
  genuineShare continuedShare horizontalShare cutoffShare lowerFactorShare
  near edge
```

Ela reduz a prova a cinco boletos pointwise mais a soma dos shares:

```text
genuineCentralPressure ≤ genuineShare
continuedCentralPressure ≤ continuedShare
horizontalPressure ≤ horizontalShare
cutoffPressure ≤ cutoffShare
lowerFactorPressure ≤ lowerFactorShare

genuineShare + continuedShare + horizontalShare
  + cutoffShare + lowerFactorShare ≤ 3 / 4
```

Wrappers diretos:

```lean
C2ExactGapAnchorCanonicalPrototypePressureComponentSumBoundOnMiddle_of_componentShareBudget
C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_componentShareBudget
C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_of_componentShareBudget
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypePressureComponentShareBudget
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypePressureComponentShareBudget
```

Leitura para retomar: esta e a forma mais fina atual. As shares podem depender
de `s`, entao nao precisamos fechar a rota com constantes uniformes grosseiras
antes de saber o saldo real.

## Estado mais recente 2026-07-06: melhor escolha feita

Melhor escolha para seguir: baseline exata de shares.

```lean
C2ExactGapAnchorCanonicalPrototypePressureExactComponentShareBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Ela usa cada pressure como a propria share, portanto nao perde saldo. A
equivalencia formal com o component-sum e:

```lean
C2ExactGapAnchorCanonicalExactShareBudgetOnMiddle_iff_componentSumBoundOnMiddle
```

Wrappers diretos:

```lean
C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_exactShareBudget
C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_of_exactShareBudget
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_exactShareBudget
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactShareBudget
```

Retomada recomendada: usar a baseline exata como regua e substituir os shares
por uppers refinados um por vez. Nao escolher constantes uniformes agora.

## Estado mais recente 2026-07-06: primeiro boleto isolado

Primeiro boleto em andamento: genuine central pressure.

```lean
C2ExactGapAnchorCanonicalGenuinePressureShareBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio genuineShare near edge
```

Essa obrigacao so substitui o primeiro boleto por `genuineShare`; os outros
quatro ficam exatos. Forma operacional:

```text
genuineCentralPressure ≤ genuineShare
genuineShare + continuedCentralPressure + horizontalPressure
  + cutoffPressure + lowerFactorPressure ≤ 3 / 4
```

Wrappers diretos:

```lean
C2ExactGapAnchorCanonicalComponentSumBoundOnMiddle_of_genuinePressureShare
C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_genuinePressureShare
C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_of_genuinePressureShare
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_genuinePressureShare
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalGenuinePressureShare
```

Retomar escolhendo/provando uma `genuineShare` refinada antes de mexer nos
outros boletos.

## Estado mais recente 2026-07-06: primeiro boleto refinado por upper

Melhor escolha feita: nao escolher constante global para `genuineShare`.
Escolhemos uma share induzida por upper pontual apenas do numerador genuine:

```lean
c2ExactGapAnchorCanonicalGenuinePressureShareFromUpper genuineUpper
```

Ela preserva exatamente o fator

```text
(1 - ‖q s‖) * (1 + ‖q s‖)
```

e a margem limpa no denominador. O alvo operacional virou:

```lean
C2ExactGapAnchorCanonicalGenuinePressureUpperShareBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio genuineUpper near edge
```

Obrigacoes:

```text
c2GenuineCentralExactUpper s ≤ genuineUpper s
shareFromUpper + continuedCentralPressure + horizontalPressure
  + cutoffPressure + lowerFactorPressure ≤ 3 / 4
```

Wrappers diretos adicionados:

```lean
C2ExactGapAnchorCanonicalComponentSumBoundOnMiddle_of_genuineUpperShare
C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_genuineUpperShare
C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_of_genuineUpperShare
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_genuineUpperShare
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalGenuineUpperShare
```

Retomada recomendada: provar um upper refinado para
`c2GenuineCentralExactUpper` e depois checar a linha de caixa acima. Nao mexer
nos outros quatro boletos antes de fechar esse primeiro boleto, salvo se o
saldo mostrar que e necessario.

## Estado mais recente 2026-07-06: segundo boleto aberto, par central

Avancamos para o proximo boleto: `continued central pressure`. Como ele tem a
mesma geometria do genuine, foi criada a share refinada:

```lean
c2ExactGapAnchorCanonicalContinuedPressureShareFromUpper continuedUpper
```

O alvo operacional agora e o par central refinado:

```lean
C2ExactGapAnchorCanonicalCentralPairUpperShareBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio
  genuineUpper continuedUpper near edge
```

Obrigacoes:

```text
c2GenuineCentralExactUpper s ≤ genuineUpper s
c2ContinuedCentralExactUpper s ≤ continuedUpper s
genuineShareFromUpper + continuedShareFromUpper
  + horizontalPressure + cutoffPressure + lowerFactorPressure ≤ 3 / 4
```

Wrappers diretos:

```lean
C2ExactGapAnchorCanonicalComponentSumBoundOnMiddle_of_centralPairUpperShare
C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_centralPairUpperShare
C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_of_centralPairUpperShare
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_centralPairUpperShare
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalCentralPairUpperShare
```

Retomada recomendada: provar um `continuedUpper` refinado para
`c2ContinuedCentralExactUpper` e conferir a linha de caixa do par central. Os
boletos horizontal, cutoff e lower-factor ainda ficam exatos.

## Estado mais recente 2026-07-06: continued herdado do odd channel

Melhor escolha feita para o segundo boleto: nao escolher `continuedUpper`
abstrato nem constante global. A share continued agora usa:

```lean
c2ContinuedCentralFromOddUpper oddUpper
```

com ponte:

```lean
C2ExactGapAnchorCanonicalContinuedCentralUpperBound_of_oddChannelBound
C2ExactGapAnchorCanonicalContinuedCentralUpperBoundOnMiddle_of_oddChannel
```

Novo alvo operacional:

```lean
C2ExactGapAnchorCanonicalCentralPairOddShareBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio
  genuineUpper oddUpper near edge
```

Obrigacoes:

```text
c2GenuineCentralExactUpper s ≤ genuineUpper s
‖continuedOddDirichletChannel s‖ ≤ oddUpper s
genuineShareFromUpper
  + continuedShareFromUpper (c2ContinuedCentralFromOddUpper oddUpper)
  + horizontalPressure + cutoffPressure + lowerFactorPressure ≤ 3 / 4
```

Wrappers diretos:

```lean
C2ExactGapAnchorCanonicalComponentSumBoundOnMiddle_of_centralPairOddShare
C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_centralPairOddShare
C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_of_centralPairOddShare
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_centralPairOddShare
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalCentralPairOddShare
```

Retomada recomendada: provar/refinar `oddUpper` para
`continuedOddDirichletChannel` e conferir o saldo do par central. Os boletos
horizontal, cutoff e lower-factor continuam exatos.

## Estado mais recente 2026-07-06: oddUpper provado no-loss

O `oddUpper` foi fechado na forma no-loss:

```lean
c2ContinuedOddExactUpper
c2ContinuedOddChannelBound_exact
```

Nova superficie operacional:

```lean
C2ExactGapAnchorCanonicalCentralPairExactOddShareBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio genuineUpper near edge
```

Ela remove a obrigacao explicita
`‖continuedOddDirichletChannel s‖ ≤ oddUpper s`, pois usa diretamente:

```lean
oddUpper = c2ContinuedOddExactUpper
```

Linha de caixa restante:

```text
genuineShareFromUpper
  + continuedShareFromUpper
      (c2ContinuedCentralFromOddUpper c2ContinuedOddExactUpper)
  + horizontalPressure + cutoffPressure + lowerFactorPressure ≤ 3 / 4
```

Wrappers diretos:

```lean
C2ExactGapAnchorCanonicalComponentSumBoundOnMiddle_of_centralPairExactOdd
C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_centralPairExactOdd
C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_of_centralPairExactOdd
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_centralPairExactOdd
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalCentralPairExactOdd
```

Retomada recomendada: trabalhar na linha de caixa exact-odd. Se ela ficar cara
demais, o proximo refinamento natural e substituir `c2ContinuedOddExactUpper`
por um upper estrutural menor do canal odd.

## Estado mais recente 2026-07-06: caixa exact-odd isolado

Confirmacao: ainda estamos no **segundo boleto**. A obrigacao de `oddUpper`
ja foi fechada sem perda; o que falta agora e apenas conferir se a linha de
caixa do par central cabe no orcamento `3 / 4`.

Nova superficie isolada:

```lean
C2ExactGapAnchorCanonicalCentralPairExactOddCashBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio genuineUpper near edge
```

Equivalencia provada:

```lean
C2ExactGapAnchorCanonicalCentralPairExactOddShareBudgetOnMiddle_iff_cash
```

Aliases operacionais:

```lean
C2ExactGapAnchorCanonicalCentralPairExactOddShareBudgetOnMiddle_of_cash
C2ExactGapAnchorCanonicalCentralPairExactOddCashBudgetOnMiddle_of_shareBudget
```

Horizonte imediato: provar o `genuineUpper` no middle e fechar
`C2ExactGapAnchorCanonicalCentralPairExactOddCashBudgetOnMiddle`. Se essa soma
estourar, o refinamento natural ainda e procurar um upper estrutural menor que
`c2ContinuedOddExactUpper` para o canal odd continued.

## Estado mais recente 2026-07-06: caixa exact-odd virou overshoot vs slack

A soma exact-odd foi conferida por limpeza de denominadores. Com a escolha
mais fina para o primeiro boleto,

```lean
genuineUpper = c2GenuineCentralExactUpper
```

o caixa fica equivalente a pagar o custo extra do continued herdado do canal
odd:

```lean
c2ExactGapAnchorCanonicalCentralPairExactOddContinuedClearedOvershoot
c2ExactGapAnchorCanonicalExactOddCashSlack
C2ExactGapAnchorCanonicalExactOddOvershootReserve_iff_slack
```

Leitura operacional:

```text
continuedOvershoot ≤ exactOddCashSlack
```

Ponte final ja provada:

```lean
C2ExactGapAnchorCanonicalExactOddShareBudgetOnMiddle_of_overshoot
```

Conclusao: o boleto ainda nao fechou automaticamente. A soma cabe exatamente
se o overshoot couber no slack restante. Proximo alvo recomendado: provar
`C2ExactGapAnchorCanonicalCentralPairExactOddOvershootReserveBudgetOnMiddle`
ou trocar para uma rota `gapUpper` mais fina se esse overshoot ficar caro.

## Estado mais recente 2026-07-06: exact-odd exige excedente alem de 1/4

O boleto exact-odd foi reescrito na contabilidade de surplus ja existente. A
nova leitura e:

```lean
c2ExactGapAnchorCanonicalExactOddSurplusAfterQuarter
c2ExactGapAnchorCanonicalExactOddCashSlack_eq_surplusAfterQuarter
C2ExactGapAnchorCanonicalExactOddOvershootReserve_iff_surplusAfterQuarter
C2ExactGapAnchorCanonicalExactOddOvershootOnMiddle_iff_surplusAfterQuarter
```

Ponte final:

```lean
C2ExactGapAnchorCanonicalExactOddShareBudgetOnMiddle_of_surplusAfterQuarter
```

Interpretacao:

```text
continuedOvershoot ≤ surplus depois de reservar 1/4 da margem limpa
```

O ponto importante: a reserva ordinaria de `1/4` apenas recupera o pagamento
normal `D + L ≤ 3/4 * Q`. Ela nao paga automaticamente o overshoot gerado por
`c2ContinuedCentralFromOddUpper c2ContinuedOddExactUpper`.

Conclusao operacional: o boleto exact-odd continua vivo, mas agora sabemos que
ele precisa de excedente real alem da reserva obrigatoria. Se esse excedente
nao aparecer, a rota mais promissora e pivotar para `ExactGapCollected` /
`ExactWeightedEnvelopeLedger`, porque ela mede o canal pela distancia phase-aware
ate `1/2` e evita esse overshoot do norm-only odd channel.

## Estado mais recente 2026-07-06: scanner numerico invalidado para rota ativa

O bloco anterior de laboratorio numerico do exact-odd foi invalidado como guia
da rota middle Genuine-First. Ele usa um canal diagnostico externo ao objeto
geometrico C2/genuine e nao mede o livro-caixa do quarteto como prova local.

Regra de retomada: nao usar esse scanner para classificar `exact-odd`,
`phase-aware`, `edge split`, lower-factor, nem qualquer outro alvo ativo. A
continuidade deve vir apenas de objetos Lean genuine/C2 e de desigualdades
internas ao modelo.

## Estado mais recente 2026-07-06: collected slack canonico no Lean

Decisao tomada por criterio formal interno: nao abrir uma rota `edge` agora.
A frente ativa voltou para a
contabilidade phase-aware mais fina, mantendo o middle inteiro na rota
genuine-first.

Arquivo Lean alterado:

```text
LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

Novos objetos formais:

```lean
c2ExactGapAnchorCanonicalExactGapCollectedSlack
C2ExactGapAnchorCanonicalExactGapCollectedSlackPositive
C2ExactGapAnchorCanonicalExactGapCollectedSlackPositiveOnMiddle
c2ExactGapAnchorCanonicalExactGapCollectedSlack_eq_sharpSurplus
C2ExactGapAnchorCanonicalExactGapCollectedSlackPositive_iff_sharpSurplus
C2ExactGapAnchorCanonicalExactGapCollectedBudget_iff_collectedSlackPositive
C2ExactGapAnchorCanonicalExactGapCollectedOnMiddle_iff_collectedSlackPositive
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactGapCollectedSlack
```

Interpretacao: o boleto `ExactGapCollected` agora pode ser lido como uma unica
positividade canonica:

```lean
C2ExactGapAnchorCanonicalExactGapCollectedSlackPositiveOnMiddle
```

Essa positividade e equivalente ao budget coletado canonico e tambem ao
`ExactHalfDiskSharpSurplus`. Assim, se provarmos esse slack no middle, a ponte
ja entrega:

```lean
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle
```

Validacao executada:

```text
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

Resultado: compilou limpo. A busca por termos zeta no arquivo da frente ativa
nao retornou ocorrencias.

Horizonte ao retomar: atacar diretamente
`C2ExactGapAnchorCanonicalExactGapCollectedSlackPositiveOnMiddle`, procurando
um lower/upper genuinamente mais fino para debitos externos/lower-factor antes
de tentar qualquer separacao de edge.

## Estado mais recente 2026-07-06: conta collected slack fechada por ledger no-loss

Foi fechado no Lean o encadeamento formal da conta phase-aware:

```lean
C2ExactGapAnchorCanonicalExactGapCollectedSlackOnMiddle_of_collected
C2ExactGapAnchorCanonicalExactGapCollectedSlackOnMiddle_of_anchorResidualCleared
C2ExactGapAnchorCanonicalExactGapCollectedSlackOnMiddle_of_lowerFactorUnitReserve
C2ExactGapAnchorCanonicalExactGapCollectedSlackOnMiddle_of_lowerFactorSurplus
C2ExactGapAnchorCanonicalExactGapCollectedSlackOnMiddle_of_clearedEnvelopeLedger
C2ExactGapAnchorCanonicalExactGapCollectedSlackOnMiddle_of_weightedLedger
C2ExactGapAnchorCanonicalExactGapCollectedSlackOnMiddle_of_exactWeightedEnvelopeLedger
```

Tambem foi adicionado o wrapper direto de nao-anulamento:

```lean
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactGapCollectedSlack
```

No `LeanC2/PeerReview.lean`, a API publica agora expoe a frente atual:

```lean
CollectedSlackMiddleObligation
CollectedSlackMiddleCertificate
CollectedSlackMiddleCertificate.nonvanishing
genuineCentral_ne_zero_of_collectedSlackMiddleCertificate
```

Interpretacao: a positividade do `CollectedSlack` nao ficou mais solta. Ela e
consequencia direta do `ExactWeightedEnvelopeLedgerBudgetOnMiddle`, que e o
certificado no-loss mais fino da rota phase-aware. Isso fecha a contabilidade
formal dessa frente; o proximo gargalo real e produzir/provar o ledger no-loss
ou um builder dele com upper/lower suficientemente refinados.

Validacoes:

```text
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
lake build LeanC2.AuditGenuineMiddleExactGapFrontier
lake env lean LeanC2/PeerReview.lean
lake build LeanC2.PeerReview
lake build LeanC2
```

Todas passaram. A busca por termos zeta nos arquivos ativos tocados nao
retornou ocorrencias.

## Estado mais recente 2026-07-06: proximo alvo refinado para PrototypeRatioBounds

O gargalo `ExactWeightedEnvelopeLedgerBudgetOnMiddle` foi refinado. Em vez de
tentar provar a ledger no-loss inteira diretamente, o menor alvo promissor agora
e o cover finito de razoes:

```lean
C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioBoundsCover
```

Motivo: o Lean ja tem o fechamento automatico da parte allowance/reserve, entao
este cover de razoes fecha a ledger no-loss pela rota:

```lean
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_closedPrototypeRatioBoundsCover
```

Foi adicionada a ponte direta para a frente atual:

```lean
C2ExactGapAnchorCanonicalExactGapCollectedSlackOnMiddle_of_closedPrototypeRatioBoundsCover
```

E a API publica agora expoe esse proximo alvo refinado:

```lean
PrototypeRatioBoundsMiddleObligation
PrototypeRatioBoundsMiddleCertificate
PrototypeRatioBoundsMiddleCertificate.toCollectedSlackCertificate
PrototypeRatioBoundsMiddleCertificate.nonvanishing
genuineCentral_ne_zero_of_prototypeRatioBoundsMiddleCertificate
```

Interpretacao operacional: o proximo boleto real nao e mais
`ExactWeightedEnvelopeLedgerBudgetOnMiddle` como bloco grande. Ele foi reduzido
para provar que, em todo ponto do middle, as duas razoes normalizadas

```lean
c2ExactGapAnchorCanonicalClearedExternalPressureRatio
c2ExactGapAnchorCanonicalClearedLowerFactorPressureRatio
```

caem em alguma janela do atlas prototipo. Isso preserva a rota fina e evita
voltar para os pagamentos grossos.

Validacoes:

```text
lake build LeanC2.AuditGenuineMiddleExactGapFrontier
lake build LeanC2.PeerReview
lake build LeanC2
```

Todas passaram. A busca zeta nos arquivos Lean ativos tocados nao retornou
ocorrencias.

## Estado mais recente 2026-07-06: alvo refinado para ClearedTotalBound

Refinamos mais um nivel. O `PrototypeRatioBoundsCover` continua valido como
ponte, mas nao precisa ser o boleto publico imediato. O alvo mais fino agora e
a conta division-free:

```lean
C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBoundOnMiddle
```

Em termos de livro caixa, esta e a linha:

```text
clearedExternalDebit + clearedLowerFactorCost <= (3 / 4) * clearedMargin
```

Ou seja, pagamos os custos externos/lower-factor com no maximo `3/4 * Q`,
preservando a folga de `1/4 * Q`. O Lean ja reconstrui as razoes e o cover do
atlas a partir disso usando `scale`.

Nova ponte interna:

```lean
C2ExactGapAnchorCanonicalExactGapCollectedSlackOnMiddle_of_prototypeClearedTotalBound
```

Nova API publica:

```lean
PrototypeClearedTotalMiddleObligation
PrototypeClearedTotalMiddleCertificate
PrototypeClearedTotalMiddleCertificate.toPrototypeRatioBoundsCertificate
PrototypeClearedTotalMiddleCertificate.toCollectedSlackCertificate
PrototypeClearedTotalMiddleCertificate.nonvanishing
genuineCentral_ne_zero_of_prototypeClearedTotalMiddleCertificate
```

Horizonte operacional: atacar primeiro o `PrototypeClearedTotalMiddleObligation`.
Ele e mais fino que pedir a ledger inteira e mais limpo que provar diretamente
o cover do atlas, porque evita carregar as divisoes como alvo principal.

Validacoes ja feitas nesta etapa:

```text
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
lake build LeanC2.AuditGenuineMiddleExactGapFrontier
lake build LeanC2.PeerReview
lake build LeanC2
```

A busca zeta nos arquivos Lean ativos tocados nao retornou ocorrencias.

## Estado mais recente 2026-07-06: diagnostico externo descartado

O diagnostico numerico baseado em `audit_exact_odd_overshoot_points.csv` foi
removido como criterio de decisao da rota ativa. Pela disciplina
Genuine-First, ele nao deve ser usado para
afirmar que um alvo cabe, nao cabe, esta morto ou deve ser substituido.

O fato formal que permanece util e independente desse diagnostico:

```lean
c2GenuineCentralExactUpper    = fun s => ‖genuineCentralDoubleSeries s‖
c2ContinuedCentralExactUpper  = fun s => ‖continuedCentralOddChannel s‖
```

A rota defect-aware segue apenas como candidata estrutural C2/genuine, a ser
explorada por provas e bounds internos, sem usar zeta como guia.

## Estado mais recente 2026-07-06: conta exata da reserva formalizada

A conta exact/no-loss por componentes foi comparada diretamente com o alvo
publico `PrototypeClearedTotal`. Resultado: nao ha perda escondida nessa
reescrita. O ledger:

```text
(1 / 4) * Q <= Q - D - G
```

foi provado equivalente a:

```text
D + G <= (3 / 4) * Q
```

no nivel interno e no nivel publico.

Novas equivalencias internas:

```lean
C2ExactGapAnchorCanonicalExactComponentLedger_iff_clearedTotalBound
C2ExactGapAnchorCanonicalExactComponentLedgerOnMiddle_iff_clearedTotalBound
```

Nova API publica:

```lean
ExactComponentSurplusReserveMiddleObligation_iff_prototypeClearedTotalMiddleObligation
ExactComponentSurplusReserveMiddleCertificate.toPrototypeClearedTotalCertificate
PrototypeClearedTotalMiddleCertificate.toExactComponentSurplusReserveCertificate
```

Leitura operacional: a conta exata da reserva esta limpa, mas ela nao prova
sozinha a desigualdade de caixa. O alvo substantivo restante e provar
`PrototypeClearedTotalMiddleObligation`, ou de forma equivalente
`ExactComponentSurplusReserveMiddleObligation`, com bounds reais para os
componentes de `D` e `G`. Se a conta estourar, o refinamento deve ser local:
identificar qual componente consome a folga e trocar apenas esse componente por
uma estimativa mais fina.

## Estado mais recente 2026-07-06: alvo de slack por componentes

O `ClearedTotal` foi aberto em uma lente operacional de cinco boletos. Foram
adicionados slacks normalizados:

```lean
c2ExactGapAnchorCanonicalPressureSlackAfterCentralPair
c2ExactGapAnchorCanonicalPressureSlackAfterHorizontal
c2ExactGapAnchorCanonicalPressureSlackAfterCutoff
c2ExactGapAnchorCanonicalPressureSlackAfterLowerFactor
```

Equivalencias internas novas:

```lean
C2ExactGapAnchorCanonicalComponentSumBound_iff_lowerFactor_le_slack
C2ExactGapAnchorCanonicalComponentSumBound_iff_cutoff_lower_le_slack
C2ExactGapAnchorCanonicalComponentSumBound_iff_tail_le_centralSlack
C2ExactGapAnchorCanonicalComponentSumBound_iff_slack_nonneg
C2ExactGapAnchorCanonicalComponentSumBound_iff_sumBound
C2ExactGapAnchorCanonicalClearedTotalBound_iff_componentSumBound
C2ExactGapAnchorCanonicalClearedTotalOnMiddle_iff_componentSumOnMiddle
```

Nova API publica de diagnostico:

```lean
PrototypeComponentSumMiddleObligation
LowerFactorAfterCutoffSlackMiddleObligation
PrototypeClearedTotalMiddleObligation_iff_componentSumMiddleObligation
PrototypeComponentSumMiddleObligation_iff_lowerFactorAfterCutoffSlack
PrototypeClearedTotalMiddleObligation_iff_lowerFactorAfterCutoffSlack
```

Leitura operacional para retomar: o proximo alvo mais fino e provar
`LowerFactorAfterCutoffSlackMiddleObligation`, isto e,

```text
lowerFactorPressure <= slack depois de pagar central + horizontal + cutoff
```

Se esse alvo nao couber, usar as equivalencias anteriores para descobrir onde
refinar: primeiro `cutoff + lower`, depois `horizontal + cutoff + lower`, e so
entao voltar ao par central.

## Estado mais recente 2026-07-06: escolha refinada exact/no-loss por componentes

Escolhemos a frente mais fina possivel antes de introduzir aproximacoes
numericas: em vez de escolher um `surplusLower` opaco, ele agora e construido
por componentes:

```text
surplusLower = marginLower - externalDebitUpper - lowerFactorCostUpper
```

Com isso, a ledger ativa refinada fica:

```text
(1 / 4) * marginUpper
  <= marginLower - externalDebitUpper - lowerFactorCostUpper
```

A especializacao mais fina no vocabulario atual e a rota exact/no-loss:

```text
marginUpper          = clearedMargin
marginLower          = clearedMargin
externalDebitUpper   = clearedExternalDebit
lowerFactorCostUpper = clearedLowerFactorCost
```

Essa escolha nao joga constante grosseira no caixa. Ela preserva exatamente a
contabilidade `Q - D - G` e deixa o proximo alvo equivalente a provar que os
custos exatos deixam pelo menos `1/4 * Q` de reserva.

Novas pecas internas:

```lean
c2ExactGapAnchorCanonicalLowerFactorClearedSurplusLowerFromComponents
C2ExactGapAnchorCanonicalPrototypeSurplusReserveComponentLedgerOnMiddle
C2ExactGapAnchorCanonicalPrototypePressureSurplusReserveBoundOnMiddle_of_componentLedger
C2ExactGapAnchorCanonicalExactGapCollectedSlackOnMiddle_of_componentSurplusReserve
```

Nova API publica:

```lean
ComponentSurplusReserveMiddleObligation
ComponentSurplusReserveMiddleCertificate
ExactComponentSurplusReserveMiddleObligation
ExactComponentSurplusReserveMiddleCertificate
genuineCentral_ne_zero_of_exactComponentSurplusReserveMiddleCertificate
```

Horizonte operacional: atacar primeiro
`ExactComponentSurplusReserveMiddleObligation`. Ele fixa os envelopes mais
refinados possiveis; se a conta falhar numericamente, ai sim trocamos apenas
o componente problematico por um upper/lower certificado, sem gastar folga onde
nao precisa.

Validacoes ja feitas nesta etapa:

```text
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
lake env lean LeanC2/PeerReview.lean
lake build LeanC2.AuditGenuineMiddleExactGapFrontier
lake build LeanC2.PeerReview
lake build LeanC2
```

A busca zeta nos arquivos Lean ativos tocados nao retornou ocorrencias.

## Estado mais recente 2026-07-06: SurplusReserve reduzido a bounded ledger

O alvo `SurplusReserve` foi quebrado em tres boletos menores:

```text
clearedMargin <= marginUpper
surplusLower <= lowerFactorClearedSurplus
(1 / 4) * marginUpper <= surplusLower
```

Se esses tres fecham no middle, entao fecha automaticamente:

```lean
C2ExactGapAnchorCanonicalPrototypePressureSurplusReserveBoundOnMiddle
```

Novas pecas internas:

```lean
C2ExactGapAnchorCanonicalClearedMarginUpperBoundOnMiddle
C2ExactGapAnchorCanonicalLowerFactorClearedSurplusLowerBoundOnMiddle
C2ExactGapAnchorCanonicalPrototypeSurplusReserveBoundedLedgerOnMiddle
C2ExactGapAnchorCanonicalPrototypePressureSurplusReserveBoundOnMiddle_of_boundedLedger
C2ExactGapAnchorCanonicalExactGapCollectedSlackOnMiddle_of_boundedSurplusReserve
```

Nova API publica:

```lean
BoundedSurplusReserveMiddleObligation
BoundedSurplusReserveMiddleCertificate
BoundedSurplusReserveMiddleCertificate.toPrototypeSurplusReserveCertificate
BoundedSurplusReserveMiddleCertificate.toCollectedSlackCertificate
BoundedSurplusReserveMiddleCertificate.nonvanishing
genuineCentral_ne_zero_of_boundedSurplusReserveMiddleCertificate
```

Horizonte operacional: o proximo alvo pratico e escolher bounds refinados
`marginUpper` e `surplusLower`, evitando bounds grosseiros que possam consumir
a folga `1/4 * Q`.

Validacoes ja feitas nesta etapa:

```text
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
lake build LeanC2.AuditGenuineMiddleExactGapFrontier
lake build LeanC2.PeerReview
lake build LeanC2
```

A busca zeta nos arquivos Lean ativos tocados nao retornou ocorrencias.

## Estado mais recente 2026-07-06: alvo refinado para SurplusReserve

O `ClearedTotalBound` foi refinado para a forma equivalente que fala
diretamente da folga que queremos preservar:

```lean
C2ExactGapAnchorCanonicalPrototypePressureSurplusReserveBoundOnMiddle
```

Livro caixa:

```text
(1 / 4) * clearedMargin <= lowerFactorClearedSurplus
```

Isto e a mesma conta de `D + G <= 3/4 * Q`, mas escrita do lado da reserva:
em vez de provar que os custos cabem em `3/4 * Q`, o proximo alvo prova
diretamente que sobra pelo menos `1/4 * Q`.

Nova ponte interna:

```lean
C2ExactGapAnchorCanonicalExactGapCollectedSlackOnMiddle_of_prototypeSurplusReserve
```

Nova API publica:

```lean
PrototypeSurplusReserveMiddleObligation
PrototypeSurplusReserveMiddleCertificate
PrototypeSurplusReserveMiddleCertificate.toPrototypeClearedTotalCertificate
PrototypeSurplusReserveMiddleCertificate.toCollectedSlackCertificate
PrototypeSurplusReserveMiddleCertificate.nonvanishing
genuineCentral_ne_zero_of_prototypeSurplusReserveMiddleCertificate
```

Horizonte operacional: atacar primeiro
`PrototypeSurplusReserveMiddleObligation`. Essa e a forma mais alinhada com o
objetivo de nao estourar a folga `1/4 * Q`.

Validacoes desta etapa:

```text
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
lake build LeanC2.AuditGenuineMiddleExactGapFrontier
lake build LeanC2.PeerReview
lake build LeanC2
```

A busca zeta nos arquivos Lean ativos tocados nao retornou ocorrencias.

## Estado mais recente 2026-07-06: correcao de procedimento

A checagem anterior usou um diagnostico externo ao objeto geometrico
C2/genuine. Pelo protocolo Genuine-First, esse diagnostico nao deve orientar a
rota ativa do middle. Ele fica descartado como criterio de prova e nao conta
como evidencia para fechar, matar ou escolher um alvo Lean.

O que permanece valido por leitura puramente formal do Lean:

```lean
c2GenuineCentralExactUpper    = fun s => ‖genuineCentralDoubleSeries s‖
c2ContinuedCentralExactUpper  = fun s => ‖continuedCentralOddChannel s‖
```

Assim, a forma atual de cinco boletos paga dois modulos centrais separados.
Isso e apenas uma leitura formal da definicao, nao uma classificacao de custo.
Nenhuma rota foi morta por essa checagem invalida. A frente defect-aware fica
apenas como objeto formal disponivel, e so pode ser escolhida por argumentos
genuine/C2 internos.

Objetos Lean genuine/C2 para retomar:

```lean
PositiveBoxCentralDefectUpperBoundOnBox
positiveBoxCentralDefectExactUpper
PositiveBoxExactGapAnchorActiveDefectCandidateScalarBudgetResolventOnBox
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeDefectCandidateResolventBudget
```

## Estado mais recente 2026-07-06: operador finito genuine-first

Objeto Lean correto da frente atual:

```lean
C2.PeerReview.CollectedSlackMiddleObligation
C2.PeerReview.PrototypeClearedTotalMiddleObligation
C2.PeerReview.PrototypeSurplusReserveMiddleObligation
```

O operador formal que vem da near-axis e alimenta o middle e:

```lean
c2OddTailContinuedBalancingSeedBulkModel
```

O alvo local estrutural ainda aparece como:

```lean
C2CanonicalClosedScaledLocalData
```

mas o livro-caixa refinado atual mede:

```text
Q = c2ExactGapAnchorCanonicalClearedMargin
D = c2ExactGapAnchorCanonicalClearedExternalDebit
G = c2ExactGapAnchorCanonicalClearedLowerFactorCost

D + G <= (3 / 4) * Q
```

Varredura dos scripts em `operadores/`: o arquivo existente mais proximo era
`operadores/c2_genuine_operator_only_cpu.py`, porque usa o operador genuine
finito por canais C2 e nao compara com zeros externos. Mesmo assim ele e um
scanner global `D - B` com cutoff exponencial, nao um medidor fiel do
livro-caixa do middle.

Foi criado o laboratorio mais alinhado com o Lean:

```text
operadores/c2_middle_genuine_ledger.py
```

Ele calcula a identidade finita:

```lean
rectangularGenuine s K M
  = rectangularDirect s K M - rectangularBracket s K M
  = 2 * (sum k=2..K q(s)^k) * (sum m odd<=M m^(-s))
```

e mede, em moeda do middle:

```text
cleared_margin
external_ratio
lower_factor_ratio
total_ratio
quarter_surplus_ratio = 3/4 - total_ratio
```

Os canais centrais infinitos/continuados sao representados no script por
referencias finitas C2 (`ref-K/ref-M` e `continued-ref-K/continued-ref-M`).
Por padrao a referencia e retangular crua (`--reference-mode raw`). Para
testes numericos mais estaveis no eixo critico, o script tambem aceita as
regularizacoes C2 finitas ja presentes no Lean:

```text
--reference-mode exponential
--reference-mode supergaussian --reference-X <X> --reference-p <p>
```

Isso e apenas laboratorio numerico genuine-first, nao prova Lean. A coluna
`ref_delta` deve ser usada para auditar estabilidade do truncamento antes de
qualquer conclusao sobre folga.

Validacao feita:

```bash
python3 -m py_compile operadores/c2_middle_genuine_ledger.py
python3 operadores/c2_middle_genuine_ledger.py \
  --t-min 1 --t-max 5 --dt 1 \
  --ref-K 12 --ref-M 101 \
  --continued-ref-K 12 --continued-ref-M 101 \
  --check-ref-K 14 --check-ref-M 151 \
  --horizontal-ratio-mode qnorm \
  --horizontal-constant 0 \
  --csv audit_outputs/c2_middle_genuine_ledger_smoke.csv
```

Resultado metodologico: a fatoracao finita bateu numericamente
(`max_factorization_error` da ordem de `1e-16`). A amostra tambem mostrou
`max_ref_delta` grande, entao ela vale so como teste de encanamento. Nao usar
essa amostra para matar rota ou concluir estouro de caixa.

Validacao adicional:

```bash
python3 operadores/c2_middle_genuine_ledger.py \
  --t 10 \
  --reference-mode supergaussian \
  --reference-X 10661 \
  --reference-p 2 \
  --ref-K 12 --ref-M 101 \
  --continued-ref-K 12 --continued-ref-M 101 \
  --check-ref-K 14 --check-ref-M 151 \
  --horizontal-ratio-mode qnorm
```

O modo regularizado rodou corretamente. Com cortes pequenos ainda nao houve
estabilidade (`ref_delta` continuou grande), entao o proximo trabalho numerico
e uma varredura de estabilidade em `K/M/X/p`, nao tirar conclusao sobre o
caixa.

## Estado mais recente 2026-07-06: escolha dos cortes finitos

Foi criado o varredor paralelo:

```text
operadores/c2_middle_reference_stability_sweep.py
```

Ele compara niveis consecutivos `(K,M) -> (K',M')` e mede:

```text
max_ref_delta
p95_ref_delta
max_total_delta
max_total_ratio
min_quarter_surplus_ratio
```

Rodadas principais:

```bash
python3 operadores/c2_middle_reference_stability_sweep.py \
  --t-min 1 --t-max 50 --dt 0.25 \
  --levels 12:4001,13:6001,14:8001,15:10001,16:12001,17:16001,18:24001 \
  --modes supergaussian --x-list 10661 --p-list 2 \
  --threads 56 \
  --csv audit_outputs/c2_middle_stability_super_p2_x10661_refined_dt025.csv
```

Resultado para `supergaussian`, `X=10661`, `p=2`:

```text
minimo aceitavel:
  K=14, M=8001
  check=(15,10001)
  max_ref_delta ~= 6.976e-05
  max_total_delta ~= 9.211e-03

recomendado:
  K=15, M=10001
  check=(16,12001)
  max_ref_delta ~= 3.228e-07
  max_total_delta ~= 4.250e-05

alta confianca:
  K=16, M=12001
  check=(17,16001)
  max_ref_delta ~= 5.087e-10
  max_total_delta ~= 6.740e-08
```

Escolha operacional: usar `supergaussian`, `X=10661`, `p=2`,
`K=16`, `M=12001` quando quisermos maxima confianca numerica; usar
`K=15`, `M=10001` quando quisermos uma versao menor mas ainda bem estavel.

Comparativo amplo salvo em:

```text
audit_outputs/c2_middle_stability_modes_x_p_dt025.csv
```

Ele mostrou cortes menores para regularizacoes mais agressivas, por exemplo
`supergaussian X=5000 p=4 K=11 M=3001`, mas essa escolha e menos fiel ao
operador de referencia por usar escala menor e cutoff mais agressivo. Por isso
ela deve ficar como diagnostico auxiliar, nao como padrao principal.

O modo `raw` foi testado em:

```text
audit_outputs/c2_middle_stability_raw_dt025.csv
```

Resultado: nao estabilizou; `max_ref_delta` cresce com os cortes no eixo
critico. Nao usar `raw` como referencia numerica de folga no middle.

CSVs detalhados do ledger:

```text
audit_outputs/c2_middle_ledger_recommended_super_p2_x10661_K15_M10001.csv
audit_outputs/c2_middle_ledger_high_conf_super_p2_x10661_K16_M12001.csv
```

Observacao importante: nesses CSVs, com a forma atual que paga dois uppers
centrais separados, o `total_ratio` numerico ainda fica muito acima de `3/4`.
Isso nao mata a rota, porque o objetivo desta etapa era escolher cortes
confiaveis para o operador finito. A leitura metodologica e que, com cortes
estaveis em maos, o proximo alvo Lean deve procurar uma conta mais fina para
os boletos centrais/lower-factor, em vez de confiar em upper separado grosseiro.

## Atualizacao: refinamento do cutoff e decisao sobre o anchor

O script `operadores/c2_middle_genuine_ledger.py` foi refinado para medir uma
conta defect/anchor separada. Novas colunas relevantes no CSV:

```text
anchor_allowance
defect_upper
continued_anchor_abs
defect_allowance
defect_anchor_ratio
defect_anchor_surplus_ratio
```

Tambem foi adicionado:

```text
--target-reference-mode raw|exponential|supergaussian
```

Motivo: comparar o retangulo cru com uma referencia supergaussiana inflava o
cutoff artificialmente. Quando o alvo tambem e supergaussiano, o cutoff cai de
centenas para aproximadamente `1.8e-8`.

Rodada principal:

```text
audit_outputs/c2_middle_ledger_high_conf_super_p2_x10661_K16_M12001_target_super_ref17_defect_refined.csv
```

Resultado:

```text
cutoff_pressure_ratio ~= 1.8e-8
worst_defect_anchor_ratio ~= 143.44 em t=1
anchor_allowance ~= 0.0419733
continued_anchor_abs ~= 6.02068 em t=1
defect_upper = 0 no teste com mesma referencia finita
```

Varredura auxiliar em `X,p` mostrou:

```text
melhor fiel testado: X=2500, p=1
  max_defect_anchor_ratio ~= 49.46

escala artificial muito pequena: X=10, p=1
  max_defect_anchor_ratio ~= 2.58
```

Leitura: o refinamento matou o vilao do cutoff, mas nao colocou o upper
anchor/lower dentro do orcamento. A rota exact-gap/lower-factor nao parece a
frente promissora para fechar o middle. O proximo alvo recomendado e voltar
para a rota genuine-first do quarteto ajustado / margem oscilatoria, onde o
pagamento e `main - defect - tail > 0` e nao passa por esse anchor que ficou
caro.

Tambem foi exposto em `LeanC2/PeerReview.lean`:

```text
C2.PeerReview.CanonicalMiddleObligation
C2.PeerReview.ContinuationTerminalCertificate
C2.PeerReview.riemannHypothesis_of_continuationTerminalCertificate
```

`lake env lean LeanC2/PeerReview.lean` passou. Esses nomes deixam a superficie
publica consistente com os arquivos de auditoria; a barreira formal contra o
`C2CanonicalClosedScaledLocalData` direto continua registrada em
`LeanC2/AuditMiddleBarrier.lean`.

## Mapa real das rotas

```text
MAPA_ROTAS_MIDDLE_GENUINE_ATUAL.md
```

Esse arquivo foi revisado em 2026-07-08 para ser o mapa real do workspace.
Ele separa explicitamente:

- rota formal de contabilidade dos boletos;
- frente recomendada apos o diagnostico numerico;
- boletos pagos em Lean;
- diagnosticos numericos ainda nao formalizados;
- itens ainda nao pagos;
- rotas vivas;
- rotas mortas ou fora da rota ativa.

Resumo corrigido: se o assunto for "boletos", o mapa formal e a rota
exact-gap/quarter-unit:

```text
D + G <= 3/4 Q
```

Essa rota passa por:

```text
C2.PeerReview.QuarterUnitMiddleCertificate
```

e entrega `genuineCentralDoubleSeries != 0` no middle quando `scale`,
`horizontal` e `quarterUnit` sao fornecidos. O encanamento esta pago em Lean,
mas o `QuarterUnitMiddleObligation` global ainda nao esta.

O diagnostico numerico anterior mostrou cutoff pequeno e anchor/lower-factor
caro; por isso a frente seguinte auditada foi `adjusted quartet`, buscando:

```text
main - defect - tail > 0
```

A rota canonical closed scaled direta continua formalmente morta como alvo
middle.

## Atualizacao 2026-07-08: avaliador adjusted quartet

Foi criado:

```text
operadores/c2_adjusted_quartet_evaluator.py
```

Esse script e genuine-first e mede a decomposicao finita alinhada com:

```text
c2ConcreteAntiMiracleAdjustedMain
  - c2ConcreteAntiMiracleAdjustedDefect
  - c2ConcreteAntiMiracleAdjustedTailScaledUpper > 0
```

Ele usa:

```text
main = |(q^2 + c2OddTailBalancingSeed) * verticalQuartetPrefix(q)|
defect = sum_{j=0}^3 |c2ConcreteOddHorizontalLayerDefect j|
tail_upper = vertical_tail + tilt_tail + horizontal_tail + cutoff_budget
```

Resultados principais:

```text
K=16, M=12001, ref=(17,16001), supergaussian X=10661 p=2
audit_outputs/c2_adjusted_quartet_eval_super_K16_M12001_ref17x16001_dt025.csv

120 falhas em 161 pontos
pior surplus ~= -1.303913 em t=12.25
cutoff ~= 5e-10
```

Refinamento local do pior vale:

```text
audit_outputs/c2_adjusted_quartet_eval_super_K16_M12001_ref17x16001_t11p5_13_dt0001.csv

pior surplus ~= -1.307692 em t=12.237
main ~= 0.659335
defect ~= 1.911235
tail ~= 0.055792
```

Alvo cru formal:

```text
audit_outputs/c2_adjusted_quartet_eval_rawtarget_K16_M12001_ref17x16001_dt025.csv

pior surplus ~= -1.330472 em t=11.5
cutoff max ~= 1.825028
```

Corte maior:

```text
K=17, M=16001, ref=(18,24001), supergaussian X=10661 p=2
audit_outputs/c2_adjusted_quartet_eval_super_K17_M16001_ref18x24001_dt025.csv

127 falhas em 161 pontos
pior surplus ~= -1.278229 em t=12.5
```

Controle artificial com defeito horizontal zerado:

```text
audit_outputs/c2_adjusted_quartet_eval_super_K17_M16001_ref18x24001_deltazero_dt025.csv
```

Ainda falha por vales de fase do main:

```text
audit_outputs/c2_adjusted_quartet_eval_deltazero_t24p5_25p5_dt0001.csv
  pior surplus ~= -0.005992 em t=25.011
  main ~= 5.0e-5
  tail ~= 0.00604

audit_outputs/c2_adjusted_quartet_eval_deltazero_t47p5_48p5_dt0001.csv
  pior surplus ~= -0.005966 em t=48.005
  main ~= 7.8e-5
  tail ~= 0.00604
```

Leitura atualizada:

```text
o adjusted quartet continua uma reducao condicional valida em Lean,
mas o certificado direto global main - defect - tail > 0 nao parece promissor
na forma testada.
```

Motivo:

```text
1. com referencia odd realista, o defeito horizontal domina;
2. mesmo zerando artificialmente o defeito horizontal, o main ajustado quase
   zera perto de t ~= 25.011 e t ~= 48.005, abaixo da cauda minima.
```

Novo horizonte:

```text
nao insistir apenas em aumentar cortes;
precisa de nova ideia genuine-first: fase/decomposicao local/protecao dos
vales do main, ou outra rota que nao reduza tudo a esse certificado direto.
```

## Atualizacao 2026-07-08: livro-caixa do center Gaussian

Foi criado:

```text
operadores/c2_center_gaussian_ledger.py
```

Objeto estudado, sem usar comparacao externa:

```text
C_X(s) = sum_{c = 2^k m} 2 * 2^(-k) * c^(-s) * exp(-(c/X)^2)
```

O ledger numerico mede splits geometricos:

```text
depth:  |k<=5| - |k>5|
core:   |m<=M0| - |m>M0|
center: |c<=C0| - |c>C0|
```

Arquivos principais:

```text
audit_outputs/c2_center_gaussian_ledger_bg5_sigmas_dt005.csv
audit_outputs/c2_center_gaussian_ledger_bg5_transition_core401_dt005.csv
audit_outputs/c2_center_gaussian_ledger_bg12_depth_tail_dt005.csv
audit_outputs/c2_center_gaussian_ledger_bg12_local_t14_dt0001.csv
```

Leitura empirica:

```text
1. Para bg_kmax=5, o operador ja e o quarteto vertical inteiro; o split depth
   e trivial.
2. Com bg_kmax=12, o quarteto k<=5 domina a cauda vertical em todos os pontos
   testados. A cauda vertical nao aparece como gargalo.
3. O gargalo real e horizontal/core e a escolha do corte por centro.
```

Resultados com `nmax=200000`, `X=nmax/3`, `t in [10,50]`, `dt=0.05`:

```text
bg_kmax=5, core_main=401:
  sigma=0.50: core pass 736/801, center pass 568/801
  sigma=0.60: core pass 773/801, center pass 706/801
  sigma=0.75: core pass 801/801, center pass 798/801 com C0=X
  sigma=1.00: core pass 801/801, center pass 801/801
```

Transicao refinada para `core_main=401`:

```text
sigma=0.72: core pass 798/801, worst core surplus ~= -0.00823
sigma=0.74: core pass 801/801 no grid dt=0.05, worst core surplus ~= 1.18e-4
```

Refinamento local com `bg_kmax=12`, `C0=1.5X`, `t in [13.8,14.5]`, `dt=0.001`:

```text
sigma=0.74:
  core pass 682/701
  worst core surplus ~= -1.47e-4 perto de t=14.288
  depth pass 701/701
  center pass 701/701

sigma=0.75:
  core pass 701/701
  worst core surplus ~= 0.003605
  depth pass 701/701
  center pass 701/701
```

Corte por centro:

```text
C0 = X ainda falha perto de sigma=0.75 em poucos pontos.
C0 = 1.5X fecha nos testes em sigma=0.75 e sigma=0.80.
```

Leitura para teoria:

```text
Para o center Gaussian, a desigualdade empirica parece nascer de uma
decomposicao que preserva fase:
  - quarteto vertical k<=5 contra cauda k>5;
  - core baixo m<=401 contra resto;
  - corte largo por centro c<=1.5X contra cauda gaussiana.

So aumentar o bloco principal horizontal pode piorar, porque o main passa a
carregar cancelamento interno. O corte m<=401 foi melhor do que m<=1001,
m<=2001 ou m<=5001 nos testes iniciais.
```

## Atualizacao 2026-07-08: tilt no center Gaussian

O tilt nao e apenas heuristica solta. A peca formal ja existe e compila:

```text
LeanC2/Operators/Tilt.lean
LeanC2/Operators/CenterGaussianTilt.lean
LeanC2/Route/BulkAntiMiracleTilt.lean
```

Objeto formal:

```text
tilt delta x = x^(-delta)
tiltBracket delta c =
  (c - 1)^(-delta) + (c + 1)^(-delta) - 2 * c^(-delta)
```

Teoremas relevantes ja pagos em Lean:

```text
bracket_tilt_zero
bracket_tilt_pos
bracket_tilt_neg
bracket_tilt_zero_iff_delta_zero
normalizedTiltCurvature_zero
normalizedTiltCurvature_pos_of_pos
normalizedTiltCurvature_neg_of_neg_one_lt
normalizedTiltCurvature_zero_iff_delta_zero
centerGaussianTiltFactor_zero_delta
centerGaussianTiltFactor_gt_one_of_pos
centerGaussianTiltFactor_lt_one_of_neg
centerGaussianTiltFactor_eq_one_iff_delta_zero
centerGaussianTiltedFiniteLedger_zero_delta
centerGaussianTiltedFiniteLedger_filter_add_filter_not
tiltTheta_ne_zero_of_offCriticalStrip
BulkAntiMiracleTiltData.nonvanishing
BulkAntiMiracleTiltBoundsData.nonvanishing
```

Leitura:

```text
O Lean ja prova que a curvatura centrada do tilt zera exatamente em delta=0
na faixa delta > -1 e tem sinal correto fora da linha critica.
Tambem ha agora uma ponte local para o center Gaussian inclinado: o fator
1 + lambda*normalizedTiltCurvature e igual a 1 na linha critica, move com o
sinal correto fora dela para lambda>0, e a soma finita inclinada preserva
decomposicoes por filtro de blocos.
```

O que ainda nao esta pago:

```text
Ainda falta conectar esse tilt ao operador center Gaussian concreto e provar
um livro-caixa global do tipo main - rest > 0 para a decomposicao escolhida.
Ou seja: curvatura do tilt esta paga; dominancia do operador inclinado ainda nao.
```

O avaliador numerico foi atualizado:

```text
operadores/c2_center_gaussian_ledger.py

--tilt-mode none
--tilt-mode tilt-bracket
--tilt-mode transverse-norm
--tilt-mode transverse-curvature
--tilt-mode depth-linear
```

Significado dos modos:

```text
tilt-bracket:
  usa literalmente tiltBracket delta c do Lean como perfil.

transverse-norm:
  usa tiltBracket delta c / c^(-delta).

transverse-curvature:
  usa c^2 * tiltBracket delta c / c^(-delta)
    = c^(delta+2) * tiltBracket delta c,
  uma reescala para enxergar a curvatura de segunda diferenca.
```

Observacao formal nova:

```text
normalizedTiltCurvature delta c := c^(delta+2) * tiltBracket delta c
```

foi adicionado em `LeanC2/Operators/Tilt.lean` e compila. Como `c^(delta+2)`
e positivo para `c > 0`, a normalizacao preserva o sinal e o conjunto de zeros
do `tiltBracket`.

Resultados numericos novos, sem comparacao externa:

```text
audit_outputs/c2_center_gaussian_ledger_tilt_bracket_l1_dt005.csv
audit_outputs/c2_center_gaussian_ledger_tilt_transverse_curv_l1_dt005.csv
audit_outputs/c2_center_gaussian_ledger_tilt_transverse_curv_l1_local_t14.csv
audit_outputs/c2_center_gaussian_ledger_tilt_transverse_curv_l1_local_threshold.csv
audit_outputs/c2_center_gaussian_ledger_notilt_local_threshold.csv
```

Audit de boletos Lean extraidos desses CSVs:

```text
AUDIT_C2_CENTER_GAUSSIAN_TILT_LEDGER_BOLETOS_LEAN.md
```

Leitura operacional do audit:

```text
core/horizontal e o gargalo; sigma=0.750 e o primeiro alvo formal conservador;
sigma=0.740 e o alvo seguinte; sigma=0.737 passa no grid local, mas tem margem
core pequena demais para ser o primeiro fechamento. Ainda faltam
grid-to-continuum, roundoff intervalar e cauda inclinada.
```

Na caixa fina `t in [13.8,14.5]`, `dt=0.001`, `nmax=200000`,
`bg_kmax=12`, `X=nmax/3`, `core_main=401`, `C0=1.5X`:

```text
Sem tilt:
  sigma=0.740: worst core surplus ~= -1.468e-4

Com transverse-curvature, lambda=1:
  sigma=0.735: worst core surplus ~= -9.958e-4
  sigma=0.736: worst core surplus ~= -4.720e-4
  sigma=0.737: worst core surplus ~= +4.938e-5
  sigma=0.738: worst core surplus ~= +5.682e-4
  sigma=0.739: worst core surplus ~= +1.084e-3
  sigma=0.740: worst core surplus ~= +1.598e-3
```

Conclusao empirica:

```text
Inserir a curvatura do tilt melhora a borda observada do core: a virada local
passa de perto de sigma ~= 0.740+ para perto de sigma ~= 0.737.
O modo bruto tilt-bracket e formalmente mais fiel, mas numericamente pequeno;
o modo transverse-curvature funciona como uma lupa da mesma curvatura.
```

Atualizacao de orientacao:

```text
ROTA_GEOMETRICA_BRANCH_TILT_QUARTET_MIDDLE.md
AUDIT_TILT_AWARE_MIDDLE_LEDGER_EXPERIMENT.md
```

Leitura:

```text
O center Gaussian tilt fica como laboratorio empirico. A rota formal preferida
agora e branch barrier -> tilt/bracket -> quartet/half-disk upper -> middle.
O objetivo imediato e medir o perfil em V e descobrir qual moeda branch/tilt
paga melhor o half-disk budget, sem usar zeta como input analitico.
```

Experimento tilt-aware ja rodado:

```text
center Gaussian core:
  norm-only falha forte;
  oriented passa e melhora a margem em todos os pontos para sigma>=0.737.

adjusted quartet positive-box:
  norm-only reduz margem;
  oriented depende da parametrizacao e ainda precisa calibragem.
```

Horizonte atual:

```text
1. Tratar tilt-bracket como o objeto Lean canonico.
2. Tratar transverse-curvature como guia numerico para encontrar a moeda certa.
3. Construir scanner de perfil em V: min_abs(sigma,t), branch_defect,
   normalizedTiltCurvature e half-disk distance quando disponivel.
4. So depois formalizar a ponte branch/tilt -> half-disk/quartet upper.
```
