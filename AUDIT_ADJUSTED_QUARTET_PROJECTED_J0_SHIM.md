# AUDIT_ADJUSTED_QUARTET_PROJECTED_J0_SHIM

Data: 2026-07-08

## Escopo

Criar um shim Lean pequeno que conecta a ponte vetorial projetiva ao formato
abstrato do adjusted quartet, sem construir ainda os bounds analiticos.

Regra de ouro:

```text
Genuine-First. Nao usar zeta, riemannZeta, ExactZeta, zetaUpper, zetaDepthCore,
equacao funcional, formula explicita, comparacao externa com zeros, nem alturas
de zeros como input analitico.
```

Este shim nao fecha o middle, nao formaliza o adjusted quartet completo e nao
usa CSV como prova.

## Arquivo Lean Criado

```text
LeanC2/AuditAdjustedQuartetProjectedJ0Shim.lean
```

Import:

```lean
import LeanC2.AuditAdjustedQuartetHorizontalProjection
```

O arquivo importa apenas a camada vetorial/projetiva ja fechada. Ele nao
importa rotas terminais nem objetos analiticos do adjusted quartet real.

## Estruturas Criadas

### Pontual com resto combinado

```lean
structure AdjustedQuartetProjectedJ0PointData where
  M : ℂ
  D0 : ℂ
  Drest : ℂ
  R : ℂ
  total : ℂ
  mainLower : ℝ
  parallelUpper : ℝ
  restUpper : ℝ
  total_eq : total = M + D0 + Drest + R
  hM : M ≠ 0
  hMain : mainLower ≤ ‖M‖
  hParallel : destructiveParallel M D0 ≤ parallelUpper
  hRest : ‖Drest + R‖ ≤ restUpper
  hBudget : parallelUpper + restUpper < mainLower
```

### Pontual com resto separado

```lean
structure AdjustedQuartetProjectedJ0SeparateRestPointData where
  M : ℂ
  D0 : ℂ
  Drest : ℂ
  R : ℂ
  total : ℂ
  mainLower : ℝ
  parallelUpper : ℝ
  restUpper : ℝ
  total_eq : total = M + D0 + Drest + R
  hM : M ≠ 0
  hMain : mainLower ≤ ‖M‖
  hParallel : destructiveParallel M D0 ≤ parallelUpper
  hRest : ‖Drest‖ + ‖R‖ ≤ restUpper
  hBudget : parallelUpper + restUpper < mainLower
```

### Por região abstrata

```lean
structure AdjustedQuartetProjectedJ0OnRegionData
    (Region : Set ℂ)
    (M D0 Drest R total : ℂ → ℂ)
    (mainLower parallelUpper restUpper : ℂ → ℝ) where
  total_eq :
    ∀ s ∈ Region, total s = M s + D0 s + Drest s + R s
  hM :
    ∀ s ∈ Region, M s ≠ 0
  hMain :
    ∀ s ∈ Region, mainLower s ≤ ‖M s‖
  hParallel :
    ∀ s ∈ Region, destructiveParallel (M s) (D0 s) ≤ parallelUpper s
  hRest :
    ∀ s ∈ Region, ‖Drest s + R s‖ ≤ restUpper s
  hBudget :
    ∀ s ∈ Region, parallelUpper s + restUpper s < mainLower s
```

## Teoremas Que Compilam

### Consumidor pontual

```lean
theorem AdjustedQuartetProjectedJ0PointData.total_ne_zero
    (data : AdjustedQuartetProjectedJ0PointData) :
    data.total ≠ 0
```

Usa:

```lean
ne_zero_of_projected_j0_and_rest_parallel
```

Forma operacional:

```text
mainLower + parallelUpper + restUpper pointwise
  com parallelUpper cobrindo destructiveParallel M D0
  implica total != 0.
```

### Consumidor pontual com resto separado

```lean
theorem AdjustedQuartetProjectedJ0SeparateRestPointData.total_ne_zero
    (data : AdjustedQuartetProjectedJ0SeparateRestPointData) :
    data.total ≠ 0
```

Usa:

```lean
ne_zero_of_projected_j0_and_separate_rest_parallel
```

### Consumidor por região

```lean
theorem AdjustedQuartetProjectedJ0OnRegionData.total_ne_zero
    {Region : Set ℂ}
    {M D0 Drest R total : ℂ → ℂ}
    {mainLower parallelUpper restUpper : ℂ → ℝ}
    (data : AdjustedQuartetProjectedJ0OnRegionData
      Region M D0 Drest R total mainLower parallelUpper restUpper) :
    ∀ s ∈ Region, total s ≠ 0
```

Este e o formato que deve ser consumido depois por uma regiao middle real ou
por uma sub-regiao certificada.

## Mapeamento Futuro Para O Adjusted Quartet

Ainda nao formalizado neste shim:

```text
M(s)      = adjusted main seeded complex
D0(s)     = horizontal defect layer j0
Drest(s)  = horizontal defect layers j1+j2+j3
R(s)      = vertical_tail + horizontal_tail + tilt_tail_upper + cutoff_budget
total(s)  = adjusted total complex object
```

Moeda formal:

```text
main seeded
  > destructiveParallel(M, D0)
    + norm(Drest + R)
```

ou, com resto separado:

```text
main seeded
  > destructiveParallel(M, D0)
    + norm(Drest)
    + norm(R)
```

## Bounds Que Ainda Faltam

Para plugar no adjusted quartet real, ainda faltam:

```text
mainLower:
  cota inferior formal para ‖M(s)‖;

parallelUpper:
  cota superior formal para destructiveParallel (M(s)) (D0(s));

restUpper:
  cota superior formal para ‖Drest(s) + R(s)‖
  ou para ‖Drest(s)‖ + ‖R(s)‖.
```

O diagnostico numerico identificou que `j0` domina e que a norma bruta
`sum_j |D_j|` e cara demais, mas esses CSVs continuam apenas diagnostico.

## Verificacao

Comando:

```bash
lake env lean LeanC2/AuditAdjustedQuartetProjectedJ0Shim.lean
```

Resultado:

```text
compila sem erros
```

Higiene:

```bash
rg -n "sorry|admit|axiom|unsafe|riemannZeta|ExactZeta|zetaUpper|zetaDepthCore|\bzeta\b|formula explicita|equacao funcional" \
  LeanC2/AuditAdjustedQuartetProjectedJ0Shim.lean \
  AUDIT_ADJUSTED_QUARTET_PROJECTED_J0_SHIM.md
```

Os termos proibidos aparecem apenas neste markdown como guardrail e na linha
que registra o comando de higiene. O arquivo Lean nao contem esses termos.

## Conclusao

Agora existe uma API Lean abstrata que consome:

```text
mainLower
parallelUpper
restUpper
```

e conclui:

```text
total != 0
```

Isso e exatamente o encaixe pointwise para a rota:

```text
j0 por projecao + resto por norma.
```
