# Mapa real das rotas middle genuine

Data da revisao: 2026-07-08.

Este documento e o mapa de navegacao do workspace para a faixa `middle` da
rota genuine/C2. Ele tenta ser fiel ao que esta no Lean e separa rigorosamente:

- o que esta provado formalmente;
- o que e apenas reducao/endpoint condicional;
- o que foi observado numericamente;
- o que esta morto;
- qual e a rota de contabilidade dos boletos;
- qual e a frente recomendada depois do ultimo diagnostico numerico.

## Regra de ouro

A rota ativa e **Genuine-First**.

Na prova local da middle, nao usar zeta como entrada analitica, estimativa,
comparacao, upper bound ou atalho. Nomes ligados a zeta so podem aparecer em:

- camada terminal;
- auditoria historica;
- rotas antigas ja marcadas como tal;
- checks para garantir que uma rota antiga nao esta contaminando a rota ativa.

Frase curta:

```text
Provar o nao-cancelamento no operador genuine/C2 primeiro.
Depois, se necessario, usar a ponte terminal.
```

## Fonte de verdade desta revisao

Arquivos Lean checados nesta revisao:

```text
LeanC2/PeerReview.lean
LeanC2/AuditGenuineMiddleExactGapFrontier.lean
LeanC2/AuditAdjustedQuartetRoute.lean
LeanC2/AuditContinuedQuartetDominance.lean
LeanC2/AuditMiddleBarrier.lean
```

Checks rodados:

```bash
lake env lean LeanC2/PeerReview.lean
lake env lean LeanC2/AuditGenuineMiddleExactGapFrontier.lean
lake env lean LeanC2/AuditAdjustedQuartetRoute.lean
lake env lean LeanC2/AuditContinuedQuartetDominance.lean
lake env lean LeanC2/AuditMiddleBarrier.lean
```

Resultado: todos passaram. `AuditMiddleBarrier.lean` teve apenas warning de
lint sobre `simpa`.

## Legenda de status

```text
Pago em Lean
```

Existe uma declaracao Lean compilando que prova exatamente aquele item.

```text
Reducao em Lean
```

Lean prova que um alvo segue de outro alvo menor, mas o alvo menor ainda nao
foi habitado/provado globalmente.

```text
Diagnostico numerico
```

Resultado util para orientar a prova, mas ainda nao e prova formal.

```text
Morto formalmente
```

Lean prova uma obstrucao ou impossibilidade para aquela formulacao.

```text
Fora da rota ativa
```

Pode existir no workspace, mas nao deve ser usado como insumo da middle
Genuine-First.

## Resumo executivo

Existem dois sentidos que estavam misturados antes:

### 1. Rota de contabilidade dos boletos

Esta e a rota formal de livro-caixa que construimos no Lean.

Nome informal:

```text
exact-gap anchor / quarter-unit reserve
```

API publica atual:

```lean
C2.PeerReview.QuarterUnitMiddleObligation
C2.PeerReview.QuarterUnitMiddleCertificate
C2.PeerReview.genuineCentral_ne_zero_of_quarterUnitMiddleCertificate
```

Alvo de caixa:

```text
D + G <= (3 / 4) * Q
```

Leitura:

- `Q` e a margem limpa disponivel;
- `D` e o debito externo limpo;
- `G` e o custo do lower-factor;
- a prova precisa pagar `D` e `G` e ainda preservar `1 / 4` de `Q`.

Status atual:

```text
o encanamento formal esta pago;
o boleto global `QuarterUnitMiddleObligation` ainda nao esta pago.
```

### 2. Frente recomendada apos o ultimo diagnostico

O ultimo diagnostico numerico mostrou que, na rota de boletos, o cutoff deixou
de ser o vilao, mas o anchor/lower-factor continuou caro demais.

Por isso a frente recomendada para investigacao seguinte e:

```text
adjusted quartet / margem oscilatoria
```

Alvo conceitual:

```text
main - defect - tail > 0
```

Superficie Lean:

```lean
AdjustedQuartetAudit.PointwiseBounds.dominance
AdjustedQuartetAudit.ClosureInputs
```

Status atual:

```text
rota valida como superficie condicional;
dominance ainda nao esta provado.
```

## Rota de boletos: quarter-unit reserve

Arquivo publico:

```text
LeanC2/PeerReview.lean
```

Regiao:

```lean
C2.PeerReview.CurrentMiddleRegion
```

Certificado publico:

```lean
C2.PeerReview.QuarterUnitMiddleCertificate
```

