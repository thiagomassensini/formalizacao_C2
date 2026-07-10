import LeanC2.AuditProjectedJ0PositiveBoxRectangleCertificateSchema
import LeanC2.AuditProjectedJ0PositiveBoxAllSubboxSkeleton
import LeanC2.AuditAdjustedQuartetProjectedJ0PositiveBoxSectorRationalizedData

set_option linter.style.longLine false

/-!
# Generated rectangle data for s0.86_t1

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
namespace S086T1

open ProjectedJ0RectangleArithmetic

def s086_t1_sb000_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63914836093 : ℚ) / 1000000000000)
      ((-8956913 : ℚ) / 40000000000)
      ((77866821 : ℚ) / 20000000000) where
  MRect :=
    { re := { lo := ((2090021771424061 : ℚ) / 500000000000000000)
              hi := ((8462431705932779 : ℚ) / 1000000000000000000) }
      im := { lo := ((-273918327130393 : ℚ) / 4000000000000000)
              hi := ((-802980619687289 : ℚ) / 12500000000000000) } }
  D0Rect :=
    { re := { lo := ((817278278489191 : ℚ) / 100000000000000000)
              hi := ((2374261143911953 : ℚ) / 250000000000000000) }
      im := { lo := ((-4279217911783511 : ℚ) / 1000000000000000000)
              hi := ((-14769988894800367 : ℚ) / 5000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1819337987896327 : ℚ) / 1250000000000000000)
              hi := ((-8209830003618443 : ℚ) / 10000000000000000000) }
      im := { lo := ((149052526057417 : ℚ) / 100000000000000000)
              hi := ((2124971843482069 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8030191128576211 : ℚ) / 10000000000000000000)
              hi := ((5689664081022641 : ℚ) / 10000000000000000000) }
      im := { lo := ((-28448494228350437 : ℚ) / 100000000000000000000)
              hi := ((1307946851856349 : ℚ) / 1250000000000000000) } }
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

def s086_t1_sb001_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63914836093 : ℚ) / 1000000000000)
      ((-8956913 : ℚ) / 40000000000)
      ((77866821 : ℚ) / 20000000000) where
  MRect :=
    { re := { lo := ((418421605545811 : ℚ) / 100000000000000000)
              hi := ((211664408159433 : ℚ) / 25000000000000000) }
      im := { lo := ((-171160537059747 : ℚ) / 2500000000000000)
              hi := ((-1284463358022403 : ℚ) / 20000000000000000) } }
  D0Rect :=
    { re := { lo := ((4083979940570517 : ℚ) / 500000000000000000)
              hi := ((593251203457609 : ℚ) / 62500000000000000) }
      im := { lo := ((-4291023732687227 : ℚ) / 1000000000000000000)
              hi := ((-14830157030579381 : ℚ) / 5000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-7264494690203461 : ℚ) / 5000000000000000000)
              hi := ((-2046084755993223 : ℚ) / 2500000000000000000) }
      im := { lo := ((3730385939301047 : ℚ) / 2500000000000000000)
              hi := ((2126579645502277 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8029048717468547 : ℚ) / 10000000000000000000)
              hi := ((5690997501648957 : ℚ) / 10000000000000000000) }
      im := { lo := ((-355575752542761 : ℚ) / 1250000000000000000)
              hi := ((2615885975153401 : ℚ) / 2500000000000000000) } }
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

def s086_t1_sb002_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63914836093 : ℚ) / 1000000000000)
      ((-8956913 : ℚ) / 40000000000)
      ((77866821 : ℚ) / 20000000000) where
  MRect :=
    { re := { lo := ((4188407695531327 : ℚ) / 1000000000000000000)
              hi := ((4235369740744027 : ℚ) / 500000000000000000) }
      im := { lo := ((-684488557976549 : ℚ) / 10000000000000000)
              hi := ((-3210394746565811 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((8163121116923607 : ℚ) / 1000000000000000000)
              hi := ((1897395524155053 : ℚ) / 200000000000000000) }
      im := { lo := ((-1075705661410893 : ℚ) / 250000000000000000)
              hi := ((-1489029267521581 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-725162532320189 : ℚ) / 500000000000000000)
              hi := ((-2039706569014789 : ℚ) / 2500000000000000000) }
      im := { lo := ((7468899938580047 : ℚ) / 5000000000000000000)
              hi := ((532045925987623 : ℚ) / 250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8027906765230151 : ℚ) / 10000000000000000000)
              hi := ((711541327018079 : ℚ) / 1250000000000000000) }
      im := { lo := ((-1422180919362679 : ℚ) / 5000000000000000000)
              hi := ((5231755976817733 : ℚ) / 5000000000000000000) } }
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

def s086_t1_sb003_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63914836093 : ℚ) / 1000000000000)
      ((-8956913 : ℚ) / 40000000000)
      ((77866821 : ℚ) / 20000000000) where
  MRect :=
    { re := { lo := ((4192617979380371 : ℚ) / 1000000000000000000)
              hi := ((8474921565403101 : ℚ) / 1000000000000000000) }
      im := { lo := ((-342167528482273 : ℚ) / 5000000000000000)
              hi := ((-6419262972841079 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((4079133339663251 : ℚ) / 500000000000000000)
              hi := ((948191951935077 : ℚ) / 100000000000000000) }
      im := { lo := ((-2157308010760677 : ℚ) / 500000000000000000)
              hi := ((-29900777498342093 : ℚ) / 10000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-3619372764518737 : ℚ) / 2500000000000000000)
              hi := ((-203332213400911 : ℚ) / 250000000000000000) }
      im := { lo := ((3738504594418117 : ℚ) / 2500000000000000000)
              hi := ((2129784272858463 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-802676603963019 : ℚ) / 1000000000000000000)
              hi := ((355854012270439 : ℚ) / 625000000000000000) }
      im := { lo := ((-28441157763214257 : ℚ) / 100000000000000000000)
              hi := ((1046347787439817 : ℚ) / 1000000000000000000) } }
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

def s086_t1_sb004_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63914836093 : ℚ) / 1000000000000)
      ((-8956913 : ℚ) / 40000000000)
      ((77866821 : ℚ) / 20000000000) where
  MRect :=
    { re := { lo := ((2098423837537391 : ℚ) / 500000000000000000)
              hi := ((264972555396159 : ℚ) / 31250000000000000) }
      im := { lo := ((-6841816322623269 : ℚ) / 100000000000000000)
              hi := ((-1604434340669203 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((8153395806088553 : ℚ) / 1000000000000000000)
              hi := ((9476845727259011 : ℚ) / 1000000000000000000) }
      im := { lo := ((-865280494495083 : ℚ) / 200000000000000000)
              hi := ((-3752612999758483 : ℚ) / 1250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2890341746281581 : ℚ) / 2000000000000000000)
              hi := ((-405386388849209 : ℚ) / 500000000000000000) }
      im := { lo := ((1871275020850473 : ℚ) / 1250000000000000000)
              hi := ((426276251066303 : ℚ) / 200000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2006405199142101 : ℚ) / 2500000000000000000)
              hi := ((5694992500252597 : ℚ) / 10000000000000000000) }
      im := { lo := ((-14219332492518353 : ℚ) / 50000000000000000000)
              hi := ((10463440329466203 : ℚ) / 10000000000000000000) } }
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

