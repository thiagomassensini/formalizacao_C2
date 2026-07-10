# Audit Adjusted Quartet Projected J0 Numerator Upper Plan

Data: 2026-07-08.

Rota: Genuine-First. Este documento detalha o proximo passo depois da camada
`ParallelUpper`: construir uma forma formal de alimentar bounds finos para o
numerador projetivo de `D0`, sem ainda provar um certificado analitico concreto.

## Regra de ouro

Nao usar como input analitico:

```text
zeta
riemannZeta
ExactZeta
zetaUpper
zetaDepthCore
equacao funcional
formula explicita
comparacao externa com zeros
alturas de zeros
```

CSV e diagnostico numerico podem orientar qual moeda construir, mas nao viram
prova.

## Estado herdado

Camada criada:

```text
LeanC2/AuditAdjustedQuartetProjectedJ0ParallelUpper.lean
```

Definicao principal:

```lean
noncomputable def destructiveNumerator (M D : ℂ) : ℝ :=
  max 0 (-(D * starRingEnd ℂ M).re)
```

Conversao ja paga:

```lean
destructiveParallel M D =
  destructiveNumerator M D / ‖M‖
```

Forma consumivel ja paga:

```lean
destructiveNumerator M D ≤ U * ‖M‖
0 ≤ U
M ≠ 0
------------------------------------
destructiveParallel M D ≤ U
```

Para o adjusted quartet, o alvo e:

```lean
destructiveNumerator
  (adjustedProjectedJ0_M tiltSeed s)
  (adjustedProjectedJ0_D0 coreCutoff s)
```

## Objetivo deste proximo passo

Criar uma interface formal pequena que transforme bounds intervalares ou
setoriais sobre:

```text
(D0(s) * conj(M(s))).re
```

em:

```text
destructiveNumerator(M(s), D0(s)) ≤ numeratorUpper(s)
```

e depois em:

```text
adjustedProjectedJ0_parallelCost tiltSeed coreCutoff s ≤ parallelUpper(s)
```

usando a estrutura ja criada:

```lean
ProjectedJ0ParallelNumeratorUpperData
```

## Moeda intervalar minima

Se for certificado:

```text
reLower(s) ≤ (D0(s) * conj(M(s))).re
```

entao:

```text
destructiveNumerator(M(s),D0(s)) ≤ max 0 (-reLower(s))
```

porque `x >= reLower` implica `-x <= -reLower`, e `max 0` e monotono.

Sugestao de nome para a proxima camada Lean:

```text
LeanC2/AuditAdjustedQuartetProjectedJ0NumeratorUpper.lean
```

Import sugerido:

```lean
import LeanC2.AuditAdjustedQuartetProjectedJ0ParallelUpper
```

Estrutura sugerida:

```lean
structure ProjectedJ0NumeratorLowerReData
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ)
    (reLower numeratorUpper : ℂ → ℝ) (Region : Set ℂ) where
  lower_re :
    ∀ s ∈ Region,
      reLower s ≤
        ((adjustedProjectedJ0_D0 coreCutoff s) *
          starRingEnd ℂ (adjustedProjectedJ0_M tiltSeed s)).re
  upper :
    ∀ s ∈ Region,
      max 0 (-(reLower s)) ≤ numeratorUpper s
```

Teorema sugerido:

```lean
theorem ProjectedJ0NumeratorLowerReData.numerator_upper
    ... :
    ∀ s ∈ Region,
      destructiveNumerator
        (adjustedProjectedJ0_M tiltSeed s)
        (adjustedProjectedJ0_D0 coreCutoff s)
      ≤ numeratorUpper s
```

Essa camada ainda nao precisa saber como `reLower` foi obtido.

## Conversao para parallelUpper

Ha duas formas naturais.

### Forma A: converter diretamente

O certificado fornece:

```text
numeratorUpper(s) ≤ parallelUpper(s) * ‖M(s)‖
0 ≤ parallelUpper(s)
M(s) ≠ 0
```

Isso ja casa diretamente com:

```lean
ProjectedJ0ParallelNumeratorUpperData
```

### Forma B: usar lower de norma do main

Se for mais pratico certificar:

```text
0 < mainLower(s)
mainLower(s) ≤ ‖M(s)‖
parallelUpper(s) = numeratorUpper(s) / mainLower(s)
0 ≤ numeratorUpper(s)
```

