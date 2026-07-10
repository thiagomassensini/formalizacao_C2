import LeanC2.AuditAdjustedQuartetProjectedJ0RealMap
import LeanC2.Analytic.GenuineBulkConcrete

/-!
# Projected-j0 aliases for the adjusted quartet

This audit file names the real adjusted-quartet components in the abstract
projected-`j0` ledger shape.  It proves only algebraic identities and
pointwise consumers whose bounds are supplied as hypotheses.
-/

namespace C2
namespace AdjustedQuartetProjectedJ0Aliases

open AdjustedQuartetHorizontalProjection
open AdjustedQuartetProjectedJ0Shim
open AdjustedQuartetProjectedJ0RealMap

/-- Seeded adjusted main vector `A(s) P₄(β(s))`. -/
noncomputable def adjustedProjectedJ0_M
    (tiltSeed : ℂ → ℂ) (s : ℂ) : ℂ :=
  c2ConcreteAntiMiracleAdjustedAmplitude tiltSeed s *
    verticalQuartetPrefix (c2ConcreteAntiMiracleAdjustedRatio s)

/-- Horizontal defect layer `j = 0`. -/
noncomputable def adjustedProjectedJ0_D0
    (coreCutoff : ℕ → ℕ) (s : ℂ) : ℂ :=
  c2ConcreteAntiMiracleAdjustedError0 coreCutoff s

/-- Horizontal defect layer `j = 1`. -/
noncomputable def adjustedProjectedJ0_D1
    (coreCutoff : ℕ → ℕ) (s : ℂ) : ℂ :=
  c2ConcreteAntiMiracleAdjustedError1 coreCutoff s

/-- Horizontal defect layer `j = 2`. -/
noncomputable def adjustedProjectedJ0_D2
    (coreCutoff : ℕ → ℕ) (s : ℂ) : ℂ :=
  c2ConcreteAntiMiracleAdjustedError2 coreCutoff s

/-- Horizontal defect layer `j = 3`. -/
noncomputable def adjustedProjectedJ0_D3
    (coreCutoff : ℕ → ℕ) (s : ℂ) : ℂ :=
  c2ConcreteAntiMiracleAdjustedError3 coreCutoff s

/-- Remaining horizontal quartet layers after the dominant `j = 0` layer. -/
noncomputable def adjustedProjectedJ0_Drest
    (coreCutoff : ℕ → ℕ) (s : ℂ) : ℂ :=
  adjustedProjectedJ0_D1 coreCutoff s +
    adjustedProjectedJ0_D2 coreCutoff s +
    adjustedProjectedJ0_D3 coreCutoff s

/-- Adjusted quartet complex total. -/
noncomputable def adjustedProjectedJ0_totalQuartet
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (s : ℂ) : ℂ :=
  c2ConcreteAntiMiracleAdjustedQuartet tiltSeed coreCutoff s

/-- Complex tail vector after removing the adjusted quartet from the finite model. -/
noncomputable def adjustedProjectedJ0_RvecTail
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (K M : ℕ) (s : ℂ) : ℂ :=
  c2ConcreteAntiMiracleAdjustedTail tiltSeed coreCutoff K M s

/-- Finite model complex total. -/
noncomputable def adjustedProjectedJ0_totalFinite
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (K M : ℕ) (s : ℂ) : ℂ :=
  c2ConcreteAntiMiracleFiniteModel tiltSeed coreCutoff K M s

theorem adjustedProjectedJ0_totalQuartet_eq
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (s : ℂ) :
    adjustedProjectedJ0_totalQuartet tiltSeed coreCutoff s =
      adjustedProjectedJ0_M tiltSeed s +
        adjustedProjectedJ0_D0 coreCutoff s +
        adjustedProjectedJ0_Drest coreCutoff s := by
  rw [adjustedProjectedJ0_totalQuartet]
  rw [c2ConcreteAntiMiracleAdjustedQuartet_eq_errorSplit tiltSeed coreCutoff s]
  unfold adjustedProjectedJ0_M adjustedProjectedJ0_D0 adjustedProjectedJ0_Drest
    adjustedProjectedJ0_D1 adjustedProjectedJ0_D2 adjustedProjectedJ0_D3
    c2ConcreteAntiMiracleAdjustedRatio verticalQuartetPrefix
  ring

