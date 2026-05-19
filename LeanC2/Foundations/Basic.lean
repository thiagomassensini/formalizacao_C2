import Mathlib

namespace C2

abbrev sigmaPart (s : Complex) : ℝ := s.re
abbrev tPart (s : Complex) : ℝ := s.im

/-- Horizontal displacement from the critical line. -/
noncomputable def criticalOffset (s : Complex) : ℝ :=
  s.re - (1 : ℝ) / 2

/-- The open critical strip away from the critical line. -/
def offCriticalStrip (s : Complex) : Prop :=
  0 < s.re ∧ s.re < 1 ∧ s.re ≠ (1 : ℝ) / 2

lemma not_offCriticalStrip_of_one_lt_re {s : Complex} (hs : 1 < s.re) :
    ¬ offCriticalStrip s := by
  intro hoff
  linarith [hs, hoff.2.1]

lemma false_of_one_lt_re_offCritical {s : Complex}
    (hone : 1 < s.re) (hoff : offCriticalStrip s) : False := by
  exact not_offCriticalStrip_of_one_lt_re hone hoff

/-- Nonvanishing throughout the open critical strip away from the critical line. -/
def offCriticalStripNonvanishing (f : Complex -> Complex) : Prop :=
  ∀ s : Complex, offCriticalStrip s -> f s ≠ 0

/-- C2-facing formulation of RH: every zero in the critical strip is on the critical line. -/
def RiemannHypothesisC2 : Prop :=
  ∀ s : Complex, riemannZeta s = 0 -> 0 < s.re -> s.re < 1 -> s.re = (1 : ℝ) / 2

theorem riemannHypothesisC2_of_offCriticalStripNonvanishing
    (hζ : offCriticalStripNonvanishing riemannZeta) :
    RiemannHypothesisC2 := by
  intro s hz hs0 hs1
  by_contra hhalf
  exact hζ s ⟨hs0, hs1, hhalf⟩ hz

end C2
