import LeanC2.AuditProjectedJ0PositiveBoxRectangleCertificateSchema
import LeanC2.AuditProjectedJ0PositiveBoxAllSubboxSkeleton
import LeanC2.AuditAdjustedQuartetProjectedJ0PositiveBoxSectorRationalizedData

set_option linter.style.longLine false

/-!
# Generated rectangle data for s0.85_t3

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
namespace S085T3

open ProjectedJ0RectangleArithmetic

def s085_t3_sb000_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62000067433 : ℚ) / 1000000000000)
      ((-37442047 : ℚ) / 125000000000)
      ((4237438401 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((994988376473617 : ℚ) / 312500000000000000)
              hi := ((15572036439513737 : ℚ) / 2000000000000000000) }
      im := { lo := ((-3347816381604961 : ℚ) / 50000000000000000)
              hi := ((-1247996244913129 : ℚ) / 20000000000000000) } }
  D0Rect :=
    { re := { lo := ((69098858658083 : ℚ) / 8000000000000000)
              hi := ((10057155659109819 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1444507242215609 : ℚ) / 250000000000000000)
              hi := ((-2179777006340653 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-553938850692847 : ℚ) / 400000000000000000)
              hi := ((-6921319014484469 : ℚ) / 10000000000000000000) }
      im := { lo := ((1810080477903717 : ℚ) / 1000000000000000000)
              hi := ((625717958127583 : ℚ) / 250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1051749189294971 : ℚ) / 1250000000000000000)
              hi := ((6255902377294553 : ℚ) / 10000000000000000000) }
      im := { lo := ((-10232130010321 : ℚ) / 32000000000000000)
              hi := ((2756598350966639 : ℚ) / 2500000000000000000) } }
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

def s085_t3_sb001_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62000067433 : ℚ) / 1000000000000)
      ((-37442047 : ℚ) / 125000000000)
      ((4237438401 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((1595233554625523 : ℚ) / 500000000000000000)
              hi := ((3896223890956837 : ℚ) / 500000000000000000) }
      im := { lo := ((-6694016184804057 : ℚ) / 100000000000000000)
              hi := ((-6238375045860269 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((4315290667359217 : ℚ) / 500000000000000000)
              hi := ((5025077563784947 : ℚ) / 500000000000000000) }
      im := { lo := ((-1158102440159453 : ℚ) / 200000000000000000)
              hi := ((-2186141013011021 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-690889267282969 : ℚ) / 500000000000000000)
              hi := ((-344545849858217 : ℚ) / 500000000000000000) }
      im := { lo := ((18115720246194911 : ℚ) / 10000000000000000000)
              hi := ((5008672506519091 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-525796526317977 : ℚ) / 625000000000000000)
              hi := ((391067613566873 : ℚ) / 625000000000000000) }
      im := { lo := ((-31973282095284063 : ℚ) / 100000000000000000000)
              hi := ((110263158643319 : ℚ) / 100000000000000000) } }
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

def s085_t3_sb002_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62000067433 : ℚ) / 1000000000000)
      ((-37442047 : ℚ) / 125000000000)
      ((4237438401 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((15984959531975013 : ℚ) / 5000000000000000000)
              hi := ((779889668833209 : ℚ) / 100000000000000000) }
      im := { lo := ((-836550080934313 : ℚ) / 12500000000000000)
              hi := ((-6236769975529471 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((2155947070862647 : ℚ) / 250000000000000000)
              hi := ((100431376287323 : ℚ) / 10000000000000000) }
      im := { lo := ((-232119439315083 : ℚ) / 40000000000000000)
              hi := ((-2192500385290169 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-3446769511219739 : ℚ) / 2500000000000000000)
              hi := ((-3430247158616793 : ℚ) / 5000000000000000000) }
      im := { lo := ((9065296371042099 : ℚ) / 5000000000000000000)
              hi := ((5011592649588283 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8411492109879103 : ℚ) / 10000000000000000000)
              hi := ((625825724024949 : ℚ) / 1000000000000000000) }
      im := { lo := ((-7992787797572749 : ℚ) / 25000000000000000000)
              hi := ((2205247509365277 : ℚ) / 2000000000000000000) } }
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

def s085_t3_sb003_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62000067433 : ℚ) / 1000000000000)
      ((-37442047 : ℚ) / 125000000000)
      ((4237438401 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((400442138863919 : ℚ) / 125000000000000000)
              hi := ((3902682484346011 : ℚ) / 500000000000000000) }
      im := { lo := ((-1672696533769389 : ℚ) / 25000000000000000)
              hi := ((-3117583016604209 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((4308489102362041 : ℚ) / 500000000000000000)
              hi := ((10036103183723487 : ℚ) / 1000000000000000000) }
      im := { lo := ((-5815450546169989 : ℚ) / 1000000000000000000)
              hi := ((-8795419930203283 : ℚ) / 2000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-171954376749889 : ℚ) / 125000000000000000)
              hi := ((-1366010073493861 : ℚ) / 2000000000000000000) }
      im := { lo := ((907271085082583 : ℚ) / 500000000000000000)
              hi := ((25072520997567803 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8410237210228949 : ℚ) / 10000000000000000000)
              hi := ((6259429278262021 : ℚ) / 10000000000000000000) }
      im := { lo := ((-3196898540460973 : ℚ) / 10000000000000000000)
              hi := ((11026155635316917 : ℚ) / 10000000000000000000) } }
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

def s085_t3_sb004_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62000067433 : ℚ) / 1000000000000)
      ((-37442047 : ℚ) / 125000000000)
      ((4237438401 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((16050516690481757 : ℚ) / 5000000000000000000)
              hi := ((7811852038249137 : ℚ) / 1000000000000000000) }
      im := { lo := ((-668917257782463 : ℚ) / 10000000000000000)
              hi := ((-6233563292800829 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((4305075777902733 : ℚ) / 500000000000000000)
              hi := ((10029051351824289 : ℚ) / 1000000000000000000) }
      im := { lo := ((-5827905437772529 : ℚ) / 1000000000000000000)
              hi := ((-551301252401597 : ℚ) / 125000000000000000) } }
  DrestRect :=
    { re := { lo := ((-6862799770504123 : ℚ) / 5000000000000000000)
              hi := ((-6799587340853633 : ℚ) / 10000000000000000000) }
      im := { lo := ((908010462172433 : ℚ) / 500000000000000000)
              hi := ((6271758399044099 : ℚ) / 2500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8408979689748539 : ℚ) / 10000000000000000000)
              hi := ((3130298948502029 : ℚ) / 5000000000000000000) }
      im := { lo := ((-31966772107999003 : ℚ) / 100000000000000000000)
              hi := ((11026068867667457 : ℚ) / 10000000000000000000) } }
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

def s085_t3_sb005_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62000067433 : ℚ) / 1000000000000)
      ((-37442047 : ℚ) / 125000000000)
      ((4237438401 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((804172536863363 : ℚ) / 250000000000000000)
              hi := ((312734330663237 : ℚ) / 40000000000000000) }
      im := { lo := ((-267502401242541 : ℚ) / 4000000000000000)
              hi := ((-12463923408670477 : ℚ) / 200000000000000000) } }
  D0Rect :=
    { re := { lo := ((4301653937583353 : ℚ) / 500000000000000000)
              hi := ((10021982648426839 : ℚ) / 1000000000000000000) }
      im := { lo := ((-5840351209408147 : ℚ) / 1000000000000000000)
              hi := ((-4423100336448939 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1369482894975739 : ℚ) / 1000000000000000000)
              hi := ((-67691027076659 : ℚ) / 100000000000000000) }
      im := { lo := ((18174952790723157 : ℚ) / 10000000000000000000)
              hi := ((25101503600688433 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-336308729827369 : ℚ) / 400000000000000000)
              hi := ((6261761796081597 : ℚ) / 10000000000000000000) }
      im := { lo := ((-3196450626901563 : ℚ) / 10000000000000000000)
              hi := ((5512988371158187 : ℚ) / 5000000000000000000) } }
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

