import LeanC2.AuditContinuedQuartetPositiveBoxInterval

/-!
# Positive-box sector lower audit

ROUTE_TAG: AUDIT_SHIM
ROUTE_TAG: OPTIONAL_REFINEMENT

This file isolates the quartet-prefix sector field for the selected positive
box.  It does not touch the abstract odd-reference files and does not promote
the box to the main route.
-/

namespace C2
namespace ContinuedQuartetAudit

noncomputable section

/-- Lower guard for the first quartet-prefix factor. -/
def positiveBoxOneAddQLowerValue : ℝ :=
  (4091 : ℝ) / 5000

/-- Lower guard for the second quartet-prefix factor. -/
def positiveBoxOneAddQSqLowerValue : ℝ :=
  (1001 : ℝ) / 1000

/-- Sharper q-norm lower needed by the `1 + q^2` factor. -/
def positiveBoxQNormSharpLowerValue : ℝ :=
  (11 : ℝ) / 40

/-- Sharper q-norm upper useful for the `1 + q` coupled factor. -/
def positiveBoxQNormSharpUpperValue : ℝ :=
  (7 : ℝ) / 25

/-- Real-part lower target for `q`; useful for the phase audit. -/
def positiveBoxReQLowerValue : ℝ :=
  -(21 : ℝ) / 100

/-- Real-part lower target for `q^2`. -/
def positiveBoxReQSqLowerValue : ℝ :=
  -(1 : ℝ) / 600

/-- The selected factor guards pay the sector lower. -/
theorem positiveBoxSectorLowerValue_le_factorProduct :
    positiveBoxSectorLowerValue ≤
      positiveBoxOneAddQLowerValue * positiveBoxOneAddQSqLowerValue := by
  norm_num [positiveBoxSectorLowerValue, positiveBoxOneAddQLowerValue,
    positiveBoxOneAddQSqLowerValue]

/-- Closed lower endpoint for the sharper q-norm bracket. -/
theorem positiveBox_q_sharp_endpoint_lower :
    positiveBoxQNormSharpLowerValue ≤
      (1 : ℝ) / 2 *
        Real.exp (-(positiveBoxSigmaMax * Real.log (2 : ℝ))) := by
  have hlog20_11_lower :
      (17784 : ℝ) / 29791 ≤ Real.log ((20 : ℝ) / 11) := by
    have h :=
      Real.sum_range_le_log_div
        (x := (9 : ℝ) / 31) (by norm_num) (by norm_num) 2
    norm_num at h ⊢
    nlinarith
  have hlog2_scaled_upper :
      ((43 : ℝ) / 50) * Real.log (2 : ℝ) ≤
        (17784 : ℝ) / 29791 := by
    have h := Real.log_two_lt_d9
    norm_num at h ⊢
    nlinarith
  have hlog_scaled :
      ((43 : ℝ) / 50) * Real.log (2 : ℝ) ≤
        Real.log ((20 : ℝ) / 11) :=
    le_trans hlog2_scaled_upper hlog20_11_lower
  have hlog_inv :
      Real.log ((11 : ℝ) / 20) =
        -Real.log ((20 : ℝ) / 11) := by
    rw [show ((11 : ℝ) / 20) = (((20 : ℝ) / 11)⁻¹) by norm_num,
      Real.log_inv]
  have hlog_target :
      Real.log ((11 : ℝ) / 20) ≤
        -(positiveBoxSigmaMax * Real.log (2 : ℝ)) := by
    rw [hlog_inv]
    norm_num [positiveBoxSigmaMax]
    linarith
  have hexp :
      (11 : ℝ) / 20 ≤
        Real.exp (-(positiveBoxSigmaMax * Real.log (2 : ℝ))) :=
    (Real.log_le_iff_le_exp (by norm_num : 0 < (11 : ℝ) / 20)).mp
      hlog_target
  calc
    positiveBoxQNormSharpLowerValue = (1 : ℝ) / 2 * ((11 : ℝ) / 20) := by
      norm_num [positiveBoxQNormSharpLowerValue]
    _ ≤ (1 : ℝ) / 2 *
        Real.exp (-(positiveBoxSigmaMax * Real.log (2 : ℝ))) := by
      exact mul_le_mul_of_nonneg_left hexp (by norm_num)

/-- Closed upper endpoint for a sharper q-norm bracket. -/
theorem positiveBox_q_sharp_endpoint_upper :
    (1 : ℝ) / 2 *
        Real.exp (-(positiveBoxSigmaMin * Real.log (2 : ℝ))) ≤
      positiveBoxQNormSharpUpperValue := by
  have hhalf_log25_14 :
      (1 : ℝ) / 2 * Real.log ((25 : ℝ) / 14) ≤
        (36636316651 : ℝ) / 126313878600 := by
    have h :=
      Real.log_div_le_sum_range_add
        (x := (11 : ℝ) / 39) (by norm_num) (by norm_num) 3
    norm_num at h ⊢
    exact h
  have hlog25_14_upper :
      Real.log ((25 : ℝ) / 14) ≤
        (36636316651 : ℝ) / 63156939300 := by
    nlinarith
  have hlog2_scaled_lower :
      (36636316651 : ℝ) / 63156939300 ≤
        ((21 : ℝ) / 25) * Real.log (2 : ℝ) := by
    have h := Real.log_two_gt_d9
    norm_num at h ⊢
    nlinarith
  have hlog_scaled :
      Real.log ((25 : ℝ) / 14) ≤
        ((21 : ℝ) / 25) * Real.log (2 : ℝ) :=
    le_trans hlog25_14_upper hlog2_scaled_lower
  have hlog_inv :
      Real.log ((14 : ℝ) / 25) =
        -Real.log ((25 : ℝ) / 14) := by
    rw [show ((14 : ℝ) / 25) = (((25 : ℝ) / 14)⁻¹) by norm_num,
      Real.log_inv]
  have hlog_target :
      -(positiveBoxSigmaMin * Real.log (2 : ℝ)) ≤
        Real.log ((14 : ℝ) / 25) := by
    rw [hlog_inv]
    norm_num [positiveBoxSigmaMin]
    linarith
  have hexp :
      Real.exp (-(positiveBoxSigmaMin * Real.log (2 : ℝ))) ≤
        (14 : ℝ) / 25 :=
    (Real.le_log_iff_exp_le (by norm_num : 0 < (14 : ℝ) / 25)).mp
      hlog_target
  calc
    (1 : ℝ) / 2 *
        Real.exp (-(positiveBoxSigmaMin * Real.log (2 : ℝ)))
        ≤ (1 : ℝ) / 2 * ((14 : ℝ) / 25) := by
          exact mul_le_mul_of_nonneg_left hexp (by norm_num)
    _ = positiveBoxQNormSharpUpperValue := by
          norm_num [positiveBoxQNormSharpUpperValue]

