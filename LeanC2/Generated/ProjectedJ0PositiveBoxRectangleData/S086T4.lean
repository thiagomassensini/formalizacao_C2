import LeanC2.AuditProjectedJ0PositiveBoxRectangleCertificateSchema
import LeanC2.AuditProjectedJ0PositiveBoxAllSubboxSkeleton
import LeanC2.AuditAdjustedQuartetProjectedJ0PositiveBoxSectorRationalizedData

set_option linter.style.longLine false

/-!
# Generated rectangle data for s0.86_t4

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
namespace S086T4

open ProjectedJ0RectangleArithmetic

def s086_t4_sb000_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62241140357 : ℚ) / 1000000000000)
      ((-307402799 : ℚ) / 1000000000000)
      ((3849804851 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((9629752391917169 : ℚ) / 2000000000000000000)
              hi := ((4544868690987333 : ℚ) / 500000000000000000) }
      im := { lo := ((-1667502311034327 : ℚ) / 25000000000000000)
              hi := ((-31235418086979997 : ℚ) / 500000000000000000) } }
  D0Rect :=
    { re := { lo := ((7482095901530057 : ℚ) / 1000000000000000000)
              hi := ((4390942989433221 : ℚ) / 500000000000000000) }
      im := { lo := ((-564217967255111 : ℚ) / 100000000000000000)
              hi := ((-543008247814091 : ℚ) / 125000000000000000) } }
  DrestRect :=
    { re := { lo := ((-11318377944643187 : ℚ) / 10000000000000000000)
              hi := ((-1000565651435437 : ℚ) / 2000000000000000000) }
      im := { lo := ((2074267351490583 : ℚ) / 1250000000000000000)
              hi := ((2291069701504517 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-788263631447473 : ℚ) / 1000000000000000000)
              hi := ((5833954000709573 : ℚ) / 10000000000000000000) }
      im := { lo := ((-7036337061418301 : ℚ) / 25000000000000000000)
              hi := ((10457263516350987 : ℚ) / 10000000000000000000) } }
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

def s086_t4_sb001_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62241140357 : ℚ) / 1000000000000)
      ((-307402799 : ℚ) / 1000000000000)
      ((3849804851 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((2410636772243467 : ℚ) / 500000000000000000)
              hi := ((9096055383926067 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6668586345691041 : ℚ) / 100000000000000000)
              hi := ((-12491342984176823 : ℚ) / 200000000000000000) } }
  D0Rect :=
    { re := { lo := ((7475416607483471 : ℚ) / 1000000000000000000)
              hi := ((8775003720406169 : ℚ) / 1000000000000000000) }
      im := { lo := ((-2261211898284703 : ℚ) / 400000000000000000)
              hi := ((-2177572054756987 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1129025991905719 : ℚ) / 1000000000000000000)
              hi := ((-4974981195604243 : ℚ) / 10000000000000000000) }
      im := { lo := ((415147282933867 : ℚ) / 250000000000000000)
              hi := ((4584439036778307 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-3940687942744149 : ℚ) / 5000000000000000000)
              hi := ((5835082687227813 : ℚ) / 10000000000000000000) }
      im := { lo := ((-281427928174131 : ℚ) / 1000000000000000000)
              hi := ((5228598967821061 : ℚ) / 5000000000000000000) } }
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

def s086_t4_sb002_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62241140357 : ℚ) / 1000000000000)
      ((-307402799 : ℚ) / 1000000000000)
      ((3849804851 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((9655377542438533 : ℚ) / 2000000000000000000)
              hi := ((9102391099428139 : ℚ) / 1000000000000000000) }
      im := { lo := ((-333358228129027 : ℚ) / 5000000000000000)
              hi := ((-6244260416421519 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((3734361056082849 : ℚ) / 500000000000000000)
              hi := ((2192026770914761 : ℚ) / 250000000000000000) }
      im := { lo := ((-353991943907287 : ℚ) / 62500000000000000)
              hi := ((-2183106271718367 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2815531840773703 : ℚ) / 2500000000000000000)
              hi := ((-309194722676849 : ℚ) / 625000000000000000) }
      im := { lo := ((8308801107653137 : ℚ) / 5000000000000000000)
              hi := ((5733413937189329 : ℚ) / 2500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7880111828988837 : ℚ) / 10000000000000000000)
              hi := ((5836207065223713 : ℚ) / 10000000000000000000) }
      im := { lo := ((-2814023466197417 : ℚ) / 10000000000000000000)
              hi := ((522856597916073 : ℚ) / 500000000000000000) } }
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

def s086_t4_sb003_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62241140357 : ℚ) / 1000000000000)
      ((-307402799 : ℚ) / 1000000000000)
      ((3849804851 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((2417060921249531 : ℚ) / 500000000000000000)
              hi := ((4554372275562063 : ℚ) / 500000000000000000) }
      im := { lo := ((-1666435952242731 : ℚ) / 25000000000000000)
              hi := ((-3121425240138987 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((7462012954206711 : ℚ) / 1000000000000000000)
              hi := ((8761195573294533 : ℚ) / 1000000000000000000) }
      im := { lo := ((-283735158418273 : ℚ) / 50000000000000000)
              hi := ((-4377271809900179 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-280849443861597 : ℚ) / 250000000000000000)
              hi := ((-4919234038777219 : ℚ) / 10000000000000000000) }
      im := { lo := ((16629274067552027 : ℚ) / 10000000000000000000)
              hi := ((22945076108283253 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-196971240139133 : ℚ) / 250000000000000000)
              hi := ((5837332594862653 : ℚ) / 10000000000000000000) }
      im := { lo := ((-7034410467483201 : ℚ) / 25000000000000000000)
              hi := ((163391599903033 : ℚ) / 156250000000000000) } }
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

def s086_t4_sb004_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62241140357 : ℚ) / 1000000000000)
      ((-307402799 : ℚ) / 1000000000000)
      ((3849804851 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((4840571398464503 : ℚ) / 1000000000000000000)
              hi := ((91151170645659 : ℚ) / 10000000000000000) }
      im := { lo := ((-666432417422553 : ℚ) / 10000000000000000)
              hi := ((-156036040067351 : ℚ) / 2500000000000000) } }
  D0Rect :=
    { re := { lo := ((14910577210323227 : ℚ) / 2000000000000000000)
              hi := ((8754269745184087 : ℚ) / 1000000000000000000) }
      im := { lo := ((-355345362108511 : ℚ) / 62500000000000000)
              hi := ((-1097080505167247 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-448232477927477 : ℚ) / 400000000000000000)
              hi := ((-4891335881983697 : ℚ) / 10000000000000000000) }
      im := { lo := ((1040056603328407 : ℚ) / 625000000000000000)
              hi := ((22956457443826387 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7877594420776973 : ℚ) / 10000000000000000000)
              hi := ((116769289660097 : ℚ) / 200000000000000000) }
      im := { lo := ((-281350489161207 : ℚ) / 1000000000000000000)
              hi := ((5228496346590507 : ℚ) / 5000000000000000000) } }
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

