# Auditoria das rotas middle genuine

Data: 2026-07-05.

## Regra de leitura

Rota ativa: **Genuine-First**.

Nao usar `riemannZeta`, `zeta`, `ExactZeta`, `zetaUpper` ou `zetaDepthCore`
como insumo analitico, estimativa, comparacao ou atalho na middle route.
Esses nomes podem aparecer em mapas terminais, diagnosticos historicos ou
auditoria de rotas antigas, mas nao como prova da middle ativa.

Esta auditoria le os markdowns como registros historicos. Quando arquivos
antigos entram em conflito com os registros mais novos, prevalecem os cadernos
atuais:

```text
AVANCOS_MIDDLE_GENUINE.md
HANDOFF_NOVO_CHAT_MIDDLE_GENUINE.md
ORIENTACAO_MIDDLE_GENUINE.md
```

## Resumo executivo

### Rotas com horizonte real

1. **Gap-aware / exact anchor / tail-norm phase-saving**
   Esta e a rota middle genuine mais promissora hoje. Ela ja tem wrappers
   Lean ate `genuineCentralDoubleSeries s ≠ 0`; o conteudo restante e provar
   um saving de fase/gap genuine-first, nao um bound norm-only.

2. **SuperGaussian / two-core / flexible self-band ledger**
   Rota promissora e genuine-first, mas com uma obstrucao aberta clara:
   falta uma fonte legitima para `C2RawCentralRectangleTailUpperBudget`.
   Bracket-decay ajuda a orientar, mas nao fecha por telescopia na forma atual.

3. **C2 center Gaussian zero certificate**
   Rota paralela promissora como certificado de zeros do carrier Gaussian
   regularizado. A parte Lean do carrier e da cauda esta forte; falta trocar
   winding/borda numericos por certificado intervalar/formal e depois decidir
   se havera ponte para a middle genuine.

4. **Positive-box/q-ratio/vSplit como laboratorio**
   Util para descobrir decomposicoes, setor, fase e cancelamento. Nao e entrada
   direta da rota principal. A fronteira `phase-cutoff` triangular foi
   formalmente descartada; o que ainda pode ser explorado e uma decomposicao
   cancellation-aware/phase-aware de cutoff.

### Rotas mortas ou aposentadas

- `C2CanonicalClosedScaledLocalData` como alvo direto na formulacao atual.
- upper residual canonicamente fechada/`FiniteExactZeta` como rota terminal.
- atalhos triangulares crus: `constantCoreTriangleResidualUpper`,
  raw triangle vertical sem saving, e variantes saturadas.
- odd-anchor norm-only, incluindo `C2GenuineOddAnchorLocalData`.
- odd-metric slack/cleared budget com uppers naturais nao negativos.
- `PositiveBoxActiveExactDefectPhaseCutoffFrontier`.
- q-ratio sozinho como prova do middle.
- bracket-decay usado como se a ponte de correcao telescopasse.
- rotas continued/zeta-defined usadas como evidencia geometrica da middle.

## Rotas vivas

### 1. Gap-aware / exact anchor / phase-saving

Status: **promissora, alvo principal de contabilidade middle**.

Fontes principais:

```text
MAPA_MIDDLE_GENUINE_NEQ_ZERO.md
ORIENTACAO_MIDDLE_GENUINE.md
AVANCOS_MIDDLE_GENUINE.md
HANDOFF_NOVO_CHAT_MIDDLE_GENUINE.md
AUDIT_GENUINE_MIDDLE_TODO.md
```

Objetos Lean importantes:

```lean
C2ExactGapAnchorPhaseSavingOnMiddle
C2ExactGapAnchorPhaseDiskOnMiddle
C2ExactGapAnchorTailNormAnchorResidualBudgetOnMiddle
C2ExactGapAnchorFactorUpperLowerBudgetOnMiddle
genuineCentral_ne_zero_on_middle_of_exactGapAnchorPhaseSaving
genuineCentral_ne_zero_on_middle_of_exactGapAnchorTailNormAnchorResidualBudget
genuineCentral_ne_zero_on_middle_of_exactGapAnchorExplicitBudget
```

Forma matematica limpa:

```lean
‖c2ContinuedVerticalAnchorResidual s‖ <
  ‖verticalDepthTailFromTwo s‖ *
    c2ExactGapAnchorFactorAllowance
      K M horizontalConstant horizontalScale horizontalRatio s
```

Equivalente em gap:

```lean
‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖ <
  c2ExactGapAnchorFactorAllowance
    K M horizontalConstant horizontalScale horizontalRatio s
```

Por que e promissora:

- evita a perda norm-only `1 + 2 * oddUpper`;
- trabalha com o gap real do canal impar;
- ja tem wrappers Lean ate o endpoint literal `genuineCentralDoubleSeries s ≠ 0`;
- identifica a necessidade real: saving de fase e allowance positiva.

Pendencias reais:

- produzir uma estimativa genuine-first do gap/fase;
- garantir allowance positiva por budgets externos ou por lower direto;
- evitar abrir `continuedOddDirichletChannel` por sua definicao terminal como
  insumo analitico;
- na positive-box, substituir o cutoff triangular por uma decomposicao que
  preserve cancelamento/fase.

## 2. SuperGaussian / two-core / flexible self-band

Status: **promissora, mas com gargalo aberto**.

Fontes:

```text
NEXT_ACTIVE_STEP.md
AUDIT_GENUINE_MIDDLE_FLEXIBLE_SELF_BAND_LEDGER.md
AUDIT_GENUINE_BRACKET_DECAY_RAW_TAIL.md
AUDIT_GENUINE_BRIDGE_CORRECTION_COEFFICIENTS.md
TEMP_STATUS_MIDDLE_GENUINE.md
```

Endpoint reduzido:

```lean
exists K N,
  2 <= K ∧
  3 <= N ∧
  C2FiniteCoreLimitExtraScalarMarginBudget K N s
```

Leitura do budget:

```text
finiteCoreLimitExtraDebtAt K N s
  + 9 * (1 / 2) ^ (K + 1)
< superGaussianFiniteTwoCoreUnitStripScalarMargin s
```

Por que e promissora:

- mantem a rota no lado genuine;
- tem ledger fino com componentes nomeados;
- removeu varios falsos gargalos por wrappers Lean;
- preserva a possibilidade de escolher `K,N,L` em vez de fixar uma caixa ruim.

Gargalo atual:

```lean
C2RawCentralRectangleTailUpperBudget N L s R
```

Isto e:

```text
rawCentralRectangleTailAt N L s <= R
```

O que nao fecha:

- bracket-decay nao fornece esse bound diretamente;
- a ponte de correcao entre termo central atual e bracket-decay contem massa
  bulk nao telescopica;
- nao ha ainda theorem genuine-first de split/convergencia do retangulo central
  na forma consumida por esse budget.

Proximo passo honesto:

- provar uma upper direta para `rawCentralRectangleTailAt`;
- ou reformular o carrier para que a familia somada seja de fato a familia
  bracket-decay;
- ou controlar a bridge correction com um bound que preserve cancelamento.

## 3. C2 center Gaussian zero certificate

Status: **rota paralela promissora, nao substitui a middle ainda**.

Fontes:

```text
C2_CENTER_GAUSSIAN_ZERO_CERTIFICATE_PACK.md
C2_CENTER_GAUSSIAN_CARRIER_STATUS.md
AUDIT_C2_CENTER_GAUSSIAN_TAIL_BUDGET_LEAN.md
AUDIT_C2_CENTER_GAUSSIAN_INTERVAL_CERTIFICATION_PLAN.md
AUDIT_C2_CENTER_GAUSSIAN_FULL_DEPTH_BOXES.md
AUDIT_C2_CENTER_GAUSSIAN_TAIL_LIFT.md
```

Objeto:

```lean
c2CenterGaussianSeries X s
```

com:

```text
X = 66666.66666666667
```

O que ja e forte:

- carrier formal em Lean;
- corte por centro alinhado com o script;
- convergencia/lift de cauda formalizados;
- budget funcional de cauda compila;
- 7 caixas numericamente certificadas para o carrier infinito com folga enorme
  entre margem e cauda.

O que falta:

- substituir avaliacao numerica de borda por aritmetica intervalar ou
  certificado formal equivalente;
- formalizar winding/argument principle ou certificado de zero consumivel;
- se a rota quiser virar middle, construir uma ponte entre esse carrier
  Gaussian regularizado e o objeto genuine central/middle.

Classificacao:

- **promissora como certificado C2-Gaussian**;
- **nao e prova atual de `genuineCentralDoubleSeries s ≠ 0`**;
- **nao e barreira**, apenas ramo paralelo ainda sem ponte para o alvo middle.

## 4. Positive-box / q-ratio / vSplit / setor

Status: **laboratorio util, nao rota principal direta**.

Fontes:

```text
archive/positive_box/*.md
archive/lab_diagnostics/*.md
AUDIT_MIDDLE_ROUTE_LEDGER_CURRENT.md
AUDIT_RETURN_TO_MAIN_MIDDLE_ROUTE.md
AVANCOS_MIDDLE_GENUINE.md
```

O que entregou:

- bounds de endpoints e norma de `q`;
- dados setoriais/fase para o prefixo vertical;
- q-ratio como horizontal melhor do que unit-half;
- split auditavel:

```lean
anchor = verticalDepthTailFromTwo s - continuedCentralOddChannel s
cutVec K M s = rectangularGenuine s K M - continuedCentralOddChannel s
vSplit K M s = anchor s + cutVec K M s
```

O que continua util:

- usar q-ratio como baseline horizontal;
- usar margem setorial em subcaixas;
- explorar `anchor + CutVec` com cancelamento;
- desenhar cutoff phase-aware/cancellation-aware.

O que nao deve ser feito:

- promover positive-box direto para `C2CanonicalClosedScaledLocalData`;
- tratar `cutVec` como erro finito puro;
- usar continued channel como bound genuine-first sem ponte;
- insistir no `phase-cutoff` triangular.

Barreira nova formal:

```lean
positiveBox_phaseCandidate_depthCutoffTerm_exceeds_cutUpper
not_positiveBoxCutoffExplicitDepthCoreFlexibleScalarBudgetOnBox_phaseCandidate_at
not_PositiveBoxActiveExactDefectPhaseCutoffFrontier
```

Leitura: com `positiveBoxContinuedOddUpperPhaseCandidate = 21 / 40`, o termo
de depth-cutoff sozinho excede `positiveBoxCutUpperValue = 3 / 1000`. Reduzir
somente `oddTruncationUpper` nao resolve.

## 5. Candidate-family scanner

Status: **exploratorio, nao prova**.

Fontes:

```text
archive/canonical_barrier/C2_CANDIDATE_FAMILY_SCANNER_EXTRACT.md
archive/canonical_barrier/C2_CANONICAL_MIDDLE_CERTIFICATE_EXTRACT.md
archive/lab_diagnostics/AUDIT_QRATIO_POCKETS_AND_VSPLIT_REPORT.md
```

Uso valido:

- procurar familias `N,K,M`, cutoffs e horizontais que evitem uma porta ja
  barrada;
- medir onde q-ratio, setor e split `anchor/CutVec` dao folga;
- orientar subcaixas para provas intervalares futuras.

Uso invalido:

- testar a porta publica canonical ja barrada esperando slack positivo;
- usar diagnostico com canal terminal como prova middle;
- promover resultado de scanner sem certificado intervalar/Lean.

## Rotas mortas ou aposentadas

### A. Canonical closed scaled local data direto

Status: **morta na formulacao atual**.

Evidencia:

```lean
not_c2CanonicalClosedScaledResidualUpper_lt_residualMargin_of_offCriticalStrip
not_c2CanonicalClosedScaledLocalData_of_offCriticalStrip
AuditMiddleBarrier.audit_CanonicalMiddleObligation_forces_middle_empty
```

Leitura: o pacote `C2CanonicalClosedScaledLocalData`, como esta formulado, nao
e habitavel em ponto off-critical. Ele pode existir como porta terminal antiga,
mas nao deve ser perseguido como alvo local da middle ativa.

### B. Residual canonical totalmente explicito / FiniteExactZeta

Status: **morta e fora da rota ativa**.

Evidencia:

```lean
c2ExpandedQuartetResidualMargin_lt_scaledVerticalDepthTail_of_offCriticalStrip
c2AnalyticBulkAllowance_sub_reserve_lt_scaledVerticalDepthTail_of_offCriticalStrip
not_c2CanonicalClosedScaledResidualFiniteExactZetaUpper_lt_analyticResidual_of_offCriticalStrip
```

Leitura: o termo vertical sozinho ja excede a margem. Alem disso, a familia
`ExactZeta` nao pode ser insumo da middle Genuine-First.

### C. Triangle residual shortcut

Status: **morta como shortcut**.

Evidencia:

```lean
not_constantCoreTriangleResidualUpper_lt_allowanceReserve
not_C2RawTriangleResidualDominance_of_verticalDepthTailUpper_le_rawTriangle
not_C2RawTriangleResidualDominance_of_verticalDepthTailUpper_le_tailNorm
```

Leitura: a triangulacao crua nao enxerga o saving necessario. A rota viva e a
refined/exact vertical residual, anchor residual ou gap-aware.

### D. Odd-anchor norm-only

Status: **morta**.

Evidencia:

```lean
not_C2GenuineOddAnchorFinalBudget_of_nonneg_uppers
not_C2GenuineOddAnchorInheritedBudget_of_nonneg_uppers
not_C2GenuineOddAnchorLocalData
```

Leitura: o bound `1 + 2 * oddUpper` e grande demais. Precisa de gap direto ou
saving de fase.

### E. Odd-metric slack / cleared route

Status: **morta sob uppers naturais nao negativos**.

Evidencia:

```lean
c2_cleared_tail_min_gt_cleared_quartet_margin_scalar
not_C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceClearedBudget_of_nonneg
```

Leitura: o pagamento cleared mostra que a forma norm-only fica overbudget.
Usar como diagnostico, nao como alvo.

### F. PositiveBox phase-cutoff triangular

Status: **morta formalmente**.

Evidencia:

```lean
positiveBox_corner_mem
positiveBox_phaseCandidate_depthCutoffTerm_exceeds_cutUpper
not_positiveBoxCutoffExplicitDepthCoreFlexibleScalarBudgetOnBox_phaseCandidate_at
not_PositiveBoxActiveExactDefectPhaseCutoffFrontier
```

Leitura: a fase `21 / 40` ainda e grande demais para o budget triangular de
cutoff. O segundo termo ja passa de `3 / 1000`.

### G. Bracket-decay como telescopia direta

Status: **morta como atalho; aberta como inspiracao para carrier novo**.

Evidencia documental:

```text
AUDIT_GENUINE_BRACKET_DECAY_RAW_TAIL.md
AUDIT_GENUINE_BRIDGE_CORRECTION_COEFFICIENTS.md
```

Leitura: a bridge correction e bulk nao telescopico. Nao tomar normas das
pecas separadamente esperando decay automatico.

### H. q-ratio sozinho

Status: **insuficiente**.

Evidencia:

```text
archive/lab_diagnostics/AUDIT_HORIZONTAL_QRATIO_REPORT.md
```

Leitura: q-ratio melhora muito o horizontal, mas nao fecha a middle. Nos
melhores pontos, o gargalo muda para `V_exact`/anchor/cutoff.

### I. Continued-channel factor target como prova middle

Status: **transfer-side/diagnostico, nao active proof input**.

Evidencia:

```text
AUDIT_ADJUSTED_QUARTET_TODO.md
AUDIT_ADJUSTED_QUARTET_ROUTE.md
```

Leitura: onde `continuedOddDirichletChannel` e aberto pela definicao terminal,
a rota deixa de ser middle Genuine-First. Para voltar a ser ativa, precisa de
um canal/gap genuine-first ou uma compatibilidade explicitamente certificada.

## Rotas condicionais que nao estao mortas

### oddRef

Status: **congelada, nao morta**.

Ela e uma interface abstrata util se algum dia construirmos uma referencia
impar genuine com compatibilidade. Hoje nao deve ser o proximo alvo, porque nao
constrói a referencia nem fecha a middle.

### PositiveBox cutoff upper data

Status: **condicional e channel-dependent**.

`PositiveBoxCutoffUpperData` e util como ponte, mas o bound numerico de cutoff
nao deve ser tratado como escalar genuine-first sem resolver a semantica do
canal continuado ou sem nova decomposicao cancellation-aware.

### Adjusted/continued quartet route

Status: **plumbing/diagnostico, nao alvo geometrico principal**.

Parte do encanamento ate endpoints terminais compila, mas o conteudo
geometrico precisa ser reconstruido por canal/gap genuine-first para voltar a
ser prova ativa da middle.

## Horizonte recomendado

### Frente assumida agora

A frente principal foi comprimida em:

```text
LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

Objeto:

```lean
C2ExactGapAnchorCanonicalUpperLowerMiddleData
```

Essa rota e a versao mais promissora no momento porque fixa o upper exato do
anchor residual e evita reintroduzir uma envoltoria triangular morta. O alvo
remanescente e:

```lean
C2ExactGapAnchorFactorAllowanceLowerBoundOnMiddle
  horizontalConstant horizontalScale horizontalRatio allowanceLower near edge

C2ExactGapAnchorFactorUpperLowerBudgetOnMiddle
  c2ContinuedVerticalAnchorResidualExactFactorUpper allowanceLower near edge
```

O conversor

```lean
C2ExactGapAnchorCanonicalUpperLowerMiddleData.to_ne_zero_on_middle
```

fecha `genuineCentralDoubleSeries s ≠ 0` no middle assim que essas obrigacoes,
mais horizontal/scale, forem fornecidas.

Tambem existe o construtor:

```lean
C2ExactGapAnchorCanonicalUpperLowerMiddleData.of_scaleData_scalarBudget
```

que troca o lower bound da allowance pelo budget escalar:

```lean
C2ExactGapAnchorFactorAllowanceLowerScalarBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio allowanceLower near edge
```

Assim, o proximo alvo pratico pode ser organizado como:

```lean
C2ExactGapAnchorFactorAllowanceLowerScalarBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio allowanceLower near edge

C2ExactGapAnchorFactorUpperLowerBudgetOnMiddle
  c2ContinuedVerticalAnchorResidualExactFactorUpper allowanceLower near edge
```

Escolha feita para `allowanceLower`:

```lean
c2ExactGapAnchorExactGapExpandedUpperFactorReserveLower externalDebitUpper
```

O shim agora tem:

```lean
C2ExactGapAnchorCanonicalUpperLowerMiddleData.of_scaleData_factorReserveLower
```

Portanto a frente escolhida consome:

```lean
C2ExactGapAnchorExactGapExpandedUpperExternalDebitUpperBoundOnMiddle
  c2GenuineCentralExactUpper c2ContinuedCentralExactUpper
  (c2HorizontalRegularizedUpper horizontalConstant horizontalScale horizontalRatio)
  (c2RawCentralCutoffNormConstant K M)
  externalDebitUpper near edge

C2ExactGapAnchorExactGapExpandedUpperExternalFactorBudgetOnMiddle
  externalDebitUpper near edge
```

Essa escolha evita tanto a allowance exata inteira quanto a familia
`tailLowerDistorted/oddMetric`, que tem barreira formal na versao cleared com
slack nao-negativo.

Refinamento adicional: escolher o debito externo mais fino possivel dentro
desse ledger:

```lean
c2ExactGapAnchorCanonicalExternalDebit
  K M horizontalConstant horizontalScale horizontalRatio
```

com construtor:

```lean
C2ExactGapAnchorCanonicalUpperLowerMiddleData.of_scaleData_canonicalExternalDebit
```

e wrapper direto:

```lean
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExternalFactorBudget
```

O alvo remanescente passa a ser:

```lean
C2ExactGapAnchorExactGapExpandedUpperExternalFactorBudgetOnMiddle
  (c2ExactGapAnchorCanonicalExternalDebit
    K M horizontalConstant horizontalScale horizontalRatio)
  near edge
```

Esse alvo evita component upper grosseiro e preserva o saldo maximo disponivel
no ledger.

O budget canonico foi nomeado:

```lean
C2ExactGapAnchorCanonicalExternalFactorBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

com forma expandida disponivel por:

```lean
C2ExactGapAnchorCanonicalExternalFactorBudgetOnMiddle_iff_explicit
```

Daqui em diante, esse e o alvo oficial da frente mais fina; evitar voltar para
`ExternalFactorBudgetOnMiddle` com um `externalDebitUpper` arbitrario.

Esse alvo foi reescrito em forma de reserva:

```lean
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

com equivalencia:

```lean
C2ExactGapAnchorCanonicalExternalFactorBudgetOnMiddle_iff_phaseReserveBudgetOnMiddle
```

O alvo de reserva e:

```lean
c2ExactGapAnchorCanonicalPhaseDebit s <
  c2ExactGapAnchorCanonicalPhaseReserve
    K M horizontalConstant horizontalScale horizontalRatio s
```

Esse passa a ser o alvo oficial, por separar explicitamente o saldo disponivel
do debito de fase.

Novo refinamento formal:

```lean
C2ExactGapAnchorCanonicalPhaseDebitUpperBoundOnMiddle
C2ExactGapAnchorCanonicalPhaseDebitUpperReserveBudgetOnMiddle
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_phaseDebitUpperReserveBudgetOnMiddle
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPhaseDebitUpperReserveBudget
```

A rota mais promissora agora e escolher um `phaseDebitUpper` fino e provar:

```lean
c2ExactGapAnchorCanonicalPhaseDebit s ≤ phaseDebitUpper s
phaseDebitUpper s <
  c2ExactGapAnchorCanonicalPhaseReserve
    K M horizontalConstant horizontalScale horizontalRatio s
```

Tambem foram registrados:

```lean
c2ExactGapAnchorCanonicalPhaseDebit_nonneg_of_offCriticalStrip
c2ExactGapAnchorCanonicalPhaseReserve_pos_onMiddle_of_phaseReserveBudgetOnMiddle
```

Status: rota viva/promissora. Ela preserva o debito externo canonico exato e
evita component uppers grosseiros.

Refinamento ainda mais operacional:

```lean
C2ExactGapAnchorCanonicalFactorUpperReserveBudgetOnMiddle
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_factorUpperReserve
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalFactorUpperReserveBudget
```

Novo alvo preferencial da rota viva:

```lean
C2ExactGapAnchorExactFactorUpperBoundOnMiddle factorUpper near edge