entao deve ser provado:

```text
numeratorUpper(s) ≤ parallelUpper(s) * ‖M(s)‖
```

Essa forma e boa para certificados intervalares, porque separa:

```text
reLower para o numerador
mainLower para o denominador
```

sem carregar divisao dentro do bound principal.

## Interfaces regionais recomendadas

### Intervalar direta

Campos esperados por regiao:

```text
main_ne_zero
reLower
numeratorUpper
convert
parallel_nonneg
```

Conclusao:

```text
ProjectedJ0ParallelUpperData tiltSeed coreCutoff parallelUpper Region
```

### Setorial/fase

Campos esperados por regiao:

```text
sector certificate for direction of D0 relative to M
norm upper for D0, if needed
main direction/nonzero certificate
derived lower bound for Re(D0 * conj M)
```

Conclusao intermediaria:

```text
reLower(s) ≤ (D0(s) * conj(M(s))).re
```

Depois a rota cai na interface intervalar direta.

### Branch/tilt/half-disk

Campos esperados por caixa ou sub-regiao:

```text
branch/tilt geometric data
half-disk or phase channel bound
translation to a sector or reLower certificate for D0 against M
roundoff/interval certificate, if numeric
```

Conclusao intermediaria tambem deve ser:

```text
reLower(s) ≤ (D0(s) * conj(M(s))).re
```

A camada Lean de `parallelUpper` nao deve depender da origem do certificado.

## O que nao fazer nesta etapa

Nao atacar `restUpper`.

Nao fechar o middle.

Nao tentar provar positividade regional final.

Nao importar `PeerReview`.

Nao importar rotas terminais.

Nao substituir a rota principal pelo fallback:

```text
destructiveParallel(M,D0) ≤ ‖D0‖
```

Esse fallback existe apenas como controle conservador.

## Tarefa Lean minima seguinte

Criar:

```text
LeanC2/AuditAdjustedQuartetProjectedJ0NumeratorUpper.lean
```

Com:

```text
1. lema abstrato:
   lowerRe ≤ (D * conj M).re
   max 0 (-lowerRe) ≤ numeratorUpper
   ------------------------------------------------
   destructiveNumerator M D ≤ numeratorUpper

2. versao especializada para:
   adjustedProjectedJ0_M
   adjustedProjectedJ0_D0

3. estrutura regional lower-re -> numeratorUpper

4. estrutura regional lower-re + convert -> ProjectedJ0ParallelUpperData
```

Esse arquivo ainda deve ser puramente abstrato/adapter. O certificado real de
geometria ou intervalos pode vir depois.

## Tarefa documental seguinte

Depois do adapter Lean, criar um documento de certificado:

```text
AUDIT_ADJUSTED_QUARTET_PROJECTED_J0_NUMERATOR_CERTIFICATE_SHAPE.md
```

Ele deve especificar campos numericos/intervalares para uma caixa:

```text
sigma_min, sigma_max
t_min, t_max
reLower
mainLower
numeratorUpper
parallelUpper
roundoff model
grid-to-continuum proof
```

e deixar claro que o CSV continua apenas diagnostico ate existir certificado
intervalar formal.

## Higiene esperada

Para o proximo arquivo Lean e documentos associados:

```bash
rg -n "sorry|admit|axiom|unsafe|riemannZeta|ExactZeta|zetaUpper|zetaDepthCore|\bzeta\b|formula explicita|equacao funcional" \
  LeanC2/AuditAdjustedQuartetProjectedJ0NumeratorUpper.lean \
  AUDIT_ADJUSTED_QUARTET_PROJECTED_J0_NUMERATOR_UPPER_PLAN.md
```

Se os termos proibidos aparecerem no markdown, devem aparecer apenas como
guardrail ou no comando de higiene. No Lean, nao devem aparecer.

## Higiene deste documento

Comando rodado:

```bash
rg -n "sorry|admit|axiom|unsafe|riemannZeta|ExactZeta|zetaUpper|zetaDepthCore|\bzeta\b|formula explicita|equacao funcional" \
  AUDIT_ADJUSTED_QUARTET_PROJECTED_J0_NUMERATOR_UPPER_PLAN.md
```

Resultado: os termos proibidos aparecem apenas no guardrail inicial e na linha
do proprio comando de higiene.