def s086_t4_sb005_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62241140357 : ℚ) / 1000000000000)
      ((-307402799 : ℚ) / 1000000000000)
      ((3849804851 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((1211759326085819 : ℚ) / 250000000000000000)
              hi := ((912150874275007 : ℚ) / 100000000000000000) }
      im := { lo := ((-832863206207759 : ℚ) / 12500000000000000)
              hi := ((-6240033795523211 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((3724274706326941 : ℚ) / 500000000000000000)
              hi := ((437366463064433 : ℚ) / 50000000000000000) }
      im := { lo := ((-5696339592723381 : ℚ) / 1000000000000000000)
              hi := ((-4399362520234071 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-11177630989150427 : ℚ) / 10000000000000000000)
              hi := ((-48634201333063793 : ℚ) / 100000000000000000000) }
      im := { lo := ((16652496519827863 : ℚ) / 10000000000000000000)
              hi := ((2296780013754757 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7876348671948081 : ℚ) / 10000000000000000000)
              hi := ((583960512915169 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1406620726583283 : ℚ) / 5000000000000000000)
              hi := ((5228459365140079 : ℚ) / 5000000000000000000) } }
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

def s086_t4_sb006_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62241140357 : ℚ) / 1000000000000)
      ((-307402799 : ℚ) / 1000000000000)
      ((3849804851 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((2426760687335301 : ℚ) / 500000000000000000)
              hi := ((9127917744215699 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6661488255521701 : ℚ) / 100000000000000000)
              hi := ((-1559656758178879 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((3720897988937383 : ℚ) / 500000000000000000)
              hi := ((2185093389908757 : ℚ) / 250000000000000000) }
      im := { lo := ((-5707144174107293 : ℚ) / 1000000000000000000)
              hi := ((-2205196832851157 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2229886536703979 : ℚ) / 2000000000000000000)
              hi := ((-24177445585845647 : ℚ) / 50000000000000000000) }
      im := { lo := ((8332024521613831 : ℚ) / 5000000000000000000)
              hi := ((11489550897728171 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7875101714427373 : ℚ) / 10000000000000000000)
              hi := ((233629755574047 : ℚ) / 400000000000000000) }
      im := { lo := ((-562596457860081 : ℚ) / 2000000000000000000)
              hi := ((5228424459107621 : ℚ) / 5000000000000000000) } }
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

def s086_t4_sb007_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62241140357 : ℚ) / 1000000000000)
      ((-307402799 : ℚ) / 1000000000000)
      ((3849804851 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((1944009578568099 : ℚ) / 400000000000000000)
              hi := ((4567171888526569 : ℚ) / 500000000000000000) }
      im := { lo := ((-20812724704123 : ℚ) / 312500000000000)
              hi := ((-31186107081185757 : ℚ) / 500000000000000000) } }
  D0Rect :=
    { re := { lo := ((7435028140911977 : ℚ) / 1000000000000000000)
              hi := ((8733402810333487 : ℚ) / 1000000000000000000) }
      im := { lo := ((-2858969710736207 : ℚ) / 500000000000000000)
              hi := ((-2210707762038047 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-556060859080763 : ℚ) / 500000000000000000)
              hi := ((-4807542781060413 : ℚ) / 10000000000000000000) }
      im := { lo := ((4168890731875637 : ℚ) / 2500000000000000000)
              hi := ((287379532875143 : ℚ) / 125000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1968463146567171 : ℚ) / 2500000000000000000)
              hi := ((5841879799150061 : ℚ) / 10000000000000000000) }
      im := { lo := ((-1125088595466097 : ℚ) / 4000000000000000000)
              hi := ((5228388676320507 : ℚ) / 5000000000000000000) } }
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

def s086_t4_sb008_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62241140357 : ℚ) / 1000000000000)
      ((-307402799 : ℚ) / 1000000000000)
      ((3849804851 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((4866544292857309 : ℚ) / 1000000000000000000)
              hi := ((2285196881494957 : ℚ) / 250000000000000000) }
      im := { lo := ((-1331731325807137 : ℚ) / 20000000000000000)
              hi := ((-1247163383269269 : ℚ) / 20000000000000000) } }
  D0Rect :=
    { re := { lo := ((1485649176924097 : ℚ) / 200000000000000000)
              hi := ((8726417067201307 : ℚ) / 1000000000000000000) }
      im := { lo := ((-2864362510952619 : ℚ) / 500000000000000000)
              hi := ((-4432428372704283 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1109298381664179 : ℚ) / 1000000000000000000)
              hi := ((-47795819194867273 : ℚ) / 100000000000000000000) }
      im := { lo := ((8343519346523903 : ℚ) / 5000000000000000000)
              hi := ((11500791048636599 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-492037868281027 : ℚ) / 625000000000000000)
              hi := ((730377183143619 : ℚ) / 1250000000000000000) }
      im := { lo := ((-1124984474031573 : ℚ) / 4000000000000000000)
              hi := ((653544135397459 : ℚ) / 625000000000000000) } }
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

