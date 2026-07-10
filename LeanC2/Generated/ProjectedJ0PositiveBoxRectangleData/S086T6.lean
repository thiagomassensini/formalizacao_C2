import LeanC2.AuditProjectedJ0PositiveBoxRectangleCertificateSchema
import LeanC2.AuditProjectedJ0PositiveBoxAllSubboxSkeleton
import LeanC2.AuditAdjustedQuartetProjectedJ0PositiveBoxSectorRationalizedData

set_option linter.style.longLine false

/-!
# Generated rectangle data for s0.86_t6

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
namespace S086T6

open ProjectedJ0RectangleArithmetic

def s086_t6_sb000_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((765429037 : ℚ) / 12500000000)
      ((-356297059 : ℚ) / 1000000000000)
      ((475776903 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((2690980895151427 : ℚ) / 500000000000000000)
              hi := ((4825322522886379 : ℚ) / 500000000000000000) }
      im := { lo := ((-1311942393963439 : ℚ) / 20000000000000000)
              hi := ((-1227550929917667 : ℚ) / 20000000000000000) } }
  D0Rect :=
    { re := { lo := ((6902210111066933 : ℚ) / 1000000000000000000)
              hi := ((8185554756593617 : ℚ) / 1000000000000000000) }
      im := { lo := ((-12958612100222847 : ℚ) / 2000000000000000000)
              hi := ((-12999445508673469 : ℚ) / 2500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1127506304333529 : ℚ) / 1250000000000000000)
              hi := ((-682188276236357 : ℚ) / 2500000000000000000) }
      im := { lo := ((4352136357745999 : ℚ) / 2500000000000000000)
              hi := ((2370244136013079 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7785454580535843 : ℚ) / 10000000000000000000)
              hi := ((5925843722098737 : ℚ) / 10000000000000000000) }
      im := { lo := ((-2791146777601699 : ℚ) / 10000000000000000000)
              hi := ((41794915822427 : ℚ) / 40000000000000000) } }
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

def s086_t6_sb001_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((765429037 : ℚ) / 12500000000)
      ((-356297059 : ℚ) / 1000000000000)
      ((475776903 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((2694876842476487 : ℚ) / 500000000000000000)
              hi := ((9658349535033289 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3279190417432213 : ℚ) / 50000000000000000)
              hi := ((-613643670234547 : ℚ) / 10000000000000000) } }
  D0Rect :=
    { re := { lo := ((6894394763593307 : ℚ) / 1000000000000000000)
              hi := ((4088763283643983 : ℚ) / 500000000000000000) }
      im := { lo := ((-12978708800298059 : ℚ) / 2000000000000000000)
              hi := ((-1302515404361063 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-8990753922228781 : ℚ) / 10000000000000000000)
              hi := ((-26997980445434027 : ℚ) / 100000000000000000000) }
      im := { lo := ((17417096017573021 : ℚ) / 10000000000000000000)
              hi := ((296383369489051 : ℚ) / 125000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1946062120064749 : ℚ) / 2500000000000000000)
              hi := ((370435941689253 : ℚ) / 625000000000000000) }
      im := { lo := ((-2790837580271497 : ℚ) / 10000000000000000000)
              hi := ((2089720497408153 : ℚ) / 2000000000000000000) } }
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

def s086_t6_sb002_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((765429037 : ℚ) / 12500000000)
      ((-356297059 : ℚ) / 1000000000000)
      ((475776903 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((1079512373405119 : ℚ) / 200000000000000000)
              hi := ((2416517896508357 : ℚ) / 250000000000000000) }
      im := { lo := ((-3278525545795523 : ℚ) / 50000000000000000)
              hi := ((-245404794287921 : ℚ) / 4000000000000000) } }
  D0Rect :=
    { re := { lo := ((3443282631114073 : ℚ) / 500000000000000000)
              hi := ((2042371285986111 : ℚ) / 250000000000000000) }
      im := { lo := ((-649939195858407 : ℚ) / 100000000000000000)
              hi := ((-10440668664811489 : ℚ) / 2000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-4480723057110247 : ℚ) / 5000000000000000000)
              hi := ((-2670830380434067 : ℚ) / 10000000000000000000) }
      im := { lo := ((4356401091049801 : ℚ) / 2500000000000000000)
              hi := ((23718857562634453 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7783041652238981 : ℚ) / 10000000000000000000)
              hi := ((2964052531943261 : ℚ) / 5000000000000000000) }
      im := { lo := ((-2790537517089517 : ℚ) / 10000000000000000000)
              hi := ((261212127834901 : ℚ) / 250000000000000000) } }
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