theorem adjustedProjectedJ0_totalFinite_eq
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (K M : ℕ) (s : ℂ) :
    adjustedProjectedJ0_totalFinite tiltSeed coreCutoff K M s =
      adjustedProjectedJ0_M tiltSeed s +
        adjustedProjectedJ0_D0 coreCutoff s +
        adjustedProjectedJ0_Drest coreCutoff s +
        adjustedProjectedJ0_RvecTail tiltSeed coreCutoff K M s := by
  calc
    adjustedProjectedJ0_totalFinite tiltSeed coreCutoff K M s =
        c2ConcreteAntiMiracleAdjustedQuartet tiltSeed coreCutoff s +
          c2ConcreteAntiMiracleAdjustedTail tiltSeed coreCutoff K M s := by
      rw [adjustedProjectedJ0_totalFinite]
      exact c2ConcreteAntiMiracleFiniteModel_eq_adjustedQuartet_add_tail
        tiltSeed coreCutoff K M s
    _ =
        adjustedProjectedJ0_M tiltSeed s +
          adjustedProjectedJ0_D0 coreCutoff s +
          adjustedProjectedJ0_Drest coreCutoff s +
          adjustedProjectedJ0_RvecTail tiltSeed coreCutoff K M s := by
      rw [← adjustedProjectedJ0_totalQuartet]
      rw [adjustedProjectedJ0_totalQuartet_eq tiltSeed coreCutoff s]
      rw [adjustedProjectedJ0_RvecTail]

theorem adjustedProjectedJ0_totalQuartet_ne_zero_of_projected_bounds
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (s : ℂ)
    (mainLower parallelUpper restUpper : ℝ)
    (hM : adjustedProjectedJ0_M tiltSeed s ≠ 0)
    (hMain : mainLower ≤ ‖adjustedProjectedJ0_M tiltSeed s‖)
    (hParallel :
      destructiveParallel
        (adjustedProjectedJ0_M tiltSeed s)
        (adjustedProjectedJ0_D0 coreCutoff s)
        ≤ parallelUpper)
    (hRest :
      ‖adjustedProjectedJ0_Drest coreCutoff s + 0‖ ≤ restUpper)
    (hBudget : parallelUpper + restUpper < mainLower) :
    adjustedProjectedJ0_totalQuartet tiltSeed coreCutoff s ≠ 0 := by
  exact
    (AdjustedQuartetProjectedJ0RealPointData.total_ne_zero
      { s := s
        M := adjustedProjectedJ0_M tiltSeed s
        D0 := adjustedProjectedJ0_D0 coreCutoff s
        Drest := adjustedProjectedJ0_Drest coreCutoff s
        Rvec := 0
        total := adjustedProjectedJ0_totalQuartet tiltSeed coreCutoff s
        mainLower := mainLower
        parallelUpper := parallelUpper
        restUpper := restUpper
        total_eq := by
          rw [adjustedProjectedJ0_totalQuartet_eq tiltSeed coreCutoff s]
          ring
        hM := hM
        hMain := hMain
        hParallel := hParallel
        hRest := hRest
        hBudget := hBudget })

theorem adjustedProjectedJ0_totalFinite_ne_zero_of_projected_bounds
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (K M : ℕ) (s : ℂ)
    (mainLower parallelUpper restUpper : ℝ)
    (hM : adjustedProjectedJ0_M tiltSeed s ≠ 0)
    (hMain : mainLower ≤ ‖adjustedProjectedJ0_M tiltSeed s‖)
    (hParallel :
      destructiveParallel
        (adjustedProjectedJ0_M tiltSeed s)
        (adjustedProjectedJ0_D0 coreCutoff s)
        ≤ parallelUpper)
    (hRest :
      ‖adjustedProjectedJ0_Drest coreCutoff s +
        adjustedProjectedJ0_RvecTail tiltSeed coreCutoff K M s‖ ≤ restUpper)
    (hBudget : parallelUpper + restUpper < mainLower) :
    adjustedProjectedJ0_totalFinite tiltSeed coreCutoff K M s ≠ 0 := by
  exact
    (AdjustedQuartetProjectedJ0RealPointData.total_ne_zero
      { s := s
        M := adjustedProjectedJ0_M tiltSeed s
        D0 := adjustedProjectedJ0_D0 coreCutoff s
        Drest := adjustedProjectedJ0_Drest coreCutoff s
        Rvec := adjustedProjectedJ0_RvecTail tiltSeed coreCutoff K M s
        total := adjustedProjectedJ0_totalFinite tiltSeed coreCutoff K M s
        mainLower := mainLower
        parallelUpper := parallelUpper
        restUpper := restUpper
        total_eq := by
          rw [adjustedProjectedJ0_totalFinite_eq tiltSeed coreCutoff K M s]
        hM := hM
        hMain := hMain
        hParallel := hParallel
        hRest := hRest
        hBudget := hBudget })