def s085_t3_sb006_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62000067433 : ℚ) / 1000000000000)
      ((-37442047 : ℚ) / 125000000000)
      ((4237438401 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((6446592176735007 : ℚ) / 2000000000000000000)
              hi := ((978110637022443 : ℚ) / 125000000000000000) }
      im := { lo := ((-6685948555832431 : ℚ) / 100000000000000000)
              hi := ((-1557590302864181 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((4298223760313977 : ℚ) / 500000000000000000)
              hi := ((2002979341707679 : ℚ) / 200000000000000000) }
      im := { lo := ((-2926394004386963 : ℚ) / 500000000000000000)
              hi := ((-1108945178475597 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1366403810262941 : ℚ) / 1000000000000000000)
              hi := ((-1347719361306193 : ℚ) / 2000000000000000000) }
      im := { lo := ((2273706611211397 : ℚ) / 1250000000000000000)
              hi := ((1255796517252379 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2101616003110041 : ℚ) / 2500000000000000000)
              hi := ((782866513965501 : ℚ) / 1250000000000000000) }
      im := { lo := ((-319621918478763 : ℚ) / 1000000000000000000)
              hi := ((5512939828223491 : ℚ) / 5000000000000000000) } }
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

def s085_t3_sb007_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62000067433 : ℚ) / 1000000000000)
      ((-37442047 : ℚ) / 125000000000)
      ((4237438401 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((3229921848848677 : ℚ) / 1000000000000000000)
              hi := ((1957857959647963 : ℚ) / 250000000000000000) }
      im := { lo := ((-1336867617153489 : ℚ) / 20000000000000000)
              hi := ((-6228761885100923 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((8589570220462587 : ℚ) / 1000000000000000000)
              hi := ((5003896914193901 : ℚ) / 500000000000000000) }
      im := { lo := ((-5865215147736241 : ℚ) / 1000000000000000000)
              hi := ((-2224225899614161 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-3408306462755703 : ℚ) / 2500000000000000000)
              hi := ((-1341614179983823 : ℚ) / 2000000000000000000) }
      im := { lo := ((18204310182557543 : ℚ) / 10000000000000000000)
              hi := ((2513031313656971 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-67241700319019 : ℚ) / 80000000000000000)
              hi := ((3132052196720597 : ℚ) / 5000000000000000000) }
      im := { lo := ((-31959826863174547 : ℚ) / 100000000000000000000)
              hi := ((11025777413175431 : ℚ) / 10000000000000000000) } }
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

def s085_t3_sb008_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62000067433 : ℚ) / 1000000000000)
      ((-37442047 : ℚ) / 125000000000)
      ((4237438401 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((6473135027860461 : ℚ) / 2000000000000000000)
              hi := ((7837998385901847 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6682728759277577 : ℚ) / 100000000000000000)
              hi := ((-1556790897561733 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((1072834533946667 : ℚ) / 125000000000000000)
              hi := ((10000673762764199 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1469408159931673 : ℚ) / 250000000000000000)
              hi := ((-278819596709549 : ℚ) / 62500000000000000) } }
  DrestRect :=
    { re := { lo := ((-13602391765662263 : ℚ) / 10000000000000000000)
              hi := ((-6677525568596187 : ℚ) / 10000000000000000000) }
      im := { lo := ((4554731336272987 : ℚ) / 2500000000000000000)
              hi := ((25144651300393933 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-210099034477213 : ℚ) / 250000000000000000)
              hi := ((6265276191961477 : ℚ) / 10000000000000000000) }
      im := { lo := ((-3994689452070197 : ℚ) / 12500000000000000000)
              hi := ((1102568044352369 : ℚ) / 1000000000000000000) } }
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

def s085_t3_sb009_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62000067433 : ℚ) / 1000000000000)
      ((-37442047 : ℚ) / 125000000000)
      ((4237438401 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((3243233474194559 : ℚ) / 1000000000000000000)
              hi := ((784458432347323 : ℚ) / 100000000000000000) }
      im := { lo := ((-6681120575820353 : ℚ) / 100000000000000000)
              hi := ((-6225566332438699 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((8575765555412163 : ℚ) / 1000000000000000000)
              hi := ((1998707327790309 : ℚ) / 200000000000000000) }
      im := { lo := ((-2945020047265079 : ℚ) / 500000000000000000)
              hi := ((-11184415713634279 : ℚ) / 2500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-169644189887519 : ℚ) / 125000000000000000)
              hi := ((-6646961582790007 : ℚ) / 10000000000000000000) }
      im := { lo := ((911674937983527 : ℚ) / 500000000000000000)
              hi := ((628973608539253 : ℚ) / 250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8402707271875029 : ℚ) / 10000000000000000000)
              hi := ((783305531387883 : ℚ) / 1250000000000000000) }
      im := { lo := ((-6391056627548761 : ℚ) / 20000000000000000000)
              hi := ((5512795625599757 : ℚ) / 5000000000000000000) } }
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

