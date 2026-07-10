import LeanC2.AuditContinuedQuartetProfile

/-!
# Horizontal envelope for the continued quartet profile

This module isolates the exact weighted horizontal envelope associated with the
unit/half middle profile.  The envelope is intentionally sharp: it is the
weighted sum of the actual horizontal layer norms.

The new remaining analytic obligation is the summability of this weighted
series on the middle region.
-/

namespace C2
namespace ContinuedQuartetAudit

/--
Exact weighted horizontal envelope for the unit/half profile.

If the weighted layer series is summable, this single scalar envelope controls
every horizontal layer with ratio `1 / 2`.
-/
noncomputable def weightedHorizontalEnvelope
    (coreCutoff : ℕ → ℕ) : ℂ → ℝ :=
  fun s =>
    ∑' j : ℕ,
      ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ /
        (1 / 2 : ℝ) ^ j

theorem weightedHorizontalEnvelope_nonneg
    (coreCutoff : ℕ → ℕ) (s : ℂ) :
    0 ≤ weightedHorizontalEnvelope coreCutoff s := by
  unfold weightedHorizontalEnvelope
  exact tsum_nonneg fun j =>
    div_nonneg (norm_nonneg _)
      (pow_nonneg (by norm_num : 0 ≤ (1 / 2 : ℝ)) j)

theorem weightedHorizontalEnvelope_layer_bound
    {coreCutoff : ℕ → ℕ} {s : ℂ}
    (hweighted :
      Summable fun j : ℕ =>
        ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ /
          (1 / 2 : ℝ) ^ j) :
    C2ExpandedHorizontalLayerBudget
      coreCutoff
      (weightedHorizontalEnvelope coreCutoff)
      unitScale halfHorizontalRatio s := by
  refine ⟨?_⟩
  intro j
  have hterm_le :
      ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ /
          (1 / 2 : ℝ) ^ j ≤
        weightedHorizontalEnvelope coreCutoff s := by
    unfold weightedHorizontalEnvelope
    exact hweighted.le_tsum j (fun k _hk =>
      div_nonneg (norm_nonneg _)
        (pow_nonneg (by norm_num : 0 ≤ (1 / 2 : ℝ)) k))
  have hpow_pos : 0 < (1 / 2 : ℝ) ^ j :=
    pow_pos (by norm_num : 0 < (1 / 2 : ℝ)) j
  have hmul :=
    mul_le_mul_of_nonneg_right hterm_le (le_of_lt hpow_pos)
  have hleft :
      (‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ /
          (1 / 2 : ℝ) ^ j) *
          (1 / 2 : ℝ) ^ j =
        ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ := by
    exact div_mul_cancel₀ _ (ne_of_gt hpow_pos)
  simpa [unitScale, halfHorizontalRatio, hleft] using hmul

theorem UnitHalfExactProfileLocalData.ofWeightedHorizontalEnvelope
    {coreCutoff : ℕ → ℕ} {K M : ℕ} {s : ℂ}
    (hoff : offCriticalStrip s)
    (hweighted :
      Summable fun j : ℕ =>
        ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ /
          (1 / 2 : ℝ) ^ j)
    (hdominance :
      c2QuartetBulkGUpper
          (c2BulkGUpper
            (c2TiltAnalyticRegularizedUpper
              (exactResidualTiltConstant K M
                (weightedHorizontalEnvelope coreCutoff))
              unitScale)
            (c2HorizontalRegularizedUpper
              (weightedHorizontalEnvelope coreCutoff)
              unitScale halfHorizontalRatio)) s +
        c2BulkEUpper
          (c2CutoffUpperFromScale
            (exactResidualCutoffConstant K M) unitScale) s <
          c2QuartetBulkK2Lower s * ((1 - ‖q s‖) * (1 + ‖q s‖ ^ 2))) :
    UnitHalfExactProfileLocalData
      coreCutoff K M (weightedHorizontalEnvelope coreCutoff) s :=
  UnitHalfExactProfileLocalData.ofHorizontalLayerBudget
    hoff
    (weightedHorizontalEnvelope_nonneg coreCutoff s)
    (weightedHorizontalEnvelope_layer_bound hweighted)
    hdominance

