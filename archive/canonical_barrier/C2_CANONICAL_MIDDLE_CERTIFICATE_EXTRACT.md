# C2 canonical middle certificate extract

Este arquivo junta os pedaços Lean relevantes para montar um scanner do
certificado middle canônico/genuine sem usar zeta como entrada analítica.

## Resposta curta

No endpoint público atual, o Lean **não fixa uma escolha concreta final** de
`K`, `M`, `coreCutoff`, `horizontalConstant`, `horizontalScale` e
`horizontalRatio`.

Esses objetos aparecem como campos do certificado:

```lean
structure ContinuationTerminalCertificate where
  coreCutoff : ℕ → ℕ
  K : ℕ
  M : ℕ
  horizontalConstant : ℂ → ℝ
  horizontalScale : ℂ → ℝ
  horizontalRatio : ℂ → ℝ
  continuation : GenuineFInfiniteContinuationData
  middle : CanonicalMiddleObligation
    coreCutoff K M horizontalConstant horizontalScale horizontalRatio continuation
```

Fonte: `LeanC2/PeerReview.lean`.

Então o teste correto, para a porta pública canônica, é testar famílias
candidatas que preencham esses campos.

Há uma observação formal importante: `LeanC2/AuditMiddleBarrier.lean` prova que
a obrigação pública `CanonicalMiddleObligation` força a região middle a ser
vazia, via o teorema:

```lean
theorem not_c2CanonicalClosedScaledLocalData_of_offCriticalStrip
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ}
    {s : ℂ} (hs : offCriticalStrip s) :
    ¬ C2CanonicalClosedScaledLocalData
        coreCutoff K M horizontalConstant horizontalScale horizontalRatio s
```

Isso significa que, como a porta canônica está formulada agora, um scanner de
`slack = Q_can - U_can` deve esperar encontrar a barreira formal
`U_can >= Q_can` no off-critical strip, não um fechamento positivo do middle.

## Porta pública

```lean
abbrev CanonicalMiddleObligation
    (coreCutoff : ℕ → ℕ) (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (continuation : GenuineFInfiniteContinuationData) : Prop :=
  ∀ ⦃s : ℂ⦄,
    s ∈ c2ExpandedScalarMiddleRegion
      (canonicalNearAxisData coreCutoff K M continuation)
      (canonicalEdgeData coreCutoff K M) →
    C2CanonicalClosedScaledLocalData
      coreCutoff K M horizontalConstant horizontalScale horizontalRatio s
```

Fonte: `LeanC2/PeerReview.lean`.

## Registro local canônico

```lean
structure C2CanonicalClosedScaledLocalData
    (coreCutoff : ℕ → ℕ) (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : Prop where
  horizontalScale_pos : 0 < horizontalScale s
  horizontalConstant_nonneg : 0 ≤ horizontalConstant s
  horizontalRatio_nonneg : 0 ≤ horizontalRatio s
  horizontalRatio_lt_one : horizontalRatio s < 1
  horizontalLayer_bound : ∀ j : ℕ,
    ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ ≤
      (horizontalConstant s / horizontalScale s) * horizontalRatio s ^ j
  quartet_dominance :
    c2QuartetBulkGUpper
        (c2BulkGUpper
          (c2TiltAnalyticRegularizedUpper
            (c2CanonicalClosedTiltConstant
              K M horizontalConstant horizontalScale horizontalRatio)
            (fun _ => (1 : ℝ)))
          (c2HorizontalRegularizedUpper
            horizontalConstant horizontalScale horizontalRatio)) s +
      c2BulkEUpper
        (c2CutoffUpperFromScale
          (c2CanonicalClosedCutoffConstant K M)
          (fun _ => (1 : ℝ))) s <
        c2QuartetBulkK2Lower s * ((1 - ‖q s‖) * (1 + ‖q s‖ ^ 2))
```

Fonte: `LeanC2/Analytic/GenuineBulkConcrete.lean`.

## Margem do quarteto

```lean
noncomputable def c2ExpandedQuartetK2Margin : ℂ → ℝ :=
  fun s =>
    c2QuartetBulkK2Lower s * ((1 - ‖q s‖) * (1 + ‖q s‖ ^ 2))

noncomputable def c2ExpandedQuartetResidualMargin : ℂ → ℝ :=
  fun s => c2ExpandedQuartetK2Margin s - c2QuartetVerticalTailUpper s
```

Fonte: `LeanC2/Analytic/GenuineBulkConcrete.lean`.

As peças de baixo nível são:

```lean
noncomputable def c2QuartetVerticalTailUpper (s : ℂ) : ℝ :=
  ‖q s‖ ^ 6 * (1 - ‖q s‖)⁻¹

noncomputable def c2QuartetBulkK2Lower (s : ℂ) : ℝ :=
  ‖q s‖ ^ 2
```