def s085_t3_sb010_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62000067433 : ℚ) / 1000000000000)
      ((-37442047 : ℚ) / 125000000000)
      ((4237438401 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((6499838586257579 : ℚ) / 2000000000000000000)
              hi := ((1962797510299547 : ℚ) / 250000000000000000) }
      im := { lo := ((-6679513472484729 : ℚ) / 100000000000000000)
              hi := ((-7779962724987567 : ℚ) / 125000000000000000) } }
  D0Rect :=
    { re := { lo := ((4284418785928371 : ℚ) / 500000000000000000)
              hi := ((31207446830233 : ℚ) / 3125000000000000) }
      im := { lo := ((-5902438285444627 : ℚ) / 1000000000000000000)
              hi := ((-4486409197740957 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-338516486557947 : ℚ) / 250000000000000000)
              hi := ((-6616375730183941 : ℚ) / 10000000000000000000) }
      im := { lo := ((9124013643430453 : ℚ) / 5000000000000000000)
              hi := ((2517319535061139 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4200725685519191 : ℚ) / 5000000000000000000)
              hi := ((7834512157211 : ℚ) / 12500000000000000) }
      im := { lo := ((-639060492290871 : ℚ) / 2000000000000000000)
              hi := ((5512749678441717 : ℚ) / 5000000000000000000) } }
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

def s085_t3_sb011_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62000067433 : ℚ) / 1000000000000)
      ((-37442047 : ℚ) / 125000000000)
      ((4237438401 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((3256624885170471 : ℚ) / 1000000000000000000)
              hi := ((1964453911906589 : ℚ) / 250000000000000000) }
      im := { lo := ((-1669476872334713 : ℚ) / 25000000000000000)
              hi := ((-6222375098015109 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((535118271777417 : ℚ) / 62500000000000000)
              hi := ((9979212808215157 : ℚ) / 1000000000000000000) }
      im := { lo := ((-29574133979308093 : ℚ) / 5000000000000000000)
              hi := ((-1799617061059847 : ℚ) / 400000000000000000) } }
  DrestRect :=
    { re := { lo := ((-6754881777580713 : ℚ) / 5000000000000000000)
              hi := ((-6585769174344559 : ℚ) / 10000000000000000000) }
      im := { lo := ((9131255887604127 : ℚ) / 5000000000000000000)
              hi := ((1259370171261623 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4200096965181673 : ℚ) / 5000000000000000000)
              hi := ((1253754573542883 : ℚ) / 2000000000000000000) }
      im := { lo := ((-639015730647727 : ℚ) / 2000000000000000000)
              hi := ((13781761762809 : ℚ) / 12500000000000000) } }
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

def s085_t3_sb012_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62000067433 : ℚ) / 1000000000000)
      ((-37442047 : ℚ) / 125000000000)
      ((4237438401 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((8158374651605489 : ℚ) / 2500000000000000000)
              hi := ((7864461492897707 : ℚ) / 1000000000000000000) }
      im := { lo := ((-667630265576457 : ℚ) / 10000000000000000)
              hi := ((-777597632429827 : ℚ) / 12500000000000000) } }
  D0Rect :=
    { re := { lo := ((3341769238507 : ℚ) / 390625000000000)
              hi := ((1994405349349479 : ℚ) / 200000000000000000) }
      im := { lo := ((-11854412287827007 : ℚ) / 2000000000000000000)
              hi := ((-225583305036299 : ℚ) / 50000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1684856291482639 : ℚ) / 1250000000000000000)
              hi := ((-409696194961159 : ℚ) / 625000000000000000) }
      im := { lo := ((18276949305323143 : ℚ) / 10000000000000000000)
              hi := ((12600785713082583 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8398933189346919 : ℚ) / 10000000000000000000)
              hi := ((6269931919218277 : ℚ) / 10000000000000000000) }
      im := { lo := ((-31948547401454923 : ℚ) / 100000000000000000000)
              hi := ((5512659631551897 : ℚ) / 5000000000000000000) } }
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