def s086_t1_sb005_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63914836093 : ℚ) / 1000000000000)
      ((-8956913 : ℚ) / 40000000000)
      ((77866821 : ℚ) / 20000000000) where
  MRect :=
    { re := { lo := ((4201097030494159 : ℚ) / 1000000000000000000)
              hi := ((8483339852553099 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3420141408980263 : ℚ) / 50000000000000000)
              hi := ((-3208106344131977 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((325940356812879 : ℚ) / 40000000000000000)
              hi := ((9471755834547717 : ℚ) / 1000000000000000000) }
      im := { lo := ((-4338181968094121 : ℚ) / 1000000000000000000)
              hi := ((-3767620567175033 : ℚ) / 1250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-14425902825539211 : ℚ) / 10000000000000000000)
              hi := ((-8082144956782751 : ℚ) / 10000000000000000000) }
      im := { lo := ((1498634628406447 : ℚ) / 1000000000000000000)
              hi := ((10664872684481247 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2006117981264837 : ℚ) / 2500000000000000000)
              hi := ((5696316417365253 : ℚ) / 10000000000000000000) }
      im := { lo := ((-2843613210229381 : ℚ) / 10000000000000000000)
              hi := ((2092679704890171 : ℚ) / 2000000000000000000) } }
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

def s086_t1_sb006_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63914836093 : ℚ) / 1000000000000)
      ((-8956913 : ℚ) / 40000000000)
      ((77866821 : ℚ) / 20000000000) where
  MRect :=
    { re := { lo := ((2102683091900909 : ℚ) / 500000000000000000)
              hi := ((4243787836984661 : ℚ) / 500000000000000000) }
      im := { lo := ((-1709687507988267 : ℚ) / 25000000000000000)
              hi := ((-1603672244164379 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((508975398127561 : ℚ) / 62500000000000000)
              hi := ((378665980641103 : ℚ) / 40000000000000000) }
      im := { lo := ((-1087488574999043 : ℚ) / 250000000000000000)
              hi := ((-945655030348813 : ℚ) / 312500000000000000) } }
  DrestRect :=
    { re := { lo := ((-1440007213781453 : ℚ) / 1000000000000000000)
              hi := ((-8056541362434019 : ℚ) / 10000000000000000000) }
      im := { lo := ((7501229014098349 : ℚ) / 5000000000000000000)
              hi := ((2134563985479299 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-125364389960053 : ℚ) / 156250000000000000)
              hi := ((356102342441229 : ℚ) / 625000000000000000) }
      im := { lo := ((-28433556711737317 : ℚ) / 100000000000000000000)
              hi := ((5231676110199363 : ℚ) / 5000000000000000000) } }
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

def s086_t1_sb007_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63914836093 : ℚ) / 1000000000000)
      ((-8956913 : ℚ) / 40000000000)
      ((77866821 : ℚ) / 20000000000) where
  MRect :=
    { re := { lo := ((4209654838961139 : ℚ) / 1000000000000000000)
              hi := ((8491829492556837 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6837217973517587 : ℚ) / 100000000000000000)
              hi := ((-1282633244698193 : ℚ) / 20000000000000000) } }
  D0Rect :=
    { re := { lo := ((4069343819889633 : ℚ) / 500000000000000000)
              hi := ((946152730182777 : ℚ) / 100000000000000000) }
      im := { lo := ((-4361719413039073 : ℚ) / 1000000000000000000)
              hi := ((-24304714685053 : ℚ) / 8000000000000000) } }
  DrestRect :=
    { re := { lo := ((-14374217768466939 : ℚ) / 10000000000000000000)
              hi := ((-401545799872251 : ℚ) / 500000000000000000) }
      im := { lo := ((1501853405119841 : ℚ) / 1000000000000000000)
              hi := ((5340374319616611 : ℚ) / 2500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-250692719922179 : ℚ) / 312500000000000000)
              hi := ((569895483145673 : ℚ) / 1000000000000000000) }
      im := { lo := ((-2843093462690891 : ℚ) / 10000000000000000000)
              hi := ((10463300999833407 : ℚ) / 10000000000000000000) } }
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