Campos obrigatorios do certificado:

```lean
scale :
  C2ExpandedScalarScaleData ...

horizontal :
  C2ExpandedHorizontalLayerBudget ...

quarterUnit :
  C2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserveBudgetOnMiddle ...
```

Conclusao formal do certificado:

```lean
∀ s,
  s ∈ CurrentMiddleRegion ... →
  genuineCentralDoubleSeries s ≠ 0
```

Teorema publico:

```lean
C2.PeerReview.genuineCentral_ne_zero_of_quarterUnitMiddleCertificate
```

Importante: este certificado fecha **nao-anulamento no middle**. Ele nao e,
sozinho, uma prova completa de `RiemannHypothesis`.

## Livro-caixa exato da rota de boletos

O alvo operacional e:

```lean
C2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserveBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Ele e equivalente, no Lean, ao alvo de pagamento limpo:

```lean
C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBoundOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Forma de caixa:

```text
D(s) + G(s) <= (3 / 4) * Q(s)
```

Onde:

```lean
Q =
  c2ExactGapAnchorCanonicalClearedMargin s

D =
  c2ExactGapAnchorCanonicalClearedExternalDebit
    K M horizontalConstant horizontalScale horizontalRatio s

G =
  c2ExactGapAnchorCanonicalClearedLowerFactorCost s
```

Interpretacao:

```text
caixa limpo Q
  paga boleto externo D
  paga lower-factor G
  e ainda deixa 1/4 de Q reservado
```

## Boletos pagos em Lean

### 1. Near-axis e edge vazio da regiao publica

Pago em Lean:

```lean
C2.PeerReview.canonicalNearAxisData
C2.PeerReview.canonicalEdgeData
C2.PeerReview.CurrentMiddleRegion
```

Leitura: a regiao middle publica esta definida pela near-axis canonica vinda
da continuacao genuine e pelo edge vazio.

### 2. Endpoint local quarter-unit

Pago em Lean:

```lean
C2.PeerReview.QuarterUnitMiddleCertificate.nonvanishing
C2.PeerReview.genuineCentral_ne_zero_of_quarterUnitMiddleCertificate
```

Leitura: se fornecermos `scale`, `horizontal` e `quarterUnit`, Lean entrega
`genuineCentralDoubleSeries s != 0` em todo ponto da middle publica.

### 3. Equivalencias da contabilidade

Pago em Lean:

```lean
C2.PeerReview.PrototypeClearedTotalMiddleObligation_iff_componentSumMiddleObligation
C2.PeerReview.PrototypeComponentSumMiddleObligation_iff_lowerFactorAfterCutoffSlack
C2.PeerReview.PrototypeClearedTotalMiddleObligation_iff_lowerFactorAfterCutoffSlack
C2.PeerReview.ExactComponentSurplusReserveMiddleObligation_iff_prototypeClearedTotalMiddleObligation
```

Leitura: as varias formas do livro-caixa sao reescritas formais do mesmo
problema, nao rotas matematicamente diferentes.

### 4. Wrappers para sair dos boletos ate nao-anulamento

Pago em Lean:

```lean
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalQuarterUnitReserve
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypeSurplusReserve
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypeClearedTotalBound
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalPrototypePressureComponentSumBound
```

Leitura: a cadeia logica do caixa ate `genuineCentralDoubleSeries s != 0` ja
existe. O que falta e provar o pagamento global dos boletos.

### 5. Geometria vertical finita genuine

Pago em Lean:

```lean
GenuineMiddleAudit.verticalQuartetPrefix_ne_zero_of_re_pos
GenuineMiddleAudit.rectangularDepthFactor_five_ne_zero_of_re_pos
GenuineMiddleAudit.weightedQuartetPrefix_ne_zero_of_re_pos
GenuineMiddleAudit.rectangularGenuine_five_one_ne_zero_of_re_pos
GenuineMiddleAudit.rectangularGenuine_five_three_ne_zero_of_re_pos
GenuineMiddleAudit.rectangularGenuine_three_ne_zero_of_re_pos
```

Leitura: a geometria vertical finita e os blocos genuine pequenos nao sao o
gargalo atual.

### 6. Lower envelopes finitos

Pago em Lean:

```lean
GenuineMiddleAudit.finiteDepthVerticalNormLower
GenuineMiddleAudit.rectangularDepthFactor_norm_lower_bound_of_re_pos
GenuineMiddleAudit.rectangularGenuine_three_norm_lower_bound_of_re_pos
```