def s085_t3_sb013_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62000067433 : ℚ) / 1000000000000)
      ((-37442047 : ℚ) / 125000000000)
      ((4237438401 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((32700936283865177 : ℚ) / 10000000000000000000)
              hi := ((7871128157358881 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3337349477212489 : ℚ) / 50000000000000000)
              hi := ((-15547970219415461 : ℚ) / 250000000000000000) } }
  D0Rect :=
    { re := { lo := ((8547949053373013 : ℚ) / 1000000000000000000)
              hi := ((1992964815574719 : ℚ) / 200000000000000000) }
      im := { lo := ((-296978830621989 : ℚ) / 50000000000000000)
              hi := ((-4524279199134223 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1680989890850787 : ℚ) / 1250000000000000000)
              hi := ((-6524486419776273 : ℚ) / 10000000000000000000) }
      im := { lo := ((365826824402381 : ℚ) / 200000000000000000)
              hi := ((25215697959409663 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2099419417961571 : ℚ) / 2500000000000000000)
              hi := ((6271095403313589 : ℚ) / 10000000000000000000) }
      im := { lo := ((-159731342014949 : ℚ) / 500000000000000000)
              hi := ((5512612517380557 : ℚ) / 5000000000000000000) } }
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

def s085_t3_sb014_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62000067433 : ℚ) / 1000000000000)
      ((-37442047 : ℚ) / 125000000000)
      ((4237438401 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((32768572955061107 : ℚ) / 10000000000000000000)
              hi := ((3938907252136601 : ℚ) / 500000000000000000) }
      im := { lo := ((-6673096346593609 : ℚ) / 100000000000000000)
              hi := ((-6217596225119959 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((1067619007615359 : ℚ) / 125000000000000000)
              hi := ((4978802251999417 : ℚ) / 500000000000000000) }
      im := { lo := ((-2975969138864099 : ℚ) / 500000000000000000)
              hi := ((-2268440919856261 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-6708484790068593 : ℚ) / 5000000000000000000)
              hi := ((-3246905752397201 : ℚ) / 5000000000000000000) }
      im := { lo := ((18305688112604799 : ℚ) / 10000000000000000000)
              hi := ((25229782372991547 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-335856860579291 : ℚ) / 400000000000000000)
              hi := ((6272257458775237 : ℚ) / 10000000000000000000) }
      im := { lo := ((-1597197156148583 : ℚ) / 5000000000000000000)
              hi := ((11025126085157507 : ℚ) / 10000000000000000000) } }
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

def s085_t3_sb015_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62000067433 : ℚ) / 1000000000000)
      ((-37442047 : ℚ) / 125000000000)
      ((4237438401 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((8209103289179893 : ℚ) / 2500000000000000000)
              hi := ((7884520057789023 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3335747410829313 : ℚ) / 50000000000000000)
              hi := ((-1554001372107471 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((2133484498113743 : ℚ) / 250000000000000000)
              hi := ((9950368342531343 : ℚ) / 1000000000000000000) }
      im := { lo := ((-5964290035114423 : ℚ) / 1000000000000000000)
              hi := ((-2274737530478549 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2677199899443779 : ℚ) / 2000000000000000000)
              hi := ((-1615779184840721 : ℚ) / 2500000000000000000) }
      im := { lo := ((18319991434366549 : ℚ) / 10000000000000000000)
              hi := ((2524382313433281 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4197580462421411 : ℚ) / 5000000000000000000)
              hi := ((1568353573447957 : ℚ) / 2500000000000000000) }
      im := { lo := ((-31941626456443063 : ℚ) / 100000000000000000000)
              hi := ((1102502790478247 : ℚ) / 1000000000000000000) } }
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

def s085_t3_sb016_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62000067433 : ℚ) / 1000000000000)
      ((-37442047 : ℚ) / 125000000000)
      ((4237438401 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((32904460329631863 : ℚ) / 10000000000000000000)
              hi := ((3945622227565701 : ℚ) / 500000000000000000) }
      im := { lo := ((-333494717548357 : ℚ) / 5000000000000000)
              hi := ((-3107207954594381 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((4263453705461941 : ℚ) / 500000000000000000)
              hi := ((7954492052303 : ℚ) / 800000000000000) }
      im := { lo := ((-1494157905635883 : ℚ) / 250000000000000000)
              hi := ((-2281029549513131 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-13355007078741181 : ℚ) / 10000000000000000000)
              hi := ((-25729616145481 : ℚ) / 40000000000000000) }
      im := { lo := ((183342532058667 : ℚ) / 100000000000000000)
              hi := ((25257818212291007 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4196948546404519 : ℚ) / 5000000000000000000)
              hi := ((250982683937131 : ℚ) / 400000000000000000) }
      im := { lo := ((-3193932222484637 : ℚ) / 10000000000000000000)
              hi := ((2204986175350393 : ℚ) / 2000000000000000000) } }
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

def s085_t3_sb017_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62000067433 : ℚ) / 1000000000000)
      ((-37442047 : ℚ) / 125000000000)
      ((4237438401 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((16486352295650823 : ℚ) / 5000000000000000000)
              hi := ((1974497163522531 : ℚ) / 250000000000000000) }
      im := { lo := ((-3334147510282353 : ℚ) / 50000000000000000)
              hi := ((-1553206851481287 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((532491246090273 : ℚ) / 62500000000000000)
              hi := ((1987169009948471 : ℚ) / 200000000000000000) }
      im := { lo := ((-2994481669832459 : ℚ) / 500000000000000000)
              hi := ((-114365839912621 : ℚ) / 25000000000000000) } }
  DrestRect :=
    { re := { lo := ((-66619970398313 : ℚ) / 50000000000000000)
              hi := ((-100026120768643 : ℚ) / 156250000000000000) }
      im := { lo := ((733938865150883 : ℚ) / 400000000000000000)
              hi := ((315897116108697 : ℚ) / 125000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-419631650118933 : ℚ) / 500000000000000000)
              hi := ((784464857441267 : ℚ) / 1250000000000000000) }
      im := { lo := ((-3193704932838051 : ℚ) / 10000000000000000000)
              hi := ((5512418446006693 : ℚ) / 5000000000000000000) } }
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

def s085_t3_sb018_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62000067433 : ℚ) / 1000000000000)
      ((-37442047 : ℚ) / 125000000000)
      ((4237438401 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((4130142404437823 : ℚ) / 1250000000000000000)
              hi := ((7904753376795711 : ℚ) / 1000000000000000000) }
      im := { lo := ((-52083569660277 : ℚ) / 781250000000000)
              hi := ((-12422479800236401 : ℚ) / 200000000000000000) } }
  D0Rect :=
    { re := { lo := ((4256397712521191 : ℚ) / 500000000000000000)
              hi := ((9928558496476673 : ℚ) / 1000000000000000000) }
      im := { lo := ((-12002569964221263 : ℚ) / 2000000000000000000)
              hi := ((-573399839934969 : ℚ) / 125000000000000000) } }
  DrestRect :=
    { re := { lo := ((-6646480224974733 : ℚ) / 5000000000000000000)
              hi := ((-6370920032281919 : ℚ) / 10000000000000000000) }
      im := { lo := ((3672529324475599 : ℚ) / 2000000000000000000)
              hi := ((6321419109156859 : ℚ) / 2500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8391371153243059 : ℚ) / 10000000000000000000)
              hi := ((6276872071895519 : ℚ) / 10000000000000000000) }
      im := { lo := ((-12773944411193 : ℚ) / 40000000000000000)
              hi := ((5512375639668603 : ℚ) / 5000000000000000000) } }
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