def s086_t4_sb009_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62241140357 : ℚ) / 1000000000000)
      ((-307402799 : ℚ) / 1000000000000)
      ((3849804851 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((4873080024641309 : ℚ) / 1000000000000000000)
              hi := ((9147251229613391 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6657242597744017 : ℚ) / 100000000000000000)
              hi := ((-31172066832102243 : ℚ) / 500000000000000000) } }
  D0Rect :=
    { re := { lo := ((92768105213193 : ℚ) / 12500000000000000)
              hi := ((8719417148037643 : ℚ) / 1000000000000000000) }
      im := { lo := ((-573950101969647 : ℚ) / 100000000000000000)
              hi := ((-4443432134203527 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1383091814996583 : ℚ) / 1250000000000000000)
              hi := ((-47516047055085677 : ℚ) / 100000000000000000000) }
      im := { lo := ((83492369972469 : ℚ) / 50000000000000000)
              hi := ((920510500390833 : ℚ) / 400000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-3935685267701771 : ℚ) / 5000000000000000000)
              hi := ((5844165868335189 : ℚ) / 10000000000000000000) }
      im := { lo := ((-1406103807189883 : ℚ) / 5000000000000000000)
              hi := ((10456641523794163 : ℚ) / 10000000000000000000) } }
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

def s086_t4_sb010_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62241140357 : ℚ) / 1000000000000)
      ((-307402799 : ℚ) / 1000000000000)
      ((3849804851 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((4879632584280863 : ℚ) / 1000000000000000000)
              hi := ((4469596507243 : ℚ) / 488281250000000) }
      im := { lo := ((-1663957453908299 : ℚ) / 25000000000000000)
              hi := ((-6233010765155093 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((7414635782473 : ℚ) / 1000000000000000)
              hi := ((348496121301669 : ℚ) / 40000000000000000) }
      im := { lo := ((-5750267729289131 : ℚ) / 1000000000000000000)
              hi := ((-556803305572409 : ℚ) / 125000000000000000) } }
  DrestRect :=
    { re := { lo := ((-5518235105362709 : ℚ) / 5000000000000000000)
              hi := ((-23618051713545157 : ℚ) / 50000000000000000000) }
      im := { lo := ((522183380112959 : ℚ) / 312500000000000000)
              hi := ((23023904469926973 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7870136397820919 : ℚ) / 10000000000000000000)
              hi := ((1461328807329987 : ℚ) / 2500000000000000000) }
      im := { lo := ((-3514953309126697 : ℚ) / 12500000000000000000)
              hi := ((522829246572947 : ℚ) / 500000000000000000) } }
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

def s086_t4_sb011_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62241140357 : ℚ) / 1000000000000)
      ((-307402799 : ℚ) / 1000000000000)
      ((3849804851 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((610775256912887 : ℚ) / 125000000000000000)
              hi := ((1832046892716369 : ℚ) / 200000000000000000) }
      im := { lo := ((-665441812268919 : ℚ) / 10000000000000000)
              hi := ((-15579023194884219 : ℚ) / 250000000000000000) } }
  D0Rect :=
    { re := { lo := ((14815617268253211 : ℚ) / 2000000000000000000)
              hi := ((8705374088276771 : ℚ) / 1000000000000000000) }
      im := { lo := ((-576102516331717 : ℚ) / 100000000000000000)
              hi := ((-4465411255304019 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2201637930789519 : ℚ) / 2000000000000000000)
              hi := ((-5869500206800473 : ℚ) / 12500000000000000000) }
      im := { lo := ((16721222869492953 : ℚ) / 10000000000000000000)
              hi := ((11517503131566573 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-157378182982469 : ℚ) / 200000000000000000)
              hi := ((5846470809700677 : ℚ) / 10000000000000000000) }
      im := { lo := ((-1405857320928237 : ℚ) / 5000000000000000000)
              hi := ((2091305037485859 : ℚ) / 2000000000000000000) } }
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

def s086_t4_sb012_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62241140357 : ℚ) / 1000000000000)
      ((-307402799 : ℚ) / 1000000000000)
      ((3849804851 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((4892790135663429 : ℚ) / 1000000000000000000)
              hi := ((9166752108410841 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1330601493457089 : ℚ) / 20000000000000000)
              hi := ((-1246041791155691 : ℚ) / 20000000000000000) } }
  D0Rect :=
    { re := { lo := ((3700483565754643 : ℚ) / 500000000000000000)
              hi := ((271822818028173 : ℚ) / 31250000000000000) }
      im := { lo := ((-1442943249478907 : ℚ) / 250000000000000000)
              hi := ((-8952773710877819 : ℚ) / 2000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2195978348822313 : ℚ) / 2000000000000000000)
              hi := ((-46675753779308723 : ℚ) / 100000000000000000000) }
      im := { lo := ((2091567393855263 : ℚ) / 1250000000000000000)
              hi := ((460921336160677 : ℚ) / 200000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-3933839462544877 : ℚ) / 5000000000000000000)
              hi := ((2923811368934803 : ℚ) / 5000000000000000000) }
      im := { lo := ((-14057326628807987 : ℚ) / 50000000000000000000)
              hi := ((10456464017516217 : ℚ) / 10000000000000000000) } }
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

