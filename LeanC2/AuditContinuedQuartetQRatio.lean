import LeanC2.AuditContinuedQuartetDominance

/-!
# Q-ratio horizontal profile for the continued quartet audit

This file is an audit-only candidate profile.  It does not replace the active
route.  The point is to test the horizontal ratio `‖q s‖`, which matches the
actual C2 horizontal layer damping for a constant core cutoff.
-/

namespace C2
namespace ContinuedQuartetAudit

/-- Candidate horizontal ratio matching the actual C2 layer damping. -/
noncomputable def qNormHorizontalRatio : ℂ → ℝ :=
  fun s => ‖q s‖

/--
Amplitude for the constant-cutoff q-ratio horizontal profile.

For `coreCutoff := fun _ => N`, every odd truncation error is the same as the
`j = 0` error, while the horizontal layer contributes the factor
`2 * ‖q s‖ ^ (j + 2)`.
-/
noncomputable def constantCoreHorizontalAmplitudeQRatio
    (N : ℕ) : ℂ → ℝ :=
  fun s => 2 * ‖q s‖ ^ 2 * constantCoreOddTruncationNorm N s

/-- Regularized horizontal upper for the q-ratio constant-cutoff profile. -/
noncomputable def constantCoreHorizontalUpperQRatio
    (N : ℕ) : ℂ → ℝ :=
  c2HorizontalRegularizedUpper
    (constantCoreHorizontalAmplitudeQRatio N)
    unitScale
    qNormHorizontalRatio

theorem qNormHorizontalRatio_nonneg (s : ℂ) :
    0 ≤ qNormHorizontalRatio s := by
  unfold qNormHorizontalRatio
  exact norm_nonneg _

theorem qNormHorizontalRatio_lt_one_of_re_pos
    {s : ℂ} (hs : 0 < s.re) :
    qNormHorizontalRatio s < 1 := by
  unfold qNormHorizontalRatio
  exact q_norm_lt_one_of_re_pos s hs

theorem qNormHorizontalRatio_lt_one_of_offCriticalStrip
    {s : ℂ} (hs : offCriticalStrip s) :
    qNormHorizontalRatio s < 1 :=
  qNormHorizontalRatio_lt_one_of_re_pos hs.1

theorem constantCoreHorizontalAmplitudeQRatio_nonneg
    (N : ℕ) (s : ℂ) :
    0 ≤ constantCoreHorizontalAmplitudeQRatio N s := by
  unfold constantCoreHorizontalAmplitudeQRatio constantCoreOddTruncationNorm
  positivity

/--
Layer budget for the constant-cutoff q-ratio profile.

This is the main local reason to prefer the q-ratio profile over the old
unit-half weighted envelope: the geometric ratio is exactly `‖q s‖`.
-/
theorem constantCoreHorizontalLayerBudgetQRatio
    (N : ℕ) (s : ℂ) :
    C2ExpandedHorizontalLayerBudget
      (constantCoreCutoff N)
      (constantCoreHorizontalAmplitudeQRatio N)
      unitScale
      qNormHorizontalRatio
      s := by
  refine ⟨?_⟩
  intro j
  rw [c2ConcreteOddHorizontalLayerDefect_norm_eq]
  rw [c2ConcreteOddTruncationError_constantCoreCutoff N s j]
  have hpow :
      ‖q s‖ ^ (j + 2) = ‖q s‖ ^ 2 * ‖q s‖ ^ j := by
    rw [show j + 2 = 2 + j by omega]
    rw [pow_add]
  apply le_of_eq
  calc
    2 * ‖q s‖ ^ (j + 2) *
        ‖c2ConcreteOddTruncationError (constantCoreCutoff N) s 0‖ =
      (2 * ‖q s‖ ^ 2 *
          ‖c2ConcreteOddTruncationError (constantCoreCutoff N) s 0‖) *
        ‖q s‖ ^ j := by
          rw [hpow]
          ring
    _ =
      (constantCoreHorizontalAmplitudeQRatio N s / unitScale s) *
        qNormHorizontalRatio s ^ j := by
          simp [constantCoreHorizontalAmplitudeQRatio,
            constantCoreOddTruncationNorm, unitScale,
            qNormHorizontalRatio]

/-- Tilt constant for the q-ratio constant-cutoff profile. -/
noncomputable def constantCoreTiltConstantQRatio
    (N K M : ℕ) : ℂ → ℝ :=
  fun s =>
    (c2ContinuedVerticalResidualExactUpper K M s +
      constantCoreHorizontalUpperQRatio N s) *
      (1 + ‖q s‖)

/-- Residual upper for the q-ratio constant-cutoff profile. -/
noncomputable def constantCoreResidualUpperQRatio
    (N K M : ℕ) : ℂ → ℝ :=
  c2ExpandedQuartetResidualUpper
    (constantCoreTiltConstantQRatio N K M) unitScale
    (constantCoreHorizontalAmplitudeQRatio N) unitScale qNormHorizontalRatio
    (constantCoreCutoffConstant K M) unitScale

/-- Closed expression for the q-ratio residual upper. -/
noncomputable def constantCoreGeometricResidualUpperQRatio
    (N K M : ℕ) : ℂ → ℝ :=
  fun s =>
    ((c2ContinuedVerticalResidualExactUpper K M s +
        constantCoreHorizontalUpperQRatio N s) *
      (1 + ‖q s‖)) *
      (1 - ‖q s‖)⁻¹ +
    constantCoreHorizontalUpperQRatio N s +
    c2ContinuedCutoffExactUpper K M s

theorem constantCoreResidualUpperQRatio_eq_geometric
    (N K M : ℕ) (s : ℂ) :
    constantCoreResidualUpperQRatio N K M s =
      constantCoreGeometricResidualUpperQRatio N K M s := by
  simp [constantCoreResidualUpperQRatio,
    constantCoreGeometricResidualUpperQRatio,
    constantCoreTiltConstantQRatio, constantCoreHorizontalUpperQRatio,
    constantCoreCutoffConstant, exactResidualCutoffConstant,
    c2ExpandedQuartetResidualUpper, c2TiltAnalyticRegularizedUpper,
    c2TiltRegularizedUpper, c2TiltAnalyticRatio,
    c2CutoffUpperFromScale, unitScale]

/-- Full quartet dominance for the q-ratio constant-cutoff profile. -/
def ConstantCoreCutoffFullDominanceQRatio
    (N K M : ℕ) (s : ℂ) : Prop :=
  C2ExpandedQuartetDominance
    (constantCoreTiltConstantQRatio N K M) unitScale
    (constantCoreHorizontalAmplitudeQRatio N) unitScale qNormHorizontalRatio
    (constantCoreCutoffConstant K M) unitScale s

/-- Residual dominance for the q-ratio constant-cutoff profile. -/
def ConstantCoreCutoffResidualDominanceQRatio
    (N K M : ℕ) (s : ℂ) : Prop :=
  constantCoreResidualUpperQRatio N K M s <
    c2ExpandedQuartetResidualMargin s

theorem ConstantCoreCutoffFullDominanceQRatio.ofResidualDominance
    {N K M : ℕ} {s : ℂ}
    (hres : ConstantCoreCutoffResidualDominanceQRatio N K M s) :
    ConstantCoreCutoffFullDominanceQRatio N K M s := by
  unfold ConstantCoreCutoffResidualDominanceQRatio at hres
  unfold ConstantCoreCutoffFullDominanceQRatio
  exact c2ExpandedQuartetDominance_of_residualBound
    (by
      simpa [constantCoreResidualUpperQRatio] using hres)

end ContinuedQuartetAudit
end C2
