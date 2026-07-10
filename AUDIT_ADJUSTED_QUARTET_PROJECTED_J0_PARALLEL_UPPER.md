# Audit Adjusted Quartet Projected J0 Parallel Upper

Data: 2026-07-08.

Rota: Genuine-First. Esta camada prepara a majoracao formal de
`destructiveParallel(M,D0)` por uma cota `parallelUpper`, sem provar ainda uma
cota analitica concreta e sem fechar o middle.

## Arquivo Lean

Criado:

```text
LeanC2/AuditAdjustedQuartetProjectedJ0ParallelUpper.lean
```

Import:

```lean
import LeanC2.AuditAdjustedQuartetProjectedJ0BoundedLedger
```

Namespace:

```lean
C2.AdjustedQuartetProjectedJ0Aliases
```

## Numerador projetivo

Definicao criada:

```lean
noncomputable def destructiveNumerator (M D : ℂ) : ℝ :=
  max 0 (-(D * starRingEnd ℂ M).re)
```

Lemas que compilam:

```lean
theorem destructiveParallel_eq_destructiveNumerator_div_norm
    (M D : ℂ) (hM : M ≠ 0) :
    destructiveParallel M D =
      destructiveNumerator M D / ‖M‖

theorem destructiveParallel_le_of_destructiveNumerator_le
    (M D : ℂ) (U : ℝ) (hM : M ≠ 0)
    (hU : destructiveNumerator M D ≤ U * ‖M‖)
    (hUnonneg : 0 ≤ U) :
    destructiveParallel M D ≤ U
```

Leitura: bounds futuros podem certificar primeiro o numerador
`max 0 (-(D * conj M).re)` e converter depois para a moeda `parallelUpper`.

## Fallback por norma

Lemas que compilam:

```lean
theorem destructiveNumerator_le_norm_mul_norm
    (M D : ℂ) :
    destructiveNumerator M D ≤ ‖D‖ * ‖M‖

theorem destructiveParallel_le_norm
    (M D : ℂ) (hM : M ≠ 0) :
    destructiveParallel M D ≤ ‖D‖

theorem adjustedProjectedJ0_parallelCost_le_D0_norm
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (s : ℂ)
    (hM : adjustedProjectedJ0_M tiltSeed s ≠ 0) :
    adjustedProjectedJ0_parallelCost tiltSeed coreCutoff s ≤
      ‖adjustedProjectedJ0_D0 coreCutoff s‖
```

Aviso: este fallback por `‖D0‖` nao e a rota principal. Ele existe para manter
uma porta conservadora e comparar com a contabilidade antiga, mas a frente ativa
continua sendo phase/projection-aware.

## Estruturas de upper

Estrutura direta:

```lean
structure ProjectedJ0ParallelUpperData
```

Campos:

```text
main_ne_zero :
  ∀ s ∈ Region, adjustedProjectedJ0_M tiltSeed s ≠ 0

upper :
  ∀ s ∈ Region,
    adjustedProjectedJ0_parallelCost tiltSeed coreCutoff s ≤ parallelUpper s
```

Estrutura via numerador:

```lean
structure ProjectedJ0ParallelNumeratorUpperData
```

Campos:

```text
main_ne_zero
numerator_upper
convert
parallel_nonneg
```

Conversor que compila:

```lean
theorem ProjectedJ0ParallelNumeratorUpperData.toParallelUpperData
```

Ele transforma dados de numerador em `ProjectedJ0ParallelUpperData`.

## Consumidor regional

Estrutura finite criada:

```lean
structure AdjustedProjectedJ0FiniteBoundedData
```

Ela combina:

```text
parallel : ProjectedJ0ParallelUpperData ...
rest     : adjustedProjectedJ0_restCostFinite ... ≤ restUpper
budget   : 0 < adjustedProjectedJ0_projectedFiniteSurplusLower ...
```

Consumidor que compila:

```lean
theorem AdjustedProjectedJ0FiniteBoundedData.total_ne_zero
```

Forma:

```text
∀ s ∈ Region,
  adjustedProjectedJ0_totalFinite tiltSeed coreCutoff K M s ≠ 0
```

Tambem foi criada a versao analoga para o adjusted quartet:

```lean
structure AdjustedProjectedJ0QuartetBoundedData

theorem AdjustedProjectedJ0QuartetBoundedData.total_ne_zero
```

## Proximo passo

Construir um `numeratorUpper` ou `parallelUpper` realmente fino para `D0`,
usando geometria branch/tilt/half-disk, atlas de fase por caixas, ou certificado
intervalar. O alvo natural e majorar:

```text
max 0 (-(adjustedProjectedJ0_D0 coreCutoff s
  * conj (adjustedProjectedJ0_M tiltSeed s)).re)
```

e converter por:

```text
numeratorUpper(s) ≤ parallelUpper(s) * ‖adjustedProjectedJ0_M tiltSeed s‖
```

## Verificacao

Comando:

```bash
lake env lean LeanC2/AuditAdjustedQuartetProjectedJ0ParallelUpper.lean
```

Resultado:

```text
compila sem erros
```

Comando:

```bash
lake build LeanC2.AuditAdjustedQuartetProjectedJ0ParallelUpper
```

Resultado:

```text
build concluido com sucesso
```

Higiene esperada:

```bash
rg -n "sorry|admit|axiom|unsafe|riemannZeta|ExactZeta|zetaUpper|zetaDepthCore|\bzeta\b|formula explicita|equacao funcional" \
  LeanC2/AuditAdjustedQuartetProjectedJ0ParallelUpper.lean \
  AUDIT_ADJUSTED_QUARTET_PROJECTED_J0_PARALLEL_UPPER.md
```

Resultado: os termos proibidos apareceram apenas na linha do comando de higiene
neste markdown. O arquivo Lean nao contem esses termos.