def s086_t4_sb013_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62241140357 : ℚ) / 1000000000000)
      ((-307402799 : ℚ) / 1000000000000)
      ((3849804851 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((1224849223272933 : ℚ) / 250000000000000000)
              hi := ((2293321611874909 : ℚ) / 250000000000000000) }
      im := { lo := ((-665159789120003 : ℚ) / 10000000000000000)
              hi := ((-622880977312437 : ℚ) / 10000000000000000) } }
  D0Rect :=
    { re := { lo := ((14788222651290199 : ℚ) / 2000000000000000000)
              hi := ((1086408910525643 : ℚ) / 125000000000000000) }
      im := { lo := ((-5782511218698067 : ℚ) / 1000000000000000000)
              hi := ((-2243676606154113 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-10951576508105281 : ℚ) / 10000000000000000000)
              hi := ((-5799420120344077 : ℚ) / 12500000000000000000) }
      im := { lo := ((837190852798893 : ℚ) / 500000000000000000)
              hi := ((23057086012134567 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-3933222185146871 : ℚ) / 5000000000000000000)
              hi := ((5848769660964463 : ℚ) / 10000000000000000000) }
      im := { lo := ((-14056086995757787 : ℚ) / 50000000000000000000)
              hi := ((130705051619073 : ℚ) / 125000000000000000) } }
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

def s086_t4_sb014_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62241140357 : ℚ) / 1000000000000)
      ((-307402799 : ℚ) / 1000000000000)
      ((3849804851 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((4906021981065149 : ℚ) / 1000000000000000000)
              hi := ((573739862733329 : ℚ) / 62500000000000000) }
      im := { lo := ((-6650189316631973 : ℚ) / 100000000000000000)
              hi := ((-3113705899448741 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((923405045785837 : ℚ) / 125000000000000000)
              hi := ((8684198280444139 : ℚ) / 1000000000000000000) }
      im := { lo := ((-362077470356479 : ℚ) / 62500000000000000)
              hi := ((-2249155295459217 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1092324505105987 : ℚ) / 1000000000000000000)
              hi := ((-46114813119364453 : ℚ) / 100000000000000000000) }
      im := { lo := ((8377527404948271 : ℚ) / 5000000000000000000)
              hi := ((11534032803392567 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-786520530286229 : ℚ) / 1000000000000000000)
              hi := ((292495569930629 : ℚ) / 500000000000000000) }
      im := { lo := ((-281096542731599 : ℚ) / 1000000000000000000)
              hi := ((10456340082580257 : ℚ) / 10000000000000000000) } }
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

def s086_t4_sb015_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62241140357 : ℚ) / 1000000000000)
      ((-307402799 : ℚ) / 1000000000000)
      ((3849804851 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((196506618206399 : ℚ) / 40000000000000000)
              hi := ((918640609965159 : ℚ) / 100000000000000000) }
      im := { lo := ((-831097724606579 : ℚ) / 12500000000000000)
              hi := ((-7782518738128223 : ℚ) / 125000000000000000) } }
  D0Rect :=
    { re := { lo := ((14760709801084149 : ℚ) / 2000000000000000000)
              hi := ((4338555274556173 : ℚ) / 500000000000000000) }
      im := { lo := ((-5803957921638881 : ℚ) / 1000000000000000000)
              hi := ((-56365736842671 : ℚ) / 12500000000000000) } }
  DrestRect :=
    { re := { lo := ((-5447448076587103 : ℚ) / 5000000000000000000)
              hi := ((-45834123688179117 : ℚ) / 100000000000000000000) }
      im := { lo := ((8383127035219909 : ℚ) / 5000000000000000000)
              hi := ((1153950194605483 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-491497717496957 : ℚ) / 625000000000000000)
              hi := ((5851049708435997 : ℚ) / 10000000000000000000) }
      im := { lo := ((-2810713533493907 : ℚ) / 10000000000000000000)
              hi := ((2091255200926663 : ℚ) / 2000000000000000000) } }
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

def s086_t4_sb016_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62241140357 : ℚ) / 1000000000000)
      ((-307402799 : ℚ) / 1000000000000)
      ((3849804851 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((1229831585894057 : ℚ) / 250000000000000000)
              hi := ((2298248069512851 : ℚ) / 250000000000000000) }
      im := { lo := ((-3323687683157387 : ℚ) / 50000000000000000)
              hi := ((-6224619315024663 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((3686727319114533 : ℚ) / 500000000000000000)
              hi := ((8670008409460203 : ℚ) / 1000000000000000000) }
      im := { lo := ((-5814666549249091 : ℚ) / 1000000000000000000)
              hi := ((-4520198103117271 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1358316369863523 : ℚ) / 1250000000000000000)
              hi := ((-22776641182971897 : ℚ) / 50000000000000000000) }
      im := { lo := ((4194353411013039 : ℚ) / 2500000000000000000)
              hi := ((23089902027714987 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-3931361725632431 : ℚ) / 5000000000000000000)
              hi := ((1170437828253007 : ℚ) / 2000000000000000000) }
      im := { lo := ((-2810460888174227 : ℚ) / 10000000000000000000)
              hi := ((5228105532961789 : ℚ) / 5000000000000000000) } }
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

def s086_t4_sb017_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62241140357 : ℚ) / 1000000000000)
      ((-307402799 : ℚ) / 1000000000000)
      ((3849804851 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((4926005529245511 : ℚ) / 1000000000000000000)
              hi := ((2299898864771221 : ℚ) / 250000000000000000) }
      im := { lo := ((-6645969939116161 : ℚ) / 100000000000000000)
              hi := ((-12446449726383181 : ℚ) / 200000000000000000) } }
  D0Rect :=
    { re := { lo := ((92081748242691 : ℚ) / 12500000000000000)
              hi := ((346515663501821 : ℚ) / 40000000000000000) }
      im := { lo := ((-2912682684763787 : ℚ) / 500000000000000000)
              hi := ((-2265564025891051 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-10838148875988581 : ℚ) / 10000000000000000000)
              hi := ((-452722959270303 : ℚ) / 1000000000000000000) }
      im := { lo := ((16788534283127743 : ℚ) / 10000000000000000000)
              hi := ((2310075917978559 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1572296442948559 : ℚ) / 2000000000000000000)
              hi := ((5853326695379563 : ℚ) / 10000000000000000000) }
      im := { lo := ((-281020330474897 : ℚ) / 1000000000000000000)
              hi := ((1045614108115011 : ℚ) / 1000000000000000000) } }
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

