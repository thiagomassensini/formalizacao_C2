import LeanC2.AuditProjectedJ0PositiveBoxRectangleCertificateSchema
import LeanC2.AuditProjectedJ0PositiveBoxAllSubboxSkeleton
import LeanC2.AuditAdjustedQuartetProjectedJ0PositiveBoxSectorRationalizedData

set_option linter.style.longLine false

/-!
# Generated rectangle data for s0.86_t8

This file contains exact rational endpoints and kernel-checkable
rectangle arithmetic. It intentionally contains no theorem asserting
analytic membership of M, D0, Drest, or RvecTail in these rectangles.

Source subboxes: audit_outputs/projected_j0_positive_box_sector_subbox_certificate/subboxes.jsonl
Source subboxes SHA256: ef8298cb0c2b09354f90d3c272fe37fb58ab63dcc84d4566a3d455087c9923fe
Source box constants: audit_outputs/projected_j0_positive_box_sector_rationalized_pack/boxes_sector_rationalized.csv
Source box constants SHA256: 7712949d582825faa70f6f6d362d697e15e6fa5f7f64a01a66570ccc5a0b8413
Skeleton: LeanC2/AuditProjectedJ0PositiveBoxAllSubboxSkeleton.lean
Skeleton SHA256: f6cfce6ac124ef7f0161de797faa441ec1fbb99a1a20d0f1ccdb57c22afe40b3
-/

namespace C2
namespace ProjectedJ0PositiveBoxSkeleton
namespace ProjectedJ0PositiveBoxRectangleData
namespace S086T8

open ProjectedJ0RectangleArithmetic

def s086_t8_sb000_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((31504180963 : ℚ) / 500000000000)
      ((-469374089 : ℚ) / 1000000000000)
      ((2530741837 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((8184260966756557 : ℚ) / 1000000000000000000)
              hi := ((1636852249605721 : ℚ) / 200000000000000000) }
      im := { lo := ((-390466046637967 : ℚ) / 6250000000000000)
              hi := ((-3123728359282261 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((3436228913481849 : ℚ) / 500000000000000000)
              hi := ((6872457910619661 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1653185148740241 : ℚ) / 250000000000000000)
              hi := ((-661274051311569 : ℚ) / 100000000000000000) } }
  DrestRect :=
    { re := { lo := ((-35264254054070103 : ℚ) / 100000000000000000000)
              hi := ((-352642497475661 : ℚ) / 1000000000000000000) }
      im := { lo := ((2109227931056431 : ℚ) / 1000000000000000000)
              hi := ((659133741956033 : ℚ) / 312500000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-418913378048201 : ℚ) / 5000000000000000000)
              hi := ((-1047282312268287 : ℚ) / 12500000000000000000) }
      im := { lo := ((38359910373191643 : ℚ) / 100000000000000000000)
              hi := ((38359919027747833 : ℚ) / 100000000000000000000) } }
  MRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  D0Rect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  DrestRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  RvecTailRect_valid := by
    norm_num [RationalComplexRect.Valid, RationalRealInterval.Valid]
  M_re_nonneg := by norm_num
  M_im_nonpos := by norm_num
  D0_re_nonneg := by norm_num
  D0_im_nonpos := by norm_num
  mainLower_nonneg := by norm_num
  mainLower_sq := by norm_num
  d0_endpoint_upper_le := by
    norm_num [
      projectedJ0D0NegReUpperRat,
      RationalRealInterval.mulNonneg,
      RationalRealInterval.mulNonpos
    ]
  restUpper_nonneg := by norm_num
  rest_endpoint_sq_le := by
    norm_num [
      projectedJ0RestCombinedReAbsUpperRat,
      projectedJ0RestCombinedImAbsUpperRat,
      projectedJ0RestCombinedRectRat,
      RationalComplexRect.add,
      RationalRealInterval.add,
      RationalRealInterval.absEndpointMax,
      abs_of_nonneg, abs_of_nonpos, max_def
    ]

/--
Return rectangle data only for a subbox formally belonging to this box.
The membership argument rules out every constructor from the other boxes;
there is no default or fallback certificate.
-/
def certificate (i : PositiveBoxSubboxId)
    (hi : i ∈ positiveBoxSubboxesOf .s086_t8) :
    ProjectedJ0SubboxRectangleCertificateData
      ((positiveBoxCombinedCert .s086_t8).constants.mainLower)
      ((positiveBoxCombinedCert .s086_t8).constants.d0NegReUpper)
      ((positiveBoxCombinedCert .s086_t8).constants.restUpper) := by
  if h0 : i = .s086_t8_sb000 then
    exact s086_t8_sb000_certificateData
  else
    simp [positiveBoxSubboxesOf, h0] at hi

end S086T8
end ProjectedJ0PositiveBoxRectangleData
end ProjectedJ0PositiveBoxSkeleton
end C2
