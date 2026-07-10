import LeanC2.AuditProjectedJ0PositiveBoxRectangleCertificateSchema
import LeanC2.AuditProjectedJ0PositiveBoxAllSubboxSkeleton
import LeanC2.AuditAdjustedQuartetProjectedJ0PositiveBoxSectorRationalizedData

set_option linter.style.longLine false

/-!
# Generated rectangle data for s0.85_t0

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
namespace S085T0

open ProjectedJ0RectangleArithmetic

def s085_t0_sb000_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((3196303723 : ℚ) / 50000000000)
      ((-202255911 : ℚ) / 1000000000000)
      ((855071817 : ℚ) / 200000000000) where
  MRect :=
    { re := { lo := ((25520001432362857 : ℚ) / 10000000000000000000)
              hi := ((7160133825562053 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6896723259954067 : ℚ) / 100000000000000000)
              hi := ((-64398522678289 : ℚ) / 1000000000000000) } }
  D0Rect :=
    { re := { lo := ((233098509666283 : ℚ) / 25000000000000000)
              hi := ((2153993195792337 : ℚ) / 200000000000000000) }
      im := { lo := ((-84378956585931 : ℚ) / 20000000000000000)
              hi := ((-2771200435894649 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-8679131966077867 : ℚ) / 5000000000000000000)
              hi := ((-10401885951971733 : ℚ) / 10000000000000000000) }
      im := { lo := ((8004552886708463 : ℚ) / 5000000000000000000)
              hi := ((2870600430162627 : ℚ) / 1250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-171171296880837 : ℚ) / 200000000000000000)
              hi := ((3051540330767683 : ℚ) / 5000000000000000000) }
      im := { lo := ((-322645400653011 : ℚ) / 1000000000000000000)
              hi := ((2759488509495313 : ℚ) / 2500000000000000000) } }
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

def s085_t0_sb001_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((3196303723 : ℚ) / 50000000000)
      ((-202255911 : ℚ) / 1000000000000)
      ((855071817 : ℚ) / 200000000000) where
  MRect :=
    { re := { lo := ((25560293073287233 : ℚ) / 10000000000000000000)
              hi := ((179103454441307 : ℚ) / 25000000000000000) }
      im := { lo := ((-689499540723873 : ℚ) / 10000000000000000)
              hi := ((-6438133283985653 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((1164909939079467 : ℚ) / 125000000000000000)
              hi := ((2153019310917979 : ℚ) / 200000000000000000) }
      im := { lo := ((-4232386037161087 : ℚ) / 1000000000000000000)
              hi := ((-13924388499782841 : ℚ) / 5000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-3466115641762517 : ℚ) / 2000000000000000000)
              hi := ((-1296798014397189 : ℚ) / 1250000000000000000) }
      im := { lo := ((1001807356484447 : ℚ) / 625000000000000000)
              hi := ((11492221068287651 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8557386073103129 : ℚ) / 10000000000000000000)
              hi := ((6104430727748223 : ℚ) / 10000000000000000000) }
      im := { lo := ((-3226208249182393 : ℚ) / 10000000000000000000)
              hi := ((5518932655282139 : ℚ) / 5000000000000000000) } }
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

def s085_t0_sb002_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((3196303723 : ℚ) / 50000000000)
      ((-202255911 : ℚ) / 1000000000000)
      ((855071817 : ℚ) / 200000000000) where
  MRect :=
    { re := { lo := ((6400198591454961 : ℚ) / 2500000000000000000)
              hi := ((3584081631112219 : ℚ) / 500000000000000000) }
      im := { lo := ((-6893268373365967 : ℚ) / 100000000000000000)
              hi := ((-6436415067946477 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((931460081147409 : ℚ) / 100000000000000000)
              hi := ((2690052089308411 : ℚ) / 250000000000000000) }
      im := { lo := ((-4245817455234197 : ℚ) / 1000000000000000000)
              hi := ((-5597097526877719 : ℚ) / 2000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-17302862469591093 : ℚ) / 10000000000000000000)
              hi := ((-5173428146887471 : ℚ) / 5000000000000000000) }
      im := { lo := ((1604869264608029 : ℚ) / 1000000000000000000)
              hi := ((5751009933422439 : ℚ) / 2500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1711241812078801 : ℚ) / 2000000000000000000)
              hi := ((1526445418192387 : ℚ) / 2500000000000000000) }
      im := { lo := ((-16129833568682503 : ℚ) / 50000000000000000000)
              hi := ((5518890276286517 : ℚ) / 5000000000000000000) } }
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

def s085_t0_sb003_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((3196303723 : ℚ) / 50000000000)
      ((-202255911 : ℚ) / 1000000000000)
      ((855071817 : ℚ) / 200000000000) where
  MRect :=
    { re := { lo := ((1282074959150039 : ℚ) / 500000000000000000)
              hi := ((14344419319047919 : ℚ) / 2000000000000000000) }
      im := { lo := ((-1378308427624271 : ℚ) / 20000000000000000)
              hi := ((-643469764708877 : ℚ) / 10000000000000000) } }
  D0Rect :=
    { re := { lo := ((1861980841338523 : ℚ) / 200000000000000000)
              hi := ((5377650749988541 : ℚ) / 500000000000000000) }
      im := { lo := ((-851848575489081 : ℚ) / 200000000000000000)
              hi := ((-28122127804375637 : ℚ) / 10000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-17275119139804013 : ℚ) / 10000000000000000000)
              hi := ((-10319300210251073 : ℚ) / 10000000000000000000) }
      im := { lo := ((16068428529436793 : ℚ) / 10000000000000000000)
              hi := ((11511799121984327 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4277518777966803 : ℚ) / 5000000000000000000)
              hi := ((6107137247387019 : ℚ) / 10000000000000000000) }
      im := { lo := ((-32257218828427747 : ℚ) / 100000000000000000000)
              hi := ((5518846124574913 : ℚ) / 5000000000000000000) } }
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