def s086_t4_sb018_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62241140357 : ℚ) / 1000000000000)
      ((-307402799 : ℚ) / 1000000000000)
      ((3849804851 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((2466351378972739 : ℚ) / 500000000000000000)
              hi := ((4603107933777849 : ℚ) / 500000000000000000) }
      im := { lo := ((-6644565538394777 : ℚ) / 100000000000000000)
              hi := ((-6221831615795501 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((1839902503409329 : ℚ) / 250000000000000000)
              hi := ((8655760677850129 : ℚ) / 1000000000000000000) }
      im := { lo := ((-5836054368323807 : ℚ) / 1000000000000000000)
              hi := ((-4542048768645267 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2161950241676573 : ℚ) / 2000000000000000000)
              hi := ((-4499115278384659 : ℚ) / 10000000000000000000) }
      im := { lo := ((8399807198816967 : ℚ) / 5000000000000000000)
              hi := ((5777894229750841 : ℚ) / 2500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1572047599124111 : ℚ) / 2000000000000000000)
              hi := ((5854460596401191 : ℚ) / 10000000000000000000) }
      im := { lo := ((-7024853192829191 : ℚ) / 25000000000000000000)
              hi := ((10456066545011323 : ℚ) / 10000000000000000000) } }
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

def s086_t4_sb019_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62241140357 : ℚ) / 1000000000000)
      ((-307402799 : ℚ) / 1000000000000)
      ((3849804851 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((246970907671863 : ℚ) / 50000000000000000)
              hi := ((1842570669967207 : ℚ) / 200000000000000000) }
      im := { lo := ((-3321581101877933 : ℚ) / 50000000000000000)
              hi := ((-12440879072396241 : ℚ) / 200000000000000000) } }
  D0Rect :=
    { re := { lo := ((1838166307614341 : ℚ) / 250000000000000000)
              hi := ((8648615571483937 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1461683419665381 : ℚ) / 250000000000000000)
              hi := ((-2276480042480603 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-539066908229767 : ℚ) / 500000000000000000)
              hi := ((-4470985183940583 : ℚ) / 10000000000000000000) }
      im := { lo := ((8405326984848193 : ℚ) / 5000000000000000000)
              hi := ((144514720114871 : ℚ) / 62500000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1571797878823991 : ℚ) / 2000000000000000000)
              hi := ((2927794723032067 : ℚ) / 5000000000000000000) }
      im := { lo := ((-1123870898355519 : ℚ) / 4000000000000000000)
              hi := ((10455989898719119 : ℚ) / 10000000000000000000) } }
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

def s086_t4_sb020_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62241140357 : ℚ) / 1000000000000)
      ((-307402799 : ℚ) / 1000000000000)
      ((3849804851 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((4946151975627727 : ℚ) / 1000000000000000000)
              hi := ((36878030544131 : ℚ) / 4000000000000000) }
      im := { lo := ((-6641759981120339 : ℚ) / 100000000000000000)
              hi := ((-6219048586585069 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((459106636144407 : ℚ) / 62500000000000000)
              hi := ((4320727812039929 : ℚ) / 500000000000000000) }
      im := { lo := ((-5857403174120689 : ℚ) / 1000000000000000000)
              hi := ((-285241380412727 : ℚ) / 62500000000000000) } }
  DrestRect :=
    { re := { lo := ((-672056757070129 : ℚ) / 625000000000000000)
              hi := ((-4442841052515773 : ℚ) / 10000000000000000000) }
      im := { lo := ((4205413749851353 : ℚ) / 2500000000000000000)
              hi := ((2891636503552003 : ℚ) / 1250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-392886854039393 : ℚ) / 500000000000000000)
              hi := ((5856713915084709 : ℚ) / 10000000000000000000) }
      im := { lo := ((-140470802789957 : ℚ) / 500000000000000000)
              hi := ((1045591599034093 : ℚ) / 1000000000000000000) } }
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

def s086_t4_sb021_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62241140357 : ℚ) / 1000000000000)
      ((-307402799 : ℚ) / 1000000000000)
      ((3849804851 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((2476452036126233 : ℚ) / 500000000000000000)
              hi := ((2306544710705201 : ℚ) / 250000000000000000) }
      im := { lo := ((-3320179397191577 : ℚ) / 50000000000000000)
              hi := ((-6217658842702321 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((3669366326755107 : ℚ) / 500000000000000000)
              hi := ((269821283419279 : ℚ) / 31250000000000000) }
      im := { lo := ((-1173612594918503 : ℚ) / 200000000000000000)
              hi := ((-114368865411511 : ℚ) / 25000000000000000) } }
  DrestRect :=
    { re := { lo := ((-214489239149101 : ℚ) / 200000000000000000)
              hi := ((-44146820984086233 : ℚ) / 100000000000000000000) }
      im := { lo := ((16832616575341347 : ℚ) / 10000000000000000000)
              hi := ((11571894112837539 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-982060314049607 : ℚ) / 1250000000000000000)
              hi := ((585783546173737 : ℚ) / 1000000000000000000) }
      im := { lo := ((-702287711195981 : ℚ) / 2500000000000000000)
              hi := ((2091167591277851 : ℚ) / 2000000000000000000) } }
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

def s086_t4_sb022_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62241140357 : ℚ) / 1000000000000)
      ((-307402799 : ℚ) / 1000000000000)
      ((3849804851 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((4959674236173973 : ℚ) / 1000000000000000000)
              hi := ((9232867177090431 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6638958646323129 : ℚ) / 100000000000000000)
              hi := ((-3108135153301477 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((3665872021850233 : ℚ) / 500000000000000000)
              hi := ((4313546269105171 : ℚ) / 500000000000000000) }
      im := { lo := ((-2939356484626751 : ℚ) / 500000000000000000)
              hi := ((-9171275489955057 : ℚ) / 2000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-10696000820306143 : ℚ) / 10000000000000000000)
              hi := ((-2193253649847791 : ℚ) / 5000000000000000000) }
      im := { lo := ((16843537156801583 : ℚ) / 10000000000000000000)
              hi := ((463088905903699 : ℚ) / 200000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1963805993211341 : ℚ) / 2500000000000000000)
              hi := ((5858952369825449 : ℚ) / 10000000000000000000) }
      im := { lo := ((-561776221855899 : ℚ) / 2000000000000000000)
              hi := ((5227877647347143 : ℚ) / 5000000000000000000) } }
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

