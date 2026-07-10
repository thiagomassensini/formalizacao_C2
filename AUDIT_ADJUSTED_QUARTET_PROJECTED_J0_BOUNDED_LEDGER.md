# Audit Adjusted Quartet Projected J0 Bounded Ledger

Data: 2026-07-08.

Rota: Genuine-First. Esta camada transforma bounds pointwise futuros em surplus
exato positivo e, por consequencia, em nao-anulamento. Ela nao prova os bounds
`parallelUpper` nem `restUpper`.

## Arquivo Lean

Criado:

```text
LeanC2/AuditAdjustedQuartetProjectedJ0BoundedLedger.lean
```

Import:

```lean
import LeanC2.AuditAdjustedQuartetProjectedJ0ExactLedger
```

Namespace:

```lean
C2.AdjustedQuartetProjectedJ0Aliases
```

## Main exact lower

Definicao:

```lean
noncomputable def adjustedProjectedJ0_mainExactLower
    (tiltSeed : ℂ → ℂ) (s : ℂ) : ℝ :=
  c2ConcreteAntiMiracleAdjustedMain tiltSeed s
```

Teoremas:

```lean
theorem adjustedProjectedJ0_mainExactLower_eq_norm
    (tiltSeed : ℂ → ℂ) (s : ℂ) :
    adjustedProjectedJ0_mainExactLower tiltSeed s =
      ‖adjustedProjectedJ0_M tiltSeed s‖

theorem adjustedProjectedJ0_mainExactLower_le_norm
    (tiltSeed : ℂ → ℂ) (s : ℂ) :
    adjustedProjectedJ0_mainExactLower tiltSeed s ≤
      ‖adjustedProjectedJ0_M tiltSeed s‖
```

`adjustedProjectedJ0_mainExactLower_eq_norm` compila por `rfl`. Portanto o
`mainLower` desta camada e exact/no-loss.

## Bounded surplus lower

Criados:

```lean
noncomputable def adjustedProjectedJ0_projectedQuartetSurplusLower

noncomputable def adjustedProjectedJ0_projectedFiniteSurplusLower

noncomputable def adjustedProjectedJ0_projectedQuartetSeparateSurplusLower

noncomputable def adjustedProjectedJ0_projectedFiniteSeparateSurplusLower
```

Forma comum:

```text
mainExactLower - parallelUpper - restUpper
```

As assinaturas mantem `coreCutoff`, `K` e `M` onde isso ajuda a casar com as
obrigacoes futuras, mesmo quando o corpo do lower nao usa esses parametros.

## Ponte bounded -> exact surplus

Teoremas que compilam:

```lean
theorem adjustedProjectedJ0_projectedQuartetSurplus_pos_of_bounded

theorem adjustedProjectedJ0_projectedFiniteSurplus_pos_of_bounded

theorem adjustedProjectedJ0_projectedQuartetSeparateSurplus_pos_of_bounded

theorem adjustedProjectedJ0_projectedFiniteSeparateSurplus_pos_of_bounded
```

Forma operacional:

```text
parallelCost ≤ parallelUpper
restCost ≤ restUpper
0 < mainExactLower - parallelUpper - restUpper
------------------------------------------------
0 < exact projected surplus
```

## Consumidores bounded -> nonzero

Teoremas que compilam:

```lean
theorem adjustedProjectedJ0_totalQuartet_ne_zero_of_boundedProjectedSurplus

theorem adjustedProjectedJ0_totalFinite_ne_zero_of_boundedProjectedSurplus

theorem adjustedProjectedJ0_totalQuartet_ne_zero_of_boundedProjectedSeparateSurplus

theorem adjustedProjectedJ0_totalFinite_ne_zero_of_boundedProjectedSeparateSurplus
```

Eles encadeiam:

```text
bounded lower positivo
  -> exact surplus positivo
  -> total != 0
```

## Versoes por regiao

Obrigacoes por regiao:

```lean
def AdjustedProjectedJ0FiniteBoundedSurplusPositiveOnRegion

def AdjustedProjectedJ0QuartetBoundedSurplusPositiveOnRegion

def AdjustedProjectedJ0FiniteSeparateBoundedSurplusPositiveOnRegion

def AdjustedProjectedJ0QuartetSeparateBoundedSurplusPositiveOnRegion
```

Consumidores por regiao:

```lean
theorem adjustedProjectedJ0_totalFinite_ne_zero_on_region_of_boundedProjectedSurplus

theorem adjustedProjectedJ0_totalQuartet_ne_zero_on_region_of_boundedProjectedSurplus

theorem adjustedProjectedJ0_totalFinite_ne_zero_on_region_of_boundedProjectedSeparateSurplus

theorem adjustedProjectedJ0_totalQuartet_ne_zero_on_region_of_boundedProjectedSeparateSurplus
```

## Bounds ainda faltando

Esta camada ainda precisa receber de camadas futuras:

1. `parallelUpper` para `adjustedProjectedJ0_parallelCost`, isto e,
   `destructiveParallel M D0`;
2. `restUpper` combinado para `‖Drest + RvecTail‖`; ou
3. `restUpper` separado para `‖Drest‖ + ‖RvecTail‖`;
4. positividade regional do bounded surplus lower.

## Status

Esta camada nao fecha o middle. Ela apenas troca o alvo formal para:

```text
0 < mainExactLower - parallelUpper - restUpper
```

com `mainExactLower = ‖M‖` sem perda. Os proximos boletos sao bounds reais para
`parallelUpper` e `restUpper`, mantendo `RvecTail : ℂ` separado de qualquer
upper real.
