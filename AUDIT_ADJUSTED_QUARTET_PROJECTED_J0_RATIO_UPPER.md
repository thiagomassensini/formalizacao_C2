# Audit Adjusted Quartet Projected J0 Ratio Upper

Data: 2026-07-08.

Rota: Genuine-First. Esta camada converte um upper do numerador destrutivo de
`D0` e um lower positivo para `‖M‖` em uma cota `parallelUpper`. Ela nao
constroi atlas intervalar, nao prova `restUpper` e nao fecha o middle.

## Arquivo Lean

Criado:

```text
LeanC2/AuditAdjustedQuartetProjectedJ0RatioUpper.lean
```

Import:

```lean
import LeanC2.AuditAdjustedQuartetProjectedJ0D0NumeratorUpper
```

Namespace:

```lean
C2.AdjustedQuartetProjectedJ0Aliases
```

## Ratio upper

Definicao criada:

```lean
noncomputable def adjustedProjectedJ0_parallelUpperFromNumeratorLower
    (numeratorUpper mainNormLower : ℂ → ℝ) : ℂ → ℝ :=
  fun s => numeratorUpper s / mainNormLower s
```

Leitura: se `numeratorUpper(s)` majorar o numerador destrutivo e
`mainNormLower(s)` for um lower positivo para `‖M(s)‖`, entao a cota natural
para o custo paralelo e:

```text
parallelUpper(s) = numeratorUpper(s) / mainNormLower(s)
```

## Lemas reais auxiliares

Lemas criados:

```lean
theorem ratio_mul_le_of_nonneg_of_pos_of_le
    {a b c : ℝ}
    (ha : 0 ≤ a) (hb : 0 < b) (hbc : b ≤ c) :
    a ≤ (a / b) * c

theorem div_nonneg_of_nonneg_of_pos
    {a b : ℝ} (ha : 0 ≤ a) (hb : 0 < b) :
    0 ≤ a / b
```

Uso: provar a conversao

```text
numeratorUpper(s) ≤
  (numeratorUpper(s) / mainNormLower(s)) * ‖M(s)‖
```

a partir de:

```text
0 ≤ numeratorUpper(s)
0 < mainNormLower(s)
mainNormLower(s) ≤ ‖M(s)‖
```

## Estrutura regional

Estrutura criada:

```lean
structure ProjectedJ0D0RatioUpperData
```

Campos:

```text
main_lower_pos :
  ∀ s ∈ Region, 0 < mainNormLower s

main_lower :
  ∀ s ∈ Region,
    mainNormLower s ≤ ‖adjustedProjectedJ0_M tiltSeed s‖

numerator_nonneg :
  ∀ s ∈ Region, 0 ≤ numeratorUpper s

neg_re_upper :
  ∀ s ∈ Region,
    adjustedProjectedJ0_D0NegReMain tiltSeed coreCutoff s ≤ numeratorUpper s
```

Conversor que compila:

```lean
theorem ProjectedJ0D0RatioUpperData.toNegReUpperData
```

Ele gera:

```lean
ProjectedJ0D0NegReUpperData
  tiltSeed coreCutoff numeratorUpper
  (adjustedProjectedJ0_parallelUpperFromNumeratorLower
    numeratorUpper mainNormLower)
  Region
```

Tambem compila:

```lean
theorem ProjectedJ0D0RatioUpperData.toParallelUpperData
```

Ou seja, a estrutura ratio alimenta diretamente:

```lean
ProjectedJ0ParallelUpperData
```

## Consumidores regionais

Finite model:

```lean
structure AdjustedProjectedJ0FiniteRatioBoundedData

theorem AdjustedProjectedJ0FiniteRatioBoundedData.total_ne_zero
```

Forma:

```text
ratio parallel upper
restCostFinite ≤ restUpper
0 < projectedFiniteSurplusLower
------------------------------------------------
∀ s ∈ Region, totalFinite(s) ≠ 0
```

Adjusted quartet:

```lean
structure AdjustedProjectedJ0QuartetRatioBoundedData

theorem AdjustedProjectedJ0QuartetRatioBoundedData.total_ne_zero
```

As duas versoes deixam `restUpper` abstrato.

## Versao constante para atlas simples

Helper criado:

```lean
def constUpper (A : ℝ) : ℂ → ℝ := fun _ => A
```

Estrutura criada:

```lean
structure ProjectedJ0D0ConstantRatioUpperData
```

Ela recebe constantes por caixa:

```text
numeratorUpperConst : ℝ
mainNormLowerConst : ℝ
```

Conversores que compilam:

```lean
theorem ProjectedJ0D0ConstantRatioUpperData.toRatioUpperData

theorem ProjectedJ0D0ConstantRatioUpperData.toParallelUpperData
```

Isso prepara certificados de atlas/caixas sem implementar ainda o mecanismo
intervalar.

## O que esta camada nao faz

Nao prova `numeratorUpper`.

Nao prova `mainNormLower`.

Nao prova `restUpper`.

Nao prova positividade regional final.

Nao importa `PeerReview`.

Nao usa rota terminal.

Nao usa diagnostico numerico como prova.

Nao volta para `‖D0‖` como rota principal.

## Proximos passos

Construir um atlas intervalar ou geometrico que produza:

```text
1. numeratorUpper para -Re(D0 * conj M);
2. mainNormLower para ‖M‖;
3. restUpper para ‖Drest + RvecTail‖
   ou para a variante separada.
```

Depois alimentar:

```text
mainExactLower - parallelUpper - restUpper > 0
```

com:

```text
parallelUpper = numeratorUpper / mainNormLower
```

## Verificacao

Comando:

```bash
lake env lean LeanC2/AuditAdjustedQuartetProjectedJ0RatioUpper.lean
```

Resultado:

```text
compila sem erros
```

Comando:

```bash
lake build LeanC2.AuditAdjustedQuartetProjectedJ0RatioUpper
```

Resultado:

```text
build concluido com sucesso
```

Higiene esperada:

```bash
rg -n "sorry|admit|axiom|unsafe|riemannZeta|ExactZeta|zetaUpper|zetaDepthCore|\bzeta\b|formula explicita|equacao funcional" \
  LeanC2/AuditAdjustedQuartetProjectedJ0RatioUpper.lean \
  AUDIT_ADJUSTED_QUARTET_PROJECTED_J0_RATIO_UPPER.md \
  GUIA_ROTA_MIDDLE_GENUINE_PROJECTED_J0.md
```

Se os termos proibidos aparecerem, devem aparecer apenas como guardrail ou no
comando de higiene em markdown/guia. O arquivo Lean nao deve conter esses
termos.

Resultado: a higiene encontrou ocorrencias apenas no guia como guardrail e na
linha do comando acima neste markdown. O arquivo Lean nao contem esses termos.
