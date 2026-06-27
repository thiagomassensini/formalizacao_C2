# Mapa do middle genuine neq zero

Escopo: este arquivo consolida somente a rota genuine/C2 para provar
`genuineCentralDoubleSeries s ≠ 0` no middle.  Ele nao e mapa da camada
terminal.

## Alvo

O alvo local genuine cru esta em:

- `LeanC2/AuditGenuineMiddle.lean:7302`
- `GenuineMiddleAudit.GenuineCentralNoCancellation`

```lean
def GenuineCentralNoCancellation (s : ℂ) : Prop :=
  0 < s.re ∧ genuineCentralDoubleSeries s ≠ 0
```

O alvo global genuine-only agora esta isolado como wrapper condicional:

```lean
∀ ⦃s : ℂ⦄,
  s ∈ c2ExpandedScalarMiddleRegion near edge →
  genuineCentralDoubleSeries s ≠ 0
```

Status atual: reduzido a horizontal budget, bound direto do continued odd
channel, slack positivo de pagamento e uma desigualdade expandida final contra
a margem do quarteto.  Nao existe ainda um theorem incondicional provando o
alvo global acima para todo ponto do middle.

## Arquivos

| Arquivo | Papel |
| --- | --- |
| `LeanC2/AuditGenuineMiddle.lean` | Fonte principal da rota genuine-first do middle |
| `LeanC2/AuditAdjustedQuartetRoute.lean` | Superficie auditavel da rota do quarteto ajustado |
| `LeanC2/AuditMiddleBarrier.lean` | Guardrail mostrando que o alvo canonico fechado antigo forca middle vazio |
| `LeanC2/Analytic/GenuineBulkConcrete.lean` | Infraestrutura concreta e barreiras formais importadas pela auditoria |
| `AUDIT_GENUINE_MIDDLE_TODO.md` | Tracker historico detalhado |
| `RELATORIO_MIDDLE_GENUINE_NEQ_ZERO.md` | Relatorio narrativo do fechamento condicional |
| `TEMP_STATUS_MIDDLE_GENUINE.md` | Log longo de progresso; util para arqueologia, nao para decidir alvo atual |

## Fluxo Formal Atual

```text
middle point
  + local scalar data / horizontal budget
  + raw seed bound
  + raw cutoff bound
  + quartet dominance
  + continued odd gap upper
  + external scalar upper budgets
  + final expanded odd-metric slack allowance inequality
    ↓
adjustedQuartetBalancedGenuineBulkConcreteRegion
    ↓
adjustedQuartetBalancedGenuineBulkModel coreCutoff K M s ≠ 0
    ↓
genuineCentralDoubleSeries s ≠ 0
```

O bridge final entre o bulk balanceado e o central genuine e:

- `LeanC2/AuditGenuineMiddle.lean:7278`
- `GenuineMiddleAudit.adjustedQuartetBalancedGenuineBulkModel_eq_central_of_re_pos`

## Pecas Fechadas

### 1. Credito global pointwise do quarteto

Closed.

Nomes:

- `GenuineMiddleAudit.c2ConcreteAntiMiracleQuartet_norm_ge_K2Margin`
  em `LeanC2/AuditGenuineMiddle.lean:4475`
- `GenuineMiddleAudit.c2ConcreteAntiMiracleQuartet_norm_ge_K2Margin_of_mem_middle`
  em `LeanC2/AuditGenuineMiddle.lean:4532`
- `GenuineMiddleAudit.c2ConcreteAntiMiracleQuartet_ne_zero_of_mem_middle`
  em `LeanC2/AuditGenuineMiddle.lean:4566`

Leitura:

```lean
s ∈ c2ExpandedScalarMiddleRegion near edge →
  c2ExpandedQuartetK2Margin s ≤ ‖c2ConcreteAntiMiracleQuartet s‖
```

e a margem e positiva ponto a ponto.  Isto fecha o quarteto em todo middle, mas
nao fecha sozinho o central genuine.

### 2. Livro-caixa de quatro debitos

Closed.

Nomes:

- `GenuineMiddleAudit.norm_add_four_le`
- `GenuineMiddleAudit.c2ConcreteAntiMiracleTail_norm_le_fourTermUpper`
- `GenuineMiddleAudit.c2ConcreteAntiMiracleFiniteModel_ne_zero_of_fourTermDominance`
  em `LeanC2/AuditGenuineMiddle.lean:4614`

Conteudo:

```lean
vertical debt + tilt + horizontal + cutoff
  < c2ExpandedQuartetK2Margin s
→ c2ConcreteAntiMiracleFiniteModel ... s ≠ 0
```

### 3. Certificado concreto do quarteto balanceado

Closed.

Nomes:

- `GenuineMiddleAudit.AdjustedQuartetBalancedGenuineBulkConcreteEstimates`
  em `LeanC2/AuditGenuineMiddle.lean:8816`
- `GenuineMiddleAudit.adjustedQuartetBalancedGenuineBulkConcreteRegion`
  em `LeanC2/AuditGenuineMiddle.lean:8848`
- `GenuineMiddleAudit.adjustedQuartetBalancedGenuineBulkModel_ne_zero_of_mem_concreteRegion_ledger`
  em `LeanC2/AuditGenuineMiddle.lean:8966`

Esse pacote guarda os campos efetivos: off-criticalidade, escalas, horizontal
layer bound, seed bound, cutoff bound e `quartet_dominance`.

### 4. Endpoint literal do central genuine

Closed, condicionado ao certificado concreto.

Nomes:

- `GenuineMiddleAudit.genuineCentral_ne_zero_of_mem_concreteRegion_ledger`
  em `LeanC2/AuditGenuineMiddle.lean:9084`
- `GenuineMiddleAudit.genuineCentral_ne_zero_of_localBulkData_rawBounds`
  em `LeanC2/AuditGenuineMiddle.lean:9185`

Forma pratica:

```lean
C2ExpandedScalarLocalBulkData ...
  → raw seed bound
  → raw cutoff bound
  → genuineCentralDoubleSeries s ≠ 0
```

Este e o endpoint local mais util para a proxima etapa.

### 5. Rota raw triangle

Reduced.

Nomes:

- `GenuineMiddleAudit.C2RawTriangleResidualDominance`
  em `LeanC2/AuditGenuineMiddle.lean:9271`
- `GenuineMiddleAudit.C2RawTriangleResidualDominance_of_scalarBudget`
- `GenuineMiddleAudit.C2RawTriangleResidualDominance_of_upperBudgets`
- `GenuineMiddleAudit.genuineCentral_ne_zero_of_rawTriangleResidualDominance`
  em `LeanC2/AuditGenuineMiddle.lean:9827`
- `GenuineMiddleAudit.genuineCentral_ne_zero_on_middle_of_rawTriangleResidualDominance`
  em `LeanC2/AuditGenuineMiddle.lean:9854`
- `GenuineMiddleAudit.genuineCentral_ne_zero_on_middle_of_rawTriangleScalarBudget`
  em `LeanC2/AuditGenuineMiddle.lean:9893`
- `GenuineMiddleAudit.genuineCentral_ne_zero_on_middle_of_rawTriangleUpperBudgets`
  em `LeanC2/AuditGenuineMiddle.lean:9937`

O boleto restante nessa rota e provar:

```lean
C2RawTriangleResidualDominance
  K M horizontalConstant horizontalScale horizontalRatio s
```

Barreiras ja conhecidas:

- `not_C2RawTriangleResidualDominance_of_verticalDepthTailUpper_le_rawTriangle`
- `not_C2RawTriangleResidualDominance_of_verticalDepthTailUpper_le_tailNorm`
- `C2RawTriangleResidualDominance_forces_verticalTail_strict_saving`

Leitura: a triangle bound crua nao fecha automaticamente; precisa de saving
real ou budget vertical mais fino.

### 6. Rota refined vertical / exact vertical

Closed como infraestrutura, Reduced como prova global.

Nomes principais:

- `GenuineMiddleAudit.C2RefinedVerticalResidualDominance`
  em `LeanC2/AuditGenuineMiddle.lean:10014`
- `GenuineMiddleAudit.genuineCentral_ne_zero_of_refinedVerticalResidualDominance`
  em `LeanC2/AuditGenuineMiddle.lean:10432`
- `GenuineMiddleAudit.C2ExactVerticalResidualDominance`
  em `LeanC2/AuditGenuineMiddle.lean:10482`
- `GenuineMiddleAudit.genuineCentral_ne_zero_of_exactVerticalResidualDominance`
  em `LeanC2/AuditGenuineMiddle.lean:13655`
- `GenuineMiddleAudit.genuineCentral_ne_zero_on_middle_of_exactVerticalResidualDominance`
  em `LeanC2/AuditGenuineMiddle.lean:15465`
- `GenuineMiddleAudit.genuineCentral_ne_zero_on_middle_of_exactVerticalScalarBudget`
  em `LeanC2/AuditGenuineMiddle.lean:15505`
- `GenuineMiddleAudit.genuineCentral_ne_zero_on_middle_of_exactVerticalUpperBudgets`
  em `LeanC2/AuditGenuineMiddle.lean:15548`

Essa rota permite substituir a triangle bound crua por um upper vertical
externo mais fino, inclusive pela norma exata do residual vertical/retangular.

Formas prontas de usar:

- `genuineCentral_ne_zero_of_exactVerticalResidualNorm_lt_allowance`
- `genuineCentral_ne_zero_of_anchor_cutoff_lt_allowance`
- `genuineCentral_ne_zero_of_anchor_norm_lt_allowance`
- `genuineCentral_ne_zero_of_exactVerticalScalarBudget`
- `genuineCentral_ne_zero_of_exactVerticalUpperBudgets`

### 7. Odd-anchor e gap-aware anchor

Mixed: a forma norm-only foi aposentada; a forma gap-aware segue reduzida.

Nomes:

- `GenuineMiddleAudit.C2GenuineOddAnchorLocalData`
  em `LeanC2/AuditGenuineMiddle.lean:11321`
- `GenuineMiddleAudit.not_C2GenuineOddAnchorLocalData`
  em `LeanC2/AuditGenuineMiddle.lean:12627`
- `GenuineMiddleAudit.C2GenuineOddAnchorLocalData.to_exactVerticalResidualDominance`
  em `LeanC2/AuditGenuineMiddle.lean:13452`
- `GenuineMiddleAudit.C2ContinuedOddGapBoundOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:10744`
- `GenuineMiddleAudit.c2ContinuedOddGapBoundOnMiddle_exact`
  em `LeanC2/AuditGenuineMiddle.lean:10763`
- `GenuineMiddleAudit.C2GenuineGapAnchorFinalBudget`
  em `LeanC2/AuditGenuineMiddle.lean:10833`
- `GenuineMiddleAudit.C2GenuineExactGapAnchorFinalBudget`
  em `LeanC2/AuditGenuineMiddle.lean:10844`
- `GenuineMiddleAudit.C2GenuineExactGapAnchorFinalBudget_iff_explicit`
  em `LeanC2/AuditGenuineMiddle.lean:10855`
- `GenuineMiddleAudit.c2ExactGapAnchorFactorAllowance`
  em `LeanC2/AuditGenuineMiddle.lean:10896`
- `GenuineMiddleAudit.C2ExactGapAnchorPositiveAllowanceBudget`
  em `LeanC2/AuditGenuineMiddle.lean:10913`
- `GenuineMiddleAudit.C2ExactGapAnchorPositiveAllowanceBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:10924`
- `GenuineMiddleAudit.C2ExactGapAnchorPositiveAllowanceScalarBudget`
  em `LeanC2/AuditGenuineMiddle.lean:10940`
- `GenuineMiddleAudit.C2ExactGapAnchorPositiveAllowanceScalarBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:10957`
- `GenuineMiddleAudit.C2ExactGapAnchorPositiveAllowanceUpperBudget`
  em `LeanC2/AuditGenuineMiddle.lean:10972`
- `GenuineMiddleAudit.C2ExactGapAnchorPositiveAllowanceUpperBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:10987`
- `GenuineMiddleAudit.C2ExactGapAnchorPhaseSaving`
  em `LeanC2/AuditGenuineMiddle.lean:11001`
- `GenuineMiddleAudit.C2ExactGapAnchorPhaseSavingOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:11010`
- `GenuineMiddleAudit.C2ExactGapAnchorPhaseDisk`
  em `LeanC2/AuditGenuineMiddle.lean:11025`
- `GenuineMiddleAudit.C2ExactGapAnchorPhaseDiskOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:11034`
- `GenuineMiddleAudit.C2ContinuedOddChannelBoundOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:10671`
- `GenuineMiddleAudit.c2ContinuedOddChannelBoundOnMiddle_exact`
  em `LeanC2/AuditGenuineMiddle.lean:10681`
- `GenuineMiddleAudit.C2ContinuedOddHalfDiskBound`
  em `LeanC2/AuditGenuineMiddle.lean:11086`
- `GenuineMiddleAudit.C2ContinuedOddHalfDiskBoundOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:11090`
- `GenuineMiddleAudit.c2HalfDiskUpperFromOddUpper`
  em `LeanC2/AuditGenuineMiddle.lean:11101`
- `GenuineMiddleAudit.C2ExactGapAnchorPhaseDiskBudget`
  em `LeanC2/AuditGenuineMiddle.lean:11106`
- `GenuineMiddleAudit.C2ExactGapAnchorPhaseDiskBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:11116`
- `GenuineMiddleAudit.C2ContinuedOddHalfDiskBound_of_oddChannelBound`
  em `LeanC2/AuditGenuineMiddle.lean:11783`
- `GenuineMiddleAudit.C2ContinuedOddHalfDiskBoundOnMiddle_of_oddChannelBoundOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:11798`
- `GenuineMiddleAudit.C2ContinuedOddHalfDiskBoundOnMiddle_exactMetric`
  em `LeanC2/AuditGenuineMiddle.lean:11810`
- `GenuineMiddleAudit.c2VerticalDepthTailLower`
  em `LeanC2/AuditGenuineMiddle.lean:11084`
- `GenuineMiddleAudit.C2ContinuedVerticalAnchorResidualBound`
  em `LeanC2/AuditGenuineMiddle.lean:11088`
- `GenuineMiddleAudit.C2ContinuedVerticalAnchorResidualBoundOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:11093`
- `GenuineMiddleAudit.c2HalfDiskUpperFromAnchor`
  em `LeanC2/AuditGenuineMiddle.lean:11107`
- `GenuineMiddleAudit.c2ContinuedVerticalAnchorResidualExactUpper`
  em `LeanC2/AuditGenuineMiddle.lean:11112`
- `GenuineMiddleAudit.C2ContinuedVerticalAnchorResidualBound_exact`
  em `LeanC2/AuditGenuineMiddle.lean:11115`
- `GenuineMiddleAudit.C2ContinuedVerticalAnchorResidualBoundOnMiddle_exact`
  em `LeanC2/AuditGenuineMiddle.lean:11123`
- `GenuineMiddleAudit.C2ExactGapAnchorExactAnchorResidualBudget`
  em `LeanC2/AuditGenuineMiddle.lean:11133`
- `GenuineMiddleAudit.C2ExactGapAnchorTailNormAnchorResidualBudget`
  em `LeanC2/AuditGenuineMiddle.lean:11146`
- `GenuineMiddleAudit.C2ExactGapAnchorTailNormAnchorResidualBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:11156`
- `GenuineMiddleAudit.C2ExactGapAnchorTailNormAnchorResidualUpperBudget`
  em `LeanC2/AuditGenuineMiddle.lean:11172`
- `GenuineMiddleAudit.C2ExactGapAnchorTailNormAnchorResidualUpperBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:11186`
- `GenuineMiddleAudit.C2ContinuedVerticalAnchorResidualFactorBound`
  em `LeanC2/AuditGenuineMiddle.lean:11203`
- `GenuineMiddleAudit.C2ContinuedVerticalAnchorResidualFactorBoundOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:11209`
- `GenuineMiddleAudit.C2ExactGapAnchorTailNormAnchorResidualFactorBudget`
  em `LeanC2/AuditGenuineMiddle.lean:11220`
- `GenuineMiddleAudit.C2ExactGapAnchorTailNormAnchorResidualFactorBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:11230`
- `GenuineMiddleAudit.c2ContinuedVerticalAnchorResidualExactFactorUpper`
  em `LeanC2/AuditGenuineMiddle.lean:11244`
- `GenuineMiddleAudit.C2ExactGapAnchorExactFactorUpperBound`
  em `LeanC2/AuditGenuineMiddle.lean:11251`
- `GenuineMiddleAudit.C2ExactGapAnchorExactFactorUpperBoundOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:11256`
- `GenuineMiddleAudit.C2ExactGapAnchorFactorAllowanceLowerPositive`
  em `LeanC2/AuditGenuineMiddle.lean:11767`
- `GenuineMiddleAudit.C2ExactGapAnchorFactorAllowanceLowerPositiveOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:11772`
- `GenuineMiddleAudit.C2ExactGapAnchorFactorUpperLowerBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:12063`
- `GenuineMiddleAudit.C2ExactGapAnchorFactorAllowanceLowerBound`
  em `LeanC2/AuditGenuineMiddle.lean:11267`
- `GenuineMiddleAudit.C2ExactGapAnchorFactorAllowanceLowerBoundOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:11277`
- `GenuineMiddleAudit.C2ExactGapAnchorFactorAllowanceLowerScalarBudget`
  em `LeanC2/AuditGenuineMiddle.lean:11313`
- `GenuineMiddleAudit.C2ExactGapAnchorFactorAllowanceLowerScalarBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:11325`
- `GenuineMiddleAudit.C2ExactGapAnchorGapUpperScalarBudget`
  em `LeanC2/AuditGenuineMiddle.lean:11342`
- `GenuineMiddleAudit.C2ExactGapAnchorGapUpperScalarBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:11354`
- `GenuineMiddleAudit.C2ExactGapAnchorGapUpperExpandedScalarBudget`
  em `LeanC2/AuditGenuineMiddle.lean:11371`
- `GenuineMiddleAudit.C2ExactGapAnchorGapUpperExpandedScalarBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:11390`
- `GenuineMiddleAudit.C2ExactGapAnchorGapUpperExpandedUpperBudget`
  em `LeanC2/AuditGenuineMiddle.lean:11407`
- `GenuineMiddleAudit.C2ExactGapAnchorGapUpperExpandedUpperBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:11423`
- `GenuineMiddleAudit.c2ExactGapAnchorExactTailGapBudget`
  em `LeanC2/AuditGenuineMiddle.lean:11437`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedScalarBudget`
  em `LeanC2/AuditGenuineMiddle.lean:11441`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedScalarBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:11450`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedUpperBudget`
  em `LeanC2/AuditGenuineMiddle.lean:11464`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedUpperBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:11475`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedUpperClearedBudget`
  em `LeanC2/AuditGenuineMiddle.lean:12015`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedUpperClearedBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:12030`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedUpperCollectedBudget`
  em `LeanC2/AuditGenuineMiddle.lean:12048`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedUpperCollectedBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:12060`
- `GenuineMiddleAudit.c2ExactGapAnchorExactGapExpandedUpperExternalDebit`
  em `LeanC2/AuditGenuineMiddle.lean:12074`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedUpperExternalDebitUpperBound`
  em `LeanC2/AuditGenuineMiddle.lean:12083`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedUpperExternalDebitUpperBoundOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:12094`