/--
The weighted horizontal summability obligation follows from any summable
majorant for the odd truncation error after applying the exact C2 horizontal
weight.
-/
theorem weightedHorizontalLayerSeries_summable_of_truncationMajorant
    {coreCutoff : ℕ → ℕ} {oddTruncationUpper : ℂ → ℕ → ℝ} {s : ℂ}
    (htruncation : ∀ j : ℕ,
      ‖c2ConcreteOddTruncationError coreCutoff s j‖ ≤ oddTruncationUpper s j)
    (hsummable :
      Summable fun j : ℕ =>
        (2 * ‖q s‖ ^ (j + 2) * oddTruncationUpper s j) /
          (1 / 2 : ℝ) ^ j) :
    Summable fun j : ℕ =>
      ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ /
        (1 / 2 : ℝ) ^ j := by
  exact Summable.of_nonneg_of_le
    (fun j =>
      div_nonneg (norm_nonneg _)
        (pow_nonneg (by norm_num : 0 ≤ (1 / 2 : ℝ)) j))
    (fun j => by
      have hfactor_nonneg : 0 ≤ 2 * ‖q s‖ ^ (j + 2) := by positivity
      have hweighted :
          2 * ‖q s‖ ^ (j + 2) *
              ‖c2ConcreteOddTruncationError coreCutoff s j‖ ≤
            2 * ‖q s‖ ^ (j + 2) * oddTruncationUpper s j := by
        exact mul_le_mul_of_nonneg_left (htruncation j) hfactor_nonneg
      have hden_nonneg : 0 ≤ (1 / 2 : ℝ) ^ j :=
        pow_nonneg (by norm_num : 0 ≤ (1 / 2 : ℝ)) j
      calc
        ‖c2ConcreteOddHorizontalLayerDefect coreCutoff s j‖ /
            (1 / 2 : ℝ) ^ j =
          (2 * ‖q s‖ ^ (j + 2) *
              ‖c2ConcreteOddTruncationError coreCutoff s j‖) /
            (1 / 2 : ℝ) ^ j := by
              rw [c2ConcreteOddHorizontalLayerDefect_norm_eq]
        _ ≤
          (2 * ‖q s‖ ^ (j + 2) * oddTruncationUpper s j) /
            (1 / 2 : ℝ) ^ j := by
              exact div_le_div_of_nonneg_right hweighted hden_nonneg)
    hsummable

/--
Profile-local data from a truncation majorant.  This is the next audit target:
prove a concrete `oddTruncationUpper` whose C2-weighted series is summable, and
then verify the remaining dominance inequality.
-/
theorem UnitHalfExactProfileLocalData.ofTruncationMajorant
    {coreCutoff : ℕ → ℕ} {K M : ℕ}
    {oddTruncationUpper : ℂ → ℕ → ℝ} {s : ℂ}
    (hoff : offCriticalStrip s)
    (htruncation : ∀ j : ℕ,
      ‖c2ConcreteOddTruncationError coreCutoff s j‖ ≤ oddTruncationUpper s j)
    (hsummable :
      Summable fun j : ℕ =>
        (2 * ‖q s‖ ^ (j + 2) * oddTruncationUpper s j) /
          (1 / 2 : ℝ) ^ j)
    (hdominance :
      c2QuartetBulkGUpper
          (c2BulkGUpper
            (c2TiltAnalyticRegularizedUpper
              (exactResidualTiltConstant K M
                (weightedHorizontalEnvelope coreCutoff))
              unitScale)
            (c2HorizontalRegularizedUpper
              (weightedHorizontalEnvelope coreCutoff)
              unitScale halfHorizontalRatio)) s +
        c2BulkEUpper
          (c2CutoffUpperFromScale
            (exactResidualCutoffConstant K M) unitScale) s <
          c2QuartetBulkK2Lower s * ((1 - ‖q s‖) * (1 + ‖q s‖ ^ 2))) :
    UnitHalfExactProfileLocalData
      coreCutoff K M (weightedHorizontalEnvelope coreCutoff) s :=
  UnitHalfExactProfileLocalData.ofWeightedHorizontalEnvelope
    hoff
    (weightedHorizontalLayerSeries_summable_of_truncationMajorant
      htruncation hsummable)
    hdominance

