import LeanC2.AuditAdjustedQuartetProjectedJ0ParallelUpper

/-!
# Negative-real numerator upper for the projected-j0 ledger

This audit file adapts bounds on the negative real part of
`D0 * conj M` into bounds for the destructive numerator of the dominant
horizontal layer.  It does not build a concrete interval or geometric
certificate.
-/

namespace C2
namespace AdjustedQuartetProjectedJ0Aliases

open AdjustedQuartetHorizontalProjection

/-- Negative real part of the `D0` projection against the seeded main. -/
noncomputable def adjustedProjectedJ0_D0NegReMain
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (s : ℂ) : ℝ :=
  -((adjustedProjectedJ0_D0 coreCutoff s *
      starRingEnd ℂ (adjustedProjectedJ0_M tiltSeed s)).re)

/-- Destructive numerator of the dominant `D0` layer against the seeded main. -/
noncomputable def adjustedProjectedJ0_D0DestructiveNumerator
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (s : ℂ) : ℝ :=
  destructiveNumerator
    (adjustedProjectedJ0_M tiltSeed s)
    (adjustedProjectedJ0_D0 coreCutoff s)

theorem adjustedProjectedJ0_D0DestructiveNumerator_eq_max
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (s : ℂ) :
    adjustedProjectedJ0_D0DestructiveNumerator tiltSeed coreCutoff s =
      max 0 (adjustedProjectedJ0_D0NegReMain tiltSeed coreCutoff s) := by
  rfl

theorem destructiveNumerator_le_of_neg_re_le
    (M D : ℂ) (U : ℝ)
    (hU0 : 0 ≤ U)
    (hNeg : -((D * starRingEnd ℂ M).re) ≤ U) :
    destructiveNumerator M D ≤ U := by
  unfold destructiveNumerator
  exact max_le hU0 hNeg

theorem adjustedProjectedJ0_D0DestructiveNumerator_le_of_neg_re_le
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ)
    (numeratorUpper : ℂ → ℝ) (s : ℂ)
    (hU0 : 0 ≤ numeratorUpper s)
    (hNeg :
      adjustedProjectedJ0_D0NegReMain tiltSeed coreCutoff s ≤ numeratorUpper s) :
    adjustedProjectedJ0_D0DestructiveNumerator tiltSeed coreCutoff s ≤
      numeratorUpper s := by
  unfold adjustedProjectedJ0_D0DestructiveNumerator adjustedProjectedJ0_D0NegReMain at *
  exact destructiveNumerator_le_of_neg_re_le
    (M := adjustedProjectedJ0_M tiltSeed s)
    (D := adjustedProjectedJ0_D0 coreCutoff s)
    (U := numeratorUpper s)
    hU0 hNeg

/--
Regional data bounding the destructive `D0` numerator through the negative real
part of `D0 * conj M`.
-/
structure ProjectedJ0D0NegReUpperData
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ)
    (numeratorUpper parallelUpper : ℂ → ℝ)
    (Region : Set ℂ) where
  main_ne_zero :
    ∀ s ∈ Region, adjustedProjectedJ0_M tiltSeed s ≠ 0
  numerator_nonneg :
    ∀ s ∈ Region, 0 ≤ numeratorUpper s
  neg_re_upper :
    ∀ s ∈ Region,
      adjustedProjectedJ0_D0NegReMain tiltSeed coreCutoff s ≤ numeratorUpper s
  convert :
    ∀ s ∈ Region,
      numeratorUpper s ≤
        parallelUpper s * ‖adjustedProjectedJ0_M tiltSeed s‖
  parallel_nonneg :
    ∀ s ∈ Region, 0 ≤ parallelUpper s

theorem ProjectedJ0D0NegReUpperData.toParallelNumeratorUpperData
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ}
    {numeratorUpper parallelUpper : ℂ → ℝ} {Region : Set ℂ}
    (data :
      ProjectedJ0D0NegReUpperData
        tiltSeed coreCutoff numeratorUpper parallelUpper Region) :
    ProjectedJ0ParallelNumeratorUpperData
      tiltSeed coreCutoff numeratorUpper parallelUpper Region := by
  refine
    { main_ne_zero := data.main_ne_zero
      numerator_upper := ?_
      convert := data.convert
      parallel_nonneg := data.parallel_nonneg }
  intro s hs
  exact adjustedProjectedJ0_D0DestructiveNumerator_le_of_neg_re_le
    (tiltSeed := tiltSeed) (coreCutoff := coreCutoff)
    (numeratorUpper := numeratorUpper) (s := s)
    (data.numerator_nonneg s hs)
    (data.neg_re_upper s hs)