Fonte: `LeanC2/Route/BulkQuartet.lean`.

Logo, para o scanner:

```text
Q_can(s) = c2ExpandedQuartetResidualMargin s
         = |q(s)|^2 * ((1 - |q(s)|) * (1 + |q(s)|^2))
           - |q(s)|^6 / (1 - |q(s)|)
```

## Upper residual canônico

O residual upper expandido é:

```lean
noncomputable def c2ExpandedQuartetResidualUpper
    (tiltConstant tiltScale
      horizontalConstant horizontalScale horizontalRatio
      cutoffConstant cutoffScale : ℂ → ℝ) : ℂ → ℝ :=
  fun s =>
    c2TiltAnalyticRegularizedUpper tiltConstant tiltScale s +
      c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio s +
      c2CutoffUpperFromScale cutoffConstant cutoffScale s
```

Fonte: `LeanC2/Analytic/GenuineBulkConcrete.lean`.

A versão canônica usa escala unitária para tilt e cutoff:

```lean
noncomputable def c2CanonicalClosedScaledResidualUpper
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ) : ℂ → ℝ :=
  c2ExpandedQuartetResidualUpper
    (c2CanonicalClosedTiltConstant
      K M horizontalConstant horizontalScale horizontalRatio)
    (fun _ => (1 : ℝ))
    horizontalConstant horizontalScale horizontalRatio
    (c2CanonicalClosedCutoffConstant K M)
    (fun _ => (1 : ℝ))
```

Fonte: `LeanC2/Analytic/GenuineBulkConcrete.lean`.

Então:

```text
U_can(s) =
  c2CanonicalClosedScaledResidualUpper
    K M horizontalConstant horizontalScale horizontalRatio s
```

## Constantes canônicas

```lean
noncomputable def c2CanonicalClosedTiltConstant
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ) : ℂ → ℝ :=
  fun s =>
    (c2ContinuedVerticalResidualClosedUpper K M
        (c2RectangularGenuineDirectBracketUpper K M)
        c2ContinuedCentralExactUpper s +
      c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio s) *
      (1 + ‖q s‖)

noncomputable def c2CanonicalClosedCutoffConstant
    (K M : ℕ) : ℂ → ℝ :=
  c2ContinuedCutoffClosedUpper K M
    (c2RectangularGenuineDirectBracketUpper K M)
    c2ContinuedCentralExactUpper
```

Fonte: `LeanC2/Analytic/GenuineBulkConcrete.lean`.

## Horizontal upper

```lean
noncomputable def c2HorizontalRegularizedUpper
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ) : ℂ → ℝ :=
  fun s => (horizontalConstant s / horizontalScale s) * (1 - horizontalRatio s)⁻¹
```

Fonte: `LeanC2/Route/BulkHorizontal.lean`.

O orçamento por camada que alimenta o registro local é:

```lean
structure C2ExpandedHorizontalLayerBudget
    (coreCutoff : ℕ → ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ)
    (s : ℂ) : Prop where
  layer_bound : ∀ j : ℕ,
    ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ ≤
      (horizontalConstant s / horizontalScale s) * horizontalRatio s ^ j
```

Fonte: `LeanC2/Analytic/GenuineBulkConcrete.lean`.

## Continued vertical residual closed upper

```lean
noncomputable def c2ContinuedVerticalResidualClosedUpper
    (_K _M : ℕ) (rectangularUpper centralUpper : ℂ → ℝ) : ℂ → ℝ :=
  fun s => verticalDepthTailUpper s + rectangularUpper s + 2 * centralUpper s

noncomputable def c2ContinuedCutoffClosedUpper
    (_K _M : ℕ) (rectangularUpper centralUpper : ℂ → ℝ) : ℂ → ℝ :=
  fun s => rectangularUpper s + centralUpper s
```

Fonte: `LeanC2/Analytic/GenuineBulkConcrete.lean`.

Há também uma upper exata para a rota de auditoria continued quartet:

```lean
noncomputable def c2ContinuedVerticalResidualExactUpper (K M : ℕ) : ℂ → ℝ :=
  fun s => ‖c2ScaledSeededExplicitOddTailContinuedVerticalResidual K M s‖
```

Fonte: `LeanC2/Analytic/GenuineBulkConcrete.lean`.

## Fórmula expandida útil para Python

No off-critical strip, o Lean mostra que a upper canônica equivale à forma
linear:

```lean
noncomputable def c2CanonicalClosedScaledResidualLinearUpper
    (K M : ℕ)
    (horizontalConstant horizontalScale horizontalRatio : ℂ → ℝ) : ℂ → ℝ :=
  fun s =>
    c2ContinuedVerticalResidualClosedUpper K M
        (c2RectangularGenuineDirectBracketUpper K M)
        c2ContinuedCentralExactUpper s *
      ((1 + ‖q s‖) * (1 - ‖q s‖)⁻¹) +
    c2HorizontalRegularizedUpper
        horizontalConstant horizontalScale horizontalRatio s *
      (2 * (1 - ‖q s‖)⁻¹) +
    c2CanonicalClosedCutoffConstant K M s
```

