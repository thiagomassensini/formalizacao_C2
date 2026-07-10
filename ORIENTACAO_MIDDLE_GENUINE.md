# Orientacao Middle Genuine

Ultima atualizacao: 2026-07-05.

Este arquivo e o caderno de orientacao da rota middle genuine-first. Ele deve
registrar decisoes, barreiras formais, alvos ativos e proximas tarefas. A regra
de trabalho permanece: construir o nao-cancelamento no lado genuine/C2 antes de
qualquer transferencia terminal.

## Regra de rota

Nao usar zeta como insumo analitico, majorante, comparacao ou atalho para as
obrigacoes locais do middle.

Uso permitido apenas em contexto terminal, historico/deprecated ou auditoria de
que rotas antigas nao estao sendo usadas.

## Status verificado

Comandos verificados em 2026-07-05:

```bash
lake env lean LeanC2/PeerReview.lean
lake env lean LeanC2/AuditGenuineMiddle.lean
```

Ambos passaram sem saida.

Tambem foi feita busca por `sorry`, `admit`, `axiom` e `unsafe` nos arquivos:

```text
LeanC2/PeerReview.lean
LeanC2/Analytic/GenuineBulkConcrete.lean
LeanC2/AuditGenuineMiddle.lean
```

Resultado: limpo.

## Diagnostico atual

Interface publica atual:

```lean
C2.PeerReview.QuarterUnitMiddleCertificate
```

com endpoint:

```lean
C2.PeerReview.genuineCentral_ne_zero_of_quarterUnitMiddleCertificate
```

Essa interface consome os ingredientes da frente viva:

```lean
C2ExpandedScalarScaleData
C2ExpandedHorizontalLayerBudget
C2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserveBudgetOnMiddle
```

e conclui, na regiao `C2.PeerReview.CurrentMiddleRegion`:

```lean
genuineCentralDoubleSeries s ≠ 0
```

A frente de pesquisa genuine-middle continua concentrada em:

```text
LeanC2/AuditGenuineMiddle.lean
LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

## Barreira formal importante

O Lean ja prova uma obstrucao contra a rota canonical closed/scaled atual:

```lean
not_c2CanonicalClosedScaledResidualUpper_lt_residualMargin_of_offCriticalStrip
not_c2CanonicalClosedScaledLocalData_of_offCriticalStrip
```

Leitura:

```lean
C2CanonicalClosedScaledLocalData
```

na forma atual nao e habitavel em ponto off-critical. A razao e que o residual
upper canonico carrega uma divida vertical triangular grande demais para ficar
abaixo da margem residual do quarteto.

Consequencia pratica:

- nao tentar preencher `C2CanonicalClosedScaledLocalData` diretamente;
- nao insistir em `c2CanonicalClosedScaledResidualUpper < c2ExpandedQuartetResidualMargin`;
- qualquer rota nova precisa introduzir uma economia real: fase, gap, disco ou
  residual vertical mais fino.

## Rotas que nao devem ser atacadas agora

Congeladas ou nao recomendadas:

- positive box como prova principal;
- `oddRef`;
- `anchor_bound` global;
- `cut_bound` global sem auditoria semantica;
- pacote norm-only `C2GenuineOddAnchorLocalData`;
- `C2CanonicalClosedScaledLocalData` atual como alvo direto.

Motivo adicional:

O Lean tambem prova que o pacote odd-anchor norm-only nao fecha sob uppers
naturais nao negativos:

```lean
not_C2GenuineOddAnchorFinalBudget_of_nonneg_uppers
not_C2GenuineOddAnchorInheritedBudget_of_nonneg_uppers
not_C2GenuineOddAnchorLocalData
```

Logo, a proxima rota precisa ser gap-aware.

## Rota recomendada agora

Usar a rota gap-aware / phase-disk em `LeanC2/AuditGenuineMiddle.lean`.

Objetos principais:

```lean
C2GenuineGapAnchorFinalBudget
C2ExactGapAnchorPhaseDisk
C2ExactGapAnchorPhaseDiskOnMiddle
C2ExactGapAnchorPhaseDiskMiddleData
genuineCentral_ne_zero_on_middle_of_exactGapAnchorPhaseDiskMiddleData
```

A condicao geometrica central e:

```lean
‖(1 / 2 : ℂ) - continuedOddDirichletChannel s‖ <
  c2ExactGapAnchorFactorAllowance
    K M horizontalConstant horizontalScale horizontalRatio s / 2
```

Equivalente em termos de gap:

```lean
‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖ <
  c2ExactGapAnchorFactorAllowance
    K M horizontalConstant horizontalScale horizontalRatio s
```

Interpretacao:

O canal impar continuado precisa ficar num disco em torno de `1 / 2`. Essa e a
economia de fase/gap que a rota triangular nao capturava.

## Alvo operacional imediato

Separar o proximo trabalho em dois pacotes.

### Pacote A: dados horizontais

Provar ou identificar, na regiao middle:

```lean
0 < horizontalScale s
0 ≤ horizontalConstant s
0 ≤ horizontalRatio s
horizontalRatio s < 1
C2ExpandedHorizontalLayerBudget
  coreCutoff horizontalConstant horizontalScale horizontalRatio s
```

Esses campos sao infraestrutura. Eles nao resolvem o problema sozinhos, mas sao
necessarios para consumir a rota gap-aware.

### Pacote B: disco/gap do canal impar continuado

Provar uma das formas:

```lean
C2ExactGapAnchorPhaseDiskOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

ou a forma modular:

```lean
C2ContinuedOddHalfDiskBoundOnMiddle halfDiskUpper near edge
C2ExactGapAnchorPhaseDiskBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio halfDiskUpper near edge
```

Este e o alvo matematico real.

## Primeiro subalvo Lean recomendado

Auditar as definicoes e dependencias de:

```lean
continuedOddDirichletChannel
c2ExactGapAnchorFactorAllowance
C2ExactGapAnchorPhaseDiskBudget
C2ExactGapAnchorExactHalfDiskBudgetOnMiddle
C2ContinuedOddHalfDiskBoundOnMiddle
```

Perguntas a responder:

1. Qual e a forma expandida de `continuedOddDirichletChannel s`?
2. Existe bound ja provado para sua distancia ate `1 / 2`?
3. A margem `c2ExactGapAnchorFactorAllowance` e positiva em qual pacote?
4. O alvo mais facil e disco direto, half-disk upper, ou gap upper?
5. A regiao middle atual fornece informacao suficiente sobre o canal impar, ou
   sera necessario criar uma nova estrutura de dados local?

## Criterio para marcar avanco

Um passo so conta como fechado se houver declaracao Lean nomeada compilando.

Numerico, CSV, scanner e box local podem orientar, mas nao fecham item de prova.

## Proximo registro esperado

Depois da proxima sessao Lean, registrar aqui:

- nomes dos lemas encontrados ou criados;
- se o alvo escolhido foi disco direto, half-disk ou gap upper;
- quais hipoteses extras apareceram;
- se algum alvo foi descartado por barreira formal;
- comando Lean rodado e resultado.

## Registro 2026-07-05: primeira auditoria do alvo gap/half-disk

Arquivos lidos:

```text
LeanC2/Analytic/GenuineContinuation.lean
LeanC2/Analytic/OddChannel.lean
LeanC2/Analytic/GenuineInfinite.lean
LeanC2/AuditGenuineMiddle.lean
```

### Definicao do canal impar continuado

O canal continuado atual e:

```lean
continuedOddDirichletChannel s =
  (1 - complexDirichletCoeff s 2) * riemannZeta s
```

em `LeanC2/Analytic/GenuineContinuation.lean`.

Guardrail:

essa definicao nao deve ser usada como fonte analitica para estimativas do
middle. Estimar o half-disk diretamente por propriedades de `riemannZeta`
violaria a regra Genuine-First. A rota so permanece aceitavel se o canal
continuado for usado como interface de continuacao/ponte, ou se o bound for
reformulado em termos de dados genuine/C2.

### Versao zeta-free no semiplano de convergencia

Existe a serie impar genuine:

```lean
oddDirichletChannel s =
  ∑' n : ℕ, complexDirichletCoeff s (2 * n + 1)
```

e Lean prova, em `Re(s) > 1`:

```lean
continuedOddDirichletChannel_eq_oddDirichletChannel_on_oneLtHalfPlane
genuineCentralDoubleSeries_eq_centralFromOddChannel
continuedCentralOddChannel_eq_genuineCentralDoubleSeries_on_oneLtHalfPlane
```

Leitura:

no semiplano de convergencia, o canal continuado coincide com a serie impar
genuine. Fora dele, o uso da continuacao precisa ser tratado como dado/ponte,
nao como estimativa zeta.

### Infraestrutura gap/half-disk ja existente

O Lean ja tem as interfaces:

```lean
C2ContinuedOddGapBound
C2ContinuedOddGapBoundOnMiddle
c2ContinuedOddExactGapUpper
C2ContinuedOddHalfDiskBound
C2ContinuedOddHalfDiskBoundOnMiddle
c2HalfDiskUpperFromOddUpper
c2ContinuedOddGapUpperFromHalfDisk
C2ExactGapAnchorPhaseDiskBudget
C2ExactGapAnchorPhaseDiskBudgetOnMiddle
C2ExactGapAnchorExactHalfDiskBudgetOnMiddle
```

Conversoes ja existentes:

```lean
C2ContinuedOddGapBound_of_halfDiskBound
C2ContinuedOddGapBoundOnMiddle_of_halfDiskBoundOnMiddle
C2ExactGapAnchorPhaseDisk_of_halfDiskBound
C2ExactGapAnchorPhaseDiskOnMiddle_of_halfDiskBoundOnMiddle
C2ExactGapAnchorPhaseDiskOnMiddle_of_exactHalfDiskBudgetOnMiddle
C2ContinuedOddHalfDiskBound_of_oddChannelBound
C2ContinuedOddHalfDiskBoundOnMiddle_of_oddChannelBoundOnMiddle
```

Conclusao tecnica:

o alvo modular mais limpo e:

```lean
C2ContinuedOddHalfDiskBoundOnMiddle halfDiskUpper near edge
C2ExactGapAnchorPhaseDiskBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio halfDiskUpper near edge
```

mas `halfDiskUpper = 1 / 2 + oddUpper` provavelmente e grosseiro demais, pois
herda a mesma perda triangular que a rota norm-only. O half-disk util deve ser
fase-aware ou vir de um anchor residual mais fino.

### Proximo subalvo revisado

Antes de provar desigualdades novas, decidir uma formulacao genuine-first para
o half-disk/gap:

1. ou criar um bound abstrato `C2GenuineOddHalfDiskBoundOnMiddle` alimentado por
   dados C2/genuine, e depois conectar ao canal continuado por um dado de
   continuacao apropriado;
2. ou usar a rota de anchor residual ja existente:

```lean
C2ContinuedVerticalAnchorResidualBoundOnMiddle anchorUpper near edge
C2ExactGapAnchorPhaseDiskBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio
  (c2HalfDiskUpperFromAnchor anchorUpper) near edge
```

3. ou provar uma identidade/saving C2 para o gap

```lean
‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖
```

sem abrir a definicao por `riemannZeta`.

Preferencia atual:

seguir pela rota de anchor residual, porque ela ja existe no Lean e transforma
um bound de operador em half-disk sem precisar estimar o canal continuado pela
definicao zeta-escrita.

## Registro 2026-07-05: ponte anchor residual -> half-disk

A rota de anchor residual ja esta bem empacotada.

Definicoes principais:

```lean
C2ContinuedVerticalAnchorResidualBound anchorUpper s
  :=
‖c2ContinuedVerticalAnchorResidual s‖ ≤ anchorUpper s

c2HalfDiskUpperFromAnchor anchorUpper s
  :=
anchorUpper s / (2 * c2VerticalDepthTailLower s)

c2ContinuedOddGapUpperFromAnchor anchorUpper s
  :=
anchorUpper s / c2VerticalDepthTailLower s
```

O lower vertical usado na divisao e:

```lean
c2VerticalDepthTailLower s = ‖q s‖ ^ 2 / (1 + ‖q s‖)
```

Conversoes ja provadas:

```lean
C2ContinuedOddHalfDiskBound_of_anchorResidualBound
C2ContinuedOddHalfDiskBoundOnMiddle_of_anchorResidualBoundOnMiddle
C2ContinuedOddGapBound_of_anchorResidualBound
C2ContinuedOddGapBoundOnMiddle_of_anchorResidualBoundOnMiddle
```

Forma exata do budget de anchor residual:

```lean
C2ExactGapAnchorExactAnchorResidualBudget
  K M horizontalConstant horizontalScale horizontalRatio s
```

que e apenas:

```lean
C2ExactGapAnchorPhaseDiskBudget
  K M horizontalConstant horizontalScale horizontalRatio
  (c2HalfDiskUpperFromAnchor
    c2ContinuedVerticalAnchorResidualExactUpper) s
```

Pacote global ja existente:

```lean
C2ExactGapAnchorAnchorResidualMiddleData
```

Campos desse pacote:

- sinais horizontais;
- `C2ExpandedHorizontalLayerBudget`;
- bound do anchor residual;
- budget de phase disk para `c2HalfDiskUpperFromAnchor anchorUpper`.

Conversao decisiva:

```lean
C2ExactGapAnchorAnchorResidualMiddleData.to_phaseDiskMiddleData
```

e depois:

```lean
genuineCentral_ne_zero_on_middle_of_exactGapAnchorAnchorResidualMiddleData
```

### Novo alvo preferido

Em vez de atacar o canal impar continuado diretamente, mirar:

```lean
C2ExactGapAnchorAnchorResidualMiddleData
```

ou a forma mais automatica:

```lean
C2ExactGapAnchorExactAnchorResidualBudgetOnMiddle
```

com dados horizontais.

Forma pontual equivalente a investigar:

```lean
‖c2ContinuedVerticalAnchorResidual s‖
  <
c2VerticalDepthTailLower s *
  c2ExactGapAnchorFactorAllowance
    K M horizontalConstant horizontalScale horizontalRatio s
```

Essa e mais geometricamente aceitavel: compara o anchor residual real com a
margem disponivel, usando um lower C2 da cauda vertical.

### Proxima pergunta tecnica

Abrir e classificar:

```lean
c2ContinuedVerticalAnchorResidual
C2ExactGapAnchorTailLowerDistortedGapBudget
C2ExactGapAnchorTailLowerDistortedGapExplicitUpperBudget
C2ExactGapAnchorTailLowerDistortedPhaseDisk
```

Objetivo: descobrir se ja existe uma forma escalar mais simples para pagar o
budget exato do anchor residual, e se ela evita estimar diretamente pela
definicao zeta-escrita do canal continuado.

## Registro 2026-07-05: classificacao TailLowerDistorted

Foi aberta a cadeia `TailLowerDistorted` em `LeanC2/AuditGenuineMiddle.lean`.

### Anchor residual

Definicao:

```lean
c2ContinuedVerticalAnchorResidual s
  =
verticalDepthTailFromTwo s - continuedCentralOddChannel s
```

e Lean tambem prova:

```lean
c2ContinuedVerticalAnchorResidual_eq_tail_mul_oddGap
```

isto e:

```lean
c2ContinuedVerticalAnchorResidual s
  =
verticalDepthTailFromTwo s *
    (1 - (2 : ℂ) * continuedOddDirichletChannel s)
```

Portanto, controlar o anchor residual e exatamente controlar o gap impar
continuado multiplicado pela cauda vertical.

### Tres formas equivalentes/proximas

Forma 1: budget exato de anchor residual:

```lean
C2ExactGapAnchorExactAnchorResidualBudget
```

Lean prova:

```lean
C2ExactGapAnchorExactAnchorResidualBudget_iff_norm_lt_lower_mul_allowance
```

Forma pontual:

```lean
‖c2ContinuedVerticalAnchorResidual s‖
  <
c2VerticalDepthTailLower s *
  c2ExactGapAnchorFactorAllowance
    K M horizontalConstant horizontalScale horizontalRatio s
```

Forma 2: gap com distorcao do lower da cauda:

```lean
C2ExactGapAnchorTailLowerDistortedGapBudget
```

Lean prova equivalencia:

```lean
C2ExactGapAnchorExactAnchorResidualBudget_iff_tailLowerDistortedGapBudget
C2ExactGapAnchorExactAnchorResidualBudgetOnMiddle_iff_tailLowerDistortedGapBudgetOnMiddle
```

Forma pontual:

```lean
c2VerticalTailLowerDistortion s *
  ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖
<
c2ExactGapAnchorFactorAllowance
  K M horizontalConstant horizontalScale horizontalRatio s
```

Forma 3: versao com upper explicito da distorcao:

```lean
C2ExactGapAnchorTailLowerDistortedGapExplicitUpperBudget
```

onde:

```lean
c2VerticalTailLowerDistortionExplicitUpper s
  =
(1 + ‖q s‖) / (1 - ‖q s‖)
```

Lean prova:

```lean
C2ExactGapAnchorTailLowerDistortedGapBudget_of_explicitUpperBudget
C2ExactGapAnchorTailLowerDistortedGapExplicitUpperBudget_iff_phaseDisk
C2ExactGapAnchorTailLowerDistortedGapExplicitUpperBudgetOnMiddle_iff_phaseDiskOnMiddle
```

### Superficie limpa para proximas desigualdades

A forma mais limpa para guiar a matematica e:

```lean
C2ExactGapAnchorFactorAllowanceLowerScalarBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio allowanceLower near edge

C2ContinuedOddGapBoundOnMiddle gapUpper near edge

C2ExactGapAnchorFactorUpperLowerBudgetOnMiddle
  gapUpper allowanceLower near edge
```

Consumidor:

```lean
genuineCentral_ne_zero_on_middle_of_exactGapAnchorGapUpperAllowanceLowerBudget
```

Leitura:

1. `allowanceLower` e um lower real para a margem disponivel;
2. `gapUpper` e um upper real para o gap impar continuado;
3. o pagamento final e simplesmente:

```lean
gapUpper s < allowanceLower s
```

no middle.

Essa e a melhor superficie para uma prova phase-aware.

### Rota odd-metric descartada como principal

Existe uma rota com:

```lean
oddUpper
c2HalfDiskUpperFromOddUpper oddUpper
```

e pagamento limpo:

```lean
(1 + ‖q s‖) * (1 + 2 * oddUpper s)
  <
allowanceLower s * (1 - ‖q s‖)
```

Mas isso herda a perda triangular `1 + 2 * oddUpper`. O Lean ja registra uma
barreira para a versao cleared com termos nao negativos:

```lean
not_C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceClearedBudget_of_nonneg
```

Conclusao: nao usar a rota odd-metric como rota principal. Ela serve como
documentacao de uma tentativa triangular, nao como alvo de prova.

### Proximo alvo revisado

Escolher ou construir um `gapUpper` verdadeiramente phase-aware para:

```lean
‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖
```

sem estimar pela definicao zeta-escrita de `continuedOddDirichletChannel`.

Alternativamente, trabalhar diretamente no anchor residual exato:

```lean
‖c2ContinuedVerticalAnchorResidual s‖
```

usando sua identidade `tail * oddGap`, mas procurando uma economia real no gap,
nao uma majoracao triangular.

### Proxima sessao recomendada

Auditar as fontes possiveis de fase/gap:

```lean
continuedOddDirichletChannel_eq_oddDirichletChannel_on_oneLtHalfPlane
rectangularOddCoreSum
continuedVerticalAnchorScaledFloor
AuditContinuedQuartetDominance
```

Objetivo: encontrar uma formulacao genuine-first de `gapUpper`, ou provar que a
informacao atual do middle nao contem dados suficientes para esse gap.

## Registro 2026-07-05: auditoria phase/gap e positive-box

Comandos verificados:

```bash
lake env lean LeanC2/AuditContinuedQuartetDominance.lean
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxContinuedOdd.lean
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxGenuineOddBridge.lean
```

Todos passaram sem saida.

### Diagnostico do modulo `AuditContinuedQuartetDominance`

O modulo contem a melhor anatomia estrutural do residual continuado:

```lean
continuedVerticalChannelAnchor_eq_factorized
c2ContinuedVerticalResidual_eq_factorized_anchor_add_cutoff
c2ContinuedVerticalResidual_eq_anchor_add_depth_core_errors
continuedVerticalAnchorScaledFloor_eq_factor_norm
```

O ponto matematico exposto por essa anatomia e:

```lean
continuedVerticalAnchorScaledFloor s =
  (‖verticalDepthTailFromTwo s‖ *
    ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖) *
  ((1 + ‖q s‖) * (1 - ‖q s‖)⁻¹)
```

Conclusao: o ledger vertical ja esta fatorado do jeito certo. Ele nao cria a
economia; ele apenas mostra onde a economia precisa entrar:

```lean
‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖
```

Os lemas com `riemannZeta` nesse modulo sao diagnosticos/transfer-side. Eles
nao devem ser usados como input da rota middle ativa.

### Diagnostico positive-box

Os arquivos `AuditContinuedQuartetPositiveBox*` isolam uma subcaixa audit-only:

```lean
positiveBoxSigmaMin = 21 / 25
positiveBoxSigmaMax = 43 / 50
positiveBoxTMin     = 1641 / 50
positiveBoxTMax     = 1643 / 50
positiveBoxN        = 50
positiveBoxK        = 3
positiveBoxM        = 50
```

O que ja existe:

1. `AuditContinuedQuartetPositiveBoxSector.lean` fecha dados de fase/setor para
   `q`, especialmente o lower de `‖verticalQuartetPrefix (q s)‖`.
2. `AuditContinuedQuartetPositiveBoxContinuedOdd.lean` troca a medida horizontal
   para:

   ```lean
   ‖rectangularOddCoreSum s positiveBoxN -
     continuedOddDirichletChannel s‖
   ```

   Isso melhora a compatibilidade com o canal continuado, mas ainda nao e um
   half-disk em torno de `1 / 2`.
3. `AuditContinuedQuartetPositiveBoxGenuineOdd.lean` introduz:

   ```lean
   GenuineOddContinuationData
   PositiveBoxOddRefTruncationData
   PositiveBoxOddRefAuditCertificate
   ```

   Essa e a melhor superficie para uma formulacao Genuine-First porque o
   `oddRef` fica abstrato, com a estimativa fornecida como dado geometrico.
4. `AuditContinuedQuartetPositiveBoxGenuineOddBridge.lean` conecta o modelo
   `oddRef` ao objeto genuino por:

   ```lean
   PositiveBoxOddRefCompatibility
   positiveBoxOddRefBulkModel_eq_genuine_of_compat
   positiveBox_oddRef_bridge_result
   ```

### Lacuna real encontrada

Ainda nao existe, nos positive-box, um campo phase-aware do tipo:

```lean
∀ s ∈ positiveBox,
  ‖(1 / 2 : ℂ) - oddRef s‖ ≤ halfDiskUpper s
```

nem a versao direta:

```lean
∀ s ∈ positiveBox,
  ‖1 - (2 : ℂ) * oddRef s‖ ≤ gapUpper s
```

O que existe hoje fecha ledger horizontal/setorial e truncamento, mas nao
controla diretamente `oddRef` perto de `1 / 2`. Portanto, a proxima obrigacao
nao deve ser mais uma majoracao triangular do residual. Ela deve ser uma
obrigacao de fase do odd reference.

### Proximo alvo concreto

Interface audit-only criada em:

```lean
LeanC2/AuditContinuedQuartetPositiveBoxOddRefPhase.lean
```

Comando verificado:

```bash
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxOddRefPhase.lean
```

O arquivo formaliza, sem promover ao endpoint publico:

```lean
structure PositiveBoxOddRefPhaseData
    (oddRef : ℂ → ℂ)
    (halfDiskUpper allowanceLower : ℂ → ℝ) : Prop where
  half_disk_bound :
    PositiveBoxOddRefHalfDiskBound oddRef halfDiskUpper
  payment :
    PositiveBoxOddRefPhasePayment halfDiskUpper allowanceLower
```

As duas obrigacoes internas sao:

```lean
def PositiveBoxOddRefHalfDiskBound
    (oddRef : ℂ → ℂ) (halfDiskUpper : ℂ → ℝ) : Prop :=
  ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
    ‖(1 / 2 : ℂ) - oddRef s‖ ≤ halfDiskUpper s

def PositiveBoxOddRefPhasePayment
    (halfDiskUpper allowanceLower : ℂ → ℝ) : Prop :=
  ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
    2 * halfDiskUpper s < allowanceLower s
```

E a conversao principal ja esta provada:

```lean
PositiveBoxOddRefGapBound.of_halfDiskBound
PositiveBoxOddRefPhaseData.gap_lt_allowance
```

Em formato conceitual, ela realiza:

```lean
structure PositiveBoxOddRefPhaseData
    (data : GenuineOddContinuationData) : Prop where
  half_disk_upper : ℂ → ℝ
  half_disk_bound :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      ‖(1 / 2 : ℂ) - data.oddRef s‖ ≤ half_disk_upper s
  payment_budget :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      2 * half_disk_upper s < localAllowanceForPositiveBox s
```

O nome `localAllowanceForPositiveBox` ainda precisa ser escolhido com cuidado:
ou ele reutiliza a allowance do exact-gap anchor em `AuditGenuineMiddle.lean`,
ou fica local ao positive-box como um pagamento contra o residual setorial.

Decisao recomendada para o proximo passo:

1. nao escrever ainda uma prova numerica de fase;
2. escolher a allowance concreta para instanciar `allowanceLower`;
3. testar se esse campo se conecta melhor ao endpoint global via
   `C2ExactGapAnchorPhaseDiskOnMiddle` ou se deve ficar como certificado local
   `positiveBox`.

Essa etapa mantem a rota Genuine-First: o dado de fase entra em `oddRef`, nao
por estimativa da definicao zeta-escrita de `continuedOddDirichletChannel`.

## Decisao 2026-07-05: allowance global como moeda principal

Decisao: usar a allowance global do exact-gap anchor como moeda principal do
campo phase-aware.

Superficie Lean principal:

```lean
c2ExactGapAnchorFactorAllowance
C2ExactGapAnchorFactorAllowanceLowerScalarBudgetOnMiddle
C2ExactGapAnchorFactorUpperLowerBudgetOnMiddle
C2ExactGapAnchorGapUpperScalarBudgetOnMiddle_of_allowanceLowerScalarBudgetOnMiddle
genuineCentral_ne_zero_on_middle_of_exactGapAnchorGapUpperAllowanceLowerBudget
```

Forma operacional:

```lean
gapUpper s < allowanceLower s
```

com:

```lean
allowanceLower s ≤
  c2ExactGapAnchorFactorAllowance
    K M horizontalConstant horizontalScale horizontalRatio s
```

e/ou a versao escalar:

```lean
allowanceLower s * verticalDepthTailUpper s +
  c2GenuineCentralExactUpper s +
  c2ContinuedCentralExactUpper s ≤
    c2ExactVerticalAnchorResidualNormAllowance
      K M horizontalConstant horizontalScale horizontalRatio s
```

### Por que nao usar a margem local positive-box como allowance principal

A margem local:

```lean
c2ExpandedQuartetSectorResidualMargin positiveBoxSectorLower s
```

e uma margem de dominancia do quartet prefix:

```lean
‖q s‖ ^ 2 * positiveBoxSectorLower s -
  c2QuartetVerticalTailUpper s
```

Ela paga um ledger setorial local. Ela nao e, diretamente, a moeda normalizada
que paga:

```lean
verticalDepthTailUpper s * gapUpper s +
  c2GenuineCentralExactUpper s +
  c2ContinuedCentralExactUpper s
```

Usa-la como allowance principal exigiria construir uma nova ponte local:

```lean
positiveBox sector residual margin
  → expanded exact-gap scalar budget
  → exact-gap anchor nonvanishing
```

Isso duplica parte do spine global e aumenta o risco de criar uma rota local
isolada, sem encaixe imediato no endpoint `middle`.

### Papel correto do positive-box

O positive-box continua util, mas como ferramenta auxiliar:

1. testar numericamente/geometricamente candidatos para `halfDiskUpper`;
2. provar bounds locais de fase para `oddRef`;
3. depois transportar o resultado para a moeda global via `allowanceLower`.

Portanto, a proxima implementacao formal deve tentar conectar
`PositiveBoxOddRefPhaseData` a uma versao global/anchor-aware, nao transformar
`c2ExpandedQuartetSectorResidualMargin` na allowance final.

### Proximo alvo formal

Wrapper audit-only criado em:

```lean
LeanC2/AuditContinuedQuartetPositiveBoxOddRefPhase.lean
```

Ele traduz:

```lean
PositiveBoxOddRefPhaseData oddRef halfDiskUpper allowanceLower
```

para:

```lean
PositiveBoxOddRefGapBound oddRef gapUpper
```

e, no caso em que `oddRef` for a superficie global escolhida para o middle,
alinhar esse `gapUpper` com:

```lean
C2ExactGapAnchorFactorUpperLowerBudget
  gapUpper allowanceLower s
```

Novos nomes formais:

```lean
PositiveBoxOddRefFactorUpperLowerBudgetOnBox
PositiveBoxOddRefPhaseData.to_gapBound
PositiveBoxOddRefPhaseData.to_factorUpperLowerBudgetOnBox
```

Comando verificado apos a conexao com o spine global:

```bash
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxOddRefPhase.lean
```

Resumo da decisao: `allowanceLower` deve ser uma lower bound da allowance
global exact-gap; a margem local positive-box fica como instrumento para
produzir/validar o `halfDiskUpper`, nao como pagamento final.

### Proximo alvo depois do wrapper

Escolher uma das duas conexoes:

1. versao local: provar `PositiveBoxOddRefPhaseData` em `positiveBox` para um
   `oddRef` genuino abstrato e uma `allowanceLower` global restrita a caixa;
2. versao global: promover o mesmo formato para uma regiao do middle, com
   `C2ContinuedOddHalfDiskBoundOnMiddle`/`C2ContinuedOddGapBoundOnMiddle`.

Recomendacao: fazer primeiro a versao local, mas ja usando `allowanceLower`
global. Assim a prova local serve como laboratorio sem desviar da moeda do
endpoint.

## Registro 2026-07-05: versao local com allowance global restrita ao positiveBox

Arquivo atualizado:

```lean
LeanC2/AuditContinuedQuartetPositiveBoxOddRefPhase.lean
```

Comando verificado:

```bash
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxOddRefPhase.lean
```

Novos blocos formais:

```lean
positiveBox_offCriticalStrip

PositiveBoxOddRefContinuedCompatibility
PositiveBoxContinuedOddGapBoundOnBox
PositiveBoxOddRefGapBound.to_continuedOnBox

PositiveBoxExactGapAnchorFactorAllowanceLowerScalarBudgetOnBox
PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox
PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_allowanceLower
```

O ponto principal agora esta fechado localmente:

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

Separacao importante:

1. `PositiveBoxOddRefPhaseData` continua sendo a prova genuina/local de fase;
2. `PositiveBoxOddRefContinuedCompatibility` e uma ponte explicita e separada;
3. a allowance usada no pagamento ja e a moeda global exact-gap, restrita a
   `positiveBox`.

Proximo alvo: decidir como certificar a `allowanceLower` global na caixa.
Opcoes:

1. usar a forma escalar diretamente:

   ```lean
   allowanceLower s * verticalDepthTailUpper s +
     c2GenuineCentralExactUpper s +
     c2ContinuedCentralExactUpper s ≤
       c2ExactVerticalAnchorResidualNormAllowance
         K M horizontalConstant horizontalScale horizontalRatio s
   ```

2. construir uma lower bound numerica/intervalar para
   `c2ExactGapAnchorFactorAllowance` e transportar para a forma escalar.

Recomendacao: comecar pela forma escalar, porque ela evita divisao e e
exatamente o que o wrapper local ja consome.

## Registro 2026-07-05: certificacao local da allowance por componentes

Arquivo atualizado:

```lean
LeanC2/AuditContinuedQuartetPositiveBoxOddRefPhase.lean
```

Comando verificado:

```bash
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxOddRefPhase.lean
```

Nova interface de certificacao:

```lean
PositiveBoxAllowanceLowerNonnegOnBox
PositiveBoxVerticalDepthTailUpperBoundOnBox
PositiveBoxExactCentralUpperBoundOnBox
PositiveBoxExactVerticalAnchorAllowanceLowerBoundOnBox
PositiveBoxAllowanceLowerComponentPaymentOnBox
PositiveBoxExactGapAnchorAllowanceLowerComponentData
PositiveBoxExactGapAnchorAllowanceLowerComponentData.to_scalarBudgetOnBox
```

Ela reduz:

```lean
PositiveBoxExactGapAnchorFactorAllowanceLowerScalarBudgetOnBox
```

a cinco campos locais:

1. `0 ≤ allowanceLower s`;
2. `verticalDepthTailUpper s ≤ verticalTailUpper s`;
3. `c2GenuineCentralExactUpper s + c2ContinuedCentralExactUpper s ≤ centralUpper s`;
4. `anchorAllowanceLower s ≤ c2ExactVerticalAnchorResidualNormAllowance ... s`;
5. `allowanceLower s * verticalTailUpper s + centralUpper s ≤ anchorAllowanceLower s`.

Isso preserva a decisao principal: a allowance e global exact-gap, mas sua
certificacao local no `positiveBox` fica modular e sem divisao.

### Proximo alvo depois da certificacao por componentes

Escolher candidatos concretos para:

```lean
allowanceLower
verticalTailUpper
centralUpper
anchorAllowanceLower
```

e provar primeiro os campos mais baratos:

1. `PositiveBoxVerticalDepthTailUpperBoundOnBox` usando apenas bounds de `q`;
2. `PositiveBoxAllowanceLowerNonnegOnBox` para a escolha de `allowanceLower`;
3. deixar `centralUpper` e `anchorAllowanceLower` como campos auditaveis se
   ainda forem numericamente sensiveis.

## Registro 2026-07-05: primeiro campo concreto da allowance por componentes

Arquivo atualizado:

```lean
LeanC2/AuditContinuedQuartetPositiveBoxOddRefPhase.lean
```

Comando verificado:

```bash
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxOddRefPhase.lean
```

Novo candidato concreto:

```lean
positiveBoxVerticalTailUpperCandidate : ℂ → ℝ
```

com valor constante:

```lean
fun _ => (49 : ℝ) / 450
```

Novo campo fechado:

```lean
positiveBox_verticalDepthTailUpper_bound_candidate :
  PositiveBoxVerticalDepthTailUpperBoundOnBox
    positiveBoxVerticalTailUpperCandidate
```

A prova usa somente o bound genuine/C2 da caixa:

```lean
positiveBox_q_norm_upper_7_25
```

e a identidade:

```lean
verticalDepthTailUpper s = ‖q s‖ ^ 2 / (1 - ‖q s‖)
```