- `GenuineMiddleAudit.c2ExactGapAnchorExactGapExpandedUpperExternalDebitComponentUpper`
  em `LeanC2/AuditGenuineMiddle.lean:12108`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedUpperExternalDebitComponentBounds`
  em `LeanC2/AuditGenuineMiddle.lean:12116`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedUpperExternalDebitComponentBoundsOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:12128`
- `GenuineMiddleAudit.c2ExactGapAnchorExactGapExpandedUpperTailGapReserve`
  em `LeanC2/AuditGenuineMiddle.lean:12146`
- `GenuineMiddleAudit.c2ExactGapAnchorExactGapExpandedUpperTailGapReserveLower`
  em `LeanC2/AuditGenuineMiddle.lean:12156`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedUpperTailGapReserveBudget`
  em `LeanC2/AuditGenuineMiddle.lean:12163`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedUpperTailGapReserveBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:12174`
- `GenuineMiddleAudit.c2ExactGapAnchorExactGapExpandedUpperFactorReserve`
  em `LeanC2/AuditGenuineMiddle.lean:12191`
- `GenuineMiddleAudit.c2ExactGapAnchorExactGapExpandedUpperFactorReserveLower`
  em `LeanC2/AuditGenuineMiddle.lean:12201`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedUpperFactorReserveBudget`
  em `LeanC2/AuditGenuineMiddle.lean:12209`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedUpperFactorReserveBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:12220`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedUpperFactorReserveLowerBound`
  em `LeanC2/AuditGenuineMiddle.lean:12234`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedUpperFactorReserveLowerBoundOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:12245`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedUpperFactorReserveLowerGapBudget`
  em `LeanC2/AuditGenuineMiddle.lean:12259`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedUpperFactorReserveLowerGapBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:12267`
- `GenuineMiddleAudit.c2ExactGapAnchorExactGapExpandedUpperWeightedPhaseDebit`
  em `LeanC2/AuditGenuineMiddle.lean:12279`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedUpperWeightedPhaseExternalBudget`
  em `LeanC2/AuditGenuineMiddle.lean:12288`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedUpperWeightedPhaseExternalBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:12297`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedUpperComponentWeightedPhaseExternalBudget`
  em `LeanC2/AuditGenuineMiddle.lean:12312`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedUpperComponentWeightedPhaseExternalBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:12323`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedUpperComponentWeightedPhaseExternalClearedBudget`
  em `LeanC2/AuditGenuineMiddle.lean:12340`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedUpperComponentWeightedPhaseExternalClearedBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:12353`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedUpperExternalFactorBudget`
  em `LeanC2/AuditGenuineMiddle.lean:12370`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedUpperExternalFactorBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:12380`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedLocalData`
  em `LeanC2/AuditGenuineMiddle.lean:11492`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedLocalData.of_horizontalBudget`
  em `LeanC2/AuditGenuineMiddle.lean:11509`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedLocalData.of_scaleData`
  em `LeanC2/AuditGenuineMiddle.lean:11535`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedMiddleData`
  em `LeanC2/AuditGenuineMiddle.lean:11561`
- `GenuineMiddleAudit.C2ExactGapAnchorFactorUpperLowerBudget`
  em `LeanC2/AuditGenuineMiddle.lean:11291`
- `GenuineMiddleAudit.C2ExactGapAnchorFactorUpperLowerBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:11296`
- `GenuineMiddleAudit.C2ExactGapAnchorPhaseDisk_of_halfDiskBound`
  em `LeanC2/AuditGenuineMiddle.lean:11251`
- `GenuineMiddleAudit.C2ExactGapAnchorPhaseDiskOnMiddle_of_halfDiskBoundOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:11267`
- `GenuineMiddleAudit.C2ExactGapAnchorPhaseSaving_of_phaseDisk`
  em `LeanC2/AuditGenuineMiddle.lean:11285`
- `GenuineMiddleAudit.C2ExactGapAnchorPhaseSavingOnMiddle_of_phaseDiskOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:11306`
- `GenuineMiddleAudit.c2VerticalDepthTailLower_pos`
  em `LeanC2/AuditGenuineMiddle.lean:11394`
- `GenuineMiddleAudit.c2VerticalDepthTailLower_le_norm_verticalDepthTailFromTwo_of_offCriticalStrip`
  em `LeanC2/AuditGenuineMiddle.lean:11407`
- `GenuineMiddleAudit.verticalDepthTailFromTwo_ne_zero_of_offCriticalStrip`
  em `LeanC2/AuditGenuineMiddle.lean:11427`
- `GenuineMiddleAudit.verticalDepthTailFromTwo_norm_pos_of_offCriticalStrip`
  em `LeanC2/AuditGenuineMiddle.lean:11444`
- `GenuineMiddleAudit.C2ContinuedOddHalfDiskBound_of_anchorResidualBound`
  em `LeanC2/AuditGenuineMiddle.lean:11449`
- `GenuineMiddleAudit.C2ContinuedOddHalfDiskBoundOnMiddle_of_anchorResidualBoundOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:11488`
- `GenuineMiddleAudit.C2ExactGapAnchorExactAnchorResidualBudget_iff_norm_lt_lower_mul_allowance`
  em `LeanC2/AuditGenuineMiddle.lean:11501`
- `GenuineMiddleAudit.C2ExactGapAnchorExactAnchorResidualBudget_of_norm_lt_lower_mul_allowance`
  em `LeanC2/AuditGenuineMiddle.lean:11537`
- `GenuineMiddleAudit.C2ExactGapAnchorTailNormAnchorResidualBudget_of_anchorResidualBound`
  em `LeanC2/AuditGenuineMiddle.lean:11555`
- `GenuineMiddleAudit.C2ExactGapAnchorTailNormAnchorResidualBudgetOnMiddle_of_anchorResidualBoundOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:11572`
- `GenuineMiddleAudit.C2ExactGapAnchorTailNormAnchorResidualUpperBudget_of_factorBudget`
  em `LeanC2/AuditGenuineMiddle.lean:11591`
- `GenuineMiddleAudit.C2ExactGapAnchorTailNormAnchorResidualBudget_of_factorBound`
  em `LeanC2/AuditGenuineMiddle.lean:11614`
- `GenuineMiddleAudit.C2ExactGapAnchorTailNormAnchorResidualBudgetOnMiddle_of_factorBoundOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:11636`
- `GenuineMiddleAudit.C2ContinuedVerticalAnchorResidualFactorBound_exact`
  em `LeanC2/AuditGenuineMiddle.lean:11656`
- `GenuineMiddleAudit.C2ContinuedVerticalAnchorResidualFactorBoundOnMiddle_exact`
  em `LeanC2/AuditGenuineMiddle.lean:11668`
- `GenuineMiddleAudit.c2ContinuedVerticalAnchorResidualExactFactorUpper_eq_exactOddGap`
  em `LeanC2/AuditGenuineMiddle.lean:11677`
- `GenuineMiddleAudit.c2ContinuedVerticalAnchorResidualExactFactorUpper_eq_two_norm_half_sub`
  em `LeanC2/AuditGenuineMiddle.lean:13233`
- `GenuineMiddleAudit.C2ExactGapAnchorTailNormAnchorResidualFactorBudget_exact_iff_pointwise`
  em `LeanC2/AuditGenuineMiddle.lean:13242`
- `GenuineMiddleAudit.C2ExactGapAnchorTailNormAnchorResidualFactorBudgetOnMiddle_exact_iff_pointwise`
  em `LeanC2/AuditGenuineMiddle.lean:13254`
- `GenuineMiddleAudit.C2ExactGapAnchorTailNormAnchorResidualFactorBudget_exact_iff_tailNormAnchorResidualBudget`
  em `LeanC2/AuditGenuineMiddle.lean:11688`
- `GenuineMiddleAudit.C2ExactGapAnchorTailNormAnchorResidualFactorBudgetOnMiddle_exact_iff_tailNormAnchorResidualBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:11706`
- `GenuineMiddleAudit.C2ExactGapAnchorExactFactorUpperBound_exact`
  em `LeanC2/AuditGenuineMiddle.lean:11791`
- `GenuineMiddleAudit.C2ExactGapAnchorExactFactorUpperBoundOnMiddle_exact`
  em `LeanC2/AuditGenuineMiddle.lean:11798`
- `GenuineMiddleAudit.C2ExactGapAnchorExactFactorUpperBound_of_gapBound`
  em `LeanC2/AuditGenuineMiddle.lean:11855`
- `GenuineMiddleAudit.C2ExactGapAnchorExactFactorUpperBoundOnMiddle_of_gapBoundOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:11864`
- `GenuineMiddleAudit.C2ExactGapAnchorFactorAllowanceLowerBound_exact`
  em `LeanC2/AuditGenuineMiddle.lean:11807`
- `GenuineMiddleAudit.C2ExactGapAnchorFactorAllowanceLowerBoundOnMiddle_exact`
  em `LeanC2/AuditGenuineMiddle.lean:11818`
- `GenuineMiddleAudit.C2ExactGapAnchorFactorAllowanceLowerBound_of_scalarBudget`
  em `LeanC2/AuditGenuineMiddle.lean:11905`
- `GenuineMiddleAudit.C2ExactGapAnchorFactorAllowanceLowerBoundOnMiddle_of_scalarBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:11926`
- `GenuineMiddleAudit.C2GenuineExactGapAnchorFinalBudget_of_gapUpperScalarBudget`
  em `LeanC2/AuditGenuineMiddle.lean:11973`
- `GenuineMiddleAudit.C2GenuineExactGapAnchorFinalBudgetOnMiddle_of_gapUpperScalarBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:11999`
- `GenuineMiddleAudit.C2ExactGapAnchorGapUpperScalarBudget_of_allowanceLowerScalarBudget`
  em `LeanC2/AuditGenuineMiddle.lean:12019`
- `GenuineMiddleAudit.C2ExactGapAnchorGapUpperScalarBudgetOnMiddle_of_allowanceLowerScalarBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:12046`
- `GenuineMiddleAudit.C2ExactGapAnchorGapUpperExpandedScalarBudget_iff_gapUpperScalarBudget`
  em `LeanC2/AuditGenuineMiddle.lean:13354`
- `GenuineMiddleAudit.C2ExactGapAnchorGapUpperScalarBudget_of_expandedScalarBudget`
  em `LeanC2/AuditGenuineMiddle.lean:13418`
- `GenuineMiddleAudit.C2ExactGapAnchorGapUpperScalarBudgetOnMiddle_of_expandedScalarBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:13439`
- `GenuineMiddleAudit.C2ExactGapAnchorGapUpperExpandedScalarBudgetOnMiddle_iff_gapUpperScalarBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:13457`
- `GenuineMiddleAudit.C2ExactGapAnchorGapUpperExpandedScalarBudget_of_upperBudget`
  em `LeanC2/AuditGenuineMiddle.lean:13645`
- `GenuineMiddleAudit.C2ExactGapAnchorGapUpperExpandedScalarBudgetOnMiddle_of_upperBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:13720`
- `GenuineMiddleAudit.c2ExactGapAnchorExactTailGapBudget_bound`
  em `LeanC2/AuditGenuineMiddle.lean:13808`
- `GenuineMiddleAudit.c2ExactGapAnchorExactTailGapBudget_bound_onMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:13815`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedScalarBudgetOnMiddle_of_upperBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:14149`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedScalarBudget_iff_explicit`
  em `LeanC2/AuditGenuineMiddle.lean:14180`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedScalarBudget_of_explicit`
  em `LeanC2/AuditGenuineMiddle.lean:14206`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedScalarBudgetOnMiddle_of_explicit`
  em `LeanC2/AuditGenuineMiddle.lean:14228`
- `GenuineMiddleAudit.c2ExactGapAnchorExactTailGapBudget_eq_verticalDepthTailUpper_mul_exactFactorUpper`
  em `LeanC2/AuditGenuineMiddle.lean:13377`
- `GenuineMiddleAudit.C2ExactGapAnchorTailNormAnchorResidualFactorBudgetOnMiddle_exact_of_exactGapExpandedScalarBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:16975`
- `GenuineMiddleAudit.C2ExactGapAnchorTailNormAnchorResidualFactorBudgetOnMiddle_exact_of_exactGapExpandedUpperBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:16999`
- `GenuineMiddleAudit.C2ExactGapAnchorTailNormAnchorResidualFactorBudgetOnMiddle_exact_of_exactGapExpandedUpperFactorReserveBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:17030`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedUpperBudget_iff_upperClearedBudget`
  em `LeanC2/AuditGenuineMiddle.lean:16419`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedUpperBudgetOnMiddle_iff_upperClearedBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:16494`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedUpperClearedBudget_iff_collectedBudget`
  em `LeanC2/AuditGenuineMiddle.lean:16551`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedUpperClearedBudgetOnMiddle_iff_collectedBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:16566`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedUpperCollectedBudget_iff_tailGapReserveBudget`
  em `LeanC2/AuditGenuineMiddle.lean:16598`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedUpperCollectedBudgetOnMiddle_iff_tailGapReserveBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:16615`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedUpperTailGapReserveBudget_of_factorReserveBudget`
  em `LeanC2/AuditGenuineMiddle.lean:16715`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedUpperTailGapReserveBudgetOnMiddle_of_factorReserveBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:16771`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedUpperExternalDebitUpperBound_of_componentBounds`
  em `LeanC2/AuditGenuineMiddle.lean:16817`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedUpperExternalDebitUpperBoundOnMiddle_of_componentBoundsOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:16857`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedUpperFactorReserveLowerBound_of_externalDebitUpperBound`
  em `LeanC2/AuditGenuineMiddle.lean:16882`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedUpperFactorReserveLowerBoundOnMiddle_of_externalDebitUpperBoundOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:16925`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedUpperFactorReserveLowerGapBudget_of_externalFactorBudget`
  em `LeanC2/AuditGenuineMiddle.lean:16945`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedUpperFactorReserveLowerGapBudgetOnMiddle_of_externalFactorBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:16983`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedUpperExternalFactorBudget_of_exactFactorUpperBound_of_weightedPhaseExternalBudget`
  em `LeanC2/AuditGenuineMiddle.lean:16999`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedUpperExternalFactorBudgetOnMiddle_of_exactFactorUpperBoundOnMiddle_of_weightedPhaseExternalBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:17040`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedUpperWeightedPhaseExternalBudget_of_componentWeightedPhaseExternalBudget`
  em `LeanC2/AuditGenuineMiddle.lean:17088`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedUpperWeightedPhaseExternalBudgetOnMiddle_of_componentWeightedPhaseExternalBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:17108`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedUpperComponentWeightedPhaseExternalBudget_of_clearedBudget`
  em `LeanC2/AuditGenuineMiddle.lean:17128`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedUpperComponentWeightedPhaseExternalBudgetOnMiddle_of_clearedBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:17181`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedUpperFactorReserveBudget_of_lowerBound_of_lowerGapBudget`
  em `LeanC2/AuditGenuineMiddle.lean:17199`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedUpperFactorReserveBudgetOnMiddle_of_lowerBoundOnMiddle_of_lowerGapBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:17219`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedUpperCollectedBudgetOnMiddle_of_externalDebitUpperBoundOnMiddle_of_externalFactorBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:17240`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedUpperCollectedBudgetOnMiddle_of_externalDebitUpperBoundOnMiddle_of_exactFactorUpperBoundOnMiddle_of_weightedPhaseExternalBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:17272`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedUpperCollectedBudgetOnMiddle_of_componentBoundsOnMiddle_of_exactFactorUpperBoundOnMiddle_of_componentWeightedPhaseExternalBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:17297`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedUpperCollectedBudgetOnMiddle_of_componentBoundsOnMiddle_of_exactFactorUpperBoundOnMiddle_of_componentWeightedPhaseExternalClearedBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:17329`
- `GenuineMiddleAudit.c2VerticalTailLowerDistortion`
  em `LeanC2/AuditGenuineMiddle.lean:11309`
- `GenuineMiddleAudit.c2VerticalTailLowerDistortionExplicitUpper`
  em `LeanC2/AuditGenuineMiddle.lean:11313`
- `GenuineMiddleAudit.c2ContinuedVerticalAnchorResidualExactLowerFactorUpper`
  em `LeanC2/AuditGenuineMiddle.lean:11318`
- `GenuineMiddleAudit.C2ExactGapAnchorTailLowerDistortedGapBudget`
  em `LeanC2/AuditGenuineMiddle.lean:11325`
- `GenuineMiddleAudit.C2ExactGapAnchorTailLowerDistortedGapBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:11335`
- `GenuineMiddleAudit.C2ExactGapAnchorTailLowerDistortedGapExplicitUpperBudget`
  em `LeanC2/AuditGenuineMiddle.lean:11348`
- `GenuineMiddleAudit.C2ExactGapAnchorTailLowerDistortedGapExplicitUpperBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:11358`
- `GenuineMiddleAudit.C2ExactGapAnchorTailLowerDistortedPhaseDisk`
  em `LeanC2/AuditGenuineMiddle.lean:11370`
- `GenuineMiddleAudit.C2ExactGapAnchorTailLowerDistortedPhaseDiskOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:11380`
- `GenuineMiddleAudit.C2ExactGapAnchorTailLowerDistortedPhaseDiskBudget`
  em `LeanC2/AuditGenuineMiddle.lean:11395`
- `GenuineMiddleAudit.C2ExactGapAnchorTailLowerDistortedPhaseDiskBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:11405`
- `GenuineMiddleAudit.c2TailLowerDistortedHalfDiskPaymentUpper`
  em `LeanC2/AuditGenuineMiddle.lean:11419`
- `GenuineMiddleAudit.C2ExactGapAnchorTailLowerDistortedPhaseDiskUpperLowerBudget`
  em `LeanC2/AuditGenuineMiddle.lean:11428`
- `GenuineMiddleAudit.C2ExactGapAnchorTailLowerDistortedPhaseDiskUpperLowerBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:11435`
- `GenuineMiddleAudit.C2ExactGapAnchorTailLowerDistortedMetricPaymentClearedBudget`
  em `LeanC2/AuditGenuineMiddle.lean:11451`
- `GenuineMiddleAudit.C2ExactGapAnchorTailLowerDistortedMetricPaymentClearedBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:11458`
- `GenuineMiddleAudit.C2ExactGapAnchorTailLowerDistortedOddMetricPaymentClearedBudget`
  em `LeanC2/AuditGenuineMiddle.lean:11473`
- `GenuineMiddleAudit.C2ExactGapAnchorTailLowerDistortedOddMetricPaymentClearedBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:11480`
- `GenuineMiddleAudit.c2TailLowerDistortedOddMetricAllowanceLower`
  em `LeanC2/AuditGenuineMiddle.lean:11495`
- `GenuineMiddleAudit.C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceBudget`
  em `LeanC2/AuditGenuineMiddle.lean:11505`
- `GenuineMiddleAudit.C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:11518`
- `GenuineMiddleAudit.C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedBudget`
  em `LeanC2/AuditGenuineMiddle.lean:11536`
- `GenuineMiddleAudit.C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:11559`
- `GenuineMiddleAudit.C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceClearedBudget`
  em `LeanC2/AuditGenuineMiddle.lean:11576`