C2ExactGapAnchorCanonicalFactorUpperReserveBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio factorUpper near edge
```

Leitura: controlar o fator residual por `factorUpper` e provar que o debito de
fase ponderado por esse upper cabe na reserva canonica. Esta e a forma mais
fina antes de escolher uma estimativa analitica concreta para o residual.

Refinamento ativo escolhido:

```lean
C2ExactGapAnchorCanonicalOddGapReserveBudgetOnMiddle
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_oddGapReserve
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalOddGapReserveBudget
```

Novo alvo preferencial:

```lean
C2ContinuedOddGapBoundOnMiddle gapUpper near edge

C2ExactGapAnchorCanonicalOddGapReserveBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio gapUpper near edge
```

Especializacao phase-aware:

```lean
C2ContinuedOddHalfDiskBoundOnMiddle halfDiskUpper near edge

C2ExactGapAnchorCanonicalOddGapReserveBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio
  (c2ContinuedOddGapUpperFromHalfDisk halfDiskUpper) near edge
```

Status: rota viva/promissora. Essa frente fala diretamente do cancelamento em
`1 - 2 * continuedOddDirichletChannel` e e mais fina que norm-only
`continuedOddUpper`.

Ultimo refinamento formal:

```lean
C2ExactGapAnchorCanonicalOddGapUnitReserveBudgetOnMiddle
C2ExactGapAnchorCanonicalOddGapReserveBudgetOnMiddle_iff_unitReserveBudgetOnMiddle
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalOddGapUnitReserve
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalHalfDiskUnitReserve
```

Alvo preferencial atualizado:

```lean
C2ContinuedOddGapBoundOnMiddle gapUpper near edge

C2ExactGapAnchorCanonicalOddGapUnitReserveBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio gapUpper near edge
```

Status: rota viva/promissora e mais legivel. O saldo agora aparece como uma
reserva por unidade de gap, em vez de um pagamento ponderado bruto.

Refinamento half-disk:

```lean
C2ExactGapAnchorCanonicalHalfDiskUnitReserveBudgetOnMiddle
C2ExactGapAnchorCanonicalOddGapUnitOnMiddle_iff_halfDiskRadiusOnMiddle
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalHalfDiskRadiusReserve
```

Alvo half-disk preferencial:

```lean
C2ContinuedOddHalfDiskBoundOnMiddle halfDiskUpper near edge

C2ExactGapAnchorCanonicalHalfDiskUnitReserveBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio halfDiskUpper near edge
```

Status: rota viva/promissora. Essa forma remove o fator `2` e deixa o alvo como
um raio direto em torno de `1 / 2`.

Refinamento exato do raio half-disk:

```lean
c2ContinuedOddExactHalfDiskUpper
C2ExactGapAnchorCanonicalExactHalfDiskRadiusBudgetOnMiddle
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskRadius
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactHalfDiskRadius
```

Alvo preferencial atualizado:

```lean
C2ExactGapAnchorCanonicalExactHalfDiskRadiusBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Status: rota viva/promissora e, ate agora, a superficie mais fina. Ela remove a
escolha de `halfDiskUpper` e deixa a obrigacao como a comparacao direta entre
`‖1 / 2 - continuedOddDirichletChannel s‖` e a reserva canonica de raio.

Refinamento cleared/expanded:

```lean
C2ExactGapAnchorCanonicalExactHalfDiskClearedBudgetOnMiddle
C2ExactGapAnchorCanonicalExactHalfDiskExpandedBudgetOnMiddle
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskExpanded
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactHalfDiskExpanded
```

Alvo preferencial atualizado:

```lean
C2ExactGapAnchorCanonicalExactHalfDiskExpandedBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Status: rota viva/promissora e mais concreta para ataque matematico. Ela
remove as divisoes da reserva e transforma o problema em comparar diretamente:

```lean
2 * ((1 + ‖q s‖) * verticalDepthTailUpper s) *
    ‖(1 / 2 : ℂ) - continuedOddDirichletChannel s‖
```

contra:

```lean
c2ExpandedQuartetResidualMargin s * (1 - ‖q s‖) -
  c2ExactGapAnchorCanonicalExternalDebit
    K M horizontalConstant horizontalScale horizontalRatio s
```

Split payment/reserve:

```lean
C2ExactGapAnchorCanonicalExactHalfDiskPaymentUpperBoundOnMiddle
C2ExactGapAnchorCanonicalExactHalfDiskReserveLowerBoundOnMiddle
C2ExactGapAnchorCanonicalExactHalfDiskPaymentReserveBudgetOnMiddle
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskUpperLower
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactHalfDiskUpperLower
```

Alvo preferencial atualizado:

```lean
C2ExactGapAnchorCanonicalExactHalfDiskPaymentUpperBoundOnMiddle
  paymentUpper near edge

C2ExactGapAnchorCanonicalExactHalfDiskReserveLowerBoundOnMiddle
  horizontalConstant horizontalScale horizontalRatio reserveLower near edge

C2ExactGapAnchorCanonicalExactHalfDiskPaymentReserveBudgetOnMiddle
  paymentUpper reserveLower near edge
```

Status: rota viva/promissora e mais modular. Essa e a forma mais pratica para
continuar, porque permite escolher/provar um `paymentUpper` phase-aware e um
`reserveLower` escalar antes de fechar o saldo final.

Refinamento halfDisk/margem/debito:

```lean
C2ExactGapAnchorCanonicalExactHalfDiskPaymentUpperBoundOnMiddle_of_halfDisk
C2ExactGapAnchorCanonicalExactHalfDiskReserveLowerBoundOnMiddle_of_marginDebit
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_halfDiskMarginDebit
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalHalfDiskMarginDebit
```

Alvo preferencial atualizado:

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

Status: rota viva/promissora e agora bem alinhada com certificacao intervalar:
um upper para o raio, um lower para margem, um upper para debito externo, e o
saldo estrito final.

### Proximo passo principal

Abrir uma superficie de cutoff que preserve cancelamento/fase e alimente a rota
gap-aware/exact-anchor. Nao tentar reanimar:

```lean
PositiveBoxActiveExactDefectPhaseCutoffFrontier
```

O alvo correto e produzir uma estimativa do tipo:

```lean
‖c2ContinuedVerticalAnchorResidual s‖ <
  ‖verticalDepthTailFromTwo s‖ *
    c2ExactGapAnchorFactorAllowance
      K M horizontalConstant horizontalScale horizontalRatio s
```

ou sua forma fatorada por upper/lower:

```lean
C2ExactGapAnchorFactorUpperLowerBudgetOnMiddle
```

### Proximo passo paralelo forte

Na rota superGaussian, atacar:

```lean
C2RawCentralRectangleTailUpperBudget N L s R
```

sem usar o atalho de bracket-decay por telescopia. O caminho honesto e controle
direto do raw tail, carrier regularizado novo, ou bound real da bridge
correction.

### Proximo passo experimental

Para o pack Gaussian:

```text
gerar certificado intervalar de borda + winding + tail
```

Isso pode virar um certificado robusto do carrier C2 center Gaussian. So depois
vale discutir ponte para a middle genuine.

## Verificacoes feitas nesta auditoria

```bash
lake env lean LeanC2/AuditC2CenterGaussianCarrier.lean
lake env lean LeanC2/AuditGenuineMiddle.lean
```

Resultado: ambos passaram sem saida.

Varredura de higiene nos arquivos Gaussian principais:

```bash
rg -n "sorry|admit|axiom|unsafe|riemannZeta|ExactZeta|zetaUpper|zetaDepthCore|\bzeta\b" \
  LeanC2/AuditC2CenterGaussianCarrier.lean \
  C2_CENTER_GAUSSIAN_ZERO_CERTIFICATE_PACK.md \
  AUDIT_C2_CENTER_GAUSSIAN_TAIL_BUDGET_LEAN.md \
  AUDIT_C2_CENTER_GAUSSIAN_INTERVAL_CERTIFICATION_PLAN.md
```

Resultado: sem matches.

## Atualizacao 2026-07-05: saldo escalar halfDisk/margem/debito

Status: **rota viva/promissora, alvo fino atual**.

O refinamento mais recente em:

```text
LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

substitui a ultima obrigacao intermediaria de `paymentReserve` por uma forma
escalar direta.

Novos nomes:

```lean
C2ExactGapAnchorCanonicalHalfDiskMarginDebitScalarBudget
C2ExactGapAnchorCanonicalHalfDiskMarginDebitScalarBudgetOnMiddle
C2ExactGapAnchorCanonicalHalfDiskMarginDebitScalarBudgetOnMiddle_iff_paymentReserve
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_halfDiskMarginDebitScalar
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalHalfDiskMarginDebitScalar
```

Alvo fino:

```lean
C2ContinuedOddHalfDiskBoundOnMiddle halfDiskUpper near edge

C2ExactGapAnchorCanonicalMarginLowerBoundOnMiddle
  marginLower near edge

C2ExactGapAnchorCanonicalExternalDebitUpperBoundOnMiddle
  horizontalConstant horizontalScale horizontalRatio externalDebitUpper near edge

C2ExactGapAnchorCanonicalHalfDiskMarginDebitScalarBudgetOnMiddle
  halfDiskUpper marginLower externalDebitUpper near edge
```

Forma escalar:

```lean
2 * ((1 + ‖q s‖) * verticalDepthTailUpper s) * halfDiskUpper s <
  marginLower s * (1 - ‖q s‖) - externalDebitUpper s
```

Leitura: a contabilidade final esta reduzida a tres certificados quantitativos
e uma desigualdade de saldo. Esta e a frente mais fina antes de entrar no
conteudo analitico/intervalar: raio half-disk, lower da margem, upper do debito
externo, e saldo estrito.

## Atualizacao 2026-07-05: especializacao canonica halfDisk/phaseReserve

Status: **rota viva/promissora, alvo fino atual**.

O refinamento posterior removeu as escolhas livres de margem e debito:

```lean
C2ExactGapAnchorCanonicalMarginLowerBoundOnMiddle_exact
C2ExactGapAnchorCanonicalExternalDebitUpperBoundOnMiddle_canonical
```

Novos nomes:

```lean
C2ExactGapAnchorCanonicalHalfDiskPhaseReserveBudget
C2ExactGapAnchorCanonicalHalfDiskPhaseReserveBudgetOnMiddle
C2ExactGapAnchorCanonicalHalfDiskPhaseReserveBudgetOnMiddle_iff_marginDebitScalar
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_halfDiskPhaseReserve
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalHalfDiskPhaseReserve
```

Alvo fino atualizado:

```lean
C2ContinuedOddHalfDiskBoundOnMiddle halfDiskUpper near edge

C2ExactGapAnchorCanonicalHalfDiskPhaseReserveBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio halfDiskUpper near edge
```

Forma escalar:

```lean
2 * ((1 + ‖q s‖) * verticalDepthTailUpper s) * halfDiskUpper s <
  c2ExactGapAnchorCanonicalPhaseReserve
    K M horizontalConstant horizontalScale horizontalRatio s
```

Leitura: a contabilidade agora depende de um upper half-disk genuine-first e
de provar que o pagamento ponderado desse raio cabe na reserva canonica exata.
Isto e mais fino que carregar envelopes livres para margem/debito.

