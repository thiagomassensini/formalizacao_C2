import LeanC2.AuditProjectedJ0PositiveBoxRectangleCertificateSchema
import LeanC2.AuditProjectedJ0PositiveBoxAllSubboxSkeleton
import LeanC2.AuditAdjustedQuartetProjectedJ0PositiveBoxSectorRationalizedData

set_option linter.style.longLine false

/-!
# Generated rectangle data for s0.84_t6

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
namespace S084T6

open ProjectedJ0RectangleArithmetic

def s084_t6_sb000_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((29609609161 : ℚ) / 500000000000)
      ((-410814633 : ℚ) / 1000000000000)
      ((2287197939 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((2693946526341987 : ℚ) / 1000000000000000000)
              hi := ((763656680617161 : ℚ) / 100000000000000000) }
      im := { lo := ((-6452734890410783 : ℚ) / 100000000000000000)
              hi := ((-5963631551202259 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((8603876938988207 : ℚ) / 1000000000000000000)
              hi := ((5058246011371269 : ℚ) / 500000000000000000) }
      im := { lo := ((-8007471997393333 : ℚ) / 1000000000000000000)
              hi := ((-6500003330549443 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-557971148910033 : ℚ) / 500000000000000000)
              hi := ((-3612955094573681 : ℚ) / 10000000000000000000) }
      im := { lo := ((440186024454059 : ℚ) / 200000000000000000)
              hi := ((1182375098971071 : ℚ) / 400000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-878054906961907 : ℚ) / 1000000000000000000)
              hi := ((6900338801306253 : ℚ) / 10000000000000000000) }
      im := { lo := ((-1118255737471717 : ℚ) / 3125000000000000000)
              hi := ((1160987414514047 : ℚ) / 1000000000000000000) } }
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

def s084_t6_sb001_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((29609609161 : ℚ) / 500000000000)
      ((-410814633 : ℚ) / 1000000000000)
      ((2287197939 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((270389067556001 : ℚ) / 100000000000000000)
              hi := ((3823205345022533 : ℚ) / 500000000000000000) }
      im := { lo := ((-1612776330953597 : ℚ) / 25000000000000000)
              hi := ((-596201689516731 : ℚ) / 10000000000000000) } }
  D0Rect :=
    { re := { lo := ((1074270254073919 : ℚ) / 125000000000000000)
              hi := ((10106526367049921 : ℚ) / 1000000000000000000) }
      im := { lo := ((-4009973909339163 : ℚ) / 500000000000000000)
              hi := ((-1628188680671277 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-139033647589611 : ℚ) / 125000000000000000)
              hi := ((-8941584112969359 : ℚ) / 25000000000000000000) }
      im := { lo := ((22020038450263 : ℚ) / 10000000000000000)
              hi := ((2956972776317477 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-274354369781721 : ℚ) / 312500000000000000)
              hi := ((6901462726396077 : ℚ) / 10000000000000000000) }
      im := { lo := ((-715628366735657 : ℚ) / 2000000000000000000)
              hi := ((11609668829743937 : ℚ) / 10000000000000000000) } }
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

def s084_t6_sb002_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((29609609161 : ℚ) / 500000000000)
      ((-410814633 : ℚ) / 1000000000000)
      ((2287197939 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((217108351510619 : ℚ) / 80000000000000000)
              hi := ((7656275723533967 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1612369345786463 : ℚ) / 25000000000000000)
              hi := ((-29802017600001063 : ℚ) / 500000000000000000) } }
  D0Rect :=
    { re := { lo := ((8584429584995609 : ℚ) / 1000000000000000000)
              hi := ((631034016856781 : ℚ) / 62500000000000000) }
      im := { lo := ((-401620512270063 : ℚ) / 50000000000000000)
              hi := ((-6525492813894533 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-443437857871811 : ℚ) / 400000000000000000)
              hi := ((-17701481824267183 : ℚ) / 50000000000000000000) }
      im := { lo := ((2203072273434233 : ℚ) / 1000000000000000000)
              hi := ((7395006909961721 : ℚ) / 2500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2194532483603549 : ℚ) / 2500000000000000000)
              hi := ((3451292602692839 : ℚ) / 5000000000000000000) }
      im := { lo := ((-7155751997615301 : ℚ) / 20000000000000000000)
              hi := ((11609474310660167 : ℚ) / 10000000000000000000) } }
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