- `GenuineMiddleAudit.C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceClearedBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:11597`
- `GenuineMiddleAudit.C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedUpperBudget`
  em `LeanC2/AuditGenuineMiddle.lean:11577`
- `GenuineMiddleAudit.C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedUpperBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:11596`
- `GenuineMiddleAudit.C2TailLowerDistortedOddMetricAllowanceUpperBound`
  em `LeanC2/AuditGenuineMiddle.lean:11610`
- `GenuineMiddleAudit.C2TailLowerDistortedOddMetricAllowanceUpperBoundOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:11617`
- `GenuineMiddleAudit.C2VerticalDepthTailUpperBound`
  em `LeanC2/AuditGenuineMiddle.lean:11629`
- `GenuineMiddleAudit.C2VerticalDepthTailUpperBoundOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:11634`
- `GenuineMiddleAudit.C2TailLowerDistortedOddMetricAllowanceTailProductBudget`
  em `LeanC2/AuditGenuineMiddle.lean:11648`
- `GenuineMiddleAudit.C2TailLowerDistortedOddMetricAllowanceTailProductBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:11654`
- `GenuineMiddleAudit.C2TailLowerDistortedOddMetricAllowanceTailProductBound`
  em `LeanC2/AuditGenuineMiddle.lean:11666`
- `GenuineMiddleAudit.C2TailLowerDistortedOddMetricAllowanceTailProductBoundOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:11673`
- `GenuineMiddleAudit.c2TailLowerDistortedOddMetricAllowanceTailProductCanonicalUpper`
  em `LeanC2/AuditGenuineMiddle.lean:11688`
- `GenuineMiddleAudit.C2TailLowerDistortedOddMetricAllowanceTailProductCanonicalBudget`
  em `LeanC2/AuditGenuineMiddle.lean:11696`
- `GenuineMiddleAudit.C2TailLowerDistortedOddMetricAllowanceTailProductCanonicalBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:11703`
- `GenuineMiddleAudit.C2TailLowerDistortedOddMetricAllowanceTailProductCanonicalBudgetOnMiddle_self`
  em `LeanC2/AuditGenuineMiddle.lean:11714`
- `GenuineMiddleAudit.C2ExactGapAnchorTailLowerDistortedGapExplicitUpperBudget_iff_phaseDisk`
  em `LeanC2/AuditGenuineMiddle.lean:12331`
- `GenuineMiddleAudit.C2ExactGapAnchorTailLowerDistortedGapExplicitUpperBudgetOnMiddle_iff_phaseDiskOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:12378`
- `GenuineMiddleAudit.C2ExactGapAnchorTailLowerDistortedPhaseDisk_of_halfDiskBound`
  em `LeanC2/AuditGenuineMiddle.lean:12405`
- `GenuineMiddleAudit.C2ExactGapAnchorTailLowerDistortedPhaseDiskOnMiddle_of_halfDiskBoundOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:12437`
- `GenuineMiddleAudit.C2ExactGapAnchorTailLowerDistortedPhaseDiskBudget_of_upperLowerBudget`
  em `LeanC2/AuditGenuineMiddle.lean:12455`
- `GenuineMiddleAudit.C2ExactGapAnchorTailLowerDistortedPhaseDiskBudgetOnMiddle_of_upperLowerBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:12476`
- `GenuineMiddleAudit.C2ExactGapAnchorTailLowerDistortedPhaseDiskUpperLowerBudget_of_metricPaymentClearedBudget`
  em `LeanC2/AuditGenuineMiddle.lean:12496`
- `GenuineMiddleAudit.C2ExactGapAnchorTailLowerDistortedPhaseDiskUpperLowerBudgetOnMiddle_of_metricPaymentClearedBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:12527`
- `GenuineMiddleAudit.C2ExactGapAnchorTailLowerDistortedMetricPaymentClearedBudget_of_oddMetricPaymentClearedBudget`
  em `LeanC2/AuditGenuineMiddle.lean:12541`
- `GenuineMiddleAudit.C2ExactGapAnchorTailLowerDistortedMetricPaymentClearedBudgetOnMiddle_of_oddMetricPaymentClearedBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:12559`
- `GenuineMiddleAudit.C2ExactGapAnchorTailLowerDistortedPhaseDiskUpperLowerBudgetOnMiddle_of_oddMetricPaymentClearedBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:12574`
- `GenuineMiddleAudit.C2ExactGapAnchorTailLowerDistortedOddMetricPaymentClearedBudget_of_slackAllowanceLower`
  em `LeanC2/AuditGenuineMiddle.lean:12628`
- `GenuineMiddleAudit.C2ExactGapAnchorTailLowerDistortedOddMetricPaymentClearedBudgetOnMiddle_of_slackAllowanceLower`
  em `LeanC2/AuditGenuineMiddle.lean:12658`
- `GenuineMiddleAudit.C2ExactGapAnchorTailLowerDistortedPhaseDiskBudgetOnMiddle_of_allowanceLowerScalarBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:12872`
- `GenuineMiddleAudit.C2ExactGapAnchorFactorAllowanceLowerScalarBudgetOnMiddle_of_oddMetricSlackAllowanceBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:13033`
- `GenuineMiddleAudit.exactVerticalScalarBudget_iff_budget_le_allowance`
  em `LeanC2/AuditGenuineMiddle.lean:14384`
- `GenuineMiddleAudit.C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedBudget_iff_slackAllowanceBudget`
  em `LeanC2/AuditGenuineMiddle.lean:14686`
- `GenuineMiddleAudit.C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceBudgetOnMiddle_of_expandedBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:14775`
- `GenuineMiddleAudit.C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedBudgetOnMiddle_iff_slackAllowanceBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:14793`
- `GenuineMiddleAudit.C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedBudget_of_clearedBudget`
  em `LeanC2/AuditGenuineMiddle.lean:15243`
- `GenuineMiddleAudit.C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedBudgetOnMiddle_of_clearedBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:15317`
- `GenuineMiddleAudit.c2_cleared_tail_min_gt_cleared_quartet_margin_scalar`
  em `LeanC2/AuditGenuineMiddle.lean:15335`
- `GenuineMiddleAudit.not_C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceClearedBudget_of_nonneg`
  em `LeanC2/AuditGenuineMiddle.lean:15359`
- `GenuineMiddleAudit.C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedBudget_of_upperBudget`
  em `LeanC2/AuditGenuineMiddle.lean:15471`
- `GenuineMiddleAudit.C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedBudgetOnMiddle_of_upperBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:14898`
- `GenuineMiddleAudit.oddUpper_nonneg_of_continuedOddChannelBound`
  em `LeanC2/AuditGenuineMiddle.lean:14936`
- `GenuineMiddleAudit.c2TailLowerDistortedOddMetricAllowanceLower_nonneg_of_oddBound`
  em `LeanC2/AuditGenuineMiddle.lean:14969`
- `GenuineMiddleAudit.C2TailLowerDistortedOddMetricAllowanceTailProductBound_of_upperBounds`
  em `LeanC2/AuditGenuineMiddle.lean:14978`
- `GenuineMiddleAudit.C2TailLowerDistortedOddMetricAllowanceTailProductBoundOnMiddle_of_upperBoundsOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:15021`
- `GenuineMiddleAudit.c2TailLowerDistortedOddMetricAllowanceTailProductCanonicalUpper_eq`
  em `LeanC2/AuditGenuineMiddle.lean:15077`
- `GenuineMiddleAudit.C2TailLowerDistortedOddMetricAllowanceTailProductBound_of_canonicalBudget`
  em `LeanC2/AuditGenuineMiddle.lean:15089`
- `GenuineMiddleAudit.C2TailLowerDistortedOddMetricAllowanceTailProductBoundOnMiddle_of_canonicalBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:15102`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedScalarBudget_iff_finalBudget`
  em `LeanC2/AuditGenuineMiddle.lean:14254`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedScalarBudget_iff_phaseSaving`
  em `LeanC2/AuditGenuineMiddle.lean:14306`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedScalarBudgetOnMiddle_iff_phaseSavingOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:14328`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedMiddleData.of_scalarBudget`
  em `LeanC2/AuditGenuineMiddle.lean:14355`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedMiddleData.of_scaleData`
  em `LeanC2/AuditGenuineMiddle.lean:14384`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedMiddleData.of_phaseSavingOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:14413`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedMiddleData.of_scaleData_phaseSavingOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:14446`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedMiddleData.of_explicit`
  em `LeanC2/AuditGenuineMiddle.lean:14478`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedMiddleData.of_upperBudget`
  em `LeanC2/AuditGenuineMiddle.lean:14518`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedMiddleData.to_phaseSavingOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:14562`
- `GenuineMiddleAudit.C2ExactGapAnchorExactGapExpandedMiddleData.forces_exactOddGap_lt_one`
  em `LeanC2/AuditGenuineMiddle.lean:14587`
- `GenuineMiddleAudit.C2ExactGapAnchorPhaseDiskMiddleData`
  em `LeanC2/AuditGenuineMiddle.lean:14611`
- `GenuineMiddleAudit.C2ExactGapAnchorPhaseDiskMiddleData.of_scaleData`
  em `LeanC2/AuditGenuineMiddle.lean:14633`
- `GenuineMiddleAudit.C2ExactGapAnchorPhaseDiskMiddleData.to_phaseSavingOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:14666`
- `GenuineMiddleAudit.C2ExactGapAnchorPhaseDiskMiddleData.to_exactGapExpandedMiddleData`
  em `LeanC2/AuditGenuineMiddle.lean:14678`
- `GenuineMiddleAudit.C2ExactGapAnchorAnchorResidualMiddleData`
  em `LeanC2/AuditGenuineMiddle.lean:14695`
- `GenuineMiddleAudit.C2ExactGapAnchorAnchorResidualMiddleData.of_scaleData`
  em `LeanC2/AuditGenuineMiddle.lean:14721`
- `GenuineMiddleAudit.C2ExactGapAnchorAnchorResidualMiddleData.of_exactAnchorResidualBudget`
  em `LeanC2/AuditGenuineMiddle.lean:14759`
- `GenuineMiddleAudit.C2ExactGapAnchorAnchorResidualMiddleData.of_scaleData_exactAnchorResidualBudget`
  em `LeanC2/AuditGenuineMiddle.lean:14792`
- `GenuineMiddleAudit.C2ExactGapAnchorAnchorResidualMiddleData.of_tailLowerDistortedGapBudget`
  em `LeanC2/AuditGenuineMiddle.lean:14823`
- `GenuineMiddleAudit.C2ExactGapAnchorAnchorResidualMiddleData.of_scaleData_tailLowerDistortedGapBudget`
  em `LeanC2/AuditGenuineMiddle.lean:14968`
- `GenuineMiddleAudit.C2ExactGapAnchorAnchorResidualMiddleData.of_scaleData_tailLowerDistortedGapExplicitUpperBudget`
  em `LeanC2/AuditGenuineMiddle.lean:15001`
- `GenuineMiddleAudit.C2ExactGapAnchorAnchorResidualMiddleData.of_scaleData_tailLowerDistortedPhaseDisk`
  em `LeanC2/AuditGenuineMiddle.lean:15029`
- `GenuineMiddleAudit.C2ExactGapAnchorAnchorResidualMiddleData.to_phaseDiskMiddleData`
  em `LeanC2/AuditGenuineMiddle.lean:14918`
- `GenuineMiddleAudit.C2ExactGapAnchorAnchorResidualMiddleData.to_phaseSavingOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:14941`
- `GenuineMiddleAudit.C2ExactGapAnchorAnchorResidualMiddleData.to_exactGapExpandedMiddleData`
  em `LeanC2/AuditGenuineMiddle.lean:14955`
- `GenuineMiddleAudit.C2ExactGapAnchorTailNormAnchorResidualFactorBudget_exact_of_upperLowerBudget`
  em `LeanC2/AuditGenuineMiddle.lean:11836`
- `GenuineMiddleAudit.C2ExactGapAnchorTailNormAnchorResidualFactorBudgetOnMiddle_exact_of_upperLowerBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:11859`
- `GenuineMiddleAudit.C2ExactGapAnchorExactFactorUpperBoundOnMiddle_of_gapBoundOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:13087`
- `GenuineMiddleAudit.C2ExactGapAnchorFactorAllowanceLowerBoundOnMiddle_of_scalarBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:13149`
- `GenuineMiddleAudit.c2ExactGapAnchorFactorAllowance_pos_onMiddle_of_allowanceLowerPositiveOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:13185`
- `GenuineMiddleAudit.C2ExactGapAnchorPositiveAllowanceBudgetOnMiddle_of_allowanceLowerPositiveOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:13983`
- `GenuineMiddleAudit.c2ContinuedVerticalAnchorResidualExactFactorUpper_nonneg`
  em `LeanC2/AuditGenuineMiddle.lean:14005`
- `GenuineMiddleAudit.C2ExactGapAnchorFactorUpperLowerBudget_exact_iff`
  em `LeanC2/AuditGenuineMiddle.lean:14011`
- `GenuineMiddleAudit.C2ExactGapAnchorFactorUpperLowerBudgetOnMiddle_exact_iff`
  em `LeanC2/AuditGenuineMiddle.lean:14019`
- `GenuineMiddleAudit.C2ExactGapAnchorFactorAllowanceLowerPositiveOnMiddle_of_exactFactorUpperLowerBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:14046`
- `GenuineMiddleAudit.C2ExactGapAnchorTailNormAnchorResidualFactorBudgetOnMiddle_exact_of_exactFactorUpperLowerBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:14062`
- `GenuineMiddleAudit.C2ExactGapAnchorPositiveAllowanceBudgetOnMiddle_of_exactFactorUpperLowerBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:14082`
- `GenuineMiddleAudit.C2ExactGapAnchorTailNormAnchorResidualUpperBudget_exact_iff_tailNormAnchorResidualBudget`
  em `LeanC2/AuditGenuineMiddle.lean:11734`
- `GenuineMiddleAudit.C2ExactGapAnchorTailNormAnchorResidualUpperBudgetOnMiddle_exact_iff_tailNormAnchorResidualBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:11748`
- `GenuineMiddleAudit.C2ExactGapAnchorPhaseSaving_of_tailNormAnchorResidualBudget`
  em `LeanC2/AuditGenuineMiddle.lean:11776`
- `GenuineMiddleAudit.C2ExactGapAnchorTailNormAnchorResidualBudget_of_phaseSaving`
  em `LeanC2/AuditGenuineMiddle.lean:11804`
- `GenuineMiddleAudit.C2ExactGapAnchorTailNormAnchorResidualBudget_iff_phaseSaving`
  em `LeanC2/AuditGenuineMiddle.lean:11821`
- `GenuineMiddleAudit.C2ExactGapAnchorPhaseSavingOnMiddle_of_tailNormAnchorResidualBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:11834`
- `GenuineMiddleAudit.C2ExactGapAnchorTailNormAnchorResidualBudgetOnMiddle_of_phaseSavingOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:11848`
- `GenuineMiddleAudit.C2ExactGapAnchorTailNormAnchorResidualBudgetOnMiddle_iff_phaseSavingOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:11862`
- `GenuineMiddleAudit.C2ExactGapAnchorTailNormAnchorResidualFactorBudget_exact_iff_phaseSaving`
  em `LeanC2/AuditGenuineMiddle.lean:11875`
- `GenuineMiddleAudit.C2ExactGapAnchorTailNormAnchorResidualFactorBudgetOnMiddle_exact_iff_phaseSavingOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:11898`
- `GenuineMiddleAudit.C2GenuineExactGapAnchorFinalBudget_iff_exactOddGap_lt_factorAllowance`
  em `LeanC2/AuditGenuineMiddle.lean:11925`
- `GenuineMiddleAudit.C2GenuineExactGapAnchorFinalBudget_of_phaseSaving`
  em `LeanC2/AuditGenuineMiddle.lean:11975`
- `GenuineMiddleAudit.C2GenuineExactGapAnchorFinalBudget_iff_phaseSaving`
  em `LeanC2/AuditGenuineMiddle.lean:11989`
- `GenuineMiddleAudit.C2ExactGapAnchorPhaseSaving_of_exactGapAnchorFinalBudget`
  em `LeanC2/AuditGenuineMiddle.lean:12006`
- `GenuineMiddleAudit.C2GenuineExactGapAnchorFinalBudget_iff_tailNormAnchorResidualBudget`
  em `LeanC2/AuditGenuineMiddle.lean:12023`
- `GenuineMiddleAudit.C2GenuineExactGapAnchorFinalBudget_of_tailNormAnchorResidualBudget`
  em `LeanC2/AuditGenuineMiddle.lean:12050`
- `GenuineMiddleAudit.C2GenuineExactGapAnchorFinalBudgetOnMiddle_iff_phaseSavingOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:12067`
- `GenuineMiddleAudit.C2GenuineExactGapAnchorFinalBudgetOnMiddle_iff_tailNormAnchorResidualBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:12088`
- `GenuineMiddleAudit.C2GenuineExactGapAnchorFinalBudget_iff_tailNormAnchorResidualFactorBudget_exact`
  em `LeanC2/AuditGenuineMiddle.lean:12117`
- `GenuineMiddleAudit.C2GenuineExactGapAnchorFinalBudgetOnMiddle_iff_tailNormAnchorResidualFactorBudgetOnMiddle_exact`
  em `LeanC2/AuditGenuineMiddle.lean:12140`
- `GenuineMiddleAudit.C2ExactGapAnchorPhaseSaving_forces_factorAllowance_pos`
  em `LeanC2/AuditGenuineMiddle.lean:12170`
- `GenuineMiddleAudit.not_C2ExactGapAnchorPhaseSaving_of_factorAllowance_nonpos`
  em `LeanC2/AuditGenuineMiddle.lean:12190`
- `GenuineMiddleAudit.C2ExactGapAnchorTailNormAnchorResidualBudget_forces_factorAllowance_pos`
  em `LeanC2/AuditGenuineMiddle.lean:12207`
- `GenuineMiddleAudit.not_C2ExactGapAnchorTailNormAnchorResidualBudget_of_factorAllowance_nonpos`
  em `LeanC2/AuditGenuineMiddle.lean:12222`
- `GenuineMiddleAudit.C2GenuineExactGapAnchorFinalBudget_forces_factorAllowance_pos`
  em `LeanC2/AuditGenuineMiddle.lean:12238`
- `GenuineMiddleAudit.c2ExactGapAnchorFactorAllowance_pos_iff_positiveAllowanceBudget`
  em `LeanC2/AuditGenuineMiddle.lean:12253`
- `GenuineMiddleAudit.c2ExactGapAnchorFactorAllowance_pos_of_positiveAllowanceBudget`
  em `LeanC2/AuditGenuineMiddle.lean:12276`
- `GenuineMiddleAudit.C2ExactGapAnchorPositiveAllowanceBudget_of_factorAllowance_pos`
  em `LeanC2/AuditGenuineMiddle.lean:12294`
- `GenuineMiddleAudit.c2ExactGapAnchorFactorAllowance_pos_onMiddle_of_positiveAllowanceBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:12312`
- `GenuineMiddleAudit.c2ExactGapAnchorFactorAllowance_lt_one_of_offCritical`
  em `LeanC2/AuditGenuineMiddle.lean:12416`
