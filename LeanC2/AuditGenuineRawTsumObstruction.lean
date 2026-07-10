import LeanC2.Analytic.GenuineRawTsumObstruction
import LeanC2.AuditAdjustedQuartetProjectedJ0Aliases

/-!
# Kernel audit of the raw middle targets

Besides replaying the obstruction theorems, this file records the transparent
body of the old finite alias.  The alias is not the central double series: it
contains that series as the subtracted target of its cutoff error.
-/

namespace C2

open AdjustedQuartetProjectedJ0Aliases

theorem adjustedProjectedJ0_totalFinite_expanded_raw
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (K M : ℕ) (s : ℂ) :
    adjustedProjectedJ0_totalFinite tiltSeed coreCutoff K M s =
      verticalDepthTailFromTwo s +
        (c2TiltRegularizedResidual (c2SeededTiltLayerResidual tiltSeed) s +
          c2ConcreteOddHorizontalDefect coreCutoff s) +
        (rectangularGenuine s K M - genuineCentralDoubleSeries s) := by
  rfl

theorem adjustedProjectedJ0_totalFinite_middle_reduction
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (K M : ℕ) (s : ℂ)
    (hs : s.re ≤ 1) :
    adjustedProjectedJ0_totalFinite tiltSeed coreCutoff K M s =
      verticalDepthTailFromTwo s +
        (c2TiltRegularizedResidual (c2SeededTiltLayerResidual tiltSeed) s +
          c2ConcreteOddHorizontalDefect coreCutoff s) +
        rectangularGenuine s K M := by
  rw [adjustedProjectedJ0_totalFinite_expanded_raw,
    genuineCentralDoubleSeries_eq_zero_of_re_le_one s hs]
  ring

end C2

-- Bodies requested by the baseline audit.  These commands are intentionally
-- kept in the audit module so future changes cannot hide behind names.
#print C2.oddDirichletChannel
#print C2.genuineCentralDoubleSeries
#print C2.AdjustedQuartetProjectedJ0Aliases.adjustedProjectedJ0_M
#print C2.AdjustedQuartetProjectedJ0Aliases.adjustedProjectedJ0_D0
#print C2.AdjustedQuartetProjectedJ0Aliases.adjustedProjectedJ0_Drest
#print C2.AdjustedQuartetProjectedJ0Aliases.adjustedProjectedJ0_RvecTail
#print C2.AdjustedQuartetProjectedJ0Aliases.adjustedProjectedJ0_totalFinite
#print C2.c2TiltRegularizedResidual
#print C2.c2HorizontalRegularizedDefect

#check SummationFilter.unconditional
#check SummationFilter.unconditional_filter

#print axioms C2.not_summable_oddDirichletCoeff_of_re_le_one
#print axioms C2.oddDirichletChannel_eq_zero_of_re_le_one
#print axioms C2.not_summable_genuineCentralDoubleSeries_family_of_re_le_one
#print axioms C2.genuineCentralDoubleSeries_eq_zero_of_re_le_one
#print axioms C2.adjustedProjectedJ0_totalFinite_middle_reduction