/-- In the open right half-plane, the C2-weighted horizontal ratio is strict. -/
theorem two_mul_q_norm_lt_one_of_re_pos (s : ℂ) (hs : 0 < s.re) :
    2 * ‖q s‖ < 1 := by
  have hqnorm :
      ‖q s‖ =
        (1 / 2 : ℝ) * Real.exp (-(s.re * Real.log (2 : ℝ))) := by
    simpa [q] using verticalRatio_norm s
  have hlog2 : 0 < Real.log (2 : ℝ) := Real.log_pos (by norm_num)
  have hmul_pos : 0 < s.re * Real.log (2 : ℝ) := mul_pos hs hlog2
  have hexp_lt_one : Real.exp (-(s.re * Real.log (2 : ℝ))) < 1 := by
    rw [← Real.exp_zero]
    exact Real.exp_lt_exp.mpr (by linarith)
  calc
    2 * ‖q s‖ =
        Real.exp (-(s.re * Real.log (2 : ℝ))) := by
          rw [hqnorm]
          ring
    _ < 1 := hexp_lt_one

/--
A uniform odd-truncation majorant is enough for weighted horizontal
summability, because `2 * ‖q s‖ < 1` on the open right half-plane.
-/
theorem c2WeightedTruncationMajorant_summable_of_uniformBound
    {oddTruncationUpper : ℂ → ℕ → ℝ} {s : ℂ} {C : ℝ}
    (hs : 0 < s.re)
    (hupper_nonneg : ∀ j : ℕ, 0 ≤ oddTruncationUpper s j)
    (hupper : ∀ j : ℕ, oddTruncationUpper s j ≤ C) :
    Summable fun j : ℕ =>
      (2 * ‖q s‖ ^ (j + 2) * oddTruncationUpper s j) /
        (1 / 2 : ℝ) ^ j := by
  have hratio_nonneg : 0 ≤ 2 * ‖q s‖ := by positivity
  have hratio_lt_one : 2 * ‖q s‖ < 1 :=
    two_mul_q_norm_lt_one_of_re_pos s hs
  have hgeom : Summable fun j : ℕ => (2 * ‖q s‖) ^ j :=
    summable_geometric_of_lt_one hratio_nonneg hratio_lt_one
  have hmajor :
      Summable fun j : ℕ =>
        (2 * ‖q s‖ ^ 2 * C) * (2 * ‖q s‖) ^ j :=
    hgeom.mul_left (2 * ‖q s‖ ^ 2 * C)
  exact Summable.of_nonneg_of_le
    (fun j =>
      div_nonneg
        (mul_nonneg
          (mul_nonneg (by positivity) (pow_nonneg (norm_nonneg _) _))
          (hupper_nonneg j))
        (pow_nonneg (by norm_num : 0 ≤ (1 / 2 : ℝ)) j))
    (fun j => by
      have hfactor_nonneg : 0 ≤ 2 * ‖q s‖ ^ (j + 2) := by positivity
      have hweighted :
          2 * ‖q s‖ ^ (j + 2) * oddTruncationUpper s j ≤
            2 * ‖q s‖ ^ (j + 2) * C := by
        exact mul_le_mul_of_nonneg_left (hupper j) hfactor_nonneg
      have hden_nonneg : 0 ≤ (1 / 2 : ℝ) ^ j :=
        pow_nonneg (by norm_num : 0 ≤ (1 / 2 : ℝ)) j
      calc
        (2 * ‖q s‖ ^ (j + 2) * oddTruncationUpper s j) /
            (1 / 2 : ℝ) ^ j ≤
          (2 * ‖q s‖ ^ (j + 2) * C) /
            (1 / 2 : ℝ) ^ j := by
              exact div_le_div_of_nonneg_right hweighted hden_nonneg
        _ = (2 * ‖q s‖ ^ 2 * C) * (2 * ‖q s‖) ^ j := by
              rw [pow_add, mul_pow]
              field_simp
              have hcancel : (1 / 2 : ℝ) ^ j * 2 ^ j = 1 := by
                rw [← mul_pow]
                norm_num
              calc
                ‖q s‖ ^ j * ‖q s‖ ^ 2 * C =
                    ‖q s‖ ^ j * ‖q s‖ ^ 2 * C * 1 := by
                      ring
                _ = ‖q s‖ ^ j * ‖q s‖ ^ 2 * C *
                    ((1 / 2 : ℝ) ^ j * 2 ^ j) := by
                      rw [hcancel]
                _ = ‖q s‖ ^ j * ‖q s‖ ^ 2 * C *
                    (1 / 2 : ℝ) ^ j * 2 ^ j := by
                      ring)
    hmajor