theorem adjustedProjectedJ0_totalQuartet_ne_zero_of_projected_separate_bounds
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (s : ℂ)
    (mainLower parallelUpper restUpper : ℝ)
    (hM : adjustedProjectedJ0_M tiltSeed s ≠ 0)
    (hMain : mainLower ≤ ‖adjustedProjectedJ0_M tiltSeed s‖)
    (hParallel :
      destructiveParallel
        (adjustedProjectedJ0_M tiltSeed s)
        (adjustedProjectedJ0_D0 coreCutoff s)
        ≤ parallelUpper)
    (hRest : ‖adjustedProjectedJ0_Drest coreCutoff s‖ + ‖(0 : ℂ)‖ ≤ restUpper)
    (hBudget : parallelUpper + restUpper < mainLower) :
    adjustedProjectedJ0_totalQuartet tiltSeed coreCutoff s ≠ 0 := by
  let data : AdjustedQuartetProjectedJ0SeparateRestPointData :=
    { M := adjustedProjectedJ0_M tiltSeed s
      D0 := adjustedProjectedJ0_D0 coreCutoff s
      Drest := adjustedProjectedJ0_Drest coreCutoff s
      R := 0
      total := adjustedProjectedJ0_totalQuartet tiltSeed coreCutoff s
      mainLower := mainLower
      parallelUpper := parallelUpper
      restUpper := restUpper
      total_eq := by
        rw [adjustedProjectedJ0_totalQuartet_eq tiltSeed coreCutoff s]
        ring
      hM := hM
      hMain := hMain
      hParallel := hParallel
      hRest := hRest
      hBudget := hBudget }
  exact AdjustedQuartetProjectedJ0SeparateRestPointData.total_ne_zero data

theorem adjustedProjectedJ0_totalFinite_ne_zero_of_projected_separate_bounds
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (K M : ℕ) (s : ℂ)
    (mainLower parallelUpper restUpper : ℝ)
    (hM : adjustedProjectedJ0_M tiltSeed s ≠ 0)
    (hMain : mainLower ≤ ‖adjustedProjectedJ0_M tiltSeed s‖)
    (hParallel :
      destructiveParallel
        (adjustedProjectedJ0_M tiltSeed s)
        (adjustedProjectedJ0_D0 coreCutoff s)
        ≤ parallelUpper)
    (hRest :
      ‖adjustedProjectedJ0_Drest coreCutoff s‖ +
        ‖adjustedProjectedJ0_RvecTail tiltSeed coreCutoff K M s‖ ≤ restUpper)
    (hBudget : parallelUpper + restUpper < mainLower) :
    adjustedProjectedJ0_totalFinite tiltSeed coreCutoff K M s ≠ 0 := by
  let data : AdjustedQuartetProjectedJ0SeparateRestPointData :=
    { M := adjustedProjectedJ0_M tiltSeed s
      D0 := adjustedProjectedJ0_D0 coreCutoff s
      Drest := adjustedProjectedJ0_Drest coreCutoff s
      R := adjustedProjectedJ0_RvecTail tiltSeed coreCutoff K M s
      total := adjustedProjectedJ0_totalFinite tiltSeed coreCutoff K M s
      mainLower := mainLower
      parallelUpper := parallelUpper
      restUpper := restUpper
      total_eq := by
        rw [adjustedProjectedJ0_totalFinite_eq tiltSeed coreCutoff K M s]
      hM := hM
      hMain := hMain
      hParallel := hParallel
      hRest := hRest
      hBudget := hBudget }
  exact AdjustedQuartetProjectedJ0SeparateRestPointData.total_ne_zero data

end AdjustedQuartetProjectedJ0Aliases
end C2