/-- The sharper lower q-norm bound holds throughout the selected box. -/
theorem positiveBox_q_norm_lower_11_40
    {s : ℂ} (hs : s ∈ positiveBox) :
    positiveBoxQNormSharpLowerValue ≤ ‖q s‖ := by
  have hqnorm :
      ‖q s‖ =
        (1 : ℝ) / 2 * Real.exp (-(s.re * Real.log (2 : ℝ))) := by
    simpa [q] using verticalRatio_norm s
  have hlog2 : 0 < Real.log (2 : ℝ) :=
    Real.log_pos (by norm_num)
  have hmul :
      s.re * Real.log (2 : ℝ) ≤
        positiveBoxSigmaMax * Real.log (2 : ℝ) := by
    exact mul_le_mul_of_nonneg_right
      (positiveBox_re_upper hs) (le_of_lt hlog2)
  have harg :
      -(positiveBoxSigmaMax * Real.log (2 : ℝ)) ≤
        -(s.re * Real.log (2 : ℝ)) := by
    linarith
  have hexp :
      Real.exp (-(positiveBoxSigmaMax * Real.log (2 : ℝ))) ≤
        Real.exp (-(s.re * Real.log (2 : ℝ))) :=
    Real.exp_le_exp.mpr harg
  have hqge :
      (1 : ℝ) / 2 *
          Real.exp (-(positiveBoxSigmaMax * Real.log (2 : ℝ))) ≤
        ‖q s‖ := by
    rw [hqnorm]
    exact mul_le_mul_of_nonneg_left hexp (by norm_num)
  exact le_trans positiveBox_q_sharp_endpoint_lower hqge

/-- The sharper upper q-norm bound holds throughout the selected box. -/
theorem positiveBox_q_norm_upper_7_25
    {s : ℂ} (hs : s ∈ positiveBox) :
    ‖q s‖ ≤ positiveBoxQNormSharpUpperValue := by
  have hqnorm :
      ‖q s‖ =
        (1 : ℝ) / 2 * Real.exp (-(s.re * Real.log (2 : ℝ))) := by
    simpa [q] using verticalRatio_norm s
  have hlog2 : 0 < Real.log (2 : ℝ) :=
    Real.log_pos (by norm_num)
  have hmul :
      positiveBoxSigmaMin * Real.log (2 : ℝ) ≤
        s.re * Real.log (2 : ℝ) := by
    exact mul_le_mul_of_nonneg_right
      (positiveBox_re_lower hs) (le_of_lt hlog2)
  have harg :
      -(s.re * Real.log (2 : ℝ)) ≤
        -(positiveBoxSigmaMin * Real.log (2 : ℝ)) := by
    linarith
  have hexp :
      Real.exp (-(s.re * Real.log (2 : ℝ))) ≤
        Real.exp (-(positiveBoxSigmaMin * Real.log (2 : ℝ))) :=
    Real.exp_le_exp.mpr harg
  have hqle :
      ‖q s‖ ≤
        (1 : ℝ) / 2 *
          Real.exp (-(positiveBoxSigmaMin * Real.log (2 : ℝ))) := by
    rw [hqnorm]
    exact mul_le_mul_of_nonneg_left hexp (by norm_num)
  exact le_trans hqle positiveBox_q_sharp_endpoint_upper

/-- Squared norm of `1 + z` as the real quadratic `1 + ‖z‖^2 + 2 * z.re`. -/
theorem norm_one_add_sq_eq (z : ℂ) :
    ‖(1 : ℂ) + z‖ ^ 2 = 1 + ‖z‖ ^ 2 + 2 * z.re := by
  rw [Complex.sq_norm, Complex.sq_norm]
  simp [Complex.normSq_apply]
  ring

/-- Real part of `q` in terms of its norm and the vertical phase. -/
theorem q_re_eq_norm_mul_cos_phase (s : ℂ) :
    (q s).re = ‖q s‖ * Real.cos (s.im * Real.log (2 : ℝ)) := by
  have hnorm : ‖q s‖ =
      (1 / 2 : ℝ) * Real.exp (-(s.re * Real.log (2 : ℝ))) := by
    simpa [q] using verticalRatio_norm s
  have hhalf_re : (((algebraMap ℚ ℂ) 2⁻¹ : ℂ).re) = (1 / 2 : ℝ) := by
    norm_num
  have hhalf_im : (((algebraMap ℚ ℂ) 2⁻¹ : ℂ).im) = (0 : ℝ) := by
    norm_num
  have hre : (-(s * (Real.log ((2 : Nat) : ℝ) : ℂ))).re =
      -(s.re * Real.log (2 : ℝ)) := by
    simp only [Complex.neg_re, Complex.mul_re, Complex.ofReal_re,
      Complex.ofReal_im, mul_zero, sub_zero, Nat.cast_ofNat]
  have him : (-(s * (Real.log ((2 : Nat) : ℝ) : ℂ))).im =
      -(s.im * Real.log (2 : ℝ)) := by
    simp only [Complex.neg_im, Complex.mul_im, Complex.ofReal_re,
      Complex.ofReal_im, mul_zero, zero_add, Nat.cast_ofNat]
  rw [hnorm]
  unfold q verticalRatio depthGeometricRatio complexDirichletCoeff
  rw [Complex.mul_re, Complex.exp_re, hhalf_re, hhalf_im, zero_mul,
    sub_zero, hre, him, Real.cos_neg]
  ring