Leitura: existe piso formal para blocos finitos raw, util para comparar
cutoff regularizado contra objeto raw.

### 7. Ponte supergaussiana finita para raw

Pago em Lean:

```lean
GenuineMiddleAudit.superGaussianFiniteGenuineRectangle_ne_zero_of_cutoffResidual_lt_raw
GenuineMiddleAudit.superGaussianFiniteGenuineRectangle_three_ne_zero_of_cutoffResidual_lt_uniformRaw
GenuineMiddleAudit.superGaussianFiniteGenuineCutoffResidualNormUpper_le_algebraicUpper
```

Leitura: o Lean ja sabe transformar um residual de cutoff pequeno em
nao-cancelamento finito supergaussiano.

### 8. Perfil dyadic64 two-core

Pago em Lean:

```lean
GenuineMiddleAudit.superGaussianFiniteGenuineRectangle_three_ne_zero_of_reciprocalDyadic64
GenuineMiddleAudit.superGaussianFiniteGenuineRectangle_three_nonvanishingOn_reciprocalDyadic64
GenuineMiddleAudit.no_zero_superGaussianFiniteGenuineRectangle_three_at_reciprocalDyadic64
```

Leitura: existe um regime finito genuine certificado para o two-core
supergaussiano com cutoff grande explicito.

### 9. Rota adjusted quartet condicional

Pago em Lean:

```lean
AdjustedQuartetAudit.ClosureInputs.offCriticalNonvanishing
AdjustedQuartetAudit.ClosureInputs.riemannHypothesis
AdjustedQuartetAudit.ClosureInputs.residual_eq_zero
```

Leitura: se um `AdjustedQuartetAudit.ClosureInputs` for construido, a rota
entrega a conclusao. O que nao esta pago e construir esse pacote.

### 10. Barreiras formais

Pago em Lean:

```lean
not_c2CanonicalClosedScaledLocalData_of_offCriticalStrip
AuditMiddleBarrier.audit_CanonicalMiddleObligation_forces_middle_empty
AdjustedQuartetAudit.canonicalClosedScaledLocalData_impossible
not_constantCoreTriangleResidualUpper_lt_allowanceReserve
not_C2GenuineOddAnchorLocalData
```

Leitura: essas provas impedem voltar para formulacoes que ja foram barradas.

## Pago numericamente, nao pago em Lean

Arquivo de diagnostico principal:

```text
audit_outputs/c2_middle_ledger_high_conf_super_p2_x10661_K16_M12001_target_super_ref17_defect_refined.csv
```

Resultado importante:

```text
cutoff_pressure_ratio ~= 1.8e-8
```

Leitura: o cutoff que parecia enorme era em grande parte artefato de comparar
alvo cru contra referencia supergaussiana. Quando alvo e referencia foram
alinhados, o cutoff quase sumiu.

Isso ainda nao e prova Lean. E diagnostico para guiar a formalizacao.

## Nao pago

### 1. O certificado quarter-unit global

Ainda nao temos um habitante de:

```lean
C2.PeerReview.QuarterUnitMiddleCertificate
```

Nem, isoladamente, uma prova global de:

```lean
C2.PeerReview.QuarterUnitMiddleObligation
```

O boleto que falta na linguagem do livro-caixa e:

```text
D + G <= (3 / 4) * Q
```

na middle inteira.

### 2. Campos `scale` e `horizontal` para um perfil concreto

O certificado publico exige:

```lean
C2ExpandedScalarScaleData
C2ExpandedHorizontalLayerBudget
```

Nao tratar esses campos como automaticamente pagos no mapa. Eles sao campos
obrigatorios do certificado; quando escolhermos um perfil concreto, precisamos
apontar a prova Lean correspondente.

### 3. Dominancia adjusted quartet

Ainda nao temos:

```lean
AdjustedQuartetAudit.PointwiseBounds.dominance
```

nem um pacote:

```lean
AdjustedQuartetAudit.ClosureInputs
```

Leitura: a rota adjusted quartet e uma frente valida, mas ainda condicional.

### 4. Prova final de RH pela frente atual

O certificado quarter-unit publico entrega nao-anulamento no middle, nao
`RiemannHypothesis` diretamente. A montagem terminal completa precisa de todos
os pacotes de cobertura/transferencia apropriados.

## Diagnostico que mudou o horizonte

Rodada refinada:

```text
target-reference-mode = supergaussian
reference-mode        = supergaussian
reference-X           = 10661
reference-p           = 2
K                     = 16
M                     = 12001
check/ref             = 17, 16001
```