- `GenuineMiddleAudit.C2ExactGapAnchorPhaseSaving_forces_exactOddGap_lt_one`
  em `LeanC2/AuditGenuineMiddle.lean:12445`
- `GenuineMiddleAudit.C2ExactGapAnchorTailNormAnchorResidualBudget_forces_exactOddGap_lt_one`
  em `LeanC2/AuditGenuineMiddle.lean:12465`
- `GenuineMiddleAudit.not_C2ExactGapAnchorTailNormAnchorResidualBudget_of_one_le_exactOddGap`
  em `LeanC2/AuditGenuineMiddle.lean:12484`
- `GenuineMiddleAudit.C2ExactGapAnchorPhaseDisk_forces_exactOddGap_lt_one`
  em `LeanC2/AuditGenuineMiddle.lean:12504`
- `GenuineMiddleAudit.C2GenuineExactGapAnchorFinalBudget_forces_exactOddGap_lt_one`
  em `LeanC2/AuditGenuineMiddle.lean:12559`
- `GenuineMiddleAudit.not_C2GenuineExactGapAnchorFinalBudget_of_one_le_exactOddGap`
  em `LeanC2/AuditGenuineMiddle.lean:12592`
- `GenuineMiddleAudit.exactVerticalScalarBudget_iff_budget_lt_allowance`
  em `LeanC2/AuditGenuineMiddle.lean:12804`
- `GenuineMiddleAudit.C2ExactGapAnchorPositiveAllowanceScalarBudget_iff_positiveAllowanceBudget`
  em `LeanC2/AuditGenuineMiddle.lean:12904`
- `GenuineMiddleAudit.c2ExactGapAnchorFactorAllowance_pos_of_positiveAllowanceScalarBudget`
  em `LeanC2/AuditGenuineMiddle.lean:12926`
- `GenuineMiddleAudit.C2ExactGapAnchorPositiveAllowanceBudgetOnMiddle_of_scalarBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:12946`
- `GenuineMiddleAudit.C2ExactGapAnchorPositiveAllowanceScalarBudgetOnMiddle_iff_positiveAllowanceBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:12965`
- `GenuineMiddleAudit.c2ExactGapAnchorFactorAllowance_pos_onMiddle_of_positiveAllowanceScalarBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:12985`
- `GenuineMiddleAudit.C2ExactGapAnchorPositiveAllowanceScalarBudget_of_upperBudget`
  em `LeanC2/AuditGenuineMiddle.lean:13002`
- `GenuineMiddleAudit.C2ExactGapAnchorPositiveAllowanceScalarBudgetOnMiddle_of_upperBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:13068`
- `GenuineMiddleAudit.c2ExactGapAnchorFactorAllowance_pos_onMiddle_of_positiveAllowanceUpperBudgetOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:13100`
- `GenuineMiddleAudit.genuineCentral_ne_zero_of_gapAnchorFinalBudget`
  em `LeanC2/AuditGenuineMiddle.lean:14332`
- `GenuineMiddleAudit.genuineCentral_ne_zero_of_exactGapAnchorFinalBudget`
  em `LeanC2/AuditGenuineMiddle.lean:14362`
- `GenuineMiddleAudit.genuineCentral_ne_zero_on_middle_of_gapAnchorFinalBudget`
  em `LeanC2/AuditGenuineMiddle.lean:14394`
- `GenuineMiddleAudit.genuineCentral_ne_zero_on_middle_of_exactGapAnchorFinalBudget`
  em `LeanC2/AuditGenuineMiddle.lean:14448`
- `GenuineMiddleAudit.genuineCentral_ne_zero_on_middle_of_exactGapAnchorFactorAllowance`
  em `LeanC2/AuditGenuineMiddle.lean:14488`
- `GenuineMiddleAudit.genuineCentral_ne_zero_on_middle_of_exactGapAnchorPhaseSaving`
  em `LeanC2/AuditGenuineMiddle.lean:17812`
- `GenuineMiddleAudit.genuineCentral_ne_zero_on_middle_of_exactGapAnchorPhaseDisk`
  em `LeanC2/AuditGenuineMiddle.lean:17846`
- `GenuineMiddleAudit.genuineCentral_ne_zero_on_middle_of_exactGapAnchorHalfDiskBound`
  em `LeanC2/AuditGenuineMiddle.lean:14592`
- `GenuineMiddleAudit.genuineCentral_ne_zero_on_middle_of_exactGapAnchorAnchorResidualBound`
  em `LeanC2/AuditGenuineMiddle.lean:14631`
- `GenuineMiddleAudit.genuineCentral_ne_zero_on_middle_of_exactGapAnchorExactAnchorResidualBudget`
  em `LeanC2/AuditGenuineMiddle.lean:14670`
- `GenuineMiddleAudit.genuineCentral_ne_zero_on_middle_of_exactGapAnchorExactAnchorResidualNorm`
  em `LeanC2/AuditGenuineMiddle.lean:14705`
- `GenuineMiddleAudit.genuineCentral_ne_zero_on_middle_of_exactGapAnchorTailNormAnchorResidualBudget`
  em `LeanC2/AuditGenuineMiddle.lean:18031`
- `GenuineMiddleAudit.genuineCentral_ne_zero_on_middle_of_exactGapAnchorTailNormAnchorResidualExplicitBudget`
  em `LeanC2/AuditGenuineMiddle.lean:18065`
- `GenuineMiddleAudit.genuineCentral_ne_zero_on_middle_of_exactGapAnchorTailNormAnchorResidualUpperBound`
  em `LeanC2/AuditGenuineMiddle.lean:18104`
- `GenuineMiddleAudit.genuineCentral_ne_zero_on_middle_of_exactGapAnchorTailNormAnchorResidualFactorBound`
  em `LeanC2/AuditGenuineMiddle.lean:18142`
- `GenuineMiddleAudit.genuineCentral_ne_zero_on_middle_of_exactGapAnchorTailNormAnchorResidualExactFactorBudget`
  em `LeanC2/AuditGenuineMiddle.lean:18181`
- `GenuineMiddleAudit.genuineCentral_ne_zero_on_middle_of_exactGapAnchorFactorUpperLowerBudget`
  em `LeanC2/AuditGenuineMiddle.lean:15633`
- `GenuineMiddleAudit.genuineCentral_ne_zero_on_middle_of_exactGapAnchorGapUpperScalarBudget`
  em `LeanC2/AuditGenuineMiddle.lean:15675`
- `GenuineMiddleAudit.genuineCentral_ne_zero_on_middle_of_exactGapAnchorGapUpperExpandedScalarBudget`
  em `LeanC2/AuditGenuineMiddle.lean:15713`
- `GenuineMiddleAudit.genuineCentral_ne_zero_on_middle_of_exactGapAnchorGapUpperExpandedUpperBudget`
  em `LeanC2/AuditGenuineMiddle.lean:15752`
- `GenuineMiddleAudit.genuineCentral_ne_zero_of_exactGapAnchorExactGapExpandedLocalData`
  em `LeanC2/AuditGenuineMiddle.lean:15489`
- `GenuineMiddleAudit.genuineCentral_ne_zero_on_middle_of_exactGapAnchorExactGapExpandedScalarBudget`
  em `LeanC2/AuditGenuineMiddle.lean:17047`
- `GenuineMiddleAudit.genuineCentral_ne_zero_on_middle_of_exactGapAnchorExactGapExpandedUpperBudget`
  em `LeanC2/AuditGenuineMiddle.lean:17080`
- `GenuineMiddleAudit.genuineCentral_ne_zero_on_middle_of_exactGapAnchorExactGapExpandedExplicitBudget`
  em `LeanC2/AuditGenuineMiddle.lean:17129`
- `GenuineMiddleAudit.genuineCentral_ne_zero_on_middle_of_exactGapAnchorExactGapExpandedMiddleData`
  em `LeanC2/AuditGenuineMiddle.lean:17172`
- `GenuineMiddleAudit.genuineCentral_ne_zero_on_middle_of_exactGapAnchorPhaseDiskMiddleData`
  em `LeanC2/AuditGenuineMiddle.lean:17190`
- `GenuineMiddleAudit.genuineCentral_ne_zero_on_middle_of_exactGapAnchorAnchorResidualMiddleData`
  em `LeanC2/AuditGenuineMiddle.lean:17209`
- `GenuineMiddleAudit.genuineCentral_ne_zero_on_middle_of_exactGapAnchorTailLowerDistortedGapBudget`
  em `LeanC2/AuditGenuineMiddle.lean:17451`
- `GenuineMiddleAudit.genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedGapBudget`
  em `LeanC2/AuditGenuineMiddle.lean:17485`
- `GenuineMiddleAudit.genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedGapExplicitUpperBudget`
  em `LeanC2/AuditGenuineMiddle.lean:17517`
- `GenuineMiddleAudit.genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedPhaseDisk`
  em `LeanC2/AuditGenuineMiddle.lean:17549`
- `GenuineMiddleAudit.genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedHalfDiskBound`
  em `LeanC2/AuditGenuineMiddle.lean:17643`
- `GenuineMiddleAudit.genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedOddChannelBound`
  em `LeanC2/AuditGenuineMiddle.lean:17679`
- `GenuineMiddleAudit.genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedOddChannelAllowanceLowerBudget`
  em `LeanC2/AuditGenuineMiddle.lean:17943`
- `GenuineMiddleAudit.genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedOddMetricPaymentClearedBudget`
  em `LeanC2/AuditGenuineMiddle.lean:17982`
- `GenuineMiddleAudit.genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedOddMetricSlackAllowanceBudget`
  em `LeanC2/AuditGenuineMiddle.lean:18552`
- `GenuineMiddleAudit.genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedOddMetricSlackAllowanceExpandedBudget`
  em `LeanC2/AuditGenuineMiddle.lean:18778`
- `GenuineMiddleAudit.genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedOddMetricSlackAllowanceExpandedUpperBudget`
  em `LeanC2/AuditGenuineMiddle.lean:18816`
- `GenuineMiddleAudit.genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedOddMetricSlackAllowanceExpandedUpperBudget_of_tailProductBound`
  em `LeanC2/AuditGenuineMiddle.lean:18873`
- `GenuineMiddleAudit.genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedOddMetricSlackAllowanceExpandedUpperBudget_of_tailProductUpperBounds`
  em `LeanC2/AuditGenuineMiddle.lean:18929`
- `GenuineMiddleAudit.genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedOddMetricSlackAllowanceExpandedUpperBudget_of_tailProductCanonicalBudget`
  em `LeanC2/AuditGenuineMiddle.lean:19062`
- `GenuineMiddleAudit.genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedOddMetricSlackAllowanceExpandedCanonicalUpperBudget`
  em `LeanC2/AuditGenuineMiddle.lean:19132`
- `GenuineMiddleAudit.genuineCentral_ne_zero_on_middle_of_exactGapAnchorExactGapExpandedScaleData`
  em `LeanC2/AuditGenuineMiddle.lean:17328`
- `GenuineMiddleAudit.genuineCentral_ne_zero_on_middle_of_exactGapAnchorPhaseSavingOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:17360`
- `GenuineMiddleAudit.genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataPhaseSavingOnMiddle`
  em `LeanC2/AuditGenuineMiddle.lean:17399`
- `GenuineMiddleAudit.genuineCentral_ne_zero_on_middle_of_exactGapAnchorExactGapExpandedScaleDataExplicitBudget`
  em `LeanC2/AuditGenuineMiddle.lean:17431`
- `GenuineMiddleAudit.genuineCentral_ne_zero_on_middle_of_exactGapAnchorGapUpperAllowanceLowerBudget`
  em `LeanC2/AuditGenuineMiddle.lean:17476`
- `GenuineMiddleAudit.genuineCentral_ne_zero_on_middle_of_exactGapAnchorExplicitBudget`
  em `LeanC2/AuditGenuineMiddle.lean:17519`

Leitura: o pacote odd-anchor norm-only nao pode fechar sob uppers naturais nao
negativos.  A substituicao correta e gap-aware/exact-gap: provar o budget
escalar expandido contra a margem do quarteto.  O certificado comprimido atual
e `C2ExactGapAnchorExactGapExpandedMiddleData`, e a ponte global
`genuineCentral_ne_zero_on_middle_of_exactGapAnchorExactGapExpandedMiddleData`
devolve `genuineCentralDoubleSeries s != 0` em todo o middle.  Para construir
esse certificado, a rota comprimida agora e provar
`C2ExactGapAnchorPhaseSavingOnMiddle` junto dos dados horizontais.  A
desigualdade literal expandida com
`‖1 - 2 * continuedOddDirichletChannel s‖` continua disponivel como forma
aberta equivalente; as versoes com `gapUpper`, `allowanceLower`, uppers
externos e `C2ExpandedScalarScaleData` sao decomposicoes opcionais.

A tentativa direta mostrou que pertencer ao middle ainda nao carrega dado de
fase suficiente para fechar essa desigualdade.  A obrigacao normalizada ficou
nomeada como `C2ExactGapAnchorPhaseSavingOnMiddle`: provar saving de fase para
o gap odd continuado contra `c2ExactGapAnchorFactorAllowance`.  A forma
geometrica suficiente agora tambem esta nomeada como
`C2ExactGapAnchorPhaseDiskOnMiddle`: provar que o canal odd continuado fica no
disco centrado em `1/2` com raio
`c2ExactGapAnchorFactorAllowance ... s / 2`.  Formalmente, qualquer fechamento
desse budget forca `‖1 - 2 * continuedOddDirichletChannel s‖ < 1`; portanto a
proxima matematica precisa capturar saving de fase genuino no canal odd
continuado sem abrir a definicao do canal continuado pela rota terminal.

### 8. Superficie auditavel do quarteto ajustado

Reduced.

Arquivo:

- `LeanC2/AuditAdjustedQuartetRoute.lean`

Nomes:

- `AdjustedQuartetAudit.PointwiseBounds`
  em `LeanC2/AuditAdjustedQuartetRoute.lean:60`
- `AdjustedQuartetAudit.ClosureInputs`
  em `LeanC2/AuditAdjustedQuartetRoute.lean:94`
- `AdjustedQuartetAudit.ClosureInputs.residual_eq_zero`
  em `LeanC2/AuditAdjustedQuartetRoute.lean:114`
- `AdjustedQuartetAudit.ClosureInputs.offCriticalNonvanishing`
  em `LeanC2/AuditAdjustedQuartetRoute.lean:135`

Leitura: se `ClosureInputs` for habitado, a rota fecha.  O campo ainda externo
e principalmente:

```lean
PointwiseBounds.dominance
```

## Barreiras e Alvos Aposentados

### Canonical closed scaled local data

Retired para esta rota.

Nomes:

- `not_c2CanonicalClosedScaledResidualUpper_lt_residualMargin_of_offCriticalStrip`
  em `LeanC2/Analytic/GenuineBulkConcrete.lean:9715`
- `not_c2CanonicalClosedScaledLocalData_of_offCriticalStrip`
  em `LeanC2/Analytic/GenuineBulkConcrete.lean:14976`
- `AuditMiddleBarrier.audit_CanonicalMiddleObligation_forces_middle_empty`

Leitura: `C2CanonicalClosedScaledLocalData` nao e um alvo valido para fechar o
middle genuine; Lean prova que essa formulacao e impossivel em pontos
off-critical.

### Odd-anchor norm-only

Retired.

Nomes:

- `not_C2GenuineOddAnchorFinalBudget_of_nonneg_uppers`
- `not_C2GenuineOddAnchorInheritedBudget_of_nonneg_uppers`
- `not_C2GenuineOddAnchorLocalData`

Leitura: precisa usar gap-aware ou outro budget com saving de fase; o bound
`1 + 2 * oddUpper` e grosseiro demais.

## Status Resumido

| Item | Status | Proximo uso |
| --- | --- | --- |
| Quarteto nao zera no middle | Closed | Credito base |
| Livro-caixa quatro debitos | Closed | Prova local de bulk nonzero |
| Concrete region -> central neq zero | Closed | Endpoint local |
| Local data + raw seed/cutoff -> central neq zero | Closed | Melhor wrapper para usar agora |
| Middle + raw triangle dominance -> central neq zero | Closed | Wrapper global condicional |
| Middle + scalar raw budget -> central neq zero | Closed | Boleto expandido |
| Middle + external upper budgets -> central neq zero | Closed | Alvo modular para estimativas |
| Raw triangle residual dominance | Reduced | Provar desigualdade real ponto a ponto |
| Refined/exact vertical residual | Reduced | Usar se raw triangle for grosseiro |
| Middle + exact vertical upper budgets -> central neq zero | Closed | Pivot recomendado se raw triangle falhar |
| Odd-anchor norm-only | Retired | Nao perseguir |
| Gap-aware anchor | Reduced | Rota ativa comprimida para o gap exato |
| `C2ExactGapAnchorPhaseSavingOnMiddle` | Reduced | Alvo normalizado |
| `C2ExactGapAnchorPhaseDiskOnMiddle` | Reduced | Proximo alvo geometrico |
| Half-disk upper + budget | Reduced | Superficie modular recomendada |
| Anchor residual upper + budget | Reduced | Superficie operator-side recomendada |
| Exact anchor residual norm budget | Reduced | Alvo compacto com lower-envelope |
| Tail-norm anchor residual budget | Reduced | Proximo alvo sem perda recomendado |
| Tail-norm anchor residual upper budget | Reduced | Superficie lossless com majorante externo |
| Tail-norm anchor residual factor budget | Reduced | Superficie normalizada sem dimensao |
| Factor upper + allowance lower budget | Reduced | Decomposicao escalar final recomendada |
| Positivity da exact gap allowance | Reduced | Provar scalar budget explicito |
| Positive allowance upper budgets | Reduced | Superficie modular para majorantes |
| Cleared odd-metric slack allowance | Retired | Overbudget sob uppers nao negativos |
| Canonical closed scaled local data | Retired | Nao perseguir |

## Wrapper Global Condicional

Estes wrappers ja foram adicionados para impedir regressao conceitual.

### Residual dominance

```lean
theorem genuineCentral_ne_zero_on_middle_of_rawTriangleResidualDominance
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M}
    {edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M}
    (hhorizontalScale_pos : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 < horizontalScale s)
    (hhorizontalConstant_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalConstant s)
    (hhorizontalRatio_nonneg : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 ≤ horizontalRatio s)
    (hhorizontalRatio_lt_one : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → horizontalRatio s < 1)
    (hhorizontal : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExpandedHorizontalLayerBudget
        coreCutoff horizontalConstant horizontalScale horizontalRatio s)
    (hdominance : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2RawTriangleResidualDominance
        K M horizontalConstant horizontalScale horizontalRatio s) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0
```

### Scalar budget expandido

```lean
theorem genuineCentral_ne_zero_on_middle_of_rawTriangleScalarBudget
    ...
    (hbudget : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      ((c2RawTriangleVerticalRectangularUpper K M s +
          c2HorizontalRegularizedUpper
            horizontalConstant horizontalScale horizontalRatio s) *
        (1 + ‖q s‖)) *
          (1 - ‖q s‖)⁻¹ +
        c2HorizontalRegularizedUpper
          horizontalConstant horizontalScale horizontalRatio s +
        c2RawCentralCutoffNormConstant K M s <
          c2ExpandedQuartetResidualMargin s) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0
```

