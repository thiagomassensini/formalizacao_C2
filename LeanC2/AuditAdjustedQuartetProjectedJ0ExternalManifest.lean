import LeanC2.AuditAdjustedQuartetProjectedJ0IntervalCertificateSchema

/-!
# External manifest schema for projected-j0 certificate packs

This file only records the shape of external pack metadata.  It does not import
pack data, does not verify hashes, and does not turn external constants into
Lean proofs.
-/

namespace C2
namespace AdjustedQuartetProjectedJ0Aliases

/--
Small summary of one external projected-j0 certificate pack.

The real constants here are metadata copied from an external manifest, not
kernel-checked interval arithmetic.
-/
structure ProjectedJ0ExternalPackSummary where
  boxesCount : Nat
  certifiedCombinedCount : Nat
  certifiedSeparateCount : Nat
  minBudgetCombined : ℝ
  minBudgetSeparate : ℝ

/--
Documentary wrapper for a pack whose external verifier reports all combined
boxes certified.
-/
structure ProjectedJ0ExternalPackVerified where
  metadata : ProjectedJ0ExternalPackSummary
  allCombinedCertified :
    metadata.certifiedCombinedCount = metadata.boxesCount
  combinedBudgetPositive :
    0 < metadata.minBudgetCombined

/--
Optional documentary wrapper for packs whose separate-rest route also certifies
every box.
-/
structure ProjectedJ0ExternalPackSeparateVerified where
  verified : ProjectedJ0ExternalPackVerified
  allSeparateCertified :
    verified.metadata.certifiedSeparateCount = verified.metadata.boxesCount
  separateBudgetPositive :
    0 < verified.metadata.minBudgetSeparate

end AdjustedQuartetProjectedJ0Aliases
end C2
