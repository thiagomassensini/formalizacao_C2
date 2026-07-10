# Audit Adjusted Quartet Projected J0 D0 Numerator Upper

Data: 2026-07-08.

Rota: Genuine-First. Esta camada formaliza o adapter pequeno entre bounds para
a parte real negativa de `D0 * conj M` e a moeda projetiva
`destructiveNumerator(M,D0)`. Ela nao prova um atlas intervalar, nao constroi
`restUpper` e nao fecha o middle.

## Arquivo Lean

Criado:

```text
LeanC2/AuditAdjustedQuartetProjectedJ0D0NumeratorUpper.lean
```

Import:

```lean
import LeanC2.AuditAdjustedQuartetProjectedJ0ParallelUpper
```

Namespace:

```lean
C2.AdjustedQuartetProjectedJ0Aliases
```

## D0 neg-real contra o main

Definicao criada:

```lean
noncomputable def adjustedProjectedJ0_D0NegReMain
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (s : ℂ) : ℝ :=
  -((adjustedProjectedJ0_D0 coreCutoff s *
      starRingEnd ℂ (adjustedProjectedJ0_M tiltSeed s)).re)
```

Esta e a quantidade real que um atlas de fase, certificado intervalar ou bound
geometrico deve majorar.

## Numerador destrutivo de D0

Definicao criada:

```lean
noncomputable def adjustedProjectedJ0_D0DestructiveNumerator
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (s : ℂ) : ℝ :=
  destructiveNumerator
    (adjustedProjectedJ0_M tiltSeed s)
    (adjustedProjectedJ0_D0 coreCutoff s)
```

Identidade que compila:

```lean
theorem adjustedProjectedJ0_D0DestructiveNumerator_eq_max
```

Forma:

```text
adjustedProjectedJ0_D0DestructiveNumerator =
  max 0 adjustedProjectedJ0_D0NegReMain
```

## Upper por parte real negativa

Lema generico que compila:

```lean
theorem destructiveNumerator_le_of_neg_re_le
    (M D : ℂ) (U : ℝ)
    (hU0 : 0 ≤ U)
    (hNeg : -((D * starRingEnd ℂ M).re) ≤ U) :
    destructiveNumerator M D ≤ U
```

Especializacao para `D0`:

```lean
theorem adjustedProjectedJ0_D0DestructiveNumerator_le_of_neg_re_le
```

Leitura: basta provar que a parte real negativa de `D0 * conj M` e menor que
`numeratorUpper`, com `numeratorUpper ≥ 0`, para obter upper do numerador
projetivo.

## Estrutura regional

Estrutura criada:

```lean
structure ProjectedJ0D0NegReUpperData
```

Campos:

```text
main_ne_zero
numerator_nonneg
neg_re_upper
convert
parallel_nonneg
```

O campo principal e:

```lean
neg_re_upper :
  ∀ s ∈ Region,
    adjustedProjectedJ0_D0NegReMain tiltSeed coreCutoff s ≤ numeratorUpper s
```

Conversores que compilam:

```lean
theorem ProjectedJ0D0NegReUpperData.toParallelNumeratorUpperData

theorem ProjectedJ0D0NegReUpperData.toParallelUpperData
```

Assim a nova estrutura alimenta diretamente:

```lean
ProjectedJ0ParallelUpperData tiltSeed coreCutoff parallelUpper Region
```

## Consumidores regionais

Finite model:

```lean
structure AdjustedProjectedJ0FiniteNegReBoundedData

theorem AdjustedProjectedJ0FiniteNegReBoundedData.total_ne_zero
```

Forma:

```text
parallel via D0 neg-real
restCostFinite ≤ restUpper
0 < projectedFiniteSurplusLower
------------------------------------------------
∀ s ∈ Region, totalFinite(s) ≠ 0
```

Adjusted quartet:

```lean
structure AdjustedProjectedJ0QuartetNegReBoundedData

theorem AdjustedProjectedJ0QuartetNegReBoundedData.total_ne_zero
```

As duas versoes deixam `restUpper` abstrato.

## Expansao leve de D0

Foi possivel fatorar `D0` sem theorem grande:

```lean
theorem adjustedProjectedJ0_D0_eq_expanded
    (coreCutoff : ℕ → ℕ) (s : ℂ) :
    adjustedProjectedJ0_D0 coreCutoff s =
      (2 : ℂ) * c2ConcreteAntiMiracleAdjustedRatio s ^ 2 *
        (rectangularOddCoreSum s (coreCutoff 0) - oddDirichletChannel s)
```

Tambem compila:

```lean
theorem adjustedProjectedJ0_D0NegReMain_eq_expanded
```

Forma:

```text
D0NegReMain =
  -Re(((2 * adjustedRatio^2 * (rectangularOddCoreSum(coreCutoff 0)
      - oddDirichletChannel)) * conj M))
```

Leitura: a camada confirma formalmente que `D0` e a primeira camada horizontal
ponderada por `2 * q^2`, com `c2ConcreteAntiMiracleAdjustedRatio = q`.

## O que esta camada nao faz

Nao constroi `numeratorUpper` concreto.

Nao prova `restUpper`.

Nao prova positividade regional final.

Nao importa `PeerReview`.

Nao usa rota terminal.

Nao transforma diagnostico numerico em prova.

Nao volta para pagar `D0` por `‖D0‖` como rota principal.

## Proximos passos

1. Construir `numeratorUpper` por atlas intervalar para:

```text
-Re(D0(s) * conj(M(s)))
```

2. Ou construir `numeratorUpper` por geometria branch/tilt/half-disk, reduzindo
primeiro a geometria a um bound de setor ou lower/upper da parte real.

3. Converter:

```text
numeratorUpper(s) ≤ parallelUpper(s) * ‖M(s)‖
```

4. Depois alimentar `restUpper`, preferencialmente com uma camada separada para
`Drest` e `RvecTail`.

## Verificacao

Comando:

```bash
lake env lean LeanC2/AuditAdjustedQuartetProjectedJ0D0NumeratorUpper.lean
```

Resultado:

```text
compila sem erros
```

Comando:

```bash
lake build LeanC2.AuditAdjustedQuartetProjectedJ0D0NumeratorUpper
```

Resultado:

```text
build concluido com sucesso
```

Higiene esperada:

```bash
rg -n "sorry|admit|axiom|unsafe|riemannZeta|ExactZeta|zetaUpper|zetaDepthCore|\bzeta\b|formula explicita|equacao funcional" \
  LeanC2/AuditAdjustedQuartetProjectedJ0D0NumeratorUpper.lean \
  AUDIT_ADJUSTED_QUARTET_PROJECTED_J0_D0_NUMERATOR_UPPER.md \
  GUIA_ROTA_MIDDLE_GENUINE_PROJECTED_J0.md
```

Se os termos proibidos aparecerem, devem aparecer apenas como guardrail ou no
comando de higiene em markdown. O arquivo Lean nao deve conter esses termos.

Resultado: a higiene encontrou ocorrencias apenas no guia como guardrail e na
linha do comando acima neste markdown. O arquivo Lean nao contem esses termos.
