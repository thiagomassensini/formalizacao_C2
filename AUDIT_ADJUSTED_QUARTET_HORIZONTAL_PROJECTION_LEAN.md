# AUDIT_ADJUSTED_QUARTET_HORIZONTAL_PROJECTION_LEAN

Data: 2026-07-08

## Escopo

Criar uma camada Lean pequena, puramente vetorial, para substituir o pagamento
bruto do defeito horizontal por uma moeda radial/faseada.

Regra de ouro:

```text
Genuine-First. Nao usar zeta, riemannZeta, ExactZeta, zetaUpper, zetaDepthCore,
equacao funcional, formula explicita, comparacao externa com zeros, nem alturas
de zeros como input analitico.
```

Este arquivo nao fecha o middle e nao formaliza o adjusted quartet completo.
Ele apenas cria o livro-caixa vetorial que pode consumir depois o diagnostico
`j0`.

## Arquivo Lean

Criado:

```text
LeanC2/AuditAdjustedQuartetHorizontalProjection.lean
```

Import usado:

```lean
import Mathlib
```

O arquivo nao importa rotas terminais do projeto nem objetos analiticos C2. Os
vetores sao abstratos:

```lean
M D R D0 Drest : ℂ
```

## Definicoes

```lean
radialLoss M D := ‖M‖ - ‖M + D‖
radialLossPos M D := max 0 (radialLoss M D)

parallelCoord M D :=
  ((D * starRingEnd ℂ M).re) / ‖M‖

destructiveParallel M D :=
  max 0 (-(parallelCoord M D))
```

`parallelCoord` e `destructiveParallel` agora alimentam uma ponte formal entre
perda radial e custo projetivo destrutivo.

## Lemas Que Compilam

### 1. Lower apos defeito

```lean
theorem ne_zero_of_main_after_defect_lower
    (M D R : ℂ)
    (mainAfterDefectLower restUpper : ℝ)
    (hLower : mainAfterDefectLower ≤ ‖M + D‖)
    (hRest : ‖R‖ ≤ restUpper)
    (hBudget : restUpper < mainAfterDefectLower) :
    M + D + R ≠ 0
```

Este e o nucleo: se o main ja contaminado por `D` ainda domina o resto pago por
norma, nao ha cancelamento total.

### 2. Budget por perda radial assinada

```lean
theorem ne_zero_of_radialLoss_budget
    (M D R : ℂ)
    (mainLower radialUpper restUpper : ℝ)
    (hMain : mainLower ≤ ‖M‖)
    (hRadial : ‖M‖ - ‖M + D‖ ≤ radialUpper)
    (hRest : ‖R‖ ≤ restUpper)
    (hBudget : radialUpper + restUpper < mainLower) :
    M + D + R ≠ 0
```

Esta e a forma direta da moeda radial.

### 3. Budget por perda radial positiva

```lean
theorem ne_zero_of_radialLossPos_budget
    (M D R : ℂ)
    (mainLower radialUpper restUpper : ℝ)
    (hMain : mainLower ≤ ‖M‖)
    (hRadial : radialLossPos M D ≤ radialUpper)
    (hRest : ‖R‖ ≤ restUpper)
    (hBudget : radialUpper + restUpper < mainLower) :
    M + D + R ≠ 0
```

Esta forma evita que o consumidor futuro tenha que lidar com perda radial
negativa.

### 4. Lema consumidor direto do diagnostico `j0`

```lean
theorem ne_zero_of_projected_j0_and_rest
    (M D0 Drest R : ℂ)
    (mainLower radialUpper restUpper : ℝ)
    (hMain : mainLower ≤ ‖M‖)
    (hRadial : ‖M‖ - ‖M + D0‖ ≤ radialUpper)
    (hRest : ‖Drest + R‖ ≤ restUpper)
    (hBudget : radialUpper + restUpper < mainLower) :
    M + D0 + Drest + R ≠ 0
```

Este e o alvo que conversa diretamente com o achado numerico:

```text
j0 domina o horizontal_defect.
```

Ele permite pagar `D0` por perda radial/fase e pagar `Drest + R` por norma.

### 5. Variante com resto separado

```lean
theorem ne_zero_of_projected_j0_and_separate_rest
    (M D0 Drest R : ℂ)
    (mainLower radialUpper restUpper : ℝ)
    (hMain : mainLower ≤ ‖M‖)
    (hRadial : ‖M‖ - ‖M + D0‖ ≤ radialUpper)
    (hRest : ‖Drest‖ + ‖R‖ ≤ restUpper)
    (hBudget : radialUpper + restUpper < mainLower) :
    M + D0 + Drest + R ≠ 0
```

Esta variante usa a desigualdade triangular para transformar budgets separados
em um budget combinado.

## Ponte Projetiva Fechada

Novos lemas compilando:

```lean
theorem complex_re_le_norm (z : ℂ) : z.re ≤ ‖z‖

theorem mul_conj_re_eq_norm_mul_norm (M : ℂ) :
    (M * starRingEnd ℂ M).re = ‖M‖ * ‖M‖

theorem norm_add_ge_norm_add_parallelCoord
    (M D : ℂ) (hM : M ≠ 0) :
    ‖M‖ + parallelCoord M D ≤ ‖M + D‖

theorem radialLoss_le_neg_parallelCoord
    (M D : ℂ) (hM : M ≠ 0) :
    radialLoss M D ≤ -(parallelCoord M D)

theorem radialLoss_le_destructiveParallel
    (M D : ℂ) (hM : M ≠ 0) :
    radialLoss M D ≤ destructiveParallel M D
```

O alvo proposicional tambem foi fechado:

```lean
def projectionBridgeTarget (M D : ℂ) : Prop :=
  M ≠ 0 → radialLoss M D ≤ destructiveParallel M D

theorem projectionBridgeTarget_holds
    (M D : ℂ) :
    projectionBridgeTarget M D
```

### Ideia da prova geometrica

Para `M ≠ 0`, a prova evita criar uma direcao unitaria explicita e usa a
projecao nao normalizada:

```text
Re(((M + D) * conj M)) <= ‖(M + D) * conj M‖
                         = ‖M + D‖ * ‖M‖
```

Como `0 < ‖M‖`, divide-se por `‖M‖`. O termo de `M * conj M` vira
`‖M‖ * ‖M‖`, e o termo de `D * conj M` vira `parallelCoord M D`.

Resultado:

```text
‖M‖ + parallelCoord M D <= ‖M + D‖
```

Logo:

```text
radialLoss M D <= -parallelCoord M D
```

Depois separa-se por sinal de `parallelCoord M D`. Se ele e negativo, o custo
destrutivo e `-parallelCoord`. Se ele e positivo, a perda radial ja e
nao-positiva e `destructiveParallel = 0`.

## Consumidor Paralelo Para `j0`

Foi adicionado o consumidor direto da rota `j0`:

```lean
theorem ne_zero_of_projected_j0_and_rest_parallel
    (M D0 Drest R : ℂ)
    (mainLower parallelUpper restUpper : ℝ)
    (hM : M ≠ 0)
    (hMain : mainLower ≤ ‖M‖)
    (hParallel : destructiveParallel M D0 ≤ parallelUpper)
    (hRest : ‖Drest + R‖ ≤ restUpper)
    (hBudget : parallelUpper + restUpper < mainLower) :
    M + D0 + Drest + R ≠ 0
```

E a variante com resto separado:

```lean
theorem ne_zero_of_projected_j0_and_separate_rest_parallel
    (M D0 Drest R : ℂ)
    (mainLower parallelUpper restUpper : ℝ)
    (hM : M ≠ 0)
    (hMain : mainLower ≤ ‖M‖)
    (hParallel : destructiveParallel M D0 ≤ parallelUpper)
    (hRest : ‖Drest‖ + ‖R‖ ≤ restUpper)
    (hBudget : parallelUpper + restUpper < mainLower) :
    M + D0 + Drest + R ≠ 0
```

Este e o primeiro consumidor formal direto do diagnostico:

```text
D0 = j0 dominante pago por projecao;
Drest + R = resto pago por norma.
```

## Conexao Com O Adjusted Quartet

A moeda formal proposta agora e:

```text
main seeded
  > radial/projection cost of D0
    + norm cost of Drest
    + vertical_tail
    + horizontal_tail
    + tilt_tail_upper
    + cutoff_budget
```

Mapeamento futuro:

```text
M      := main_seeded_complex
D0     := primeira camada horizontal 2 * q^2 * horizontal_delta
Drest  := camadas j=1,2,3
R      := tails e cutoff pagos por norma
```

O arquivo atual nao formaliza `q`, seed, cutoff, nem as somas finitas. Ele so
entrega o livro-caixa vetorial que o adjusted quartet pode consumir depois.

## Verificacao

Comando:

```bash
lake env lean LeanC2/AuditAdjustedQuartetHorizontalProjection.lean
```

Resultado:

```text
compila sem erros
```

Higiene:

```bash
rg -n "sorry|admit|axiom|unsafe|riemannZeta|ExactZeta|zetaUpper|zetaDepthCore|\bzeta\b|formula explicita|equacao funcional" \
  LeanC2/AuditAdjustedQuartetHorizontalProjection.lean \
  AUDIT_ADJUSTED_QUARTET_HORIZONTAL_PROJECTION_LEAN.md
```

Os termos proibidos aparecem apenas neste markdown como guardrail. Nao ha uso
como insumo analitico.

## Proximo Obstaculo

O proximo passo nao e mais a ponte vetorial. Agora e plugar esta moeda no
adjusted quartet finito/formal:

```text
M      := main_seeded_complex
D0     := primeira camada horizontal
Drest  := camadas horizontais restantes
R      := vertical_tail + horizontal_tail + tilt_tail_upper + cutoff_budget
```

Ainda falta construir as cotas de `mainLower`, `parallelUpper` e `restUpper`
sem promover o CSV a prova. Este arquivo so fecha a algebra vetorial.