Sem uso analitico de zeta.

Proximo alvo: escolher uma `allowanceLower` concreta, provavelmente constante,
e fechar:

```lean
PositiveBoxAllowanceLowerNonnegOnBox allowanceLower
```

Depois disso, os campos sensiveis continuam sendo:

```lean
PositiveBoxExactCentralUpperBoundOnBox centralUpper
PositiveBoxExactVerticalAnchorAllowanceLowerBoundOnBox
  K M horizontalConstant horizontalScale horizontalRatio anchorAllowanceLower
PositiveBoxAllowanceLowerComponentPaymentOnBox
  allowanceLower positiveBoxVerticalTailUpperCandidate
  centralUpper anchorAllowanceLower
```

## Registro 2026-07-05: allowance lower constante de trabalho

Arquivo atualizado:

```lean
LeanC2/AuditContinuedQuartetPositiveBoxOddRefPhase.lean
```

Comando verificado:

```bash
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxOddRefPhase.lean
```

Novo candidato:

```lean
positiveBoxAllowanceLowerCandidate : ℂ → ℝ
```

com valor constante:

```lean
fun _ => (1 : ℝ) / 20
```

Novos campos fechados:

```lean
positiveBox_allowanceLower_nonneg_candidate :
  PositiveBoxAllowanceLowerNonnegOnBox
    positiveBoxAllowanceLowerCandidate

positiveBox_allowanceLower_pos_candidate
positiveBox_allowanceLower_lt_one_candidate
```

Observacao: `1 / 20` e candidato de trabalho localizado. Ele e pequeno o
suficiente para manter barato o pagamento

```lean
allowanceLower s * positiveBoxVerticalTailUpperCandidate s
```

mas ainda deixa folga estrita para um futuro bound de fase:

```lean
2 * halfDiskUpper s < positiveBoxAllowanceLowerCandidate s
```

Proximos campos ainda sensiveis:

```lean
PositiveBoxExactCentralUpperBoundOnBox centralUpper
PositiveBoxExactVerticalAnchorAllowanceLowerBoundOnBox
  K M horizontalConstant horizontalScale horizontalRatio anchorAllowanceLower
PositiveBoxAllowanceLowerComponentPaymentOnBox
  positiveBoxAllowanceLowerCandidate positiveBoxVerticalTailUpperCandidate
  centralUpper anchorAllowanceLower
```

## Registro 2026-07-05: central e anchor exatos, pagamento isolado

Arquivo atualizado:

```lean
LeanC2/AuditContinuedQuartetPositiveBoxOddRefPhase.lean
```

Comando verificado:

```bash
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxOddRefPhase.lean
```

Novos candidatos exatos:

```lean
positiveBoxExactCentralUpperCandidate : ℂ → ℝ

positiveBoxExactVerticalAnchorAllowanceLowerCandidate
  (K M : ℕ)
  (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ) :
  ℂ → ℝ
```

Novos campos fechados:

```lean
positiveBox_exactCentralUpper_bound_candidate :
  PositiveBoxExactCentralUpperBoundOnBox
    positiveBoxExactCentralUpperCandidate

positiveBox_exactVerticalAnchorAllowanceLower_bound_candidate :
  PositiveBoxExactVerticalAnchorAllowanceLowerBoundOnBox
    K M horizontalConstant horizontalScale horizontalRatio
    (positiveBoxExactVerticalAnchorAllowanceLowerCandidate
      K M horizontalConstant horizontalScale horizontalRatio)
```

Novo redutor principal:

```lean
positiveBox_exactGapAnchorAllowanceLowerComponentData_candidate
```

Ele monta:

```lean
PositiveBoxExactGapAnchorAllowanceLowerComponentData
```

para os candidatos:

```lean
positiveBoxAllowanceLowerCandidate
positiveBoxVerticalTailUpperCandidate
positiveBoxExactCentralUpperCandidate
positiveBoxExactVerticalAnchorAllowanceLowerCandidate
```

a partir de uma unica hipotese restante:

```lean
PositiveBoxAllowanceLowerComponentPaymentOnBox
  positiveBoxAllowanceLowerCandidate
  positiveBoxVerticalTailUpperCandidate
  positiveBoxExactCentralUpperCandidate
  (positiveBoxExactVerticalAnchorAllowanceLowerCandidate
    K M horizontalConstant horizontalScale horizontalRatio)
```

Expandida, esta obrigacao e:

```lean
(1 / 20) * (49 / 450) +
  (c2GenuineCentralExactUpper s +
   c2ContinuedCentralExactUpper s)
≤
  GenuineMiddleAudit.c2ExactVerticalAnchorResidualNormAllowance
    K M horizontalConstant horizontalScale horizontalRatio s
```

ponto a ponto na `positiveBox`, apos unfold dos candidatos. Esse e agora o
pagamento escalar sensivel a ser certificado.

## Registro 2026-07-05: wrapper da obrigacao candidata e ponte final local

Arquivo atualizado:

```lean
LeanC2/AuditContinuedQuartetPositiveBoxOddRefPhase.lean
```

Comando verificado:

```bash
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxOddRefPhase.lean
```

Nova abreviacao para a obrigacao restante:

```lean
PositiveBoxExactGapAnchorCandidateComponentPaymentOnBox
  K M horizontalConstant horizontalScale horizontalRatio
```

Novos conectores:

```lean
PositiveBoxExactGapAnchorFactorAllowanceLowerScalarBudgetOnBox.of_candidatePayment

PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_candidatePayment
```

Assim, a rota local atual fica:

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

Proximos alvos matematicos reais:

1. provar o dado phase-aware:

   ```lean
   PositiveBoxOddRefPhaseData
     oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate
   ```

2. provar o pagamento escalar candidato:

   ```lean
   PositiveBoxExactGapAnchorCandidateComponentPaymentOnBox
     K M horizontalConstant horizontalScale horizontalRatio
   ```

## Registro 2026-07-05: pagamento candidato em forma expanded

Arquivo atualizado:

```lean
LeanC2/AuditContinuedQuartetPositiveBoxOddRefPhase.lean
```

Comando verificado:

```bash
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxOddRefPhase.lean
```

Nova forma intervalar/expanded do pagamento:

```lean
PositiveBoxExactGapAnchorCandidateExpandedPaymentOnBox
  K M horizontalConstant horizontalScale horizontalRatio
```

Ela abre o pagamento candidato contra:

```lean
c2ExpandedQuartetResidualMargin s
c2HorizontalRegularizedUpper horizontalConstant horizontalScale horizontalRatio s
GenuineMiddleAudit.c2RawCentralCutoffNormConstant K M s
(1 + ‖q s‖) * (1 - ‖q s‖)⁻¹
```

Novo lema de equivalencia:

```lean
positiveBox_candidateComponentPayment_iff_expandedPayment :
  PositiveBoxExactGapAnchorCandidateExpandedPaymentOnBox
    K M horizontalConstant horizontalScale horizontalRatio
  ↔
  PositiveBoxExactGapAnchorCandidateComponentPaymentOnBox
    K M horizontalConstant horizontalScale horizontalRatio
```

Novos conectores:

```lean
PositiveBoxExactGapAnchorCandidateComponentPaymentOnBox.of_expandedPayment
PositiveBoxExactGapAnchorFactorAllowanceLowerScalarBudgetOnBox.of_candidateExpandedPayment
PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_candidateExpandedPayment
```

A rota local consumivel agora pode usar:

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

Proximo alvo recomendado: especializar essa forma expanded aos candidatos
ativos da positiveBox:

```lean
K = positiveBoxK
M = positiveBoxM
horizontalConstant = constantCoreHorizontalAmplitudeQRatio positiveBoxN
horizontalScale = unitScale
horizontalRatio = qNormHorizontalRatio
```

e reduzir a prova a uma desigualdade real com bounds de `q`, horizontal,
cutoff e quartet margin.

Atualizacao: essa especializacao ativa ja foi nomeada:

```lean
PositiveBoxExactGapAnchorActiveExpandedPaymentOnBox
```

e o conector ativo tambem:

```lean
PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeExpandedPayment
```

Agora o alvo operacional fica ainda mais curto:

```lean
PositiveBoxOddRefPhaseData
  oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate

PositiveBoxExactGapAnchorActiveExpandedPaymentOnBox

→

PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox
  positiveBoxK positiveBoxM
  (constantCoreHorizontalAmplitudeQRatio positiveBoxN)
  unitScale qNormHorizontalRatio
  (positiveBoxOddRefGapUpperFromHalfDisk halfDiskUpper)
```

## Registro 2026-07-05: interface intervalar para o expanded ativo

Arquivo atualizado:

```lean
LeanC2/AuditContinuedQuartetPositiveBoxOddRefPhase.lean
```

Comando verificado:

```bash
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxOddRefPhase.lean
```

