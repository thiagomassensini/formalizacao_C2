import LeanC2.AuditContinuedQuartetPositiveBoxContinuedOdd

/-!
# Positive box cutoff bridge audit

Audit-only bridge for the positive-box cutoff field.

This file does not prove the numerical cutoff upper bound.  It only records
that a bound on the existing continued cutoff exact upper fills the
`cut_bound` field used by `PositiveBoxCertificate`.
-/

namespace C2
namespace ContinuedQuartetAudit

noncomputable section

/--
Audit-only cutoff upper data for the positive box.

The field is deliberately stated in terms of the existing continued cutoff
exact upper.  This fixes the semantic target of `cutVec` before any numerical
bound is attempted.
-/
structure PositiveBoxCutoffUpperData : Prop where
  cutoff_upper_bound :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      c2ContinuedCutoffExactUpper positiveBoxK positiveBoxM s ≤
        positiveBoxCutUpperValue

/--
The continued cutoff exact upper bound supplies the positive-box `cut_bound`.
-/
theorem PositiveBoxCutoffUpperData.cut_bound
    (data : PositiveBoxCutoffUpperData) :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      ‖cutVec positiveBoxK positiveBoxM s‖ ≤ positiveBoxCutUpperValue := by
  intro s hs
  simpa [c2ContinuedCutoffExactUpper,
    cutVec_eq_continuedCutoffError positiveBoxK positiveBoxM s]
    using data.cutoff_upper_bound hs

/--
A bound on the diagnostic cutoff vector is the same cutoff upper data, because
`cutVec` is definitionally the continued cutoff error used by
`c2ContinuedCutoffExactUpper`.
-/
theorem PositiveBoxCutoffUpperData.of_cut_bound
    (hcut :
      ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
        ‖cutVec positiveBoxK positiveBoxM s‖ ≤ positiveBoxCutUpperValue) :
    PositiveBoxCutoffUpperData where
  cutoff_upper_bound := by
    intro s hs
    simpa [c2ContinuedCutoffExactUpper,
      cutVec_eq_continuedCutoffError positiveBoxK positiveBoxM s]
      using hcut hs

/-- Depth-factor upper bound on the selected positive box. -/
def PositiveBoxDepthFactorUpperBoundOnBox
    (depthUpper : ℂ → ℝ) : Prop :=
  ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
    ‖rectangularDepthFactor s positiveBoxK‖ ≤ depthUpper s

/-- Continued odd-core truncation upper bound on the selected positive box. -/
def PositiveBoxContinuedOddTruncationUpperBoundOnBox
    (oddTruncationUpper : ℂ → ℝ) : Prop :=
  ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
    ‖rectangularOddCoreSum s positiveBoxM -
        continuedOddDirichletChannel s‖ ≤ oddTruncationUpper s

/-- Depth cutoff upper bound on the selected positive box. -/
def PositiveBoxDepthCutoffUpperBoundOnBox
    (depthCutoffUpper : ℂ → ℝ) : Prop :=
  ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
    ‖rectangularDepthFactor s positiveBoxK -
        verticalDepthTailFromTwo s‖ ≤ depthCutoffUpper s

/-- Continued odd-channel upper bound on the selected positive box. -/
def PositiveBoxContinuedOddUpperBoundOnBox
    (continuedOddUpper : ℂ → ℝ) : Prop :=
  ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
    ‖continuedOddDirichletChannel s‖ ≤ continuedOddUpper s

/--
Scalar cutoff budget induced by the depth/core split of the continued cutoff
error.
-/
def PositiveBoxCutoffDepthCoreScalarBudgetOnBox
    (depthUpper oddTruncationUpper depthCutoffUpper
      continuedOddUpper : ℂ → ℝ) : Prop :=
  ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
    2 * depthUpper s * oddTruncationUpper s +
      2 * depthCutoffUpper s * continuedOddUpper s ≤
        positiveBoxCutUpperValue