## Atualizacao 2026-07-05: raio exato halfDisk/phaseReserve

Status: **rota viva/promissora, alvo fino atual**.

O refinamento seguinte elimina o envelope livre `halfDiskUpper` usando o raio
exato:

```lean
c2ContinuedOddExactHalfDiskUpper
```

Novos nomes:

```lean
C2ExactGapAnchorCanonicalExactHalfDiskPhaseReserveBudget
C2ExactGapAnchorCanonicalExactHalfDiskPhaseReserveBudgetOnMiddle
C2ExactGapAnchorCanonicalExactHalfDiskPhaseReserveOnMiddle_iff_expanded
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskPhaseReserve
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactHalfDiskPhaseReserve
```

Alvo fino atualizado:

```lean
C2ExactGapAnchorCanonicalExactHalfDiskPhaseReserveBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Forma escalar:

```lean
2 * ((1 + ‖q s‖) * verticalDepthTailUpper s) *
    ‖(1 / 2 : ℂ) - continuedOddDirichletChannel s‖ <
  c2ExactGapAnchorCanonicalPhaseReserve
    K M horizontalConstant horizontalScale horizontalRatio s
```

Leitura: a contabilidade foi reduzida ao saldo exato do raio half-disk contra
a reserva canonica de fase. Essa e a forma mais curta da frente atual e e
equivalente ao expanded exact half-disk budget ja existente.

## Atualizacao 2026-07-05: split operacional payment/reserve

Status: **rota viva/promissora, alvo operacional atual**.

A frente exata foi aberta em tres certificados:

```lean
C2ExactGapAnchorCanonicalExactHalfDiskPaymentUpperBoundOnMiddle
  paymentUpper near edge

C2ExactGapAnchorCanonicalPhaseReserveLowerBoundOnMiddle
  horizontalConstant horizontalScale horizontalRatio reserveLower near edge

C2ExactGapAnchorCanonicalExactHalfDiskPaymentReserveBudgetOnMiddle
  paymentUpper reserveLower near edge
```

Novos conectores:

```lean
C2ExactGapAnchorCanonicalPhaseReserveLowerBoundOnMiddle_of_marginDebit
C2ExactGapAnchorCanonicalExactHalfDiskPaymentUpperBoundOnMiddle_exact
C2ExactGapAnchorCanonicalExactHalfDiskPhaseReserveBudgetOnMiddle_of_upperLower
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskPhaseUpperLower
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactHalfDiskPhaseUpperLower
```

Leitura: agora da para estudar a reserva separadamente. O proximo passo natural
e escolher um `reserveLower` conservador para
`c2ExactGapAnchorCanonicalPhaseReserve`, escolher ou preservar o upper exato do
pagamento, e verificar se o saldo `paymentUpper s < reserveLower s` tem folga.

## Atualizacao 2026-07-05: sharp upper/lower

Status: **rota viva/promissora, alvo mais fino atual**.

A escolha mais refinada foi fixada:

```lean
paymentUpper :=
  c2ExactGapAnchorCanonicalExactHalfDiskPayment

reserveLower :=
  c2ExactGapAnchorCanonicalPhaseReserve
    K M horizontalConstant horizontalScale horizontalRatio
```

Novos conectores:

```lean
C2ExactGapAnchorCanonicalExactHalfDiskSharpUpperLowerBudget
C2ExactGapAnchorCanonicalExactHalfDiskSharpUpperLowerBudgetOnMiddle
C2ExactGapAnchorCanonicalExactHalfDiskSharpUpperLowerOnMiddle_iff_phaseReserve
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskSharpUpperLower
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactHalfDiskSharpUpperLower
```

Alvo fino:

```lean
C2ExactGapAnchorCanonicalExactHalfDiskSharpUpperLowerBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Leitura: esta forma nao tem perda por upper/lower. Se ela estourar, a barreira
e real nessa contabilidade; se houver folga, qualquer escolha intervalar
posterior precisa preservar essa folga sem engrossar os lados.

## Atualizacao 2026-07-05: contabilidade sharp por saldo

Status: **rota viva/promissora, alvo operacional mais fino**.

A frente sharp foi reescrita como positividade do saldo:

```lean
C2ExactGapAnchorCanonicalExactHalfDiskSharpSurplusPositiveOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Contabilidade ponto a ponto:

```lean
surplus =
  c2ExpandedQuartetResidualMargin s * (1 - ‖q s‖) -
    c2ExactGapAnchorCanonicalExternalDebit
      K M horizontalConstant horizontalScale horizontalRatio s -
    c2ExactGapAnchorCanonicalExactHalfDiskPayment s
```

Conectores:

```lean
c2ExactGapAnchorCanonicalExactHalfDiskSharpSurplus_eq_ledger
c2ExactGapAnchorCanonicalExactHalfDiskSharpSurplus_eq_expandedLedger
C2ExactGapAnchorCanonicalExactHalfDiskSharpUpperLowerOnMiddle_iff_surplus
C2ExactGapAnchorCanonicalExactHalfDiskSharpSurplusOnMiddle_iff_expanded
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskSharpSurplus
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactHalfDiskSharpSurplus
```

Leitura: a rota nao foi alterada, apenas auditada em uma moeda mais direta.
O alvo agora e mostrar que a margem ponderada paga simultaneamente o debito
externo canonico e o pagamento exato do raio half-disk.

Observacao de reaproveitamento: a rota antiga
`C2ExactGapAnchorExactHalfDiskBudgetOnMiddle` nao fecha esse alvo diretamente,
porque ela trabalha contra `c2ExactGapAnchorFactorAllowance` normalizado. A
frente atual exige uma prova ou ponte na moeda ponderada do saldo sharp.

## Atualizacao 2026-07-05: weighted-ledger equivalente

Status: **rota viva/promissora, alvo operacional atual**.

O alvo foi reescrito de forma equivalente como:

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

Conectores:

```lean
C2ExactGapAnchorCanonicalExactHalfDiskWeightedLedgerOnMiddle_iff_surplus
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskWeightedLedger
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactHalfDiskWeightedLedger
```

Leitura: esse e o alvo mais direto para explorar a folga. Ele preserva a forma
sharp, mas deixa claro que a margem ponderada precisa pagar dois custos:
debito externo canonico e pagamento exato half-disk.

## Atualizacao 2026-07-05: ledger componentizado

Status: **rota viva/promissora, alvo operacional atual**.

O debito externo foi aberto nos componentes canonicos:

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

Conectores:

```lean
C2ExactGapAnchorCanonicalExactHalfDiskComponentLedgerOnMiddle_iff_weighted
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactHalfDiskComponentLedger
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactHalfDiskComponentLedger
```

Leitura: esse alvo deixa a contabilidade no nivel certo para explorar folga:
cinco custos explicitos contra uma unica margem ponderada. Ainda e equivalente
ao weighted-ledger e ao saldo sharp.

## Atualizacao 2026-07-05: collected budget canonico

Status: **rota viva/promissora, alvo operacional atual**.

O ledger componentizado foi identificado com o collected budget canonico:

```lean
C2ExactGapAnchorExactGapExpandedUpperCollectedBudgetOnMiddle
  c2GenuineCentralExactUpper
  c2ContinuedCentralExactUpper
  (c2HorizontalRegularizedUpper
    horizontalConstant horizontalScale horizontalRatio)
  (c2RawCentralCutoffNormConstant K M)
  near edge
```

Conectores:

```lean
C2ExactGapAnchorCanonicalExactHalfDiskComponentLedgerOnMiddle_iff_collected
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactGapCollected
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactGapCollected
```

Leitura: esta e a melhor moeda para continuar. O custo half-disk e exatamente
o tail-gap exato ponderado, entao a frente nova encaixa na contabilidade
collected ja existente sem engrossar o saldo.

## Atualizacao 2026-07-05: anchor-residual cleared canonico

Status: **rota viva/promissora, alvo operacional atual**.

O collected budget canonico agora recebe uma ponte direta a partir do alvo:

```lean
C2ExactGapAnchorCanonicalAnchorResidualClearedBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Conectores:

```lean
C2ExactGapAnchorCanonicalCollectedOnMiddle_of_anchorResidualCleared
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_anchorResidualCleared
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalAnchorResidualCleared
```

Leitura: essa e a frente mais fina para tentar quitar custos agora. Ela usa a
forma limpa por `(1 - ‖q s‖)` e substitui o pagamento de fase pelo residual
vertical do operador, antes de voltar ao collected budget canonico.

## Atualizacao 2026-07-05: lower-factor unit reserve

Status: **rota viva/promissora, alvo operacional atual**.

O alvo `anchorResidualCleared` foi refinado para a forma unitaria:

```lean
C2ExactGapAnchorCanonicalLowerFactorClearedUnitReserveBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Conectores:

```lean
C2ExactGapAnchorCanonicalLowerFactorClearedUnitReserveOnMiddle_iff_anchorResidual
C2ExactGapAnchorCanonicalCollectedOnMiddle_of_lowerFactorUnitReserve
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_lowerFactorUnitReserve
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalLowerFactorUnitReserve
```

Leitura: esta e a forma mais fina da frente atual. Ela troca a inequacao
cleared completa pela comparacao escalar do exact lower factor contra a unit
reserve depois de pagar os componentes externos canonicos.

## Atualizacao 2026-07-05: lower-factor cleared surplus

Status: **rota viva/promissora, alvo operacional atual**.

O alvo foi refinado para a positividade de saldo:

```lean
C2ExactGapAnchorCanonicalLowerFactorClearedSurplusPositiveOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Conectores:

```lean
C2ExactGapAnchorCanonicalLowerFactorClearedSurplusOnMiddle_iff_anchorResidual
C2ExactGapAnchorCanonicalCollectedOnMiddle_of_lowerFactorSurplus
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_lowerFactorSurplus
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalLowerFactorSurplus
```

Leitura: essa e a forma mais enxuta da contabilidade atual. A prova restante
vira positividade do surplus cleared, isto e, a margem after-clearance ainda
precisa pagar o custo do exact lower factor e deixar saldo estritamente
positivo.

## Atualizacao 2026-07-05: cleared envelope ledger

Status: **rota viva/promissora, alvo operacional atual**.

O alvo `lower-factor cleared surplus` foi refinado para um ledger de tres
envelopes:

```lean
C2ExactGapAnchorCanonicalClearedMarginLowerBoundOnMiddle
C2ExactGapAnchorCanonicalClearedExternalDebitUpperBoundOnMiddle
C2ExactGapAnchorCanonicalClearedLowerFactorCostUpperBoundOnMiddle
C2ExactGapAnchorCanonicalClearedEnvelopeLedgerOnMiddle
```

O conector central e:

```lean
C2ExactGapAnchorCanonicalLowerFactorClearedSurplusOnMiddle_of_envelopeLedger
```

e ele ja alimenta:

```lean
C2ExactGapAnchorCanonicalCollectedOnMiddle_of_clearedEnvelopeLedger
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_clearedEnvelopeLedger
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalClearedEnvelopeLedger
```

Leitura: esta e a frente mais fina da rota atual. Em vez de provar diretamente
que o surplus completo e positivo, a prova pode construir:

```lean
externalDebitUpper s + lowerFactorCostUpper s < marginLower s
```

com `marginLower` por baixo da margem cleared e os dois outros envelopes por
cima do debito externo cleared e do custo do lower factor. A rota continua
genuine/C2 e nao introduz entrada analitica via zeta.