def s086_t1_sb008_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63914836093 : ℚ) / 1000000000000)
      ((-8956913 : ℚ) / 40000000000)
      ((77866821 : ℚ) / 20000000000) where
  MRect :=
    { re := { lo := ((4213962998724731 : ℚ) / 1000000000000000000)
              hi := ((8496101335824633 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6835686728741713 : ℚ) / 100000000000000000)
              hi := ((-3205822174492337 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((1016719143736183 : ℚ) / 125000000000000000)
              hi := ((2364097198842207 : ℚ) / 250000000000000000) }
      im := { lo := ((-2186738709936303 : ℚ) / 500000000000000000)
              hi := ((-305007600193633 : ℚ) / 100000000000000000) } }
  DrestRect :=
    { re := { lo := ((-717416963307737 : ℚ) / 500000000000000000)
              hi := ((-8005269440432393 : ℚ) / 10000000000000000000) }
      im := { lo := ((1879321885588611 : ℚ) / 1250000000000000000)
              hi := ((427546336591821 : ℚ) / 200000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8021010422652257 : ℚ) / 10000000000000000000)
              hi := ((228010749192349 : ℚ) / 400000000000000000) }
      im := { lo := ((-28428322901753137 : ℚ) / 100000000000000000000)
              hi := ((2615812642419077 : ℚ) / 2500000000000000000) } }
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

def s086_t1_sb009_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63914836093 : ℚ) / 1000000000000)
      ((-8956913 : ℚ) / 40000000000)
      ((77866821 : ℚ) / 20000000000) where
  MRect :=
    { re := { lo := ((8436579441875697 : ℚ) / 2000000000000000000)
              hi := ((8500392024651587 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6834156349024167 : ℚ) / 100000000000000000)
              hi := ((-6410123299630521 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((812880303358383 : ℚ) / 100000000000000000)
              hi := ((472561693926631 : ℚ) / 50000000000000000) }
      im := { lo := ((-8770457133995043 : ℚ) / 2000000000000000000)
              hi := ((-6124111666002417 : ℚ) / 2000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-14322437060067619 : ℚ) / 10000000000000000000)
              hi := ((-997450165483057 : ℚ) / 1250000000000000000) }
      im := { lo := ((7525290449756581 : ℚ) / 5000000000000000000)
              hi := ((10696549358505483 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8019856882071861 : ℚ) / 10000000000000000000)
              hi := ((5701584950237273 : ℚ) / 10000000000000000000) }
      im := { lo := ((-2842572788829177 : ℚ) / 10000000000000000000)
              hi := ((10463201564520643 : ℚ) / 10000000000000000000) } }
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

def s086_t1_sb010_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63914836093 : ℚ) / 1000000000000)
      ((-8956913 : ℚ) / 40000000000)
      ((77866821 : ℚ) / 20000000000) where
  MRect :=
    { re := { lo := ((2111318030381939 : ℚ) / 500000000000000000)
              hi := ((8504700592700767 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1708156687559749 : ℚ) / 25000000000000000)
              hi := ((-640860317076087 : ℚ) / 10000000000000000) } }
  D0Rect :=
    { re := { lo := ((8123837194921591 : ℚ) / 1000000000000000000)
              hi := ((944606266535881 : ℚ) / 100000000000000000) }
      im := { lo := ((-4396973014552989 : ℚ) / 1000000000000000000)
              hi := ((-30740286000390513 : ℚ) / 10000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-571860478252929 : ℚ) / 400000000000000000)
              hi := ((-7953910976608511 : ℚ) / 10000000000000000000) }
      im := { lo := ((3766637686253537 : ℚ) / 2500000000000000000)
              hi := ((4281768716040451 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-501168766467057 : ℚ) / 625000000000000000)
              hi := ((2851448667563369 : ℚ) / 5000000000000000000) }
      im := { lo := ((-1421154749815859 : ℚ) / 5000000000000000000)
              hi := ((2092629705734773 : ℚ) / 2000000000000000000) } }
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

def s086_t1_sb011_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63914836093 : ℚ) / 1000000000000)
      ((-8956913 : ℚ) / 40000000000)
      ((77866821 : ℚ) / 20000000000) where
  MRect :=
    { re := { lo := ((845400466285701 : ℚ) / 200000000000000000)
              hi := ((850902668618821 : ℚ) / 100000000000000000) }
      im := { lo := ((-683109787575889 : ℚ) / 10000000000000000)
              hi := ((-640708402021749 : ℚ) / 10000000000000000) } }
  D0Rect :=
    { re := { lo := ((101485696188547 : ℚ) / 12500000000000000)
              hi := ((1888175023947429 : ℚ) / 200000000000000000) }
      im := { lo := ((-4408710218652933 : ℚ) / 1000000000000000000)
              hi := ((-30859948120634407 : ℚ) / 10000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2854112503434791 : ℚ) / 2000000000000000000)
              hi := ((-7928199940678307 : ℚ) / 10000000000000000000) }
      im := { lo := ((3770621466547733 : ℚ) / 2500000000000000000)
              hi := ((10712275066872743 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8017540106586933 : ℚ) / 10000000000000000000)
              hi := ((2852102713070727 : ℚ) / 5000000000000000000) }
      im := { lo := ((-2842041781252839 : ℚ) / 10000000000000000000)
              hi := ((5231545410288737 : ℚ) / 5000000000000000000) } }
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

def s086_t1_sb012_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63914836093 : ℚ) / 1000000000000)
      ((-8956913 : ℚ) / 40000000000)
      ((77866821 : ℚ) / 20000000000) where
  MRect :=
    { re := { lo := ((8462775764880543 : ℚ) / 2000000000000000000)
              hi := ((4256685468611769 : ℚ) / 500000000000000000) }
      im := { lo := ((-6829569791698123 : ℚ) / 100000000000000000)
              hi := ((-640556578797599 : ℚ) / 10000000000000000) } }
  D0Rect :=
    { re := { lo := ((1622771637570019 : ℚ) / 200000000000000000)
              hi := ((9435671591851859 : ℚ) / 1000000000000000000) }
      im := { lo := ((-4420440608717121 : ℚ) / 1000000000000000000)
              hi := ((-1548977000157763 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-71222953556809 : ℚ) / 50000000000000000)
              hi := ((-1975616579558747 : ℚ) / 2500000000000000000) }
      im := { lo := ((7549192169811433 : ℚ) / 5000000000000000000)
              hi := ((1072011011251579 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4008188745904187 : ℚ) / 5000000000000000000)
              hi := ((1426377576256733 : ℚ) / 2500000000000000000) }
      im := { lo := ((-5683540324724713 : ℚ) / 20000000000000000000)
              hi := ((2615757242870983 : ℚ) / 2500000000000000000) } }
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