def s086_t4_sb023_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62241140357 : ℚ) / 1000000000000)
      ((-307402799 : ℚ) / 1000000000000)
      ((3849804851 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((4966462997532393 : ℚ) / 1000000000000000000)
              hi := ((577473256211023 : ℚ) / 62500000000000000) }
      im := { lo := ((-3318779771912963 : ℚ) / 50000000000000000)
              hi := ((-1553720744447681 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((7324741028999933 : ℚ) / 1000000000000000000)
              hi := ((8619889384156379 : ℚ) / 1000000000000000000) }
      im := { lo := ((-294467646380069 : ℚ) / 50000000000000000)
              hi := ((-919302332458203 : ℚ) / 200000000000000000) } }
  DrestRect :=
    { re := { lo := ((-5333761389214077 : ℚ) / 5000000000000000000)
              hi := ((-2179159354393443 : ℚ) / 5000000000000000000) }
      im := { lo := ((2106802373963103 : ℚ) / 1250000000000000000)
              hi := ((2316506095290671 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1963490284959201 : ℚ) / 2500000000000000000)
              hi := ((732508039597149 : ℚ) / 1250000000000000000) }
      im := { lo := ((-5617220102141937 : ℚ) / 20000000000000000000)
              hi := ((5227835604620591 : ℚ) / 5000000000000000000) } }
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

def s086_t4_sb024_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62241140357 : ℚ) / 1000000000000)
      ((-307402799 : ℚ) / 1000000000000)
      ((3849804851 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((4973269512209163 : ℚ) / 1000000000000000000)
              hi := ((4623147183887263 : ℚ) / 500000000000000000) }
      im := { lo := ((-1659040388531121 : ℚ) / 25000000000000000)
              hi := ((-6213496789318653 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((1829430880148361 : ℚ) / 250000000000000000)
              hi := ((2153167930855209 : ℚ) / 250000000000000000) }
      im := { lo := ((-11799965891407499 : ℚ) / 2000000000000000000)
              hi := ((-4607376229237631 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-5319514216005827 : ℚ) / 5000000000000000000)
              hi := ((-2165057923075773 : ℚ) / 5000000000000000000) }
      im := { lo := ((16865261524067487 : ℚ) / 10000000000000000000)
              hi := ((4635127141143649 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7852697751416777 : ℚ) / 10000000000000000000)
              hi := ((1172235009044331 : ℚ) / 2000000000000000000) }
      im := { lo := ((-14041700394831327 : ℚ) / 50000000000000000000)
              hi := ((5227794053850787 : ℚ) / 5000000000000000000) } }
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

def s086_t4_sb025_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62241140357 : ℚ) / 1000000000000)
      ((-307402799 : ℚ) / 1000000000000)
      ((3849804851 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((4980094360682153 : ℚ) / 1000000000000000000)
              hi := ((46265167203703 : ℚ) / 5000000000000000) }
      im := { lo := ((-6634764641535491 : ℚ) / 100000000000000000)
              hi := ((-3106055892042477 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((58485534201867 : ℚ) / 8000000000000000)
              hi := ((860543931358111 : ℚ) / 100000000000000000) }
      im := { lo := ((-5910603837929939 : ℚ) / 1000000000000000000)
              hi := ((-4618230596040893 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-331578736834263 : ℚ) / 312500000000000000)
              hi := ((-21509485003474947 : ℚ) / 50000000000000000000) }
      im := { lo := ((843803182231677 : ℚ) / 500000000000000000)
              hi := ((11593085305041013 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1962857793005419 : ℚ) / 2500000000000000000)
              hi := ((1172456383462563 : ℚ) / 2000000000000000000) }
      im := { lo := ((-561613068760093 : ℚ) / 2000000000000000000)
              hi := ((2613875035979367 : ℚ) / 2500000000000000000) } }
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

def s086_t4_sb026_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62241140357 : ℚ) / 1000000000000)
      ((-307402799 : ℚ) / 1000000000000)
      ((3849804851 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((1246734381308931 : ℚ) / 250000000000000000)
              hi := ((2314947326052801 : ℚ) / 250000000000000000) }
      im := { lo := ((-1658342207600027 : ℚ) / 25000000000000000)
              hi := ((-15526819849089591 : ℚ) / 250000000000000000) } }
  D0Rect :=
    { re := { lo := ((7303645763756081 : ℚ) / 1000000000000000000)
              hi := ((859819223132321 : ℚ) / 100000000000000000) }
      im := { lo := ((-1480303911698267 : ℚ) / 250000000000000000)
              hi := ((-4629074692832597 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1322749569393183 : ℚ) / 1250000000000000000)
              hi := ((-8547323944464799 : ℚ) / 20000000000000000000) }
      im := { lo := ((1688682509260877 : ℚ) / 1000000000000000000)
              hi := ((57991664832077 : ℚ) / 25000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7850160544424699 : ℚ) / 10000000000000000000)
              hi := ((2931692038075797 : ℚ) / 5000000000000000000) }
      im := { lo := ((-14038936144121383 : ℚ) / 50000000000000000000)
              hi := ((653463043830293 : ℚ) / 625000000000000000) } }
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