Fonte: `LeanC2/Analytic/GenuineBulkConcrete.lean`.

Assim, para scanner:

```text
U_can_linear(s) =
  V_closed(K,M,s) * ((1 + |q(s)|) / (1 - |q(s)|))
  + H_reg(s) * (2 / (1 - |q(s)|))
  + Cut_closed(K,M,s)

H_reg(s) =
  horizontalConstant(s) / horizontalScale(s)
  / (1 - horizontalRatio(s))
```

E:

```text
slack(s) = Q_can(s) - U_can(s)
```

Mas, pela barreira formal atual, não se deve esperar `slack(s) > 0` para essa
porta canônica no off-critical strip.

## Famílias candidatas existentes

O Lean tem uma rota de auditoria com escolhas parciais/familiares, mas não um
certificado público final fechado.

Em `LeanC2/AuditContinuedQuartetProfile.lean`:

```lean
def unitScale : ℂ → ℝ :=
  fun _ => (1 : ℝ)

noncomputable def halfHorizontalRatio : ℂ → ℝ :=
  fun _ => (1 / 2 : ℝ)
```

Em `LeanC2/AuditContinuedQuartetDominance.lean`:

```lean
def constantCoreCutoff (N : ℕ) : ℕ → ℕ :=
  fun _ => N

noncomputable def constantCoreHorizontalEnvelope (N : ℕ) : ℂ → ℝ :=
  weightedHorizontalEnvelope (constantCoreCutoff N)

noncomputable def constantCoreHorizontalEnvelopeClosed (N : ℕ) : ℂ → ℝ :=
  fun s =>
    (2 * ‖q s‖ ^ 2 * constantCoreOddTruncationNorm N s) *
      (1 - 2 * ‖q s‖)⁻¹
```

Essa família usa:

```text
coreCutoff = fun _ => N
horizontalScale = 1
horizontalRatio = 1/2
horizontalConstant = weightedHorizontalEnvelope (fun _ => N)
```

mas ainda deixa `N`, `K`, `M` como parâmetros, e a dominância no middle como
obrigação.

O pacote de dominância dessa família é:

```lean
structure ConstantCoreCutoffMiddleDominanceInputs
    (N K M : ℕ) : Prop where
  dominance : ∀ ⦃s : ℂ⦄,
    s ∈ middleRegion (fun _ : ℕ => N) K M →
      c2QuartetBulkGUpper
          (c2BulkGUpper
            (c2TiltAnalyticRegularizedUpper
              (exactResidualTiltConstant K M
                (weightedHorizontalEnvelope (fun _ : ℕ => N)))
              unitScale)
            (c2HorizontalRegularizedUpper
              (weightedHorizontalEnvelope (fun _ : ℕ => N))
              unitScale halfHorizontalRatio)) s +
        c2BulkEUpper
          (c2CutoffUpperFromScale
            (exactResidualCutoffConstant K M) unitScale) s <
          c2QuartetBulkK2Lower s * ((1 - ‖q s‖) * (1 + ‖q s‖ ^ 2))
```

Fonte: `LeanC2/AuditContinuedQuartetHorizontal.lean`.

## Recomendação para o scanner

Separar dois modos:

1. **Modo canônico público**:
   testar literalmente
   `c2CanonicalClosedScaledResidualUpper K M horizontalConstant horizontalScale horizontalRatio`
   contra `c2ExpandedQuartetResidualMargin`.
   Resultado esperado pelo Lean atual: a barreira impede fechamento positivo no
   off-critical strip.

2. **Modo família candidata**:
   testar famílias como a constant-cutoff unit/half:
   `coreCutoff = fun _ => N`, `horizontalScale = 1`,
   `horizontalRatio = 1/2`, `horizontalConstant = weightedHorizontalEnvelope`.
   Aqui o objetivo é explorar quais `N`, `K`, `M` e qual upper horizontal podem
   formar uma porta corrigida ou uma rota alternativa.

Resumo operacional:

```text
Q_can(s) = c2ExpandedQuartetResidualMargin(s)
U_can(s) = c2CanonicalClosedScaledResidualUpper(K,M,H,X,r)(s)
slack(s) = Q_can(s) - U_can(s)

Pergunta correta no Lean atual:
  a porta pública está abstrata e formalmente barrada no off-critical strip?

Resposta encontrada:
  sim.

Pergunta útil para busca numérica:
  quais famílias candidatas de K, M, cutoff e horizontal melhoram ou substituem
  essa porta?
```