def s086_t1_sb013_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63914836093 : ℚ) / 1000000000000)
      ((-8956913 : ℚ) / 40000000000)
      ((77866821 : ℚ) / 20000000000) where
  MRect :=
    { re := { lo := ((8471583500137483 : ℚ) / 2000000000000000000)
              hi := ((1703546859167573 : ℚ) / 200000000000000000) }
      im := { lo := ((-6828042826628217 : ℚ) / 100000000000000000)
              hi := ((-3202024072352481 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((8108844535735639 : ℚ) / 1000000000000000000)
              hi := ((9430452253493619 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1108041024994039 : ℚ) / 250000000000000000)
              hi := ((-621981240551559 : ℚ) / 200000000000000000) } }
  DrestRect :=
    { re := { lo := ((-7109298389700961 : ℚ) / 5000000000000000000)
              hi := ((-7876710005034561 : ℚ) / 10000000000000000000) }
      im := { lo := ((15114245865427193 : ℚ) / 10000000000000000000)
              hi := ((10727927051932579 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-801521126019183 : ℚ) / 1000000000000000000)
              hi := ((1141362162583899 : ℚ) / 2000000000000000000) }
      im := { lo := ((-2841516973157891 : ℚ) / 10000000000000000000)
              hi := ((5231492654806417 : ℚ) / 5000000000000000000) } }
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

def s086_t1_sb014_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63914836093 : ℚ) / 1000000000000)
      ((-8956913 : ℚ) / 40000000000)
      ((77866821 : ℚ) / 20000000000) where
  MRect :=
    { re := { lo := ((84804275360569 : ℚ) / 20000000000000000)
              hi := ((8522116913041987 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1706629223859913 : ℚ) / 25000000000000000)
              hi := ((-1600632796620281 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((810381405907233 : ℚ) / 100000000000000000)
              hi := ((73634514040959 : ℚ) / 7812500000000000) }
      im := { lo := ((-17358908336719 : ℚ) / 3906250000000000)
              hi := ((-6243703067501897 : ℚ) / 2000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-709629094467873 : ℚ) / 500000000000000000)
              hi := ((-3925464963236993 : ℚ) / 5000000000000000000) }
      im := { lo := ((7565034446733567 : ℚ) / 5000000000000000000)
              hi := ((10735726624112763 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8014041117057977 : ℚ) / 10000000000000000000)
              hi := ((1141621331151467 : ℚ) / 2000000000000000000) }
      im := { lo := ((-2841275295255127 : ℚ) / 10000000000000000000)
              hi := ((2092590584298093 : ℚ) / 2000000000000000000) } }
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

def s086_t1_sb015_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63914836093 : ℚ) / 1000000000000)
      ((-8956913 : ℚ) / 40000000000)
      ((77866821 : ℚ) / 20000000000) where
  MRect :=
    { re := { lo := ((4244653792159877 : ℚ) / 1000000000000000000)
              hi := ((852651892094117 : ℚ) / 100000000000000000) }
      im := { lo := ((-3412495924051479 : ℚ) / 50000000000000000)
              hi := ((-800126883019211 : ℚ) / 12500000000000000) } }
  D0Rect :=
    { re := { lo := ((809876582717167 : ℚ) / 100000000000000000)
              hi := ((4709984586371243 : ℚ) / 500000000000000000) }
      im := { lo := ((-2227794952056469 : ℚ) / 500000000000000000)
              hi := ((-1566894978313471 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-354163703989353 : ℚ) / 250000000000000000)
              hi := ((-391256203430767 : ℚ) / 500000000000000000) }
      im := { lo := ((946615679983557 : ℚ) / 625000000000000000)
              hi := ((10743510068929 : ℚ) / 5000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8012866499204007 : ℚ) / 10000000000000000000)
              hi := ((5709397271022197 : ℚ) / 10000000000000000000) }
      im := { lo := ((-443911378105661 : ℚ) / 1562500000000000000)
              hi := ((10462919497350627 : ℚ) / 10000000000000000000) } }
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