def s085_t0_sb004_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((3196303723 : ℚ) / 50000000000)
      ((-202255911 : ℚ) / 1000000000000)
      ((855071817 : ℚ) / 200000000000) where
  MRect :=
    { re := { lo := ((1284120690365523 : ℚ) / 500000000000000000)
              hi := ((1794069189964717 : ℚ) / 250000000000000000) }
      im := { lo := ((-6889816624100777 : ℚ) / 100000000000000000)
              hi := ((-1608245274959217 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((4652594763565253 : ℚ) / 500000000000000000)
              hi := ((2687594037560063 : ℚ) / 250000000000000000) }
      im := { lo := ((-213633075654689 : ℚ) / 50000000000000000)
              hi := ((-14129352464258417 : ℚ) / 5000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-215591832777809 : ℚ) / 125000000000000000)
              hi := ((-10291717532627041 : ℚ) / 10000000000000000000) }
      im := { lo := ((160881265361691 : ℚ) / 100000000000000000)
              hi := ((2304311637927723 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1710773702764703 : ℚ) / 2000000000000000000)
              hi := ((1221698881157127 : ℚ) / 2000000000000000000) }
      im := { lo := ((-6450946599467121 : ℚ) / 20000000000000000000)
              hi := ((88300799540757 : ℚ) / 80000000000000000) } }
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

def s085_t0_sb005_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((3196303723 : ℚ) / 50000000000)
      ((-202255911 : ℚ) / 1000000000000)
      ((855071817 : ℚ) / 200000000000) where
  MRect :=
    { re := { lo := ((1286176835509297 : ℚ) / 500000000000000000)
              hi := ((7180364713551689 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6888091848471543 : ℚ) / 100000000000000000)
              hi := ((-643126541707317 : ℚ) / 10000000000000000) } }
  D0Rect :=
    { re := { lo := ((4650228270831333 : ℚ) / 500000000000000000)
              hi := ((2149086514717203 : ℚ) / 200000000000000000) }
      im := { lo := ((-4286073050701161 : ℚ) / 1000000000000000000)
              hi := ((-2839522161862553 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-4304886195403759 : ℚ) / 2500000000000000000)
              hi := ((-1026410853856619 : ℚ) / 1000000000000000000) }
      im := { lo := ((16107786613649081 : ℚ) / 10000000000000000000)
              hi := ((2306259413335393 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4276350845740949 : ℚ) / 5000000000000000000)
              hi := ((3054926452223661 : ℚ) / 5000000000000000000) }
      im := { lo := ((-8063057222030191 : ℚ) / 25000000000000000000)
              hi := ((1379688195018669 : ℚ) / 1250000000000000000) } }
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

def s085_t0_sb006_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((3196303723 : ℚ) / 50000000000)
      ((-202255911 : ℚ) / 1000000000000)
      ((855071817 : ℚ) / 200000000000) where
  MRect :=
    { re := { lo := ((1288243819024043 : ℚ) / 500000000000000000)
              hi := ((1796118163341173 : ℚ) / 250000000000000000) }
      im := { lo := ((-860795969657991 : ℚ) / 12500000000000000)
              hi := ((-803693831937189 : ℚ) / 12500000000000000) } }
  D0Rect :=
    { re := { lo := ((9295705234704401 : ℚ) / 1000000000000000000)
              hi := ((10740470796807799 : ℚ) / 1000000000000000000) }
      im := { lo := ((-2149738849948011 : ℚ) / 500000000000000000)
              hi := ((-7132918814184607 : ℚ) / 2500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-17191714331006237 : ℚ) / 10000000000000000000)
              hi := ((-204729452339943 : ℚ) / 200000000000000000) }
      im := { lo := ((403185203594471 : ℚ) / 250000000000000000)
              hi := ((5770508007857931 : ℚ) / 2500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8551531690628963 : ℚ) / 10000000000000000000)
              hi := ((6111207346503119 : ℚ) / 10000000000000000000) }
      im := { lo := ((-2015604529508589 : ℚ) / 6250000000000000000)
              hi := ((5518702849491089 : ℚ) / 5000000000000000000) } }
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

def s085_t0_sb007_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((3196303723 : ℚ) / 50000000000)
      ((-202255911 : ℚ) / 1000000000000)
      ((855071817 : ℚ) / 200000000000) where
  MRect :=
    { re := { lo := ((1290321375710823 : ℚ) / 500000000000000000)
              hi := ((7188601046681737 : ℚ) / 1000000000000000000) }
      im := { lo := ((-275385776149927 : ℚ) / 4000000000000000)
              hi := ((-321391838361597 : ℚ) / 5000000000000000) } }
  D0Rect :=
    { re := { lo := ((9290936067892087 : ℚ) / 1000000000000000000)
              hi := ((10735490368252039 : ℚ) / 1000000000000000000) }
      im := { lo := ((-4312875345173101 : ℚ) / 1000000000000000000)
              hi := ((-1433403329583161 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-429096351601109 : ℚ) / 250000000000000000)
              hi := ((-2552202764830171 : ℚ) / 2500000000000000000) }
      im := { lo := ((16146992493483343 : ℚ) / 10000000000000000000)
              hi := ((462028572661231 : ℚ) / 200000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8550363538775137 : ℚ) / 10000000000000000000)
              hi := ((611256276329429 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3224709870497199 : ℚ) / 10000000000000000000)
              hi := ((11037303857157803 : ℚ) / 10000000000000000000) } }
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