### Upper budgets modulares

```lean
theorem genuineCentral_ne_zero_on_middle_of_rawTriangleUpperBudgets
    ...
    {verticalBudget horizontalBudget cutoffBudget : ℂ → ℝ}
    (hvertical : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      c2RawTriangleVerticalRectangularUpper K M s ≤ verticalBudget s)
    (hhorizontalBudget : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio s ≤ horizontalBudget s)
    (hcutoff : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      c2RawCentralCutoffNormConstant K M s ≤ cutoffBudget s)
    (hbudget : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      ((verticalBudget s + horizontalBudget s) * (1 + ‖q s‖)) *
          (1 - ‖q s‖)⁻¹ +
        horizontalBudget s + cutoffBudget s <
          c2ExpandedQuartetResidualMargin s) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0
```

O trabalho matematico agora fica concentrado em construir `hdominance`
globalmente no middle.  A forma mais modular para isso e fornecer budgets
externos para vertical, horizontal e cutoff e fechar o `hbudget` final.  Se a
triangle bound for insuficiente, trocar para a rota refined/exact vertical.

## Pivot Exact Vertical

Tambem ha wrappers globais para a rota exact vertical:

```lean
theorem genuineCentral_ne_zero_on_middle_of_exactVerticalResidualDominance
    ...
    (hdominance : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ExactVerticalResidualDominance
        K M horizontalConstant horizontalScale horizontalRatio s) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0
```

```lean
theorem genuineCentral_ne_zero_on_middle_of_exactVerticalScalarBudget
    ...
    (hbudget : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      ((‖c2ScaledSeededExplicitOddTailVerticalRectangularResidual K M s‖ +
          c2HorizontalRegularizedUpper
            horizontalConstant horizontalScale horizontalRatio s) *
        (1 + ‖q s‖)) *
          (1 - ‖q s‖)⁻¹ +
        c2HorizontalRegularizedUpper
          horizontalConstant horizontalScale horizontalRatio s +
        c2RawCentralCutoffNormConstant K M s <
          c2ExpandedQuartetResidualMargin s) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0
```

```lean
theorem genuineCentral_ne_zero_on_middle_of_exactVerticalUpperBudgets
    ...
    {verticalBudget horizontalBudget cutoffBudget : ℂ → ℝ}
    (hvertical : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      ‖c2ScaledSeededExplicitOddTailVerticalRectangularResidual K M s‖ ≤
        verticalBudget s)
    ...
```

Leitura: esta e a versao no-slack da rota.  Em vez de pagar a vertical pelo
triangle upper cru, mede-se o residual vertical/retangular por sua norma ou por
um upper externo mais fino.

## Pivot Gap-Aware Anchor

Tambem existe uma ponte global para a rota gap-aware, que e o melhor alvo se a
norma do canal odd continuado for grosseira demais:

```lean
theorem genuineCentral_ne_zero_on_middle_of_gapAnchorFinalBudget
    ...
    (hgap : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ContinuedOddGapBound gapUpper s)
    (hgenuine : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2GenuineCentralBound genuineCentralUpper s)
    (hcontinued : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2ContinuedCentralBound continuedCentralUpper s)
    (hbudget : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2GenuineGapAnchorFinalBudget
        K M horizontalConstant horizontalScale horizontalRatio
        gapUpper genuineCentralUpper continuedCentralUpper s) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0
```

Obrigacoes matematicas restantes nessa rota:

- provar `C2ContinuedOddGapBound gapUpper s` no middle;
- escolher/provar `C2GenuineCentralBound` e `C2ContinuedCentralBound`;
- fechar `C2GenuineGapAnchorFinalBudget`, isto e, a desigualdade final contra
  `c2ExactVerticalAnchorResidualNormAllowance`.

Na forma mais enxuta, os tres primeiros itens ja sao instanciados pelos uppers
exatos:

```lean
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorFinalBudget
    ...
    (hbudget : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      C2GenuineExactGapAnchorFinalBudget
        K M horizontalConstant horizontalScale horizontalRatio s) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0
```

Esse e o budget final mais comprimido antes da normalizacao.  Depois da
geometria horizontal do middle, ele reduz o `neq zero` genuine a uma unica
desigualdade escalar.

Normalizando pelo tail vertical positivo, o mesmo budget e equivalente ao alvo
de fase:

```lean
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorFactorAllowance
    ...
    (hgap : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖ <
        c2ExactGapAnchorFactorAllowance
          K M horizontalConstant horizontalScale horizontalRatio s) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0
```

`c2ExactGapAnchorFactorAllowance` ja desconta os debitos centrais e divide por
`verticalDepthTailUpper s`.  Alem disso,
`c2ExactGapAnchorFactorAllowance_lt_one_of_offCritical` prova formalmente que
esse limite fica abaixo de `1`, entao o alvo exige saving de fase real.

A forma normalizada que devemos atacar e:

```lean
def C2ExactGapAnchorPhaseSavingOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorPhaseSaving
      K M horizontalConstant horizontalScale horizontalRatio s
```

e ela ja tem ponte global ate o alvo:

```lean
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorPhaseSaving
    ...
    (hphase :
      C2ExactGapAnchorPhaseSavingOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0
```

A forma geometrica suficiente, mais concreta para a proxima tentativa, e:

```lean
def C2ExactGapAnchorPhaseDiskOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
    C2ExactGapAnchorPhaseDisk
      K M horizontalConstant horizontalScale horizontalRatio s
```

Ela usa somente a identidade algebraica
`1 - 2 * odd = 2 * (1/2 - odd)`, formalizada em:

```lean
theorem C2ExactGapAnchorPhaseSavingOnMiddle_of_phaseDiskOnMiddle
```

Wrapper local novo, sem criar endpoint global:

```lean
theorem C2ExactGapAnchorPhaseSavingOnMiddle_of_halfDiskBoundOnMiddle
    ...
    (hbound :
      C2ContinuedOddHalfDiskBoundOnMiddle halfDiskUpper near edge)
    (hbudget :
      C2ExactGapAnchorPhaseDiskBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio halfDiskUpper near edge) :
    C2ExactGapAnchorPhaseSavingOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge
```

Superficie exata nova, sem upper norm-only externo:

```lean
def C2ExactGapAnchorExactHalfDiskBudgetOnMiddle
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (near : C2OddTailContinuedBalancingSeedBulkModelNearAxisData coreCutoff K M)
    (edge : C2OddTailContinuedBalancingSeedBulkModelEdgeData coreCutoff K M) :
    Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion near edge →
      2 * ‖(1 / 2 : ℂ) - continuedOddDirichletChannel s‖ <
        c2ExactGapAnchorFactorAllowance
          K M horizontalConstant horizontalScale horizontalRatio s
```

Ela alimenta diretamente os alvos de fase, sem passar por `oddUpper`:

```lean
lemma norm_one_sub_two_mul_eq_two_norm_half_sub
theorem C2ExactGapAnchorPhaseDiskOnMiddle_of_exactHalfDiskBudgetOnMiddle
theorem C2ExactGapAnchorPhaseSavingOnMiddle_of_exactHalfDiskBudgetOnMiddle
theorem C2ExactGapAnchorExactHalfDiskBudgetOnMiddle_of_phaseSavingOnMiddle
theorem C2ExactGapAnchorExactHalfDiskBudgetOnMiddle_iff_phaseSavingOnMiddle
```

Portanto `ExactHalfDiskBudgetOnMiddle` nao e uma rota nova: e exatamente a
obrigacao `C2ExactGapAnchorPhaseSavingOnMiddle` escrita na coordenada do disco
centrado em `1 / 2`, usando `‖1 - 2z‖ = 2 * ‖1 / 2 - z‖`.

e ja tem ponte direta ate o `neq zero`:

```lean
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorPhaseDisk
    ...
    (hdisk :
      C2ExactGapAnchorPhaseDiskOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0
```

Forma modular recomendada para tentar provar o disco:

```lean
def C2ContinuedOddHalfDiskBound (halfDiskUpper : ℂ → ℝ) (s : ℂ) : Prop :=
  ‖(1 / 2 : ℂ) - continuedOddDirichletChannel s‖ ≤ halfDiskUpper s

def C2ExactGapAnchorPhaseDiskBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio
      halfDiskUpper : ℂ → ℝ)
    (s : ℂ) : Prop :=
  2 * halfDiskUpper s <
    c2ExactGapAnchorFactorAllowance
      K M horizontalConstant horizontalScale horizontalRatio s
```

Com isso, o wrapper mais flexivel e:

```lean
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorHalfDiskBound
    ...
    (hbound :
      C2ContinuedOddHalfDiskBoundOnMiddle halfDiskUpper near edge)
    (hbudget :
      C2ExactGapAnchorPhaseDiskBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio halfDiskUpper near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0
```

Assim a proxima prova pode escolher um `halfDiskUpper` conveniente, provar o
bound do canal contra ele, e depois fechar so o budget escalar
`2 * halfDiskUpper s < c2ExactGapAnchorFactorAllowance ... s`.

Pelo lado concreto distorted, a distorcao vertical explicita foi normalizada:

```lean
theorem one_le_c2VerticalTailLowerDistortionExplicitUpper_of_offCriticalStrip
```

Com isso, o disk distorted implica o disk real:

```lean
theorem C2ExactGapAnchorPhaseDisk_of_tailLowerDistortedPhaseDisk
theorem C2ExactGapAnchorPhaseDiskOnMiddle_of_tailLowerDistortedPhaseDiskOnMiddle
theorem C2ExactGapAnchorPhaseSavingOnMiddle_of_tailLowerDistortedPhaseDiskOnMiddle
```

E a rota concreta por slack allowance agora alimenta diretamente o alvo real,
desde que o half-disk bound ja esteja fornecido como boleto proprio:

```lean
theorem C2ExactGapAnchorPhaseDiskOnMiddle_of_tailLowerDistortedOddMetricSlackAllowanceBudgetOnMiddle
    ...
    (hhalf :
      C2ContinuedOddHalfDiskBoundOnMiddle
        (c2HalfDiskUpperFromOddUpper oddUpper) near edge)
    (hslack_pos : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 < paymentSlack s)
    (hallow :
      C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        oddUpper paymentSlack near edge) :
    C2ExactGapAnchorPhaseDiskOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge
```

A superficie operacional mais usavel troca esse `hhalf` cru por um bound do
canal odd e usa a ponte ja existente para `c2HalfDiskUpperFromOddUpper`:

```lean
theorem C2ExactGapAnchorPhaseDiskOnMiddle_of_oddMetricSlackAllowanceBudgetOnMiddle
    ...
    (hodd :
      C2ContinuedOddChannelBoundOnMiddle oddUpper near edge)
    (hslack_pos : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge → 0 < paymentSlack s)
    (hbudget :
      C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        oddUpper paymentSlack near edge) :
    C2ExactGapAnchorPhaseDiskOnMiddle
      horizontalConstant horizontalScale horizontalRatio near edge
```

Esse e o alvo operacional atual: fechar `C2ExactGapAnchorPhaseDiskOnMiddle`.
Nao substituir por bound triangular colapsado do gap; o half-disk precisa ser
estimativa direta em torno de `1 / 2`.

A forma ainda mais alinhada ao operador usa o residual anchor:

```lean
def C2ContinuedVerticalAnchorResidualBound
    (anchorUpper : ℂ → ℝ) (s : ℂ) : Prop :=
  ‖c2ContinuedVerticalAnchorResidual s‖ ≤ anchorUpper s

noncomputable def c2HalfDiskUpperFromAnchor
    (anchorUpper : ℂ → ℝ) : ℂ → ℝ :=
  fun s => anchorUpper s / (2 * c2VerticalDepthTailLower s)
```

O lower bound formalizado e:

```lean
theorem c2VerticalDepthTailLower_le_norm_verticalDepthTailFromTwo_of_offCriticalStrip
```

e a conversao operator-side e:

```lean
theorem C2ContinuedOddHalfDiskBoundOnMiddle_of_anchorResidualBoundOnMiddle
```

Portanto o wrapper modular operator-side e:

```lean
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorAnchorResidualBound
    ...
    (hanchor :
      C2ContinuedVerticalAnchorResidualBoundOnMiddle anchorUpper near edge)
    (hbudget :
      C2ExactGapAnchorPhaseDiskBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio
        (c2HalfDiskUpperFromAnchor anchorUpper) near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0
```

Nessa superficie, o boleto pode ser formulado sem falar diretamente do canal
odd: provar um upper para `c2ContinuedVerticalAnchorResidual` no middle e
fechar o budget escalar correspondente.

Na forma exata, o `anchorUpper` ja foi instanciado pela propria norma do
residual.  O budget nomeado e:

```lean
noncomputable def C2ExactGapAnchorExactAnchorResidualBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : Prop :=
  C2ExactGapAnchorPhaseDiskBudget
    K M horizontalConstant horizontalScale horizontalRatio
    (c2HalfDiskUpperFromAnchor
      c2ContinuedVerticalAnchorResidualExactUpper) s
```

e ele e equivalente ao alvo operator-side compacto:

```lean
theorem C2ExactGapAnchorExactAnchorResidualBudget_iff_norm_lt_lower_mul_allowance
```

isto e, ponto a ponto:

```lean
‖c2ContinuedVerticalAnchorResidual s‖ <
  c2VerticalDepthTailLower s *
    c2ExactGapAnchorFactorAllowance
      K M horizontalConstant horizontalScale horizontalRatio s
```

Wrapper global compacto com lower-envelope:

```lean
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorExactAnchorResidualNorm
    ...
    (hbudget : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      ‖c2ContinuedVerticalAnchorResidual s‖ <
        c2VerticalDepthTailLower s *
          c2ExactGapAnchorFactorAllowance
            K M horizontalConstant horizontalScale horizontalRatio s) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0
```

Essa versao e suficiente, mas ainda paga a folga
`c2VerticalDepthTailLower s ≤ ‖verticalDepthTailFromTwo s‖`.  A versao nova
sem essa perda troca o lower-envelope pela norma exata da tail vertical:

```lean
def C2ExactGapAnchorTailNormAnchorResidualBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : Prop :=
  ‖c2ContinuedVerticalAnchorResidual s‖ <
    ‖verticalDepthTailFromTwo s‖ *
      c2ExactGapAnchorFactorAllowance
        K M horizontalConstant horizontalScale horizontalRatio s
```

Tambem existe a superficie lossless com majorante externo do residual do
anchor.  Ela separa o bound operator-side da desigualdade estrita final sem
trocar a tail exata pelo lower-envelope:

```lean
def C2ExactGapAnchorTailNormAnchorResidualUpperBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio
      anchorUpper : ℂ → ℝ)
    (s : ℂ) : Prop :=
  anchorUpper s <
    ‖verticalDepthTailFromTwo s‖ *
      c2ExactGapAnchorFactorAllowance
        K M horizontalConstant horizontalScale horizontalRatio s
```

Conversoes fechadas:

```lean
theorem C2ExactGapAnchorTailNormAnchorResidualBudget_of_anchorResidualBound
theorem C2ExactGapAnchorTailNormAnchorResidualBudgetOnMiddle_of_anchorResidualBoundOnMiddle
theorem C2ExactGapAnchorTailNormAnchorResidualUpperBudget_exact_iff_tailNormAnchorResidualBudget
theorem C2ExactGapAnchorTailNormAnchorResidualUpperBudgetOnMiddle_exact_iff_tailNormAnchorResidualBudgetOnMiddle
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorTailNormAnchorResidualUpperBound
```

Uma forma ainda mais normalizada separa a estimativa operator-side por um fator
sem dimensao:

```lean
def C2ContinuedVerticalAnchorResidualFactorBound
    (anchorFactorUpper : ℂ → ℝ) (s : ℂ) : Prop :=
  ‖c2ContinuedVerticalAnchorResidual s‖ ≤
    ‖verticalDepthTailFromTwo s‖ * anchorFactorUpper s

def C2ExactGapAnchorTailNormAnchorResidualFactorBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio
      anchorFactorUpper : ℂ → ℝ)
    (s : ℂ) : Prop :=
  anchorFactorUpper s <
    c2ExactGapAnchorFactorAllowance
      K M horizontalConstant horizontalScale horizontalRatio s
```

Conversoes fechadas:

```lean
theorem C2ExactGapAnchorTailNormAnchorResidualBudget_of_factorBound
theorem C2ExactGapAnchorTailNormAnchorResidualBudgetOnMiddle_of_factorBoundOnMiddle
theorem c2ContinuedVerticalAnchorResidualExactFactorUpper_eq_exactOddGap
theorem c2ContinuedVerticalAnchorResidualExactFactorUpper_eq_two_norm_half_sub
theorem C2ExactGapAnchorTailNormAnchorResidualFactorBudget_exact_iff_pointwise
theorem C2ExactGapAnchorTailNormAnchorResidualFactorBudgetOnMiddle_exact_iff_pointwise
theorem C2ExactGapAnchorTailNormAnchorResidualFactorBudget_exact_iff_tailNormAnchorResidualBudget
theorem C2ExactGapAnchorTailNormAnchorResidualFactorBudgetOnMiddle_exact_iff_tailNormAnchorResidualBudgetOnMiddle
theorem C2ExactGapAnchorTailNormAnchorResidualFactorBudget_exact_iff_phaseSaving
theorem C2ExactGapAnchorTailNormAnchorResidualFactorBudgetOnMiddle_exact_iff_phaseSavingOnMiddle
theorem C2GenuineExactGapAnchorFinalBudget_iff_tailNormAnchorResidualFactorBudget_exact
theorem C2GenuineExactGapAnchorFinalBudgetOnMiddle_iff_tailNormAnchorResidualFactorBudgetOnMiddle_exact
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorTailNormAnchorResidualFactorBound
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorTailNormAnchorResidualExactFactorBudget
```

Essa obrigacao agora tem uma forma direta com uma unica desigualdade escalar:

```lean
theorem C2ExactGapAnchorTailNormAnchorResidualFactorBudgetOnMiddle_exact_iff_pointwise
```

isto e, no middle:

```lean
c2ContinuedVerticalAnchorResidualExactFactorUpper s <
  c2ExactGapAnchorFactorAllowance
    K M horizontalConstant horizontalScale horizontalRatio s
```

e o lado esquerdo foi normalizado de duas formas equivalentes:

```lean
c2ContinuedVerticalAnchorResidualExactFactorUpper s =
  ‖c2ContinuedVerticalAnchorResidual s‖ /
    ‖verticalDepthTailFromTwo s‖

c2ContinuedVerticalAnchorResidualExactFactorUpper s =
  2 * ‖(1 / 2 : ℂ) - continuedOddDirichletChannel s‖
```

formalmente:

```lean
theorem c2ContinuedVerticalAnchorResidualExactFactorUpper_eq_two_norm_half_sub
```

```lean
def C2ExactGapAnchorGapUpperScalarBudget
def C2ExactGapAnchorGapUpperScalarBudgetOnMiddle
```

Ela tambem tem uma forma expandida que abre a allowance em margem do quarteto,
horizontal, cutoff e fator off-critical:

```lean
def C2ExactGapAnchorGapUpperExpandedScalarBudget
def C2ExactGapAnchorGapUpperExpandedScalarBudgetOnMiddle
```