/--
The depth/core split supplies the positive-box cutoff vector bound.
-/
theorem positiveBox_cut_bound_of_depthCoreScalarBudget
    {depthUpper oddTruncationUpper depthCutoffUpper
      continuedOddUpper : ℂ → ℝ}
    (hdepth :
      PositiveBoxDepthFactorUpperBoundOnBox depthUpper)
    (htrunc :
      PositiveBoxContinuedOddTruncationUpperBoundOnBox
        oddTruncationUpper)
    (hdepthCut :
      PositiveBoxDepthCutoffUpperBoundOnBox depthCutoffUpper)
    (hodd :
      PositiveBoxContinuedOddUpperBoundOnBox continuedOddUpper)
    (hbudget :
      PositiveBoxCutoffDepthCoreScalarBudgetOnBox
        depthUpper oddTruncationUpper depthCutoffUpper
        continuedOddUpper) :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      ‖cutVec positiveBoxK positiveBoxM s‖ ≤ positiveBoxCutUpperValue := by
  intro s hs
  let A : ℂ :=
    (2 : ℂ) * rectangularDepthFactor s positiveBoxK *
      (rectangularOddCoreSum s positiveBoxM -
        continuedOddDirichletChannel s)
  let B : ℂ :=
    (2 : ℂ) *
      (rectangularDepthFactor s positiveBoxK -
        verticalDepthTailFromTwo s) *
      continuedOddDirichletChannel s
  have hdepth_s := hdepth hs
  have htrunc_s := htrunc hs
  have hdepthCut_s := hdepthCut hs
  have hodd_s := hodd hs
  have hdepth_nonneg : 0 ≤ depthUpper s :=
    le_trans (norm_nonneg _) hdepth_s
  have htrunc_nonneg : 0 ≤ oddTruncationUpper s :=
    le_trans (norm_nonneg _) htrunc_s
  have hdepthCut_nonneg : 0 ≤ depthCutoffUpper s :=
    le_trans (norm_nonneg _) hdepthCut_s
  have hodd_nonneg : 0 ≤ continuedOddUpper s :=
    le_trans (norm_nonneg _) hodd_s
  have hprod_A :
      ‖rectangularDepthFactor s positiveBoxK‖ *
          ‖rectangularOddCoreSum s positiveBoxM -
            continuedOddDirichletChannel s‖ ≤
        depthUpper s * oddTruncationUpper s :=
    mul_le_mul hdepth_s htrunc_s (norm_nonneg _) hdepth_nonneg
  have hA :
      ‖A‖ ≤ 2 * depthUpper s * oddTruncationUpper s := by
    unfold A
    rw [norm_mul, norm_mul]
    simp only [Complex.norm_ofNat]
    nlinarith
  have hprod_B :
      ‖rectangularDepthFactor s positiveBoxK -
          verticalDepthTailFromTwo s‖ *
          ‖continuedOddDirichletChannel s‖ ≤
        depthCutoffUpper s * continuedOddUpper s :=
    mul_le_mul hdepthCut_s hodd_s (norm_nonneg _) hdepthCut_nonneg
  have hB :
      ‖B‖ ≤ 2 * depthCutoffUpper s * continuedOddUpper s := by
    unfold B
    rw [norm_mul, norm_mul]
    simp only [Complex.norm_ofNat]
    nlinarith
  have hsplit :
      cutVec positiveBoxK positiveBoxM s = A + B := by
    rw [cutVec_eq_continuedCutoffError,
      c2ContinuedCutoffError_eq_depth_core_split]
  calc
    ‖cutVec positiveBoxK positiveBoxM s‖ = ‖A + B‖ := by rw [hsplit]
    _ ≤ ‖A‖ + ‖B‖ := norm_add_le A B
    _ ≤
        2 * depthUpper s * oddTruncationUpper s +
          2 * depthCutoffUpper s * continuedOddUpper s := by
            exact add_le_add hA hB
    _ ≤ positiveBoxCutUpperValue := hbudget hs

/--
Depth/core cutoff data as a producer of `PositiveBoxCutoffUpperData`.
-/
theorem PositiveBoxCutoffUpperData.of_depthCoreScalarBudget
    {depthUpper oddTruncationUpper depthCutoffUpper
      continuedOddUpper : ℂ → ℝ}
    (hdepth :
      PositiveBoxDepthFactorUpperBoundOnBox depthUpper)
    (htrunc :
      PositiveBoxContinuedOddTruncationUpperBoundOnBox
        oddTruncationUpper)
    (hdepthCut :
      PositiveBoxDepthCutoffUpperBoundOnBox depthCutoffUpper)
    (hodd :
      PositiveBoxContinuedOddUpperBoundOnBox continuedOddUpper)
    (hbudget :
      PositiveBoxCutoffDepthCoreScalarBudgetOnBox
        depthUpper oddTruncationUpper depthCutoffUpper
        continuedOddUpper) :
    PositiveBoxCutoffUpperData :=
  PositiveBoxCutoffUpperData.of_cut_bound
    (positiveBox_cut_bound_of_depthCoreScalarBudget
      hdepth htrunc hdepthCut hodd hbudget)