def s085_t0_sb008_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((3196303723 : ℚ) / 50000000000)
      ((-202255911 : ℚ) / 1000000000000)
      ((855071817 : ℚ) / 200000000000) where
  MRect :=
    { re := { lo := ((2584819384991123 : ℚ) / 1000000000000000000)
              hi := ((7192749558483179 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6882921838182039 : ℚ) / 100000000000000000)
              hi := ((-6426123706065033 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((9286148693922957 : ℚ) / 1000000000000000000)
              hi := ((10730491674581797 : ℚ) / 1000000000000000000) }
      im := { lo := ((-865253278712413 : ℚ) / 200000000000000000)
              hi := ((-7201097759329889 : ℚ) / 2500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-8567982996434819 : ℚ) / 5000000000000000000)
              hi := ((-10181122006036663 : ℚ) / 10000000000000000000) }
      im := { lo := ((16166537728052753 : ℚ) / 10000000000000000000)
              hi := ((4624157163614957 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-854919121886389 : ℚ) / 1000000000000000000)
              hi := ((1528478283591367 : ℚ) / 2500000000000000000) }
      im := { lo := ((-806113133295583 : ℚ) / 2500000000000000000)
              hi := ((11037201809346697 : ℚ) / 10000000000000000000) } }
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

def s085_t0_sb009_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((3196303723 : ℚ) / 50000000000)
      ((-202255911 : ℚ) / 1000000000000)
      ((855071817 : ℚ) / 200000000000) where
  MRect :=
    { re := { lo := ((2589017028218197 : ℚ) / 1000000000000000000)
              hi := ((7196918676928027 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6881200070224827 : ℚ) / 100000000000000000)
              hi := ((-6424411468343989 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((9281342918284837 : ℚ) / 1000000000000000000)
              hi := ((10725474905576437 : ℚ) / 1000000000000000000) }
      im := { lo := ((-4339651051079703 : ℚ) / 1000000000000000000)
              hi := ((-1447032293995531 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-4277012802089703 : ℚ) / 2500000000000000000)
              hi := ((-2538351114052127 : ℚ) / 2500000000000000000) }
      im := { lo := ((16186042753255421 : ℚ) / 10000000000000000000)
              hi := ((2892513067884683 : ℚ) / 1250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4274008526128169 : ℚ) / 5000000000000000000)
              hi := ((611526078345981 : ℚ) / 1000000000000000000) }
      im := { lo := ((-403024146239811 : ℚ) / 1250000000000000000)
              hi := ((2207419498359937 : ℚ) / 2000000000000000000) } }
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

def s085_t0_sb010_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((3196303723 : ℚ) / 50000000000)
      ((-202255911 : ℚ) / 1000000000000)
      ((855071817 : ℚ) / 200000000000) where
  MRect :=
    { re := { lo := ((12966180905936641 : ℚ) / 5000000000000000000)
              hi := ((288044315397497 : ℚ) / 40000000000000000) }
      im := { lo := ((-3439739524975853 : ℚ) / 50000000000000000)
              hi := ((-6422700108800847 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((115956490698989 : ℚ) / 12500000000000000)
              hi := ((5360219786915233 : ℚ) / 500000000000000000) }
      im := { lo := ((-2176514552167989 : ℚ) / 500000000000000000)
              hi := ((-14538416494178051 : ℚ) / 5000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-427002703505569 : ℚ) / 250000000000000000)
              hi := ((-1012566007910589 : ℚ) / 1000000000000000000) }
      im := { lo := ((8102754653983381 : ℚ) / 5000000000000000000)
              hi := ((463187660890141 : ℚ) / 200000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2136710320638373 : ℚ) / 2500000000000000000)
              hi := ((6116605954361597 : ℚ) / 10000000000000000000) }
      im := { lo := ((-3223930549590767 : ℚ) / 10000000000000000000)
              hi := ((1103698967564893 : ℚ) / 1000000000000000000) } }
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

def s085_t0_sb011_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((3196303723 : ℚ) / 50000000000)
      ((-202255911 : ℚ) / 1000000000000)
      ((855071817 : ℚ) / 200000000000) where
  MRect :=
    { re := { lo := ((25974767338001387 : ℚ) / 10000000000000000000)
              hi := ((3602658643445441 : ℚ) / 500000000000000000) }
      im := { lo := ((-3438879395248997 : ℚ) / 50000000000000000)
              hi := ((-160524740445021 : ℚ) / 2500000000000000) } }
  D0Rect :=
    { re := { lo := ((9271677720625957 : ℚ) / 1000000000000000000)
              hi := ((1339423211108603 : ℚ) / 125000000000000000) }
      im := { lo := ((-2183200055047371 : ℚ) / 500000000000000000)
              hi := ((-730323906021391 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-17052135759128121 : ℚ) / 10000000000000000000)
              hi := ((-100978900330459 : ℚ) / 100000000000000000) }
      im := { lo := ((16224938265777399 : ℚ) / 10000000000000000000)
              hi := ((2317862036603703 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-854566480966321 : ℚ) / 1000000000000000000)
              hi := ((1529487386782711 : ℚ) / 2500000000000000000) }
      im := { lo := ((-1611833732255431 : ℚ) / 5000000000000000000)
              hi := ((5518440576652579 : ℚ) / 5000000000000000000) } }
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

def s085_t0_sb012_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((3196303723 : ℚ) / 50000000000)
      ((-202255911 : ℚ) / 1000000000000)
      ((855071817 : ℚ) / 200000000000) where
  MRect :=
    { re := { lo := ((1300869217309011 : ℚ) / 500000000000000000)
              hi := ((7209547067583461 : ℚ) / 1000000000000000000) }
      im := { lo := ((-687603940492413 : ℚ) / 10000000000000000)
              hi := ((-1604819971709459 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((1853363624092267 : ℚ) / 200000000000000000)
              hi := ((1071031345271513 : ℚ) / 100000000000000000) }
      im := { lo := ((-4379764069030847 : ℚ) / 1000000000000000000)
              hi := ((-366862688101087 : ℚ) / 125000000000000000) } }
  DrestRect :=
    { re := { lo := ((-17024134627315621 : ℚ) / 10000000000000000000)
              hi := ((-2014018772770099 : ℚ) / 2000000000000000000) }
      im := { lo := ((812216449640683 : ℚ) / 500000000000000000)
              hi := ((4639563407275461 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-341779426508249 : ℚ) / 400000000000000000)
              hi := ((6119289595127361 : ℚ) / 10000000000000000000) }
      im := { lo := ((-1611705641491277 : ℚ) / 5000000000000000000)
              hi := ((2207355858849857 : ℚ) / 2000000000000000000) } }
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

def s085_t0_sb013_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((3196303723 : ℚ) / 50000000000)
      ((-202255911 : ℚ) / 1000000000000)
      ((855071817 : ℚ) / 200000000000) where
  MRect :=
    { re := { lo := ((6515049607530287 : ℚ) / 2500000000000000000)
              hi := ((18034497085428179 : ℚ) / 2500000000000000000) }
      im := { lo := ((-6874320898956701 : ℚ) / 100000000000000000)
              hi := ((-256702836654713 : ℚ) / 4000000000000000) } }
  D0Rect :=
    { re := { lo := ((9261940687422457 : ℚ) / 1000000000000000000)
              hi := ((10705222650549387 : ℚ) / 1000000000000000000) }
      im := { lo := ((-549140178511319 : ℚ) / 125000000000000000)
              hi := ((-737125112883973 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-4249026383686661 : ℚ) / 2500000000000000000)
              hi := ((-1004227088194013 : ℚ) / 1000000000000000000) }
      im := { lo := ((8131840509198803 : ℚ) / 5000000000000000000)
              hi := ((464339469174349 : ℚ) / 200000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8543315830656237 : ℚ) / 10000000000000000000)
              hi := ((3060319038691467 : ℚ) / 5000000000000000000) }
      im := { lo := ((-805789114331397 : ℚ) / 2500000000000000000)
              hi := ((2207335710440619 : ℚ) / 2000000000000000000) } }
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

def s085_t0_sb014_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((3196303723 : ℚ) / 50000000000)
      ((-202255911 : ℚ) / 1000000000000)
      ((855071817 : ℚ) / 200000000000) where
  MRect :=
    { re := { lo := ((6525798346235773 : ℚ) / 2500000000000000000)
              hi := ((3609036976906129 : ℚ) / 500000000000000000) }
      im := { lo := ((-6872603288100419 : ℚ) / 100000000000000000)
              hi := ((-1283172538917731 : ℚ) / 20000000000000000) } }
  D0Rect :=
    { re := { lo := ((9257045367808199 : ℚ) / 1000000000000000000)
              hi := ((10700113369673829 : ℚ) / 1000000000000000000) }
      im := { lo := ((-550809114618889 : ℚ) / 125000000000000000)
              hi := ((-29620916872493967 : ℚ) / 10000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-8484025341091607 : ℚ) / 5000000000000000000)
              hi := ((-625901188941957 : ℚ) / 625000000000000000) }
      im := { lo := ((8141496242420953 : ℚ) / 5000000000000000000)
              hi := ((72612785737447 : ℚ) / 31250000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4271082512425291 : ℚ) / 5000000000000000000)
              hi := ((6122004719274617 : ℚ) / 10000000000000000000) }
      im := { lo := ((-402862070608573 : ℚ) / 1250000000000000000)
              hi := ((5518286253299433 : ℚ) / 5000000000000000000) } }
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

def s085_t0_sb015_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((3196303723 : ℚ) / 50000000000)
      ((-202255911 : ℚ) / 1000000000000)
      ((855071817 : ℚ) / 200000000000) where
  MRect :=
    { re := { lo := ((13073188205049177 : ℚ) / 5000000000000000000)
              hi := ((28212389889959 : ℚ) / 3906250000000000) }
      im := { lo := ((-6870886505045021 : ℚ) / 100000000000000000)
              hi := ((-6414155294790033 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((4626066140076139 : ℚ) / 500000000000000000)
              hi := ((10694985493000601 : ℚ) / 1000000000000000000) }
      im := { lo := ((-5524771946653 : ℚ) / 1250000000000000)
              hi := ((-2975676135920057 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-16939967361229219 : ℚ) / 10000000000000000000)
              hi := ((-4993270541789501 : ℚ) / 5000000000000000000) }
      im := { lo := ((16302265726787619 : ℚ) / 10000000000000000000)
              hi := ((11627584262238883 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8541031346059531 : ℚ) / 10000000000000000000)
              hi := ((6123387616131439 : ℚ) / 10000000000000000000) }
      im := { lo := ((-3222633042002579 : ℚ) / 10000000000000000000)
              hi := ((11036462594942499 : ℚ) / 10000000000000000000) } }
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

def s085_t0_sb016_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((3196303723 : ℚ) / 50000000000)
      ((-202255911 : ℚ) / 1000000000000)
      ((855071817 : ℚ) / 200000000000) where
  MRect :=
    { re := { lo := ((2618977154228291 : ℚ) / 1000000000000000000)
              hi := ((3613344998145873 : ℚ) / 500000000000000000) }
      im := { lo := ((-3434585217045471 : ℚ) / 50000000000000000)
              hi := ((-1603112209074931 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((2311800302000731 : ℚ) / 250000000000000000)
              hi := ((10689839267607143 : ℚ) / 1000000000000000000) }
      im := { lo := ((-8866309745895513 : ℚ) / 2000000000000000000)
              hi := ((-7473135571128001 : ℚ) / 2500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-4227963737925733 : ℚ) / 2500000000000000000)
              hi := ((-9958637812981337 : ℚ) / 10000000000000000000) }
      im := { lo := ((8160750550102997 : ℚ) / 5000000000000000000)
              hi := ((11637102156886337 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8539898830839321 : ℚ) / 10000000000000000000)
              hi := ((1224954160853959 : ℚ) / 2000000000000000000) }
      im := { lo := ((-3222364869031949 : ℚ) / 10000000000000000000)
              hi := ((2759086949493297 : ℚ) / 2500000000000000000) } }
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

def s085_t0_sb017_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((3196303723 : ℚ) / 50000000000)
      ((-202255911 : ℚ) / 1000000000000)
      ((855071817 : ℚ) / 200000000000) where
  MRect :=
    { re := { lo := ((655834326670699 : ℚ) / 250000000000000000)
              hi := ((7231029053990991 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3433727562181389 : ℚ) / 50000000000000000)
              hi := ((-256429730977481 : ℚ) / 4000000000000000) } }
  D0Rect :=
    { re := { lo := ((9242252019313769 : ℚ) / 1000000000000000000)
              hi := ((5342337414450283 : ℚ) / 500000000000000000) }
      im := { lo := ((-889297055005491 : ℚ) / 200000000000000000)
              hi := ((-600565101347129 : ℚ) / 200000000000000000) } }
  DrestRect :=
    { re := { lo := ((-16883714927213617 : ℚ) / 10000000000000000000)
              hi := ((-248267695461471 : ℚ) / 250000000000000000) }
      im := { lo := ((1634069725766269 : ℚ) / 1000000000000000000)
              hi := ((582330001453483 : ℚ) / 250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1067346183745839 : ℚ) / 1250000000000000000)
              hi := ((6126156276456011 : ℚ) / 10000000000000000000) }
      im := { lo := ((-3222091833699881 : ℚ) / 10000000000000000000)
              hi := ((551811395246109 : ℚ) / 500000000000000000) } }
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

def s085_t0_sb018_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((3196303723 : ℚ) / 50000000000)
      ((-202255911 : ℚ) / 1000000000000)
      ((855071817 : ℚ) / 200000000000) where
  MRect :=
    { re := { lo := ((13138594940336277 : ℚ) / 5000000000000000000)
              hi := ((1447077614764611 : ℚ) / 200000000000000000) }
      im := { lo := ((-6865740568407837 : ℚ) / 100000000000000000)
              hi := ((-6409038623104409 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((9237284613013977 : ℚ) / 1000000000000000000)
              hi := ((10679492321820623 : ℚ) / 1000000000000000000) }
      im := { lo := ((-2229904407404091 : ℚ) / 500000000000000000)
              hi := ((-1508194929721551 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1685554785632439 : ℚ) / 1000000000000000000)
              hi := ((-396110028157851 : ℚ) / 400000000000000000) }
      im := { lo := ((817992683306303 : ℚ) / 500000000000000000)
              hi := ((5828039056556541 : ℚ) / 2500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-853763613189297 : ℚ) / 1000000000000000000)
              hi := ((1225507380212307 : ℚ) / 2000000000000000000) }
      im := { lo := ((-16109073293547703 : ℚ) / 50000000000000000000)
              hi := ((551805181995959 : ℚ) / 500000000000000000) } }
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

def s085_t0_sb019_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((3196303723 : ℚ) / 50000000000)
      ((-202255911 : ℚ) / 1000000000000)
      ((855071817 : ℚ) / 200000000000) where
  MRect :=
    { re := { lo := ((26321222911243627 : ℚ) / 10000000000000000000)
              hi := ((3619883475588841 : ℚ) / 500000000000000000) }
      im := { lo := ((-1372805349082909 : ℚ) / 20000000000000000)
              hi := ((-3203667452802871 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((184645977502457 : ℚ) / 20000000000000000)
              hi := ((1334286480822403 : ℚ) / 125000000000000000) }
      im := { lo := ((-4473125105234223 : ℚ) / 1000000000000000000)
              hi := ((-3787434550691703 : ℚ) / 1250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-8413676507342939 : ℚ) / 5000000000000000000)
              hi := ((-2468691806443701 : ℚ) / 2500000000000000000) }
      im := { lo := ((16378970808044679 : ℚ) / 10000000000000000000)
              hi := ((23331072245713017 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1707299667716343 : ℚ) / 2000000000000000000)
              hi := ((1225782440417851 : ℚ) / 2000000000000000000) }
      im := { lo := ((-8053834504841209 : ℚ) / 25000000000000000000)
              hi := ((11035975461874377 : ℚ) / 10000000000000000000) } }
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

def s085_t0_sb020_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((3196303723 : ℚ) / 50000000000)
      ((-202255911 : ℚ) / 1000000000000)
      ((855071817 : ℚ) / 200000000000) where
  MRect :=
    { re := { lo := ((26365474311266083 : ℚ) / 10000000000000000000)
              hi := ((724416549247609 : ℚ) / 100000000000000000) }
      im := { lo := ((-6862313637981983 : ℚ) / 100000000000000000)
              hi := ((-6405632148030517 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((2306823863938109 : ℚ) / 250000000000000000)
              hi := ((5334536397302453 : ℚ) / 500000000000000000) }
      im := { lo := ((-1121608511291013 : ℚ) / 250000000000000000)
              hi := ((-15217494446259643 : ℚ) / 5000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-16799128927937673 : ℚ) / 10000000000000000000)
              hi := ((-4923379514648567 : ℚ) / 5000000000000000000) }
      im := { lo := ((4099512613912329 : ℚ) / 2500000000000000000)
              hi := ((11674973136531373 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8535358456872301 : ℚ) / 10000000000000000000)
              hi := ((6130284543865641 : ℚ) / 10000000000000000000) }
      im := { lo := ((-805312256783161 : ℚ) / 2500000000000000000)
              hi := ((11035843137014913 : ℚ) / 10000000000000000000) } }
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

def s085_t0_sb021_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((3196303723 : ℚ) / 50000000000)
      ((-202255911 : ℚ) / 1000000000000)
      ((855071817 : ℚ) / 200000000000) where
  MRect :=
    { re := { lo := ((13204971870771213 : ℚ) / 5000000000000000000)
              hi := ((2899433465809911 : ℚ) / 400000000000000000) }
      im := { lo := ((-3430300659382239 : ℚ) / 50000000000000000)
              hi := ((-640393027550797 : ℚ) / 10000000000000000) } }
  D0Rect :=
    { re := { lo := ((9222274293699763 : ℚ) / 1000000000000000000)
              hi := ((1332979405845403 : ℚ) / 125000000000000000) }
      im := { lo := ((-2249867860945683 : ℚ) / 500000000000000000)
              hi := ((-611408695497947 : ℚ) / 200000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1677087608531377 : ℚ) / 1000000000000000000)
              hi := ((-4909362864129673 : ℚ) / 5000000000000000000) }
      im := { lo := ((1641709215752049 : ℚ) / 1000000000000000000)
              hi := ((23368778699214237 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2133553585997427 : ℚ) / 2500000000000000000)
              hi := ((6131651787638207 : ℚ) / 10000000000000000000) }
      im := { lo := ((-32209651597949797 : ℚ) / 100000000000000000000)
              hi := ((11035711488730363 : ℚ) / 10000000000000000000) } }
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

def s085_t0_sb022_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((3196303723 : ℚ) / 50000000000)
      ((-202255911 : ℚ) / 1000000000000)
      ((855071817 : ℚ) / 200000000000) where
  MRect :=
    { re := { lo := ((5290925937403229 : ℚ) / 2000000000000000000)
              hi := ((906627705239957 : ℚ) / 125000000000000000) }
      im := { lo := ((-6858889839031111 : ℚ) / 100000000000000000)
              hi := ((-1600557311737097 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((2304308852418091 : ℚ) / 250000000000000000)
              hi := ((5329289593216563 : ℚ) / 500000000000000000) }
      im := { lo := ((-4513030382688397 : ℚ) / 1000000000000000000)
              hi := ((-6141162206631307 : ℚ) / 2000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-16742595214717633 : ℚ) / 10000000000000000000)
              hi := ((-9790666687271377 : ℚ) / 10000000000000000000) }
      im := { lo := ((16436095310792933 : ℚ) / 10000000000000000000)
              hi := ((23387570020624703 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-170661320402229 : ℚ) / 200000000000000000)
              hi := ((306650697625189 : ℚ) / 500000000000000000) }
      im := { lo := ((-3220683808303879 : ℚ) / 10000000000000000000)
              hi := ((11035582129568877 : ℚ) / 10000000000000000000) } }
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

def s085_t0_sb023_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((3196303723 : ℚ) / 50000000000)
      ((-202255911 : ℚ) / 1000000000000)
      ((855071817 : ℚ) / 200000000000) where
  MRect :=
    { re := { lo := ((6624881114576539 : ℚ) / 2500000000000000000)
              hi := ((453592509892897 : ℚ) / 62500000000000000) }
      im := { lo := ((-6857179304134019 : ℚ) / 100000000000000000)
              hi := ((-3200264480488479 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((115152231839017 : ℚ) / 12500000000000000)
              hi := ((1331663112663087 : ℚ) / 125000000000000000) }
      im := { lo := ((-565789802775103 : ℚ) / 125000000000000000)
              hi := ((-3084111328341013 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-16714288071044193 : ℚ) / 10000000000000000000)
              hi := ((-4881290139563213 : ℚ) / 5000000000000000000) }
      im := { lo := ((822752913264377 : ℚ) / 500000000000000000)
              hi := ((2340632183659019 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8531914895551959 : ℚ) / 10000000000000000000)
              hi := ((47924784766073 : ℚ) / 78125000000000000) }
      im := { lo := ((-16102042373481953 : ℚ) / 50000000000000000000)
              hi := ((11035458562648893 : ℚ) / 10000000000000000000) } }
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

def s085_t0_sb024_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((3196303723 : ℚ) / 50000000000)
      ((-202255911 : ℚ) / 1000000000000)
      ((855071817 : ℚ) / 200000000000) where
  MRect :=
    { re := { lo := ((26544632669892533 : ℚ) / 10000000000000000000)
              hi := ((9077448444345823 : ℚ) / 1250000000000000000) }
      im := { lo := ((-6855469548304129 : ℚ) / 100000000000000000)
              hi := ((-24995428075201 : ℚ) / 390625000000000) } }
  D0Rect :=
    { re := { lo := ((9207103874313319 : ℚ) / 1000000000000000000)
              hi := ((1331001528623509 : ℚ) / 125000000000000000) }
      im := { lo := ((-7093123665453 : ℚ) / 1562500000000000)
              hi := ((-1548817398283341 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-133487620618673 : ℚ) / 80000000000000000)
              hi := ((-2433617167981543 : ℚ) / 2500000000000000000) }
      im := { lo := ((16473982869729031 : ℚ) / 10000000000000000000)
              hi := ((46850064404253 : ℚ) / 20000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-533172676847659 : ℚ) / 625000000000000000)
              hi := ((11983845976553 : ℚ) / 19531250000000000) }
      im := { lo := ((-32201314798549073 : ℚ) / 100000000000000000000)
              hi := ((2207066621896891 : ℚ) / 2000000000000000000) } }
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

def s085_t0_sb025_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((3196303723 : ℚ) / 50000000000)
      ((-202255911 : ℚ) / 1000000000000)
      ((855071817 : ℚ) / 200000000000) where
  MRect :=
    { re := { lo := ((1329497825419299 : ℚ) / 500000000000000000)
              hi := ((3633228591559683 : ℚ) / 500000000000000000) }
      im := { lo := ((-6853760516635521 : ℚ) / 100000000000000000)
              hi := ((-6397131185346511 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((575125710278413 : ℚ) / 62500000000000000)
              hi := ((1330337655446953 : ℚ) / 125000000000000000) }
      im := { lo := ((-2276436204695237 : ℚ) / 500000000000000000)
              hi := ((-31111516071411203 : ℚ) / 10000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-3331517720448819 : ℚ) / 2000000000000000000)
              hi := ((-4853166078351633 : ℚ) / 5000000000000000000) }
      im := { lo := ((16492869241200047 : ℚ) / 10000000000000000000)
              hi := ((2930462620962491 : ℚ) / 1250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-34118436914563 : ℚ) / 40000000000000000)
              hi := ((383567714323053 : ℚ) / 625000000000000000) }
      im := { lo := ((-643969945012039 : ℚ) / 2000000000000000000)
              hi := ((2758800668112307 : ℚ) / 2500000000000000000) } }
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

def s085_t0_sb026_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((3196303723 : ℚ) / 50000000000)
      ((-202255911 : ℚ) / 1000000000000)
      ((855071817 : ℚ) / 200000000000) where
  MRect :=
    { re := { lo := ((13317749832157729 : ℚ) / 5000000000000000000)
              hi := ((1817743767675179 : ℚ) / 250000000000000000) }
      im := { lo := ((-685205224130963 : ℚ) / 10000000000000000)
              hi := ((-3197716864935323 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((9196901077459333 : ℚ) / 1000000000000000000)
              hi := ((2659342971134489 : ℚ) / 250000000000000000) }
      im := { lo := ((-4566138605482961 : ℚ) / 1000000000000000000)
              hi := ((-15623306508679047 : ℚ) / 5000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-8314598592119621 : ℚ) / 5000000000000000000)
              hi := ((-4839084896531351 : ℚ) / 5000000000000000000) }
      im := { lo := ((4127929135976347 : ℚ) / 2500000000000000000)
              hi := ((23462328836669857 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4264225329420131 : ℚ) / 5000000000000000000)
              hi := ((1227686376907189 : ℚ) / 2000000000000000000) }
      im := { lo := ((-3219563984114503 : ℚ) / 10000000000000000000)
              hi := ((5517534013604493 : ℚ) / 5000000000000000000) } }
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

def s085_t0_sb027_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((3196303723 : ℚ) / 50000000000)
      ((-202255911 : ℚ) / 1000000000000)
      ((855071817 : ℚ) / 200000000000) where
  MRect :=
    { re := { lo := ((6670314514310901 : ℚ) / 2500000000000000000)
              hi := ((3637756409976893 : ℚ) / 500000000000000000) }
      im := { lo := ((-856293097662739 : ℚ) / 12500000000000000)
              hi := ((-3196868582008413 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((4595886353867383 : ℚ) / 500000000000000000)
              hi := ((10632024465178667 : ℚ) / 1000000000000000000) }
      im := { lo := ((-4579397711055257 : ℚ) / 1000000000000000000)
              hi := ((-1961352416463031 : ℚ) / 625000000000000000) } }
  DrestRect :=
    { re := { lo := ((-4150194756268777 : ℚ) / 2500000000000000000)
              hi := ((-1929996191146893 : ℚ) / 2000000000000000000) }
      im := { lo := ((8265261969055707 : ℚ) / 5000000000000000000)
              hi := ((2935114572463463 : ℚ) / 1250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1705457433209379 : ℚ) / 2000000000000000000)
              hi := ((3069887276359407 : ℚ) / 5000000000000000000) }
      im := { lo := ((-100602418010319 : ℚ) / 312500000000000000)
              hi := ((11034932293471317 : ℚ) / 10000000000000000000) } }
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

def s085_t0_sb028_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((3196303723 : ℚ) / 50000000000)
      ((-202255911 : ℚ) / 1000000000000)
      ((855071817 : ℚ) / 200000000000) where
  MRect :=
    { re := { lo := ((26727230952708057 : ℚ) / 10000000000000000000)
              hi := ((7280070477348963 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6848638096926891 : ℚ) / 100000000000000000)
              hi := ((-6392041532119967 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((9186626136280551 : ℚ) / 1000000000000000000)
              hi := ((10626659146052677 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1148162345950007 : ℚ) / 250000000000000000)
              hi := ((-31516596044902177 : ℚ) / 10000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-8286166824261709 : ℚ) / 5000000000000000000)
              hi := ((-4810883130939849 : ℚ) / 5000000000000000000) }
      im := { lo := ((827464587279797 : ℚ) / 500000000000000000)
              hi := ((23499463847105567 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1705223937419271 : ℚ) / 2000000000000000000)
              hi := ((6141112370837857 : ℚ) / 10000000000000000000) }
      im := { lo := ((-32189882448334037 : ℚ) / 100000000000000000000)
              hi := ((551739690789237 : ℚ) / 500000000000000000) } }
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

def s085_t0_sb029_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((3196303723 : ℚ) / 50000000000)
      ((-202255911 : ℚ) / 1000000000000)
      ((855071817 : ℚ) / 200000000000) where
  MRect :=
    { re := { lo := ((334667712446363 : ℚ) / 125000000000000000)
              hi := ((227645255455397 : ℚ) / 31250000000000000) }
      im := { lo := ((-1711733056548247 : ℚ) / 25000000000000000)
              hi := ((-6390346803064081 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((459073058757001 : ℚ) / 50000000000000000)
              hi := ((2655319029387899 : ℚ) / 250000000000000000) }
      im := { lo := ((-2302946705524337 : ℚ) / 500000000000000000)
              hi := ((-15825743341257223 : ℚ) / 5000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-16543861033996227 : ℚ) / 10000000000000000000)
              hi := ((-76748206637881 : ℚ) / 80000000000000000) }
      im := { lo := ((8284009902439067 : ℚ) / 5000000000000000000)
              hi := ((11758985340694357 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1704989515858443 : ℚ) / 2000000000000000000)
              hi := ((47987849195847 : ℚ) / 78125000000000000) }
      im := { lo := ((-6437399284815043 : ℚ) / 20000000000000000000)
              hi := ((1103465564902037 : ℚ) / 1000000000000000000) } }
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

def s085_t0_sb030_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((3196303723 : ℚ) / 50000000000)
      ((-202255911 : ℚ) / 1000000000000)
      ((855071817 : ℚ) / 200000000000) where
  MRect :=
    { re := { lo := ((2681981259198467 : ℚ) / 1000000000000000000)
              hi := ((18223115607537649 : ℚ) / 2500000000000000000) }
      im := { lo := ((-6845227338226341 : ℚ) / 100000000000000000)
              hi := ((-6388652808445797 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((4588139117387163 : ℚ) / 500000000000000000)
              hi := ((21231750002761 : ℚ) / 2000000000000000) }
      im := { lo := ((-4619129813269791 : ℚ) / 1000000000000000000)
              hi := ((-3178630993689149 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1651536049610729 : ℚ) / 1000000000000000000)
              hi := ((-9565260474444127 : ℚ) / 10000000000000000000) }
      im := { lo := ((663468361554549 : ℚ) / 400000000000000000)
              hi := ((1176821805521027 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8523771600625309 : ℚ) / 10000000000000000000)
              hi := ((6143772290417539 : ℚ) / 10000000000000000000) }
      im := { lo := ((-16092116884925737 : ℚ) / 50000000000000000000)
              hi := ((11034529600263197 : ℚ) / 10000000000000000000) } }
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

def s085_t0_sb031_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((3196303723 : ℚ) / 50000000000)
      ((-202255911 : ℚ) / 1000000000000)
      ((855071817 : ℚ) / 200000000000) where
  MRect :=
    { re := { lo := ((6716598451323039 : ℚ) / 2500000000000000000)
              hi := ((7293867079981497 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6843523658763623 : ℚ) / 100000000000000000)
              hi := ((-319347967143239 : ℚ) / 5000000000000000) } }
  D0Rect :=
    { re := { lo := ((9171076890331923 : ℚ) / 1000000000000000000)
              hi := ((10610456236893167 : ℚ) / 1000000000000000000) }
      im := { lo := ((-4632358561881761 : ℚ) / 1000000000000000000)
              hi := ((-319210655835139 : ℚ) / 100000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2060854127693109 : ℚ) / 1250000000000000000)
              hi := ((-9536969316450343 : ℚ) / 10000000000000000000) }
      im := { lo := ((830267913520031 : ℚ) / 500000000000000000)
              hi := ((11777430612926257 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8522602275566459 : ℚ) / 10000000000000000000)
              hi := ((153627641858127 : ℚ) / 250000000000000000) }
      im := { lo := ((-2011355986045529 : ℚ) / 6250000000000000000)
              hi := ((2758606452239833 : ℚ) / 2500000000000000000) } }
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
    (hi : i ∈ positiveBoxSubboxesOf .s085_t0) :
    ProjectedJ0SubboxRectangleCertificateData
      ((positiveBoxCombinedCert .s085_t0).constants.mainLower)
      ((positiveBoxCombinedCert .s085_t0).constants.d0NegReUpper)
      ((positiveBoxCombinedCert .s085_t0).constants.restUpper) := by
  if h0 : i = .s085_t0_sb000 then
    exact s085_t0_sb000_certificateData
  else if h1 : i = .s085_t0_sb001 then
    exact s085_t0_sb001_certificateData
  else if h2 : i = .s085_t0_sb002 then
    exact s085_t0_sb002_certificateData
  else if h3 : i = .s085_t0_sb003 then
    exact s085_t0_sb003_certificateData
  else if h4 : i = .s085_t0_sb004 then
    exact s085_t0_sb004_certificateData
  else if h5 : i = .s085_t0_sb005 then
    exact s085_t0_sb005_certificateData
  else if h6 : i = .s085_t0_sb006 then
    exact s085_t0_sb006_certificateData
  else if h7 : i = .s085_t0_sb007 then
    exact s085_t0_sb007_certificateData
  else if h8 : i = .s085_t0_sb008 then
    exact s085_t0_sb008_certificateData
  else if h9 : i = .s085_t0_sb009 then
    exact s085_t0_sb009_certificateData
  else if h10 : i = .s085_t0_sb010 then
    exact s085_t0_sb010_certificateData
  else if h11 : i = .s085_t0_sb011 then
    exact s085_t0_sb011_certificateData
  else if h12 : i = .s085_t0_sb012 then
    exact s085_t0_sb012_certificateData
  else if h13 : i = .s085_t0_sb013 then
    exact s085_t0_sb013_certificateData
  else if h14 : i = .s085_t0_sb014 then
    exact s085_t0_sb014_certificateData
  else if h15 : i = .s085_t0_sb015 then
    exact s085_t0_sb015_certificateData
  else if h16 : i = .s085_t0_sb016 then
    exact s085_t0_sb016_certificateData
  else if h17 : i = .s085_t0_sb017 then
    exact s085_t0_sb017_certificateData
  else if h18 : i = .s085_t0_sb018 then
    exact s085_t0_sb018_certificateData
  else if h19 : i = .s085_t0_sb019 then
    exact s085_t0_sb019_certificateData
  else if h20 : i = .s085_t0_sb020 then
    exact s085_t0_sb020_certificateData
  else if h21 : i = .s085_t0_sb021 then
    exact s085_t0_sb021_certificateData
  else if h22 : i = .s085_t0_sb022 then
    exact s085_t0_sb022_certificateData
  else if h23 : i = .s085_t0_sb023 then
    exact s085_t0_sb023_certificateData
  else if h24 : i = .s085_t0_sb024 then
    exact s085_t0_sb024_certificateData
  else if h25 : i = .s085_t0_sb025 then
    exact s085_t0_sb025_certificateData
  else if h26 : i = .s085_t0_sb026 then
    exact s085_t0_sb026_certificateData
  else if h27 : i = .s085_t0_sb027 then
    exact s085_t0_sb027_certificateData
  else if h28 : i = .s085_t0_sb028 then
    exact s085_t0_sb028_certificateData
  else if h29 : i = .s085_t0_sb029 then
    exact s085_t0_sb029_certificateData
  else if h30 : i = .s085_t0_sb030 then
    exact s085_t0_sb030_certificateData
  else if h31 : i = .s085_t0_sb031 then
    exact s085_t0_sb031_certificateData
  else
    simp [positiveBoxSubboxesOf, h0, h1, h2, h3, h4, h5, h6, h7, h8, h9, h10, h11, h12, h13, h14, h15, h16, h17, h18, h19, h20, h21, h22, h23, h24, h25, h26, h27, h28, h29, h30, h31] at hi

end S085T0
end ProjectedJ0PositiveBoxRectangleData
end ProjectedJ0PositiveBoxSkeleton
end C2
