import LeanC2.AuditProjectedJ0PositiveBoxRectangleCertificateSchema
import LeanC2.AuditProjectedJ0PositiveBoxAllSubboxSkeleton
import LeanC2.AuditAdjustedQuartetProjectedJ0PositiveBoxSectorRationalizedData

set_option linter.style.longLine false

/-!
# Generated rectangle data for s0.84_t0

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
namespace S084T0

open ProjectedJ0RectangleArithmetic

def s084_t0_sb000_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((12660659409 : ℚ) / 200000000000)
      ((-4167947 : ℚ) / 20000000000)
      ((468878597 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((4641586835341043 : ℚ) / 5000000000000000000)
              hi := ((5888042799368323 : ℚ) / 1000000000000000000) }
      im := { lo := ((-275185261838623 : ℚ) / 4000000000000000)
              hi := ((-199614845397891 : ℚ) / 3125000000000000) } }
  D0Rect :=
    { re := { lo := ((2601874774236651 : ℚ) / 250000000000000000)
              hi := ((598883558731581 : ℚ) / 50000000000000000) }
      im := { lo := ((-1170707931558801 : ℚ) / 250000000000000000)
              hi := ((-31112397941450917 : ℚ) / 10000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-19363091421977807 : ℚ) / 10000000000000000000)
              hi := ((-5871346003768393 : ℚ) / 5000000000000000000) }
      im := { lo := ((3602616750738163 : ℚ) / 2000000000000000000)
              hi := ((25632924361395967 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1814850171170681 : ℚ) / 2000000000000000000)
              hi := ((6609128626891579 : ℚ) / 10000000000000000000) }
      im := { lo := ((-3632349419052727 : ℚ) / 10000000000000000000)
              hi := ((2911737227376629 : ℚ) / 2500000000000000000) } }
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

def s084_t0_sb001_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((12660659409 : ℚ) / 200000000000)
      ((-4167947 : ℚ) / 20000000000)
      ((468878597 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((9330016515505053 : ℚ) / 10000000000000000000)
              hi := ((736587468793269 : ℚ) / 125000000000000000) }
      im := { lo := ((-6877728700996727 : ℚ) / 100000000000000000)
              hi := ((-1596445415347673 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((10402299190795621 : ℚ) / 1000000000000000000)
              hi := ((1197224476733713 : ℚ) / 100000000000000000) }
      im := { lo := ((-4697805909903651 : ℚ) / 1000000000000000000)
              hi := ((-156323658412491 : ℚ) / 50000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1933209143981213 : ℚ) / 1000000000000000000)
              hi := ((-292797366474377 : ℚ) / 250000000000000000) }
      im := { lo := ((4508819490206021 : ℚ) / 2500000000000000000)
              hi := ((64137320257757 : ℚ) / 25000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4536533320142761 : ℚ) / 5000000000000000000)
              hi := ((6610492207006183 : ℚ) / 10000000000000000000) }
      im := { lo := ((-3632132825527243 : ℚ) / 10000000000000000000)
              hi := ((2329362804138189 : ℚ) / 2000000000000000000) } }
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

def s084_t0_sb002_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((12660659409 : ℚ) / 200000000000)
      ((-4167947 : ℚ) / 20000000000)
      ((468878597 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((9377089167767331 : ℚ) / 10000000000000000000)
              hi := ((147434485525857 : ℚ) / 25000000000000000) }
      im := { lo := ((-1718956682099123 : ℚ) / 25000000000000000)
              hi := ((-797986135685057 : ℚ) / 12500000000000000) } }
  D0Rect :=
    { re := { lo := ((10397079413731117 : ℚ) / 1000000000000000000)
              hi := ((5983398728476391 : ℚ) / 500000000000000000) }
      im := { lo := ((-4712772532563287 : ℚ) / 1000000000000000000)
              hi := ((-31416996191524493 : ℚ) / 10000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-9650528941462141 : ℚ) / 5000000000000000000)
              hi := ((-2920267039475337 : ℚ) / 2500000000000000000) }
      im := { lo := ((18057430710694971 : ℚ) / 10000000000000000000)
              hi := ((2567688587250593 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1133985537850393 : ℚ) / 1250000000000000000)
              hi := ((6611856680225649 : ℚ) / 10000000000000000000) }
      im := { lo := ((-1815960422246063 : ℚ) / 5000000000000000000)
              hi := ((116466835438007 : ℚ) / 100000000000000000) } }
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