## Atualizacao 2026-07-05: weighted raw-envelope ledger

Status: **rota viva/promissora, alvo operacional atual**.

O ledger cleared foi refinado para envelopes escolhidos antes dos pesos:

```lean
C2ExactGapAnchorCanonicalWeightedEnvelopeLedgerOnMiddle
  marginLower externalDebitUpper lowerFactorUpper near edge
```

Esse alvo usa:

```lean
C2ExactGapAnchorCanonicalMarginLowerBoundOnMiddle
C2ExactGapAnchorCanonicalExternalDebitUpperBoundOnMiddle
C2ExactGapAnchorCanonicalLowerFactorUpperBoundOnMiddle
```

e aplica automaticamente os pesos:

```lean
(1 - ‖q s‖), (1 - ‖q s‖)^2,
c2ExactGapAnchorCanonicalLowerFactorClearedWeight s
```

Conectores:

```lean
C2ExactGapAnchorCanonicalLowerFactorClearedSurplusOnMiddle_of_weightedLedger
C2ExactGapAnchorCanonicalCollectedOnMiddle_of_weightedLedger
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_weightedLedger
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalWeightedLedger
```

Leitura: esta e a frente atual mais promissora porque evita escolher envelopes
ja multiplicados. A contabilidade restante fica concentrada em provar que o
debito externo cru ponderado e o lower-factor upper ponderado cabem na margem
crua ponderada.

## Atualizacao 2026-07-05: no-loss exact weighted envelope ledger

Status: **rota viva/promissora, alvo operacional atual**.

Os envelopes mais finos disponiveis foram fixados como exatos canonicos:

```lean
C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Esse alvo e equivalente a:

```lean
C2ExactGapAnchorCanonicalLowerFactorClearedSurplusPositiveOnMiddle
C2ExactGapAnchorCanonicalAnchorResidualClearedBudgetOnMiddle
```

Conectores:

```lean
C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerOnMiddle_iff_surplus
C2ExactGapAnchorCanonicalExactWeightedEnvelopeLedgerOnMiddle_iff_anchorResidual
C2ExactGapAnchorCanonicalCollectedOnMiddle_of_exactWeightedEnvelopeLedger
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactWeightedEnvelopeLedger
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactWeightedEnvelopeLedger
```

Leitura: nao houve engrossamento. A rota agora esta no ledger exato:

```lean
D_exact * (1 - ‖q‖) + W * G_exact < Q_exact * (1 - ‖q‖)^2
```

O proximo horizonte e encontrar uma margem estrita para essa desigualdade no
middle ou introduzir um refinamento local genuino que melhore algum envelope sem
voltar a estimativas grosseiras.

## Atualizacao 2026-07-05: pressure-share filter cover

Status: **rota viva/promissora, alvo operacional atual**.

A escolha de filtragem agora e por shares locais de pressao:

```lean
C2ExactGapAnchorCanonicalPressureShareBoundsOnFilter
C2ExactGapAnchorCanonicalMiddleFilterCover
```

O fechamento global vem de:

```lean
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_pressureFilterCover
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPressureFilterCover
```

Leitura: esta e melhor que uma particao geometrica grosseira porque mede
diretamente o consumo do caixa:

```lean
externalDebit ≤ externalShare * margin
lowerFactorCost ≤ lowerFactorShare * margin
externalShare + lowerFactorShare < 1
```

Assim podemos refinar os filtros ate as shares locais ficarem pequenas o
suficiente, sem trocar os termos exatos por envelopes maiores.

## Atualizacao 2026-07-05: constant pressure-share atlas

Status: **rota viva/promissora, alvo operacional atual**.

A filtragem escolhida foi concretizada por indices constantes:

```lean
C2ExactGapAnchorCanonicalPressureShareIndex
C2ExactGapAnchorCanonicalPressureShareIndexFilter
```

O cover por esses filtros fecha o ledger exato:

```lean
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_pressureShareIndexCover
```

e ja liga direto ate nao-anulacao:

```lean
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPressureShareIndexCover
```

Leitura: esta e a melhor frente para evitar estouro de orcamento. Em vez de
escolher regioes grossas, cobrimos o middle por janelas de pressao
`(externalShare, lowerFactorShare)` com soma abaixo de `1`. Se uma janela nao
fecha, ela pode ser subdividida por shares menores ou por refinamento local,
sem alterar a contabilidade exata.

## Atualizacao 2026-07-05: finite pressure-share list cover

Status: **rota viva/promissora, alvo operacional atual**.

O atlas constante foi especializado para cover finito por lista:

```lean
C2ExactGapAnchorCanonicalPressureShareIndexListCover
```

Conectores:

```lean
C2ExactGapAnchorCanonicalMiddleFilterCover_of_pressureShareIndexListCover
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_pressureShareIndexListCover
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPressureShareIndexListCover
```

Leitura: essa e a forma mais pratica para a proxima rodada. A lista finita
permite testar poucas janelas de share e subdividir apenas onde o saldo falhar,
sem trocar a margem/debitos exatos por envelopes grosseiros.

## Atualizacao 2026-07-05: prototype dyadic pressure atlas

Status: **rota viva/promissora, alvo operacional atual**.

Foi materializada uma primeira lista finita concreta:

```lean
c2ExactGapAnchorCanonicalPressureSharePrototypeAtlas
```

A lista usa shares dyadic:

```text
(1/4, 1/4), (1/4, 3/8), (3/8, 1/4), (1/4, 1/2),
(1/2, 1/4), (3/8, 3/8), (1/4, 5/8), (5/8, 1/4),
(3/8, 1/2), (1/2, 3/8)
```

Todas preservam `externalShare + lowerFactorShare < 1`; a reserva minima desta
primeira palette e `1/8`.

Novo alvo fechado:

```lean
C2ExactGapAnchorCanonicalPrototypePressureShareAtlasCover
```

Conectores:

```lean
C2ExactGapAnchorCanonicalPrototypePressureShareAtlasPointwiseCases
C2ExactGapAnchorCanonicalPrototypePressureShareAtlasCover_of_pointwiseCases
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypePressureShareAtlasCover
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypePressureShareAtlasCover
```

Classificacao: rota ainda nao morta. A barreira atual e analitica/geometrica:
provar que cada ponto do middle satisfaz uma das dez alternativas pointwise ou
refinar localmente a lista. A contabilidade downstream ja esta conectada.

## Atualizacao 2026-07-05: ratio bounds da atlas prototype

Status: **rota viva/promissora, alvo operacional atual**.

A atlas prototype agora tem uma forma mais fina de ataque por razoes:

```lean
C2ExactGapAnchorCanonicalPressureShareIndexRatioBounds
C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioBoundsCover
```

O alvo atual fica dividido em:

```lean
C2ExactGapAnchorCanonicalResidualMarginPositiveOnMiddle near edge

C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioBoundsCover
  horizontalConstant horizontalScale horizontalRatio near edge
```

Conectores:

```lean
C2ExactGapAnchorCanonicalClearedMarginPositiveOnMiddle_of_residualMarginPositive
C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioCover_of_residualMarginPositive
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypeResidualMarginRatioBoundsCover
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypeResidualRatioBoundsCover
```

Classificacao: rota ainda viva. A barreira deixou de ser uma disjuncao pesada
de filtros e virou duas tarefas mensuraveis: margem residual positiva e cover
das coordenadas de pressao `D/Q`, `G/Q` pela atlas dyadic. Refinar localmente
se alguma janela estourar.

## Atualizacao 2026-07-05: certificado allowance/reserve da margem residual

Status: **rota viva/promissora, alvo operacional atual**.

A parte de margem residual positiva foi reduzida a:

```lean
C2ExactGapAnchorCanonicalAllowanceReserveBudgetOnMiddle
```

e a uma variante por share:

```lean
C2ExactGapAnchorCanonicalAnalyticAllowancePositiveOnMiddle
C2ExactGapAnchorCanonicalResidualReserveShareLTOneOnMiddle
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

Classificacao: rota segue viva. A barreira atual esta bem separada: primeiro
pagar o reserve pela allowance; depois cobrir as pressoes normalizadas da atlas.

## Atualizacao 2026-07-05: allowance/reserve nao e mais barreira

Status: **fechado**.

O certificado

```lean
C2ExactGapAnchorCanonicalAllowanceReserveBudgetOnMiddle
```

foi provado diretamente a partir de `offCriticalStrip`, usando a desigualdade
`‖q s‖ < 1/2`. Consequencias fechadas:

```lean
C2ExactGapAnchorCanonicalAllowanceReserveBudgetOnMiddle_closed
C2ExactGapAnchorCanonicalResidualMarginPositiveOnMiddle_closed
C2ExactGapAnchorCanonicalClearedMarginPositiveOnMiddle_closed
```

Tambem foram adicionadas conexoes downstream sem hipotese de margem/reserve:

```lean
C2ExactGapAnchorCanonicalPrototypeRatioCover_of_closedAllowanceReserve
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_closedPrototypeRatioBoundsCover
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypeClosedRatioBoundsCover
```

Classificacao atual da frente: segue viva/promissora. O gargalo remanescente e
apenas o cover de razoes da atlas prototype:

```lean
C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioBoundsCover
  horizontalConstant horizontalScale horizontalRatio near edge
```

Isto confirma que a rota allowance/reserve nao deve ser marcada como morta nem
como barreira pendente; ela virou parte fechada do spine.

## Atualizacao 2026-07-05: cover da atlas virou alvo agregado

Status: **reduzido, ainda vivo/promissor**.

O cover disjuntivo da atlas prototype nao precisa mais ser provado por dez
casos manuais. Foi adicionada uma ponte:

```lean
C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioBoundsCover_of_aggregateBounds
```

que reduz o cover a:

```lean
C2ExactGapAnchorCanonicalPrototypePressureAggregateBoundsOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

As tres desigualdades agregadas sao:

```lean
externalPressureRatio ≤ 5 / 8
lowerFactorPressureRatio ≤ 5 / 8
externalPressureRatio + lowerFactorPressureRatio ≤ 3 / 4
```

Com elas, os conectores ja fecham a cadeia:

```lean
C2ExactGapAnchorCanonicalPrototypeRatioCover_of_aggregateBounds
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypeAggregateBounds
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypeAggregateBounds
```

Classificacao atual: a frente continua viva. O gargalo remanescente e provar
os tres bounds de pressao normalizada com a contabilidade exata; nao e mais
necessario manipular diretamente a disjuncao finita da atlas.

## Atualizacao 2026-07-05: tres bounds nao sao mais o gargalo direto

Status: **reduzido, vivo/promissor**.

Os tres bounds normalizados foram substituidos por uma rota mais fina. A atlas
prototype foi ampliada com duas janelas extremas, preservando a folga dyadic
sem exigir caps separados `≤ 5 / 8` como alvo final:

```lean
c2ExactGapAnchorCanonicalPressureShareIndexEighthThreeQuarter
c2ExactGapAnchorCanonicalPressureShareIndexThreeQuarterEighth
```

Nova cadeia:

```lean
C2ExactGapAnchorCanonicalPrototypePressureSurplusReserveBoundOnMiddle
  -> C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBoundOnMiddle
  -> C2ExactGapAnchorCanonicalPrototypePressureTotalBoundsOnMiddle
  -> C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioBoundsCover
  -> genuineCentralDoubleSeries s ≠ 0