def s084_t6_sb003_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((29609609161 : ℚ) / 500000000000)
      ((-410814633 : ℚ) / 1000000000000)
      ((2287197939 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((27238392484509447 : ℚ) / 10000000000000000000)
              hi := ((19165400811649131 : ℚ) / 2500000000000000000) }
      im := { lo := ((-51582806538327 : ℚ) / 800000000000000)
              hi := ((-2979395832981533 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((4287339960431339 : ℚ) / 500000000000000000)
              hi := ((403461816960387 : ℚ) / 40000000000000000) }
      im := { lo := ((-2011214856797311 : ℚ) / 250000000000000000)
              hi := ((-1634554350692287 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-552459338989151 : ℚ) / 500000000000000000)
              hi := ((-35039434915795257 : ℚ) / 100000000000000000000) }
      im := { lo := ((11020677278570977 : ℚ) / 5000000000000000000)
              hi := ((739756913594201 : ℚ) / 250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-87769149728153 : ℚ) / 100000000000000000)
              hi := ((6903701838536213 : ℚ) / 10000000000000000000) }
      im := { lo := ((-1788802814775689 : ℚ) / 5000000000000000000)
              hi := ((2902318838443591 : ℚ) / 2500000000000000000) } }
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

def s084_t6_sb004_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((29609609161 : ℚ) / 500000000000)
      ((-410814633 : ℚ) / 1000000000000)
      ((2287197939 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((54676909598549 : ℚ) / 20000000000000000)
              hi := ((3838032113366627 : ℚ) / 500000000000000000) }
      im := { lo := ((-6446225610749973 : ℚ) / 100000000000000000)
              hi := ((-5957181357692453 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((34259652922917 : ℚ) / 4000000000000000)
              hi := ((5038264838352757 : ℚ) / 500000000000000000) }
      im := { lo := ((-4028647626059237 : ℚ) / 500000000000000000)
              hi := ((-13101857110627061 : ℚ) / 2000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-440496490331011 : ℚ) / 400000000000000000)
              hi := ((-3467575721570687 : ℚ) / 10000000000000000000) }
      im := { lo := ((4410386915610097 : ℚ) / 2000000000000000000)
              hi := ((14800236887018213 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8775694530030913 : ℚ) / 10000000000000000000)
              hi := ((6904812208404377 : ℚ) / 10000000000000000000) }
      im := { lo := ((-3577330454692391 : ℚ) / 10000000000000000000)
              hi := ((1160907169163597 : ℚ) / 1000000000000000000) } }
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

def s084_t6_sb005_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((29609609161 : ℚ) / 500000000000)
      ((-410814633 : ℚ) / 1000000000000)
      ((2287197939 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((1371936133305473 : ℚ) / 500000000000000000)
              hi := ((1537197647361431 : ℚ) / 200000000000000000) }
      im := { lo := ((-6444601960162823 : ℚ) / 100000000000000000)
              hi := ((-5955572401786123 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((213878241337189 : ℚ) / 25000000000000000)
              hi := ((1258312116768387 : ℚ) / 125000000000000000) }
      im := { lo := ((-8069717941334549 : ℚ) / 1000000000000000000)
              hi := ((-6563626016018107 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-10975623385952899 : ℚ) / 10000000000000000000)
              hi := ((-34311926983095307 : ℚ) / 100000000000000000000) }
      im := { lo := ((11031231306131617 : ℚ) / 5000000000000000000)
              hi := ((7402654876421629 : ℚ) / 2500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4387235243882207 : ℚ) / 5000000000000000000)
              hi := ((8632397745537 : ℚ) / 12500000000000000) }
      im := { lo := ((-17885309455663507 : ℚ) / 50000000000000000000)
              hi := ((145110934272227 : ℚ) / 125000000000000000) } }
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

def s084_t6_sb006_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((29609609161 : ℚ) / 500000000000)
      ((-410814633 : ℚ) / 1000000000000)
      ((2287197939 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((1376958851031249 : ℚ) / 500000000000000000)
              hi := ((1923983545077681 : ℚ) / 250000000000000000) }
      im := { lo := ((-3221490065333523 : ℚ) / 50000000000000000)
              hi := ((-29769822727952023 : ℚ) / 500000000000000000) } }
  D0Rect :=
    { re := { lo := ((854532912947863 : ℚ) / 100000000000000000)
              hi := ((10056447277266777 : ℚ) / 1000000000000000000) }
      im := { lo := ((-8082128274096479 : ℚ) / 1000000000000000000)
              hi := ((-6576308947096873 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-5469411343715537 : ℚ) / 5000000000000000000)
              hi := ((-67895840649831 : ℚ) / 200000000000000000) }
      im := { lo := ((2207293668262669 : ℚ) / 1000000000000000000)
              hi := ((14810357814932951 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-548328096486771 : ℚ) / 625000000000000000)
              hi := ((17267566263539 : ℚ) / 25000000000000000) }
      im := { lo := ((-35768104183016877 : ℚ) / 100000000000000000000)
              hi := ((232173899780563 : ℚ) / 200000000000000000) } }
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

def s084_t6_sb007_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((29609609161 : ℚ) / 500000000000)
      ((-410814633 : ℚ) / 1000000000000)
      ((2287197939 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((13819920573148747 : ℚ) / 5000000000000000000)
              hi := ((7705899755056553 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6441359739780603 : ℚ) / 100000000000000000)
              hi := ((-2976179083852861 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((8535511870462621 : ℚ) / 1000000000000000000)
              hi := ((10046380544853219 : ℚ) / 1000000000000000000) }
      im := { lo := ((-404726307333379 : ℚ) / 50000000000000000)
              hi := ((-6588977411205277 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-10902009611336609 : ℚ) / 10000000000000000000)
              hi := ((-8395936104034649 : ℚ) / 25000000000000000000) }
      im := { lo := ((11041678746345077 : ℚ) / 5000000000000000000)
              hi := ((14815380714101737 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2193006125213041 : ℚ) / 2500000000000000000)
              hi := ((863516241876263 : ℚ) / 1250000000000000000) }
      im := { lo := ((-35765537901104403 : ℚ) / 100000000000000000000)
              hi := ((580425509165497 : ℚ) / 500000000000000000) } }
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

def s084_t6_sb008_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((29609609161 : ℚ) / 500000000000)
      ((-410814633 : ℚ) / 1000000000000)
      ((2287197939 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((2774072195500281 : ℚ) / 1000000000000000000)
              hi := ((7715884223343211 : ℚ) / 1000000000000000000) }
      im := { lo := ((-321987034626527 : ℚ) / 5000000000000000)
              hi := ((-5950753370915871 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((213141950886071 : ℚ) / 25000000000000000)
              hi := ((5018148304893621 : ℚ) / 500000000000000000) }
      im := { lo := ((-8106910562970391 : ℚ) / 1000000000000000000)
              hi := ((-1320326472073019 : ℚ) / 200000000000000000) } }
  DrestRect :=
    { re := { lo := ((-5432590571451193 : ℚ) / 5000000000000000000)
              hi := ((-3321943077093367 : ℚ) / 10000000000000000000) }
      im := { lo := ((552343187944003 : ℚ) / 250000000000000000)
              hi := ((29640754380449333 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4385396995315507 : ℚ) / 5000000000000000000)
              hi := ((1381845423831839 : ℚ) / 2000000000000000000) }
      im := { lo := ((-8940729161235909 : ℚ) / 25000000000000000000)
              hi := ((725519999103027 : ℚ) / 625000000000000000) } }
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

def s084_t6_sb009_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((29609609161 : ℚ) / 500000000000)
      ((-410814633 : ℚ) / 1000000000000)
      ((2287197939 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((27841821247248633 : ℚ) / 10000000000000000000)
              hi := ((7725887359691393 : ℚ) / 1000000000000000000) }
      im := { lo := ((-321906148607897 : ℚ) / 5000000000000000)
              hi := ((-2974575087370827 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((8515827816689291 : ℚ) / 1000000000000000000)
              hi := ((5013097656736863 : ℚ) / 500000000000000000) }
      im := { lo := ((-1014910152123753 : ℚ) / 125000000000000000)
              hi := ((-413392128376003 : ℚ) / 62500000000000000) } }
  DrestRect :=
    { re := { lo := ((-10828336170888133 : ℚ) / 10000000000000000000)
              hi := ((-3285499193000401 : ℚ) / 10000000000000000000) }
      im := { lo := ((4420809568351297 : ℚ) / 2000000000000000000)
              hi := ((1482534667767619 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4384779058861487 : ℚ) / 5000000000000000000)
              hi := ((6910318164681009 : ℚ) / 10000000000000000000) }
      im := { lo := ((-3576024835866959 : ℚ) / 10000000000000000000)
              hi := ((1160812519037787 : ℚ) / 1000000000000000000) } }
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

def s084_t6_sb010_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((29609609161 : ℚ) / 500000000000)
      ((-410814633 : ℚ) / 1000000000000)
      ((2287197939 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((27943133563310663 : ℚ) / 10000000000000000000)
              hi := ((7735909740118327 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6436506626666731 : ℚ) / 100000000000000000)
              hi := ((-5947548539405911 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((8505961270247461 : ℚ) / 1000000000000000000)
              hi := ((10016076636509403 : ℚ) / 1000000000000000000) }
      im := { lo := ((-8131638290368233 : ℚ) / 1000000000000000000)
              hi := ((-3313451129054939 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-10791475285363379 : ℚ) / 10000000000000000000)
              hi := ((-3249042354960491 : ℚ) / 10000000000000000000) }
      im := { lo := ((22114318100806257 : ℚ) / 10000000000000000000)
              hi := ((2966057866277661 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4384160021587667 : ℚ) / 5000000000000000000)
              hi := ((1727851557528973 : ℚ) / 2500000000000000000) }
      im := { lo := ((-357575416986007 : ℚ) / 1000000000000000000)
              hi := ((2901981666490423 : ℚ) / 2500000000000000000) } }
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

def s084_t6_sb011_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((29609609161 : ℚ) / 500000000000)
      ((-410814633 : ℚ) / 1000000000000)
      ((2287197939 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((3505582130623733 : ℚ) / 1250000000000000000)
              hi := ((3872975707219519 : ℚ) / 500000000000000000) }
      im := { lo := ((-643489165973933 : ℚ) / 10000000000000000)
              hi := ((-1486487115069099 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((8496078047533617 : ℚ) / 1000000000000000000)
              hi := ((2001188194460141 : ℚ) / 200000000000000000) }
      im := { lo := ((-4071990681358271 : ℚ) / 500000000000000000)
              hi := ((-1659879339208607 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-10754598207732597 : ℚ) / 10000000000000000000)
              hi := ((-3212572990819179 : ℚ) / 10000000000000000000) }
      im := { lo := ((5531134523146801 : ℚ) / 2500000000000000000)
              hi := ((29670410492090983 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1095884864044531 : ℚ) / 1250000000000000000)
              hi := ((276499618717097 : ℚ) / 400000000000000000) }
      im := { lo := ((-8938703812949231 : ℚ) / 25000000000000000000)
              hi := ((58038631346367 : ℚ) / 50000000000000000) } }
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

def s084_t6_sb012_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((29609609161 : ℚ) / 500000000000)
      ((-410814633 : ℚ) / 1000000000000)
      ((2287197939 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((351829522308367 : ℚ) / 125000000000000000)
              hi := ((3878007748765763 : ℚ) / 500000000000000000) }
      im := { lo := ((-32166391348993 : ℚ) / 500000000000000)
              hi := ((-2972174878257409 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((1697235575975077 : ℚ) / 200000000000000000)
              hi := ((999578861487159 : ℚ) / 100000000000000000) }
      im := { lo := ((-101953882561003 : ℚ) / 12500000000000000)
              hi := ((-3326059566185107 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-5358853079505399 : ℚ) / 5000000000000000000)
              hi := ((-1588045003654791 : ℚ) / 5000000000000000000) }
      im := { lo := ((553367664188293 : ℚ) / 250000000000000000)
              hi := ((29680190033940027 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8765851298267043 : ℚ) / 10000000000000000000)
              hi := ((6913587443414011 : ℚ) / 10000000000000000000) }
      im := { lo := ((-1787606265024517 : ℚ) / 5000000000000000000)
              hi := ((11607529637283403 : ℚ) / 10000000000000000000) } }
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

def s084_t6_sb013_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((29609609161 : ℚ) / 500000000000)
      ((-410814633 : ℚ) / 1000000000000)
      ((2287197939 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((28248267136134603 : ℚ) / 10000000000000000000)
              hi := ((3883049955114109 : ℚ) / 500000000000000000) }
      im := { lo := ((-6431666314064483 : ℚ) / 100000000000000000)
              hi := ((-5942752561112121 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((4238130465963317 : ℚ) / 500000000000000000)
              hi := ((9985619443950421 : ℚ) / 1000000000000000000) }
      im := { lo := ((-4084313053886699 : ℚ) / 500000000000000000)
              hi := ((-3332353725889389 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-10680799231051767 : ℚ) / 10000000000000000000)
              hi := ((-3139593468623849 : ℚ) / 10000000000000000000) }
      im := { lo := ((22144823679978967 : ℚ) / 10000000000000000000)
              hi := ((1855619819335151 : ℚ) / 625000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8764626176008843 : ℚ) / 10000000000000000000)
              hi := ((6914686139325303 : ℚ) / 10000000000000000000) }
      im := { lo := ((-1787470591625749 : ℚ) / 5000000000000000000)
              hi := ((1160733076136451 : ℚ) / 1000000000000000000) } }
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

def s084_t6_sb014_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((29609609161 : ℚ) / 500000000000)
      ((-410814633 : ℚ) / 1000000000000)
      ((2287197939 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((14175186501548577 : ℚ) / 5000000000000000000)
              hi := ((3796974914999 : ℚ) / 488281250000000) }
      im := { lo := ((-1607513950963881 : ℚ) / 25000000000000000)
              hi := ((-1485289218350143 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((105829095391499 : ℚ) / 12500000000000000)
              hi := ((997543306538381 : ℚ) / 100000000000000000) }
      im := { lo := ((-4090464244599943 : ℚ) / 500000000000000000)
              hi := ((-8346602044437577 : ℚ) / 1250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-106438784780929 : ℚ) / 100000000000000000)
              hi := ((-3878853103443597 : ℚ) / 12500000000000000000) }
      im := { lo := ((346170143382439 : ℚ) / 156250000000000000)
              hi := ((29699591896331073 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1752680993692767 : ℚ) / 2000000000000000000)
              hi := ((6915787980227633 : ℚ) / 10000000000000000000) }
      im := { lo := ((-35746648402905373 : ℚ) / 100000000000000000000)
              hi := ((5803563500509383 : ℚ) / 5000000000000000000) } }
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

def s084_t6_sb015_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((29609609161 : ℚ) / 500000000000)
      ((-410814633 : ℚ) / 1000000000000)
      ((2287197939 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((14226339539118373 : ℚ) / 5000000000000000000)
              hi := ((2433228041271 : ℚ) / 312500000000000) }
      im := { lo := ((-1607111692472711 : ℚ) / 25000000000000000)
              hi := ((-5939562668687877 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((8456377956587297 : ℚ) / 1000000000000000000)
              hi := ((498261477070979 : ℚ) / 50000000000000000) }
      im := { lo := ((-819321759851969 : ℚ) / 100000000000000000)
              hi := ((-6689841809265781 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2651735915006911 : ℚ) / 2500000000000000000)
              hi := ((-766639354171077 : ℚ) / 2500000000000000000) }
      im := { lo := ((22164903235533827 : ℚ) / 10000000000000000000)
              hi := ((74273035545333 : ℚ) / 25000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-876218736306199 : ℚ) / 1000000000000000000)
              hi := ((1729223162251519 : ℚ) / 2500000000000000000) }
      im := { lo := ((-17871930614366433 : ℚ) / 50000000000000000000)
              hi := ((11606920980687693 : ℚ) / 10000000000000000000) } }
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

def s084_t6_sb016_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((29609609161 : ℚ) / 500000000000)
      ((-410814633 : ℚ) / 1000000000000)
      ((2287197939 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((2855518602842747 : ℚ) / 1000000000000000000)
              hi := ((7796474992619227 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6426839161769221 : ℚ) / 100000000000000000)
              hi := ((-5937970003832349 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((8446411524384259 : ℚ) / 1000000000000000000)
              hi := ((995500928891189 : ℚ) / 100000000000000000) }
      im := { lo := ((-8205492691210493 : ℚ) / 1000000000000000000)
              hi := ((-1675597166574033 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2113998730747807 : ℚ) / 2000000000000000000)
              hi := ((-1212007816977197 : ℚ) / 4000000000000000000) }
      im := { lo := ((4434973245369957 : ℚ) / 2000000000000000000)
              hi := ((37148479562413 : ℚ) / 12500000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4380485913803919 : ℚ) / 5000000000000000000)
              hi := ((1383599724634129 : ℚ) / 2000000000000000000) }
      im := { lo := ((-7148209472119569 : ℚ) / 20000000000000000000)
              hi := ((5803356203732603 : ℚ) / 5000000000000000000) } }
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

def s084_t6_sb017_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((29609609161 : ℚ) / 500000000000)
      ((-410814633 : ℚ) / 1000000000000)
      ((2287197939 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((2865790340196707 : ℚ) / 1000000000000000000)
              hi := ((31226557450229 : ℚ) / 4000000000000000) }
      im := { lo := ((-6425232932088963 : ℚ) / 100000000000000000)
              hi := ((-11872757898599 : ℚ) / 200000000000000) } }
  D0Rect :=
    { re := { lo := ((421821440544169 : ℚ) / 50000000000000000)
              hi := ((994477186950361 : ℚ) / 100000000000000000) }
      im := { lo := ((-8217753617190507 : ℚ) / 1000000000000000000)
              hi := ((-6714922300524807 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2106605442320943 : ℚ) / 2000000000000000000)
              hi := ((-14967351355086423 : ℚ) / 50000000000000000000) }
      im := { lo := ((110923898448903 : ℚ) / 50000000000000000)
              hi := ((29728298593044043 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4379877208018681 : ℚ) / 5000000000000000000)
              hi := ((3459550980597133 : ℚ) / 5000000000000000000) }
      im := { lo := ((-893454814710671 : ℚ) / 2500000000000000000)
              hi := ((2321299974416643 : ℚ) / 2000000000000000000) } }
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

def s084_t6_sb018_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((29609609161 : ℚ) / 500000000000)
      ((-410814633 : ℚ) / 1000000000000)
      ((2287197939 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((14380409691036953 : ℚ) / 5000000000000000000)
              hi := ((1563364831339623 : ℚ) / 200000000000000000) }
      im := { lo := ((-3211814094217739 : ℚ) / 50000000000000000)
              hi := ((-1186957878273361 : ℚ) / 20000000000000000) } }
  D0Rect :=
    { re := { lo := ((8426429543909021 : ℚ) / 1000000000000000000)
              hi := ((4967258790691329 : ℚ) / 500000000000000000) }
      im := { lo := ((-164600007802067 : ℚ) / 20000000000000000)
              hi := ((-3363721336779607 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-10496045067770621 : ℚ) / 10000000000000000000)
              hi := ((-46201702618933 : ℚ) / 156250000000000000) }
      im := { lo := ((4438928548943323 : ℚ) / 2000000000000000000)
              hi := ((2973775990986391 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4379270434572363 : ℚ) / 5000000000000000000)
              hi := ((3460104197818871 : ℚ) / 5000000000000000000) }
      im := { lo := ((-35735351915478733 : ℚ) / 100000000000000000000)
              hi := ((5803144435150597 : ℚ) / 5000000000000000000) } }
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

def s084_t6_sb019_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((29609609161 : ℚ) / 500000000000)
      ((-410814633 : ℚ) / 1000000000000)
      ((2287197939 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((14431966961871163 : ℚ) / 5000000000000000000)
              hi := ((3913514662204161 : ℚ) / 500000000000000000) }
      im := { lo := ((-1605506260098591 : ℚ) / 25000000000000000)
              hi := ((-5933201200810281 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((8416413297124453 : ℚ) / 1000000000000000000)
              hi := ((2481061730037547 : ℚ) / 250000000000000000) }
      im := { lo := ((-412111654375761 : ℚ) / 50000000000000000)
              hi := ((-673994963793561 : ℚ) / 100000000000000000) } }
  DrestRect :=
    { re := { lo := ((-5229524324989733 : ℚ) / 5000000000000000000)
              hi := ((-1460167221624187 : ℚ) / 5000000000000000000) }
      im := { lo := ((22204453810601033 : ℚ) / 10000000000000000000)
              hi := ((14873584569979471 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8757325636243431 : ℚ) / 10000000000000000000)
              hi := ((3460656188675121 : ℚ) / 5000000000000000000) }
      im := { lo := ((-17866302361822117 : ℚ) / 50000000000000000000)
              hi := ((232121746502539 : ℚ) / 200000000000000000) } }
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

def s084_t6_sb020_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((29609609161 : ℚ) / 500000000000)
      ((-410814633 : ℚ) / 1000000000000)
      ((2287197939 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((14483628763351179 : ℚ) / 5000000000000000000)
              hi := ((7837253811123997 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3210211677890653 : ℚ) / 50000000000000000)
              hi := ((-11863229039579043 : ℚ) / 200000000000000000) } }
  D0Rect :=
    { re := { lo := ((4203190408430483 : ℚ) / 500000000000000000)
              hi := ((4956979573961541 : ℚ) / 500000000000000000) }
      im := { lo := ((-515903239950777 : ℚ) / 62500000000000000)
              hi := ((-6752443044997579 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1042203679643309 : ℚ) / 1000000000000000000)
              hi := ((-2883747919341349 : ℚ) / 10000000000000000000) }
      im := { lo := ((555355367439243 : ℚ) / 250000000000000000)
              hi := ((5951304888489507 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8756107968136983 : ℚ) / 10000000000000000000)
              hi := ((346120657886653 : ℚ) / 500000000000000000) }
      im := { lo := ((-8932468202814399 : ℚ) / 25000000000000000000)
              hi := ((2901471855572963 : ℚ) / 2500000000000000000) } }
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

def s084_t6_sb021_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((29609609161 : ℚ) / 500000000000)
      ((-410814633 : ℚ) / 1000000000000)
      ((2287197939 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((14535383754474597 : ℚ) / 5000000000000000000)
              hi := ((7847499823504033 : ℚ) / 1000000000000000000) }
      im := { lo := ((-160470587759089 : ℚ) / 2500000000000000)
              hi := ((-148250725285397 : ℚ) / 2500000000000000) } }
  D0Rect :=
    { re := { lo := ((8396331075844301 : ℚ) / 1000000000000000000)
              hi := ((2475913834079281 : ℚ) / 250000000000000000) }
      im := { lo := ((-4133328924210709 : ℚ) / 500000000000000000)
              hi := ((-16912304059382489 : ℚ) / 2500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2077003078359787 : ℚ) / 2000000000000000000)
              hi := ((-71178592517809 : ℚ) / 250000000000000000) }
      im := { lo := ((4444783943332353 : ℚ) / 2000000000000000000)
              hi := ((1488291571772019 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8754889408382347 : ℚ) / 10000000000000000000)
              hi := ((6923512282829057 : ℚ) / 10000000000000000000) }
      im := { lo := ((-357272930305317 : ℚ) / 1000000000000000000)
              hi := ((290142571689681 : ℚ) / 250000000000000000) } }
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

def s084_t6_sb022_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((29609609161 : ℚ) / 500000000000)
      ((-410814633 : ℚ) / 1000000000000)
      ((2287197939 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((2917448163945771 : ℚ) / 1000000000000000000)
              hi := ((15347198474877 : ℚ) / 1953125000000000) }
      im := { lo := ((-1604306285203311 : ℚ) / 25000000000000000)
              hi := ((-370527812652501 : ℚ) / 6250000000000000) } }
  D0Rect :=
    { re := { lo := ((4193132401411179 : ℚ) / 500000000000000000)
              hi := ((2473333698203883 : ℚ) / 250000000000000000) }
      im := { lo := ((-8278850498250593 : ℚ) / 1000000000000000000)
              hi := ((-6777385958070747 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-5173990630921851 : ℚ) / 5000000000000000000)
              hi := ((-28105250914502557 : ℚ) / 100000000000000000000) }
      im := { lo := ((22233572178687613 : ℚ) / 10000000000000000000)
              hi := ((238200694312873 : ℚ) / 80000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8753669327250543 : ℚ) / 10000000000000000000)
              hi := ((6924609120404271 : ℚ) / 10000000000000000000) }
      im := { lo := ((-35724688632186543 : ℚ) / 100000000000000000000)
              hi := ((11605515962848183 : ℚ) / 10000000000000000000) } }
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

def s084_t6_sb023_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((29609609161 : ℚ) / 500000000000)
      ((-410814633 : ℚ) / 1000000000000)
      ((2287197939 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((5855681479679387 : ℚ) / 2000000000000000000)
              hi := ((1573610073642161 : ℚ) / 200000000000000000) }
      im := { lo := ((-3207814106111459 : ℚ) / 50000000000000000)
              hi := ((-5926862551418479 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((8376182400042127 : ℚ) / 1000000000000000000)
              hi := ((2470749291368363 : ℚ) / 250000000000000000) }
      im := { lo := ((-4145514515574899 : ℚ) / 500000000000000000)
              hi := ((-3394918380634191 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1031093157839163 : ℚ) / 1000000000000000000)
              hi := ((-346736886290539 : ℚ) / 1250000000000000000) }
      im := { lo := ((22243174729016787 : ℚ) / 10000000000000000000)
              hi := ((29784287837796093 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1094055702494127 : ℚ) / 1250000000000000000)
              hi := ((6925701569030073 : ℚ) / 10000000000000000000) }
      im := { lo := ((-17861043027224497 : ℚ) / 50000000000000000000)
              hi := ((1450666170550919 : ℚ) / 1250000000000000000) } }
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

def s084_t6_sb024_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((29609609161 : ℚ) / 500000000000)
      ((-410814633 : ℚ) / 1000000000000)
      ((2287197939 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((2938254661998281 : ℚ) / 1000000000000000000)
              hi := ((7878353875631983 : ℚ) / 1000000000000000000) }
      im := { lo := ((-641403264471411 : ℚ) / 10000000000000000)
              hi := ((-5925281736937489 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((8366083496691887 : ℚ) / 1000000000000000000)
              hi := ((493632141835739 : ℚ) / 50000000000000000) }
      im := { lo := ((-518949588894459 : ℚ) / 62500000000000000)
              hi := ((-13604548016041643 : ℚ) / 2000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1027386720161237 : ℚ) / 1000000000000000000)
              hi := ((-684313236089177 : ℚ) / 2500000000000000000) }
      im := { lo := ((2225272624722413 : ℚ) / 1000000000000000000)
              hi := ((5958687123863101 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8751216730557491 : ℚ) / 10000000000000000000)
              hi := ((3463394037026167 : ℚ) / 5000000000000000000) }
      im := { lo := ((-3571942750359219 : ℚ) / 10000000000000000000)
              hi := ((580256864516971 : ℚ) / 500000000000000000) } }
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

def s084_t6_sb025_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((29609609161 : ℚ) / 500000000000)
      ((-410814633 : ℚ) / 1000000000000)
      ((2287197939 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((5897379209643617 : ℚ) / 2000000000000000000)
              hi := ((3944338216666821 : ℚ) / 500000000000000000) }
      im := { lo := ((-3206219295939941 : ℚ) / 50000000000000000)
              hi := ((-11847404829794679 : ℚ) / 200000000000000000) } }
  D0Rect :=
    { re := { lo := ((8355968352617163 : ℚ) / 1000000000000000000)
              hi := ((9862271599192623 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1663068763331849 : ℚ) / 200000000000000000)
              hi := ((-34073487577965813 : ℚ) / 5000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-511839409165691 : ℚ) / 500000000000000000)
              hi := ((-5401197534150731 : ℚ) / 20000000000000000000) }
      im := { lo := ((1391389190597911 : ℚ) / 625000000000000000)
              hi := ((372531622646353 : ℚ) / 125000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-273436954785269 : ℚ) / 312500000000000000)
              hi := ((6927868530027767 : ℚ) / 10000000000000000000) }
      im := { lo := ((-3571680972300503 : ℚ) / 10000000000000000000)
              hi := ((362654669349071 : ℚ) / 312500000000000000) } }
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

def s084_t6_sb026_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((29609609161 : ℚ) / 500000000000)
      ((-410814633 : ℚ) / 1000000000000)
      ((2287197939 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((29591451230405797 : ℚ) / 10000000000000000000)
              hi := ((1974754612187221 : ℚ) / 250000000000000000) }
      im := { lo := ((-801355774322661 : ℚ) / 12500000000000000)
              hi := ((-1184424887934883 : ℚ) / 20000000000000000) } }
  D0Rect :=
    { re := { lo := ((260807408187601 : ℚ) / 31250000000000000)
              hi := ((9851883406671619 : ℚ) / 1000000000000000000) }
      im := { lo := ((-4163740282293193 : ℚ) / 500000000000000000)
              hi := ((-6827106888584849 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-407987821036653 : ℚ) / 400000000000000000)
              hi := ((-1331965861284899 : ℚ) / 5000000000000000000) }
      im := { lo := ((1391979782976509 : ℚ) / 625000000000000000)
              hi := ((7452892749637731 : ℚ) / 2500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1093592866093787 : ℚ) / 1250000000000000000)
              hi := ((692894277920497 : ℚ) / 1000000000000000000) }
      im := { lo := ((-35714309934429807 : ℚ) / 100000000000000000000)
              hi := ((290119336708549 : ℚ) / 250000000000000000) } }
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

def s084_t6_sb027_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((29609609161 : ℚ) / 500000000000)
      ((-410814633 : ℚ) / 1000000000000)
      ((2287197939 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((29696220160343807 : ℚ) / 10000000000000000000)
              hi := ((1581875822237333 : ℚ) / 200000000000000000) }
      im := { lo := ((-6409255164269609 : ℚ) / 100000000000000000)
              hi := ((-5920548115378789 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((1041961185832893 : ℚ) / 125000000000000000)
              hi := ((2460369606399971 : ℚ) / 250000000000000000) }
      im := { lo := ((-1042450378981907 : ℚ) / 125000000000000000)
              hi := ((-6839502699611599 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-508129395096697 : ℚ) / 500000000000000000)
              hi := ((-2627253291853633 : ℚ) / 10000000000000000000) }
      im := { lo := ((22281075496285883 : ℚ) / 10000000000000000000)
              hi := ((3727569785479083 : ℚ) / 1250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-546718660683803 : ℚ) / 625000000000000000)
              hi := ((6930011535415699 : ℚ) / 10000000000000000000) }
      im := { lo := ((-1785587878264013 : ℚ) / 5000000000000000000)
              hi := ((580229619378433 : ℚ) / 500000000000000000) } }
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

def s084_t6_sb028_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((29609609161 : ℚ) / 500000000000)
      ((-410814633 : ℚ) / 1000000000000)
      ((2287197939 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((2980119073694249 : ℚ) / 1000000000000000000)
              hi := ((3959879790694157 : ℚ) / 500000000000000000) }
      im := { lo := ((-6407665569678359 : ℚ) / 100000000000000000)
              hi := ((-2959486686336609 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((8325525034585233 : ℚ) / 1000000000000000000)
              hi := ((1966211455672897 : ℚ) / 200000000000000000) }
      im := { lo := ((-1670342325243401 : ℚ) / 200000000000000000)
              hi := ((-856485565022927 : ℚ) / 125000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2531366965158977 : ℚ) / 2500000000000000000)
              hi := ((-5181122054664347 : ℚ) / 20000000000000000000) }
      im := { lo := ((445808426339387 : ℚ) / 200000000000000000)
              hi := ((29829494302523883 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2186563263299211 : ℚ) / 2500000000000000000)
              hi := ((6931078374576349 : ℚ) / 10000000000000000000) }
      im := { lo := ((-3570914830712171 : ℚ) / 10000000000000000000)
              hi := ((72527535907413 : ℚ) / 62500000000000000) } }
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

def s084_t6_sb029_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((29609609161 : ℚ) / 500000000000)
      ((-410814633 : ℚ) / 1000000000000)
      ((2287197939 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((373829618511183 : ℚ) / 125000000000000000)
              hi := ((1982539801741449 : ℚ) / 250000000000000000) }
      im := { lo := ((-3203038701839553 : ℚ) / 50000000000000000)
              hi := ((-1479350055242621 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((8315344023580667 : ℚ) / 1000000000000000000)
              hi := ((9820619690105793 : ℚ) / 1000000000000000000) }
      im := { lo := ((-2090951486537619 : ℚ) / 250000000000000000)
              hi := ((-6864252693462607 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-10088333787143559 : ℚ) / 10000000000000000000)
              hi := ((-25538567198221413 : ℚ) / 100000000000000000000) }
      im := { lo := ((2229971560815603 : ℚ) / 1000000000000000000)
              hi := ((2983837738037727 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-874500363209509 : ℚ) / 1000000000000000000)
              hi := ((3466070276211109 : ℚ) / 5000000000000000000) }
      im := { lo := ((-2231657121103319 : ℚ) / 6250000000000000000)
              hi := ((5802108358914197 : ℚ) / 5000000000000000000) } }
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

def s084_t6_sb030_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((29609609161 : ℚ) / 500000000000)
      ((-410814633 : ℚ) / 1000000000000)
      ((2287197939 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((30011743140149383 : ℚ) / 10000000000000000000)
              hi := ((3970289606641437 : ℚ) / 500000000000000000) }
      im := { lo := ((-160112269896971 : ℚ) / 2500000000000000)
              hi := ((-14789571364756499 : ℚ) / 250000000000000000) } }
  D0Rect :=
    { re := { lo := ((1661029230130199 : ℚ) / 200000000000000000)
              hi := ((9810166016981519 : ℚ) / 1000000000000000000) }
      im := { lo := ((-4187943021753001 : ℚ) / 500000000000000000)
              hi := ((-6876607121941249 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-10051186688703549 : ℚ) / 10000000000000000000)
              hi := ((-157321221194851 : ℚ) / 625000000000000000) }
      im := { lo := ((11154478627050763 : ℚ) / 5000000000000000000)
              hi := ((14923604307307513 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2185938771752177 : ℚ) / 2500000000000000000)
              hi := ((1733300713200453 : ℚ) / 2500000000000000000) }
      im := { lo := ((-35703908211194563 : ℚ) / 100000000000000000000)
              hi := ((1450503836034341 : ℚ) / 1250000000000000000) } }
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

def s084_t6_sb031_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((29609609161 : ℚ) / 500000000000)
      ((-410814633 : ℚ) / 1000000000000)
      ((2287197939 : ℚ) / 500000000000) where
  MRect :=
    { re := { lo := ((30117316662385397 : ℚ) / 10000000000000000000)
              hi := ((7951019176873441 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1600726411388851 : ℚ) / 25000000000000000)
              hi := ((-295712922066467 : ℚ) / 5000000000000000) } }
  D0Rect :=
    { re := { lo := ((20737330406493 : ℚ) / 2500000000000000)
              hi := ((489984776424881 : ℚ) / 50000000000000000) }
      im := { lo := ((-838795234570847 : ℚ) / 100000000000000000)
              hi := ((-551115787980977 : ℚ) / 80000000000000000) } }
  DrestRect :=
    { re := { lo := ((-125175328703973 : ℚ) / 125000000000000000)
              hi := ((-24804098409220393 : ℚ) / 100000000000000000000) }
      im := { lo := ((2231814741173909 : ℚ) / 1000000000000000000)
              hi := ((2985598681089501 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4371254932419781 : ℚ) / 5000000000000000000)
              hi := ((6934267718535023 : ℚ) / 10000000000000000000) }
      im := { lo := ((-8925313111075281 : ℚ) / 25000000000000000000)
              hi := ((5801919891645327 : ℚ) / 5000000000000000000) } }
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
    (hi : i ∈ positiveBoxSubboxesOf .s084_t6) :
    ProjectedJ0SubboxRectangleCertificateData
      ((positiveBoxCombinedCert .s084_t6).constants.mainLower)
      ((positiveBoxCombinedCert .s084_t6).constants.d0NegReUpper)
      ((positiveBoxCombinedCert .s084_t6).constants.restUpper) := by
  if h0 : i = .s084_t6_sb000 then
    exact s084_t6_sb000_certificateData
  else if h1 : i = .s084_t6_sb001 then
    exact s084_t6_sb001_certificateData
  else if h2 : i = .s084_t6_sb002 then
    exact s084_t6_sb002_certificateData
  else if h3 : i = .s084_t6_sb003 then
    exact s084_t6_sb003_certificateData
  else if h4 : i = .s084_t6_sb004 then
    exact s084_t6_sb004_certificateData
  else if h5 : i = .s084_t6_sb005 then
    exact s084_t6_sb005_certificateData
  else if h6 : i = .s084_t6_sb006 then
    exact s084_t6_sb006_certificateData
  else if h7 : i = .s084_t6_sb007 then
    exact s084_t6_sb007_certificateData
  else if h8 : i = .s084_t6_sb008 then
    exact s084_t6_sb008_certificateData
  else if h9 : i = .s084_t6_sb009 then
    exact s084_t6_sb009_certificateData
  else if h10 : i = .s084_t6_sb010 then
    exact s084_t6_sb010_certificateData
  else if h11 : i = .s084_t6_sb011 then
    exact s084_t6_sb011_certificateData
  else if h12 : i = .s084_t6_sb012 then
    exact s084_t6_sb012_certificateData
  else if h13 : i = .s084_t6_sb013 then
    exact s084_t6_sb013_certificateData
  else if h14 : i = .s084_t6_sb014 then
    exact s084_t6_sb014_certificateData
  else if h15 : i = .s084_t6_sb015 then
    exact s084_t6_sb015_certificateData
  else if h16 : i = .s084_t6_sb016 then
    exact s084_t6_sb016_certificateData
  else if h17 : i = .s084_t6_sb017 then
    exact s084_t6_sb017_certificateData
  else if h18 : i = .s084_t6_sb018 then
    exact s084_t6_sb018_certificateData
  else if h19 : i = .s084_t6_sb019 then
    exact s084_t6_sb019_certificateData
  else if h20 : i = .s084_t6_sb020 then
    exact s084_t6_sb020_certificateData
  else if h21 : i = .s084_t6_sb021 then
    exact s084_t6_sb021_certificateData
  else if h22 : i = .s084_t6_sb022 then
    exact s084_t6_sb022_certificateData
  else if h23 : i = .s084_t6_sb023 then
    exact s084_t6_sb023_certificateData
  else if h24 : i = .s084_t6_sb024 then
    exact s084_t6_sb024_certificateData
  else if h25 : i = .s084_t6_sb025 then
    exact s084_t6_sb025_certificateData
  else if h26 : i = .s084_t6_sb026 then
    exact s084_t6_sb026_certificateData
  else if h27 : i = .s084_t6_sb027 then
    exact s084_t6_sb027_certificateData
  else if h28 : i = .s084_t6_sb028 then
    exact s084_t6_sb028_certificateData
  else if h29 : i = .s084_t6_sb029 then
    exact s084_t6_sb029_certificateData
  else if h30 : i = .s084_t6_sb030 then
    exact s084_t6_sb030_certificateData
  else if h31 : i = .s084_t6_sb031 then
    exact s084_t6_sb031_certificateData
  else
    simp [positiveBoxSubboxesOf, h0, h1, h2, h3, h4, h5, h6, h7, h8, h9, h10, h11, h12, h13, h14, h15, h16, h17, h18, h19, h20, h21, h22, h23, h24, h25, h26, h27, h28, h29, h30, h31] at hi

end S084T6
end ProjectedJ0PositiveBoxRectangleData
end ProjectedJ0PositiveBoxSkeleton
end C2