/-- Imaginary part of `q` in terms of its norm and the vertical phase. -/
theorem q_im_eq_neg_norm_mul_sin_phase (s : ℂ) :
    (q s).im = -‖q s‖ * Real.sin (s.im * Real.log (2 : ℝ)) := by
  have hnorm : ‖q s‖ =
      (1 / 2 : ℝ) * Real.exp (-(s.re * Real.log (2 : ℝ))) := by
    simpa [q] using verticalRatio_norm s
  have hhalf_re : (((algebraMap ℚ ℂ) 2⁻¹ : ℂ).re) = (1 / 2 : ℝ) := by
    norm_num
  have hhalf_im : (((algebraMap ℚ ℂ) 2⁻¹ : ℂ).im) = (0 : ℝ) := by
    norm_num
  have hre : (-(s * (Real.log ((2 : Nat) : ℝ) : ℂ))).re =
      -(s.re * Real.log (2 : ℝ)) := by
    simp only [Complex.neg_re, Complex.mul_re, Complex.ofReal_re,
      Complex.ofReal_im, mul_zero, sub_zero, Nat.cast_ofNat]
  have him : (-(s * (Real.log ((2 : Nat) : ℝ) : ℂ))).im =
      -(s.im * Real.log (2 : ℝ)) := by
    simp only [Complex.neg_im, Complex.mul_im, Complex.ofReal_re,
      Complex.ofReal_im, mul_zero, zero_add, Nat.cast_ofNat]
  rw [hnorm]
  unfold q verticalRatio depthGeometricRatio complexDirichletCoeff
  rw [Complex.mul_im, Complex.exp_re, Complex.exp_im, hhalf_re, hhalf_im,
    zero_mul, add_zero, hre, him, Real.sin_neg]
  ring

/-- Real part of `q^2` in terms of the doubled vertical phase. -/
theorem q_sq_re_eq_norm_sq_mul_cos_two_phase (s : ℂ) :
    ((q s) ^ 2).re =
      ‖q s‖ ^ 2 * Real.cos (2 * (s.im * Real.log (2 : ℝ))) := by
  have hre := q_re_eq_norm_mul_cos_phase s
  have him := q_im_eq_neg_norm_mul_sin_phase s
  rw [pow_two, Complex.mul_re, hre, him, Real.cos_two_mul]
  nlinarith [Real.sin_sq_add_cos_sq (s.im * Real.log (2 : ℝ))]

/-- Phase offset after removing the odd multiple `7 * pi`. -/
noncomputable def positiveBoxPhaseDelta (s : ℂ) : ℝ :=
  s.im * Real.log (2 : ℝ) - 7 * Real.pi

/-- Lower endpoint for the refined positive-box phase offset. -/
theorem positiveBox_phase_delta_lower_7579_10000
    {s : ℂ} (hs : s ∈ positiveBox) :
    (7579 : ℝ) / 10000 ≤ positiveBoxPhaseDelta s := by
  have him_lower :
      (1641 : ℝ) / 50 ≤ s.im := by
    simpa [positiveBoxTMin] using positiveBox_im_lower hs
  have hlog_pos : 0 < Real.log (2 : ℝ) :=
    Real.log_pos (by norm_num)
  have him_mul :
      (1641 : ℝ) / 50 * Real.log (2 : ℝ) ≤
        s.im * Real.log (2 : ℝ) :=
    mul_le_mul_of_nonneg_right him_lower (le_of_lt hlog_pos)
  have hlog_lower :
      (6931471803 : ℝ) / 10000000000 ≤ Real.log (2 : ℝ) := by
    have h := Real.log_two_gt_d9
    norm_num at h ⊢
    exact le_of_lt h
  have hlog_mul :
      (1641 : ℝ) / 50 *
          ((6931471803 : ℝ) / 10000000000) ≤
        (1641 : ℝ) / 50 * Real.log (2 : ℝ) :=
    mul_le_mul_of_nonneg_left hlog_lower (by norm_num)
  have hpi_upper :
      7 * Real.pi <
        7 * ((314159265358979323847 : ℝ) / 100000000000000000000) :=
    mul_lt_mul_of_pos_left
      (by
        have h := Real.pi_lt_d20
        norm_num at h ⊢
        exact h)
      (by norm_num)
  have htarget :
      (7579 : ℝ) / 10000 ≤
        (1641 : ℝ) / 50 *
            ((6931471803 : ℝ) / 10000000000) -
          7 * ((314159265358979323847 : ℝ) /
            100000000000000000000) := by
    norm_num
  unfold positiveBoxPhaseDelta
  nlinarith

/-- Upper endpoint placing the refined positive-box phase offset in the unit interval. -/
theorem positiveBox_phase_delta_upper_one
    {s : ℂ} (hs : s ∈ positiveBox) :
    positiveBoxPhaseDelta s ≤ 1 := by
  have him_upper :
      s.im ≤ (1643 : ℝ) / 50 := by
    simpa [positiveBoxTMax] using positiveBox_im_upper hs
  have hlog_pos : 0 < Real.log (2 : ℝ) :=
    Real.log_pos (by norm_num)
  have him_mul :
      s.im * Real.log (2 : ℝ) ≤
        (1643 : ℝ) / 50 * Real.log (2 : ℝ) :=
    mul_le_mul_of_nonneg_right him_upper (le_of_lt hlog_pos)
  have hlog_upper :
      Real.log (2 : ℝ) ≤
        (6931471808 : ℝ) / 10000000000 := by
    have h := Real.log_two_lt_d9
    norm_num at h ⊢
    exact le_of_lt h
  have hlog_mul :
      (1643 : ℝ) / 50 * Real.log (2 : ℝ) ≤
        (1643 : ℝ) / 50 *
          ((6931471808 : ℝ) / 10000000000) :=
    mul_le_mul_of_nonneg_left hlog_upper (by norm_num)
  have hpi_lower :
      7 * ((314 : ℝ) / 100) < 7 * Real.pi :=
    mul_lt_mul_of_pos_left
      (by
        have h := Real.pi_gt_d2
        norm_num at h ⊢
        exact h)
      (by norm_num)
  have htarget :
      (1643 : ℝ) / 50 *
          ((6931471808 : ℝ) / 10000000000) -
        7 * ((314 : ℝ) / 100) ≤ 1 := by
    norm_num
  unfold positiveBoxPhaseDelta
  nlinarith

/-- The refined positive-box phase offset is small enough for the Taylor cosine bound. -/
theorem positiveBox_phase_delta_abs_le_one
    {s : ℂ} (hs : s ∈ positiveBox) :
    |positiveBoxPhaseDelta s| ≤ 1 := by
  have hlower := positiveBox_phase_delta_lower_7579_10000 hs
  have hupper := positiveBox_phase_delta_upper_one hs
  have hnonneg : 0 ≤ positiveBoxPhaseDelta s := by
    nlinarith
  exact abs_le.mpr ⟨by linarith, hupper⟩