def s086_t1_sb016_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63914836093 : ℚ) / 1000000000000)
      ((-8956913 : ℚ) / 40000000000)
      ((77866821 : ℚ) / 20000000000) where
  MRect :=
    { re := { lo := ((265569543189873 : ℚ) / 62500000000000000)
              hi := ((1706187885952257 : ℚ) / 200000000000000000) }
      im := { lo := ((-3411733839102557 : ℚ) / 50000000000000000)
              hi := ((-6399499788131813 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((809370101834387 : ℚ) / 100000000000000000)
              hi := ((9414705226795637 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1116823041931897 : ℚ) / 250000000000000000)
              hi := ((-31457214751406813 : ℚ) / 10000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-14140493067887011 : ℚ) / 10000000000000000000)
              hi := ((-7799295062319133 : ℚ) / 10000000000000000000) }
      im := { lo := ((5922498015043 : ℚ) / 3906250000000000)
              hi := ((1075127581557241 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8011687296902901 : ℚ) / 10000000000000000000)
              hi := ((2855341274855379 : ℚ) / 5000000000000000000) }
      im := { lo := ((-1420396017212109 : ℚ) / 5000000000000000000)
              hi := ((10462887525793893 : ℚ) / 10000000000000000000) } }
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

def s086_t1_sb017_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63914836093 : ℚ) / 1000000000000)
      ((-8956913 : ℚ) / 40000000000)
      ((77866821 : ℚ) / 20000000000) where
  MRect :=
    { re := { lo := ((5316988375815133 : ℚ) / 1250000000000000000)
              hi := ((1707075641937593 : ℚ) / 200000000000000000) }
      im := { lo := ((-6821944344898213 : ℚ) / 100000000000000000)
              hi := ((-6397985404530587 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((8088620126742599 : ℚ) / 1000000000000000000)
              hi := ((4704712733042753 : ℚ) / 500000000000000000) }
      im := { lo := ((-1791595126081251 : ℚ) / 400000000000000000)
              hi := ((-15788227751715861 : ℚ) / 5000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-14114416944575687 : ℚ) / 10000000000000000000)
              hi := ((-7773442655067787 : ℚ) / 10000000000000000000) }
      im := { lo := ((7588650575716849 : ℚ) / 5000000000000000000)
              hi := ((21518047488611387 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8010504953223329 : ℚ) / 10000000000000000000)
              hi := ((5711963935199191 : ℚ) / 10000000000000000000) }
      im := { lo := ((-3550684934254803 : ℚ) / 12500000000000000000)
              hi := ((5231426008453327 : ℚ) / 5000000000000000000) } }
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

def s086_t1_sb018_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63914836093 : ℚ) / 1000000000000)
      ((-8956913 : ℚ) / 40000000000)
      ((77866821 : ℚ) / 20000000000) where
  MRect :=
    { re := { lo := ((4258087832625437 : ℚ) / 1000000000000000000)
              hi := ((8539835205706267 : ℚ) / 1000000000000000000) }
      im := { lo := ((-852552722975211 : ℚ) / 12500000000000000)
              hi := ((-6396471981149549 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((8083523246577629 : ℚ) / 1000000000000000000)
              hi := ((1175516229477077 : ℚ) / 125000000000000000) }
      im := { lo := ((-8981352246216101 : ℚ) / 2000000000000000000)
              hi := ((-7923907175938727 : ℚ) / 2500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-3522079458402117 : ℚ) / 2500000000000000000)
              hi := ((-7747568934045531 : ℚ) / 10000000000000000000) }
      im := { lo := ((151929712859237 : ℚ) / 100000000000000000)
              hi := ((21533505980525507 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-40046608590363 : ℚ) / 50000000000000000)
              hi := ((285662183937633 : ℚ) / 500000000000000000) }
      im := { lo := ((-5680599109068173 : ℚ) / 20000000000000000000)
              hi := ((10462811967252997 : ℚ) / 10000000000000000000) } }
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

def s086_t1_sb019_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63914836093 : ℚ) / 1000000000000)
      ((-8956913 : ℚ) / 40000000000)
      ((77866821 : ℚ) / 20000000000) where
  MRect :=
    { re := { lo := ((4262603397596433 : ℚ) / 1000000000000000000)
              hi := ((4272155558014333 : ℚ) / 500000000000000000) }
      im := { lo := ((-340945007646153 : ℚ) / 5000000000000000)
              hi := ((-199842480160343 : ℚ) / 3125000000000000) } }
  D0Rect :=
    { re := { lo := ((15778144545143 : ℚ) / 1953125000000000)
              hi := ((1879763743473497 : ℚ) / 200000000000000000) }
      im := { lo := ((-4502358189810577 : ℚ) / 1000000000000000000)
              hi := ((-795368070930809 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-3515549891050011 : ℚ) / 2500000000000000000)
              hi := ((-482604385670447 : ℚ) / 625000000000000000) }
      im := { lo := ((237634404018539 : ℚ) / 156250000000000000)
              hi := ((21548930479205913 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2002034059418861 : ℚ) / 2500000000000000000)
              hi := ((5714520426232869 : ℚ) / 10000000000000000000) }
      im := { lo := ((-2840050482709577 : ℚ) / 10000000000000000000)
              hi := ((1046277100498681 : ℚ) / 1000000000000000000) } }
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

def s086_t1_sb020_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63914836093 : ℚ) / 1000000000000)
      ((-8956913 : ℚ) / 40000000000)
      ((77866821 : ℚ) / 20000000000) where
  MRect :=
    { re := { lo := ((4267138431682863 : ℚ) / 1000000000000000000)
              hi := ((106860060983363 : ℚ) / 12500000000000000) }
      im := { lo := ((-852172419144049 : ℚ) / 12500000000000000)
              hi := ((-6393447656681177 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((1614656180093461 : ℚ) / 200000000000000000)
              hi := ((75147933107217 : ℚ) / 8000000000000000) }
      im := { lo := ((-2257016597471459 : ℚ) / 500000000000000000)
              hi := ((-31933745788571177 : ℚ) / 10000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-7018029510276421 : ℚ) / 5000000000000000000)
              hi := ((-6012304353213 : ℚ) / 7812500000000000) }
      im := { lo := ((3806048962783317 : ℚ) / 2500000000000000000)
              hi := ((21564317956798717 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1000868282876797 : ℚ) / 1250000000000000000)
              hi := ((2857895964982947 : ℚ) / 5000000000000000000) }
      im := { lo := ((-28398004240170777 : ℚ) / 100000000000000000000)
              hi := ((10462728821988283 : ℚ) / 10000000000000000000) } }
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

def s086_t1_sb021_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63914836093 : ℚ) / 1000000000000)
      ((-8956913 : ℚ) / 40000000000)
      ((77866821 : ℚ) / 20000000000) where
  MRect :=
    { re := { lo := ((2135846641605317 : ℚ) / 500000000000000000)
              hi := ((4276658065148849 : ℚ) / 500000000000000000) }
      im := { lo := ((-6815859367996163 : ℚ) / 100000000000000000)
              hi := ((-3195968442285587 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((2017034097116593 : ℚ) / 250000000000000000)
              hi := ((2347037040145337 : ℚ) / 250000000000000000) }
      im := { lo := ((-1131425224988323 : ℚ) / 250000000000000000)
              hi := ((-32052699345530887 : ℚ) / 10000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-14009894748440153 : ℚ) / 10000000000000000000)
              hi := ((-239681522696771 : ℚ) / 312500000000000000) }
      im := { lo := ((15239754862299937 : ℚ) / 10000000000000000000)
              hi := ((5394916682701531 : ℚ) / 2500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8005752242417507 : ℚ) / 10000000000000000000)
              hi := ((571705863855499 : ℚ) / 1000000000000000000) }
      im := { lo := ((-709887500538311 : ℚ) / 2500000000000000000)
              hi := ((1046268604682161 : ℚ) / 1000000000000000000) } }
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