/--
Profile-local data from a uniform odd-truncation bound.  The remaining
horizontal task is now: find a finite constant `C` controlling the continued
odd truncation error uniformly in the horizontal layer index.
-/
theorem UnitHalfExactProfileLocalData.ofUniformTruncationBound
    {coreCutoff : ℕ → ℕ} {K M : ℕ} {s : ℂ} {C : ℝ}
    (hoff : offCriticalStrip s)
    (hC_nonneg : 0 ≤ C)
    (htruncation : ∀ j : ℕ,
      ‖c2ConcreteOddTruncationError coreCutoff s j‖ ≤ C)
    (hdominance :
      c2QuartetBulkGUpper
          (c2BulkGUpper
            (c2TiltAnalyticRegularizedUpper
              (exactResidualTiltConstant K M
                (weightedHorizontalEnvelope coreCutoff))
              unitScale)
            (c2HorizontalRegularizedUpper
              (weightedHorizontalEnvelope coreCutoff)
              unitScale halfHorizontalRatio)) s +
        c2BulkEUpper
          (c2CutoffUpperFromScale
            (exactResidualCutoffConstant K M) unitScale) s <
          c2QuartetBulkK2Lower s * ((1 - ‖q s‖) * (1 + ‖q s‖ ^ 2))) :
    UnitHalfExactProfileLocalData
      coreCutoff K M (weightedHorizontalEnvelope coreCutoff) s :=
  UnitHalfExactProfileLocalData.ofTruncationMajorant
    (oddTruncationUpper := fun _ _ => C)
    hoff
    htruncation
    (c2WeightedTruncationMajorant_summable_of_uniformBound
      (oddTruncationUpper := fun _ _ => C)
      hoff.1
      (fun _ => hC_nonneg)
      (fun _ => le_rfl))
    hdominance

/--
The concrete odd-truncation error is controlled by any uniform bound for the
finite odd-core sums, plus any pointwise bound for the odd reference channel.
-/
theorem c2ConcreteOddTruncationError_uniformBound_of_core_odd_bounds
    {coreCutoff : ℕ → ℕ} {s : ℂ} {coreUpper oddUpper C : ℝ}
    (hcore : ∀ j : ℕ,
      ‖rectangularOddCoreSum s (coreCutoff j)‖ ≤ coreUpper)
    (hodd : ‖oddDirichletChannel s‖ ≤ oddUpper)
    (hC : coreUpper + oddUpper ≤ C) :
    ∀ j : ℕ,
      ‖c2ConcreteOddTruncationError coreCutoff s j‖ ≤ C := by
  intro j
  have htriangle :
      ‖c2ConcreteOddTruncationError coreCutoff s j‖ ≤
        ‖rectangularOddCoreSum s (coreCutoff j)‖ + ‖oddDirichletChannel s‖ := by
    unfold c2ConcreteOddTruncationError c2OddTruncationError
    simpa [sub_eq_add_neg, norm_neg] using
      norm_add_le (rectangularOddCoreSum s (coreCutoff j)) (-(oddDirichletChannel s))
  have hsum :
      ‖rectangularOddCoreSum s (coreCutoff j)‖ + ‖oddDirichletChannel s‖ ≤
        coreUpper + oddUpper :=
    add_le_add (hcore j) hodd
  exact le_trans htriangle (le_trans hsum hC)

