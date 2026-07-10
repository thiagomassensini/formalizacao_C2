import LeanC2.Analytic.GenuineInfinite
import Mathlib.Analysis.PSeries
import Mathlib.LinearAlgebra.Complex.FiniteDimensional

/-!
# The raw `tsum` obstruction in the middle strip

The definitions audited here use Mathlib's unconditional infinite sum.  In
finite-dimensional complex space, unconditional summability implies
summability of the norms.  The odd norm family is a shifted p-series, hence it
is not summable when `re s ≤ 1`.  Consequently Mathlib's totalized `tsum`
assigns zero to both raw families in that range.

This file does not define an analytic continuation.
-/

namespace C2

/-- The family whose `tsum` is `oddDirichletChannel`. -/
noncomputable def oddDirichletRawFamily (s : ℂ) (n : ℕ) : ℂ :=
  complexDirichletCoeff s (2 * n + 1)

lemma norm_oddDirichletRawFamily (s : ℂ) (n : ℕ) :
    ‖oddDirichletRawFamily s n‖ = ((2 * n + 1 : ℕ) : ℝ) ^ (-s.re) := by
  exact complexDirichletCoeff_norm_eq_rpow_neg_re s (by omega)

lemma odd_nat_rpow_eq_shifted (sigma : ℝ) (n : ℕ) :
    ((2 * n + 1 : ℕ) : ℝ) ^ (-sigma) =
      (2 : ℝ) ^ (-sigma) * ((n : ℝ) + 1 / 2) ^ (-sigma) := by
  rw [← Real.mul_rpow (by positivity : (0 : ℝ) ≤ 2) (by positivity)]
  congr 1
  push_cast
  ring

lemma shifted_rpow_neg_eq_one_div_abs_rpow (sigma : ℝ) (n : ℕ) :
    ((n : ℝ) + 1 / 2) ^ (-sigma) =
      1 / |(n : ℝ) + 1 / 2| ^ sigma := by
  rw [Real.rpow_neg (by positivity : (0 : ℝ) ≤ (n : ℝ) + 1 / 2)]
  rw [abs_of_pos (by positivity : (0 : ℝ) < (n : ℝ) + 1 / 2)]
  ring

/-- The raw odd family is not unconditionally summable at or left of `re s = 1`. -/
theorem not_summable_oddDirichletRawFamily_of_re_le_one
    (s : ℂ) (hs : s.re ≤ 1) :
    ¬ Summable (oddDirichletRawFamily s) := by
  intro h
  have hnorm : Summable fun n : ℕ => ‖oddDirichletRawFamily s n‖ := h.norm
  have hpow : Summable fun n : ℕ => ((2 * n + 1 : ℕ) : ℝ) ^ (-s.re) :=
    hnorm.congr fun n => norm_oddDirichletRawFamily s n
  have hscaled : Summable fun n : ℕ =>
      (2 : ℝ) ^ (-s.re) * ((n : ℝ) + 1 / 2) ^ (-s.re) :=
    hpow.congr fun n => odd_nat_rpow_eq_shifted s.re n
  have hconst : (2 : ℝ) ^ (-s.re) ≠ 0 :=
    ne_of_gt (Real.rpow_pos_of_pos (by norm_num) _)
  have hshift : Summable fun n : ℕ => ((n : ℝ) + 1 / 2) ^ (-s.re) :=
    (summable_mul_left_iff hconst).mp hscaled
  have hpseries : Summable fun n : ℕ => 1 / |(n : ℝ) + 1 / 2| ^ s.re :=
    hshift.congr fun n => shifted_rpow_neg_eq_one_div_abs_rpow s.re n
  have hone : 1 < s.re :=
    (Real.summable_one_div_nat_add_rpow (1 / 2) s.re).mp hpseries
  exact (not_lt_of_ge hs) hone

theorem not_summable_oddDirichletCoeff_of_re_le_one
    (s : ℂ) (hs : s.re ≤ 1) :
    ¬ Summable (fun n : ℕ => complexDirichletCoeff s (2 * n + 1)) := by
  simpa [oddDirichletRawFamily] using
    not_summable_oddDirichletRawFamily_of_re_le_one s hs

/-- Mathlib's totalized raw odd `tsum` is zero outside its summability domain. -/
theorem oddDirichletChannel_eq_zero_of_re_le_one
    (s : ℂ) (hs : s.re ≤ 1) :
    oddDirichletChannel s = 0 := by
  unfold oddDirichletChannel
  exact tsum_eq_zero_of_not_summable
    (not_summable_oddDirichletCoeff_of_re_le_one s hs)

/-- The literal family used by `genuineCentralDoubleSeries`. -/
noncomputable def genuineCentralRawFamily (s : ℂ) (p : ℕ × ℕ) : ℂ :=
  (2 : ℂ) * (verticalRatio s ^ (p.1 + 2) *
    complexDirichletCoeff s (2 * p.2 + 1))

lemma norm_genuineCentralRawFamily (s : ℂ) (p : ℕ × ℕ) :
    ‖genuineCentralRawFamily s p‖ =
      2 * ‖verticalRatio s‖ ^ (p.1 + 2) *
        ((2 * p.2 + 1 : ℕ) : ℝ) ^ (-s.re) := by
  unfold genuineCentralRawFamily
  rw [norm_mul, norm_mul, norm_pow,
    complexDirichletCoeff_norm_eq_rpow_neg_re s (by omega)]
  norm_num
  ring