def s086_t1_sb022_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63914836093 : ℚ) / 1000000000000)
      ((-8956913 : ℚ) / 40000000000)
      ((77866821 : ℚ) / 20000000000) where
  MRect :=
    { re := { lo := ((1069066945167373 : ℚ) / 250000000000000000)
              hi := ((8557845039717989 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3407170088925863 : ℚ) / 50000000000000000)
              hi := ((-6390427066034943 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((8062976361238011 : ℚ) / 1000000000000000000)
              hi := ((586424275044941 : ℚ) / 62500000000000000) }
      im := { lo := ((-907472278516579 : ℚ) / 200000000000000000)
              hi := ((-100536195069047 : ℚ) / 31250000000000000) } }
  DrestRect :=
    { re := { lo := ((-3495926819458653 : ℚ) / 2500000000000000000)
              hi := ((-7643847156022623 : ℚ) / 10000000000000000000) }
      im := { lo := ((15255278361599803 : ℚ) / 10000000000000000000)
              hi := ((2159497729192971 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8004555167191953 : ℚ) / 10000000000000000000)
              hi := ((5718321543903291 : ℚ) / 10000000000000000000) }
      im := { lo := ((-14196484270091107 : ℚ) / 50000000000000000000)
              hi := ((10462640314823901 : ℚ) / 10000000000000000000) } }
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

def s086_t1_sb023_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63914836093 : ℚ) / 1000000000000)
      ((-8956913 : ℚ) / 40000000000)
      ((77866821 : ℚ) / 20000000000) where
  MRect :=
    { re := { lo := ((4280861494770543 : ℚ) / 1000000000000000000)
              hi := ((535149500103873 : ℚ) / 62500000000000000) }
      im := { lo := ((-6812821832536893 : ℚ) / 100000000000000000)
              hi := ((-6388918152984377 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((100722508883563 : ℚ) / 12500000000000000)
              hi := ((146522070256309 : ℚ) / 15625000000000000) }
      im := { lo := ((-9098029309612999 : ℚ) / 2000000000000000000)
              hi := ((-16145197325020857 : ℚ) / 5000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-6978748483761161 : ℚ) / 5000000000000000000)
              hi := ((-3808932320311163 : ℚ) / 5000000000000000000) }
      im := { lo := ((7635382984845533 : ℚ) / 5000000000000000000)
              hi := ((540256248718573 : ℚ) / 250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-400167815545877 : ℚ) / 500000000000000000)
              hi := ((5719581921137647 : ℚ) / 10000000000000000000) }
      im := { lo := ((-2839043508153927 : ℚ) / 10000000000000000000)
              hi := ((10462594153665679 : ℚ) / 10000000000000000000) } }
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

def s086_t1_sb024_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63914836093 : ℚ) / 1000000000000)
      ((-8956913 : ℚ) / 40000000000)
      ((77866821 : ℚ) / 20000000000) where
  MRect :=
    { re := { lo := ((4285473361435361 : ℚ) / 1000000000000000000)
              hi := ((85669580976391 : ℚ) / 10000000000000000) }
      im := { lo := ((-681130440625639 : ℚ) / 10000000000000000)
              hi := ((-319370504092477 : ℚ) / 5000000000000000) } }
  D0Rect :=
    { re := { lo := ((4026304438201519 : ℚ) / 500000000000000000)
              hi := ((1171502628689363 : ℚ) / 125000000000000000) }
      im := { lo := ((-2280330921025909 : ℚ) / 500000000000000000)
              hi := ((-16204561994183767 : ℚ) / 5000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2786253644844373 : ℚ) / 2000000000000000000)
              hi := ((-7591856887954843 : ℚ) / 10000000000000000000) }
      im := { lo := ((1528621360004223 : ℚ) / 1000000000000000000)
              hi := ((21625488717805967 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8002158003238083 : ℚ) / 10000000000000000000)
              hi := ((5720842098264527 : ℚ) / 10000000000000000000) }
      im := { lo := ((-5677571747664871 : ℚ) / 20000000000000000000)
              hi := ((653908967313717 : ℚ) / 625000000000000000) } }
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

def s086_t1_sb025_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63914836093 : ℚ) / 1000000000000)
      ((-8956913 : ℚ) / 40000000000)
      ((77866821 : ℚ) / 20000000000) where
  MRect :=
    { re := { lo := ((2145051859541273 : ℚ) / 500000000000000000)
              hi := ((342861717515191 : ℚ) / 40000000000000000) }
      im := { lo := ((-680978788674747 : ℚ) / 10000000000000000)
              hi := ((-1277180573182747 : ℚ) / 20000000000000000) } }
  D0Rect :=
    { re := { lo := ((4023700553284301 : ℚ) / 500000000000000000)
              hi := ((1170826721068453 : ℚ) / 125000000000000000) }
      im := { lo := ((-2286151440577673 : ℚ) / 500000000000000000)
              hi := ((-6505554172349339 : ℚ) / 2000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-13905020422692043 : ℚ) / 10000000000000000000)
              hi := ((-378291230336859 : ℚ) / 500000000000000000) }
      im := { lo := ((15301621989582993 : ℚ) / 10000000000000000000)
              hi := ((2164069281845079 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2000239790604103 : ℚ) / 2500000000000000000)
              hi := ((5722100996420063 : ℚ) / 10000000000000000000) }
      im := { lo := ((-2838524344007739 : ℚ) / 10000000000000000000)
              hi := ((1307811084735117 : ℚ) / 1250000000000000000) } }
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