def s086_t6_sb003_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((765429037 : ℚ) / 12500000000)
      ((-356297059 : ℚ) / 1000000000000)
      ((475776903 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((2702693827527299 : ℚ) / 500000000000000000)
              hi := ((9673809867523003 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6555722525975827 : ℚ) / 100000000000000000)
              hi := ((-6133804318600443 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((1719680470817669 : ℚ) / 250000000000000000)
              hi := ((4080715112253279 : ℚ) / 500000000000000000) }
      im := { lo := ((-3254709424036563 : ℚ) / 500000000000000000)
              hi := ((-523059618389253 : ℚ) / 100000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1116515861389863 : ℚ) / 1250000000000000000)
              hi := ((-6604625820595931 : ℚ) / 25000000000000000000) }
      im := { lo := ((17434070887399917 : ℚ) / 10000000000000000000)
              hi := ((2372700489128111 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-486364402612731 : ℚ) / 625000000000000000)
              hi := ((1185846011820809 : ℚ) / 2000000000000000000) }
      im := { lo := ((-558046721946851 : ℚ) / 2000000000000000000)
              hi := ((5224181924737599 : ℚ) / 5000000000000000000) } }
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

def s086_t6_sb004_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((765429037 : ℚ) / 12500000000)
      ((-356297059 : ℚ) / 1000000000000)
      ((475776903 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((5413231246975011 : ℚ) / 1000000000000000000)
              hi := ((968156415963761 : ℚ) / 100000000000000000) }
      im := { lo := ((-6554395125285009 : ℚ) / 100000000000000000)
              hi := ((-1226498021398833 : ℚ) / 20000000000000000) } }
  D0Rect :=
    { re := { lo := ((1717716195721137 : ℚ) / 250000000000000000)
              hi := ((407668084148761 : ℚ) / 50000000000000000) }
      im := { lo := ((-13038869956437469 : ℚ) / 2000000000000000000)
              hi := ((-5240847225307557 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-4451397906741783 : ℚ) / 5000000000000000000)
              hi := ((-65321461149813 : ℚ) / 250000000000000000) }
      im := { lo := ((17442496116541327 : ℚ) / 10000000000000000000)
              hi := ((2373511098284381 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-62244916026373 : ℚ) / 80000000000000000)
              hi := ((1186069941529139 : ℚ) / 2000000000000000000) }
      im := { lo := ((-2789925619662501 : ℚ) / 10000000000000000000)
              hi := ((10448238459850531 : ℚ) / 10000000000000000000) } }
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

def s086_t6_sb005_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((765429037 : ℚ) / 12500000000)
      ((-356297059 : ℚ) / 1000000000000)
      ((475776903 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((677636492742297 : ℚ) / 125000000000000000)
              hi := ((484466757582473 : ℚ) / 50000000000000000) }
      im := { lo := ((-163826726464457 : ℚ) / 2500000000000000)
              hi := ((-3065588527912599 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((6862994077338457 : ℚ) / 1000000000000000000)
              hi := ((1629055887892059 : ℚ) / 200000000000000000) }
      im := { lo := ((-16323601326719 : ℚ) / 2500000000000000)
              hi := ((-5251087247327231 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-110918165995523 : ℚ) / 125000000000000000)
              hi := ((-5167708905202031 : ℚ) / 20000000000000000000) }
      im := { lo := ((17450879909142651 : ℚ) / 10000000000000000000)
              hi := ((23743175972043683 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-3889697726500517 : ℚ) / 5000000000000000000)
              hi := ((2965732812769091 : ℚ) / 5000000000000000000) }
      im := { lo := ((-6974058546622279 : ℚ) / 25000000000000000000)
              hi := ((81625928256473 : ℚ) / 78125000000000000) } }
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

def s086_t6_sb006_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((765429037 : ℚ) / 12500000000)
      ((-356297059 : ℚ) / 1000000000000)
      ((475776903 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((5428968091368699 : ℚ) / 1000000000000000000)
              hi := ((151517569104123 : ℚ) / 15625000000000000) }
      im := { lo := ((-3275872280465981 : ℚ) / 50000000000000000)
              hi := ((-6129864940809479 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((6855109716870643 : ℚ) / 1000000000000000000)
              hi := ((1627436712160869 : ℚ) / 200000000000000000) }
      im := { lo := ((-6539436204778163 : ℚ) / 1000000000000000000)
              hi := ((-5261315503459297 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-8844101489422143 : ℚ) / 10000000000000000000)
              hi := ((-1277418128080867 : ℚ) / 5000000000000000000) }
      im := { lo := ((17459220541978819 : ℚ) / 10000000000000000000)
              hi := ((2375120151344949 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7778178984935919 : ℚ) / 10000000000000000000)
              hi := ((1483145877701117 : ℚ) / 2500000000000000000) }
      im := { lo := ((-111573454719537 : ℚ) / 400000000000000000)
              hi := ((522400714318447 : ℚ) / 500000000000000000) } }
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

def s086_t6_sb007_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((765429037 : ℚ) / 12500000000)
      ((-356297059 : ℚ) / 1000000000000)
      ((475776903 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((2718430847307717 : ℚ) / 500000000000000000)
              hi := ((9704929996760557 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3275210649504083 : ℚ) / 50000000000000000)
              hi := ((-245142163660831 : ℚ) / 4000000000000000) } }
  D0Rect :=
    { re := { lo := ((6847211878099731 : ℚ) / 1000000000000000000)
              hi := ((2032268477783361 : ℚ) / 250000000000000000) }
      im := { lo := ((-6549421920839841 : ℚ) / 1000000000000000000)
              hi := ((-10543064080492973 : ℚ) / 2000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-8814740005122531 : ℚ) / 10000000000000000000)
              hi := ((-2525804426943867 : ℚ) / 10000000000000000000) }
      im := { lo := ((3493503716029129 : ℚ) / 2000000000000000000)
              hi := ((2375918703024449 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7776958942890823 : ℚ) / 10000000000000000000)
              hi := ((2966848602424249 : ℚ) / 5000000000000000000) }
      im := { lo := ((-3486306211650427 : ℚ) / 12500000000000000000)
              hi := ((417916214665861 : ℚ) / 400000000000000000) } }
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

def s086_t6_sb008_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((765429037 : ℚ) / 12500000000)
      ((-356297059 : ℚ) / 1000000000000)
      ((475776903 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((27223866741458193 : ℚ) / 5000000000000000000)
              hi := ((4856375618919491 : ℚ) / 500000000000000000) }
      im := { lo := ((-1309819837750113 : ℚ) / 20000000000000000)
              hi := ((-12254489197273509 : ℚ) / 200000000000000000) } }
  D0Rect :=
    { re := { lo := ((273572027800083 : ℚ) / 40000000000000000)
              hi := ((4060475191064149 : ℚ) / 500000000000000000) }
      im := { lo := ((-6559396796686057 : ℚ) / 1000000000000000000)
              hi := ((-10563475408803433 : ℚ) / 2000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-8785366208325091 : ℚ) / 10000000000000000000)
              hi := ((-24967616923931863 : ℚ) / 100000000000000000000) }
      im := { lo := ((17475776170251679 : ℚ) / 10000000000000000000)
              hi := ((742722823127037 : ℚ) / 312500000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-971966773125697 : ℚ) / 1250000000000000000)
              hi := ((2967402783844181 : ℚ) / 5000000000000000000) }
      im := { lo := ((-6971872284326929 : ℚ) / 25000000000000000000)
              hi := ((417911670052349 : ℚ) / 400000000000000000) } }
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

def s086_t6_sb009_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((765429037 : ℚ) / 12500000000)
      ((-356297059 : ℚ) / 1000000000000)
      ((475776903 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((340793949820623 : ℚ) / 62500000000000000)
              hi := ((97205879627979 : ℚ) / 10000000000000000) }
      im := { lo := ((-6547778216627437 : ℚ) / 100000000000000000)
              hi := ((-1914355149347 : ℚ) / 31250000000000) } }
  D0Rect :=
    { re := { lo := ((6831376323658789 : ℚ) / 1000000000000000000)
              hi := ((2028203211196449 : ℚ) / 250000000000000000) }
      im := { lo := ((-6569360578780063 : ℚ) / 1000000000000000000)
              hi := ((-1322983177979491 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-8755979198150727 : ℚ) / 10000000000000000000)
              hi := ((-6169272668270059 : ℚ) / 25000000000000000000) }
      im := { lo := ((273187409196457 : ℚ) / 156250000000000000)
              hi := ((594375763221767 : ℚ) / 250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7774504804215519 : ℚ) / 10000000000000000000)
              hi := ((370994293379173 : ℚ) / 625000000000000000) }
      im := { lo := ((-69711221998421 : ℚ) / 250000000000000000)
              hi := ((10447674119056709 : ℚ) / 10000000000000000000) } }
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

def s086_t6_sb010_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((765429037 : ℚ) / 12500000000)
      ((-356297059 : ℚ) / 1000000000000)
      ((475776903 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((2730325390605663 : ℚ) / 500000000000000000)
              hi := ((4864220328729873 : ℚ) / 500000000000000000) }
      im := { lo := ((-3273229211185197 : ℚ) / 50000000000000000)
              hi := ((-191394678012711 : ℚ) / 3125000000000000) } }
  D0Rect :=
    { re := { lo := ((6823438808578681 : ℚ) / 1000000000000000000)
              hi := ((202616532102673 : ℚ) / 25000000000000000) }
      im := { lo := ((-6579313418110739 : ℚ) / 1000000000000000000)
              hi := ((-1325529217363999 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-8726579455956343 : ℚ) / 10000000000000000000)
              hi := ((-24386461947233773 : ℚ) / 100000000000000000000) }
      im := { lo := ((699686893374947 : ℚ) / 400000000000000000)
              hi := ((1189144392709153 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-777327347623433 : ℚ) / 1000000000000000000)
              hi := ((5937009257683711 : ℚ) / 10000000000000000000) }
      im := { lo := ((-27881455669913157 : ℚ) / 100000000000000000000)
              hi := ((2611888292812713 : ℚ) / 2500000000000000000) } }
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

def s086_t6_sb011_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((765429037 : ℚ) / 12500000000)
      ((-356297059 : ℚ) / 1000000000000)
      ((475776903 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((5468615942044921 : ℚ) / 1000000000000000000)
              hi := ((4868154682209647 : ℚ) / 500000000000000000) }
      im := { lo := ((-3272569904813981 : ℚ) / 50000000000000000)
              hi := ((-3061662124789741 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((6815487861951129 : ℚ) / 1000000000000000000)
              hi := ((4048248012024547 : ℚ) / 500000000000000000) }
      im := { lo := ((-6589254969840631 : ℚ) / 1000000000000000000)
              hi := ((-166009077900263 : ℚ) / 31250000000000000) } }
  DrestRect :=
    { re := { lo := ((-869716676149113 : ℚ) / 1000000000000000000)
              hi := ((-12047867069337857 : ℚ) / 50000000000000000000) }
      im := { lo := ((8750155221849711 : ℚ) / 5000000000000000000)
              hi := ((2379070246997461 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7772039496213313 : ℚ) / 10000000000000000000)
              hi := ((1484526639866903 : ℚ) / 2500000000000000000) }
      im := { lo := ((-5575681104746863 : ℚ) / 20000000000000000000)
              hi := ((1044743048395807 : ℚ) / 1000000000000000000) } }
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

def s086_t6_sb012_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((765429037 : ℚ) / 12500000000)
      ((-356297059 : ℚ) / 1000000000000)
      ((475776903 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((2190638443989 : ℚ) / 400000000000000)
              hi := ((4872098380765141 : ℚ) / 500000000000000000) }
      im := { lo := ((-3271911273399581 : ℚ) / 50000000000000000)
              hi := ((-2448807993537577 : ℚ) / 40000000000000000) } }
  D0Rect :=
    { re := { lo := ((6807523266347211 : ℚ) / 1000000000000000000)
              hi := ((8088317302292827 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3299592686596699 : ℚ) / 500000000000000000)
              hi := ((-5322453404851709 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2166935522034121 : ℚ) / 2500000000000000000)
              hi := ((-11902449265467921 : ℚ) / 50000000000000000000) }
      im := { lo := ((17508407521616227 : ℚ) / 10000000000000000000)
              hi := ((1189923766197049 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7770817235043531 : ℚ) / 10000000000000000000)
              hi := ((185600467622967 : ℚ) / 312500000000000000) }
      im := { lo := ((-139376931707187 : ℚ) / 500000000000000000)
              hi := ((522365543118473 : ℚ) / 500000000000000000) } }
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

def s086_t6_sb013_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((765429037 : ℚ) / 12500000000)
      ((-356297059 : ℚ) / 1000000000000)
      ((475776903 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((1096918591238131 : ℚ) / 200000000000000000)
              hi := ((1950420210616309 : ℚ) / 200000000000000000) }
      im := { lo := ((-1635626628120311 : ℚ) / 25000000000000000)
              hi := ((-6120717012145451 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((679954515537339 : ℚ) / 100000000000000000)
              hi := ((4040062510568299 : ℚ) / 500000000000000000) }
      im := { lo := ((-6609104714369299 : ℚ) / 1000000000000000000)
              hi := ((-666575685691137 : ℚ) / 125000000000000000) } }
  DrestRect :=
    { re := { lo := ((-269947048213317 : ℚ) / 312500000000000000)
              hi := ((-23513955302214513 : ℚ) / 100000000000000000000) }
      im := { lo := ((1751646366467683 : ℚ) / 1000000000000000000)
              hi := ((2380620630018163 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7769597081815861 : ℚ) / 10000000000000000000)
              hi := ((5940324866539993 : ℚ) / 10000000000000000000) }
      im := { lo := ((-2787234696275999 : ℚ) / 10000000000000000000)
              hi := ((2089437836900319 : ℚ) / 2000000000000000000) } }
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

def s086_t6_sb014_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((765429037 : ℚ) / 12500000000)
      ((-356297059 : ℚ) / 1000000000000)
      ((475776903 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((5492606480488457 : ℚ) / 1000000000000000000)
              hi := ((97600222101919 : ℚ) / 10000000000000000) }
      im := { lo := ((-817648964650127 : ℚ) / 12500000000000000)
              hi := ((-1223883066567379 : ℚ) / 20000000000000000) } }
  D0Rect :=
    { re := { lo := ((6791553877958321 : ℚ) / 1000000000000000000)
              hi := ((4035959429258851 : ℚ) / 500000000000000000) }
      im := { lo := ((-3309506763708451 : ℚ) / 500000000000000000)
              hi := ((-2671373075520573 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1721771609901389 : ℚ) / 2000000000000000000)
              hi := ((-5805724126521627 : ℚ) / 25000000000000000000) }
      im := { lo := ((17524478604471299 : ℚ) / 10000000000000000000)
              hi := ((74418423771297 : ℚ) / 31250000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7768380101749209 : ℚ) / 10000000000000000000)
              hi := ((5941437333781759 : ℚ) / 10000000000000000000) }
      im := { lo := ((-2786926514850517 : ℚ) / 10000000000000000000)
              hi := ((5223531614851981 : ℚ) / 5000000000000000000) } }
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

def s086_t6_sb015_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((765429037 : ℚ) / 12500000000)
      ((-356297059 : ℚ) / 1000000000000)
      ((475776903 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((2750318332084859 : ℚ) / 500000000000000000)
              hi := ((1220995037387813 : ℚ) / 125000000000000000) }
      im := { lo := ((-1307975637063157 : ℚ) / 20000000000000000)
              hi := ((-30590574632793577 : ℚ) / 500000000000000000) } }
  D0Rect :=
    { re := { lo := ((3391774708700103 : ℚ) / 500000000000000000)
              hi := ((20159247159959 : ℚ) / 2500000000000000) }
      im := { lo := ((-3314455836968611 : ℚ) / 500000000000000000)
              hi := ((-5352875519594931 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-8579399370177687 : ℚ) / 10000000000000000000)
              hi := ((-11465862767387243 : ℚ) / 50000000000000000000) }
      im := { lo := ((8766226260280471 : ℚ) / 5000000000000000000)
              hi := ((1191077153287723 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7767166038160207 : ℚ) / 10000000000000000000)
              hi := ((37140950658783 : ℚ) / 62500000000000000) }
      im := { lo := ((-111464650843221 : ℚ) / 400000000000000000)
              hi := ((10446935181411799 : ℚ) / 10000000000000000000) } }
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

def s086_t6_sb016_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((765429037 : ℚ) / 12500000000)
      ((-356297059 : ℚ) / 1000000000000)
      ((475776903 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((1101736723235533 : ℚ) / 200000000000000000)
              hi := ((4887957553375069 : ℚ) / 500000000000000000) }
      im := { lo := ((-3269282934127653 : ℚ) / 50000000000000000)
              hi := ((-2446726336820369 : ℚ) / 40000000000000000) } }
  D0Rect :=
    { re := { lo := ((6775531459657707 : ℚ) / 1000000000000000000)
              hi := ((4027732689270561 : ℚ) / 500000000000000000) }
      im := { lo := ((-6638798522803067 : ℚ) / 1000000000000000000)
              hi := ((-268149709056813 : ℚ) / 50000000000000000) } }
  DrestRect :=
    { re := { lo := ((-8549928543060947 : ℚ) / 10000000000000000000)
              hi := ((-11320226596864143 : ℚ) / 50000000000000000000) }
      im := { lo := ((17540385760605461 : ℚ) / 10000000000000000000)
              hi := ((23829148285481553 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7765953599428933 : ℚ) / 10000000000000000000)
              hi := ((742958486927879 : ℚ) / 1250000000000000000) }
      im := { lo := ((-27863037207293207 : ℚ) / 100000000000000000000)
              hi := ((5223402397025109 : ℚ) / 5000000000000000000) } }
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

def s086_t6_sb017_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((765429037 : ℚ) / 12500000000)
      ((-356297059 : ℚ) / 1000000000000)
      ((475776903 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((1103349652182253 : ℚ) / 200000000000000000)
              hi := ((978388573997013 : ℚ) / 100000000000000000) }
      im := { lo := ((-3268627356120407 : ℚ) / 50000000000000000)
              hi := ((-6115518137514899 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((676750039603691 : ℚ) / 100000000000000000)
              hi := ((8047218041317193 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6648673949908779 : ℚ) / 1000000000000000000)
              hi := ((-5373102214384279 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1704088911017999 : ℚ) / 2000000000000000000)
              hi := ((-893963636724767 : ℚ) / 4000000000000000000) }
      im := { lo := ((4387069892479079 : ℚ) / 2500000000000000000)
              hi := ((148979437332763 : ℚ) / 62500000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1552947890555123 : ℚ) / 2000000000000000000)
              hi := ((5944781368747091 : ℚ) / 10000000000000000000) }
      im := { lo := ((-2785987694158237 : ℚ) / 10000000000000000000)
              hi := ((5223335449366371 : ℚ) / 5000000000000000000) } }
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

def s086_t6_sb018_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((765429037 : ℚ) / 12500000000)
      ((-356297059 : ℚ) / 1000000000000)
      ((475776903 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((5524829425316157 : ℚ) / 1000000000000000000)
              hi := ((2447968334685643 : ℚ) / 250000000000000000) }
      im := { lo := ((-3267972413898487 : ℚ) / 50000000000000000)
              hi := ((-6114221717343409 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((1351891200755217 : ℚ) / 200000000000000000)
              hi := ((803895709600829 : ℚ) / 100000000000000000) }
      im := { lo := ((-6658537966254633 : ℚ) / 1000000000000000000)
              hi := ((-5383199588486491 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-212273699890697 : ℚ) / 250000000000000000)
              hi := ((-4411526721151669 : ℚ) / 20000000000000000000) }
      im := { lo := ((17556133243494109 : ℚ) / 10000000000000000000)
              hi := ((11922114410235147 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-388176425669501 : ℚ) / 500000000000000000)
              hi := ((371618590129299 : ℚ) / 625000000000000000) }
      im := { lo := ((-2785672830958733 : ℚ) / 10000000000000000000)
              hi := ((2611634535798831 : ℚ) / 2500000000000000000) } }
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

def s086_t6_sb019_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((765429037 : ℚ) / 12500000000)
      ((-356297059 : ℚ) / 1000000000000)
      ((475776903 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((5532927107894387 : ℚ) / 1000000000000000000)
              hi := ((2449969464628611 : ℚ) / 250000000000000000) }
      im := { lo := ((-6534636309306087 : ℚ) / 100000000000000000)
              hi := ((-6112926470233347 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((33756989626525483 : ℚ) / 5000000000000000000)
              hi := ((1606136591214091 : ℚ) / 200000000000000000) }
      im := { lo := ((-6668390635690979 : ℚ) / 1000000000000000000)
              hi := ((-539328618318837 : ℚ) / 100000000000000000) } }
  DrestRect :=
    { re := { lo := ((-4230720015220561 : ℚ) / 5000000000000000000)
              hi := ((-870642860246801 : ℚ) / 4000000000000000000) }
      im := { lo := ((4390986372086723 : ℚ) / 2500000000000000000)
              hi := ((11925853043603203 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1940579019908901 : ℚ) / 2500000000000000000)
              hi := ((1189402282998827 : ℚ) / 2000000000000000000) }
      im := { lo := ((-13926829943130707 : ℚ) / 50000000000000000000)
              hi := ((5223206686403829 : ℚ) / 5000000000000000000) } }
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

def s086_t6_sb020_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((765429037 : ℚ) / 12500000000)
      ((-356297059 : ℚ) / 1000000000000)
      ((475776903 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((692630273439771 : ℚ) / 125000000000000000)
              hi := ((9807898416220817 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3266664522231359 : ℚ) / 50000000000000000)
              hi := ((-763954064589051 : ℚ) / 12500000000000000) } }
  D0Rect :=
    { re := { lo := ((6743326775828557 : ℚ) / 1000000000000000000)
              hi := ((8022395012968291 : ℚ) / 1000000000000000000) }
      im := { lo := ((-13356464134487149 : ℚ) / 2000000000000000000)
              hi := ((-1350840468570937 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-8431919720182741 : ℚ) / 10000000000000000000)
              hi := ((-858976579455289 : ℚ) / 4000000000000000000) }
      im := { lo := ((439292944103051 : ℚ) / 250000000000000000)
              hi := ((238591402891387 : ℚ) / 100000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1940275375984609 : ℚ) / 2500000000000000000)
              hi := ((23792490561931 : ℚ) / 40000000000000000) }
      im := { lo := ((-1114024193216863 : ℚ) / 4000000000000000000)
              hi := ((2089257981613771 : ℚ) / 2000000000000000000) } }
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

def s086_t6_sb021_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((765429037 : ℚ) / 12500000000)
      ((-356297059 : ℚ) / 1000000000000)
      ((475776903 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((221966909964059 : ℚ) / 40000000000000000)
              hi := ((39263747501601 : ℚ) / 4000000000000000) }
      im := { lo := ((-1306404671239303 : ℚ) / 20000000000000000)
              hi := ((-1527584891870289 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((673524169321309 : ℚ) / 100000000000000000)
              hi := ((8014094164512247 : ℚ) / 1000000000000000000) }
      im := { lo := ((-83600790767429 : ℚ) / 12500000000000000)
              hi := ((-2706712803355659 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-8402391882618013 : ℚ) / 10000000000000000000)
              hi := ((-2118261587946809 : ℚ) / 10000000000000000000) }
      im := { lo := ((4394861351196389 : ℚ) / 2500000000000000000)
              hi := ((5966634008983591 : ℚ) / 2500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1939971515956237 : ℚ) / 2500000000000000000)
              hi := ((5949232397947909 : ℚ) / 10000000000000000000) }
      im := { lo := ((-2784768342026781 : ℚ) / 10000000000000000000)
              hi := ((10446179793960437 : ℚ) / 10000000000000000000) } }
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

def s086_t6_sb022_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((765429037 : ℚ) / 12500000000)
      ((-356297059 : ℚ) / 1000000000000)
      ((475776903 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((5557320305771361 : ℚ) / 1000000000000000000)
              hi := ((4911995876089673 : ℚ) / 500000000000000000) }
      im := { lo := ((-3265359465175883 : ℚ) / 50000000000000000)
              hi := ((-763630988085917 : ℚ) / 12500000000000000) } }
  D0Rect :=
    { re := { lo := ((3363571645083477 : ℚ) / 500000000000000000)
              hi := ((4002889913622379 : ℚ) / 500000000000000000) }
      im := { lo := ((-6697883703465629 : ℚ) / 1000000000000000000)
              hi := ((-5423477868468001 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-8372853902072523 : ℚ) / 10000000000000000000)
              hi := ((-10445351440282341 : ℚ) / 50000000000000000000) }
      im := { lo := ((4396782784862029 : ℚ) / 2500000000000000000)
              hi := ((1193694529165559 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1939667305613839 : ℚ) / 2500000000000000000)
              hi := ((5950340148690763 : ℚ) / 10000000000000000000) }
      im := { lo := ((-2784474148389983 : ℚ) / 10000000000000000000)
              hi := ((522303379702957 : ℚ) / 500000000000000000) } }
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

def s086_t6_sb023_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((765429037 : ℚ) / 12500000000)
      ((-356297059 : ℚ) / 1000000000000)
      ((475776903 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((5565485483750421 : ℚ) / 1000000000000000000)
              hi := ((983206235159051 : ℚ) / 100000000000000000) }
      im := { lo := ((-652941573864983 : ℚ) / 10000000000000000)
              hi := ((-3053878788415391 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((6719031903274629 : ℚ) / 1000000000000000000)
              hi := ((1999362926277759 : ℚ) / 250000000000000000) }
      im := { lo := ((-838461595932877 : ℚ) / 125000000000000000)
              hi := ((-6791899062426447 : ℚ) / 1250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-104291293390261 : ℚ) / 125000000000000000)
              hi := ((-2059869992360673 : ℚ) / 10000000000000000000) }
      im := { lo := ((8797388565682867 : ℚ) / 5000000000000000000)
              hi := ((23881201751987657 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7757449198473377 : ℚ) / 10000000000000000000)
              hi := ((1487861028519709 : ℚ) / 2500000000000000000) }
      im := { lo := ((-5568360253637661 : ℚ) / 20000000000000000000)
              hi := ((1044595554330179 : ℚ) / 1000000000000000000) } }
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

def s086_t6_sb024_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((765429037 : ℚ) / 12500000000)
      ((-356297059 : ℚ) / 1000000000000)
      ((475776903 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((5573668443944863 : ℚ) / 1000000000000000000)
              hi := ((1968029700552423 : ℚ) / 200000000000000000) }
      im := { lo := ((-6528113712596753 : ℚ) / 100000000000000000)
              hi := ((-6106468651179161 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((3355453615110501 : ℚ) / 500000000000000000)
              hi := ((7989110109590827 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6717490431999701 : ℚ) / 1000000000000000000)
              hi := ((-5443549732093367 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-415687063787643 : ℚ) / 500000000000000000)
              hi := ((-20306601004855399 : ℚ) / 100000000000000000000) }
      im := { lo := ((8801191243858847 : ℚ) / 5000000000000000000)
              hi := ((1194423518433033 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7756224693286807 : ℚ) / 10000000000000000000)
              hi := ((119050859931423 : ℚ) / 200000000000000000) }
      im := { lo := ((-1391940683041091 : ℚ) / 5000000000000000000)
              hi := ((5222919364213911 : ℚ) / 5000000000000000000) } }
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

def s086_t6_sb025_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((765429037 : ℚ) / 12500000000)
      ((-356297059 : ℚ) / 1000000000000)
      ((475776903 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((27909344518046173 : ℚ) / 5000000000000000000)
              hi := ((246206261512019 : ℚ) / 25000000000000000) }
      im := { lo := ((-3263406492176233 : ℚ) / 50000000000000000)
              hi := ((-6105181003528031 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((2681107792978471 : ℚ) / 400000000000000000)
              hi := ((7980754871620109 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6727276820138339 : ℚ) / 1000000000000000000)
              hi := ((-5453569161434501 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1656833473857851 : ℚ) / 2000000000000000000)
              hi := ((-1000720345394327 : ℚ) / 5000000000000000000) }
      im := { lo := ((550310857819579 : ℚ) / 312500000000000000)
              hi := ((2389569618732561 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1938748904944753 : ℚ) / 2500000000000000000)
              hi := ((5953636709428871 : ℚ) / 10000000000000000000) }
      im := { lo := ((-13917930880565053 : ℚ) / 50000000000000000000)
              hi := ((10445725462836257 : ℚ) / 10000000000000000000) } }
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

def s086_t6_sb026_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((765429037 : ℚ) / 12500000000)
      ((-356297059 : ℚ) / 1000000000000)
      ((475776903 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((2795043242144333 : ℚ) / 500000000000000000)
              hi := ((9856368571728957 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1305102734865819 : ℚ) / 20000000000000000)
              hi := ((-610389450924369 : ℚ) / 10000000000000000) } }
  D0Rect :=
    { re := { lo := ((3347309368144409 : ℚ) / 500000000000000000)
              hi := ((3986192976757171 : ℚ) / 500000000000000000) }
      im := { lo := ((-6737052230921227 : ℚ) / 1000000000000000000)
              hi := ((-546357720259453 : ℚ) / 100000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2063645647674389 : ℚ) / 2500000000000000000)
              hi := ((-1972211057361267 : ℚ) / 10000000000000000000) }
      im := { lo := ((17617471501772527 : ℚ) / 10000000000000000000)
              hi := ((23902879705303393 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1550752369351129 : ℚ) / 2000000000000000000)
              hi := ((5954725122372457 : ℚ) / 10000000000000000000) }
      im := { lo := ((-1391650577428133 : ℚ) / 5000000000000000000)
              hi := ((10445622340729663 : ℚ) / 10000000000000000000) } }
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

def s086_t6_sb027_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((765429037 : ℚ) / 12500000000)
      ((-356297059 : ℚ) / 1000000000000)
      ((475776903 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((174947558263371 : ℚ) / 31250000000000000)
              hi := ((4932251074143667 : ℚ) / 500000000000000000) }
      im := { lo := ((-3262107767705019 : ℚ) / 50000000000000000)
              hi := ((-6102609428518371 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((835806859508777 : ℚ) / 125000000000000000)
              hi := ((7964003493717717 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6746816131661671 : ℚ) / 1000000000000000000)
              hi := ((-2736787169271033 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-4112492920207263 : ℚ) / 5000000000000000000)
              hi := ((-19429724224161553 : ℚ) / 100000000000000000000) }
      im := { lo := ((8812477661493663 : ℚ) / 5000000000000000000)
              hi := ((597750504431313 : ℚ) / 250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7752523967121419 : ℚ) / 10000000000000000000)
              hi := ((5955808828668897 : ℚ) / 10000000000000000000) }
      im := { lo := ((-2783011681991981 : ℚ) / 10000000000000000000)
              hi := ((2611378686842339 : ℚ) / 2500000000000000000) } }
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

def s086_t6_sb028_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((765429037 : ℚ) / 12500000000)
      ((-356297059 : ℚ) / 1000000000000)
      ((475776903 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((5606574019553859 : ℚ) / 1000000000000000000)
              hi := ((1234081521667377 : ℚ) / 125000000000000000) }
      im := { lo := ((-3261459312585737 : ℚ) / 50000000000000000)
              hi := ((-6101325703186971 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((417392336843029 : ℚ) / 62500000000000000)
              hi := ((7955608028849197 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6756568862132541 : ℚ) / 1000000000000000000)
              hi := ((-1096712042591323 : ℚ) / 200000000000000000) } }
  DrestRect :=
    { re := { lo := ((-8195379242664829 : ℚ) / 10000000000000000000)
              hi := ((-9568613711814051 : ℚ) / 50000000000000000000) }
      im := { lo := ((4408099175803539 : ℚ) / 2500000000000000000)
              hi := ((2391711981109381 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1550256992547869 : ℚ) / 2000000000000000000)
              hi := ((5956890812113197 : ℚ) / 10000000000000000000) }
      im := { lo := ((-27827173892134357 : ℚ) / 100000000000000000000)
              hi := ((32641882230741 : ℚ) / 31250000000000000) } }
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

def s086_t6_sb029_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((765429037 : ℚ) / 12500000000)
      ((-356297059 : ℚ) / 1000000000000)
      ((475776903 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((701855438467239 : ℚ) / 125000000000000000)
              hi := ((1235102261064107 : ℚ) / 125000000000000000) }
      im := { lo := ((-407601433562079 : ℚ) / 6250000000000000)
              hi := ((-6100043341680189 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((3335043277522161 : ℚ) / 500000000000000000)
              hi := ((3973599657542553 : ℚ) / 500000000000000000) }
      im := { lo := ((-2706524034520133 : ℚ) / 400000000000000000)
              hi := ((-27467675573537103 : ℚ) / 5000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-8165761437859963 : ℚ) / 10000000000000000000)
              hi := ((-1884463517513349 : ℚ) / 10000000000000000000) }
      im := { lo := ((220497462661193 : ℚ) / 125000000000000000)
              hi := ((2392417719185541 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-3875021270915183 : ℚ) / 5000000000000000000)
              hi := ((119159375605851 : ℚ) / 200000000000000000) }
      im := { lo := ((-13912104621935923 : ℚ) / 50000000000000000000)
              hi := ((5222643843577809 : ℚ) / 5000000000000000000) } }
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

def s086_t6_sb030_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((765429037 : ℚ) / 12500000000)
      ((-356297059 : ℚ) / 1000000000000)
      ((475776903 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((5623129222961051 : ℚ) / 1000000000000000000)
              hi := ((395560036659809 : ℚ) / 40000000000000000) }
      im := { lo := ((-81504107234437 : ℚ) / 1250000000000000)
              hi := ((-762345281099859 : ℚ) / 12500000000000000) } }
  D0Rect :=
    { re := { lo := ((6661882126098951 : ℚ) / 1000000000000000000)
              hi := ((3969388820956433 : ℚ) / 500000000000000000) }
      im := { lo := ((-1694009961674259 : ℚ) / 250000000000000000)
              hi := ((-1375874741125323 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-813613323203087 : ℚ) / 1000000000000000000)
              hi := ((-3710388166146667 : ℚ) / 20000000000000000000) }
      im := { lo := ((17647155361008731 : ℚ) / 10000000000000000000)
              hi := ((23931193195973043 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-7748800744974379 : ℚ) / 10000000000000000000)
              hi := ((5959046777334927 : ℚ) / 10000000000000000000) }
      im := { lo := ((-1391063390842623 : ℚ) / 5000000000000000000)
              hi := ((1044517536741653 : ℚ) / 1000000000000000000) } }
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

def s086_t6_sb031_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((765429037 : ℚ) / 12500000000)
      ((-356297059 : ℚ) / 1000000000000)
      ((475776903 : ℚ) / 125000000000) where
  MRect :=
    { re := { lo := ((2815715782430187 : ℚ) / 500000000000000000)
              hi := ((61857501984091 : ℚ) / 6250000000000000) }
      im := { lo := ((-325951773329069 : ℚ) / 5000000000000000)
              hi := ((-30487412513152453 : ℚ) / 500000000000000000) } }
  D0Rect :=
    { re := { lo := ((266146588905987 : ℚ) / 40000000000000000)
              hi := ((158606848046969 : ℚ) / 20000000000000000) }
      im := { lo := ((-6785758497135981 : ℚ) / 1000000000000000000)
              hi := ((-5513451385595483 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-8106494396614893 : ℚ) / 10000000000000000000)
              hi := ((-9129573683216073 : ℚ) / 50000000000000000000) }
      im := { lo := ((1103404543200327 : ℚ) / 625000000000000000)
              hi := ((2393816684978027 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-48422260575689 : ℚ) / 62500000000000000)
              hi := ((596012691998019 : ℚ) / 1000000000000000000) }
      im := { lo := ((-13909141933543523 : ℚ) / 50000000000000000000)
              hi := ((5222529388179567 : ℚ) / 5000000000000000000) } }
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
    (hi : i ∈ positiveBoxSubboxesOf .s086_t6) :
    ProjectedJ0SubboxRectangleCertificateData
      ((positiveBoxCombinedCert .s086_t6).constants.mainLower)
      ((positiveBoxCombinedCert .s086_t6).constants.d0NegReUpper)
      ((positiveBoxCombinedCert .s086_t6).constants.restUpper) := by
  if h0 : i = .s086_t6_sb000 then
    exact s086_t6_sb000_certificateData
  else if h1 : i = .s086_t6_sb001 then
    exact s086_t6_sb001_certificateData
  else if h2 : i = .s086_t6_sb002 then
    exact s086_t6_sb002_certificateData
  else if h3 : i = .s086_t6_sb003 then
    exact s086_t6_sb003_certificateData
  else if h4 : i = .s086_t6_sb004 then
    exact s086_t6_sb004_certificateData
  else if h5 : i = .s086_t6_sb005 then
    exact s086_t6_sb005_certificateData
  else if h6 : i = .s086_t6_sb006 then
    exact s086_t6_sb006_certificateData
  else if h7 : i = .s086_t6_sb007 then
    exact s086_t6_sb007_certificateData
  else if h8 : i = .s086_t6_sb008 then
    exact s086_t6_sb008_certificateData
  else if h9 : i = .s086_t6_sb009 then
    exact s086_t6_sb009_certificateData
  else if h10 : i = .s086_t6_sb010 then
    exact s086_t6_sb010_certificateData
  else if h11 : i = .s086_t6_sb011 then
    exact s086_t6_sb011_certificateData
  else if h12 : i = .s086_t6_sb012 then
    exact s086_t6_sb012_certificateData
  else if h13 : i = .s086_t6_sb013 then
    exact s086_t6_sb013_certificateData
  else if h14 : i = .s086_t6_sb014 then
    exact s086_t6_sb014_certificateData
  else if h15 : i = .s086_t6_sb015 then
    exact s086_t6_sb015_certificateData
  else if h16 : i = .s086_t6_sb016 then
    exact s086_t6_sb016_certificateData
  else if h17 : i = .s086_t6_sb017 then
    exact s086_t6_sb017_certificateData
  else if h18 : i = .s086_t6_sb018 then
    exact s086_t6_sb018_certificateData
  else if h19 : i = .s086_t6_sb019 then
    exact s086_t6_sb019_certificateData
  else if h20 : i = .s086_t6_sb020 then
    exact s086_t6_sb020_certificateData
  else if h21 : i = .s086_t6_sb021 then
    exact s086_t6_sb021_certificateData
  else if h22 : i = .s086_t6_sb022 then
    exact s086_t6_sb022_certificateData
  else if h23 : i = .s086_t6_sb023 then
    exact s086_t6_sb023_certificateData
  else if h24 : i = .s086_t6_sb024 then
    exact s086_t6_sb024_certificateData
  else if h25 : i = .s086_t6_sb025 then
    exact s086_t6_sb025_certificateData
  else if h26 : i = .s086_t6_sb026 then
    exact s086_t6_sb026_certificateData
  else if h27 : i = .s086_t6_sb027 then
    exact s086_t6_sb027_certificateData
  else if h28 : i = .s086_t6_sb028 then
    exact s086_t6_sb028_certificateData
  else if h29 : i = .s086_t6_sb029 then
    exact s086_t6_sb029_certificateData
  else if h30 : i = .s086_t6_sb030 then
    exact s086_t6_sb030_certificateData
  else if h31 : i = .s086_t6_sb031 then
    exact s086_t6_sb031_certificateData
  else
    simp [positiveBoxSubboxesOf, h0, h1, h2, h3, h4, h5, h6, h7, h8, h9, h10, h11, h12, h13, h14, h15, h16, h17, h18, h19, h20, h21, h22, h23, h24, h25, h26, h27, h28, h29, h30, h31] at hi

end S086T6
end ProjectedJ0PositiveBoxRectangleData
end ProjectedJ0PositiveBoxSkeleton
end C2