def s086_t4_sb027_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62241140357 : ℚ) / 1000000000000)
      ((-307402799 : ℚ) / 1000000000000)
      ((3849804851 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((4993798552555249 : ℚ) / 1000000000000000000)
              hi := ((9266562379333513 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1657993529842847 : ℚ) / 25000000000000000)
              hi := ((-6209345262720681 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((7296585581632129 : ℚ) / 1000000000000000000)
              hi := ((4295465190910591 : ℚ) / 500000000000000000) }
      im := { lo := ((-5931817635502621 : ℚ) / 1000000000000000000)
              hi := ((-1159977300161891 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-10553457257399261 : ℚ) / 10000000000000000000)
              hi := ((-42454129544205343 : ℚ) / 100000000000000000000) }
      im := { lo := ((16897547582972437 : ℚ) / 10000000000000000000)
              hi := ((11603559925942653 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1962222580416313 : ℚ) / 2500000000000000000)
              hi := ((1466121494389969 : ℚ) / 2500000000000000000) }
      im := { lo := ((-1403754147914687 : ℚ) / 5000000000000000000)
              hi := ((10455316342862467 : ℚ) / 10000000000000000000) } }
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

def s086_t4_sb028_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62241140357 : ℚ) / 1000000000000)
      ((-307402799 : ℚ) / 1000000000000)
      ((3849804851 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((625084462478049 : ℚ) / 125000000000000000)
              hi := ((927335445221659 : ℚ) / 100000000000000000) }
      im := { lo := ((-6630580541765173 : ℚ) / 100000000000000000)
              hi := ((-15519909315701479 : ℚ) / 250000000000000000) } }
  D0Rect :=
    { re := { lo := ((14579022068222423 : ℚ) / 2000000000000000000)
              hi := ((8583654004737639 : ℚ) / 1000000000000000000) }
      im := { lo := ((-2971204793615501 : ℚ) / 500000000000000000)
              hi := ((-581341787716193 : ℚ) / 125000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1315612708626877 : ℚ) / 1250000000000000000)
              hi := ((-4217150105160861 : ℚ) / 10000000000000000000) }
      im := { lo := ((16908230937972837 : ℚ) / 10000000000000000000)
              hi := ((11608766267375461 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-490476993496813 : ℚ) / 625000000000000000)
              hi := ((5865599009922119 : ℚ) / 10000000000000000000) }
      im := { lo := ((-2807227590521587 : ℚ) / 10000000000000000000)
              hi := ((65345138228319 : ℚ) / 62500000000000000) } }
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

def s086_t4_sb029_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62241140357 : ℚ) / 1000000000000)
      ((-307402799 : ℚ) / 1000000000000)
      ((3849804851 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((625945757848889 : ℚ) / 125000000000000000)
              hi := ((4640084169190333 : ℚ) / 500000000000000000) }
      im := { lo := ((-662918824588291 : ℚ) / 10000000000000000)
              hi := ((-31032915895716183 : ℚ) / 500000000000000000) } }
  D0Rect :=
    { re := { lo := ((582593758714103 : ℚ) / 80000000000000000)
              hi := ((8576363247938961 : ℚ) / 1000000000000000000) }
      im := { lo := ((-5952991455228621 : ℚ) / 1000000000000000000)
              hi := ((-2330775002331769 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2099266011607911 : ℚ) / 2000000000000000000)
              hi := ((-1309022887624893 : ℚ) / 3125000000000000000) }
      im := { lo := ((3383774958644847 : ℚ) / 2000000000000000000)
              hi := ((11613952141859723 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1961600566352631 : ℚ) / 2500000000000000000)
              hi := ((1466685044250069 : ℚ) / 2500000000000000000) }
      im := { lo := ((-28069496375535103 : ℚ) / 100000000000000000000)
              hi := ((1045513054443883 : ℚ) / 1000000000000000000) } }
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

def s086_t4_sb030_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62241140357 : ℚ) / 1000000000000)
      ((-307402799 : ℚ) / 1000000000000)
      ((3849804851 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((100289447153729 : ℚ) / 20000000000000000)
              hi := ((2321750293506337 : ℚ) / 250000000000000000) }
      im := { lo := ((-1325559421680797 : ℚ) / 20000000000000000)
              hi := ((-31026018775438133 : ℚ) / 500000000000000000) } }
  D0Rect :=
    { re := { lo := ((1455063672574461 : ℚ) / 200000000000000000)
              hi := ((8569058228107041 : ℚ) / 1000000000000000000) }
      im := { lo := ((-5963563533358401 : ℚ) / 1000000000000000000)
              hi := ((-584044497182823 : ℚ) / 125000000000000000) } }
  DrestRect :=
    { re := { lo := ((-10467743556909163 : ℚ) / 10000000000000000000)
              hi := ((-20802906899872867 : ℚ) / 50000000000000000000) }
      im := { lo := ((846473911166657 : ℚ) / 500000000000000000)
              hi := ((464764720241289 : ℚ) / 200000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7845182953609903 : ℚ) / 10000000000000000000)
              hi := ((2933945504519151 : ℚ) / 5000000000000000000) }
      im := { lo := ((-14033347945411733 : ℚ) / 50000000000000000000)
              hi := ((2091007356699441 : ℚ) / 2000000000000000000) } }
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