/-- Explicit positive-box depth-factor upper for `positiveBoxK`. -/
noncomputable def positiveBoxDepthFactorExplicitUpper : ℂ → ℝ :=
  c2RectangularDepthFactorExplicitUpper positiveBoxK

/-- Explicit positive-box depth-cutoff upper for `positiveBoxK`. -/
noncomputable def positiveBoxDepthCutoffExplicitUpper : ℂ → ℝ :=
  fun s => rectangularDepthCutoffUpper s positiveBoxK

/-- Exact continued odd-channel upper. -/
noncomputable def positiveBoxContinuedOddUpperExact : ℂ → ℝ :=
  fun s => ‖continuedOddDirichletChannel s‖

/-- The explicit depth-factor upper applies on the selected positive box. -/
theorem positiveBox_depthFactor_bound_explicit :
    PositiveBoxDepthFactorUpperBoundOnBox
      positiveBoxDepthFactorExplicitUpper := by
  intro s hs
  simpa [positiveBoxDepthFactorExplicitUpper] using
    c2RectangularDepthFactorBound_explicit_of_re_pos
      positiveBoxK (positiveBox_re_pos hs)
      (by norm_num [positiveBoxK])

/-- The explicit depth-cutoff upper applies on the selected positive box. -/
theorem positiveBox_depthCutoff_bound_explicit :
    PositiveBoxDepthCutoffUpperBoundOnBox
      positiveBoxDepthCutoffExplicitUpper := by
  intro s hs
  simpa [positiveBoxDepthCutoffExplicitUpper] using
    rectangularDepthFactor_sub_verticalDepthTailFromTwo_norm_le_explicit_of_re_pos
      s positiveBoxK (positiveBox_re_pos hs)
      (by norm_num [positiveBoxK])

/-- Exact continued odd-channel upper applies on the selected positive box. -/
theorem positiveBox_continuedOddUpper_bound_exact :
    PositiveBoxContinuedOddUpperBoundOnBox
      positiveBoxContinuedOddUpperExact := by
  intro s hs
  exact le_rfl

/--
The continued odd-truncation package supplies the truncation field needed by
the cutoff depth/core split.
-/
theorem PositiveBoxContinuedOddTruncationData.to_cutoffTruncationUpperBoundOnBox
    (data : PositiveBoxContinuedOddTruncationData) :
    PositiveBoxContinuedOddTruncationUpperBoundOnBox
      (fun _ => positiveBoxOddTruncationUpperValue) := by
  intro s hs
  simpa [positiveBoxN, positiveBoxM] using
    data.continued_odd_truncation_bound hs

/--
Scalar target for the explicit depth/core cutoff route.  The depth terms are
fixed by the positive-box geometry; the odd upper remains external.
-/
def PositiveBoxCutoffExplicitDepthCoreScalarBudgetOnBox
    (continuedOddUpper : ℂ → ℝ) : Prop :=
  ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
    2 * positiveBoxDepthFactorExplicitUpper s *
        positiveBoxOddTruncationUpperValue +
      2 * positiveBoxDepthCutoffExplicitUpper s *
        continuedOddUpper s ≤ positiveBoxCutUpperValue

/--
Flexible scalar target for the explicit depth/core cutoff route.

Unlike `PositiveBoxCutoffExplicitDepthCoreScalarBudgetOnBox`, this does not
force the odd-truncation budget to be the horizontal-ledger value
`positiveBoxOddTruncationUpperValue`.
-/
def PositiveBoxCutoffExplicitDepthCoreFlexibleScalarBudgetOnBox
    (oddTruncationUpper continuedOddUpper : ℂ → ℝ) : Prop :=
  ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
    2 * positiveBoxDepthFactorExplicitUpper s *
        oddTruncationUpper s +
      2 * positiveBoxDepthCutoffExplicitUpper s *
        continuedOddUpper s ≤ positiveBoxCutUpperValue

/--
Constant-truncation specialization of the flexible depth/core cutoff budget.
-/
abbrev PositiveBoxCutoffExplicitDepthCoreConstantTruncationScalarBudgetOnBox
    (oddTruncationUpperValue : ℝ)
    (continuedOddUpper : ℂ → ℝ) : Prop :=
  PositiveBoxCutoffExplicitDepthCoreFlexibleScalarBudgetOnBox
    (fun _ => oddTruncationUpperValue) continuedOddUpper