A forma mais alimentavel por estimativas separadas usa uppers externos:

```lean
def C2ExactGapAnchorGapUpperExpandedUpperBudget
def C2ExactGapAnchorGapUpperExpandedUpperBudgetOnMiddle
```

A forma canonica exact-gap remove o parametro `gapUpper` e ja fixa o gap
exato:

```lean
def C2ExactGapAnchorExactGapExpandedScalarBudget
def C2ExactGapAnchorExactGapExpandedScalarBudgetOnMiddle
def C2ExactGapAnchorExactGapExpandedUpperBudget
def C2ExactGapAnchorExactGapExpandedUpperBudgetOnMiddle
```

Commit de plumbing atual: essa forma expanded/upper agora alimenta diretamente
o boleto operator-side recomendado:

```lean
theorem C2ExactGapAnchorTailNormAnchorResidualFactorBudgetOnMiddle_exact_of_exactGapExpandedScalarBudgetOnMiddle
theorem C2ExactGapAnchorTailNormAnchorResidualFactorBudgetOnMiddle_exact_of_exactGapExpandedUpperBudgetOnMiddle
```

Assim, o alvo pointwise

```lean
c2ContinuedVerticalAnchorResidualExactFactorUpper s <
  c2ExactGapAnchorFactorAllowance
    K M horizontalConstant horizontalScale horizontalRatio s
```

pode ser atacado pela desigualdade expanded contra a margem do quarteto.  Na
versao upper, a forma operacional existente e:

```lean
((c2ExactGapAnchorExactTailGapBudget s +
      genuineCentralUpper s +
      continuedCentralUpper s +
      cutoffBudget s +
      horizontalBudget s) *
    (1 + ‖q s‖)) *
  (1 - ‖q s‖)⁻¹ +
horizontalBudget s + cutoffBudget s <
  c2ExpandedQuartetResidualMargin s
```

Forma cleared equivalente no middle, com denominador comum apenas
`1 - ‖q s‖`:

```lean
def C2ExactGapAnchorExactGapExpandedUpperClearedBudget
def C2ExactGapAnchorExactGapExpandedUpperClearedBudgetOnMiddle

theorem C2ExactGapAnchorExactGapExpandedUpperBudget_iff_upperClearedBudget
theorem C2ExactGapAnchorExactGapExpandedUpperBudgetOnMiddle_iff_upperClearedBudgetOnMiddle
```

Pointwise, a desigualdade fica:

```lean
(1 + ‖q s‖) *
    (c2ExactGapAnchorExactTailGapBudget s +
      genuineCentralUpper s +
      continuedCentralUpper s +
      cutoffBudget s +
      horizontalBudget s) +
  (horizontalBudget s + cutoffBudget s) * (1 - ‖q s‖) <
    c2ExpandedQuartetResidualMargin s * (1 - ‖q s‖)
```

Coleta algebraica equivalente:

```lean
def C2ExactGapAnchorExactGapExpandedUpperCollectedBudget
def C2ExactGapAnchorExactGapExpandedUpperCollectedBudgetOnMiddle

theorem C2ExactGapAnchorExactGapExpandedUpperClearedBudget_iff_collectedBudget
theorem C2ExactGapAnchorExactGapExpandedUpperClearedBudgetOnMiddle_iff_collectedBudgetOnMiddle
```

Pointwise:

```lean
(1 + ‖q s‖) * c2ExactGapAnchorExactTailGapBudget s +
    (1 + ‖q s‖) *
      (genuineCentralUpper s + continuedCentralUpper s) +
    2 * (horizontalBudget s + cutoffBudget s) <
  c2ExpandedQuartetResidualMargin s * (1 - ‖q s‖)
```

O debito externo foi isolado como:

```lean
def c2ExactGapAnchorExactGapExpandedUpperExternalDebit
```

com valor

```lean
(1 + ‖q s‖) *
    (genuineCentralUpper s + continuedCentralUpper s) +
  2 * (horizontalBudget s + cutoffBudget s)
```

e a reserva tail/phase restante como:

```lean
def c2ExactGapAnchorExactGapExpandedUpperTailGapReserve
```

isto e,

```lean
c2ExpandedQuartetResidualMargin s * (1 - ‖q s‖) -
  c2ExactGapAnchorExactGapExpandedUpperExternalDebit
    genuineCentralUpper continuedCentralUpper
    horizontalBudget cutoffBudget s
```

O budget operacional da reserva agora e:

```lean
def C2ExactGapAnchorExactGapExpandedUpperTailGapReserveBudget
def C2ExactGapAnchorExactGapExpandedUpperTailGapReserveBudgetOnMiddle

theorem C2ExactGapAnchorExactGapExpandedUpperCollectedBudget_iff_tailGapReserveBudget
theorem C2ExactGapAnchorExactGapExpandedUpperCollectedBudgetOnMiddle_iff_tailGapReserveBudgetOnMiddle
```

Pointwise:

```lean
(1 + ‖q s‖) * c2ExactGapAnchorExactTailGapBudget s <
  c2ExactGapAnchorExactGapExpandedUpperTailGapReserve
    genuineCentralUpper continuedCentralUpper
    horizontalBudget cutoffBudget s
```

A normalizacao por fator divide essa reserva pelo coeficiente positivo
`(1 + ‖q s‖) * verticalDepthTailUpper s`:

```lean
def c2ExactGapAnchorExactGapExpandedUpperFactorReserve
def C2ExactGapAnchorExactGapExpandedUpperFactorReserveBudget
def C2ExactGapAnchorExactGapExpandedUpperFactorReserveBudgetOnMiddle
```

isto e,

```lean
c2ExactGapAnchorExactGapExpandedUpperFactorReserve
    genuineCentralUpper continuedCentralUpper
    horizontalBudget cutoffBudget s =
  c2ExactGapAnchorExactGapExpandedUpperTailGapReserve
      genuineCentralUpper continuedCentralUpper
      horizontalBudget cutoffBudget s /
    ((1 + ‖q s‖) * verticalDepthTailUpper s)
```

O budget fatorado fica:

```lean
c2ContinuedVerticalAnchorResidualExactFactorUpper s <
  c2ExactGapAnchorExactGapExpandedUpperFactorReserve
    genuineCentralUpper continuedCentralUpper
    horizontalBudget cutoffBudget s
```

e alimenta a reserva tail-gap por:

```lean
theorem C2ExactGapAnchorExactGapExpandedUpperTailGapReserveBudget_of_factorReserveBudget
theorem C2ExactGapAnchorExactGapExpandedUpperTailGapReserveBudgetOnMiddle_of_factorReserveBudgetOnMiddle
```

Lower concreta via majorante do debito externo:

```lean
def C2ExactGapAnchorExactGapExpandedUpperExternalDebitUpperBound
def C2ExactGapAnchorExactGapExpandedUpperExternalDebitUpperBoundOnMiddle
def c2ExactGapAnchorExactGapExpandedUpperExternalDebitComponentUpper
def C2ExactGapAnchorExactGapExpandedUpperExternalDebitComponentBounds
def C2ExactGapAnchorExactGapExpandedUpperExternalDebitComponentBoundsOnMiddle
def c2ExactGapAnchorExactGapExpandedUpperTailGapReserveLower
def c2ExactGapAnchorExactGapExpandedUpperFactorReserveLower
```

A instanciacao canonica por componentes e:

```lean
c2ExactGapAnchorExactGapExpandedUpperExternalDebitComponentUpper
    genuineBudget continuedBudget
    horizontalBudgetUpper cutoffBudgetUpper s =
  (1 + ‖q s‖) * (genuineBudget s + continuedBudget s) +
    2 * (horizontalBudgetUpper s + cutoffBudgetUpper s)
```

Os quatro bounds

```lean
genuineCentralUpper s ≤ genuineBudget s
continuedCentralUpper s ≤ continuedBudget s
horizontalBudget s ≤ horizontalBudgetUpper s
cutoffBudget s ≤ cutoffBudgetUpper s
```

alimentam o majorante externo por:

```lean
theorem C2ExactGapAnchorExactGapExpandedUpperExternalDebitUpperBound_of_componentBounds
theorem C2ExactGapAnchorExactGapExpandedUpperExternalDebitUpperBoundOnMiddle_of_componentBoundsOnMiddle
```

A forma escalar e:

```lean
c2ExactGapAnchorExactGapExpandedUpperTailGapReserveLower externalDebitUpper s =
  c2ExpandedQuartetResidualMargin s * (1 - ‖q s‖) -
    externalDebitUpper s

c2ExactGapAnchorExactGapExpandedUpperFactorReserveLower externalDebitUpper s =
  c2ExactGapAnchorExactGapExpandedUpperTailGapReserveLower
      externalDebitUpper s /
    ((1 + ‖q s‖) * verticalDepthTailUpper s)
```

Se o debito real esta abaixo de `externalDebitUpper`, a lower concreta fica
abaixo do `factorReserve` real:

```lean
theorem C2ExactGapAnchorExactGapExpandedUpperFactorReserveLowerBound_of_externalDebitUpperBound
theorem C2ExactGapAnchorExactGapExpandedUpperFactorReserveLowerBoundOnMiddle_of_externalDebitUpperBoundOnMiddle
```

Assim, o alvo final permanece separado como:

```lean
c2ContinuedVerticalAnchorResidualExactFactorUpper s <
  c2ExactGapAnchorExactGapExpandedUpperFactorReserveLower
    externalDebitUpper s
```

Essa desigualdade de fase contra a lower concreta ainda nao foi provada.

A mesma obrigacao agora esta exposta sem divisao, usando diretamente o majorante
do debito externo:

```lean
def C2ExactGapAnchorExactGapExpandedUpperExternalFactorBudget
def C2ExactGapAnchorExactGapExpandedUpperExternalFactorBudgetOnMiddle
```

Pointwise:

```lean
((1 + ‖q s‖) * verticalDepthTailUpper s) *
    c2ContinuedVerticalAnchorResidualExactFactorUpper s +
  externalDebitUpper s <
    c2ExpandedQuartetResidualMargin s * (1 - ‖q s‖)
```

Essa forma alimenta a lower concreta e, junto do upper externo para o debito,
recompoe o collected budget:

```lean
theorem C2ExactGapAnchorExactGapExpandedUpperFactorReserveLowerGapBudget_of_externalFactorBudget
theorem C2ExactGapAnchorExactGapExpandedUpperFactorReserveLowerGapBudgetOnMiddle_of_externalFactorBudgetOnMiddle
theorem C2ExactGapAnchorExactGapExpandedUpperCollectedBudgetOnMiddle_of_externalDebitUpperBoundOnMiddle_of_externalFactorBudgetOnMiddle
```

Split final por `gapUpper` ponderado:

```lean
def c2ExactGapAnchorExactGapExpandedUpperWeightedPhaseDebit
def C2ExactGapAnchorExactGapExpandedUpperWeightedPhaseExternalBudget
def C2ExactGapAnchorExactGapExpandedUpperWeightedPhaseExternalBudgetOnMiddle
```

Pointwise:

```lean
c2ExactGapAnchorExactGapExpandedUpperWeightedPhaseDebit gapUpper s =
  ((1 + ‖q s‖) * verticalDepthTailUpper s) * gapUpper s

c2ExactGapAnchorExactGapExpandedUpperWeightedPhaseDebit gapUpper s +
  externalDebitUpper s <
    c2ExpandedQuartetResidualMargin s * (1 - ‖q s‖)
```

Com

```lean
C2ExactGapAnchorExactFactorUpperBound gapUpper s
```

isto e,

```lean
c2ContinuedVerticalAnchorResidualExactFactorUpper s ≤ gapUpper s
```

o budget ponderado implica a forma sem divisao:

```lean
theorem C2ExactGapAnchorExactGapExpandedUpperExternalFactorBudget_of_exactFactorUpperBound_of_weightedPhaseExternalBudget
theorem C2ExactGapAnchorExactGapExpandedUpperExternalFactorBudgetOnMiddle_of_exactFactorUpperBoundOnMiddle_of_weightedPhaseExternalBudgetOnMiddle
```

e junto com `externalDebitUpperBound` recompoe diretamente o collected budget:

```lean
theorem C2ExactGapAnchorExactGapExpandedUpperCollectedBudgetOnMiddle_of_externalDebitUpperBoundOnMiddle_of_exactFactorUpperBoundOnMiddle_of_weightedPhaseExternalBudgetOnMiddle
```

Superficie final por componentes:

```lean
def C2ExactGapAnchorExactGapExpandedUpperComponentWeightedPhaseExternalBudget
def C2ExactGapAnchorExactGapExpandedUpperComponentWeightedPhaseExternalBudgetOnMiddle
```

Pointwise:

```lean
((1 + ‖q s‖) * verticalDepthTailUpper s) * gapUpper s
  + (1 + ‖q s‖) * (genuineBudget s + continuedBudget s)
  + 2 * (horizontalBudgetUpper s + cutoffBudgetUpper s)
<
  c2ExpandedQuartetResidualMargin s * (1 - ‖q s‖)
```

Essa superficie e apenas a versao inline do `WeightedPhaseExternalBudget` com
`externalDebitUpper` instanciado por componentes:

```lean
theorem C2ExactGapAnchorExactGapExpandedUpperWeightedPhaseExternalBudget_of_componentWeightedPhaseExternalBudget
theorem C2ExactGapAnchorExactGapExpandedUpperWeightedPhaseExternalBudgetOnMiddle_of_componentWeightedPhaseExternalBudgetOnMiddle
```

Logo a cadeia operacional final para o collected budget fica:

```lean
componentBoundsOnMiddle
  + exactFactorUpperBoundOnMiddle gapUpper
  + componentWeightedPhaseExternalBudgetOnMiddle
  ⇒ C2ExactGapAnchorExactGapExpandedUpperCollectedBudgetOnMiddle
```

formalizada por:

```lean
theorem C2ExactGapAnchorExactGapExpandedUpperCollectedBudgetOnMiddle_of_componentBoundsOnMiddle_of_exactFactorUpperBoundOnMiddle_of_componentWeightedPhaseExternalBudgetOnMiddle
```

Normalizacao `r`-cleared da superficie por componentes:

```lean
def C2ExactGapAnchorExactGapExpandedUpperComponentWeightedPhaseExternalClearedBudget
def C2ExactGapAnchorExactGapExpandedUpperComponentWeightedPhaseExternalClearedBudgetOnMiddle
```

com `r := ‖q s‖`:

```lean
(1 + r) * r ^ 2 * gapUpper s
  + c2ExactGapAnchorExactGapExpandedUpperExternalDebitComponentUpper
      genuineBudget continuedBudget
      horizontalBudgetUpper cutoffBudgetUpper s * (1 - r)
<
  c2ExpandedQuartetResidualMargin s * (1 - r) ^ 2
```

Como `verticalDepthTailUpper s = r ^ 2 / (1 - r)` no off-critical e
`0 < 1 - r`, essa forma implica a superficie component-weighted atual:

```lean
theorem C2ExactGapAnchorExactGapExpandedUpperComponentWeightedPhaseExternalBudget_of_clearedBudget
theorem C2ExactGapAnchorExactGapExpandedUpperComponentWeightedPhaseExternalBudgetOnMiddle_of_clearedBudgetOnMiddle
```

Smoke-test final da cadeia component-cleared ate o collected budget:

```lean
componentBoundsOnMiddle
  + exactFactorUpperBoundOnMiddle gapUpper
  + componentWeightedPhaseExternalClearedBudgetOnMiddle
  ⇒ C2ExactGapAnchorExactGapExpandedUpperCollectedBudgetOnMiddle
```

formalizado por:

```lean
theorem C2ExactGapAnchorExactGapExpandedUpperCollectedBudgetOnMiddle_of_componentBoundsOnMiddle_of_exactFactorUpperBoundOnMiddle_of_componentWeightedPhaseExternalClearedBudgetOnMiddle
```

Status operacional: parar plumbing nesta rota. O proximo trabalho quantitativo
deve atacar os budgets externos por familias: horizontal, cutoff,
continued/genuine. O `gapUpper` phase-aware fica por ultimo.

Interface por lower reserve:

```lean
def C2ExactGapAnchorExactGapExpandedUpperFactorReserveLowerBound
def C2ExactGapAnchorExactGapExpandedUpperFactorReserveLowerBoundOnMiddle
def C2ExactGapAnchorExactGapExpandedUpperFactorReserveLowerGapBudget
def C2ExactGapAnchorExactGapExpandedUpperFactorReserveLowerGapBudgetOnMiddle
```

Ela separa o alvo em dois boletos:

```lean
factorReserveLower s ≤
  c2ExactGapAnchorExactGapExpandedUpperFactorReserve
    genuineCentralUpper continuedCentralUpper
    horizontalBudget cutoffBudget s

c2ContinuedVerticalAnchorResidualExactFactorUpper s <
  factorReserveLower s
```

e recompõe o budget fatorado por:

```lean
theorem C2ExactGapAnchorExactGapExpandedUpperFactorReserveBudget_of_lowerBound_of_lowerGapBudget
theorem C2ExactGapAnchorExactGapExpandedUpperFactorReserveBudgetOnMiddle_of_lowerBoundOnMiddle_of_lowerGapBudgetOnMiddle
```

Smoke-test local da cadeia completa ate o budget exact-factor:

```lean
theorem C2ExactGapAnchorTailNormAnchorResidualFactorBudgetOnMiddle_exact_of_exactGapExpandedUpperFactorReserveBudgetOnMiddle
```

Ele compoe:

```lean
FactorReserveBudgetOnMiddle
  → TailGapReserveBudgetOnMiddle
  → CollectedBudgetOnMiddle
  → ClearedBudgetOnMiddle
  → ExactGapExpandedUpperBudgetOnMiddle
  → TailNormAnchorResidualFactorBudgetOnMiddle exact
```

Essa passagem usa apenas a igualdade
`c2ExactGapAnchorExactTailGapBudget_eq_verticalDepthTailUpper_mul_exactFactorUpper`
e a positividade de `verticalDepthTailUpper` no off-critical.  Ainda nao ha
estimativa analitica nova e ainda nao se remove o fator vertical por algebra.

Essa e a forma algebraica recomendada para o proximo ataque quantitativo:
tail phase/exact-gap contribution, genuine, continued, cutoff e horizontal
contra a margem do quarteto ja multiplicada por `1 - ‖q s‖`.

com

```lean
c2ExactGapAnchorExactTailGapBudget s =
  verticalDepthTailUpper s * c2ContinuedOddExactGapUpper s
```

No off-critical, o tail-gap canonico tambem foi normalizado contra o
exact-factor operator-side:

```lean
theorem c2ExactGapAnchorExactTailGapBudget_eq_verticalDepthTailUpper_mul_exactFactorUpper
```

isto e, o termo coletado de fase e

```lean
verticalDepthTailUpper s *
  c2ContinuedVerticalAnchorResidualExactFactorUpper s
```

O fator `verticalDepthTailUpper s` e parte da igualdade algebraica do budget
expanded; remove-lo exigiria uma estimativa adicional, nao uma coleta pura.

Nao e um endpoint global novo; e apenas a ponte local que transforma o boleto
expanded/upper no budget exact-factor.

Se for conveniente separar a prova via envelope intermediario de allowance,
essa desigualdade direta tambem pode ser quebrada em tres pecas escalares:

```lean
def C2ExactGapAnchorExactFactorUpperBound
def C2ExactGapAnchorFactorAllowanceLowerBound
def C2ExactGapAnchorFactorUpperLowerBudget
```

Conversoes/wrapper:

```lean
theorem C2ExactGapAnchorExactFactorUpperBound_of_gapBound
theorem C2ExactGapAnchorExactFactorUpperBoundOnMiddle_of_gapBoundOnMiddle
theorem C2ExactGapAnchorFactorAllowanceLowerBound_of_scalarBudget
theorem C2ExactGapAnchorFactorAllowanceLowerBoundOnMiddle_of_scalarBudgetOnMiddle
theorem C2GenuineExactGapAnchorFinalBudget_of_gapUpperScalarBudget
theorem C2GenuineExactGapAnchorFinalBudgetOnMiddle_of_gapUpperScalarBudgetOnMiddle
theorem C2ExactGapAnchorGapUpperScalarBudget_of_allowanceLowerScalarBudget
theorem C2ExactGapAnchorGapUpperScalarBudgetOnMiddle_of_allowanceLowerScalarBudgetOnMiddle
theorem C2ExactGapAnchorGapUpperExpandedScalarBudget_iff_gapUpperScalarBudget
theorem C2ExactGapAnchorGapUpperScalarBudget_of_expandedScalarBudget
theorem C2ExactGapAnchorGapUpperScalarBudgetOnMiddle_of_expandedScalarBudgetOnMiddle
theorem C2ExactGapAnchorGapUpperExpandedScalarBudget_of_upperBudget
theorem C2ExactGapAnchorGapUpperExpandedScalarBudgetOnMiddle_of_upperBudgetOnMiddle
theorem C2ExactGapAnchorExactGapExpandedScalarBudgetOnMiddle_of_upperBudgetOnMiddle
def C2ContinuedOddChannelBoundOnMiddle
theorem c2ContinuedOddChannelBoundOnMiddle_exact
def c2HalfDiskUpperFromOddUpper
theorem C2ContinuedOddHalfDiskBound_of_oddChannelBound
theorem C2ContinuedOddHalfDiskBoundOnMiddle_of_oddChannelBoundOnMiddle
theorem C2ContinuedOddHalfDiskBoundOnMiddle_exactMetric
def C2ExactGapAnchorExactHalfDiskBudgetOnMiddle
lemma norm_one_sub_two_mul_eq_two_norm_half_sub
theorem C2ExactGapAnchorPhaseDiskOnMiddle_of_exactHalfDiskBudgetOnMiddle
theorem C2ExactGapAnchorPhaseSavingOnMiddle_of_exactHalfDiskBudgetOnMiddle
theorem C2ExactGapAnchorExactHalfDiskBudgetOnMiddle_of_phaseSavingOnMiddle
theorem C2ExactGapAnchorExactHalfDiskBudgetOnMiddle_iff_phaseSavingOnMiddle
def c2VerticalTailLowerDistortion
def c2VerticalTailLowerDistortionExplicitUpper
def C2ExactGapAnchorTailLowerDistortedGapBudget
def C2ExactGapAnchorTailLowerDistortedGapBudgetOnMiddle
def C2ExactGapAnchorTailLowerDistortedGapExplicitUpperBudget
def C2ExactGapAnchorTailLowerDistortedGapExplicitUpperBudgetOnMiddle
def C2ExactGapAnchorTailLowerDistortedPhaseDisk
def C2ExactGapAnchorTailLowerDistortedPhaseDiskOnMiddle
def C2ExactGapAnchorTailLowerDistortedPhaseDiskBudget
def C2ExactGapAnchorTailLowerDistortedPhaseDiskBudgetOnMiddle
def c2TailLowerDistortedHalfDiskPaymentUpper
def C2ExactGapAnchorTailLowerDistortedPhaseDiskUpperLowerBudget
def C2ExactGapAnchorTailLowerDistortedPhaseDiskUpperLowerBudgetOnMiddle
def C2ExactGapAnchorTailLowerDistortedMetricPaymentClearedBudget
def C2ExactGapAnchorTailLowerDistortedMetricPaymentClearedBudgetOnMiddle
def C2ExactGapAnchorTailLowerDistortedOddMetricPaymentClearedBudget
def C2ExactGapAnchorTailLowerDistortedOddMetricPaymentClearedBudgetOnMiddle
def c2TailLowerDistortedOddMetricAllowanceLower
def C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceBudget
def C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceBudgetOnMiddle
def C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedBudget
def C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedBudgetOnMiddle
def C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceClearedBudget
def C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceClearedBudgetOnMiddle
def C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedUpperBudget
def C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedUpperBudgetOnMiddle
def C2TailLowerDistortedOddMetricAllowanceUpperBound
def C2TailLowerDistortedOddMetricAllowanceUpperBoundOnMiddle
def C2VerticalDepthTailUpperBound
def C2VerticalDepthTailUpperBoundOnMiddle
def C2TailLowerDistortedOddMetricAllowanceTailProductBudget
def C2TailLowerDistortedOddMetricAllowanceTailProductBudgetOnMiddle
def C2TailLowerDistortedOddMetricAllowanceTailProductBound
def C2TailLowerDistortedOddMetricAllowanceTailProductBoundOnMiddle
def c2TailLowerDistortedOddMetricAllowanceTailProductCanonicalUpper
def C2TailLowerDistortedOddMetricAllowanceTailProductCanonicalBudget
def C2TailLowerDistortedOddMetricAllowanceTailProductCanonicalBudgetOnMiddle
theorem C2TailLowerDistortedOddMetricAllowanceTailProductCanonicalBudgetOnMiddle_self
theorem C2ExactGapAnchorExactGapExpandedScalarBudget_iff_explicit
theorem C2ExactGapAnchorExactGapExpandedScalarBudget_of_explicit
theorem C2ExactGapAnchorExactGapExpandedScalarBudgetOnMiddle_of_explicit
theorem c2ContinuedVerticalAnchorResidualExactLowerFactorUpper_eq_tailLowerDistortion_mul_exactOddGap
theorem C2ExactGapAnchorExactAnchorResidualBudget_iff_tailLowerDistortedGapBudget
theorem C2ExactGapAnchorExactAnchorResidualBudgetOnMiddle_iff_tailLowerDistortedGapBudgetOnMiddle
theorem verticalDepthTailUpper_div_c2VerticalDepthTailLower_eq_explicit
theorem c2VerticalTailLowerDistortion_le_explicitUpper_of_offCriticalStrip
theorem C2ExactGapAnchorTailLowerDistortedGapBudget_of_explicitUpperBudget
theorem C2ExactGapAnchorTailLowerDistortedGapBudgetOnMiddle_of_explicitUpperBudgetOnMiddle
theorem one_le_c2VerticalTailLowerDistortionExplicitUpper_of_offCriticalStrip
theorem C2ExactGapAnchorTailLowerDistortedGapExplicitUpperBudget_iff_phaseDisk
theorem C2ExactGapAnchorTailLowerDistortedGapExplicitUpperBudgetOnMiddle_iff_phaseDiskOnMiddle
theorem C2ExactGapAnchorTailLowerDistortedPhaseDisk_of_halfDiskBound
theorem C2ExactGapAnchorTailLowerDistortedPhaseDiskOnMiddle_of_halfDiskBoundOnMiddle
theorem C2ExactGapAnchorPhaseDisk_of_tailLowerDistortedPhaseDisk
theorem C2ExactGapAnchorPhaseDiskOnMiddle_of_tailLowerDistortedPhaseDiskOnMiddle
theorem C2ExactGapAnchorPhaseSavingOnMiddle_of_tailLowerDistortedPhaseDiskOnMiddle
theorem C2ExactGapAnchorTailLowerDistortedPhaseDiskBudget_of_upperLowerBudget
theorem C2ExactGapAnchorTailLowerDistortedPhaseDiskBudgetOnMiddle_of_upperLowerBudgetOnMiddle
theorem C2ExactGapAnchorTailLowerDistortedPhaseDiskUpperLowerBudget_of_metricPaymentClearedBudget
theorem C2ExactGapAnchorTailLowerDistortedPhaseDiskUpperLowerBudgetOnMiddle_of_metricPaymentClearedBudgetOnMiddle
theorem C2ExactGapAnchorTailLowerDistortedMetricPaymentClearedBudget_of_oddMetricPaymentClearedBudget
theorem C2ExactGapAnchorTailLowerDistortedMetricPaymentClearedBudgetOnMiddle_of_oddMetricPaymentClearedBudgetOnMiddle
theorem C2ExactGapAnchorTailLowerDistortedPhaseDiskUpperLowerBudgetOnMiddle_of_oddMetricPaymentClearedBudgetOnMiddle
theorem C2ExactGapAnchorTailLowerDistortedOddMetricPaymentClearedBudget_of_slackAllowanceLower
theorem C2ExactGapAnchorTailLowerDistortedOddMetricPaymentClearedBudgetOnMiddle_of_slackAllowanceLower
theorem C2ExactGapAnchorTailLowerDistortedPhaseDiskBudgetOnMiddle_of_allowanceLowerScalarBudgetOnMiddle
theorem C2ExactGapAnchorFactorAllowanceLowerScalarBudgetOnMiddle_of_oddMetricSlackAllowanceBudgetOnMiddle
theorem C2ExactGapAnchorPhaseDiskOnMiddle_of_tailLowerDistortedOddMetricSlackAllowanceBudgetOnMiddle
theorem C2ExactGapAnchorPhaseDiskOnMiddle_of_oddMetricSlackAllowanceBudgetOnMiddle
theorem exactVerticalScalarBudget_iff_budget_le_allowance
theorem C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedBudget_iff_slackAllowanceBudget
theorem C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceBudgetOnMiddle_of_expandedBudgetOnMiddle
theorem C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedBudgetOnMiddle_iff_slackAllowanceBudgetOnMiddle
theorem C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedBudget_of_clearedBudget
theorem C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedBudgetOnMiddle_of_clearedBudgetOnMiddle
lemma c2_cleared_tail_min_gt_cleared_quartet_margin_scalar
theorem not_C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceClearedBudget_of_nonneg
theorem C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedBudget_of_upperBudget
theorem C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedBudgetOnMiddle_of_upperBudgetOnMiddle
theorem oddUpper_nonneg_of_continuedOddChannelBound
theorem c2TailLowerDistortedOddMetricAllowanceLower_nonneg_of_oddBound
theorem C2TailLowerDistortedOddMetricAllowanceTailProductBound_of_upperBounds
theorem C2TailLowerDistortedOddMetricAllowanceTailProductBoundOnMiddle_of_upperBoundsOnMiddle
theorem c2TailLowerDistortedOddMetricAllowanceTailProductCanonicalUpper_eq
theorem C2TailLowerDistortedOddMetricAllowanceTailProductBound_of_canonicalBudget
theorem C2TailLowerDistortedOddMetricAllowanceTailProductBoundOnMiddle_of_canonicalBudgetOnMiddle
theorem C2ExactGapAnchorExactGapExpandedScalarBudget_iff_finalBudget
theorem C2ExactGapAnchorExactGapExpandedScalarBudget_iff_phaseSaving
theorem C2ExactGapAnchorExactGapExpandedScalarBudgetOnMiddle_iff_phaseSavingOnMiddle
theorem C2ExactGapAnchorExactGapExpandedLocalData.of_horizontalBudget
theorem C2ExactGapAnchorExactGapExpandedLocalData.of_scaleData
theorem C2ExactGapAnchorExactGapExpandedMiddleData.of_scalarBudget
theorem C2ExactGapAnchorExactGapExpandedMiddleData.of_scaleData
theorem C2ExactGapAnchorExactGapExpandedMiddleData.of_phaseSavingOnMiddle
theorem C2ExactGapAnchorExactGapExpandedMiddleData.of_scaleData_phaseSavingOnMiddle
theorem C2ExactGapAnchorExactGapExpandedMiddleData.of_explicit
theorem C2ExactGapAnchorExactGapExpandedMiddleData.of_upperBudget
theorem C2ExactGapAnchorExactGapExpandedMiddleData.to_phaseSavingOnMiddle
theorem C2ExactGapAnchorExactGapExpandedMiddleData.forces_exactOddGap_lt_one
structure C2ExactGapAnchorPhaseDiskMiddleData
theorem C2ExactGapAnchorPhaseDiskMiddleData.of_scaleData
theorem C2ExactGapAnchorPhaseDiskMiddleData.to_phaseSavingOnMiddle
theorem C2ExactGapAnchorPhaseDiskMiddleData.to_exactGapExpandedMiddleData
structure C2ExactGapAnchorAnchorResidualMiddleData
theorem C2ExactGapAnchorAnchorResidualMiddleData.of_scaleData
theorem C2ExactGapAnchorAnchorResidualMiddleData.of_exactAnchorResidualBudget
theorem C2ExactGapAnchorAnchorResidualMiddleData.of_scaleData_exactAnchorResidualBudget
theorem C2ExactGapAnchorAnchorResidualMiddleData.of_tailLowerDistortedGapBudget
theorem C2ExactGapAnchorAnchorResidualMiddleData.of_scaleData_tailLowerDistortedGapBudget
theorem C2ExactGapAnchorAnchorResidualMiddleData.of_scaleData_tailLowerDistortedGapExplicitUpperBudget
theorem C2ExactGapAnchorAnchorResidualMiddleData.of_scaleData_tailLowerDistortedPhaseDisk
theorem C2ExactGapAnchorAnchorResidualMiddleData.to_phaseDiskMiddleData
theorem C2ExactGapAnchorAnchorResidualMiddleData.to_phaseSavingOnMiddle
theorem C2ExactGapAnchorAnchorResidualMiddleData.to_exactGapExpandedMiddleData
theorem C2ExactGapAnchorTailNormAnchorResidualFactorBudget_exact_of_upperLowerBudget
theorem C2ExactGapAnchorTailNormAnchorResidualFactorBudgetOnMiddle_exact_of_upperLowerBudgetOnMiddle
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorFactorUpperLowerBudget
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorGapUpperScalarBudget
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorGapUpperExpandedScalarBudget
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorGapUpperExpandedUpperBudget
theorem genuineCentral_ne_zero_of_exactGapAnchorExactGapExpandedLocalData
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorExactGapExpandedScalarBudget
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorExactGapExpandedUpperBudget
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorExactGapExpandedExplicitBudget
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorExactGapExpandedMiddleData
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorPhaseDiskMiddleData
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorAnchorResidualMiddleData
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorTailLowerDistortedGapBudget
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedGapBudget
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedGapExplicitUpperBudget
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedPhaseDisk
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedHalfDiskBound
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedOddChannelBound
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedOddChannelAllowanceLowerBudget
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedOddMetricPaymentClearedBudget
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedOddMetricSlackAllowanceBudget
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorExactGapExpandedScaleData
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorPhaseSavingOnMiddle
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataPhaseSavingOnMiddle
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorExactGapExpandedScaleDataExplicitBudget
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorGapUpperAllowanceLowerBudget
```

Assim, o alvo formal principal agora e habitar:

```lean
C2ExactGapAnchorExactGapExpandedMiddleData
  K M horizontalConstant horizontalScale horizontalRatio near edge
```

O campo matematico novo desse pacote e equivalente ao phase saving exato no
middle:

```lean
theorem C2ExactGapAnchorExactGapExpandedScalarBudgetOnMiddle_iff_phaseSavingOnMiddle
```

Assim, a rota mais curta para fechar `neq_zero` no middle agora e:

```lean
C2ExpandedScalarScaleData on middle
+ C2ExpandedHorizontalLayerBudget on middle
+ C2ExactGapAnchorPhaseSavingOnMiddle
=> genuineCentralDoubleSeries s != 0 on middle
```

com a ponte ja formalizada como:

```lean
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataPhaseSavingOnMiddle
```

A rota mais geometrica, centrada no operador genuine/C2, ficou:

```lean
C2ExactGapAnchorAnchorResidualMiddleData
=> C2ExactGapAnchorPhaseDiskMiddleData
=> C2ExactGapAnchorExactGapExpandedMiddleData
=> genuineCentralDoubleSeries s != 0 on middle
```

As duas pontes finais ja estao formalizadas:

```lean
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorPhaseDiskMiddleData
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorAnchorResidualMiddleData
```

O alvo operador-side tambem foi normalizado pela geometria vertical C2:

```lean
C2ExactGapAnchorExactAnchorResidualBudget
↔ C2ExactGapAnchorTailLowerDistortedGapBudget
```

onde o fator novo e

```lean
c2VerticalTailLowerDistortion s
  = ‖verticalDepthTailFromTwo s‖ / c2VerticalDepthTailLower s
```

e ele tem upper vertical explicito:

```lean
c2VerticalTailLowerDistortion s
  ≤ (1 + ‖q s‖) / (1 - ‖q s‖)
```

Assim, uma forma suficiente e mais concreta do proximo alvo e:

```lean
C2ExactGapAnchorTailLowerDistortedGapExplicitUpperBudgetOnMiddle
```

Equivalentemente, em forma de disco geometrico centrado no canal odd:

```lean
C2ExactGapAnchorTailLowerDistortedPhaseDiskOnMiddle
```

isto e, provar que `continuedOddDirichletChannel s` fica no disco centrado em
`1 / 2` com raio `allowance / (2 * distortionExplicitUpper)`.

Forma operacional nova:

```lean
C2ContinuedOddHalfDiskBoundOnMiddle halfDiskUpper near edge
C2ExactGapAnchorTailLowerDistortedPhaseDiskBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio halfDiskUpper near edge
```

Bound metrico ja provado a partir de uma norma do canal odd:

```lean
C2ContinuedOddChannelBoundOnMiddle oddUpper near edge
  →
C2ContinuedOddHalfDiskBoundOnMiddle
  (c2HalfDiskUpperFromOddUpper oddUpper) near edge
```

onde

```lean
c2HalfDiskUpperFromOddUpper oddUpper s = (1 / 2 : ℝ) + oddUpper s
```

Pagamento escalar agora separado:

```lean
C2ExactGapAnchorFactorAllowanceLowerScalarBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio allowanceLower near edge

C2ExactGapAnchorTailLowerDistortedOddMetricPaymentClearedBudgetOnMiddle
  oddUpper allowanceLower near edge
```

A segunda obrigacao e a forma limpa sem divisao:

```lean
(1 + ‖q s‖) * (1 + 2 * oddUpper s) <
  allowanceLower s * (1 - ‖q s‖)
```

Ela implica automaticamente o budget antigo:

```lean
C2ExactGapAnchorTailLowerDistortedPhaseDiskUpperLowerBudgetOnMiddle
  (c2HalfDiskUpperFromOddUpper oddUpper) allowanceLower near edge
```

Essas duas obrigacoes produzem diretamente:

```lean
C2ExactGapAnchorTailLowerDistortedPhaseDiskOnMiddle
```

com endpoint ja certificado:

```lean
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedGapExplicitUpperBudget
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedPhaseDisk
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedHalfDiskBound
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedOddChannelBound
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedOddChannelAllowanceLowerBudget
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedOddMetricPaymentClearedBudget
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedOddMetricSlackAllowanceBudget
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedOddMetricSlackAllowanceExpandedBudget
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedOddMetricSlackAllowanceExpandedUpperBudget
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedOddMetricSlackAllowanceExpandedUpperBudget_of_tailProductBound
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedOddMetricSlackAllowanceExpandedUpperBudget_of_tailProductUpperBounds
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedOddMetricSlackAllowanceExpandedUpperBudget_of_tailProductCanonicalBudget
```

Forma canônica com slack:

```lean
c2TailLowerDistortedOddMetricAllowanceLower oddUpper paymentSlack s =
  (((1 + ‖q s‖) * (1 + 2 * oddUpper s) + paymentSlack s) /
    (1 - ‖q s‖))
```

Com `0 < paymentSlack s`, o pagamento limpo e automático. O alvo restante fica:

```lean
C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio oddUpper paymentSlack near edge
```

Isto e, provar que essa allowance lower canônica ainda cabe no orçamento
vertical exato.

A forma preferida para atacar esse alvo agora e a versao expandida, ja provada
equivalente no middle:

```lean
theorem C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedBudgetOnMiddle_iff_slackAllowanceBudgetOnMiddle
```

O boleto pointwise expandido e:

```lean
((c2TailLowerDistortedOddMetricAllowanceLower oddUpper paymentSlack s *
        verticalDepthTailUpper s +
      c2GenuineCentralExactUpper s +
      c2ContinuedCentralExactUpper s +
      c2RawCentralCutoffNormConstant K M s +
      c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio s) *
    (1 + ‖q s‖)) *
  (1 - ‖q s‖)⁻¹ +
c2HorizontalRegularizedUpper
  horizontalConstant horizontalScale horizontalRatio s +
c2RawCentralCutoffNormConstant K M s ≤
  c2ExpandedQuartetResidualMargin s
```

A forma sem denominadores ja esta exposta com denominador comum
`(1 - ‖q s‖) ^ 3`:

```lean
def C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceClearedBudget
def C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceClearedBudgetOnMiddle
```

Pointwise, com

```lean
r := ‖q s‖
A := (1 + r) * (1 + 2 * oddUpper s) + paymentSlack s
D :=
  c2GenuineCentralExactUpper s +
  c2ContinuedCentralExactUpper s +
  c2RawCentralCutoffNormConstant K M s +
  c2HorizontalRegularizedUpper
    horizontalConstant horizontalScale horizontalRatio s
H :=
  c2HorizontalRegularizedUpper
    horizontalConstant horizontalScale horizontalRatio s
C := c2RawCentralCutoffNormConstant K M s
```

o boleto cleared e:

```lean
(1 + r) * (A * r ^ 2 + D * (1 - r) ^ 2) +
    (H + C) * (1 - r) ^ 3 ≤
  c2ExpandedQuartetResidualMargin s * (1 - r) ^ 3
```

A ponte suficiente ja esta formalizada:

```lean
theorem C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedBudget_of_clearedBudget
theorem C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedBudgetOnMiddle_of_clearedBudgetOnMiddle
```

O sanity check formal mostrou que essa rota cleared nao deve ser perseguida
como alvo analitico sob os uppers naturais nao negativos.  O tail minimo
`r ^ 2 * (1 + r) ^ 2` ja excede a margem cleared do quarteto:

```lean
lemma c2_cleared_tail_min_gt_cleared_quartet_margin_scalar
```

e, assumindo `0 < ‖q s‖`, `‖q s‖ < 1`, `0 ≤ oddUpper s`,
`0 ≤ paymentSlack s`, envelopes horizontais positivos/nao negativos, e

```lean
c2ExpandedQuartetResidualMargin s ≤
  ‖q s‖ ^ 2 * (1 - ‖q s‖) * (1 + ‖q s‖ ^ 2)
```

Lean prova:

```lean
theorem not_C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceClearedBudget_of_nonneg
```

Conclusao: a engenharia cleared foi util para expor o gargalo, mas o boleto
odd-metric slack allowance fica overbudget sob majorantes norm-only.  Nao
tentar provar essa desigualdade.  O proximo alvo deve voltar para
`C2ExactGapAnchorPhaseDiskOnMiddle` / `C2ExactGapAnchorPhaseSavingOnMiddle`
com saving de fase real.

Infraestrutura ainda existente por envelopes externos:

```lean
C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedUpperBudgetOnMiddle
  tailAllowanceBudget genuineCentralUpper continuedCentralUpper
  horizontalBudget cutoffBudget near edge
→
C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio oddUpper paymentSlack near edge
```

com as hipoteses usuais:

```lean
c2TailLowerDistortedOddMetricAllowanceLower oddUpper paymentSlack s *
  verticalDepthTailUpper s ≤ tailAllowanceBudget s
C2GenuineCentralBound genuineCentralUpper s
C2ContinuedCentralBound continuedCentralUpper s
c2HorizontalRegularizedUpper ... s ≤ horizontalBudget s
c2RawCentralCutoffNormConstant K M s ≤ cutoffBudget s
```

O produto tail-allowance tambem foi separado em tres envelopes:

```lean
C2TailLowerDistortedOddMetricAllowanceUpperBoundOnMiddle
  oddUpper paymentSlack allowanceUpper near edge
C2VerticalDepthTailUpperBoundOnMiddle verticalTailBudget near edge
C2TailLowerDistortedOddMetricAllowanceTailProductBudgetOnMiddle
  allowanceUpper verticalTailBudget tailAllowanceBudget near edge
```

Juntos com `C2ContinuedOddChannelBoundOnMiddle oddUpper near edge` e
`0 < paymentSlack s`, esses tres envelopes produzem:

```lean
C2TailLowerDistortedOddMetricAllowanceTailProductBoundOnMiddle
  oddUpper paymentSlack tailAllowanceBudget near edge
```

e alimentam diretamente o endpoint:

```lean
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedOddMetricSlackAllowanceExpandedUpperBudget_of_tailProductUpperBounds
```

A versao canônica direta do produto tambem esta fechada:

```lean
c2TailLowerDistortedOddMetricAllowanceTailProductCanonicalUpper
  oddUpper paymentSlack s =
  (((1 + ‖q s‖) * (1 + 2 * oddUpper s) + paymentSlack s) *
      ‖q s‖ ^ 2) *
    (1 - ‖q s‖)⁻¹ * (1 - ‖q s‖)⁻¹
```

e coincide exatamente com o produto real:

```lean
theorem c2TailLowerDistortedOddMetricAllowanceTailProductCanonicalUpper_eq
```

Assim, o boleto mais curto para o produto agora e:

```lean
C2TailLowerDistortedOddMetricAllowanceTailProductCanonicalBudgetOnMiddle
  oddUpper paymentSlack tailAllowanceBudget near edge
```

com endpoint direto:

```lean
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedOddMetricSlackAllowanceExpandedUpperBudget_of_tailProductCanonicalBudget
```

O budget artificial `tailAllowanceBudget` tambem pode ser escolhido como o
proprio produto canônico:

```lean
theorem C2TailLowerDistortedOddMetricAllowanceTailProductCanonicalBudgetOnMiddle_self
```

Isso da o endpoint scalar-only com produto canônico inline:

```lean
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorScaleDataTailLowerDistortedOddMetricSlackAllowanceExpandedCanonicalUpperBudget
```

O boleto restante desse wrapper e:

```lean
C2ExactGapAnchorTailLowerDistortedOddMetricSlackAllowanceExpandedUpperBudgetOnMiddle
  (c2TailLowerDistortedOddMetricAllowanceTailProductCanonicalUpper
    oddUpper paymentSlack)
  genuineCentralUpper continuedCentralUpper
  horizontalBudget cutoffBudget near edge
```

O pacote tambem projeta formalmente a obrigacao de fase do middle:

```lean
theorem C2ExactGapAnchorExactGapExpandedMiddleData.to_phaseSavingOnMiddle
theorem C2ExactGapAnchorExactGapExpandedMiddleData.forces_exactOddGap_lt_one
```

O campo matematico novo desse pacote pode ser lido literalmente como:

```lean
((verticalDepthTailUpper s *
        ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖ +
      ‖genuineCentralDoubleSeries s‖ +
      ‖continuedCentralOddChannel s‖ +
      c2RawCentralCutoffNormConstant K M s +
      c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio s) *
    (1 + ‖q s‖)) *
  (1 - ‖q s‖)⁻¹ +
c2HorizontalRegularizedUpper
  horizontalConstant horizontalScale horizontalRatio s +
c2RawCentralCutoffNormConstant K M s <
  c2ExpandedQuartetResidualMargin s
```

Ou, se quisermos trabalhar por envelopes externos:

```lean
C2ExactGapAnchorExactGapExpandedUpperBudgetOnMiddle
  genuineCentralUpper continuedCentralUpper horizontalBudget cutoffBudget near edge
```

Checklist correspondente:

```lean
C2GenuineCentralBound genuineCentralUpper s
C2ContinuedCentralBound continuedCentralUpper s
c2HorizontalRegularizedUpper ... s ≤ horizontalBudget s
c2RawCentralCutoffNormConstant K M s ≤ cutoffBudget s
```

A positividade necessaria da tail vertical exata esta certificada por:

```lean
theorem verticalDepthTailFromTwo_ne_zero_of_offCriticalStrip
theorem verticalDepthTailFromTwo_norm_pos_of_offCriticalStrip
```

e a conversao lossless para o alvo de fase ja esta fechada nos dois sentidos:

```lean
theorem C2ExactGapAnchorPhaseSavingOnMiddle_of_phaseDiskOnMiddle
theorem C2ExactGapAnchorPhaseSaving_of_tailNormAnchorResidualBudget
theorem C2ExactGapAnchorTailNormAnchorResidualBudget_of_phaseSaving
theorem C2ExactGapAnchorTailNormAnchorResidualBudget_iff_phaseSaving
theorem C2ExactGapAnchorPhaseSavingOnMiddle_of_tailNormAnchorResidualBudgetOnMiddle
theorem C2ExactGapAnchorTailNormAnchorResidualBudgetOnMiddle_of_phaseSavingOnMiddle
theorem C2ExactGapAnchorTailNormAnchorResidualBudgetOnMiddle_iff_phaseSavingOnMiddle
```

Assim, no off-critical/middle, o budget tail-norm nao e uma hipotese
adicional: ele e a normalizacao operator-side exata do mesmo saving de fase.
O budget final exato, o phase-saving e o tail-norm budget tambem foram
identificados como a mesma obrigacao:

```lean
theorem C2GenuineExactGapAnchorFinalBudget_iff_phaseSaving
theorem C2GenuineExactGapAnchorFinalBudget_iff_tailNormAnchorResidualBudget
theorem C2GenuineExactGapAnchorFinalBudgetOnMiddle_iff_phaseSavingOnMiddle
theorem C2GenuineExactGapAnchorFinalBudgetOnMiddle_iff_tailNormAnchorResidualBudgetOnMiddle
```

Nova barreira necessaria: qualquer fechamento precisa antes produzir allowance
positiva.  Se `c2ExactGapAnchorFactorAllowance ... s ≤ 0`, o phase-saving e o
tail-norm budget sao impossiveis.

```lean
theorem C2ExactGapAnchorPhaseSaving_forces_factorAllowance_pos
theorem not_C2ExactGapAnchorPhaseSaving_of_factorAllowance_nonpos
theorem C2ExactGapAnchorTailNormAnchorResidualBudget_forces_factorAllowance_pos
theorem not_C2ExactGapAnchorTailNormAnchorResidualBudget_of_factorAllowance_nonpos
```

A positividade da allowance ja foi normalizada em dois budgets equivalentes.  A
forma residual compacta e:

```lean
def C2ExactGapAnchorPositiveAllowanceBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : Prop :=
  c2GenuineCentralExactUpper s +
      c2ContinuedCentralExactUpper s +
      c2RawCentralCutoffNormConstant K M s <
    c2ExactVerticalResidualNormAllowance
      K M horizontalConstant horizontalScale horizontalRatio s
```

e a forma escalar contra a margem do quarteto e:

```lean
def C2ExactGapAnchorPositiveAllowanceScalarBudget
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : Prop :=
  ((c2GenuineCentralExactUpper s +
          c2ContinuedCentralExactUpper s +
          c2RawCentralCutoffNormConstant K M s +
          c2HorizontalRegularizedUpper
            horizontalConstant horizontalScale horizontalRatio s) *
        (1 + ‖q s‖)) *
      (1 - ‖q s‖)⁻¹ +
    c2HorizontalRegularizedUpper
      horizontalConstant horizontalScale horizontalRatio s +
    c2RawCentralCutoffNormConstant K M s <
      c2ExpandedQuartetResidualMargin s
```

Conversoes fechadas:

```lean
theorem c2ExactGapAnchorFactorAllowance_pos_iff_positiveAllowanceBudget
theorem C2ExactGapAnchorPositiveAllowanceScalarBudget_iff_positiveAllowanceBudget
theorem C2ExactGapAnchorPositiveAllowanceScalarBudgetOnMiddle_iff_positiveAllowanceBudgetOnMiddle
theorem c2ExactGapAnchorFactorAllowance_pos_onMiddle_of_positiveAllowanceScalarBudgetOnMiddle
```

Tambem existe agora a superficie com majorantes externos:

```lean
def C2ExactGapAnchorPositiveAllowanceUpperBudget
    (_K _M : ℕ)
    (genuineCentralUpper continuedCentralUpper
      horizontalBudget cutoffBudget : ℂ → ℝ)
    (s : ℂ) : Prop :=
  ((genuineCentralUpper s +
          continuedCentralUpper s +
          cutoffBudget s +
          horizontalBudget s) *
        (1 + ‖q s‖)) *
      (1 - ‖q s‖)⁻¹ +
    horizontalBudget s + cutoffBudget s <
      c2ExpandedQuartetResidualMargin s
```

Com bounds externos para os quatro debitos, ela fecha a positividade da
allowance no middle:

```lean
theorem C2ExactGapAnchorPositiveAllowanceScalarBudgetOnMiddle_of_upperBudgetOnMiddle
theorem c2ExactGapAnchorFactorAllowance_pos_onMiddle_of_positiveAllowanceUpperBudgetOnMiddle
```

Wrapper global recomendado agora:

```lean
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorTailNormAnchorResidualBudget
    ...
    (hbudget :
      C2ExactGapAnchorTailNormAnchorResidualBudgetOnMiddle
        horizontalConstant horizontalScale horizontalRatio near edge) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0
```

Wrapper inline de conveniencia:

```lean
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorTailNormAnchorResidualExplicitBudget
    ...
    (hbudget : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      ‖c2ContinuedVerticalAnchorResidual s‖ <
        ‖verticalDepthTailFromTwo s‖ *
          c2ExactGapAnchorFactorAllowance
            K M horizontalConstant horizontalScale horizontalRatio s) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0
```

Split factor-upper / allowance-lower:

```lean
-- (a) exact factor upper
C2ExactGapAnchorExactFactorUpperBoundOnMiddle gapUpper near edge

-- (b) allowance lower
C2ExactGapAnchorFactorAllowanceLowerBoundOnMiddle
  horizontalConstant horizontalScale horizontalRatio allowanceLower near edge

-- (c) final strict gap
C2ExactGapAnchorFactorUpperLowerBudgetOnMiddle
  gapUpper allowanceLower near edge
```

Na especializacao mais curta, escolhemos `gapUpper` como o fator exato:

```lean
C2ExactGapAnchorFactorUpperLowerBudgetOnMiddle
  c2ContinuedVerticalAnchorResidualExactFactorUpper
  allowanceLower near edge
```

isto e, literalmente:

```lean
∀ ⦃s : ℂ⦄,
  s ∈ c2ExpandedScalarMiddleRegion near edge →
  c2ContinuedVerticalAnchorResidualExactFactorUpper s < allowanceLower s
```

com ponte registrada como:

```lean
theorem C2ExactGapAnchorFactorUpperLowerBudgetOnMiddle_exact_iff
```

Esses tres boletos alimentam a ponte nao-global ja existente:

```lean
theorem C2ExactGapAnchorTailNormAnchorResidualFactorBudgetOnMiddle_exact_of_upperLowerBudgetOnMiddle
```

e a especializacao sem `gapUpper` artificial e:

```lean
theorem C2ExactGapAnchorTailNormAnchorResidualFactorBudgetOnMiddle_exact_of_exactFactorUpperLowerBudgetOnMiddle
```

Normalizacao de positividade da allowance via lower externo:

```lean
C2ExactGapAnchorFactorAllowanceLowerPositiveOnMiddle allowanceLower near edge
→ C2ExactGapAnchorFactorAllowanceLowerBoundOnMiddle
    horizontalConstant horizontalScale horizontalRatio allowanceLower near edge
→ C2ExactGapAnchorPositiveAllowanceBudgetOnMiddle
    horizontalConstant horizontalScale horizontalRatio near edge
```

formalizada por:

```lean
theorem c2ExactGapAnchorFactorAllowance_pos_onMiddle_of_allowanceLowerPositiveOnMiddle
theorem C2ExactGapAnchorPositiveAllowanceBudgetOnMiddle_of_allowanceLowerPositiveOnMiddle
theorem C2ExactGapAnchorFactorAllowanceLowerPositiveOnMiddle_of_exactFactorUpperLowerBudgetOnMiddle
theorem C2ExactGapAnchorPositiveAllowanceBudgetOnMiddle_of_exactFactorUpperLowerBudgetOnMiddle
```

Portanto o proximo alvo genuine-first mais limpo e provar, no middle:

```lean
‖c2ContinuedVerticalAnchorResidual s‖ <
  ‖verticalDepthTailFromTwo s‖ *
    c2ExactGapAnchorFactorAllowance
      K M horizontalConstant horizontalScale horizontalRatio s
```

A forma totalmente expandida do mesmo alvo e:

```lean
theorem genuineCentral_ne_zero_on_middle_of_exactGapAnchorExplicitBudget
    ...
    (hbudget : ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      verticalDepthTailUpper s *
          ‖1 - (2 : ℂ) * continuedOddDirichletChannel s‖ +
        ‖genuineCentralDoubleSeries s‖ +
        ‖continuedCentralOddChannel s‖ <
          c2ExactVerticalAnchorResidualNormAllowance
            K M horizontalConstant horizontalScale horizontalRatio s) :
    ∀ ⦃s : ℂ⦄,
      s ∈ c2ExpandedScalarMiddleRegion near edge →
      genuineCentralDoubleSeries s ≠ 0
```

Diagnostico formal:

```lean
theorem C2ExactGapAnchorPhaseDisk_forces_exactOddGap_lt_one
theorem C2ExactGapAnchorPhaseSaving_forces_exactOddGap_lt_one
theorem C2ExactGapAnchorTailNormAnchorResidualBudget_forces_exactOddGap_lt_one
theorem not_C2ExactGapAnchorTailNormAnchorResidualBudget_of_one_le_exactOddGap
theorem C2GenuineExactGapAnchorFinalBudget_forces_exactOddGap_lt_one
theorem C2ExactGapAnchorExactGapExpandedMiddleData.forces_exactOddGap_lt_one
```

Logo, um bound triangular do tipo `‖1 - 2 * continuedOdd‖ ≤ 1 + ...` nao basta
para fechar.  A rota precisa de uma estimativa direta do gap, com fase.