/-- Sharp enough upper bound for `cos delta` on the refined phase offset range. -/
theorem positiveBox_cos_delta_upper_73_100
    {δ : ℝ}
    (habs : |δ| ≤ 1)
    (hδ : (7579 : ℝ) / 10000 ≤ δ) :
    Real.cos δ ≤ (73 : ℝ) / 100 := by
  have hbound := Real.cos_bound (x := δ) habs
  have hupper :
      Real.cos δ ≤ 1 - δ ^ 2 / 2 + |δ| ^ 4 * ((5 : ℝ) / 96) := by
    linarith [(abs_sub_le_iff.mp hbound).1]
  have hδ_nonneg : 0 ≤ δ := by nlinarith
  have hδ_le_one : δ ≤ 1 := (abs_le.mp habs).2
  have hsq_nonneg : 0 ≤ δ ^ 2 - ((7579 : ℝ) / 10000) ^ 2 := by
    nlinarith
  have hfactor_nonneg :
      0 ≤ (1 : ℝ) / 2 -
        (5 / 96) *
          (δ ^ 2 + ((7579 : ℝ) / 10000) ^ 2) := by
    have hδsq : δ ^ 2 ≤ 1 := by nlinarith
    have hasq : ((7579 : ℝ) / 10000) ^ 2 ≤ 1 := by norm_num
    nlinarith
  have hpoly_mono :
      1 - δ ^ 2 / 2 + |δ| ^ 4 * ((5 : ℝ) / 96) ≤
        1 - ((7579 : ℝ) / 10000) ^ 2 / 2 +
          ((7579 : ℝ) / 10000) ^ 4 * ((5 : ℝ) / 96) := by
    rw [abs_of_nonneg hδ_nonneg]
    have hprod :
        0 ≤ (δ ^ 2 - ((7579 : ℝ) / 10000) ^ 2) *
          ((1 : ℝ) / 2 -
            (5 / 96) *
              (δ ^ 2 + ((7579 : ℝ) / 10000) ^ 2)) :=
      mul_nonneg hsq_nonneg hfactor_nonneg
    nlinarith
  have htarget :
      1 - ((7579 : ℝ) / 10000) ^ 2 / 2 +
          ((7579 : ℝ) / 10000) ^ 4 * ((5 : ℝ) / 96) ≤
        (73 : ℝ) / 100 := by
    norm_num
  exact le_trans hupper (le_trans hpoly_mono htarget)

/-- Cosine phase lower for the first quartet-prefix factor on the refined box. -/
theorem positiveBox_cos_phase_lower
    {s : ℂ} (hs : s ∈ positiveBox) :
    (-(73 : ℝ) / 100) ≤
      Real.cos (s.im * Real.log (2 : ℝ)) := by
  let δ := positiveBoxPhaseDelta s
  have hdelta :
      Real.cos δ ≤ (73 : ℝ) / 100 :=
    positiveBox_cos_delta_upper_73_100
      (by simpa [δ] using positiveBox_phase_delta_abs_le_one hs)
      (by simpa [δ] using positiveBox_phase_delta_lower_7579_10000 hs)
  have hperiod :
      Real.cos (s.im * Real.log (2 : ℝ)) = -Real.cos δ := by
    have harg :
        s.im * Real.log (2 : ℝ) = δ + (7 : ℤ) * Real.pi := by
      dsimp [δ, positiveBoxPhaseDelta]
      norm_num
    rw [harg, Real.cos_add_int_mul_pi]
    norm_num
  rw [hperiod]
  linarith

/-- Upper endpoint for the doubled phase offset relative to `pi / 2`. -/
theorem positiveBox_two_phase_delta_le_pi_div_two_add_one_48
    {s : ℂ} (hs : s ∈ positiveBox) :
    2 * positiveBoxPhaseDelta s ≤ Real.pi / 2 + (1 : ℝ) / 48 := by
  have him_upper :
      s.im ≤ (1643 : ℝ) / 50 := by
    simpa [positiveBoxTMax] using positiveBox_im_upper hs
  have hlog_pos : 0 < Real.log (2 : ℝ) :=
    Real.log_pos (by norm_num)
  have him_mul :
      s.im * Real.log (2 : ℝ) ≤
        (1643 : ℝ) / 50 * Real.log (2 : ℝ) :=
    mul_le_mul_of_nonneg_right him_upper (le_of_lt hlog_pos)
  have hlog_upper :
      Real.log (2 : ℝ) ≤
        (6931471808 : ℝ) / 10000000000 := by
    have h := Real.log_two_lt_d9
    norm_num at h ⊢
    exact le_of_lt h
  have hlog_mul :
      (1643 : ℝ) / 50 * Real.log (2 : ℝ) ≤
        (1643 : ℝ) / 50 *
          ((6931471808 : ℝ) / 10000000000) :=
    mul_le_mul_of_nonneg_left hlog_upper (by norm_num)
  have hpi_lower :
      ((314159265358979323846 : ℝ) / 100000000000000000000) ≤
        Real.pi :=
    by
      have h := Real.pi_gt_d20
      norm_num at h ⊢
      exact le_of_lt h
  have hcalc :
      2 * ((1643 : ℝ) / 50 *
          ((6931471808 : ℝ) / 10000000000)) -
        14 *
          ((314159265358979323846 : ℝ) /
            100000000000000000000) ≤
        ((314159265358979323846 : ℝ) /
            100000000000000000000) / 2 +
          (1 : ℝ) / 48 := by
    norm_num
  unfold positiveBoxPhaseDelta
  nlinarith

/--
Cosine lower near `pi / 2`, using the Lipschitz bound for cosine on the
right side and nonnegativity on the left side.
-/
theorem positiveBox_cos_near_pi_div_two_lower
    {x : ℝ}
    (hx0 : 0 ≤ x)
    (hxup : x ≤ Real.pi / 2 + (1 : ℝ) / 48) :
    (-(1 : ℝ) / 48) ≤ Real.cos x := by
  by_cases hx : x ≤ Real.pi / 2
  · have hcos_nonneg : 0 ≤ Real.cos x :=
      Real.cos_nonneg_of_mem_Icc ⟨by linarith [Real.pi_pos], hx⟩
    linarith
  · have hxge : Real.pi / 2 ≤ x := le_of_not_ge hx
    have habs :
        |Real.cos x - Real.cos (Real.pi / 2)| ≤
          |x - Real.pi / 2| :=
      Real.abs_cos_sub_cos_le x (Real.pi / 2)
    rw [Real.cos_pi_div_two, sub_zero] at habs
    have habsx : |x - Real.pi / 2| = x - Real.pi / 2 := by
      rw [abs_of_nonneg]
      linarith
    have hcos_abs : |Real.cos x| ≤ (1 : ℝ) / 48 := by
      rw [habsx] at habs
      linarith
    simpa only [neg_div] using (abs_le.mp hcos_abs).1