/--
Explicit positive-box depth/core route to `PositiveBoxCutoffUpperData`.
-/
theorem PositiveBoxCutoffUpperData.of_explicitDepthCoreScalarBudget
    (continuedOddData : PositiveBoxContinuedOddTruncationData)
    {continuedOddUpper : ℂ → ℝ}
    (hodd :
      PositiveBoxContinuedOddUpperBoundOnBox continuedOddUpper)
    (hbudget :
      PositiveBoxCutoffExplicitDepthCoreScalarBudgetOnBox
        continuedOddUpper) :
    PositiveBoxCutoffUpperData :=
  PositiveBoxCutoffUpperData.of_depthCoreScalarBudget
    positiveBox_depthFactor_bound_explicit
    continuedOddData.to_cutoffTruncationUpperBoundOnBox
    positiveBox_depthCutoff_bound_explicit
    hodd
    hbudget

/--
Flexible explicit positive-box depth/core route to `PositiveBoxCutoffUpperData`.
-/
theorem PositiveBoxCutoffUpperData.of_explicitDepthCoreFlexibleScalarBudget
    {oddTruncationUpper continuedOddUpper : ℂ → ℝ}
    (htrunc :
      PositiveBoxContinuedOddTruncationUpperBoundOnBox
        oddTruncationUpper)
    (hodd :
      PositiveBoxContinuedOddUpperBoundOnBox continuedOddUpper)
    (hbudget :
      PositiveBoxCutoffExplicitDepthCoreFlexibleScalarBudgetOnBox
        oddTruncationUpper continuedOddUpper) :
    PositiveBoxCutoffUpperData :=
  PositiveBoxCutoffUpperData.of_depthCoreScalarBudget
    positiveBox_depthFactor_bound_explicit
    htrunc
    positiveBox_depthCutoff_bound_explicit
    hodd
    hbudget

/--
Constant-truncation flexible route to `PositiveBoxCutoffUpperData`.
-/
theorem PositiveBoxCutoffUpperData.of_explicitDepthCoreConstantTruncationScalarBudget
    {oddTruncationUpperValue : ℝ}
    {continuedOddUpper : ℂ → ℝ}
    (htrunc :
      PositiveBoxContinuedOddTruncationUpperBoundOnBox
        (fun _ => oddTruncationUpperValue))
    (hodd :
      PositiveBoxContinuedOddUpperBoundOnBox continuedOddUpper)
    (hbudget :
      PositiveBoxCutoffExplicitDepthCoreConstantTruncationScalarBudgetOnBox
        oddTruncationUpperValue continuedOddUpper) :
    PositiveBoxCutoffUpperData :=
  PositiveBoxCutoffUpperData.of_explicitDepthCoreFlexibleScalarBudget
    htrunc hodd hbudget

/-- Exact-odd specialization of the explicit depth/core cutoff scalar target. -/
abbrev PositiveBoxCutoffExplicitDepthCoreExactOddScalarBudgetOnBox : Prop :=
  PositiveBoxCutoffExplicitDepthCoreScalarBudgetOnBox
    positiveBoxContinuedOddUpperExact

/--
Flexible exact-odd specialization of the explicit depth/core cutoff scalar
target.
-/
abbrev PositiveBoxCutoffExplicitDepthCoreFlexibleExactOddScalarBudgetOnBox
    (oddTruncationUpper : ℂ → ℝ) : Prop :=
  PositiveBoxCutoffExplicitDepthCoreFlexibleScalarBudgetOnBox
    oddTruncationUpper positiveBoxContinuedOddUpperExact

/--
Constant-truncation exact-odd specialization of the flexible depth/core cutoff
scalar target.
-/
abbrev PositiveBoxCutoffExplicitDepthCoreConstantTruncationExactOddScalarBudgetOnBox
    (oddTruncationUpperValue : ℝ) : Prop :=
  PositiveBoxCutoffExplicitDepthCoreConstantTruncationScalarBudgetOnBox
    oddTruncationUpperValue positiveBoxContinuedOddUpperExact

/--
Exact-odd specialization of the explicit positive-box depth/core cutoff route.
-/
theorem PositiveBoxCutoffUpperData.of_explicitDepthCoreExactOddScalarBudget
    (continuedOddData : PositiveBoxContinuedOddTruncationData)
    (hbudget :
      PositiveBoxCutoffExplicitDepthCoreExactOddScalarBudgetOnBox) :
    PositiveBoxCutoffUpperData :=
  PositiveBoxCutoffUpperData.of_explicitDepthCoreScalarBudget
    continuedOddData
    positiveBox_continuedOddUpper_bound_exact
    hbudget