/--
Exact-reference version of the previous bound.  The only remaining input is a
uniform bound for the finite odd-core sums along the chosen cutoff schedule.
-/
theorem c2ConcreteOddTruncationError_uniformBound_of_core_bound
    {coreCutoff : ℕ → ℕ} {s : ℂ} {coreUpper : ℝ}
    (hcore : ∀ j : ℕ,
      ‖rectangularOddCoreSum s (coreCutoff j)‖ ≤ coreUpper) :
    ∀ j : ℕ,
      ‖c2ConcreteOddTruncationError coreCutoff s j‖ ≤
        coreUpper + ‖oddDirichletChannel s‖ :=
  c2ConcreteOddTruncationError_uniformBound_of_core_odd_bounds
    hcore le_rfl le_rfl

/--
Profile-local data from uniform finite-core and odd-channel bounds.  This keeps
dominance as the only later quartet-size comparison after the horizontal
summability obligation has been supplied.
-/
theorem UnitHalfExactProfileLocalData.ofUniformCoreOddBounds
    {coreCutoff : ℕ → ℕ} {K M : ℕ} {s : ℂ} {coreUpper oddUpper C : ℝ}
    (hoff : offCriticalStrip s)
    (hC_nonneg : 0 ≤ C)
    (hcore : ∀ j : ℕ,
      ‖rectangularOddCoreSum s (coreCutoff j)‖ ≤ coreUpper)
    (hodd : ‖oddDirichletChannel s‖ ≤ oddUpper)
    (hC : coreUpper + oddUpper ≤ C)
    (hdominance :
      c2QuartetBulkGUpper
          (c2BulkGUpper
            (c2TiltAnalyticRegularizedUpper
              (exactResidualTiltConstant K M
                (weightedHorizontalEnvelope coreCutoff))
              unitScale)
            (c2HorizontalRegularizedUpper
              (weightedHorizontalEnvelope coreCutoff)
              unitScale halfHorizontalRatio)) s +
        c2BulkEUpper
          (c2CutoffUpperFromScale
            (exactResidualCutoffConstant K M) unitScale) s <
          c2QuartetBulkK2Lower s * ((1 - ‖q s‖) * (1 + ‖q s‖ ^ 2))) :
    UnitHalfExactProfileLocalData
      coreCutoff K M (weightedHorizontalEnvelope coreCutoff) s :=
  UnitHalfExactProfileLocalData.ofUniformTruncationBound
    hoff hC_nonneg
    (c2ConcreteOddTruncationError_uniformBound_of_core_odd_bounds
      hcore hodd hC)
    hdominance

/--
Exact-reference profile constructor: after choosing
`C = coreUpper + ‖oddDirichletChannel s‖`, the horizontal obligation is reduced
to a uniform bound for the finite odd-core sums along `coreCutoff`.
-/
theorem UnitHalfExactProfileLocalData.ofUniformCoreBound
    {coreCutoff : ℕ → ℕ} {K M : ℕ} {s : ℂ} {coreUpper : ℝ}
    (hoff : offCriticalStrip s)
    (hcore : ∀ j : ℕ,
      ‖rectangularOddCoreSum s (coreCutoff j)‖ ≤ coreUpper)
    (hdominance :
      c2QuartetBulkGUpper
          (c2BulkGUpper
            (c2TiltAnalyticRegularizedUpper
              (exactResidualTiltConstant K M
                (weightedHorizontalEnvelope coreCutoff))
              unitScale)
            (c2HorizontalRegularizedUpper
              (weightedHorizontalEnvelope coreCutoff)
              unitScale halfHorizontalRatio)) s +
        c2BulkEUpper
          (c2CutoffUpperFromScale
            (exactResidualCutoffConstant K M) unitScale) s <
          c2QuartetBulkK2Lower s * ((1 - ‖q s‖) * (1 + ‖q s‖ ^ 2))) :
    UnitHalfExactProfileLocalData
      coreCutoff K M (weightedHorizontalEnvelope coreCutoff) s := by
  have hcore_nonneg : 0 ≤ coreUpper :=
    le_trans (norm_nonneg (rectangularOddCoreSum s (coreCutoff 0))) (hcore 0)
  exact UnitHalfExactProfileLocalData.ofUniformCoreOddBounds
    hoff
    (add_nonneg hcore_nonneg (norm_nonneg _))
    hcore
    le_rfl
    le_rfl
    hdominance