def s085_t3_sb019_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62000067433 : ℚ) / 1000000000000)
      ((-37442047 : ℚ) / 125000000000)
      ((4237438401 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((33109782631937667 : ℚ) / 10000000000000000000)
              hi := ((988942084447749 : ℚ) / 125000000000000000) }
      im := { lo := ((-6665099798605131 : ℚ) / 100000000000000000)
              hi := ((-310482681650713 : ℚ) / 5000000000000000) } }
  D0Rect :=
    { re := { lo := ((8505714264190957 : ℚ) / 1000000000000000000)
              hi := ((2480313758642883 : ℚ) / 250000000000000000) }
      im := { lo := ((-1202719281587177 : ℚ) / 200000000000000000)
              hi := ((-919950912076667 : ℚ) / 200000000000000000) } }
  DrestRect :=
    { re := { lo := ((-13261905106716127 : ℚ) / 10000000000000000000)
              hi := ((-198129692033699 : ℚ) / 312500000000000000) }
      im := { lo := ((18376779442106663 : ℚ) / 10000000000000000000)
              hi := ((25299538326752817 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-419505259863173 : ℚ) / 500000000000000000)
              hi := ((1255604078792361 : ℚ) / 2000000000000000000) }
      im := { lo := ((-638652641948211 : ℚ) / 2000000000000000000)
              hi := ((5512330757670473 : ℚ) / 5000000000000000000) } }
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

def s085_t3_sb020_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62000067433 : ℚ) / 1000000000000)
      ((-37442047 : ℚ) / 125000000000)
      ((4237438401 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((33178625258048753 : ℚ) / 10000000000000000000)
              hi := ((1979584875730253 : ℚ) / 250000000000000000) }
      im := { lo := ((-333175187663623 : ℚ) / 5000000000000000)
              hi := ((-12416137046628771 : ℚ) / 200000000000000000) } }
  D0Rect :=
    { re := { lo := ((2124654113797989 : ℚ) / 250000000000000000)
              hi := ((1982786934736953 : ℚ) / 200000000000000000) }
      im := { lo := ((-3012949133581069 : ℚ) / 500000000000000000)
              hi := ((-4612300433163509 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1323082992647807 : ℚ) / 1000000000000000000)
              hi := ((-50474882174947 : ℚ) / 80000000000000000) }
      im := { lo := ((18390868606146923 : ℚ) / 10000000000000000000)
              hi := ((6328339094774203 : ℚ) / 2500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2097209914078997 : ℚ) / 2500000000000000000)
              hi := ((6279168347850587 : ℚ) / 10000000000000000000) }
      im := { lo := ((-399129589323557 : ℚ) / 1250000000000000000)
              hi := ((2756142015761241 : ℚ) / 2500000000000000000) } }
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

def s085_t3_sb021_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62000067433 : ℚ) / 1000000000000)
      ((-37442047 : ℚ) / 125000000000)
      ((4237438401 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((664953200913393 : ℚ) / 200000000000000000)
              hi := ((7925162596602277 : ℚ) / 1000000000000000000) }
      im := { lo := ((-832738595231409 : ℚ) / 12500000000000000)
              hi := ((-620648459546199 : ℚ) / 10000000000000000) } }
  D0Rect :=
    { re := { lo := ((8491502103349593 : ℚ) / 1000000000000000000)
              hi := ((2476649338653793 : ℚ) / 250000000000000000) }
      im := { lo := ((-603819015468471 : ℚ) / 100000000000000000)
              hi := ((-4624836682701329 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2639946759325123 : ℚ) / 2000000000000000000)
              hi := ((-6278551704689027 : ℚ) / 10000000000000000000) }
      im := { lo := ((18404915118146593 : ℚ) / 10000000000000000000)
              hi := ((15829455957541 : ℚ) / 6250000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8387581144635483 : ℚ) / 10000000000000000000)
              hi := ((628032254481209 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3991006772247873 : ℚ) / 12500000000000000000)
              hi := ((2756117430918509 : ℚ) / 2500000000000000000) } }
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