def s086_t4_sb031_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((62241140357 : ℚ) / 1000000000000)
      ((-307402799 : ℚ) / 1000000000000)
      ((3849804851 : ℚ) / 1000000000000) where
  MRect :=
    { re := { lo := ((2510698527542057 : ℚ) / 500000000000000000)
              hi := ((9293850704535023 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3313203528674409 : ℚ) / 50000000000000000)
              hi := ((-6203825533197849 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((1453640128492761 : ℚ) / 200000000000000000)
              hi := ((8561738482555013 : ℚ) / 1000000000000000000) }
      im := { lo := ((-5974125864375347 : ℚ) / 1000000000000000000)
              hi := ((-585394017856361 : ℚ) / 125000000000000000) } }
  DrestRect :=
    { re := { lo := ((-10439141376735199 : ℚ) / 10000000000000000000)
              hi := ((-20661376944317833 : ℚ) / 50000000000000000000) }
      im := { lo := ((847002117830627 : ℚ) / 500000000000000000)
              hi := ((23248526533225537 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7843960646979851 : ℚ) / 10000000000000000000)
              hi := ((2934519090158601 : ℚ) / 5000000000000000000) }
      im := { lo := ((-14031936895081 : ℚ) / 50000000000000000)
              hi := ((163358449533043 : ℚ) / 156250000000000000) } }
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
    (hi : i ∈ positiveBoxSubboxesOf .s086_t4) :
    ProjectedJ0SubboxRectangleCertificateData
      ((positiveBoxCombinedCert .s086_t4).constants.mainLower)
      ((positiveBoxCombinedCert .s086_t4).constants.d0NegReUpper)
      ((positiveBoxCombinedCert .s086_t4).constants.restUpper) := by
  if h0 : i = .s086_t4_sb000 then
    exact s086_t4_sb000_certificateData
  else if h1 : i = .s086_t4_sb001 then
    exact s086_t4_sb001_certificateData
  else if h2 : i = .s086_t4_sb002 then
    exact s086_t4_sb002_certificateData
  else if h3 : i = .s086_t4_sb003 then
    exact s086_t4_sb003_certificateData
  else if h4 : i = .s086_t4_sb004 then
    exact s086_t4_sb004_certificateData
  else if h5 : i = .s086_t4_sb005 then
    exact s086_t4_sb005_certificateData
  else if h6 : i = .s086_t4_sb006 then
    exact s086_t4_sb006_certificateData
  else if h7 : i = .s086_t4_sb007 then
    exact s086_t4_sb007_certificateData
  else if h8 : i = .s086_t4_sb008 then
    exact s086_t4_sb008_certificateData
  else if h9 : i = .s086_t4_sb009 then
    exact s086_t4_sb009_certificateData
  else if h10 : i = .s086_t4_sb010 then
    exact s086_t4_sb010_certificateData
  else if h11 : i = .s086_t4_sb011 then
    exact s086_t4_sb011_certificateData
  else if h12 : i = .s086_t4_sb012 then
    exact s086_t4_sb012_certificateData
  else if h13 : i = .s086_t4_sb013 then
    exact s086_t4_sb013_certificateData
  else if h14 : i = .s086_t4_sb014 then
    exact s086_t4_sb014_certificateData
  else if h15 : i = .s086_t4_sb015 then
    exact s086_t4_sb015_certificateData
  else if h16 : i = .s086_t4_sb016 then
    exact s086_t4_sb016_certificateData
  else if h17 : i = .s086_t4_sb017 then
    exact s086_t4_sb017_certificateData
  else if h18 : i = .s086_t4_sb018 then
    exact s086_t4_sb018_certificateData
  else if h19 : i = .s086_t4_sb019 then
    exact s086_t4_sb019_certificateData
  else if h20 : i = .s086_t4_sb020 then
    exact s086_t4_sb020_certificateData
  else if h21 : i = .s086_t4_sb021 then
    exact s086_t4_sb021_certificateData
  else if h22 : i = .s086_t4_sb022 then
    exact s086_t4_sb022_certificateData
  else if h23 : i = .s086_t4_sb023 then
    exact s086_t4_sb023_certificateData
  else if h24 : i = .s086_t4_sb024 then
    exact s086_t4_sb024_certificateData
  else if h25 : i = .s086_t4_sb025 then
    exact s086_t4_sb025_certificateData
  else if h26 : i = .s086_t4_sb026 then
    exact s086_t4_sb026_certificateData
  else if h27 : i = .s086_t4_sb027 then
    exact s086_t4_sb027_certificateData
  else if h28 : i = .s086_t4_sb028 then
    exact s086_t4_sb028_certificateData
  else if h29 : i = .s086_t4_sb029 then
    exact s086_t4_sb029_certificateData
  else if h30 : i = .s086_t4_sb030 then
    exact s086_t4_sb030_certificateData
  else if h31 : i = .s086_t4_sb031 then
    exact s086_t4_sb031_certificateData
  else
    simp [positiveBoxSubboxesOf, h0, h1, h2, h3, h4, h5, h6, h7, h8, h9, h10, h11, h12, h13, h14, h15, h16, h17, h18, h19, h20, h21, h22, h23, h24, h25, h26, h27, h28, h29, h30, h31] at hi

end S086T4
end ProjectedJ0PositiveBoxRectangleData
end ProjectedJ0PositiveBoxSkeleton
end C2