/-- Doubled-phase cosine lower on the refined positive box. -/
theorem positiveBox_cos_two_phase_lower_neg_one_48
    {s : ℂ} (hs : s ∈ positiveBox) :
    (-(1 : ℝ) / 48) ≤
      Real.cos (2 * (s.im * Real.log (2 : ℝ))) := by
  let δ := positiveBoxPhaseDelta s
  have hdelta_lower :
      (7579 : ℝ) / 10000 ≤ δ := by
    simpa [δ] using positiveBox_phase_delta_lower_7579_10000 hs
  have hx0 : 0 ≤ 2 * δ := by
    nlinarith
  have hxup :
      2 * δ ≤ Real.pi / 2 + (1 : ℝ) / 48 := by
    simpa [δ] using
      positiveBox_two_phase_delta_le_pi_div_two_add_one_48 hs
  have hcos :
      (-(1 : ℝ) / 48) ≤ Real.cos (2 * δ) :=
    positiveBox_cos_near_pi_div_two_lower hx0 hxup
  have hperiod :
      Real.cos (2 * (s.im * Real.log (2 : ℝ))) =
        Real.cos (2 * δ) := by
    have harg :
        2 * (s.im * Real.log (2 : ℝ)) =
          2 * δ + (14 : ℤ) * Real.pi := by
      dsimp [δ, positiveBoxPhaseDelta]
      norm_num
      ring
    rw [harg, Real.cos_add_int_mul_pi]
    norm_num
  rw [hperiod]
  exact hcos

/-- Product-form doubled-phase lower for the `q^2` factor. -/
theorem positiveBox_cos_two_phase_product_lower
    {s : ℂ} (hs : s ∈ positiveBox) :
    positiveBoxReQSqLowerValue ≤
      ‖q s‖ ^ 2 *
        Real.cos (2 * (s.im * Real.log (2 : ℝ))) := by
  have hcos := positiveBox_cos_two_phase_lower_neg_one_48 hs
  have hr_nonneg : 0 ≤ ‖q s‖ := norm_nonneg _
  have hr2_nonneg : 0 ≤ ‖q s‖ ^ 2 := sq_nonneg _
  have hmul :
      ‖q s‖ ^ 2 * (-(1 : ℝ) / 48) ≤
        ‖q s‖ ^ 2 *
          Real.cos (2 * (s.im * Real.log (2 : ℝ))) :=
    mul_le_mul_of_nonneg_left hcos hr2_nonneg
  have hr2up : ‖q s‖ ^ 2 ≤ ((7 : ℝ) / 25) ^ 2 := by
    have hq : ‖q s‖ ≤ (7 : ℝ) / 25 := by
      simpa [positiveBoxQNormSharpUpperValue] using
        positiveBox_q_norm_upper_7_25 hs
    exact pow_le_pow_left₀ hr_nonneg hq 2
  have htail :
      positiveBoxReQSqLowerValue ≤
        ‖q s‖ ^ 2 * (-(1 : ℝ) / 48) := by
    norm_num [positiveBoxReQSqLowerValue] at hr2up ⊢
    nlinarith
  exact le_trans htail hmul

/-- The sharper q-norm and real-part targets pay the `1 + q^2` factor. -/
theorem positiveBoxOneAddQSqLowerValue_sq_le_of_re_q_sq
    {s : ℂ}
    (hqnorm : positiveBoxQNormSharpLowerValue ≤ ‖q s‖)
    (hre : positiveBoxReQSqLowerValue ≤ ((q s) ^ 2).re) :
    positiveBoxOneAddQSqLowerValue ^ 2 ≤
      1 + ‖(q s) ^ 2‖ ^ 2 + 2 * ((q s) ^ 2).re := by
  have hq_nonneg : 0 ≤ ‖q s‖ := norm_nonneg _
  have hq4 :
      positiveBoxQNormSharpLowerValue ^ 4 ≤ ‖q s‖ ^ 4 := by
    exact pow_le_pow_left₀
      (by norm_num [positiveBoxQNormSharpLowerValue]) hqnorm 4
  have hnormsq :
      ‖(q s) ^ 2‖ ^ 2 = ‖q s‖ ^ 4 := by
    rw [norm_pow]
    ring
  have hbase :
      1 + positiveBoxQNormSharpLowerValue ^ 4 +
          2 * positiveBoxReQSqLowerValue ≤
        1 + ‖(q s) ^ 2‖ ^ 2 + 2 * ((q s) ^ 2).re := by
    rw [hnormsq]
    nlinarith
  have hpay :
      positiveBoxOneAddQSqLowerValue ^ 2 ≤
        1 + positiveBoxQNormSharpLowerValue ^ 4 +
          2 * positiveBoxReQSqLowerValue := by
    norm_num [positiveBoxOneAddQSqLowerValue,
      positiveBoxQNormSharpLowerValue, positiveBoxReQSqLowerValue]
  exact le_trans hpay hbase

/--
The squared-norm expression lower implies the `1 + q` factor lower.

The expression is the precise real target
`1 + ‖q s‖^2 + 2 * (q s).re`.
-/
theorem positiveBox_one_add_q_norm_lower_of_sq_expression
    {s : ℂ}
    (hquad :
      positiveBoxOneAddQLowerValue ^ 2 ≤
        1 + ‖q s‖ ^ 2 + 2 * (q s).re) :
    positiveBoxOneAddQLowerValue ≤ ‖(1 : ℂ) + q s‖ := by
  rw [← sq_le_sq₀
    (by norm_num [positiveBoxOneAddQLowerValue])
    (norm_nonneg _)]
  rw [norm_one_add_sq_eq]
  exact hquad

/-- The real-part and sharper q-norm data imply the `1 + q^2` factor lower. -/
theorem positiveBox_one_add_q_sq_norm_lower_of_re_q_sq
    {s : ℂ}
    (hqnorm : positiveBoxQNormSharpLowerValue ≤ ‖q s‖)
    (hre : positiveBoxReQSqLowerValue ≤ ((q s) ^ 2).re) :
    positiveBoxOneAddQSqLowerValue ≤ ‖(1 : ℂ) + (q s) ^ 2‖ := by
  rw [← sq_le_sq₀
    (by norm_num [positiveBoxOneAddQSqLowerValue])
    (norm_nonneg _)]
  rw [norm_one_add_sq_eq]
  exact positiveBoxOneAddQSqLowerValue_sq_le_of_re_q_sq hqnorm hre

