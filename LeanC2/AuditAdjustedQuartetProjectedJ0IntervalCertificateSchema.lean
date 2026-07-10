import LeanC2.AuditAdjustedQuartetProjectedJ0ConstantAtlas

/-!
# External interval certificate schema for projected-j0 boxes

This file only records the shape of constants produced by an external interval
certifier.  It does not verify interval arithmetic and it does not turn any
external file into a Lean proof.
-/

namespace C2
namespace AdjustedQuartetProjectedJ0Aliases

/--
Minimal numeric payload for one external box certificate.  The region-wise
analytic fields required by `ProjectedJ0ConstantBoxData` remain separate.
-/
structure ProjectedJ0ExternalBoxCertificate where
  sigmaMin : ℝ
  sigmaMax : ℝ
  tMin : ℝ
  tMax : ℝ
  mainNormLowerConst : ℝ
  numeratorUpperConst : ℝ
  restUpperConst : ℝ
  main_pos :
    0 < mainNormLowerConst
  numerator_nonneg :
    0 ≤ numeratorUpperConst
  rest_nonneg :
    0 ≤ restUpperConst
  budget_pos :
    0 < mainNormLowerConst -
      numeratorUpperConst / mainNormLowerConst -
      restUpperConst

/-- Same payload shape for a combined-rest external certificate. -/
abbrev ProjectedJ0ExternalCombinedBoxCertificate :=
  ProjectedJ0ExternalBoxCertificate

/-- Same payload shape for a separate-rest external certificate. -/
abbrev ProjectedJ0ExternalSeparateBoxCertificate :=
  ProjectedJ0ExternalBoxCertificate

theorem ProjectedJ0ExternalBoxCertificate.parallelUpper_nonneg
    (cert : ProjectedJ0ExternalBoxCertificate) :
    0 ≤ cert.numeratorUpperConst / cert.mainNormLowerConst := by
  exact div_nonneg cert.numerator_nonneg cert.main_pos.le

end AdjustedQuartetProjectedJ0Aliases
end C2