Nova estrutura de certificacao por upper/lower bounds:

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

Ela reduz o expanded ativo a:

```lean
(((positiveBoxAllowanceLowerCandidate s *
      positiveBoxVerticalTailUpperCandidate s +
    centralBudget s + cutoffBudget s + horizontalBudget s) *
  (1 + ‖q s‖)) *
  (1 - ‖q s‖)⁻¹ +
  horizontalBudget s + cutoffBudget s ≤ marginLower s
```

na `positiveBox`.

Novo conector:

```lean
PositiveBoxExactGapAnchorActiveExpandedUpperData.to_activeExpandedPayment
```

e ponte direta:

```lean
PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeExpandedUpperData
```

Proximo alvo operacional:

Escolher/provar bounds concretos para:

```lean
centralBudget
cutoffBudget
horizontalBudget
marginLower
```

provavelmente reutilizando:

```lean
positiveBoxHorizontalUpperValue = 1 / 100
positiveBoxCutUpperValue = 3 / 1000
positiveBoxSectorLowerValue = 819 / 1000
positiveBox_q_norm_upper_7_25
positiveBox_q_norm_lower_11_40
```

mas com atencao: o `cutoffBudget` aqui mira

```lean
GenuineMiddleAudit.c2RawCentralCutoffNormConstant positiveBoxK positiveBoxM s
```

nao automaticamente o mesmo campo do cutoff continuado antigo.

## Registro 2026-07-05: candidatos exatos para budgets ativos

Arquivo atualizado:

```lean
LeanC2/AuditContinuedQuartetPositiveBoxOddRefPhase.lean
```

Comando verificado:

```bash
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxOddRefPhase.lean
```

Novos candidatos exatos:

```lean
positiveBoxActiveCentralBudgetExact
positiveBoxActiveCutoffBudgetExact
positiveBoxActiveHorizontalBudgetExact
positiveBoxActiveMarginLowerExact
```

Novo alvo escalar curto:

```lean
PositiveBoxExactGapAnchorActiveExactScalarBudgetOnBox
```

Conectores:

```lean
positiveBox_activeExpandedUpperData_exact_of_scalarBudget
PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeExactScalarBudget
```

Leitura: se for provado

```lean
PositiveBoxExactGapAnchorActiveExactScalarBudgetOnBox
```

entao, junto com

```lean
PositiveBoxOddRefPhaseData
  oddRef halfDiskUpper positiveBoxAllowanceLowerCandidate
```

obtem-se o scalar budget exact-gap ativo na positiveBox.

## Registro 2026-07-05: reducao horizontal e fator resolvente constante

Arquivo atualizado:

```lean
LeanC2/AuditContinuedQuartetPositiveBoxOddRefPhase.lean
```

Comando verificado:

```bash
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxOddRefPhase.lean
```

Novos candidatos/constantes:

```lean
positiveBoxActiveHorizontalBudgetCandidate
positiveBoxAllowanceTailDebitCandidate
positiveBoxActiveResolventFactorCandidate
```

Valores:

```lean
positiveBoxActiveHorizontalBudgetCandidate = fun _ => positiveBoxHorizontalUpperValue
positiveBoxAllowanceTailDebitCandidate = fun _ => (49 : ℝ) / 9000
positiveBoxActiveResolventFactorCandidate = (16 : ℝ) / 9
```

Novos alvos escalares:

```lean
PositiveBoxExactGapAnchorActiveHorizontalCandidateScalarBudgetOnBox
PositiveBoxExactGapAnchorActiveHorizontalCandidateScalarBudgetSimplifiedOnBox
PositiveBoxExactGapAnchorActiveHorizontalCandidateScalarBudgetResolventOnBox
```

Lemas principais:

```lean
positiveBox_allowance_mul_verticalTail_eq_tailDebit
positiveBox_activeHorizontalCandidateScalarBudget_iff_simplified
positiveBox_activeResolventFactor_le_candidate
positiveBox_activeHorizontalCandidateScalarBudgetSimplified_of_resolventBudget
```

Pontes finais:

```lean
PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeHorizontalCandidateScalarBudgetResolvent
PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeHorizontalCandidateScalarBudgetResolvent_ofOddTruncation
```

Alvo escalar mais limpo agora:

```lean
PositiveBoxExactGapAnchorActiveHorizontalCandidateScalarBudgetResolventOnBox
```

Ele remove do pagamento:

1. o produto `allowanceLower * verticalTailUpper`, substituido por `49 / 9000`;
2. o horizontal exato, substituido por `positiveBoxHorizontalUpperValue = 1 / 100`;
3. o fator variavel `(1 + ‖q‖) * (1 - ‖q‖)⁻¹`, substituido por `16 / 9`.

Restam sensiveis:

```lean
positiveBoxActiveCentralBudgetExact
positiveBoxActiveCutoffBudgetExact
positiveBoxActiveMarginLowerExact
```

ou candidatos intervalares para eles.

## Registro 2026-07-05: interface final intervalar

Arquivo atualizado:

```lean
LeanC2/AuditContinuedQuartetPositiveBoxOddRefPhase.lean
```

Comando verificado:

```bash
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxOddRefPhase.lean
```

Nova estrutura:

```lean
PositiveBoxExactGapAnchorActiveResolventUpperData
  centralBudget cutoffBudget marginLower
```

Ela fixa a parte horizontal/tail/resolvente ja reduzida e deixa somente:

```lean
central_upper
cutoff_upper
margin_lower
scalar_budget
```

Novo redutor:

```lean
PositiveBoxExactGapAnchorActiveResolventUpperData.to_resolventBudget
```

Novos conectores:

```lean
PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeResolventUpperData
PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeResolventUpperData_ofOddTruncation
```

Proximo alvo: escolher candidatos intervalares concretos para `centralBudget`,
`cutoffBudget` e `marginLower`, e fechar o `scalar_budget` dessa estrutura.

## Registro 2026-07-05: escolha baseline dos candidatos

Escolha atual:

```lean
positiveBoxActiveCentralBudgetBaseline := positiveBoxActiveCentralBudgetExact
positiveBoxActiveCutoffBudgetBaseline := positiveBoxActiveCutoffBudgetExact
positiveBoxActiveMarginLowerBaseline := positiveBoxActiveMarginLowerExact
```

Essa escolha mantem a rota correta e compilavel enquanto nao houver pontes
formais para constantes locais. Nao substituir ainda por:

- `positiveBoxAnchorUpperValue`, pois ele nao foi conectado a
  `positiveBoxActiveCentralBudgetExact`;
- `positiveBoxCutUpperValue`, pois ele bounda o `cutVec` local antigo e nao
  diretamente `c2RawCentralCutoffNormConstant positiveBoxK positiveBoxM`;
- margem setorial, pois o alvo atual usa a margem canonica
  `c2ExpandedQuartetResidualMargin`.

Novos nomes Lean:

```lean
PositiveBoxExactGapAnchorActiveBaselineScalarBudgetOnBox
positiveBox_activeResolventUpperData_baseline_of_scalarBudget
PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeBaselineScalarBudget
PositiveBoxExactGapAnchorGapUpperScalarBudgetOnBox.of_phaseData_activeBaselineScalarBudget_ofOddTruncation
```

Proximo alvo matematico:

```lean
PositiveBoxExactGapAnchorActiveBaselineScalarBudgetOnBox
```

Depois disso, refinar um componente por vez: primeiro procurar uma ponte
correta para o cutoff raw central; depois um lower canonico para a margem; por
ultimo um upper local para o central genuine/continued.

## Registro 2026-07-05: rota defect-aware local

Foi criada uma rota local melhor no shim `positiveBox`, sem mexer no spine
global. Ela troca a soma triangular

```lean
c2GenuineCentralExactUpper s + c2ContinuedCentralExactUpper s
```

por um upper direto do defeito:

```lean
‖genuineCentralDoubleSeries s - continuedCentralOddChannel s‖
```

Nomes principais:

```lean
PositiveBoxCentralDefectUpperBoundOnBox
positiveBoxCentralDefectExactUpper
PositiveBoxExactGapAnchorActiveDefectCandidateScalarBudgetResolventOnBox
```

Pontes finais:

```lean
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

Essa e a direcao certa para a positiveBox: usar fase/gap para o anchor
continuado e pagar apenas o defeito genuine/continued como termo central.

## Registro 2026-07-05: interface intervalar defect-aware

Foi formalizada a estrutura que sera a superficie principal de trabalho:

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

Redutor:

```lean
PositiveBoxExactGapAnchorActiveDefectResolventUpperData.to_exactDefectResolventBudget
```

Baseline exata:

```lean
positiveBoxActiveCentralDefectBudgetExact
PositiveBoxExactGapAnchorActiveExactDefectScalarBudgetOnBox
positiveBox_activeDefectResolventUpperData_exact_of_scalarBudget
```

Conectores:

```lean
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeDefectResolventUpperData
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeDefectResolventUpperData_ofOddTruncation
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectScalarBudget
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectScalarBudget_ofOddTruncation
```

Proximo passo: escolher/provar bounds para `centralDefectBudget`,
`cutoffBudget` e `marginLower`, nessa ordem pragmatica:

1. `cutoffBudget`, porque talvez exista ponte para algum cutoff local;
2. `marginLower`, garantindo que seja a margem canonica;
3. `centralDefectBudget`, que e o termo matematico mais sensivel.

## Registro 2026-07-05: cutoff continuado -> cutoff bruto

Foi fechada no shim `positiveBox` a ponte semantica correta para o cutoff:

```lean
PositiveBoxCutoffUpperData.of_cut_bound
positiveBoxActiveCutoffBudgetFromContinuedAndDefect
positiveBox_activeCutoffBudgetFromContinuedAndDefect_upper
```

A identidade usada e a ja existente no lado genuine:

```lean
‖c2ConcreteCutoffError K M s‖ ≤
  ‖c2ConcreteCutoffErrorFromTarget continuedCentralOddChannel K M s‖ +
  ‖genuineCentralDoubleSeries s - continuedCentralOddChannel s‖
```

Entao `PositiveBoxCutoffUpperData` nao e tratado como bound direto do cutoff
bruto. Ele vira:

```lean
positiveBoxCutUpperValue + centralDefectBudget s
```

Tambem vale a volta pratica:

```lean
∀ s∈positiveBox, ‖cutVec positiveBoxK positiveBoxM s‖ ≤ positiveBoxCutUpperValue
→ PositiveBoxCutoffUpperData
```

porque `cutVec positiveBoxK positiveBoxM` e o continued cutoff error.

## Registro 2026-07-05: decomposicao depth/core do cutoff

Foi aberta uma superficie mais estruturada para provar o cutoff sem usar a
rota explicita baseada em upper zeta.

O split usado e:

```lean
c2ContinuedCutoffError_eq_depth_core_split
```

Isto reduz o `cutVec` a dois pagamentos:

```lean
2 * depthFactorUpper * oddTruncationUpper
+
2 * depthCutoffUpper * continuedOddUpper
```

Novos nomes Lean:

```lean
PositiveBoxDepthFactorUpperBoundOnBox
PositiveBoxContinuedOddTruncationUpperBoundOnBox
PositiveBoxDepthCutoffUpperBoundOnBox
PositiveBoxContinuedOddUpperBoundOnBox
PositiveBoxCutoffDepthCoreScalarBudgetOnBox

positiveBox_cut_bound_of_depthCoreScalarBudget
PositiveBoxCutoffUpperData.of_depthCoreScalarBudget
```

A parte geometrica ja esta conectada:

```lean
positiveBoxDepthFactorExplicitUpper
positiveBoxDepthCutoffExplicitUpper
positiveBox_depthFactor_bound_explicit
positiveBox_depthCutoff_bound_explicit
```

O pacote de truncamento impar continuado entra por:

```lean
PositiveBoxContinuedOddTruncationData.to_cutoffTruncationUpperBoundOnBox
```

Alvos curtos:

```lean
PositiveBoxCutoffExplicitDepthCoreScalarBudgetOnBox continuedOddUpper
PositiveBoxCutoffExplicitDepthCoreExactOddScalarBudgetOnBox
PositiveBoxCutoffUpperData.of_explicitDepthCoreScalarBudget
PositiveBoxCutoffUpperData.of_explicitDepthCoreExactOddScalarBudget
```

Novo horizonte para cutoff:

1. obter `PositiveBoxContinuedOddTruncationData`;
2. escolher um `continuedOddUpper` genuine-first;
3. provar o scalar budget depth/core;
4. consumir `PositiveBoxCutoffUpperData.of_explicitDepthCoreScalarBudget`.

Isso e preferivel a usar a rota `c2ExplicitFiniteCoreContinuedCutoffUpper`,
porque aquela rota passa por upper zeta e nao e insumo permitido no middle
ativo.

Novos alvos e conectores:

```lean
PositiveBoxExactGapAnchorActiveDefectContinuedCutoffScalarBudgetOnBox
positiveBox_activeDefectResolventUpperData_of_continuedCutoffData
PositiveBoxExactGapAnchorActiveExactDefectContinuedCutoffScalarBudgetOnBox

PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeDefectContinuedCutoffScalarBudget
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeDefectContinuedCutoffScalarBudget_ofOddTruncation
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectContinuedCutoffScalarBudget
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectContinuedCutoffScalarBudget_ofOddTruncation
```

Com isso, o cutoff bridge esta resolvido como plumbing Lean. Ainda falta
provar/fornecer `PositiveBoxCutoffUpperData` numericamente ou intervalarmente.

Proximo horizonte geral:

1. fechar a rota depth/core do cutoff:
   `PositiveBoxContinuedOddTruncationData`,
   `continuedOddUpper` e
   `PositiveBoxCutoffExplicitDepthCoreScalarBudgetOnBox continuedOddUpper`;
2. consumir `PositiveBoxCutoffUpperData.of_explicitDepthCoreScalarBudget`;
3. buscar um lower para a margem canonica
   `c2ExpandedQuartetResidualMargin`, sem trocar pela margem setorial;
4. depois reduzir `centralDefectBudget`;
5. por fim combinar com `PositiveBoxOddRefPhaseData` e o half-disk `< 1 / 40`.

## Registro 2026-07-05: oddRef truncation alimenta cutoff depth/core

Foi fechada a ponte que transforma truncamento no lado `oddRef` em
truncamento do canal continuado, desde que a compatibilidade local seja dada:

```lean
PositiveBoxContinuedOddTruncationData.of_oddRefTruncation
```

Hipoteses:

```lean
PositiveBoxOddRefContinuedCompatibility oddRef
PositiveBoxOddRefTruncationData oddRef
```

Conclusao:

```lean
PositiveBoxContinuedOddTruncationData
```

Tambem foram adicionados wrappers para consumir essa ponte diretamente no
cutoff:

```lean
PositiveBoxCutoffUpperData.of_oddRefTruncation_explicitDepthCoreScalarBudget
PositiveBoxCutoffUpperData.of_oddRefTruncation_explicitDepthCoreExactOddScalarBudget
```

E wrappers finais para levar isso ate o alvo defect-aware com cutoff continuado:

```lean
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectContinuedCutoffScalarBudget_ofOddTruncation_oddRefDepthCore
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectContinuedCutoffScalarBudget_ofOddTruncation_oddRefExactOddDepthCore
```

Atualizacao seguinte: tambem ha wrappers sobre o pacote:

```lean
PositiveBoxOddRefBridgeBounds data
```

que ja contem o truncamento `oddRef` como campo:

```lean
truncation : PositiveBoxOddRefTruncationData data.oddRef
```

Nomes:

```lean
PositiveBoxCutoffUpperData.of_oddRefBridgeBounds_explicitDepthCoreScalarBudget
PositiveBoxCutoffUpperData.of_oddRefBridgeBounds_explicitDepthCoreExactOddScalarBudget
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectBridgeBoundsDepthCore
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectBridgeBoundsExactOddDepthCore
```

Importante: os wrappers finais sobre `BridgeBounds` recebem
`PositiveBoxHorizontalUpperData` como campo separado. Isso evita confundir o
horizontal ativo:

```lean
PositiveBoxOddTruncationData
```

com o truncamento do cutoff via referencia abstrata:

```lean
PositiveBoxOddRefTruncationData data.oddRef
```

Tambem foi criada a fronteira atual como checklist compilavel:

```lean
PositiveBoxActiveExactDefectBridgeBoundsDepthCoreFrontier
PositiveBoxActiveExactDefectBridgeBoundsExactOddFrontier
```

Consumidores:

```lean
PositiveBoxActiveExactDefectBridgeBoundsDepthCoreFrontier.to_verticalResidualDominance
PositiveBoxActiveExactDefectBridgeBoundsExactOddFrontier.to_verticalResidualDominance
```

Atalho novo para pagar o campo horizontal com `PositiveBoxOddTruncationData`:

```lean
PositiveBoxActiveExactDefectBridgeBoundsDepthCoreFrontier.ofOddTruncation
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectBridgeBoundsDepthCore_ofOddTruncation

PositiveBoxActiveExactDefectBridgeBoundsExactOddFrontier.ofOddTruncation
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectBridgeBoundsExactOddDepthCore_ofOddTruncation
```

Versoes diretas para o pacote explicito:

```lean
PositiveBoxActiveExactDefectBridgeBoundsDepthCoreFrontier.ofRawOddTruncation
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectBridgeBoundsDepthCore_ofRawOddTruncation