Resultados:

```text
cutoff_pressure_ratio       ~= 1.8e-8
worst_defect_anchor_ratio   ~= 143.44 em t = 1
melhor caso fiel testado    ~= 49.46
caso artificial pequeno     ~= 2.58
```

Conclusao rigorosa:

```text
o cutoff foi diagnosticado como nao sendo o gargalo principal;
o anchor/lower-factor continua muito acima do orcamento;
apenas aumentar cortes nao deve fechar a rota de boletos.
```

Consequencia:

```text
a rota quarter-unit continua sendo o mapa formal dos boletos,
mas nao e a frente numericamente promissora sem uma nova ideia de fase/gap.
```

## Frente adjusted quartet auditada

Frente investigada depois do diagnostico da rota de boletos:

```text
adjusted quartet / margem oscilatoria
```

Arquivo:

```text
LeanC2/AuditAdjustedQuartetRoute.lean
```

Pacote condicional:

```lean
AdjustedQuartetAudit.ClosureInputs
```

Campo matematico principal:

```lean
AdjustedQuartetAudit.PointwiseBounds.dominance
```

Forma:

```lean
c2ConcreteAntiMiracleAdjustedMain
  - c2ConcreteAntiMiracleAdjustedDefect
  - c2ConcreteAntiMiracleAdjustedTailScaledUpper > 0
```

Leitura:

```text
main - defect - tail > 0
```

Status formal:

```text
reducao condicional em Lean;
dominance ainda aberto.
```

O avaliador numerico genuine-first foi criado em:

```text
operadores/c2_adjusted_quartet_evaluator.py
```

Ele mede a decomposicao finita:

```text
main - defect - tail_upper
```

com:

```text
main = |(q^2 + c2OddTailBalancingSeed) * verticalQuartetPrefix(q)|
defect = sum_{j=0}^3 |c2ConcreteOddHorizontalLayerDefect j|
tail_upper = vertical_tail + tilt_tail + horizontal_tail + cutoff_budget
```

Resultados principais em 2026-07-08:

```text
K=16, M=12001, ref=(17,16001), supergaussian X=10661 p=2
arquivo:
  audit_outputs/c2_adjusted_quartet_eval_super_K16_M12001_ref17x16001_dt025.csv
resultado:
  120 falhas em 161 pontos
  pior surplus ~= -1.303913 em t=12.25
  cutoff ~= 5e-10, logo nao era o gargalo
```

Refinamento local:

```text
arquivo:
  audit_outputs/c2_adjusted_quartet_eval_super_K16_M12001_ref17x16001_t11p5_13_dt0001.csv
resultado:
  pior surplus ~= -1.307692 em t=12.237
  main ~= 0.659335
  defect ~= 1.911235
  tail ~= 0.055792
```

Teste com target cru formal:

```text
arquivo:
  audit_outputs/c2_adjusted_quartet_eval_rawtarget_K16_M12001_ref17x16001_dt025.csv
resultado:
  pior surplus ~= -1.330472 em t=11.5
  cutoff max ~= 1.825028
```

Teste com cortes maiores:

```text
K=17, M=16001, ref=(18,24001), supergaussian X=10661 p=2
arquivo:
  audit_outputs/c2_adjusted_quartet_eval_super_K17_M16001_ref18x24001_dt025.csv
resultado:
  127 falhas em 161 pontos
  pior surplus ~= -1.278229 em t=12.5
```

Controle artificial com defeito horizontal zerado:

```text
arquivo:
  audit_outputs/c2_adjusted_quartet_eval_super_K17_M16001_ref18x24001_deltazero_dt025.csv
resultado:
  ainda falha em t=25 e t=48
```

Refinamentos desses vales:

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

Leitura corrigida:

```text
a reducao adjusted quartet continua formalmente viva como pacote condicional,
mas o certificado direto global main - defect - tail > 0 nao e promissor
na forma testada.
```

Motivo:

```text
1. com referencia odd realista, o defeito horizontal domina;
2. mesmo zerando artificialmente o defeito horizontal, o adjusted main tem
   vales de fase perto de t ~= 25.011 e t ~= 48.005 que ficam abaixo da cauda.
```

Proximo passo tecnico, se esta frente voltar:

```text
nao insistir apenas em aumentar cortes;
precisa de nova ideia de fase/decomposicao/localizacao para proteger os vales
do adjusted main, ou abandonar esse certificado direto como rota principal.
```

## Rotas vivas auxiliares

### Supergaussiana / two-core / cortes finitos