/--
A phase-slope lower for `q` plus the sharper upper q-norm endpoint pays the
coupled quadratic target for the `1 + q` factor.
-/
theorem positiveBox_one_add_q_norm_coupled_of_re_slope
    {s : ℂ}
    (hqnorm : ‖q s‖ ≤ positiveBoxQNormSharpUpperValue)
    (hre : (-(73 : ℝ) / 100) * ‖q s‖ ≤ (q s).re) :
    positiveBoxOneAddQLowerValue ^ 2 ≤
      1 + ‖q s‖ ^ 2 + 2 * (q s).re := by
  have hquad :
      positiveBoxOneAddQLowerValue ^ 2 ≤
        1 + ‖q s‖ ^ 2 + 2 * ((-(73 : ℝ) / 100) * ‖q s‖) := by
    have hleft : 0 ≤ positiveBoxQNormSharpUpperValue - ‖q s‖ := by
      linarith
    have hright :
        0 ≤ (73 : ℝ) / 50 -
          (positiveBoxQNormSharpUpperValue + ‖q s‖) := by
      have hupper : positiveBoxQNormSharpUpperValue + ‖q s‖ ≤
          (14 : ℝ) / 25 := by
        norm_num [positiveBoxQNormSharpUpperValue] at hqnorm ⊢
        linarith
      nlinarith
    have hmono :
        0 ≤
          (positiveBoxQNormSharpUpperValue - ‖q s‖) *
            ((73 : ℝ) / 50 -
              (positiveBoxQNormSharpUpperValue + ‖q s‖)) :=
      mul_nonneg hleft hright
    norm_num [positiveBoxOneAddQLowerValue,
      positiveBoxQNormSharpUpperValue] at hmono ⊢
    nlinarith
  nlinarith

/-- Phase data sufficient for the `1 + q` factor on the selected box. -/
structure PositiveBoxQPhaseData : Prop where
  re_q_slope_lower :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      (-(73 : ℝ) / 100) * ‖q s‖ ≤ (q s).re

/-- Phase data sufficient for the `1 + q^2` factor on the selected box. -/
structure PositiveBoxQSqPhaseData : Prop where
  re_q_sq_lower :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      positiveBoxReQSqLowerValue ≤ ((q s) ^ 2).re

/-- Trigonometric phase data for the first factor. -/
structure PositiveBoxQTrigPhaseData : Prop where
  cos_phase_lower :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      (-(73 : ℝ) / 100) ≤ Real.cos (s.im * Real.log (2 : ℝ))

/--
Trigonometric phase data for the second factor.

The product form keeps the small `q^2` margin intact; separating it with only
the `7 / 25` q-norm upper is slightly too coarse for this box.
-/
structure PositiveBoxQSqTrigPhaseData : Prop where
  cos_two_phase_product_lower :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      positiveBoxReQSqLowerValue ≤
        ‖q s‖ ^ 2 * Real.cos (2 * (s.im * Real.log (2 : ℝ)))

/-- Closed trigonometric phase data for the first factor on the refined box. -/
def positiveBoxQTrigPhaseData : PositiveBoxQTrigPhaseData where
  cos_phase_lower := by
    intro s hs
    exact positiveBox_cos_phase_lower hs

/-- Closed product-form trigonometric phase data for the second factor. -/
def positiveBoxQSqTrigPhaseData : PositiveBoxQSqTrigPhaseData where
  cos_two_phase_product_lower := by
    intro s hs
    exact positiveBox_cos_two_phase_product_lower hs

/-- The cosine lower supplies the real-part slope field for `q`. -/
theorem positiveBox_re_q_slope_lower_of_trigPhase
    (data : PositiveBoxQTrigPhaseData)
    {s : ℂ} (hs : s ∈ positiveBox) :
    (-(73 : ℝ) / 100) * ‖q s‖ ≤ (q s).re := by
  rw [q_re_eq_norm_mul_cos_phase]
  simpa [mul_comm, mul_left_comm, mul_assoc] using
    (mul_le_mul_of_nonneg_left
      (data.cos_phase_lower hs) (norm_nonneg (q s)))

/-- The doubled-phase product lower supplies the real-part field for `q^2`. -/
theorem positiveBox_re_q_sq_lower_of_trigPhase
    (data : PositiveBoxQSqTrigPhaseData)
    {s : ℂ} (hs : s ∈ positiveBox) :
    positiveBoxReQSqLowerValue ≤ ((q s) ^ 2).re := by
  rw [q_sq_re_eq_norm_sq_mul_cos_two_phase]
  exact data.cos_two_phase_product_lower hs

/-- Closed real-part slope field for `q` on the refined positive box. -/
theorem positiveBox_re_q_slope_lower
    {s : ℂ} (hs : s ∈ positiveBox) :
    (-(73 : ℝ) / 100) * ‖q s‖ ≤ (q s).re :=
  positiveBox_re_q_slope_lower_of_trigPhase
    positiveBoxQTrigPhaseData hs

/-- Closed real-part field for `q^2` on the refined positive box. -/
theorem positiveBox_re_q_sq_lower_closed
    {s : ℂ} (hs : s ∈ positiveBox) :
    positiveBoxReQSqLowerValue ≤ ((q s) ^ 2).re :=
  positiveBox_re_q_sq_lower_of_trigPhase
    positiveBoxQSqTrigPhaseData hs

/-- Build the existing q-phase package from the trigonometric phase package. -/
def PositiveBoxQPhaseData.ofTrigPhaseData
    (data : PositiveBoxQTrigPhaseData) :
    PositiveBoxQPhaseData where
  re_q_slope_lower := by
    intro s hs
    exact positiveBox_re_q_slope_lower_of_trigPhase data hs

/-- Build the existing q-squared phase package from the trigonometric package. -/
def PositiveBoxQSqPhaseData.ofTrigPhaseData
    (data : PositiveBoxQSqTrigPhaseData) :
    PositiveBoxQSqPhaseData where
  re_q_sq_lower := by
    intro s hs
    exact positiveBox_re_q_sq_lower_of_trigPhase data hs

theorem positiveBox_one_add_q_norm_coupled
    (data : PositiveBoxQPhaseData)
    {s : ℂ} (hs : s ∈ positiveBox) :
    positiveBoxOneAddQLowerValue ^ 2 ≤
      1 + ‖q s‖ ^ 2 + 2 * (q s).re :=
  positiveBox_one_add_q_norm_coupled_of_re_slope
    (positiveBox_q_norm_upper_7_25 hs)
    (data.re_q_slope_lower hs)

theorem positiveBox_re_q_sq_lower
    (data : PositiveBoxQSqPhaseData)
    {s : ℂ} (hs : s ∈ positiveBox) :
    positiveBoxReQSqLowerValue ≤ ((q s) ^ 2).re :=
  data.re_q_sq_lower hs