/--
Finite-core upper version.  This is useful when the cutoff schedule has already
been bounded by explicit finite-sum envelopes.
-/
theorem UnitHalfExactProfileLocalData.ofFiniteCoreUpperBound
    {coreCutoff : ℕ → ℕ} {K M : ℕ} {s : ℂ} {coreUpper : ℝ}
    (hoff : offCriticalStrip s)
    (hfiniteCore : ∀ j : ℕ,
      c2RectangularOddCoreFiniteUpper (coreCutoff j) s ≤ coreUpper)
    (hdominance :
      c2QuartetBulkGUpper
          (c2BulkGUpper
            (c2TiltAnalyticRegularizedUpper
              (exactResidualTiltConstant K M
                (weightedHorizontalEnvelope coreCutoff))
              unitScale)
            (c2HorizontalRegularizedUpper
              (weightedHorizontalEnvelope coreCutoff)
              unitScale halfHorizontalRatio)) s +
        c2BulkEUpper
          (c2CutoffUpperFromScale
            (exactResidualCutoffConstant K M) unitScale) s <
          c2QuartetBulkK2Lower s * ((1 - ‖q s‖) * (1 + ‖q s‖ ^ 2))) :
    UnitHalfExactProfileLocalData
      coreCutoff K M (weightedHorizontalEnvelope coreCutoff) s :=
  UnitHalfExactProfileLocalData.ofUniformCoreBound
    (coreUpper := coreUpper)
    hoff
    (fun j =>
      le_trans
        (rectangularOddCoreSum_norm_le_finiteUpper s (coreCutoff j))
        (hfiniteCore j))
    hdominance

/--
Constant horizontal cutoff constructor.  For `coreCutoff := fun _ => N`, the
finite odd-core bound is uniform in the horizontal layer index by definition.
Thus the continued middle profile is reduced to the quartet dominance inequality.
-/
theorem UnitHalfExactProfileLocalData.ofConstantCoreCutoff
    {K M N : ℕ} {s : ℂ}
    (hoff : offCriticalStrip s)
    (hdominance :
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
          c2QuartetBulkK2Lower s * ((1 - ‖q s‖) * (1 + ‖q s‖ ^ 2))) :
    UnitHalfExactProfileLocalData
      (fun _ : ℕ => N) K M
      (weightedHorizontalEnvelope (fun _ : ℕ => N)) s :=
  UnitHalfExactProfileLocalData.ofFiniteCoreUpperBound
    (coreUpper := c2RectangularOddCoreFiniteUpper N s)
    hoff
    (fun _ => le_rfl)
    hdominance

/--
Middle-region dominance package for the constant horizontal cutoff route.  The
horizontal summability and scale obligations are already discharged by
`UnitHalfExactProfileLocalData.ofConstantCoreCutoff`.
-/
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

theorem ConstantCoreCutoffMiddleDominanceInputs.toMiddleInputs
    {N K M : ℕ}
    (data : ConstantCoreCutoffMiddleDominanceInputs N K M) :
    UnitHalfExactProfileMiddleInputs
      (fun _ : ℕ => N) K M
      (weightedHorizontalEnvelope (fun _ : ℕ => N)) where
  middle := fun {_s} hs =>
    UnitHalfExactProfileLocalData.ofConstantCoreCutoff
      (N := N) hs.1 (data.dominance hs)

theorem ConstantCoreCutoffMiddleDominanceInputs.riemannHypothesis
    {N K M : ℕ}
    (data : ConstantCoreCutoffMiddleDominanceInputs N K M) :
    RiemannHypothesis :=
  data.toMiddleInputs.riemannHypothesis

end ContinuedQuartetAudit
end C2