def s085_t3_sb022_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62000067433 : ℚ) / 1000000000000)
      ((-37442047 : ℚ) / 125000000000)
      ((4237438401 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((3331689820194691 : ℚ) / 1000000000000000000)
              hi := ((7932004744186419 : ℚ) / 1000000000000000000) }
      im := { lo := ((-333015739884313 : ℚ) / 5000000000000000)
              hi := ((-12409803739937271 : ℚ) / 200000000000000000) } }
  D0Rect :=
    { re := { lo := ((848437086904261 : ℚ) / 100000000000000000)
              hi := ((4949621717237897 : ℚ) / 500000000000000000) }
      im := { lo := ((-6050472033238983 : ℚ) / 1000000000000000000)
              hi := ((-4637363313014893 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-3292154363957733 : ℚ) / 2500000000000000000)
              hi := ((-19524136863023 : ℚ) / 31250000000000000) }
      im := { lo := ((4604729511594289 : ℚ) / 2500000000000000000)
              hi := ((25340858671122177 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8386319723000821 : ℚ) / 10000000000000000000)
              hi := ((6281473051232501 : ℚ) / 10000000000000000000) }
      im := { lo := ((-7981425186469481 : ℚ) / 25000000000000000000)
              hi := ((5512183624078609 : ℚ) / 5000000000000000000) } }
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

def s085_t3_sb023_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62000067433 : ℚ) / 1000000000000)
      ((-37442047 : ℚ) / 125000000000)
      ((4237438401 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((417329132266457 : ℚ) / 125000000000000000)
              hi := ((7938866911361309 : ℚ) / 1000000000000000000) }
      im := { lo := ((-104042533440377 : ℚ) / 1562500000000000)
              hi := ((-6203320101376323 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((1059652856985883 : ℚ) / 125000000000000000)
              hi := ((9891872840732207 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1515685982827057 : ℚ) / 250000000000000000)
              hi := ((-2324940121039767 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1642185117092423 : ℚ) / 1250000000000000000)
              hi := ((-6216876656599591 : ℚ) / 10000000000000000000) }
      im := { lo := ((288013710620067 : ℚ) / 156250000000000000)
              hi := ((25354543641769663 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8385056724800939 : ℚ) / 10000000000000000000)
              hi := ((6282621195951819 : ℚ) / 10000000000000000000) }
      im := { lo := ((-3192347739848603 : ℚ) / 10000000000000000000)
              hi := ((551213885456417 : ℚ) / 500000000000000000) } }
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

def s085_t3_sb024_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62000067433 : ℚ) / 1000000000000)
      ((-37442047 : ℚ) / 125000000000)
      ((4237438401 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((3345594348066161 : ℚ) / 1000000000000000000)
              hi := ((794575049214513 : ℚ) / 100000000000000000) }
      im := { lo := ((-1664282679021861 : ℚ) / 25000000000000000)
              hi := ((-12403478646914641 : ℚ) / 200000000000000000) } }
  D0Rect :=
    { re := { lo := ((2117514177584177 : ℚ) / 250000000000000000)
              hi := ((1235560868981897 : ℚ) / 125000000000000000) }
      im := { lo := ((-379687915454653 : ℚ) / 62500000000000000)
              hi := ((-2331193318748683 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-3276582365922603 : ℚ) / 2500000000000000000)
              hi := ((-6186005166705487 : ℚ) / 10000000000000000000) }
      im := { lo := ((2305848487989719 : ℚ) / 1250000000000000000)
              hi := ((1585511870053001 : ℚ) / 625000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8383795257805969 : ℚ) / 10000000000000000000)
              hi := ((1256754017276467 : ℚ) / 2000000000000000000) }
      im := { lo := ((-1596062683470841 : ℚ) / 5000000000000000000)
              hi := ((11024188035625537 : ℚ) / 10000000000000000000) } }
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