def s086_t1_sb026_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63914836093 : ℚ) / 1000000000000)
      ((-8956913 : ℚ) / 40000000000)
      ((77866821 : ℚ) / 20000000000) where
  MRect :=
    { re := { lo := ((4294753160854581 : ℚ) / 1000000000000000000)
              hi := ((4288072966368713 : ℚ) / 500000000000000000) }
      im := { lo := ((-680827222433691 : ℚ) / 10000000000000000)
              hi := ((-1276879312350187 : ℚ) / 20000000000000000) } }
  D0Rect :=
    { re := { lo := ((8042177543821867 : ℚ) / 1000000000000000000)
              hi := ((4680595295112627 : ℚ) / 500000000000000000) }
      im := { lo := ((-1145984210919871 : ℚ) / 250000000000000000)
              hi := ((-6529268816262701 : ℚ) / 2000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-6939375470646071 : ℚ) / 5000000000000000000)
              hi := ((-7539770529252113 : ℚ) / 10000000000000000000) }
      im := { lo := ((7658496702438101 : ℚ) / 5000000000000000000)
              hi := ((2706982489248087 : ℚ) / 1250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7999758101572143 : ℚ) / 10000000000000000000)
              hi := ((2861678464145177 : ℚ) / 5000000000000000000) }
      im := { lo := ((-28382612457162823 : ℚ) / 100000000000000000000)
              hi := ((5231216042766313 : ℚ) / 5000000000000000000) } }
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

def s086_t1_sb027_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63914836093 : ℚ) / 1000000000000)
      ((-8956913 : ℚ) / 40000000000)
      ((77866821 : ℚ) / 20000000000) where
  MRect :=
    { re := { lo := ((4299421966120533 : ℚ) / 1000000000000000000)
              hi := ((1716153358730611 : ℚ) / 200000000000000000) }
      im := { lo := ((-1701689361320811 : ℚ) / 25000000000000000)
              hi := ((-797861392652771 : ℚ) / 12500000000000000) } }
  D0Rect :=
    { re := { lo := ((502308637812463 : ℚ) / 62500000000000000)
              hi := ((9355751487211407 : ℚ) / 1000000000000000000) }
      im := { lo := ((-2297781615209537 : ℚ) / 500000000000000000)
              hi := ((-8191212046338793 : ℚ) / 2500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1731557317315793 : ℚ) / 1250000000000000000)
              hi := ((-3756847993423711 : ℚ) / 5000000000000000000) }
      im := { lo := ((7666164432472909 : ℚ) / 5000000000000000000)
              hi := ((2167098890591973 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-799855257412139 : ℚ) / 1000000000000000000)
              hi := ((1431151912099781 : ℚ) / 2500000000000000000) }
      im := { lo := ((-354750221691473 : ℚ) / 1250000000000000000)
              hi := ((261559472302617 : ℚ) / 250000000000000000) } }
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