Status:

```text
viva como suporte tecnico
```

Uso correto:

- escolher cortes confiaveis;
- aproximar operador genuine finito;
- testar estabilidade de regularizadores;
- orientar bounds antes da formalizacao.

Limite:

```text
nao fecha a middle sozinha.
```

### Rota geometrica branch / tilt / quartet / half-disk

Status:

```text
orientacao ativa apos o diagnostico do center Gaussian tilt
```

Documento principal:

```text
ROTA_GEOMETRICA_BRANCH_TILT_QUARTET_MIDDLE.md
AUDIT_TILT_AWARE_MIDDLE_LEDGER_EXPERIMENT.md
```

Tese:

```text
o 1/2 e o mesmo invariante geometrico em branch barrier, tilt/bracket e
quartet/half-disk. O center Gaussian tilt continua como laboratorio, mas a
rota formal preferida e usar branch/tilt para pagar o upper residual do
quartet/half-disk.
```

Pecas Lean ja alinhadas:

```text
LeanC2/Operators/BranchBarrier.lean
LeanC2/Operators/Tilt.lean
LeanC2/Operators/CenterGaussianTilt.lean
LeanC2/AuditGenuineMiddle.lean
LeanC2/AuditAdjustedQuartetRoute.lean
```

Proximo calculo recomendado:

```text
scanner de perfil em V:
  min_abs(sigma,t) vs |sigma-1/2|,
  branch_defect,
  normalizedTiltCurvature,
  half-disk distance quando disponivel.

comparar tres ledgers no mesmo grid:
  1. sem tilt explicito;
  2. tilt como boleto norm-only;
  3. tilt orientado/coletado no principal.
```

Frase-guia:

```text
O tilt e a curvatura transversal do middle. Se entra so como modulo, vira
imposto; se entra como geometria orientada, pode virar margem.
```

Resultado experimental atual:

```text
center Gaussian core:
  norm-only falha forte;
  oriented passa e melhora a margem em todos os pontos para sigma >= 0.737.

adjusted quartet positive-box:
  norm-only reduz margem;
  oriented depende da parametrizacao e fica quase uniformemente melhor em
  sigma=0.86, mas ainda precisa calibragem no pacote adjusted.
```

### C2 center Gaussian / livro-caixa com tilt

Status:

```text
laboratorio empirico da rota geometrica
```

Uso correto:

- estudar o operador center Gaussian intrinsic:
  C_X(s) = sum 2*2^(-k)*c^(-s)*exp(-(c/X)^2), c=2^k*m;
- medir livro-caixa por blocos geometricos: depth, core, center;
- testar a insercao do tilt sem comparacao externa;
- orientar a moeda branch/tilt/half-disk antes da formalizacao.

Peca Lean ja paga para o tilt:

```text
LeanC2/Operators/Tilt.lean
LeanC2/Operators/CenterGaussianTilt.lean
LeanC2/Route/BulkAntiMiracleTilt.lean
```

Conteudo pago:

```text
tiltBracket delta c =
  (c - 1)^(-delta) + (c + 1)^(-delta) - 2*c^(-delta)

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
```

Leitura formal:

```text
o bracket centrado do tilt zera exatamente em delta=0 e tem sinal correto
fora da linha critica, para a faixa delta > -1 e centro c > 1.
A normalizacao usada pelo scanner tambem preserva sinal e zeros porque e o
tiltBracket multiplicado por c^(delta+2), que e positivo para c > 0.
O fator perturbativo 1 + lambda*normalizedTiltCurvature fica igual a 1 na
linha critica, fica acima de 1 para delta>0 e lambda>0, fica abaixo de 1 para
-1<delta<0 e lambda>0, e preserva a decomposicao finita por blocos via filtros.
```

Avaliador:

```text
operadores/c2_center_gaussian_ledger.py
```

Audit de boletos Lean extraidos da validacao numerica:

```text
AUDIT_C2_CENTER_GAUSSIAN_TILT_LEDGER_BOLETOS_LEAN.md
```

Leitura operacional:

```text
o alvo formal inicial recomendado e sigma=0.750, porque a margem core observada
fica na escala 6e-3. Depois repetir para sigma=0.740, onde a margem core cai
para a escala 1.6e-3. Sigma=0.737 passa no grid, mas e fino demais para ser o
primeiro fechamento formal.
```

Resultados atuais:

```text
nmax=200000, bg_kmax=12, X=nmax/3, core_main=401, C0=1.5X
t in [13.8,14.5], dt=0.001

sem tilt:
  sigma=0.740: worst core surplus ~= -1.468e-4

com transverse-curvature, lambda=1:
  sigma=0.737: worst core surplus ~= +4.938e-5
  sigma=0.740: worst core surplus ~= +1.598e-3
```

Limite:

```text
a curvatura do tilt esta provada, mas ainda nao ha prova formal de dominancia
do operador center Gaussian inclinado. O modo `transverse-curvature` e guia
numerico/reescala; o objeto Lean canonico bruto e `tiltBracket`.
```

### Positive-box / q-ratio / vSplit / scanners

Status:

```text
laboratorio vivo
```

Uso correto:

- procurar regioes dificeis;
- descobrir fase/cancelamento;
- melhorar horizontal ratio;
- sugerir decomposicoes.

Limite:

```text
nao e prova final sem certificado Lean/intervalar.
```

## Rotas mortas ou aposentadas

### Canonical closed scaled direto

Status:

```text
morto formalmente na formulacao atual
```

Nomes:

```lean
C2CanonicalClosedScaledLocalData
C2.PeerReview.CanonicalMiddleObligation
C2.PeerReview.ContinuationTerminalCertificate
```

Motivo:

```text
Lean mostra que esse alvo forca a middle a ficar vazia.
```

Evidencia:

```lean
AuditMiddleBarrier.audit_CanonicalMiddleObligation_forces_middle_empty
AuditMiddleBarrier.audit_ContinuationTerminalCertificate_forces_middle_empty
```

### Residual FiniteExactZeta / zeta upper

Status:

```text
fora da rota ativa
```

Motivo:

- viola a disciplina Genuine-First se usado como insumo da middle;
- pertence a rotas antigas/terminais/diagnosticas.

### Triangle residual shortcut

Status:

```text
morto como atalho
```

Motivo:

```text
triangular tudo separado perde cancelamento e estoura o caixa.
```

Evidencia:

```lean
not_constantCoreTriangleResidualUpper_lt_allowanceReserve
```

### Odd-anchor norm-only

Status:

```text
morto
```

Motivo:

```text
o upper norm-only do tipo 1 + 2 * oddUpper e grande demais.
```

Evidencia:

```lean
not_C2GenuineOddAnchorLocalData
```

### PositiveBox phase-cutoff triangular

Status:

```text
morto formalmente para aquela formulacao
```

Motivo:

```text
o termo de depth-cutoff sozinho passa do budget.
```

### q-ratio sozinho

Status:

```text
insuficiente
```

Motivo:

```text
melhora horizontal, mas nao fecha middle sozinho.
```

### Bracket-decay como telescopia direta

Status:

```text
morto como atalho
```

Motivo:

```text
a bridge correction contem massa bulk nao telescopica.
```

### Continued-channel factor como prova middle

Status:

```text
diagnostico/transfer-side, nao insumo da proof middle ativa
```

Motivo:

```text
abrir o canal continued pela definicao terminal tira a prova da disciplina
Genuine-First.
```

## Decisao operacional

Para nao se perder:

```text
1. Se o assunto for "boletos", a rota formal e quarter-unit:
   D + G <= 3/4 Q.

2. A frente adjusted quartet foi auditada:
   main - defect - tail > 0 e uma reducao condicional valida,
   mas falhou numericamente como certificado direto global na forma testada.

3. Nao chamar a canonical closed scaled direta de rota viva.

4. Nao usar zeta para estimar middle.

5. Nao declarar o cutoff formalmente pago; ele esta pago numericamente,
   aguardando formalizacao se essa frente voltar a ser usada.

6. Nao insistir so em aumentar cortes no adjusted quartet direto; os testes
   apontam defeito horizontal grande e vales de fase do main.
```

## Frase para recuperar o fio

```text
O mapa formal dos boletos e a rota exact-gap/quarter-unit:
D + G <= 3/4 Q, que via PeerReview.QuarterUnitMiddleCertificate entrega
genuineCentralDoubleSeries != 0 no middle. Esse encanamento esta pago em Lean,
mas o quarterUnit global nao esta. O diagnostico da rota de boletos mostrou
cutoff pequeno e anchor/lower-factor caro. A frente adjusted quartet tambem
foi auditada: main - defect - tail > 0 e formalmente condicional, mas falhou
numericamente como certificado direto global por defeito horizontal grande e
vales de fase do main. O proximo passo precisa de nova ideia de fase,
decomposicao local ou outra rota genuine-first, sem usar zeta.
```