/--
Flexible exact-odd specialization of the explicit positive-box depth/core
cutoff route.
-/
theorem PositiveBoxCutoffUpperData.of_explicitDepthCoreFlexibleExactOddScalarBudget
    {oddTruncationUpper : ℂ → ℝ}
    (htrunc :
      PositiveBoxContinuedOddTruncationUpperBoundOnBox
        oddTruncationUpper)
    (hbudget :
      PositiveBoxCutoffExplicitDepthCoreFlexibleExactOddScalarBudgetOnBox
        oddTruncationUpper) :
    PositiveBoxCutoffUpperData :=
  PositiveBoxCutoffUpperData.of_explicitDepthCoreFlexibleScalarBudget
    htrunc
    positiveBox_continuedOddUpper_bound_exact
    hbudget

/--
Constant-truncation exact-odd specialization of the explicit positive-box
depth/core cutoff route.
-/
theorem PositiveBoxCutoffUpperData.of_explicitDepthCoreConstantTruncationExactOddScalarBudget
    {oddTruncationUpperValue : ℝ}
    (htrunc :
      PositiveBoxContinuedOddTruncationUpperBoundOnBox
        (fun _ => oddTruncationUpperValue))
    (hbudget :
      PositiveBoxCutoffExplicitDepthCoreConstantTruncationExactOddScalarBudgetOnBox
        oddTruncationUpperValue) :
    PositiveBoxCutoffUpperData :=
  PositiveBoxCutoffUpperData.of_explicitDepthCoreConstantTruncationScalarBudget
    htrunc
    positiveBox_continuedOddUpper_bound_exact
    hbudget

/--
Direct cutoff-field bridge from the named positive-box cutoff upper value.
-/
theorem positiveBox_cut_bound_of_continuedCutoffExactUpper
    (hcutoff :
      ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
        c2ContinuedCutoffExactUpper positiveBoxK positiveBoxM s ≤
          positiveBoxCutUpperValue) :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      ‖cutVec positiveBoxK positiveBoxM s‖ ≤ positiveBoxCutUpperValue :=
  (PositiveBoxCutoffUpperData.mk hcutoff).cut_bound

/--
Convenience wrapper for the explicit positive-box cutoff target `3 / 1000`.

This does not prove the numerical bound; it only rewrites the target into the
named audit field `positiveBoxCutUpperValue`.
-/
theorem positiveBoxCutoffUpperData_of_three_over_thousand
    (hcutoff :
      ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
        c2ContinuedCutoffExactUpper positiveBoxK positiveBoxM s ≤
          (3 : ℝ) / 1000) :
    PositiveBoxCutoffUpperData where
  cutoff_upper_bound := by
    intro s hs
    simpa [positiveBoxCutUpperValue] using hcutoff hs

/--
Direct cutoff-field bridge from the explicit target `3 / 1000`.
-/
theorem positiveBox_cut_bound_of_continuedCutoffExactUpper_three_over_thousand
    (hcutoff :
      ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
        c2ContinuedCutoffExactUpper positiveBoxK positiveBoxM s ≤
          (3 : ℝ) / 1000) :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      ‖cutVec positiveBoxK positiveBoxM s‖ ≤ positiveBoxCutUpperValue :=
  (positiveBoxCutoffUpperData_of_three_over_thousand hcutoff).cut_bound

/--
Wrapper that fills only the cutoff field of `PositiveBoxCertificate` from
`PositiveBoxCutoffUpperData`; all other positive-box fields remain explicit.
-/
def PositiveBoxCutoffUpperData.toCertificate
    (data : PositiveBoxCutoffUpperData)
    (anchor_bound :
      ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
        ‖anchor s‖ ≤ positiveBoxAnchorUpperValue)
    (sector_lower :
      ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
        positiveBoxSectorLowerValue ≤ ‖verticalQuartetPrefix (q s)‖)
    (ledger_strict :
      ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
        vSplitResidualLedgerQRatio
            positiveBoxN positiveBoxAnchorUpper positiveBoxCutUpper s <
          c2ExpandedQuartetSectorResidualMargin positiveBoxSectorLower s) :
    PositiveBoxCertificate where
  anchor_bound := anchor_bound
  cut_bound := data.cut_bound
  sector_lower := sector_lower
  ledger_strict := ledger_strict

end

end ContinuedQuartetAudit
end C2