lemma genuineCentralRawFamily_depth_zero (s : ℂ) (n : ℕ) :
    genuineCentralRawFamily s (0, n) =
      ((2 : ℂ) * verticalRatio s ^ 2) *
        complexDirichletCoeff s (2 * n + 1) := by
  simp [genuineCentralRawFamily]
  ring

lemma genuineCentralRaw_depth_zero_factor_ne_zero (s : ℂ) :
    (2 : ℂ) * verticalRatio s ^ 2 ≠ 0 := by
  apply mul_ne_zero
  · norm_num
  · exact pow_ne_zero 2 (by
      unfold verticalRatio
      exact complexDirichletDepthRatio_ne_zero s)

/-- The literal central double family is not unconditionally summable for `re s ≤ 1`. -/
theorem not_summable_genuineCentralRawFamily_of_re_le_one
    (s : ℂ) (hs : s.re ≤ 1) :
    ¬ Summable (genuineCentralRawFamily s) := by
  intro h
  have hslice : Summable fun n : ℕ => genuineCentralRawFamily s (0, n) :=
    h.prod_factor 0
  have hscaled : Summable fun n : ℕ =>
      ((2 : ℂ) * verticalRatio s ^ 2) *
        complexDirichletCoeff s (2 * n + 1) :=
    hslice.congr fun n => genuineCentralRawFamily_depth_zero s n
  have hodd : Summable fun n : ℕ => complexDirichletCoeff s (2 * n + 1) :=
    (summable_mul_left_iff (genuineCentralRaw_depth_zero_factor_ne_zero s)).mp hscaled
  exact not_summable_oddDirichletCoeff_of_re_le_one s hs hodd

theorem not_summable_genuineCentralDoubleSeries_family_of_re_le_one
    (s : ℂ) (hs : s.re ≤ 1) :
    ¬ Summable (fun p : ℕ × ℕ =>
      (2 : ℂ) * (verticalRatio s ^ (p.1 + 2) *
        complexDirichletCoeff s (2 * p.2 + 1))) := by
  simpa [genuineCentralRawFamily] using
    not_summable_genuineCentralRawFamily_of_re_le_one s hs

theorem not_summable_oddDirichletCoeff_of_re_pos_le_one
    (s : ℂ) (hs : 0 < s.re ∧ s.re ≤ 1) :
    ¬ Summable (fun n : ℕ => complexDirichletCoeff s (2 * n + 1)) :=
  not_summable_oddDirichletCoeff_of_re_le_one s hs.2

theorem not_summable_genuineCentralDoubleSeries_family_of_re_pos_le_one
    (s : ℂ) (hs : 0 < s.re ∧ s.re ≤ 1) :
    ¬ Summable (fun p : ℕ × ℕ =>
      (2 : ℂ) * (verticalRatio s ^ (p.1 + 2) *
        complexDirichletCoeff s (2 * p.2 + 1))) :=
  not_summable_genuineCentralDoubleSeries_family_of_re_le_one s hs.2

/-- Mathlib's totalized raw central double `tsum` is zero in the middle strip. -/
theorem genuineCentralDoubleSeries_eq_zero_of_re_le_one
    (s : ℂ) (hs : s.re ≤ 1) :
    genuineCentralDoubleSeries s = 0 := by
  unfold genuineCentralDoubleSeries
  exact tsum_eq_zero_of_not_summable
    (not_summable_genuineCentralDoubleSeries_family_of_re_le_one s hs)

theorem oddDirichletChannel_eq_zero_at_sigma_21_div_25 (t : ℝ) :
    oddDirichletChannel ((21 / 25 : ℝ) + t * Complex.I) = 0 := by
  apply oddDirichletChannel_eq_zero_of_re_le_one
  norm_num

theorem oddDirichletChannel_eq_zero_at_sigma_17_div_20 (t : ℝ) :
    oddDirichletChannel ((17 / 20 : ℝ) + t * Complex.I) = 0 := by
  apply oddDirichletChannel_eq_zero_of_re_le_one
  norm_num

theorem oddDirichletChannel_eq_zero_at_sigma_43_div_50 (t : ℝ) :
    oddDirichletChannel ((43 / 50 : ℝ) + t * Complex.I) = 0 := by
  apply oddDirichletChannel_eq_zero_of_re_le_one
  norm_num

theorem genuineCentralDoubleSeries_eq_zero_at_sigma_21_div_25 (t : ℝ) :
    genuineCentralDoubleSeries ((21 / 25 : ℝ) + t * Complex.I) = 0 := by
  apply genuineCentralDoubleSeries_eq_zero_of_re_le_one
  norm_num

theorem genuineCentralDoubleSeries_eq_zero_at_sigma_17_div_20 (t : ℝ) :
    genuineCentralDoubleSeries ((17 / 20 : ℝ) + t * Complex.I) = 0 := by
  apply genuineCentralDoubleSeries_eq_zero_of_re_le_one
  norm_num

theorem genuineCentralDoubleSeries_eq_zero_at_sigma_43_div_50 (t : ℝ) :
    genuineCentralDoubleSeries ((43 / 50 : ℝ) + t * Complex.I) = 0 := by
  apply genuineCentralDoubleSeries_eq_zero_of_re_le_one
  norm_num

end C2