```

A primeira seta tambem foi formalizada nos dois sentidos:

```lean
C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBoundOnMiddle_iff_surplusReserve
```

O alvo promissor para continuar e:

```lean
C2ExactGapAnchorCanonicalPrototypePressureSurplusReserveBoundOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Classificacao atual: rota viva. A barreira remanescente nao e mais a
disjuncao da atlas nem tres divisoes normalizadas; e provar uma desigualdade
de contabilidade limpa dizendo que o surplus lower-factor ainda guarda pelo
menos `1 / 4` da margem limpa.

## Atualizacao 2026-07-05: alvo equivalente em unit reserve com folga

Status: **reduzido, vivo/promissor**.

O alvo `SurplusReserveBoundOnMiddle` foi reescrito como:

```lean
C2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserveBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Equivalencia:

```lean
C2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserveBudgetOnMiddle_iff_surplusReserve
C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_iff_clearedTotalBound
```

Classificacao: esta rota substitui o unit reserve antigo por uma versao com
folga quantitativa. O unit reserve antigo segue vivo como consequencia, mas
nao fecha a reserva de `1 / 4`; por isso nao deve ser tratado como suficiente
para o alvo atual.

## Atualizacao 2026-07-05: API publica PeerReview corrigida

Status: **alinhada com a rota viva**.

`LeanC2/PeerReview.lean` agora expõe a rota exact-gap anchor/quarter-unit como
API publica:

```lean
C2.PeerReview.QuarterUnitMiddleCertificate
C2.PeerReview.genuineCentral_ne_zero_of_quarterUnitMiddleCertificate
```

O certificado publico consome os campos vivos:

```lean
C2ExpandedScalarScaleData
C2ExpandedHorizontalLayerBudget
C2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserveBudgetOnMiddle
```

e conclui:

```lean
genuineCentralDoubleSeries s ≠ 0
```

Leitura: a porta publica nao deve mais ser lida como convite para perseguir o
middle canonico antigo. A classificacao "morta na formulacao atual" continua
valendo para esse alvo direto; a API publica agora aponta para o horizonte
promissor.

## Atualizacao 2026-07-06: lower no-loss da margem limpa

Status: **vivo/promissor, refinado**.

Foi adicionada uma forma de lower para a margem limpa que nao perde saldo no
middle:

```lean
c2ExactGapAnchorCanonicalClearedMarginAllowanceLower
```

No off-critical/middle:

```lean
c2ExactGapAnchorCanonicalClearedMarginAllowanceLower s =
  c2ExactGapAnchorCanonicalClearedMargin s
```

Logo, o alvo quarter-unit e equivalente ao boleto com esse lower:

```lean
C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_iff_allowanceLower
```

Classificacao: esta e a melhor forma atual para tentar fechar a contabilidade.
Ela preserva a margem `Q` em vez de substitui-la por um bound grosseiro. A
barreira remanescente e provar o pagamento:

```lean
C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

isto e, `D + G ≤ (3 / 4) * allowanceLower`.

## Atualizacao 2026-07-06: target allowanceLower nao e mais gargalo de plumbing

Status: **plumbing fechado; barreira movida para bounds normalizados**.

O alvo `allowanceLower` agora e consequencia formal de:

```lean
C2ExactGapAnchorCanonicalPrototypePressureAggregateBoundsOnMiddle
```

via:

```lean
C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_aggregateBounds
```

Tambem ha uma rota por:

```lean
C2ExactGapAnchorCanonicalPrototypePressureTotalBoundsOnMiddle
C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_totalBounds
```

Classificacao: o target `AllowanceLowerTotalBoundOnMiddle` esta vivo, mas nao
deve ser tratado como a proxima barreira conceitual. A proxima barreira real e
provar a desigualdade normalizada de pressoes, preferencialmente a forma de
soma:

```lean
externalPressure + lowerFactorPressure ≤ 3 / 4
```

no middle. Depois disso, a rota ate nao-anulacao ja esta conectada por:

```lean
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalAllowanceLowerTotalBound
```

## Atualizacao 2026-07-06: SumBound e a frente mais fina do caixa

Status: **vivo/promissor, mais refinado que total/aggregate bounds**.

Foi nomeada a obrigacao normalizada minima:

```lean
C2ExactGapAnchorCanonicalPrototypePressureSumBoundOnMiddle
```

Ela pede apenas:

```lean
externalPressure + lowerFactorPressure ≤ 3 / 4
```

e ja possui pontes ate o endpoint:

```lean
C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBoundOnMiddle_of_sumBound
C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_sumBound
C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_of_sumBound
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypePressureSumBound
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypePressureSumBound
```

Classificacao: esta passa a ser a frente ativa mais fina dentro da rota
quarter-unit/allowance-lower. Ela substitui, como alvo preferencial, os pacotes
mais grossos:

```lean
C2ExactGapAnchorCanonicalPrototypePressureTotalBoundsOnMiddle
C2ExactGapAnchorCanonicalPrototypePressureAggregateBoundsOnMiddle
```

que continuam uteis como rotas de compatibilidade, mas exigem informacao
separada que pode desperdiçar saldo.

Barreira remanescente honesta: provar a soma normalizada por componentes do
debito externo canonico. O alvo nao deve ser lido como consequencia direta de
`scale` e `horizontal`, porque o debito externo inclui termos central,
continued, horizontal e cutoff.

## Atualizacao 2026-07-06: componente exato virou o alvo mais operacional

Status: **vivo/promissor, alvo operacional imediato**.

Foi adicionada a decomposicao exata:

```lean
c2ExactGapAnchorCanonicalClearedExternalPressureRatio_eq_componentSum
```

e o alvo:

```lean
C2ExactGapAnchorCanonicalPrototypePressureComponentSumBoundOnMiddle
```

Classificacao: esta e a mesma rota `SumBound`, mas escrita no nivel certo para
prova incremental. A contabilidade agora tem cinco boletos:

```text
genuine central pressure
continued central pressure
horizontal pressure
cutoff pressure
lower-factor pressure
```

Ja existem wrappers ate o endpoint:

```lean
C2ExactGapAnchorCanonicalPrototypePressureSumBoundOnMiddle_of_componentSumBound
C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_componentSumBound
C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_of_componentSumBound
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_prototypePressureComponentSumBound
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypePressureComponentSumBound
```

Horizonte: escolher bounds refinados para esses cinco boletos e provar que a
soma fica abaixo de `3 / 4`, sem voltar aos bounds separados mais grossos da
atlas.

## Atualizacao 2026-07-06: cinco shares pontuais

Status: **vivo/promissor, alvo mais fino de certificacao incremental**.

Foi criada a interface:

```lean
C2ExactGapAnchorCanonicalPrototypePressureComponentShareBudgetOnMiddle
```

Ela permite escolher cinco shares, possivelmente dependentes de `s`, uma para
cada boleto:

```text
genuine central
continued central
horizontal
cutoff
lower-factor
```

e exige apenas que a soma dessas shares caiba em `3 / 4`.

Classificacao: esta e mais refinada que escolher constantes globais agora. Ela
preserva o saldo local e serve como certificado direto via:

```lean
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypePressureComponentShareBudget
```

Proximo alvo tecnico: propor shares concretas para esses cinco componentes e
provar as cinco desigualdades correspondentes.

## Atualizacao 2026-07-06: baseline exata escolhida

Status: **vivo/promissor, escolha recomendada**.

A primeira escolha de shares deve ser a no-loss:

```lean
C2ExactGapAnchorCanonicalPrototypePressureExactComponentShareBudgetOnMiddle
```

Ela e equivalente ao component-sum e nao introduz arredondamento:

```lean
C2ExactGapAnchorCanonicalExactShareBudgetOnMiddle_iff_componentSumBoundOnMiddle
```

Classificacao: essa escolha nao fecha a estimativa automaticamente, mas e a
melhor regua para evitar perder saldo. A partir dela, a rota deve trocar
shares exatas por uppers provaveis, um componente por vez.

## Atualizacao 2026-07-06: primeiro boleto genuine isolado

Status: **vivo/promissor, primeiro boleto da decomposicao**.

Foi criada a superficie:

```lean
C2ExactGapAnchorCanonicalGenuinePressureShareBudgetOnMiddle
```

Ela troca somente o boleto genuine central por `genuineShare` e deixa os outros
quatro boletos exatos. Isso preserva a estrategia de refinamento um boleto por
vez.

Endpoint direto:

```lean
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalGenuinePressureShare
```

Proximo alvo: escolher uma `genuineShare` que domine o genuine central pressure
e ainda mantenha o caixa total em `≤ 3 / 4`.

## Atualizacao 2026-07-06: genuine share escolhida por upper pontual

Status: **vivo/promissor, melhor escolha refinada para o primeiro boleto**.

A escolha feita foi nao colapsar o genuine central pressure em constante
global. A nova superficie preserva o fator geometrico exato e troca apenas o
numerador genuine por um upper pontual:

```lean
c2ExactGapAnchorCanonicalGenuinePressureShareFromUpper genuineUpper
C2ExactGapAnchorCanonicalGenuinePressureUpperShareBudgetOnMiddle
```

Prova de pagamento do primeiro boleto:

```lean
c2ExactGapAnchorCanonicalGenuinePressure_le_shareFromUpper
C2ExactGapAnchorCanonicalGenuineShareBudgetOnMiddle_of_upperShare
```

Endpoints diretos:

```lean
C2ExactGapAnchorCanonicalComponentSumBoundOnMiddle_of_genuineUpperShare
C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_genuineUpperShare
C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_of_genuineUpperShare
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_genuineUpperShare
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalGenuineUpperShare
```

Classificacao: esta rota segue aberta e e a mais fina do primeiro boleto. O
proximo alvo e provar um `genuineUpper` para `c2GenuineCentralExactUpper` e
verificar a linha de caixa com os outros quatro boletos ainda exatos.

## Atualizacao 2026-07-06: segundo boleto continued central

Status: **vivo/promissor, par central refinado**.

Foi aberto o segundo boleto, `continued central pressure`, pela mesma tecnica
do genuine: upper pontual somente no numerador e fator geometrico preservado.

Novas superficies:

```lean
c2ExactGapAnchorCanonicalContinuedPressureShareFromUpper
C2ExactGapAnchorCanonicalContinuedCentralUpperBound
C2ExactGapAnchorCanonicalCentralPairUpperShareBudgetOnMiddle
```

Provas de pagamento:

```lean
c2ExactGapAnchorCanonicalContinuedPressure_le_shareFromUpper
C2ExactGapAnchorCanonicalComponentShareBudgetOnMiddle_of_centralPairUpperShare
```

Endpoints diretos:

```lean
C2ExactGapAnchorCanonicalComponentSumBoundOnMiddle_of_centralPairUpperShare
C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_centralPairUpperShare
C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_of_centralPairUpperShare
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_centralPairUpperShare
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalCentralPairUpperShare
```

Classificacao: e a extensao mais fina natural apos o primeiro boleto, porque
evita constantes globais e mantem os outros tres boletos exatos. Proximo alvo:
provar `continuedUpper` para `c2ContinuedCentralExactUpper` e checar a soma do
par central contra `3 / 4`.

