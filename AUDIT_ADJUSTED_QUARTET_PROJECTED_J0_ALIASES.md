# Audit Adjusted Quartet Projected J0 Aliases

Data: 2026-07-08.

Rota: Genuine-First. Esta camada cria aliases Lean para os componentes reais do
adjusted quartet e prova apenas identidades algebricas pequenas. Ela nao prova
os bounds analiticos e nao fecha o middle.

## Arquivo Lean

Criado:

```text
LeanC2/AuditAdjustedQuartetProjectedJ0Aliases.lean
```

Imports:

```lean
import LeanC2.AuditAdjustedQuartetProjectedJ0RealMap
import LeanC2.Analytic.GenuineBulkConcrete
```

O arquivo nao importa `PeerReview`.

## Aliases criados

Todos estao no namespace:

```lean
C2.AdjustedQuartetProjectedJ0Aliases
```

Aliases complexos:

```lean
adjustedProjectedJ0_M
    (tiltSeed : ℂ → ℂ) (s : ℂ) : ℂ

adjustedProjectedJ0_D0
    (coreCutoff : ℕ → ℕ) (s : ℂ) : ℂ

adjustedProjectedJ0_D1
    (coreCutoff : ℕ → ℕ) (s : ℂ) : ℂ

adjustedProjectedJ0_D2
    (coreCutoff : ℕ → ℕ) (s : ℂ) : ℂ

adjustedProjectedJ0_D3
    (coreCutoff : ℕ → ℕ) (s : ℂ) : ℂ

adjustedProjectedJ0_Drest
    (coreCutoff : ℕ → ℕ) (s : ℂ) : ℂ

adjustedProjectedJ0_totalQuartet
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (s : ℂ) : ℂ

adjustedProjectedJ0_RvecTail
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (K M : ℕ) (s : ℂ) : ℂ

adjustedProjectedJ0_totalFinite
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (K M : ℕ) (s : ℂ) : ℂ
```

Definicoes operacionais:

```text
M      = adjusted amplitude * verticalQuartetPrefix(adjusted ratio)
D0     = adjusted horizontal error E0
Drest  = E1 + E2 + E3
Rvec   = adjusted tail complex vector
```

## Identidades provadas

### Adjusted quartet

```lean
theorem adjustedProjectedJ0_totalQuartet_eq
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (s : ℂ) :
    adjustedProjectedJ0_totalQuartet tiltSeed coreCutoff s =
      adjustedProjectedJ0_M tiltSeed s +
        adjustedProjectedJ0_D0 coreCutoff s +
        adjustedProjectedJ0_Drest coreCutoff s
```

Esta prova usa `c2ConcreteAntiMiracleAdjustedQuartet_eq_errorSplit` e a definicao
`verticalQuartetPrefix z = 1 + z + z^2 + z^3`.

### Finite model

```lean
theorem adjustedProjectedJ0_totalFinite_eq
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (K M : ℕ) (s : ℂ) :
    adjustedProjectedJ0_totalFinite tiltSeed coreCutoff K M s =
      adjustedProjectedJ0_M tiltSeed s +
        adjustedProjectedJ0_D0 coreCutoff s +
        adjustedProjectedJ0_Drest coreCutoff s +
        adjustedProjectedJ0_RvecTail tiltSeed coreCutoff K M s
```

Esta prova usa `c2ConcreteAntiMiracleFiniteModel_eq_adjustedQuartet_add_tail` e
a identidade do quartet acima.

## Consumidores pointwise

### Quartet, resto combinado

```lean
theorem adjustedProjectedJ0_totalQuartet_ne_zero_of_projected_bounds
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (s : ℂ)
    (mainLower parallelUpper restUpper : ℝ)
    (hM : adjustedProjectedJ0_M tiltSeed s ≠ 0)
    (hMain : mainLower ≤ ‖adjustedProjectedJ0_M tiltSeed s‖)
    (hParallel :
      destructiveParallel
        (adjustedProjectedJ0_M tiltSeed s)
        (adjustedProjectedJ0_D0 coreCutoff s)
        ≤ parallelUpper)
    (hRest :
      ‖adjustedProjectedJ0_Drest coreCutoff s + 0‖ ≤ restUpper)
    (hBudget : parallelUpper + restUpper < mainLower) :
    adjustedProjectedJ0_totalQuartet tiltSeed coreCutoff s ≠ 0
```

### Finite model, resto combinado

```lean
theorem adjustedProjectedJ0_totalFinite_ne_zero_of_projected_bounds
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (K M : ℕ) (s : ℂ)
    (mainLower parallelUpper restUpper : ℝ)
    (hM : adjustedProjectedJ0_M tiltSeed s ≠ 0)
    (hMain : mainLower ≤ ‖adjustedProjectedJ0_M tiltSeed s‖)
    (hParallel :
      destructiveParallel
        (adjustedProjectedJ0_M tiltSeed s)
        (adjustedProjectedJ0_D0 coreCutoff s)
        ≤ parallelUpper)
    (hRest :
      ‖adjustedProjectedJ0_Drest coreCutoff s
        + adjustedProjectedJ0_RvecTail tiltSeed coreCutoff K M s‖ ≤ restUpper)
    (hBudget : parallelUpper + restUpper < mainLower) :
    adjustedProjectedJ0_totalFinite tiltSeed coreCutoff K M s ≠ 0
```

### Variantes com resto separado

Tambem compilam:

```lean
theorem adjustedProjectedJ0_totalQuartet_ne_zero_of_projected_separate_bounds

theorem adjustedProjectedJ0_totalFinite_ne_zero_of_projected_separate_bounds
```

As variantes usam:

```text
‖Drest‖ + ‖0‖ ≤ restUpper
```

para o quartet, e:

```text
‖Drest‖ + ‖RvecTail‖ ≤ restUpper
```

para o finite model.

## Escolha de total

Foram mantidas duas formas:

1. `AdjustedQuartet`, com `Rvec = 0`.
2. `FiniteModel`, com `Rvec = adjustedProjectedJ0_RvecTail`.

Isso deixa claro que `RvecTail : ℂ` e um vetor complexo. Ele nao e a soma real
das cotas de tail/cutoff. Essas cotas pertencem a `restUpper : ℝ`.

## Bounds ainda faltando

Esta camada ainda nao construi:

1. `hM` e `mainLower`, isto e, nao-anulamento/lower do main seeded.
2. `parallelUpper` para `destructiveParallel M D0`.
3. `restUpper` para `Drest + RvecTail`, ou para a variante separada.
4. Uma substituicao global de `PointwiseBounds.dominance`.

## Status

Isto ainda nao fecha o middle e nao promove diagnostico numerico a prova. A
camada apenas conecta os objetos reais do adjusted quartet ao consumidor
projetivo pointwise.