/--
Conditional sector data for `1 + q`.

A standalone lower bound for `(q s).re` is recorded, but the norm lower is paid
by the exact squared-norm expression because the positive box is close to the
minimum of `|1 + q|`.
-/
structure PositiveBoxQSectorData : Prop where
  re_q_lower :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      positiveBoxReQLowerValue ≤ (q s).re
  one_add_q_sq_expression_lower :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      positiveBoxOneAddQLowerValue ^ 2 ≤
        1 + ‖q s‖ ^ 2 + 2 * (q s).re

/-- Build `1 + q` sector data from the sharper endpoint and phase-slope data. -/
def PositiveBoxQSectorData.ofPhaseData
    (data : PositiveBoxQPhaseData) :
    PositiveBoxQSectorData where
  re_q_lower := by
    intro s hs
    have hupper := positiveBox_q_norm_upper_7_25 hs
    have hslope := data.re_q_slope_lower hs
    norm_num [positiveBoxReQLowerValue,
      positiveBoxQNormSharpUpperValue] at hupper ⊢
    nlinarith
  one_add_q_sq_expression_lower := by
    intro s hs
    exact positiveBox_one_add_q_norm_coupled data hs

/-- Conditional sector data for `1 + q^2`. -/
structure PositiveBoxQSqSectorData : Prop where
  q_norm_sharp_lower :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      positiveBoxQNormSharpLowerValue ≤ ‖q s‖
  re_q_sq_lower :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      positiveBoxReQSqLowerValue ≤ ((q s) ^ 2).re

/-- Build `1 + q^2` sector data from the closed q-norm endpoint and phase data. -/
def PositiveBoxQSqSectorData.ofPhaseData
    (data : PositiveBoxQSqPhaseData) :
    PositiveBoxQSqSectorData where
  q_norm_sharp_lower := by
    intro s hs
    exact positiveBox_q_norm_lower_11_40 hs
  re_q_sq_lower := by
    intro s hs
    exact positiveBox_re_q_sq_lower data hs

/-- First factor lower from the conditional q-sector data. -/
theorem positiveBox_one_add_q_norm_lower
    (data : PositiveBoxQSectorData)
    {s : ℂ} (hs : s ∈ positiveBox) :
    positiveBoxOneAddQLowerValue ≤ ‖(1 : ℂ) + q s‖ :=
  positiveBox_one_add_q_norm_lower_of_sq_expression
    (data.one_add_q_sq_expression_lower hs)

/-- Second factor lower from the conditional q-squared sector data. -/
theorem positiveBox_one_add_q_sq_norm_lower
    (data : PositiveBoxQSqSectorData)
    {s : ℂ} (hs : s ∈ positiveBox) :
    positiveBoxOneAddQSqLowerValue ≤ ‖(1 : ℂ) + (q s) ^ 2‖ :=
  positiveBox_one_add_q_sq_norm_lower_of_re_q_sq
    (data.q_norm_sharp_lower hs) (data.re_q_sq_lower hs)

/--
Sector geometry data reduced to the two factors
`verticalQuartetPrefix (q s) = (1 + q s) * (1 + (q s)^2)`.

The phase fields are kept to match the existing `PositiveBoxSectorData` API.
The two factor lower fields are the remaining trigonometric interval targets.
-/
structure PositiveBoxSectorFactorData (phaseLower phaseUpper : ℝ) : Prop where
  q_norm_bounds :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      positiveBoxQLowerCandidate ≤ ‖q s‖ ∧
        ‖q s‖ ≤ positiveBoxQUpperCandidate
  q_phase_lower :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox → phaseLower ≤ positiveBoxQPhase s
  q_phase_upper :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox → positiveBoxQPhase s ≤ phaseUpper
  one_add_q_lower :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      positiveBoxOneAddQLowerValue ≤ ‖(1 : ℂ) + q s‖
  one_add_q_sq_lower :
    ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
      positiveBoxOneAddQSqLowerValue ≤ ‖(1 : ℂ) + (q s) ^ 2‖

/-- The q-norm fields of the sector factor data are already available. -/
theorem positiveBox_q_norm_bounds_for_sector
    {s : ℂ} (hs : s ∈ positiveBox) :
    positiveBoxQLowerCandidate ≤ ‖q s‖ ∧
      ‖q s‖ ≤ positiveBoxQUpperCandidate :=
  ⟨positiveBox_q_norm_lower_27_100 hs,
    positiveBox_q_norm_upper_3_10 hs⟩

/-- Build factor data from the two conditional sector packages. -/
def PositiveBoxSectorFactorData.ofQSectorData
    {phaseLower phaseUpper : ℝ}
    (qsector : PositiveBoxQSectorData)
    (qsqsector : PositiveBoxQSqSectorData)
    (q_phase_lower :
      ∀ ⦃s : ℂ⦄, s ∈ positiveBox → phaseLower ≤ positiveBoxQPhase s)
    (q_phase_upper :
      ∀ ⦃s : ℂ⦄, s ∈ positiveBox → positiveBoxQPhase s ≤ phaseUpper) :
    PositiveBoxSectorFactorData phaseLower phaseUpper where
  q_norm_bounds := by
    intro s hs
    exact positiveBox_q_norm_bounds_for_sector hs
  q_phase_lower := q_phase_lower
  q_phase_upper := q_phase_upper
  one_add_q_lower := by
    intro s hs
    exact positiveBox_one_add_q_norm_lower qsector hs
  one_add_q_sq_lower := by
    intro s hs
    exact positiveBox_one_add_q_sq_norm_lower qsqsector hs

/-- Build factor data directly from the two remaining phase packages. -/
def PositiveBoxSectorFactorData.ofPhaseData
    {phaseLower phaseUpper : ℝ}
    (qphase : PositiveBoxQPhaseData)
    (qsqphase : PositiveBoxQSqPhaseData)
    (q_phase_lower :
      ∀ ⦃s : ℂ⦄, s ∈ positiveBox → phaseLower ≤ positiveBoxQPhase s)
    (q_phase_upper :
      ∀ ⦃s : ℂ⦄, s ∈ positiveBox → positiveBoxQPhase s ≤ phaseUpper) :
    PositiveBoxSectorFactorData phaseLower phaseUpper :=
  PositiveBoxSectorFactorData.ofQSectorData
    (PositiveBoxQSectorData.ofPhaseData qphase)
    (PositiveBoxQSqSectorData.ofPhaseData qsqphase)
    q_phase_lower q_phase_upper