## Atualizacao 2026-07-06: continued herdado de oddUpper

Status: **vivo/promissor, refinamento estrutural do segundo boleto**.

O `continuedUpper` do par central foi especializado para a forma herdada do
canal odd:

```lean
c2ContinuedCentralFromOddUpper oddUpper
C2ExactGapAnchorCanonicalCentralPairOddShareBudgetOnMiddle
```

Isso troca a obrigacao
`c2ContinuedCentralExactUpper s ≤ continuedUpper s` por:

```text
‖continuedOddDirichletChannel s‖ ≤ oddUpper s
```

e preserva a geometria exata da pressure continued.

Ponte principal:

```lean
C2ExactGapAnchorCanonicalContinuedCentralUpperBound_of_oddChannelBound
C2ExactGapAnchorCanonicalCentralPairUpperShareBudgetOnMiddle_of_oddShare
```

Endpoints diretos:

```lean
C2ExactGapAnchorCanonicalComponentSumBoundOnMiddle_of_centralPairOddShare
C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_centralPairOddShare
C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_of_centralPairOddShare
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_centralPairOddShare
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalCentralPairOddShare
```

Classificacao: esta e mais fina que trabalhar com `continuedUpper` abstrato,
porque reduz o segundo boleto ao canal odd local. Proximo alvo: construir um
`oddUpper` refinado e verificar a linha de caixa do par central.

## Atualizacao 2026-07-06: oddUpper no-loss provado

Status: **vivo/promissor, segundo boleto com oddUpper exato**.

Foi escolhida e provada a forma no-loss do canal odd:

```lean
c2ContinuedOddExactUpper
c2ContinuedOddChannelBound_exact
```

Nova superficie:

```lean
C2ExactGapAnchorCanonicalCentralPairExactOddShareBudgetOnMiddle
```

Conversao principal:

```lean
C2ExactGapAnchorCanonicalCentralPairOddShareBudgetOnMiddle_of_exactOdd
```

Endpoints diretos:

```lean
C2ExactGapAnchorCanonicalComponentSumBoundOnMiddle_of_centralPairExactOdd
C2ExactGapAnchorCanonicalAllowanceLowerTotalBoundOnMiddle_of_centralPairExactOdd
C2ExactGapAnchorCanonicalQuarterUnitReserveOnMiddle_of_centralPairExactOdd
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_centralPairExactOdd
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalCentralPairExactOdd
```

Classificacao: esta etapa fecha a obrigacao de provar `oddUpper` sem perda no
canal odd. O saldo agora deve ser conferido na linha exact-odd; se ela ficar
apertada, buscar um upper estrutural menor para `continuedOddDirichletChannel`.

## Atualizacao 2026-07-06: caixa exact-odd isolado

Status: **vivo/promissor, segundo boleto reduzido ao saldo de caixa**.

Foi separado o alvo de caixa que sobra depois de usar `oddUpper` no-loss:

```lean
C2ExactGapAnchorCanonicalCentralPairExactOddCashBudgetOnMiddle
```

Equivalencia principal:

```lean
C2ExactGapAnchorCanonicalCentralPairExactOddShareBudgetOnMiddle_iff_cash
```

Leitura da equivalencia: o target exact-odd no middle e exatamente:

```text
genuine central upper on middle
+ exact-odd cash budget on middle
```

Classificacao: a rota continua ativa. Ela nao fechou automaticamente a soma
`≤ 3 / 4`; ela isolou com precisao o boleto que falta pagar. Proximo alvo:
provar o `genuineUpper` escolhido e tentar fechar
`C2ExactGapAnchorCanonicalCentralPairExactOddCashBudgetOnMiddle`.

## Atualizacao 2026-07-06: exact-odd reduzido a overshoot vs slack

Status: **vivo/promissor, mas ainda nao quitado**.

A linha de caixa foi limpa de denominadores:

```lean
C2ExactGapAnchorCanonicalCentralPairExactOddClearedCashBudgetOnMiddle
C2ExactGapAnchorCanonicalCentralPairExactOddCashBudgetOnMiddle_iff_cleared
```

Com `genuineUpper = c2GenuineCentralExactUpper`, o caixa e exatamente:

```lean
C2ExactGapAnchorCanonicalExactOddClearedCashOnMiddle_exactGenuine_iff_overshoot
```

O novo saldo objetivo e:

```lean
C2ExactGapAnchorCanonicalCentralPairExactOddOvershootReserveBudgetOnMiddle
```

equivalente a:

```text
c2ExactGapAnchorCanonicalCentralPairExactOddContinuedClearedOvershoot s
  ≤ c2ExactGapAnchorCanonicalExactOddCashSlack K M ... s
```

Classificacao: a rota exact-odd nao morreu, mas mostrou o custo real. O
`oddUpper` no-loss ainda gera um overshoot quando vira upper continued por
`verticalDepthTailUpper`. Se o slack nao pagar esse overshoot, a proxima rota
mais fina deve ser `gapUpper`/exact gap, pois evita a perda triangular
`1 + 2 * ‖odd‖`.

## Atualizacao 2026-07-06: exact-odd precisa de surplus depois do 1/4

Status: **vivo/condicional, mas nao quitado automaticamente**.

O alvo `overshoot vs slack` foi alinhado com o ledger de surplus ja existente:

```lean
c2ExactGapAnchorCanonicalExactOddSurplusAfterQuarter
c2ExactGapAnchorCanonicalExactOddCashSlack_eq_surplusAfterQuarter
C2ExactGapAnchorCanonicalExactOddOvershootReserve_iff_surplusAfterQuarter
C2ExactGapAnchorCanonicalExactOddOvershootOnMiddle_iff_surplusAfterQuarter
```

Fechamento condicional:

```lean
C2ExactGapAnchorCanonicalExactOddShareBudgetOnMiddle_of_surplusAfterQuarter
```

Classificacao: a reserva padrao de `1/4` e equivalente ao pagamento ordinario
`D + L ≤ 3/4 * Q`; ela nao gera excedente para o overshoot. Para fechar esta
rota, falta provar que o surplus alem desse `1/4` cobre o continued overshoot.

Decisao de horizonte: se nao surgir esse excedente, a rota mais promissora
continua sendo `ExactGapCollected`/`ExactWeightedEnvelopeLedger`, porque ela
paga a geometria pelo gap em torno de `1/2` e nao pelo upper norm-only
`c2ContinuedCentralFromOddUpper c2ContinuedOddExactUpper`.

## Atualizacao 2026-07-06: diagnostico numerico do exact-odd invalidado

O diagnostico numerico do exact-odd nao deve classificar rotas da frente
Genuine-First. Ele usa proxy externo ao objeto C2/genuine e nao mede a
contabilidade propria do quarteto.

Classificacao corrigida: nenhuma conclusao sobre `exact-odd`, `edge split`,
`phase-aware`, debitos externos ou lower-factor deve ser tomada a partir desse
scanner. O proximo horizonte precisa ser reavaliado apenas com objetos Lean
genuine/C2.

## Atualizacao 2026-07-06: collected slack canonico virou frente ativa

Classificacao atual:

```text
ExactGapCollected / phase-aware slack: promissora e ativa
exact-odd norm-only:                  viva apenas como rota condicional cara
edge split:                           prematuro; nao ativar agora
```

No Lean, foi formalizado o alvo canonico:

```lean
c2ExactGapAnchorCanonicalExactGapCollectedSlack
C2ExactGapAnchorCanonicalExactGapCollectedSlackPositiveOnMiddle
```

E foram fechadas as equivalencias/ponte:

```lean
c2ExactGapAnchorCanonicalExactGapCollectedSlack_eq_sharpSurplus
C2ExactGapAnchorCanonicalExactGapCollectedSlackPositive_iff_sharpSurplus
C2ExactGapAnchorCanonicalExactGapCollectedBudget_iff_collectedSlackPositive
C2ExactGapAnchorCanonicalExactGapCollectedOnMiddle_iff_collectedSlackPositive
C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle_of_exactGapCollectedSlack
```

Leitura de rota: em vez de tentar pagar o continued por um upper norm-only do
odd channel, o alvo passa a ser uma positividade de saldo phase-aware:

```lean
C2ExactGapAnchorCanonicalExactGapCollectedSlackPositiveOnMiddle
```

Se esse alvo for provado no middle, a rota ja entrega
`C2ExactGapAnchorCanonicalPhaseReserveBudgetOnMiddle` pela ponte nova. Essa e a
frente mais fina atual porque preserva a distancia exata ate `1/2` e separa o
pagamento do tail-gap dos debitos externos.

Validacao:

```text
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
```

Resultado: compilacao limpa. Nenhuma ocorrencia zeta foi encontrada no arquivo
Lean ativo desta frente.

## Atualizacao 2026-07-06: ledger no-loss fecha o collected slack

Classificacao atualizada:

```text
CollectedSlack / ExactGapCollected: frente ativa fechada por ledger no-loss
ExactWeightedEnvelopeLedger:        proximo gargalo substantivo
exact-odd norm-only:                rota condicional cara
edge split:                         prematuro
```

Foram adicionadas pontes Lean que tornam a conta direta:

```lean
C2ExactGapAnchorCanonicalExactGapCollectedSlackOnMiddle_of_collected
C2ExactGapAnchorCanonicalExactGapCollectedSlackOnMiddle_of_anchorResidualCleared
C2ExactGapAnchorCanonicalExactGapCollectedSlackOnMiddle_of_lowerFactorUnitReserve
C2ExactGapAnchorCanonicalExactGapCollectedSlackOnMiddle_of_lowerFactorSurplus
C2ExactGapAnchorCanonicalExactGapCollectedSlackOnMiddle_of_clearedEnvelopeLedger
C2ExactGapAnchorCanonicalExactGapCollectedSlackOnMiddle_of_weightedLedger
C2ExactGapAnchorCanonicalExactGapCollectedSlackOnMiddle_of_exactWeightedEnvelopeLedger
```

Tambem foi criado o wrapper:

```lean
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalExactGapCollectedSlack
```

E a API `C2.PeerReview` passou a expor:

```lean
CollectedSlackMiddleObligation
CollectedSlackMiddleCertificate
CollectedSlackMiddleCertificate.nonvanishing
genuineCentral_ne_zero_of_collectedSlackMiddleCertificate
```

Leitura de rota: o `CollectedSlack` agora e uma frente formalmente fechada
condicionada ao `ExactWeightedEnvelopeLedgerBudgetOnMiddle`. Portanto o proximo
alvo real e fechar esse ledger no-loss por algum dos builders ja existentes
com bounds mais refinados. Nao ha motivo novo para ativar `edge`.

Validacao:

```text
lake build LeanC2
```

Resultado: passou. Os warnings exibidos sao de estilo ja existentes em
dependencias grandes; nenhum erro novo. A busca zeta nos arquivos ativos tocados
nao retornou ocorrencias.

## Atualizacao 2026-07-06: proximo alvo e o cover de razoes do atlas

Classificacao atualizada da frente ativa:

```text
CollectedSlack:                endpoint publico fechado por ledger no-loss
ExactWeightedEnvelopeLedger:   fechado se houver cover de razoes prototipo
PrototypeRatioBoundsCover:     proximo alvo substantivo
edge split:                    prematuro
```

Objeto-alvo:

```lean
C2ExactGapAnchorCanonicalPrototypePressureShareAtlasRatioBoundsCover
```

Ponte nova:

```lean
C2ExactGapAnchorCanonicalExactGapCollectedSlackOnMiddle_of_closedPrototypeRatioBoundsCover
```

API publica nova:

```lean
PrototypeRatioBoundsMiddleObligation
PrototypeRatioBoundsMiddleCertificate
PrototypeRatioBoundsMiddleCertificate.toCollectedSlackCertificate
PrototypeRatioBoundsMiddleCertificate.nonvanishing
genuineCentral_ne_zero_of_prototypeRatioBoundsMiddleCertificate
```

Leitura de rota: o proximo boleto nao deve ser atacado como ledger bruta. O
alvo mais fino e cobrir as razoes normalizadas
`externalPressureRatio` e `lowerFactorPressureRatio` pelas janelas do atlas.
Se esse cover for provado, o caminho ate nao-anulamento ja esta conectado na
API publica.

Validacao:

```text
lake build LeanC2
```

Resultado: passou. Sem ocorrencias zeta nos arquivos Lean ativos tocados.

## Atualizacao 2026-07-06: cover de razoes reduzido a cleared total

Classificacao atual da frente ativa:

```text
CollectedSlack:              endpoint publico fechado por ledger no-loss
ExactWeightedEnvelopeLedger: fechado por cover de razoes ou por cleared total
PrototypeRatioBoundsCover:   ponte valida, mas nao o alvo mais fino
PrototypeClearedTotal:       proximo alvo substantivo recomendado
edge split:                  prematuro
```

Objeto-alvo recomendado:

```lean
C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBoundOnMiddle
```

API publica correspondente:

```lean
PrototypeClearedTotalMiddleObligation
PrototypeClearedTotalMiddleCertificate
PrototypeClearedTotalMiddleCertificate.toPrototypeRatioBoundsCertificate
PrototypeClearedTotalMiddleCertificate.toCollectedSlackCertificate
genuineCentral_ne_zero_of_prototypeClearedTotalMiddleCertificate
```

Leitura de rota: a prova nao deve atacar primeiro a ledger inteira nem abrir
um split de edge. O melhor horizonte e pagar a conta limpa
`D + G <= 3/4 * Q`. Se ela fecha, o Lean reconstrui os bounds normalizados e
leva ate nao-anulamento preservando a folga `1/4 * Q`.

Validacao desta etapa:

```text
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
lake build LeanC2.AuditGenuineMiddleExactGapFrontier
lake build LeanC2.PeerReview
lake build LeanC2
```

A busca zeta nos arquivos Lean ativos tocados nao retornou ocorrencias.

## Atualizacao 2026-07-06: diagnostico externo descartado

As leituras baseadas em diagnostico externo ao objeto C2/genuine foram
retiradas da classificacao ativa. Elas nao devem matar nem priorizar rotas do
middle genuine-first.

Classificacao corrigida:

```text
cinco boletos norm-only:       alvo formal ainda aberto
LowerFactorAfterCutoffSlack:   equivalencia formal correta
central pair norm-only:        sem classificacao nova por esse diagnostico
defect-aware central route:    objeto formal disponivel, nao priorizado aqui
edge split:                    sem decisao nova por diagnostico externo
```

## Atualizacao 2026-07-06: reserva exact/no-loss equivale ao cleared total

Classificacao atual da frente ativa:

```text
ExactComponentSurplusReserve: alvo exact/no-loss, equivalente ao cleared total
PrototypeClearedTotal:        alvo publico equivalente
BoundedSurplusReserve:        alternativa para introduzir bounds locais
edge split:                   ainda prematuro
```

A conta exata da reserva foi formalizada como equivalencia:

```text
(1 / 4) * Q <= Q - D - G    <->    D + G <= (3 / 4) * Q
```

Teoremas adicionados:

```lean
C2ExactGapAnchorCanonicalExactComponentLedger_iff_clearedTotalBound
C2ExactGapAnchorCanonicalExactComponentLedgerOnMiddle_iff_clearedTotalBound
ExactComponentSurplusReserveMiddleObligation_iff_prototypeClearedTotalMiddleObligation
ExactComponentSurplusReserveMiddleCertificate.toPrototypeClearedTotalCertificate
PrototypeClearedTotalMiddleCertificate.toExactComponentSurplusReserveCertificate
```

Leitura de rota: esta etapa prova que a formulacao exact/no-loss nao e uma
folga artificial nem uma rota paralela. Ela e exatamente o mesmo boleto do
`ClearedTotal`. Portanto, se a desigualdade nao couber, o problema esta em
algum componente real de `D` ou `G`, e o proximo refinamento deve trocar apenas
esse componente por um bound mais fino.

## Atualizacao 2026-07-06: diagnostico de slack dos cinco boletos

Classificacao atual da frente ativa:

```text
LowerFactorAfterCutoffSlack: alvo operacional recomendado
PrototypeComponentSum:       cinco boletos exact/no-loss
PrototypeClearedTotal:       alvo publico equivalente
ExactComponentSurplusReserve:conta de reserva equivalente
edge split:                  ainda prematuro
```

Novos slacks:

```lean
c2ExactGapAnchorCanonicalPressureSlackAfterCentralPair
c2ExactGapAnchorCanonicalPressureSlackAfterHorizontal
c2ExactGapAnchorCanonicalPressureSlackAfterCutoff
c2ExactGapAnchorCanonicalPressureSlackAfterLowerFactor
```

Novas equivalencias:

```lean
C2ExactGapAnchorCanonicalComponentSumBound_iff_lowerFactor_le_slack
C2ExactGapAnchorCanonicalComponentSumBound_iff_cutoff_lower_le_slack
C2ExactGapAnchorCanonicalComponentSumBound_iff_tail_le_centralSlack
C2ExactGapAnchorCanonicalComponentSumBound_iff_slack_nonneg
C2ExactGapAnchorCanonicalClearedTotalOnMiddle_iff_componentSumOnMiddle
PrototypeClearedTotalMiddleObligation_iff_lowerFactorAfterCutoffSlack
```

Leitura de rota: agora da para atacar os componentes sem mexer no certificado
terminal. Primeiro tentar provar que o lower-factor cabe no slack apos cutoff.
Se falhar, a propria API mostra onde recuar: cutoff+lower, depois
horizontal+cutoff+lower, e por ultimo par central.

## Atualizacao 2026-07-06: escolha exact/no-loss por componentes

Classificacao atual da frente ativa:

```text
CollectedSlack:                    endpoint publico fechado por componentes
BoundedSurplusReserve:             ponte por envelope geral
ComponentSurplusReserve:           alvo recomendado refinado
ExactComponentSurplusReserve:      escolha no-loss mais fina disponivel
edge split:                        prematuro
```

Objeto-alvo recomendado:

```lean
ExactComponentSurplusReserveMiddleObligation
```

Ele fixa:

```text
marginUpper          = clearedMargin
marginLower          = clearedMargin
externalDebitUpper   = clearedExternalDebit
lowerFactorCostUpper = clearedLowerFactorCost
```

Leitura de rota: esta e a escolha mais fina porque nao arredonda `Q`, `D` nem
`G`. O alvo restante e a conta exata:

```text
(1 / 4) * Q <= Q - D - G
```

Se esse alvo exato nao couber, o proximo ajuste deve ser local: substituir
apenas o componente que falhar por um upper/lower certificado, mantendo os
demais componentes exact/no-loss.

Validacao:

```text
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
lake env lean LeanC2/PeerReview.lean
lake build LeanC2.AuditGenuineMiddleExactGapFrontier
lake build LeanC2.PeerReview
lake build LeanC2
```

A busca zeta nos arquivos Lean ativos tocados nao retornou ocorrencias.

## Atualizacao 2026-07-06: surplus reserve reduzido a bounded ledger

Classificacao atual da frente ativa:

```text
CollectedSlack:              endpoint publico fechado por bounded ledger
PrototypeSurplusReserve:     ponte equivalente a bounded ledger
BoundedSurplusReserve:       proximo alvo substantivo recomendado
edge split:                  prematuro
```

Objeto-alvo recomendado:

```lean
BoundedSurplusReserveMiddleObligation
```

Esse alvo e a ledger:

```text
(1 / 4) * marginUpper <= surplusLower
```

com os envelopes auxiliares:

```text
clearedMargin <= marginUpper
surplusLower <= lowerFactorClearedSurplus
```

Leitura de rota: agora a melhor frente nao e provar diretamente a formula
exata do surplus. O caminho mais controlado e escolher um upper fino para `Q`
e um lower fino para o surplus, depois conferir que o lower ainda paga
`1/4` do upper.

Validacao:

```text
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
lake build LeanC2.AuditGenuineMiddleExactGapFrontier
lake build LeanC2.PeerReview
lake build LeanC2
```

A busca zeta nos arquivos Lean ativos tocados nao retornou ocorrencias.

## Atualizacao 2026-07-06: cleared total reduzido a surplus reserve

Classificacao atual da frente ativa:

```text
CollectedSlack:              endpoint publico fechado por ledger no-loss
ExactWeightedEnvelopeLedger: fechado por surplus reserve
PrototypeClearedTotal:       ponte equivalente, nao o alvo mais fino
PrototypeSurplusReserve:     proximo alvo substantivo recomendado
edge split:                  prematuro
```

Objeto-alvo recomendado:

```lean
C2ExactGapAnchorCanonicalPrototypePressureSurplusReserveBoundOnMiddle
```

API publica correspondente:

```lean
PrototypeSurplusReserveMiddleObligation
PrototypeSurplusReserveMiddleCertificate
PrototypeSurplusReserveMiddleCertificate.toPrototypeClearedTotalCertificate
PrototypeSurplusReserveMiddleCertificate.toCollectedSlackCertificate
genuineCentral_ne_zero_of_prototypeSurplusReserveMiddleCertificate
```

Leitura de rota: a forma `D + G <= 3/4 * Q` continua correta, mas a forma
mais fina para o proximo ataque e provar diretamente que sobra `1/4 * Q` no
surplus. Isso evita raciocinar por um pagamento agregado quando o objetivo real
e preservar a reserva.

Validacao:

```text
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
lake build LeanC2.AuditGenuineMiddleExactGapFrontier
lake build LeanC2.PeerReview
lake build LeanC2
```

A busca zeta nos arquivos Lean ativos tocados nao retornou ocorrencias.

## Atualizacao 2026-07-06: correcao de procedimento

A classificacao baseada em diagnostico externo ao objeto C2/genuine nao deve
ser usada para a rota ativa middle. Pelo protocolo Genuine-First, essa leitura
fica descartada como criterio da prova local e nao decide o proximo alvo.

Classificacao corrigida:

```text
cinco boletos norm-only:       alvo formal ainda aberto
central pair norm-only:        sem classificacao nova por esse diagnostico
LowerFactorAfterCutoffSlack:   equivalencia formal correta
defect-aware central route:    objeto formal disponivel, nao priorizado aqui
edge split:                    sem decisao nova por esse diagnostico
```

Objeto formal disponivel se a geometria C2 pedir esse caminho:

```lean
PositiveBoxCentralDefectUpperBoundOnBox
positiveBoxCentralDefectExactUpper
PositiveBoxExactGapAnchorActiveDefectCandidateScalarBudgetResolventOnBox
```