theorem ProjectedJ0D0NegReUpperData.toParallelUpperData
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ}
    {numeratorUpper parallelUpper : ℂ → ℝ} {Region : Set ℂ}
    (data :
      ProjectedJ0D0NegReUpperData
        tiltSeed coreCutoff numeratorUpper parallelUpper Region) :
    ProjectedJ0ParallelUpperData
      tiltSeed coreCutoff parallelUpper Region := by
  exact data.toParallelNumeratorUpperData.toParallelUpperData

/--
Finite-model bounded data using a negative-real upper for the `D0` numerator,
an abstract rest upper, and the bounded-surplus budget.
-/
structure AdjustedProjectedJ0FiniteNegReBoundedData
    (Region : Set ℂ)
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (K M : ℕ)
    (numeratorUpper parallelUpper restUpper : ℂ → ℝ) where
  parallel :
    ProjectedJ0D0NegReUpperData
      tiltSeed coreCutoff numeratorUpper parallelUpper Region
  rest :
    ∀ s ∈ Region,
      adjustedProjectedJ0_restCostFinite tiltSeed coreCutoff K M s ≤ restUpper s
  budget :
    ∀ s ∈ Region,
      0 < adjustedProjectedJ0_projectedFiniteSurplusLower
        tiltSeed coreCutoff K M parallelUpper restUpper s

theorem AdjustedProjectedJ0FiniteNegReBoundedData.total_ne_zero
    {Region : Set ℂ}
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {numeratorUpper parallelUpper restUpper : ℂ → ℝ}
    (data :
      AdjustedProjectedJ0FiniteNegReBoundedData
        Region tiltSeed coreCutoff K M numeratorUpper parallelUpper restUpper) :
    ∀ s ∈ Region,
      adjustedProjectedJ0_totalFinite tiltSeed coreCutoff K M s ≠ 0 := by
  exact
    (AdjustedProjectedJ0FiniteBoundedData.total_ne_zero
      { parallel := data.parallel.toParallelUpperData
        rest := data.rest
        budget := data.budget })

/--
Adjusted-quartet bounded data using a negative-real upper for the `D0`
numerator, with the quartet rest cost kept abstract.
-/
structure AdjustedProjectedJ0QuartetNegReBoundedData
    (Region : Set ℂ)
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ)
    (numeratorUpper parallelUpper restUpper : ℂ → ℝ) where
  parallel :
    ProjectedJ0D0NegReUpperData
      tiltSeed coreCutoff numeratorUpper parallelUpper Region
  rest :
    ∀ s ∈ Region,
      adjustedProjectedJ0_restCostQuartet coreCutoff s ≤ restUpper s
  budget :
    ∀ s ∈ Region,
      0 < adjustedProjectedJ0_projectedQuartetSurplusLower
        tiltSeed coreCutoff parallelUpper restUpper s

theorem AdjustedProjectedJ0QuartetNegReBoundedData.total_ne_zero
    {Region : Set ℂ}
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ}
    {numeratorUpper parallelUpper restUpper : ℂ → ℝ}
    (data :
      AdjustedProjectedJ0QuartetNegReBoundedData
        Region tiltSeed coreCutoff numeratorUpper parallelUpper restUpper) :
    ∀ s ∈ Region,
      adjustedProjectedJ0_totalQuartet tiltSeed coreCutoff s ≠ 0 := by
  exact
    (AdjustedProjectedJ0QuartetBoundedData.total_ne_zero
      { parallel := data.parallel.toParallelUpperData
        rest := data.rest
        budget := data.budget })

theorem adjustedProjectedJ0_D0_eq_expanded
    (coreCutoff : ℕ → ℕ) (s : ℂ) :
    adjustedProjectedJ0_D0 coreCutoff s =
      (2 : ℂ) * c2ConcreteAntiMiracleAdjustedRatio s ^ 2 *
        (rectangularOddCoreSum s (coreCutoff 0) - oddDirichletChannel s) := by
  unfold adjustedProjectedJ0_D0 c2ConcreteAntiMiracleAdjustedError0
    c2ConcreteOddHorizontalLayerDefect c2ConcreteAntiMiracleAdjustedRatio
  rw [c2ConcreteHorizontalLayerDefect_eq_weighted_odd_error]

theorem adjustedProjectedJ0_D0NegReMain_eq_expanded
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (s : ℂ) :
    adjustedProjectedJ0_D0NegReMain tiltSeed coreCutoff s =
      -(((2 : ℂ) * c2ConcreteAntiMiracleAdjustedRatio s ^ 2 *
        (rectangularOddCoreSum s (coreCutoff 0) - oddDirichletChannel s) *
        starRingEnd ℂ (adjustedProjectedJ0_M tiltSeed s)).re) := by
  unfold adjustedProjectedJ0_D0NegReMain
  rw [adjustedProjectedJ0_D0_eq_expanded]

end AdjustedQuartetProjectedJ0Aliases
end C2
