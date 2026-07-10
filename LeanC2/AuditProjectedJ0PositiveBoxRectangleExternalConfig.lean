import LeanC2.AuditProjectedJ0PositiveBoxRectangleCertificateSchema

/-!
# External operator configuration for positive-box rectangle data

This file records the finite surrogate configuration that produced the raw
rectangle data.  It does not identify that surrogate with the projected-j0
objects.  In particular, the producer's finite tilt seed has no corresponding
Lean definition here; analytic membership remains a separate hypothesis.
-/

namespace C2
namespace ProjectedJ0PositiveBoxRectangleData

inductive ExternalReferenceMode where
  | raw
  | supergaussian
  deriving DecidableEq, Repr

inductive ExternalEnclosureMode where
  | fast
  | strict
  deriving DecidableEq, Repr

/-- Typed metadata for the finite surrogate used by the external certifier. -/
structure PositiveBoxRectangleExternalConfig where
  targetK : ℕ
  targetM : ℕ
  referenceK : ℕ
  referenceM : ℕ
  oddCoreM : ℕ
  oddReferenceM : ℕ
  referenceMode : ExternalReferenceMode
  targetReferenceMode : ExternalReferenceMode
  oddReferenceMode : ExternalReferenceMode
  referenceX : ℚ
  targetReferenceX : ℚ
  oddReferenceX : ℚ
  referenceP : ℕ
  targetReferenceP : ℕ
  oddReferenceP : ℕ
  intervalDps : ℕ
  inflate : ℚ
  subdivSigma : ℕ
  subdivT : ℕ
  enclosureMode : ExternalEnclosureMode
  implementationVersion : String
  sourceSubboxesSha256 : String
  sourceConfigSha256 : String
  rationalizedBoxesSha256 : String
  producerSha256 : String

/-- Exact configuration recorded by the granular positive-box pack. -/
def positiveBoxRectangleExternalConfig : PositiveBoxRectangleExternalConfig where
  targetK := 16
  targetM := 12001
  referenceK := 17
  referenceM := 16001
  oddCoreM := 12001
  oddReferenceM := 16001
  referenceMode := .supergaussian
  targetReferenceMode := .supergaussian
  oddReferenceMode := .supergaussian
  referenceX := 10661
  targetReferenceX := 10661
  oddReferenceX := 10661
  referenceP := 2
  targetReferenceP := 2
  oddReferenceP := 2
  intervalDps := 80
  inflate := (1 : ℚ) / 10000000000000
  subdivSigma := 1
  subdivT := 32
  enclosureMode := .fast
  implementationVersion := "sector-subbox-certificate-v1"
  sourceSubboxesSha256 :=
    "ef8298cb0c2b09354f90d3c272fe37fb58ab63dcc84d4566a3d455087c9923fe"
  sourceConfigSha256 :=
    "13ce28c0b4696297e9c25d0fde090e870fb531cabd014856d1a6f52a22b24f3d"
  rationalizedBoxesSha256 :=
    "7712949d582825faa70f6f6d362d697e15e6fa5f7f64a01a66570ccc5a0b8413"
  producerSha256 :=
    "c1ca7ef2e0663218e3013ef7a8262159add029ff2a6550b5e84582a336455d9a"

/-- The horizontal cutoff suggested by the finite producer configuration. -/
def positiveBoxRectangleCoreCutoff : ℕ → ℕ :=
  fun _ => positiveBoxRectangleExternalConfig.oddCoreM

def positiveBoxRectangleK : ℕ :=
  positiveBoxRectangleExternalConfig.targetK

def positiveBoxRectangleMidx : ℕ :=
  positiveBoxRectangleExternalConfig.targetM

/--
Explicit numeric compatibility for a projected-j0 parameter tuple.  This does
not state compatibility of the external finite tilt seed or its analytic
enclosures.
-/
structure PositiveBoxRectangleLeanParameterCompatibility
    (coreCutoff : ℕ → ℕ) (K Midx : ℕ) : Prop where
  coreCutoff_eq : coreCutoff = positiveBoxRectangleCoreCutoff
  K_eq : K = positiveBoxRectangleK
  Midx_eq : Midx = positiveBoxRectangleMidx

end ProjectedJ0PositiveBoxRectangleData
end C2