def s086_t1_sb028_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63914836093 : ℚ) / 1000000000000)
      ((-8956913 : ℚ) / 40000000000)
      ((77866821 : ℚ) / 20000000000) where
  MRect :=
    { re := { lo := ((538013796793841 : ℚ) / 125000000000000000)
              hi := ((4292702629470239 : ℚ) / 500000000000000000) }
      im := { lo := ((-6805243467329251 : ℚ) / 100000000000000000)
              hi := ((-3190693348444403 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((1606336636170063 : ℚ) / 200000000000000000)
              hi := ((146098381327167 : ℚ) / 15625000000000000) }
      im := { lo := ((-4607182448297409 : ℚ) / 1000000000000000000)
              hi := ((-6576655738365171 : ℚ) / 2000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-13826144255045783 : ℚ) / 10000000000000000000)
              hi := ((-3743800035653481 : ℚ) / 5000000000000000000) }
      im := { lo := ((1534762762230071 : ℚ) / 1000000000000000000)
              hi := ((1084304025212361 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-319893709387421 : ℚ) / 400000000000000000)
              hi := ((1431463327835527 : ℚ) / 2500000000000000000) }
      im := { lo := ((-354717228638271 : ℚ) / 1250000000000000000)
              hi := ((1046232100372829 : ℚ) / 1000000000000000000) } }
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

def s086_t1_sb029_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63914836093 : ℚ) / 1000000000000)
      ((-8956913 : ℚ) / 40000000000)
      ((77866821 : ℚ) / 20000000000) where
  MRect :=
    { re := { lo := ((2154409249267307 : ℚ) / 500000000000000000)
              hi := ((85900611987641 : ℚ) / 10000000000000000) }
      im := { lo := ((-1360746061385017 : ℚ) / 20000000000000000)
              hi := ((-6379883212804309 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((1605282548611757 : ℚ) / 200000000000000000)
              hi := ((1168103135488151 : ℚ) / 125000000000000000) }
      im := { lo := ((-4618794260561357 : ℚ) / 1000000000000000000)
              hi := ((-6600327497348759 : ℚ) / 2000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-13799807005264659 : ℚ) / 10000000000000000000)
              hi := ((-7461483966474063 : ℚ) / 10000000000000000000) }
      im := { lo := ((3072578159604317 : ℚ) / 2000000000000000000)
              hi := ((10850566753330879 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-3998064453884487 : ℚ) / 5000000000000000000)
              hi := ((5727094242972223 : ℚ) / 10000000000000000000) }
      im := { lo := ((-2837472241564913 : ℚ) / 10000000000000000000)
              hi := ((523113062417899 : ℚ) / 500000000000000000) } }
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

def s086_t1_sb030_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63914836093 : ℚ) / 1000000000000)
      ((-8956913 : ℚ) / 40000000000)
      ((77866821 : ℚ) / 20000000000) where
  MRect :=
    { re := { lo := ((2156773054497363 : ℚ) / 500000000000000000)
              hi := ((859473482813723 : ℚ) / 100000000000000000) }
      im := { lo := ((-6802218036085689 : ℚ) / 100000000000000000)
              hi := ((-6378380626847437 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((8021126963514603 : ℚ) / 1000000000000000000)
              hi := ((4669668736692587 : ℚ) / 500000000000000000) }
      im := { lo := ((-1157599664050321 : ℚ) / 250000000000000000)
              hi := ((-3311992441308083 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-6886723353330441 : ℚ) / 5000000000000000000)
              hi := ((-7435347841315053 : ℚ) / 10000000000000000000) }
      im := { lo := ((2460498965629 : ℚ) / 1600000000000000)
              hi := ((434322954793609 : ℚ) / 200000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7994911535905421 : ℚ) / 10000000000000000000)
              hi := ((1432082721474783 : ℚ) / 2500000000000000000) }
      im := { lo := ((-709302375267619 : ℚ) / 2500000000000000000)
              hi := ((5231102060619063 : ℚ) / 5000000000000000000) } }
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

def s086_t1_sb031_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((63914836093 : ℚ) / 1000000000000)
      ((-8956913 : ℚ) / 40000000000)
      ((77866821 : ℚ) / 20000000000) where
  MRect :=
    { re := { lo := ((863658673861163 : ℚ) / 200000000000000000)
              hi := ((8599425944281047 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6800706561728663 : ℚ) / 100000000000000000)
              hi := ((-1594219757291697 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((8015825881050511 : ℚ) / 1000000000000000000)
              hi := ((4666916780988577 : ℚ) / 500000000000000000) }
      im := { lo := ((-232099776458047 : ℚ) / 50000000000000000)
              hi := ((-8309534997567817 : ℚ) / 2500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1374706316278483 : ℚ) / 1000000000000000000)
              hi := ((-7409192025931027 : ℚ) / 10000000000000000000) }
      im := { lo := ((15393311035550227 : ℚ) / 10000000000000000000)
              hi := ((1086556146477089 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-62450715216873 : ℚ) / 78125000000000000)
              hi := ((5729564170962411 : ℚ) / 10000000000000000000) }
      im := { lo := ((-1418471847647043 : ℚ) / 5000000000000000000)
              hi := ((523107185326211 : ℚ) / 500000000000000000) } }
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
    (hi : i ∈ positiveBoxSubboxesOf .s086_t1) :
    ProjectedJ0SubboxRectangleCertificateData
      ((positiveBoxCombinedCert .s086_t1).constants.mainLower)
      ((positiveBoxCombinedCert .s086_t1).constants.d0NegReUpper)
      ((positiveBoxCombinedCert .s086_t1).constants.restUpper) := by
  if h0 : i = .s086_t1_sb000 then
    exact s086_t1_sb000_certificateData
  else if h1 : i = .s086_t1_sb001 then
    exact s086_t1_sb001_certificateData
  else if h2 : i = .s086_t1_sb002 then
    exact s086_t1_sb002_certificateData
  else if h3 : i = .s086_t1_sb003 then
    exact s086_t1_sb003_certificateData
  else if h4 : i = .s086_t1_sb004 then
    exact s086_t1_sb004_certificateData
  else if h5 : i = .s086_t1_sb005 then
    exact s086_t1_sb005_certificateData
  else if h6 : i = .s086_t1_sb006 then
    exact s086_t1_sb006_certificateData
  else if h7 : i = .s086_t1_sb007 then
    exact s086_t1_sb007_certificateData
  else if h8 : i = .s086_t1_sb008 then
    exact s086_t1_sb008_certificateData
  else if h9 : i = .s086_t1_sb009 then
    exact s086_t1_sb009_certificateData
  else if h10 : i = .s086_t1_sb010 then
    exact s086_t1_sb010_certificateData
  else if h11 : i = .s086_t1_sb011 then
    exact s086_t1_sb011_certificateData
  else if h12 : i = .s086_t1_sb012 then
    exact s086_t1_sb012_certificateData
  else if h13 : i = .s086_t1_sb013 then
    exact s086_t1_sb013_certificateData
  else if h14 : i = .s086_t1_sb014 then
    exact s086_t1_sb014_certificateData
  else if h15 : i = .s086_t1_sb015 then
    exact s086_t1_sb015_certificateData
  else if h16 : i = .s086_t1_sb016 then
    exact s086_t1_sb016_certificateData
  else if h17 : i = .s086_t1_sb017 then
    exact s086_t1_sb017_certificateData
  else if h18 : i = .s086_t1_sb018 then
    exact s086_t1_sb018_certificateData
  else if h19 : i = .s086_t1_sb019 then
    exact s086_t1_sb019_certificateData
  else if h20 : i = .s086_t1_sb020 then
    exact s086_t1_sb020_certificateData
  else if h21 : i = .s086_t1_sb021 then
    exact s086_t1_sb021_certificateData
  else if h22 : i = .s086_t1_sb022 then
    exact s086_t1_sb022_certificateData
  else if h23 : i = .s086_t1_sb023 then
    exact s086_t1_sb023_certificateData
  else if h24 : i = .s086_t1_sb024 then
    exact s086_t1_sb024_certificateData
  else if h25 : i = .s086_t1_sb025 then
    exact s086_t1_sb025_certificateData
  else if h26 : i = .s086_t1_sb026 then
    exact s086_t1_sb026_certificateData
  else if h27 : i = .s086_t1_sb027 then
    exact s086_t1_sb027_certificateData
  else if h28 : i = .s086_t1_sb028 then
    exact s086_t1_sb028_certificateData
  else if h29 : i = .s086_t1_sb029 then
    exact s086_t1_sb029_certificateData
  else if h30 : i = .s086_t1_sb030 then
    exact s086_t1_sb030_certificateData
  else if h31 : i = .s086_t1_sb031 then
    exact s086_t1_sb031_certificateData
  else
    simp [positiveBoxSubboxesOf, h0, h1, h2, h3, h4, h5, h6, h7, h8, h9, h10, h11, h12, h13, h14, h15, h16, h17, h18, h19, h20, h21, h22, h23, h24, h25, h26, h27, h28, h29, h30, h31] at hi

end S086T1
end ProjectedJ0PositiveBoxRectangleData
end ProjectedJ0PositiveBoxSkeleton
end C2
