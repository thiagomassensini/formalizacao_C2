# Audit Adjusted Quartet Projected J0 Exact Ledger

Data: 2026-07-08.

Rota: Genuine-First. Esta camada cria o ledger projetivo `j0` com custos exatos
pointwise. Ela prova que surplus exato positivo implica nao-anulamento, mas nao
prova que esse surplus e positivo em nenhuma regiao analitica.

## Arquivo Lean

Criado:

```text
LeanC2/AuditAdjustedQuartetProjectedJ0ExactLedger.lean
```

Import:

```lean
import LeanC2.AuditAdjustedQuartetProjectedJ0Aliases
```

Namespace:

```lean
C2.AdjustedQuartetProjectedJ0Aliases
```

## Custos exatos criados

### Custo projetivo da camada dominante

```lean
noncomputable def adjustedProjectedJ0_parallelCost
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (s : ℂ) : ℝ
```

Definido como:

```text
destructiveParallel M D0
```

### Resto combinado

```lean
noncomputable def adjustedProjectedJ0_restCostQuartet
    (coreCutoff : ℕ → ℕ) (s : ℂ) : ℝ

noncomputable def adjustedProjectedJ0_restCostFinite
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (K M : ℕ) (s : ℂ) : ℝ
```

O quartet usa:

```text
‖Drest + 0‖
```

O finite model usa:

```text
‖Drest + RvecTail‖
```

### Resto separado

```lean
noncomputable def adjustedProjectedJ0_separateRestCostQuartet
    (coreCutoff : ℕ → ℕ) (s : ℂ) : ℝ

noncomputable def adjustedProjectedJ0_separateRestCostFinite
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (K M : ℕ) (s : ℂ) : ℝ
```

O quartet usa:

```text
‖Drest‖ + ‖0‖
```

O finite model usa:

```text
‖Drest‖ + ‖RvecTail‖
```

## Surplus exato criado

```lean
noncomputable def adjustedProjectedJ0_projectedQuartetSurplus

noncomputable def adjustedProjectedJ0_projectedFiniteSurplus

noncomputable def adjustedProjectedJ0_projectedQuartetSeparateSurplus

noncomputable def adjustedProjectedJ0_projectedFiniteSeparateSurplus
```

Forma comum:

```text
‖M‖ - parallelCost - restCost
```

## Nao negatividade dos custos

Lemas que compilam:

```lean
theorem destructiveParallel_nonneg (M D : ℂ) :
    0 ≤ destructiveParallel M D

theorem adjustedProjectedJ0_parallelCost_nonneg

theorem adjustedProjectedJ0_restCostQuartet_nonneg

theorem adjustedProjectedJ0_restCostFinite_nonneg

theorem adjustedProjectedJ0_separateRestCostQuartet_nonneg

theorem adjustedProjectedJ0_separateRestCostFinite_nonneg
```

## Remocao da hipotese explicita `hM`

Foi possivel remover `hM` dos consumidores exact/no-loss.

Lemas que derivam `M ≠ 0` de surplus positivo:

```lean
theorem adjustedProjectedJ0_M_ne_zero_of_projectedQuartetSurplus_pos

theorem adjustedProjectedJ0_M_ne_zero_of_projectedFiniteSurplus_pos

theorem adjustedProjectedJ0_M_ne_zero_of_projectedQuartetSeparateSurplus_pos

theorem adjustedProjectedJ0_M_ne_zero_of_projectedFiniteSeparateSurplus_pos
```

A razao e puramente real: se `M = 0`, entao `‖M‖ = 0`; como os custos sao
nao negativos, o surplus fica `≤ 0`, contradizendo surplus positivo.

## Consumidores por surplus positivo

### Quartet

```lean
theorem adjustedProjectedJ0_totalQuartet_ne_zero_of_projectedSurplus_pos
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (s : ℂ)
    (hSurplus :
      0 < adjustedProjectedJ0_projectedQuartetSurplus tiltSeed coreCutoff s) :
    adjustedProjectedJ0_totalQuartet tiltSeed coreCutoff s ≠ 0
```

### Finite model

```lean
theorem adjustedProjectedJ0_totalFinite_ne_zero_of_projectedSurplus_pos
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (K M : ℕ) (s : ℂ)
    (hSurplus :
      0 < adjustedProjectedJ0_projectedFiniteSurplus tiltSeed coreCutoff K M s) :
    adjustedProjectedJ0_totalFinite tiltSeed coreCutoff K M s ≠ 0
```

### Variantes separadas

Tambem compilam:

```lean
theorem adjustedProjectedJ0_totalQuartet_ne_zero_of_projectedSeparateSurplus_pos

theorem adjustedProjectedJ0_totalFinite_ne_zero_of_projectedSeparateSurplus_pos
```

## Versoes por regiao

Definicoes:

```lean
def AdjustedProjectedJ0FiniteSurplusPositiveOnRegion

def AdjustedProjectedJ0QuartetSurplusPositiveOnRegion
```

Teoremas:

```lean
theorem adjustedProjectedJ0_totalFinite_ne_zero_on_region_of_projectedSurplus

theorem adjustedProjectedJ0_totalQuartet_ne_zero_on_region_of_projectedSurplus
```

## Combined rest versus separate rest

O custo combinado usa a geometria complexa do pacote inteiro:

```text
‖Drest + RvecTail‖
```

O custo separado paga por desigualdade triangular:

```text
‖Drest‖ + ‖RvecTail‖
```

O combinado e mais fino; o separado e mais facil de alimentar com uppers
independentes. Em ambos os casos, `RvecTail : ℂ` continua sendo vetor complexo,
e `restUpper : ℝ` continua sendo cota real.

## Bounds ainda faltando

Esta camada nao prova:

1. positividade/lower do projected surplus em regioes reais;
2. upper efetivo para `destructiveParallel M D0`;
3. upper efetivo para `Drest + RvecTail`;
4. upper separado para `‖Drest‖ + ‖RvecTail‖`;
5. substituicao global de `PointwiseBounds.dominance`.

## Status

Esta camada nao fecha o middle, nao usa CSV como prova e nao cria insumo
analitico externo. Ela transforma o alvo local em uma obrigacao limpa:

```text
0 < ‖M‖ - destructiveParallel(M, D0) - restCost
------------------------------------------------
total ≠ 0
```