/-- Build factor data directly from the trigonometric phase packages. -/
def PositiveBoxSectorFactorData.ofTrigPhaseData
    {phaseLower phaseUpper : ℝ}
    (qtrig : PositiveBoxQTrigPhaseData)
    (qsqtrig : PositiveBoxQSqTrigPhaseData)
    (q_phase_lower :
      ∀ ⦃s : ℂ⦄, s ∈ positiveBox → phaseLower ≤ positiveBoxQPhase s)
    (q_phase_upper :
      ∀ ⦃s : ℂ⦄, s ∈ positiveBox → positiveBoxQPhase s ≤ phaseUpper) :
    PositiveBoxSectorFactorData phaseLower phaseUpper :=
  PositiveBoxSectorFactorData.ofPhaseData
    (PositiveBoxQPhaseData.ofTrigPhaseData qtrig)
    (PositiveBoxQSqPhaseData.ofTrigPhaseData qsqtrig)
    q_phase_lower q_phase_upper

/-- Trivial lower bound for the auxiliary `arg` phase coordinate. -/
theorem positiveBox_q_arg_phase_lower
    {s : ℂ} (_hs : s ∈ positiveBox) :
    -Real.pi ≤ positiveBoxQPhase s := by
  simpa [positiveBoxQPhase] using
    (le_of_lt (Complex.neg_pi_lt_arg (q s)))

/-- Trivial upper bound for the auxiliary `arg` phase coordinate. -/
theorem positiveBox_q_arg_phase_upper
    {s : ℂ} (_hs : s ∈ positiveBox) :
    positiveBoxQPhase s ≤ Real.pi := by
  simpa [positiveBoxQPhase] using
    (Complex.arg_le_pi (q s))

/-- Closed factor-level sector data on the refined positive box. -/
def positiveBoxSectorFactorData :
    PositiveBoxSectorFactorData (-Real.pi) Real.pi :=
  PositiveBoxSectorFactorData.ofTrigPhaseData
    positiveBoxQTrigPhaseData
    positiveBoxQSqTrigPhaseData
    (phaseLower := -Real.pi)
    (phaseUpper := Real.pi)
    (by
      intro s hs
      exact positiveBox_q_arg_phase_lower hs)
    (by
      intro s hs
      exact positiveBox_q_arg_phase_upper hs)

/--
The two factor lower bounds imply the required sector lower through the
factorization of the four-floor prefix.
-/
theorem PositiveBoxSectorFactorData.sector_lower
    {phaseLower phaseUpper : ℝ}
    (data : PositiveBoxSectorFactorData phaseLower phaseUpper)
    {s : ℂ} (hs : s ∈ positiveBox) :
    positiveBoxSectorLowerValue ≤ ‖verticalQuartetPrefix (q s)‖ := by
  have hfactor :
      positiveBoxOneAddQLowerValue * positiveBoxOneAddQSqLowerValue ≤
        ‖(1 : ℂ) + q s‖ * ‖(1 : ℂ) + (q s) ^ 2‖ := by
    exact mul_le_mul
      (data.one_add_q_lower hs)
      (data.one_add_q_sq_lower hs)
      (by norm_num [positiveBoxOneAddQSqLowerValue])
      (norm_nonneg _)
  calc
    positiveBoxSectorLowerValue
        ≤ positiveBoxOneAddQLowerValue *
            positiveBoxOneAddQSqLowerValue :=
          positiveBoxSectorLowerValue_le_factorProduct
    _ ≤ ‖(1 : ℂ) + q s‖ * ‖(1 : ℂ) + (q s) ^ 2‖ := hfactor
    _ = ‖verticalQuartetPrefix (q s)‖ := by
          rw [verticalQuartetPrefix_factor, norm_mul]

/-- Closed sector lower on the refined positive box. -/
theorem positiveBox_sector_lower
    {s : ℂ} (hs : s ∈ positiveBox) :
    positiveBoxSectorLowerValue ≤ ‖verticalQuartetPrefix (q s)‖ :=
  positiveBoxSectorFactorData.sector_lower hs

/-- Convert factor-level sector data to the existing positive-box sector API. -/
def PositiveBoxSectorFactorData.toSectorData
    {phaseLower phaseUpper : ℝ}
    (data : PositiveBoxSectorFactorData phaseLower phaseUpper) :
    PositiveBoxSectorData phaseLower phaseUpper where
  q_phase_lower := data.q_phase_lower
  q_phase_upper := data.q_phase_upper
  sector_lower := by
    intro s hs
    exact data.sector_lower hs

/-- Closed sector data in the older sector API. -/
def positiveBoxSectorData : PositiveBoxSectorData (-Real.pi) Real.pi :=
  positiveBoxSectorFactorData.toSectorData

/--
Build the non-ledger analytic fields once anchor, cutoff, and factor-sector
data are supplied.  The anchor and cutoff fields remain untouched in this pass.
-/
def PositiveBoxAnalyticBounds.ofSectorFactorData
    {phaseLower phaseUpper : ℝ}
    (sector : PositiveBoxSectorFactorData phaseLower phaseUpper)
    (anchor_bound :
      ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
        ‖anchor s‖ ≤ positiveBoxAnchorUpperValue)
    (cut_bound :
      ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
        ‖cutVec positiveBoxK positiveBoxM s‖ ≤ positiveBoxCutUpperValue) :
    PositiveBoxAnalyticBounds where
  anchor_bound := anchor_bound
  cut_bound := cut_bound
  sector_lower := by
    intro s hs
    exact sector.sector_lower hs

/--
Direct certificate wrapper once the sector factor data, remaining analytic
fields, and ledger bounds are supplied.
-/
def PositiveBoxCertificate.withSectorLower
    {phaseLower phaseUpper : ℝ}
    (sector : PositiveBoxSectorFactorData phaseLower phaseUpper)
    (ledger : PositiveBoxLedgerBounds)
    (anchor_bound :
      ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
        ‖anchor s‖ ≤ positiveBoxAnchorUpperValue)
    (cut_bound :
      ∀ ⦃s : ℂ⦄, s ∈ positiveBox →
        ‖cutVec positiveBoxK positiveBoxM s‖ ≤ positiveBoxCutUpperValue) :
    PositiveBoxCertificate :=
  PositiveBoxCertificate.ofAnalyticBoundsAndLedgerBounds
    (PositiveBoxAnalyticBounds.ofSectorFactorData
      sector anchor_bound cut_bound)
    ledger

end

end ContinuedQuartetAudit
end C2