def s084_t0_sb003_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((12660659409 : ℚ) / 200000000000)
      ((-4167947 : ℚ) / 20000000000)
      ((468878597 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((471219246261127 : ℚ) / 500000000000000000)
              hi := ((5902082446090731 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6873925606863533 : ℚ) / 100000000000000000)
              hi := ((-3190998677073993 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((10391839681283491 : ℚ) / 1000000000000000000)
              hi := ((2990332342176539 : ℚ) / 250000000000000000) }
      im := { lo := ((-2363866235167437 : ℚ) / 500000000000000000)
              hi := ((-1578459106347929 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-3853998691122169 : ℚ) / 2000000000000000000)
              hi := ((-728138122850937 : ℚ) / 625000000000000000) }
      im := { lo := ((112997123109883 : ℚ) / 62500000000000000)
              hi := ((2569879990820663 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1814141584270397 : ℚ) / 2000000000000000000)
              hi := ((1322645225069139 : ℚ) / 2000000000000000000) }
      im := { lo := ((-9079263160751311 : ℚ) / 25000000000000000000)
              hi := ((11646549269926623 : ℚ) / 10000000000000000000) } }
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

def s084_t0_sb004_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((12660659409 : ℚ) / 200000000000)
      ((-4167947 : ℚ) / 20000000000)
      ((468878597 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((9471910571947539 : ℚ) / 10000000000000000000)
              hi := ((5906808167687717 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6872025251981291 : ℚ) / 100000000000000000)
              hi := ((-6380106553015207 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((10386579804181647 : ℚ) / 1000000000000000000)
              hi := ((5977920343912501 : ℚ) / 500000000000000000) }
      im := { lo := ((-5928356062763233 : ℚ) / 1250000000000000000)
              hi := ((-1268851907063419 : ℚ) / 400000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2404862047186489 : ℚ) / 1250000000000000000)
              hi := ((-11619321941729677 : ℚ) / 10000000000000000000) }
      im := { lo := ((9050803117366103 : ℚ) / 5000000000000000000)
              hi := ((1286033438945323 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-9069534232261353 : ℚ) / 10000000000000000000)
              hi := ((6614597278761427 : ℚ) / 10000000000000000000) }
      im := { lo := ((-36314856125719733 : ℚ) / 100000000000000000000)
              hi := ((5823205362830193 : ℚ) / 5000000000000000000) } }
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

def s084_t0_sb005_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((12660659409 : ℚ) / 200000000000)
      ((-4167947 : ℚ) / 20000000000)
      ((468878597 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((9519664374235957 : ℚ) / 10000000000000000000)
              hi := ((11823113512554299 : ℚ) / 2000000000000000000) }
      im := { lo := ((-6870125682473231 : ℚ) / 100000000000000000)
              hi := ((-1594554168049057 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((10381299529747881 : ℚ) / 1000000000000000000)
              hi := ((2987582926302947 : ℚ) / 250000000000000000) }
      im := { lo := ((-4757629326989683 : ℚ) / 1000000000000000000)
              hi := ((-398416821642583 : ℚ) / 125000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2400970811103603 : ℚ) / 1250000000000000000)
              hi := ((-5794202202629331 : ℚ) / 5000000000000000000) }
      im := { lo := ((724945210813549 : ℚ) / 400000000000000000)
              hi := ((1287124623505839 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4534181511278273 : ℚ) / 5000000000000000000)
              hi := ((6615969926458201 : ℚ) / 10000000000000000000) }
      im := { lo := ((-4539079988448027 : ℚ) / 12500000000000000000)
              hi := ((582313500779129 : ℚ) / 500000000000000000) } }
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

def s084_t0_sb006_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((12660659409 : ℚ) / 200000000000)
      ((-4167947 : ℚ) / 20000000000)
      ((468878597 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((9567655568884067 : ℚ) / 10000000000000000000)
              hi := ((2958163634335553 : ℚ) / 500000000000000000) }
      im := { lo := ((-858528354946941 : ℚ) / 12500000000000000)
              hi := ((-637632777348861 : ℚ) / 10000000000000000) } }
  D0Rect :=
    { re := { lo := ((1037599884082223 : ℚ) / 100000000000000000)
              hi := ((2986200612666517 : ℚ) / 250000000000000000) }
      im := { lo := ((-954513226275387 : ℚ) / 200000000000000000)
              hi := ((-32025323403848363 : ℚ) / 10000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-19176604583691277 : ℚ) / 10000000000000000000)
              hi := ((-5778728338217637 : ℚ) / 5000000000000000000) }
      im := { lo := ((18145611117204273 : ℚ) / 10000000000000000000)
              hi := ((25764271565337773 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4533594208201363 : ℚ) / 5000000000000000000)
              hi := ((3308669097071667 : ℚ) / 5000000000000000000) }
      im := { lo := ((-453879585454353 : ℚ) / 1250000000000000000)
              hi := ((1164612342447527 : ℚ) / 1000000000000000000) } }
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

def s084_t0_sb007_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((12660659409 : ℚ) / 200000000000)
      ((-4167947 : ℚ) / 20000000000)
      ((468878597 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((9615878403052001 : ℚ) / 10000000000000000000)
              hi := ((5921120211773293 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3433164390623719 : ℚ) / 50000000000000000)
              hi := ((-254977592194933 : ℚ) / 4000000000000000) } }
  D0Rect :=
    { re := { lo := ((2592669561475149 : ℚ) / 250000000000000000)
              hi := ((1193925242679287 : ℚ) / 100000000000000000) }
      im := { lo := ((-4787495137289993 : ℚ) / 1000000000000000000)
              hi := ((-3217723150142039 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-29914702072821 : ℚ) / 15625000000000000)
              hi := ((-5763240092982667 : ℚ) / 5000000000000000000) }
      im := { lo := ((18167550291740963 : ℚ) / 10000000000000000000)
              hi := ((1289300223282769 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2266503974103691 : ℚ) / 2500000000000000000)
              hi := ((1654676892184441 : ℚ) / 2500000000000000000) }
      im := { lo := ((-3630807497694383 : ℚ) / 10000000000000000000)
              hi := ((11645974761586401 : ℚ) / 10000000000000000000) } }
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

def s084_t0_sb008_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((12660659409 : ℚ) / 200000000000)
      ((-4167947 : ℚ) / 20000000000)
      ((468878597 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((4832168454173947 : ℚ) / 5000000000000000000)
              hi := ((2962967612266381 : ℚ) / 500000000000000000) }
      im := { lo := ((-3432215781059081 : ℚ) / 50000000000000000)
              hi := ((-6372552716194253 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((259133434056731 : ℚ) / 25000000000000000)
              hi := ((5966841030036713 : ℚ) / 500000000000000000) }
      im := { lo := ((-960483357273859 : ℚ) / 200000000000000000)
              hi := ((-32329065033240467 : ℚ) / 10000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-191141829384461 : ℚ) / 100000000000000000)
              hi := ((-11495472883703251 : ℚ) / 10000000000000000000) }
      im := { lo := ((2273680707093087 : ℚ) / 1250000000000000000)
              hi := ((1290384662334407 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4532419453762041 : ℚ) / 5000000000000000000)
              hi := ((206877234105887 : ℚ) / 312500000000000000) }
      im := { lo := ((-1815289180535921 : ℚ) / 5000000000000000000)
              hi := ((5822912977573257 : ℚ) / 5000000000000000000) } }
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

def s084_t0_sb009_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((12660659409 : ℚ) / 200000000000)
      ((-4167947 : ℚ) / 20000000000)
      ((468878597 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((1942605096135939 : ℚ) / 2000000000000000000)
              hi := ((2965386421761531 : ℚ) / 500000000000000000) }
      im := { lo := ((-857816899185823 : ℚ) / 12500000000000000)
              hi := ((-637066650278273 : ℚ) / 10000000000000000) } }
  D0Rect :=
    { re := { lo := ((2071995195203269 : ℚ) / 200000000000000000)
              hi := ((5964045779673581 : ℚ) / 500000000000000000) }
      im := { lo := ((-9634662615374573 : ℚ) / 2000000000000000000)
              hi := ((-6496164196239219 : ℚ) / 2000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-30532682621143 : ℚ) / 16000000000000000)
              hi := ((-5732216825764477 : ℚ) / 5000000000000000000) }
      im := { lo := ((18211295991014697 : ℚ) / 10000000000000000000)
              hi := ((2582933897590061 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-906365998467473 : ℚ) / 1000000000000000000)
              hi := ((6621432499700289 : ℚ) / 10000000000000000000) }
      im := { lo := ((-3630347031861 : ℚ) / 10000000000000000)
              hi := ((11645674765002017 : ℚ) / 10000000000000000000) } }
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

def s084_t0_sb010_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((12660659409 : ℚ) / 200000000000)
      ((-4167947 : ℚ) / 20000000000)
      ((468878597 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((244048740515037 : ℚ) / 250000000000000000)
              hi := ((5935632500186251 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3430319810467747 : ℚ) / 50000000000000000)
              hi := ((-6368781224353463 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((517729732706769 : ℚ) / 50000000000000000)
              hi := ((5961240194089657 : ℚ) / 500000000000000000) }
      im := { lo := ((-4832238467719689 : ℚ) / 1000000000000000000)
              hi := ((-3263250138413407 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-190516386872609 : ℚ) / 100000000000000000)
              hi := ((-571668216941933 : ℚ) / 500000000000000000) }
      im := { lo := ((9116551611422773 : ℚ) / 5000000000000000000)
              hi := ((646273492424359 : ℚ) / 250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2265619846357467 : ℚ) / 2500000000000000000)
              hi := ((1324558170283147 : ℚ) / 2000000000000000000) }
      im := { lo := ((-9075280469209219 : ℚ) / 25000000000000000000)
              hi := ((72784499195551 : ℚ) / 62500000000000000) } }
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

def s084_t0_sb011_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((12660659409 : ℚ) / 200000000000)
      ((-4167947 : ℚ) / 20000000000)
      ((468878597 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((306597129760651 : ℚ) / 312500000000000000)
              hi := ((1188102861206851 : ℚ) / 200000000000000000) }
      im := { lo := ((-6858744857769443 : ℚ) / 100000000000000000)
              hi := ((-159172421785807 : ℚ) / 2500000000000000) } }
  D0Rect :=
    { re := { lo := ((5174596705665547 : ℚ) / 500000000000000000)
              hi := ((476673942315639 : ℚ) / 40000000000000000) }
      im := { lo := ((-484713777999099 : ℚ) / 100000000000000000)
              hi := ((-204900690562867 : ℚ) / 62500000000000000) } }
  DrestRect :=
    { re := { lo := ((-1188769871748203 : ℚ) / 625000000000000000)
              hi := ((-11402266227613681 : ℚ) / 10000000000000000000) }
      im := { lo := ((1825486831542453 : ℚ) / 1000000000000000000)
              hi := ((5174498870840297 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4530649048166451 : ℚ) / 5000000000000000000)
              hi := ((828018441656013 : ℚ) / 1250000000000000000) }
      im := { lo := ((-3629876810913207 : ℚ) / 10000000000000000000)
              hi := ((582268212820197 : ℚ) / 500000000000000000) } }
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

def s084_t0_sb012_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((12660659409 : ℚ) / 200000000000)
      ((-4167947 : ℚ) / 20000000000)
      ((468878597 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((2465124592468587 : ℚ) / 2500000000000000000)
              hi := ((297270922993857 : ℚ) / 50000000000000000) }
      im := { lo := ((-1371370205094859 : ℚ) / 20000000000000000)
              hi := ((-795626665957389 : ℚ) / 12500000000000000) } }
  D0Rect :=
    { re := { lo := ((5171886018750793 : ℚ) / 500000000000000000)
              hi := ((297779907246473 : ℚ) / 25000000000000000) }
      im := { lo := ((-2431014622807703 : ℚ) / 500000000000000000)
              hi := ((-16467823819447127 : ℚ) / 5000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-18988965044438191 : ℚ) / 10000000000000000000)
              hi := ((-1421392351845753 : ℚ) / 1250000000000000000) }
      im := { lo := ((18276590565076889 : ℚ) / 10000000000000000000)
              hi := ((12947001766767461 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-181202279366863 : ℚ) / 200000000000000000)
              hi := ((6625500400908441 : ℚ) / 10000000000000000000) }
      im := { lo := ((-907412201239537 : ℚ) / 2500000000000000000)
              hi := ((11645215825035293 : ℚ) / 10000000000000000000) } }
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

def s084_t0_sb013_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((12660659409 : ℚ) / 200000000000)
      ((-4167947 : ℚ) / 20000000000)
      ((468878597 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((49550524434859 : ℚ) / 50000000000000000)
              hi := ((5950346679641479 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6854958130317797 : ℚ) / 100000000000000000)
              hi := ((-318156529674821 : ℚ) / 5000000000000000) } }
  D0Rect :=
    { re := { lo := ((10338330789749713 : ℚ) / 1000000000000000000)
              hi := ((2976380836529771 : ℚ) / 250000000000000000) }
      im := { lo := ((-4876913345880699 : ℚ) / 1000000000000000000)
              hi := ((-3308710754396517 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-75830323300613 : ℚ) / 40000000000000000)
              hi := ((-2267996272836621 : ℚ) / 2000000000000000000) }
      im := { lo := ((18298269477747971 : ℚ) / 10000000000000000000)
              hi := ((25915467653429883 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-226473496567603 : ℚ) / 250000000000000000)
              hi := ((3313431152317083 : ℚ) / 5000000000000000000) }
      im := { lo := ((-36294222130795297 : ℚ) / 100000000000000000000)
              hi := ((727816788872581 : ℚ) / 625000000000000000) } }
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

def s084_t0_sb014_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((12660659409 : ℚ) / 200000000000)
      ((-4167947 : ℚ) / 20000000000)
      ((468878597 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((4979955147904247 : ℚ) / 5000000000000000000)
              hi := ((148882510824371 : ℚ) / 25000000000000000) }
      im := { lo := ((-6853066190245481 : ℚ) / 100000000000000000)
              hi := ((-6361248655120871 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((5166434803631109 : ℚ) / 500000000000000000)
              hi := ((11899829824904543 : ℚ) / 1000000000000000000) }
      im := { lo := ((-4891790880633351 : ℚ) / 1000000000000000000)
              hi := ((-16619240839509267 : ℚ) / 5000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-4731541933237949 : ℚ) / 2500000000000000000)
              hi := ((-565439579294871 : ℚ) / 500000000000000000) }
      im := { lo := ((4579975748319883 : ℚ) / 2500000000000000000)
              hi := ((5187377742518877 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-9057786155808709 : ℚ) / 10000000000000000000)
              hi := ((6628243636352313 : ℚ) / 10000000000000000000) }
      im := { lo := ((-725838023889419 : ℚ) / 2000000000000000000)
              hi := ((727807233353731 : ℚ) / 625000000000000000) } }
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

def s084_t0_sb015_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((12660659409 : ℚ) / 200000000000)
      ((-4167947 : ℚ) / 20000000000)
      ((468878597 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((10009922531220013 : ℚ) / 10000000000000000000)
              hi := ((2980139520483051 : ℚ) / 500000000000000000) }
      im := { lo := ((-6851175131739501 : ℚ) / 100000000000000000)
              hi := ((-6359367592635319 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((5163694310536519 : ℚ) / 500000000000000000)
              hi := ((11894115596851499 : ℚ) / 1000000000000000000) }
      im := { lo := ((-490666078256719 : ℚ) / 100000000000000000)
              hi := ((-3338978011267373 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-188947227830413 : ℚ) / 100000000000000000)
              hi := ((-2255514512618859 : ℚ) / 2000000000000000000) }
      im := { lo := ((4585373420391249 : ℚ) / 2500000000000000000)
              hi := ((25958264019200787 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1132081341638357 : ℚ) / 1250000000000000000)
              hi := ((6629642275422581 : ℚ) / 10000000000000000000) }
      im := { lo := ((-4536192617707377 : ℚ) / 12500000000000000000)
              hi := ((2328951746295077 : ℚ) / 2000000000000000000) } }
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

def s084_t0_sb016_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((12660659409 : ℚ) / 200000000000)
      ((-4167947 : ℚ) / 20000000000)
      ((468878597 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((1257520901537037 : ℚ) / 1250000000000000000)
              hi := ((186414997857027 : ℚ) / 31250000000000000) }
      im := { lo := ((-3424642414956619 : ℚ) / 50000000000000000)
              hi := ((-3178743767471197 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((516094379699763 : ℚ) / 50000000000000000)
              hi := ((11888380933262273 : ℚ) / 1000000000000000000) }
      im := { lo := ((-307595158053599 : ℚ) / 62500000000000000)
              hi := ((-1677050378373221 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-4715811322034717 : ℚ) / 2500000000000000000)
              hi := ((-11246325127893767 : ℚ) / 10000000000000000000) }
      im := { lo := ((9181520967153629 : ℚ) / 5000000000000000000)
              hi := ((2597959312043983 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1811103317121249 : ℚ) / 2000000000000000000)
              hi := ((103610018947199 : ℚ) / 156250000000000000) }
      im := { lo := ((-7257426039197401 : ℚ) / 20000000000000000000)
              hi := ((2911149124565183 : ℚ) / 2500000000000000000) } }
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

def s084_t0_sb017_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((12660659409 : ℚ) / 200000000000)
      ((-4167947 : ℚ) / 20000000000)
      ((468878597 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((5055319048529181 : ℚ) / 5000000000000000000)
              hi := ((5970303702747271 : ℚ) / 1000000000000000000) }
      im := { lo := ((-855924417358013 : ℚ) / 12500000000000000)
              hi := ((-3177804216422741 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((5158183190177837 : ℚ) / 500000000000000000)
              hi := ((11882625983593091 : ℚ) / 1000000000000000000) }
      im := { lo := ((-987275314747577 : ℚ) / 200000000000000000)
              hi := ((-842303974462597 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-18831736891908321 : ℚ) / 10000000000000000000)
              hi := ((-5607523863548537 : ℚ) / 5000000000000000000) }
      im := { lo := ((9192273125109827 : ℚ) / 5000000000000000000)
              hi := ((81252741916603 : ℚ) / 31250000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4527192933779171 : ℚ) / 5000000000000000000)
              hi := ((6632442604397683 : ℚ) / 10000000000000000000) }
      im := { lo := ((-3628466662257447 : ℚ) / 10000000000000000000)
              hi := ((1164442880213253 : ℚ) / 1000000000000000000) } }
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

def s084_t0_sb018_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((12660659409 : ℚ) / 200000000000)
      ((-4167947 : ℚ) / 20000000000)
      ((468878597 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((10161344740768521 : ℚ) / 10000000000000000000)
              hi := ((59753493758593 : ℚ) / 10000000000000000) }
      im := { lo := ((-1369101330176003 : ℚ) / 20000000000000000)
              hi := ((-6353730301178227 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((5155412434416449 : ℚ) / 500000000000000000)
              hi := ((5938425453987423 : ℚ) / 500000000000000000) }
      im := { lo := ((-309451435811053 : ℚ) / 62500000000000000)
              hi := ((-33843233119256913 : ℚ) / 10000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1880019822640049 : ℚ) / 1000000000000000000)
              hi := ((-1118373992159523 : ℚ) / 1000000000000000000) }
      im := { lo := ((9203003018296793 : ℚ) / 5000000000000000000)
              hi := ((2602211741838121 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-905325088638889 : ℚ) / 1000000000000000000)
              hi := ((3316919379043047 : ℚ) / 5000000000000000000) }
      im := { lo := ((-36282158138392813 : ℚ) / 100000000000000000000)
              hi := ((145553205454303 : ℚ) / 125000000000000000) } }
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

def s084_t0_sb019_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((12660659409 : ℚ) / 200000000000)
      ((-4167947 : ℚ) / 20000000000)
      ((468878597 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((5106144083116997 : ℚ) / 5000000000000000000)
              hi := ((1495104209005829 : ℚ) / 250000000000000000) }
      im := { lo := ((-3421809371494089 : ℚ) / 50000000000000000)
              hi := ((-3175926582828869 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((1288157866680549 : ℚ) / 125000000000000000)
              hi := ((1483881977151773 : ℚ) / 125000000000000000) }
      im := { lo := ((-2483030649485061 : ℚ) / 500000000000000000)
              hi := ((-1699711694826899 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-18768628483887971 : ℚ) / 10000000000000000000)
              hi := ((-5576201277620377 : ℚ) / 5000000000000000000) }
      im := { lo := ((1842742182912197 : ℚ) / 1000000000000000000)
              hi := ((6510828124851899 : ℚ) / 2500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-9052111121673477 : ℚ) / 10000000000000000000)
              hi := ((3317614577770049 : ℚ) / 5000000000000000000) }
      im := { lo := ((-1813980487413159 : ℚ) / 5000000000000000000)
              hi := ((2911019975626591 : ℚ) / 2500000000000000000) } }
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

def s084_t0_sb020_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((12660659409 : ℚ) / 200000000000)
      ((-4167947 : ℚ) / 20000000000)
      ((468878597 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((5131735379042127 : ℚ) / 5000000000000000000)
              hi := ((239420234744429 : ℚ) / 40000000000000000) }
      im := { lo := ((-6841731595967573 : ℚ) / 100000000000000000)
              hi := ((-1269995411014577 : ℚ) / 20000000000000000) } }
  D0Rect :=
    { re := { lo := ((5149840645033433 : ℚ) / 500000000000000000)
              hi := ((148315500520339 : ℚ) / 12500000000000000) }
      im := { lo := ((-2490445720074863 : ℚ) / 500000000000000000)
              hi := ((-8536290434077319 : ℚ) / 2500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-4684256507346353 : ℚ) / 2500000000000000000)
              hi := ((-1390129681778709 : ℚ) / 1250000000000000000) }
      im := { lo := ((1844879559690939 : ℚ) / 1000000000000000000)
              hi := ((5212892121472263 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-9050969164293133 : ℚ) / 10000000000000000000)
              hi := ((3318308192396027 : ℚ) / 5000000000000000000) }
      im := { lo := ((-362770188552523 : ℚ) / 1000000000000000000)
              hi := ((5821949471831359 : ℚ) / 5000000000000000000) } }
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

def s084_t0_sb021_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((12660659409 : ℚ) / 200000000000)
      ((-4167947 : ℚ) / 20000000000)
      ((468878597 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((5157446069199033 : ℚ) / 5000000000000000000)
              hi := ((2995308219054643 : ℚ) / 500000000000000000) }
      im := { lo := ((-683984528919323 : ℚ) / 10000000000000000)
              hi := ((-3174050943840201 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((2573519967984691 : ℚ) / 250000000000000000)
              hi := ((592970183493887 : ℚ) / 50000000000000000) }
      im := { lo := ((-1248928373212599 : ℚ) / 250000000000000000)
              hi := ((-3429601522098833 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-9352695703576799 : ℚ) / 5000000000000000000)
              hi := ((-11089644189588757 : ℚ) / 10000000000000000000) }
      im := { lo := ((9235063419246539 : ℚ) / 5000000000000000000)
              hi := ((652139054397937 : ℚ) / 250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1131227833242831 : ℚ) / 1250000000000000000)
              hi := ((6637998102088223 : ℚ) / 10000000000000000000) }
      im := { lo := ((-28339404803303 : ℚ) / 78125000000000000)
              hi := ((11643718826268277 : ℚ) / 10000000000000000000) } }
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

def s084_t0_sb022_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((12660659409 : ℚ) / 200000000000)
      ((-4167947 : ℚ) / 20000000000)
      ((468878597 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((10366550683230421 : ℚ) / 10000000000000000000)
              hi := ((2997874366318337 : ℚ) / 500000000000000000) }
      im := { lo := ((-6837959877429603 : ℚ) / 100000000000000000)
              hi := ((-6346227619875047 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((1286057337640531 : ℚ) / 125000000000000000)
              hi := ((37042333389177 : ℚ) / 3125000000000000) }
      im := { lo := ((-5010527724594451 : ℚ) / 1000000000000000000)
              hi := ((-3444679106612887 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1867372541719183 : ℚ) / 1000000000000000000)
              hi := ((-11058222064999877 : ℚ) / 10000000000000000000) }
      im := { lo := ((9245707445980809 : ℚ) / 5000000000000000000)
              hi := ((1305330887395231 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4524335823833347 : ℚ) / 5000000000000000000)
              hi := ((6639374327266009 : ℚ) / 10000000000000000000) }
      im := { lo := ((-18135942238559747 : ℚ) / 50000000000000000000)
              hi := ((11643541239917301 : ℚ) / 10000000000000000000) } }
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

def s084_t0_sb023_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((12660659409 : ℚ) / 200000000000)
      ((-4167947 : ℚ) / 20000000000)
      ((468878597 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((10418437949018563 : ℚ) / 10000000000000000000)
              hi := ((6000903557911689 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3418037737756753 : ℚ) / 50000000000000000)
              hi := ((-6344354141228431 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((10282817494527053 : ℚ) / 1000000000000000000)
              hi := ((2961917350842001 : ℚ) / 250000000000000000) }
      im := { lo := ((-1005066914070381 : ℚ) / 200000000000000000)
              hi := ((-864937110878247 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-932101500678991 : ℚ) / 500000000000000000)
              hi := ((-137834615865367 : ℚ) / 125000000000000000) }
      im := { lo := ((18512657920530177 : ℚ) / 10000000000000000000)
              hi := ((13063814551568609 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4523758830132213 : ℚ) / 5000000000000000000)
              hi := ((332037330629777 : ℚ) / 500000000000000000) }
      im := { lo := ((-18134697775209143 : ℚ) / 50000000000000000000)
              hi := ((291084248915037 : ℚ) / 250000000000000000) } }
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

def s084_t0_sb024_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((12660659409 : ℚ) / 200000000000)
      ((-4167947 : ℚ) / 20000000000)
      ((468878597 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((327204970503133 : ℚ) / 312500000000000000)
              hi := ((15015201014841309 : ℚ) / 2500000000000000000) }
      im := { lo := ((-3417095951789909 : ℚ) / 50000000000000000)
              hi := ((-6342481635900633 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((5138578219560621 : ℚ) / 500000000000000000)
              hi := ((2960442911502369 : ℚ) / 250000000000000000) }
      im := { lo := ((-1008026653128249 : ℚ) / 200000000000000000)
              hi := ((-34748102409225667 : ℚ) / 10000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-4652575721533483 : ℚ) / 2500000000000000000)
              hi := ((-274882205365841 : ℚ) / 250000000000000000) }
      im := { lo := ((18533857979223269 : ℚ) / 10000000000000000000)
              hi := ((13074297039380649 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2261590673504527 : ℚ) / 2500000000000000000)
              hi := ((6642116948782159 : ℚ) / 10000000000000000000) }
      im := { lo := ((-4533361086145433 : ℚ) / 12500000000000000000)
              hi := ((727699794322179 : ℚ) / 625000000000000000) } }
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

def s084_t0_sb025_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((12660659409 : ℚ) / 200000000000)
      ((-4167947 : ℚ) / 20000000000)
      ((468878597 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((10522916379366479 : ℚ) / 10000000000000000000)
              hi := ((300563950220291 : ℚ) / 50000000000000000) }
      im := { lo := ((-1708077275512191 : ℚ) / 25000000000000000)
              hi := ((-3170305084312533 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((2567868876006491 : ℚ) / 250000000000000000)
              hi := ((1479481686996737 : ℚ) / 125000000000000000) }
      im := { lo := ((-1010984730777541 : ℚ) / 200000000000000000)
              hi := ((-8724661512724321 : ℚ) / 2500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-232231798747481 : ℚ) / 125000000000000000)
              hi := ((-10963779214887789 : ℚ) / 10000000000000000000) }
      im := { lo := ((4638753796812703 : ℚ) / 2500000000000000000)
              hi := ((2616951251918589 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1130650762135389 : ℚ) / 1250000000000000000)
              hi := ((3321742342172527 : ℚ) / 5000000000000000000) }
      im := { lo := ((-36264330153769233 : ℚ) / 100000000000000000000)
              hi := ((291075453120631 : ℚ) / 250000000000000000) } }
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

def s084_t0_sb026_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((12660659409 : ℚ) / 200000000000)
      ((-4167947 : ℚ) / 20000000000)
      ((468878597 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((5287756942337341 : ℚ) / 5000000000000000000)
              hi := ((1504124738914979 : ℚ) / 250000000000000000) }
      im := { lo := ((-426901694158273 : ℚ) / 6250000000000000)
              hi := ((-6338739711286603 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((410630990243177 : ℚ) / 40000000000000000)
              hi := ((2957478721441707 : ℚ) / 250000000000000000) }
      im := { lo := ((-5069706167873779 : ℚ) / 1000000000000000000)
              hi := ((-3504911030193287 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2318344276251489 : ℚ) / 1250000000000000000)
              hi := ((-10932241224352063 : ℚ) / 10000000000000000000) }
      im := { lo := ((18576128617422399 : ℚ) / 10000000000000000000)
              hi := ((2619038520327731 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1130505519019613 : ℚ) / 1250000000000000000)
              hi := ((830605762875687 : ℚ) / 1250000000000000000) }
      im := { lo := ((-3626172846275517 : ℚ) / 10000000000000000000)
              hi := ((2328567011499969 : ℚ) / 2000000000000000000) } }
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

def s084_t0_sb027_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((12660659409 : ℚ) / 200000000000)
      ((-4167947 : ℚ) / 20000000000)
      ((468878597 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((2125669419258929 : ℚ) / 2000000000000000000)
              hi := ((1204348140127269 : ℚ) / 200000000000000000) }
      im := { lo := ((-1365709196261099 : ℚ) / 20000000000000000)
              hi := ((-6336870202006917 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((10260053858893947 : ℚ) / 1000000000000000000)
              hi := ((23647912320979 : ℚ) / 2000000000000000) }
      im := { lo := ((-5084480782400281 : ℚ) / 1000000000000000000)
              hi := ((-35199495000973603 : ℚ) / 10000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-18514934597296019 : ℚ) / 10000000000000000000)
              hi := ((-10900673548289073 : ℚ) / 10000000000000000000) }
      im := { lo := ((3719439466940829 : ℚ) / 2000000000000000000)
              hi := ((104844851955699 : ℚ) / 40000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4521438455404129 : ℚ) / 5000000000000000000)
              hi := ((3323100628587081 : ℚ) / 5000000000000000000) }
      im := { lo := ((-7251823491905983 : ℚ) / 20000000000000000000)
              hi := ((11642650891897847 : ℚ) / 10000000000000000000) } }
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

def s084_t0_sb028_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((12660659409 : ℚ) / 200000000000)
      ((-4167947 : ℚ) / 20000000000)
      ((468878597 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((2136283046710939 : ℚ) / 2000000000000000000)
              hi := ((188343883996001 : ℚ) / 31250000000000000) }
      im := { lo := ((-3413332841426873 : ℚ) / 50000000000000000)
              hi := ((-3167500844721787 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((10254312683889547 : ℚ) / 1000000000000000000)
              hi := ((11817977494905627 : ℚ) / 1000000000000000000) }
      im := { lo := ((-509924711921843 : ℚ) / 100000000000000000)
              hi := ((-8837450874525811 : ℚ) / 2500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-9241542262089803 : ℚ) / 5000000000000000000)
              hi := ((-2717269220454101 : ℚ) / 2500000000000000000) }
      im := { lo := ((3723644340680221 : ℚ) / 2000000000000000000)
              hi := ((1311599774014051 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-9041705403332993 : ℚ) / 10000000000000000000)
              hi := ((1661887794359139 : ℚ) / 2500000000000000000) }
      im := { lo := ((-36256479073650953 : ℚ) / 100000000000000000000)
              hi := ((2910615955638599 : ℚ) / 2500000000000000000) } }
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

def s084_t0_sb029_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((12660659409 : ℚ) / 200000000000)
      ((-4167947 : ℚ) / 20000000000)
      ((468878597 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((10734716891026333 : ℚ) / 10000000000000000000)
              hi := ((603228985415167 : ℚ) / 100000000000000000) }
      im := { lo := ((-682478625064939 : ℚ) / 10000000000000000)
              hi := ((-633313414166377 : ℚ) / 10000000000000000) } }
  D0Rect :=
    { re := { lo := ((640534439132083 : ℚ) / 62500000000000000)
              hi := ((11811979096791797 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1278501235667753 : ℚ) / 250000000000000000)
              hi := ((-35500037475132387 : ℚ) / 10000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-18451203960080317 : ℚ) / 10000000000000000000)
              hi := ((-10837451364930147 : ℚ) / 10000000000000000000) }
      im := { lo := ((931960077515791 : ℚ) / 500000000000000000)
              hi := ((1312636635875911 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-9040528923019403 : ℚ) / 10000000000000000000)
              hi := ((3324447579035249 : ℚ) / 5000000000000000000) }
      im := { lo := ((-1812692271609873 : ℚ) / 5000000000000000000)
              hi := ((232845541288633 : ℚ) / 200000000000000000) } }
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

def s084_t0_sb030_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((12660659409 : ℚ) / 200000000000)
      ((-4167947 : ℚ) / 20000000000)
      ((468878597 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((215764964947079 : ℚ) / 200000000000000000)
              hi := ((6037597751007831 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6822907865488531 : ℚ) / 100000000000000000)
              hi := ((-6331267378832557 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((10242769337273671 : ℚ) / 1000000000000000000)
              hi := ((11805960550223153 : ℚ) / 1000000000000000000) }
      im := { lo := ((-10257508551360501 : ℚ) / 2000000000000000000)
              hi := ((-17825098109219089 : ℚ) / 5000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-9209646073987241 : ℚ) / 5000000000000000000)
              hi := ((-5402898949921659 : ℚ) / 5000000000000000000) }
      im := { lo := ((1166258618686591 : ℚ) / 625000000000000000)
              hi := ((656835590546069 : ℚ) / 250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2259837074924883 : ℚ) / 2500000000000000000)
              hi := ((665023403010429 : ℚ) / 1000000000000000000) }
      im := { lo := ((-9062835718569709 : ℚ) / 25000000000000000000)
              hi := ((1164210325044339 : ℚ) / 1000000000000000000) } }
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

def s084_t0_sb031_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((12660659409 : ℚ) / 200000000000)
      ((-4167947 : ℚ) / 20000000000)
      ((468878597 : ℚ) / 100000000000) where
  MRect :=
    { re := { lo := ((2168396668032437 : ℚ) / 2000000000000000000)
              hi := ((6042930578951231 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3410515384637243 : ℚ) / 50000000000000000)
              hi := ((-1265880236176771 : ℚ) / 20000000000000000) } }
  D0Rect :=
    { re := { lo := ((81895737245971 : ℚ) / 8000000000000000)
              hi := ((5899961166517879 : ℚ) / 500000000000000000) }
      im := { lo := ((-1285873771513697 : ℚ) / 250000000000000000)
              hi := ((-17900139740646133 : ℚ) / 5000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-4596837542268573 : ℚ) / 2500000000000000000)
              hi := ((-5387057762679759 : ℚ) / 5000000000000000000) }
      im := { lo := ((4670257364285023 : ℚ) / 2500000000000000000)
              hi := ((6573517347449653 : ℚ) / 2500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4519087501461419 : ℚ) / 5000000000000000000)
              hi := ((1330315852403867 : ℚ) / 2000000000000000000) }
      im := { lo := ((-36249078991521433 : ℚ) / 100000000000000000000)
              hi := ((363811035968183 : ℚ) / 312500000000000000) } }
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
    (hi : i ∈ positiveBoxSubboxesOf .s084_t0) :
    ProjectedJ0SubboxRectangleCertificateData
      ((positiveBoxCombinedCert .s084_t0).constants.mainLower)
      ((positiveBoxCombinedCert .s084_t0).constants.d0NegReUpper)
      ((positiveBoxCombinedCert .s084_t0).constants.restUpper) := by
  if h0 : i = .s084_t0_sb000 then
    exact s084_t0_sb000_certificateData
  else if h1 : i = .s084_t0_sb001 then
    exact s084_t0_sb001_certificateData
  else if h2 : i = .s084_t0_sb002 then
    exact s084_t0_sb002_certificateData
  else if h3 : i = .s084_t0_sb003 then
    exact s084_t0_sb003_certificateData
  else if h4 : i = .s084_t0_sb004 then
    exact s084_t0_sb004_certificateData
  else if h5 : i = .s084_t0_sb005 then
    exact s084_t0_sb005_certificateData
  else if h6 : i = .s084_t0_sb006 then
    exact s084_t0_sb006_certificateData
  else if h7 : i = .s084_t0_sb007 then
    exact s084_t0_sb007_certificateData
  else if h8 : i = .s084_t0_sb008 then
    exact s084_t0_sb008_certificateData
  else if h9 : i = .s084_t0_sb009 then
    exact s084_t0_sb009_certificateData
  else if h10 : i = .s084_t0_sb010 then
    exact s084_t0_sb010_certificateData
  else if h11 : i = .s084_t0_sb011 then
    exact s084_t0_sb011_certificateData
  else if h12 : i = .s084_t0_sb012 then
    exact s084_t0_sb012_certificateData
  else if h13 : i = .s084_t0_sb013 then
    exact s084_t0_sb013_certificateData
  else if h14 : i = .s084_t0_sb014 then
    exact s084_t0_sb014_certificateData
  else if h15 : i = .s084_t0_sb015 then
    exact s084_t0_sb015_certificateData
  else if h16 : i = .s084_t0_sb016 then
    exact s084_t0_sb016_certificateData
  else if h17 : i = .s084_t0_sb017 then
    exact s084_t0_sb017_certificateData
  else if h18 : i = .s084_t0_sb018 then
    exact s084_t0_sb018_certificateData
  else if h19 : i = .s084_t0_sb019 then
    exact s084_t0_sb019_certificateData
  else if h20 : i = .s084_t0_sb020 then
    exact s084_t0_sb020_certificateData
  else if h21 : i = .s084_t0_sb021 then
    exact s084_t0_sb021_certificateData
  else if h22 : i = .s084_t0_sb022 then
    exact s084_t0_sb022_certificateData
  else if h23 : i = .s084_t0_sb023 then
    exact s084_t0_sb023_certificateData
  else if h24 : i = .s084_t0_sb024 then
    exact s084_t0_sb024_certificateData
  else if h25 : i = .s084_t0_sb025 then
    exact s084_t0_sb025_certificateData
  else if h26 : i = .s084_t0_sb026 then
    exact s084_t0_sb026_certificateData
  else if h27 : i = .s084_t0_sb027 then
    exact s084_t0_sb027_certificateData
  else if h28 : i = .s084_t0_sb028 then
    exact s084_t0_sb028_certificateData
  else if h29 : i = .s084_t0_sb029 then
    exact s084_t0_sb029_certificateData
  else if h30 : i = .s084_t0_sb030 then
    exact s084_t0_sb030_certificateData
  else if h31 : i = .s084_t0_sb031 then
    exact s084_t0_sb031_certificateData
  else
    simp [positiveBoxSubboxesOf, h0, h1, h2, h3, h4, h5, h6, h7, h8, h9, h10, h11, h12, h13, h14, h15, h16, h17, h18, h19, h20, h21, h22, h23, h24, h25, h26, h27, h28, h29, h30, h31] at hi

end S084T0
end ProjectedJ0PositiveBoxRectangleData
end ProjectedJ0PositiveBoxSkeleton
end C2