def s085_t3_sb025_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62000067433 : ℚ) / 1000000000000)
      ((-37442047 : ℚ) / 125000000000)
      ((4237438401 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((33525764086225133 : ℚ) / 10000000000000000000)
              hi := ((7952652778507529 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6655540329430303 : ℚ) / 100000000000000000)
              hi := ((-3100079868641719 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((4231437174275263 : ℚ) / 500000000000000000)
              hi := ((4938541940496771 : ℚ) / 500000000000000000) }
      im := { lo := ((-6087259276059181 : ℚ) / 1000000000000000000)
              hi := ((-2337441674368987 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-6537578307534771 : ℚ) / 5000000000000000000)
              hi := ((-3077557945835901 : ℚ) / 5000000000000000000) }
      im := { lo := ((92303281878739 : ℚ) / 50000000000000000)
              hi := ((634544759473537 : ℚ) / 250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8382530708076501 : ℚ) / 10000000000000000000)
              hi := ((3142457553791209 : ℚ) / 5000000000000000000) }
      im := { lo := ((-3191900853352567 : ℚ) / 10000000000000000000)
              hi := ((11024096125953429 : ℚ) / 10000000000000000000) } }
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

def s085_t3_sb026_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62000067433 : ℚ) / 1000000000000)
      ((-37442047 : ℚ) / 125000000000)
      ((4237438401 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((839894405628727 : ℚ) / 250000000000000000)
              hi := ((1989893815659311 : ℚ) / 250000000000000000) }
      im := { lo := ((-6653951270453597 : ℚ) / 100000000000000000)
              hi := ((-3099290551714753 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((8455675605049869 : ℚ) / 1000000000000000000)
              hi := ((9869663815252989 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6099501474443801 : ℚ) / 1000000000000000000)
              hi := ((-2343685336253221 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-13043961951600051 : ℚ) / 10000000000000000000)
              hi := ((-765526173431183 : ℚ) / 1250000000000000000) }
      im := { lo := ((2309310383625879 : ℚ) / 1250000000000000000)
              hi := ((25395344777286487 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1676253636032751 : ℚ) / 2000000000000000000)
              hi := ((6286061369739227 : ℚ) / 10000000000000000000) }
      im := { lo := ((-797923030220049 : ℚ) / 2500000000000000000)
              hi := ((11024019930598863 : ℚ) / 10000000000000000000) } }
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

def s085_t3_sb027_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62000067433 : ℚ) / 1000000000000)
      ((-37442047 : ℚ) / 125000000000)
      ((4237438401 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((33665979537689347 : ℚ) / 10000000000000000000)
              hi := ((1593303593202947 : ℚ) / 200000000000000000) }
      im := { lo := ((-1330472681957709 : ℚ) / 20000000000000000)
              hi := ((-6197003517951423 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((2112115121367393 : ℚ) / 250000000000000000)
              hi := ((123277834685421 : ℚ) / 12500000000000000) }
      im := { lo := ((-3055866972427351 : ℚ) / 500000000000000000)
              hi := ((-1174961970471131 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-3253186873526447 : ℚ) / 2500000000000000000)
              hi := ((-6093283727805117 : ℚ) / 10000000000000000000) }
      im := { lo := ((2311033302130981 : ℚ) / 1250000000000000000)
              hi := ((2540885466291643 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8380009832130327 : ℚ) / 10000000000000000000)
              hi := ((6287211032466949 : ℚ) / 10000000000000000000) }
      im := { lo := ((-797871737546357 : ℚ) / 2500000000000000000)
              hi := ((2755986802533453 : ℚ) / 2500000000000000000) } }
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

def s085_t3_sb028_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62000067433 : ℚ) / 1000000000000)
      ((-37442047 : ℚ) / 125000000000)
      ((4237438401 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((33736385498871553 : ℚ) / 10000000000000000000)
              hi := ((7973479657233553 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3325388305018407 : ℚ) / 50000000000000000)
              hi := ((-6195427142147663 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((8441229147992887 : ℚ) / 1000000000000000000)
              hi := ((2463693159787219 : ℚ) / 250000000000000000) }
      im := { lo := ((-1224791326017469 : ℚ) / 200000000000000000)
              hi := ((-471231495822739 : ℚ) / 100000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2596302596584409 : ℚ) / 2000000000000000000)
              hi := ((-3031169678417521 : ℚ) / 5000000000000000000) }
      im := { lo := ((9251003397795633 : ℚ) / 5000000000000000000)
              hi := ((25422319562521827 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-418937552651 : ℚ) / 500000000000000)
              hi := ((6288359488438399 : ℚ) / 10000000000000000000) }
      im := { lo := ((-15956386175831357 : ℚ) / 50000000000000000000)
              hi := ((11023869869585467 : ℚ) / 10000000000000000000) } }
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

def s085_t3_sb029_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62000067433 : ℚ) / 1000000000000)
      ((-37442047 : ℚ) / 125000000000)
      ((4237438401 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((1690350060215563 : ℚ) / 500000000000000000)
              hi := ((3990229841487839 : ℚ) / 500000000000000000) }
      im := { lo := ((-6649190816037419 : ℚ) / 100000000000000000)
              hi := ((-3096926015535921 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((1686796298599801 : ℚ) / 200000000000000000)
              hi := ((1969460303837687 : ℚ) / 200000000000000000) }
      im := { lo := ((-6136169056835469 : ℚ) / 1000000000000000000)
              hi := ((-944954470940459 : ℚ) / 200000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2590051481290049 : ℚ) / 2000000000000000000)
              hi := ((-241255093977643 : ℚ) / 400000000000000000) }
      im := { lo := ((9257852449027987 : ℚ) / 5000000000000000000)
              hi := ((5087147750473013 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8377487906799039 : ℚ) / 10000000000000000000)
              hi := ((3144751399268077 : ℚ) / 5000000000000000000) }
      im := { lo := ((-7977657099064561 : ℚ) / 25000000000000000000)
              hi := ((11023787772185857 : ℚ) / 10000000000000000000) } }
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

def s085_t3_sb030_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62000067433 : ℚ) / 1000000000000)
      ((-37442047 : ℚ) / 125000000000)
      ((4237438401 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((33877820705303543 : ℚ) / 10000000000000000000)
              hi := ((1996864649795033 : ℚ) / 250000000000000000) }
      im := { lo := ((-664760611655543 : ℚ) / 10000000000000000)
              hi := ((-6192278102678401 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((8426717400389363 : ℚ) / 1000000000000000000)
              hi := ((4919906788018227 : ℚ) / 500000000000000000) }
      im := { lo := ((-3074185509144141 : ℚ) / 500000000000000000)
              hi := ((-4737220223427009 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-6459490327776307 : ℚ) / 5000000000000000000)
              hi := ((-6000397977506889 : ℚ) / 10000000000000000000) }
      im := { lo := ((185293606981023 : ℚ) / 100000000000000000)
              hi := ((4071857952729 : ℚ) / 1600000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8376222092907411 : ℚ) / 10000000000000000000)
              hi := ((629064266345111 : ℚ) / 1000000000000000000) }
      im := { lo := ((-31908495987863667 : ℚ) / 100000000000000000000)
              hi := ((220474135100381 : ℚ) / 200000000000000000) } }
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

def s085_t3_sb031_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62000067433 : ℚ) / 1000000000000)
      ((-37442047 : ℚ) / 125000000000)
      ((4237438401 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((8487209010687027 : ℚ) / 2500000000000000000)
              hi := ((7994477170844871 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6646022637753311 : ℚ) / 100000000000000000)
              hi := ((-6190705232138231 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((1052429541697187 : ℚ) / 125000000000000000)
              hi := ((1966461874544637 : ℚ) / 200000000000000000) }
      im := { lo := ((-6160562865846559 : ℚ) / 1000000000000000000)
              hi := ((-474965816258819 : ℚ) / 100000000000000000) } }
  DrestRect :=
    { re := { lo := ((-6443842504963099 : ℚ) / 5000000000000000000)
              hi := ((-5969399091439597 : ℚ) / 10000000000000000000) }
      im := { lo := ((18542971844506023 : ℚ) / 10000000000000000000)
              hi := ((159140263780337 : ℚ) / 62500000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8374953244739263 : ℚ) / 10000000000000000000)
              hi := ((3145889359069547 : ℚ) / 5000000000000000000) }
      im := { lo := ((-255251402724763 : ℚ) / 800000000000000000)
              hi := ((11023631838536847 : ℚ) / 10000000000000000000) } }
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
    (hi : i ∈ positiveBoxSubboxesOf .s085_t3) :
    ProjectedJ0SubboxRectangleCertificateData
      ((positiveBoxCombinedCert .s085_t3).constants.mainLower)
      ((positiveBoxCombinedCert .s085_t3).constants.d0NegReUpper)
      ((positiveBoxCombinedCert .s085_t3).constants.restUpper) := by
  if h0 : i = .s085_t3_sb000 then
    exact s085_t3_sb000_certificateData
  else if h1 : i = .s085_t3_sb001 then
    exact s085_t3_sb001_certificateData
  else if h2 : i = .s085_t3_sb002 then
    exact s085_t3_sb002_certificateData
  else if h3 : i = .s085_t3_sb003 then
    exact s085_t3_sb003_certificateData
  else if h4 : i = .s085_t3_sb004 then
    exact s085_t3_sb004_certificateData
  else if h5 : i = .s085_t3_sb005 then
    exact s085_t3_sb005_certificateData
  else if h6 : i = .s085_t3_sb006 then
    exact s085_t3_sb006_certificateData
  else if h7 : i = .s085_t3_sb007 then
    exact s085_t3_sb007_certificateData
  else if h8 : i = .s085_t3_sb008 then
    exact s085_t3_sb008_certificateData
  else if h9 : i = .s085_t3_sb009 then
    exact s085_t3_sb009_certificateData
  else if h10 : i = .s085_t3_sb010 then
    exact s085_t3_sb010_certificateData
  else if h11 : i = .s085_t3_sb011 then
    exact s085_t3_sb011_certificateData
  else if h12 : i = .s085_t3_sb012 then
    exact s085_t3_sb012_certificateData
  else if h13 : i = .s085_t3_sb013 then
    exact s085_t3_sb013_certificateData
  else if h14 : i = .s085_t3_sb014 then
    exact s085_t3_sb014_certificateData
  else if h15 : i = .s085_t3_sb015 then
    exact s085_t3_sb015_certificateData
  else if h16 : i = .s085_t3_sb016 then
    exact s085_t3_sb016_certificateData
  else if h17 : i = .s085_t3_sb017 then
    exact s085_t3_sb017_certificateData
  else if h18 : i = .s085_t3_sb018 then
    exact s085_t3_sb018_certificateData
  else if h19 : i = .s085_t3_sb019 then
    exact s085_t3_sb019_certificateData
  else if h20 : i = .s085_t3_sb020 then
    exact s085_t3_sb020_certificateData
  else if h21 : i = .s085_t3_sb021 then
    exact s085_t3_sb021_certificateData
  else if h22 : i = .s085_t3_sb022 then
    exact s085_t3_sb022_certificateData
  else if h23 : i = .s085_t3_sb023 then
    exact s085_t3_sb023_certificateData
  else if h24 : i = .s085_t3_sb024 then
    exact s085_t3_sb024_certificateData
  else if h25 : i = .s085_t3_sb025 then
    exact s085_t3_sb025_certificateData
  else if h26 : i = .s085_t3_sb026 then
    exact s085_t3_sb026_certificateData
  else if h27 : i = .s085_t3_sb027 then
    exact s085_t3_sb027_certificateData
  else if h28 : i = .s085_t3_sb028 then
    exact s085_t3_sb028_certificateData
  else if h29 : i = .s085_t3_sb029 then
    exact s085_t3_sb029_certificateData
  else if h30 : i = .s085_t3_sb030 then
    exact s085_t3_sb030_certificateData
  else if h31 : i = .s085_t3_sb031 then
    exact s085_t3_sb031_certificateData
  else
    simp [positiveBoxSubboxesOf, h0, h1, h2, h3, h4, h5, h6, h7, h8, h9, h10, h11, h12, h13, h14, h15, h16, h17, h18, h19, h20, h21, h22, h23, h24, h25, h26, h27, h28, h29, h30, h31] at hi

end S085T3
end ProjectedJ0PositiveBoxRectangleData
end ProjectedJ0PositiveBoxSkeleton
end C2