PositiveBoxActiveExactDefectBridgeBoundsExactOddFrontier.ofRawOddTruncation
PositiveBoxExactVerticalResidualDominanceOnBox.of_phaseData_activeExactDefectBridgeBoundsExactOddDepthCore_ofRawOddTruncation
```

Com isso, o item "obter `PositiveBoxContinuedOddTruncationData`" pode ser
atacado por uma rota genuine-first:

```lean
oddRef truncation + oddRef compatibility
```

em vez de estimar o canal continuado abrindo sua definicao analitica.

Verificacao:

```bash
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxOddRefPhase.lean
```

passou sem saida.

Higiene nos shims ativos:

```bash
rg -n "sorry|admit|axiom|unsafe|riemannZeta|ExactZeta|zetaUpper|zetaDepthCore|\bzeta\b" \
  LeanC2/AuditContinuedQuartetPositiveBoxCutoff.lean \
  LeanC2/AuditContinuedQuartetPositiveBoxOddRefPhase.lean
```

sem matches.

Horizonte revisado:

1. Construir/fornecer `PositiveBoxOddRefTruncationData oddRef`.
2. Construir/fornecer `PositiveBoxOddRefContinuedCompatibility oddRef`.
3. Escolher um `continuedOddUpper` genuine-first ou usar a especializacao exata
   como interface temporaria.
4. Fechar `PositiveBoxCutoffExplicitDepthCoreScalarBudgetOnBox continuedOddUpper`.
5. Consumir no alvo defect-aware com cutoff continuado.

## Registro 2026-07-05: ajuste do cutoff para truncamento flexivel

A tentativa seguinte foi mirar a especializacao:

```lean
PositiveBoxCutoffExplicitDepthCoreExactOddScalarBudgetOnBox
```

Esse alvo e compilavel como interface, mas fixa internamente:

```lean
positiveBoxOddTruncationUpperValue = 7 / 180
```

Diagnostico: esse valor vem do controle horizontal e parece grosseiro para o
cutoff, cujo alvo e:

```lean
positiveBoxCutUpperValue = 3 / 1000
```

O termo critico e:

```lean
2 * positiveBoxDepthFactorExplicitUpper s *
  positiveBoxOddTruncationUpperValue
```

Ele provavelmente ja fica grande demais para a margem do cutoff. Isso nao foi
formalizado como impossibilidade, mas muda a prioridade: precisamos de um
truncamento especifico para cutoff.

Nova superficie criada:

```lean
PositiveBoxCutoffExplicitDepthCoreFlexibleScalarBudgetOnBox
PositiveBoxCutoffExplicitDepthCoreFlexibleExactOddScalarBudgetOnBox
PositiveBoxCutoffUpperData.of_explicitDepthCoreFlexibleScalarBudget
PositiveBoxCutoffUpperData.of_explicitDepthCoreFlexibleExactOddScalarBudget
```

Ela permite trocar:

```lean
fun _ => positiveBoxOddTruncationUpperValue
```

por um bound dedicado:

```lean
oddTruncationUpper : ℂ → ℝ
```

A nova fronteira compilavel e:

```lean
PositiveBoxActiveExactDefectFlexibleCutoffDepthCoreFrontier
PositiveBoxActiveExactDefectFlexibleCutoffExactOddFrontier
```

Consumidores:

```lean
PositiveBoxActiveExactDefectFlexibleCutoffDepthCoreFrontier.to_verticalResidualDominance
PositiveBoxActiveExactDefectFlexibleCutoffExactOddFrontier.to_verticalResidualDominance
```

Campos restantes na versao exata flexivel:

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

Horizonte agora:

1. produzir um `oddTruncationUpper` menor que `7 / 180` para o cutoff;
2. provar
   `PositiveBoxContinuedOddTruncationUpperBoundOnBox oddTruncationUpper`;
3. fechar
   `PositiveBoxCutoffExplicitDepthCoreFlexibleExactOddScalarBudgetOnBox
     oddTruncationUpper`;
4. manter a fase `PositiveBoxOddRefPhaseData` e o scalar budget defect-aware
   como campos separados;
5. depois juntar tudo pela fronteira flexivel.

Verificacao:

```bash
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxCutoff.lean
lake build LeanC2.AuditContinuedQuartetPositiveBoxOddRefPhase
```

Resultado: passou. O segundo comando ainda mostra warnings de linha longa no
arquivo de auditoria, sem erro de elaboracao.

## Registro 2026-07-05: tentativa phase-cutoff

Depois da fronteira flexivel, foi feita a tentativa natural: usar o dado de
fase para fornecer tambem um upper de norma para o canal impar continuado.

A ponte adicionada foi:

```lean
positiveBoxContinuedOddUpperFromHalfDisk
PositiveBoxOddRefPhaseData.to_continuedOddUpperBoundOnBox
```

Com a allowance ativa:

```lean
positiveBoxAllowanceLowerCandidate = fun _ => 1 / 20
```

obtemos o candidato constante:

```lean
positiveBoxContinuedOddUpperPhaseCandidate = fun _ => 21 / 40
PositiveBoxOddRefPhaseData.to_continuedOddUpperBoundOnBox_candidate
```

Tambem foi parametrizado o truncamento no lado `oddRef`:

```lean
PositiveBoxOddRefTruncationUpperBoundOnBox
PositiveBoxOddRefTruncationData.to_truncationUpperBoundOnBox
PositiveBoxContinuedOddTruncationUpperBoundOnBox.of_oddRefTruncationUpper
```

Nova fronteira compilavel:

```lean
PositiveBoxActiveExactDefectPhaseCutoffFrontier
PositiveBoxActiveExactDefectPhaseCutoffFrontier.to_verticalResidualDominance
```

Campos:

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

Diagnostico:

O plumbing ficou correto, mas a rota ainda passa pelo budget triangular:

```lean
2 * positiveBoxDepthFactorExplicitUpper s * oddTruncationUpper s +
  2 * positiveBoxDepthCutoffExplicitUpper s *
    positiveBoxContinuedOddUpperPhaseCandidate s
≤ positiveBoxCutUpperValue
```

Como `positiveBoxContinuedOddUpperPhaseCandidate = 21 / 40`, o segundo termo
parece grande para `positiveBoxCutUpperValue = 3 / 1000` com `K = 3`. Isso
nao foi formalizado como barreira; e um alerta de rota.

Proxima decisao tecnica:

1. testar formalmente se o budget acima e impossivel ou apenas muito apertado;
2. se for impossivel, trocar a decomposicao do cutoff por uma versao
   phase-aware/cancellation-aware;
3. alternativamente, flexibilizar o valor de cutoff no ledger defect-aware,
   sem misturar isso com a rota horizontal antiga.

Verificacao:

```bash
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxOddRefPhase.lean
lake build LeanC2.AuditContinuedQuartetPositiveBoxOddRefPhase
```

Resultado: passou, com warnings de linha longa.

## Registro 2026-07-05: barreira formal contra o phase-cutoff triangular

O teste formal pedido no registro anterior foi feito. Resultado: a fronteira
phase-cutoff triangular nao e viavel.

Novos lemas:

```lean
positiveBox_corner_mem
positiveBox_phaseCandidate_depthCutoffTerm_exceeds_cutUpper
not_positiveBoxCutoffExplicitDepthCoreFlexibleScalarBudgetOnBox_phaseCandidate_at
not_PositiveBoxActiveExactDefectPhaseCutoffFrontier
```

A prova usa o ponto:

```lean
{ re := positiveBoxSigmaMin, im := positiveBoxTMin } ∈ positiveBox
```

e o lower ja existente:

```lean
‖q s‖ ≥ 11 / 40
```

Como o upper de fase e:

```lean
positiveBoxContinuedOddUpperPhaseCandidate = fun _ => 21 / 40
```

o termo de cutoff:

```lean
2 * positiveBoxDepthCutoffExplicitUpper s *
  positiveBoxContinuedOddUpperPhaseCandidate s
```

ja excede:

```lean
positiveBoxCutUpperValue = 3 / 1000
```

Consequencia: para qualquer `oddTruncationUpper` nao negativo no ponto, nao
existe:

```lean
PositiveBoxCutoffExplicitDepthCoreFlexibleScalarBudgetOnBox
  oddTruncationUpper positiveBoxContinuedOddUpperPhaseCandidate
```

Portanto, a estrutura:

```lean
PositiveBoxActiveExactDefectPhaseCutoffFrontier
```

tambem nao pode ser o alvo.

### Orientacao revisada

Nao gastar mais esforco tentando reduzir apenas o truncamento impar dentro da
mesma decomposicao triangular. A obstrucao vem do segundo termo, antes mesmo do
truncamento.

O proximo passo recomendado e abrir uma nova superficie para o cutoff que
preserve cancelamento/fase no termo de depth-cutoff, ou entao revisar o budget
de cutoff no ledger defect-aware antes de manter
`positiveBoxCutUpperValue = 3 / 1000`.

Comandos verificados depois dessa atualizacao:

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
