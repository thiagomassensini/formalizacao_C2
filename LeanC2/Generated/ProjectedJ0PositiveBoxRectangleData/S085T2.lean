import LeanC2.AuditProjectedJ0PositiveBoxRectangleCertificateSchema
import LeanC2.AuditProjectedJ0PositiveBoxAllSubboxSkeleton
import LeanC2.AuditAdjustedQuartetProjectedJ0PositiveBoxSectorRationalizedData

set_option linter.style.longLine false

/-!
# Generated rectangle data for s0.85_t2

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
namespace S085T2

open ProjectedJ0RectangleArithmetic

def s085_t2_sb000_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((31311481089 : ℚ) / 500000000000)
      ((-268459131 : ℚ) / 1000000000000)
      ((132917333 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((735066119247473 : ℚ) / 250000000000000000)
              hi := ((1886306376770219 : ℚ) / 250000000000000000) }
      im := { lo := ((-6761155932145917 : ℚ) / 100000000000000000)
              hi := ((-3152538659853737 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((1778875871465889 : ℚ) / 200000000000000000)
              hi := ((1290378702947481 : ℚ) / 125000000000000000) }
      im := { lo := ((-1317815372485587 : ℚ) / 250000000000000000)
              hi := ((-3843050471963439 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-15057608440469897 : ℚ) / 10000000000000000000)
              hi := ((-8119866400429977 : ℚ) / 10000000000000000000) }
      im := { lo := ((4367370172325893 : ℚ) / 2500000000000000000)
              hi := ((2440747734473713 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-529014274083103 : ℚ) / 625000000000000000)
              hi := ((6208332663250741 : ℚ) / 10000000000000000000) }
      im := { lo := ((-801699579050819 : ℚ) / 2500000000000000000)
              hi := ((275753870933591 : ℚ) / 250000000000000000) } }
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

def s085_t2_sb001_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((31311481089 : ℚ) / 500000000000)
      ((-268459131 : ℚ) / 1000000000000)
      ((132917333 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((2945960421128681 : ℚ) / 1000000000000000000)
              hi := ((7550855649580309 : ℚ) / 1000000000000000000) }
      im := { lo := ((-168987455992759 : ℚ) / 2500000000000000)
              hi := ((-6303430090342857 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((1111036230988263 : ℚ) / 125000000000000000)
              hi := ((2579180701620097 : ℚ) / 250000000000000000) }
      im := { lo := ((-5284100064705317 : ℚ) / 1000000000000000000)
              hi := ((-19280670086272659 : ℚ) / 5000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-15027827981986801 : ℚ) / 10000000000000000000)
              hi := ((-316028836147 : ℚ) / 390625000000000) }
      im := { lo := ((4371520708837631 : ℚ) / 2500000000000000000)
              hi := ((3052980223569099 : ℚ) / 1250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4231488614271283 : ℚ) / 5000000000000000000)
              hi := ((1241908516863473 : ℚ) / 2000000000000000000) }
      im := { lo := ((-32065680245487403 : ℚ) / 100000000000000000000)
              hi := ((11030064660243447 : ℚ) / 10000000000000000000) } }
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

def s085_t2_sb002_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((31311481089 : ℚ) / 500000000000)
      ((-268459131 : ℚ) / 1000000000000)
      ((132917333 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((7379191780734971 : ℚ) / 2500000000000000000)
              hi := ((3778252976751989 : ℚ) / 500000000000000000) }
      im := { lo := ((-337892073593597 : ℚ) / 5000000000000000)
              hi := ((-6301783899093433 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((888218272972921 : ℚ) / 100000000000000000)
              hi := ((10310398620857107 : ℚ) / 1000000000000000000) }
      im := { lo := ((-529693030446611 : ℚ) / 100000000000000000)
              hi := ((-19346045233789163 : ℚ) / 5000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2999604878719643 : ℚ) / 2000000000000000000)
              hi := ((-806078629279193 : ℚ) / 1000000000000000000) }
      im := { lo := ((4375660670669223 : ℚ) / 2500000000000000000)
              hi := ((3055020576888167 : ℚ) / 1250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8461726397171611 : ℚ) / 10000000000000000000)
              hi := ((6210752005122173 : ℚ) / 10000000000000000000) }
      im := { lo := ((-32063332383947153 : ℚ) / 100000000000000000000)
              hi := ((1102996983477939 : ℚ) / 1000000000000000000) } }
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

def s085_t2_sb003_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((31311481089 : ℚ) / 500000000000)
      ((-268459131 : ℚ) / 1000000000000)
      ((132917333 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((591482621497653 : ℚ) / 200000000000000000)
              hi := ((37810883716262347 : ℚ) / 5000000000000000000) }
      im := { lo := ((-6756185624269531 : ℚ) / 100000000000000000)
              hi := ((-6300138755539597 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((355042340210169 : ℚ) / 40000000000000000)
              hi := ((10304056601672811 : ℚ) / 1000000000000000000) }
      im := { lo := ((-5309752000853029 : ℚ) / 1000000000000000000)
              hi := ((-1941137850124603 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-14968196246396713 : ℚ) / 10000000000000000000)
              hi := ((-8031212265090217 : ℚ) / 10000000000000000000) }
      im := { lo := ((437979046602261 : ℚ) / 250000000000000000)
              hi := ((244564441047603 : ℚ) / 100000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1692096173450709 : ℚ) / 2000000000000000000)
              hi := ((3105982948114741 : ℚ) / 5000000000000000000) }
      im := { lo := ((-8015235322646449 : ℚ) / 25000000000000000000)
              hi := ((1102987053217199 : ℚ) / 1000000000000000000) } }
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

def s085_t2_sb004_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((31311481089 : ℚ) / 500000000000)
      ((-268459131 : ℚ) / 1000000000000)
      ((132917333 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((5926340836584853 : ℚ) / 2000000000000000000)
              hi := ((37839335259707203 : ℚ) / 5000000000000000000) }
      im := { lo := ((-6754530723954051 : ℚ) / 100000000000000000)
              hi := ((-6298494640853261 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((8869917295614373 : ℚ) / 1000000000000000000)
              hi := ((10297696647753627 : ℚ) / 1000000000000000000) }
      im := { lo := ((-5322564772402633 : ℚ) / 1000000000000000000)
              hi := ((-152161497318451 : ℚ) / 39062500000000000) } }
  DrestRect :=
    { re := { lo := ((-7469171178115069 : ℚ) / 5000000000000000000)
              hi := ((-1600323478908791 : ℚ) / 2000000000000000000) }
      im := { lo := ((17535641458036487 : ℚ) / 10000000000000000000)
              hi := ((3059084893025583 : ℚ) / 1250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8459234431490867 : ℚ) / 10000000000000000000)
              hi := ((776647257364917 : ℚ) / 1250000000000000000) }
      im := { lo := ((-16029282367960887 : ℚ) / 50000000000000000000)
              hi := ((5514886267157771 : ℚ) / 5000000000000000000) } }
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

def s085_t2_sb005_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((31311481089 : ℚ) / 500000000000)
      ((-268459131 : ℚ) / 1000000000000)
      ((132917333 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((463898315520499 : ℚ) / 156250000000000000)
              hi := ((1893394100370871 : ℚ) / 250000000000000000) }
      im := { lo := ((-675287667000867 : ℚ) / 10000000000000000)
              hi := ((-787106457017531 : ℚ) / 12500000000000000) } }
  D0Rect :=
    { re := { lo := ((1772751790756847 : ℚ) / 200000000000000000)
              hi := ((643207432210671 : ℚ) / 62500000000000000) }
      im := { lo := ((-666921074155621 : ℚ) / 125000000000000000)
              hi := ((-3908384907580481 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-372711577848057 : ℚ) / 250000000000000000)
              hi := ((-1594400279724047 : ℚ) / 2000000000000000000) }
      im := { lo := ((877604049916733 : ℚ) / 500000000000000000)
              hi := ((244888700950063 : ℚ) / 100000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4228992352570171 : ℚ) / 5000000000000000000)
              hi := ((1242877220693769 : ℚ) / 2000000000000000000) }
      im := { lo := ((-32056138549840183 : ℚ) / 100000000000000000000)
              hi := ((2757417355460007 : ℚ) / 2500000000000000000) } }
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

def s085_t2_sb006_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((31311481089 : ℚ) / 500000000000)
      ((-268459131 : ℚ) / 1000000000000)
      ((132917333 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((1487374730163803 : ℚ) / 500000000000000000)
              hi := ((3789652377277981 : ℚ) / 500000000000000000) }
      im := { lo := ((-3375611749139179 : ℚ) / 50000000000000000)
              hi := ((-6295209771403779 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((442879168449373 : ℚ) / 50000000000000000)
              hi := ((5142461785187293 : ℚ) / 500000000000000000) }
      im := { lo := ((-668520465088937 : ℚ) / 125000000000000000)
              hi := ((-3921427133305593 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-371963991108027 : ℚ) / 250000000000000000)
              hi := ((-3971181659017541 : ℚ) / 5000000000000000000) }
      im := { lo := ((3513695902148103 : ℚ) / 2000000000000000000)
              hi := ((1225250896177947 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4228365005168837 : ℚ) / 5000000000000000000)
              hi := ((6215588355170781 : ℚ) / 10000000000000000000) }
      im := { lo := ((-400670888881483 : ℚ) / 1250000000000000000)
              hi := ((11029562034844133 : ℚ) / 10000000000000000000) } }
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

def s085_t2_sb007_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((31311481089 : ℚ) / 500000000000)
      ((-268459131 : ℚ) / 1000000000000)
      ((132917333 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((14902854501363963 : ℚ) / 5000000000000000000)
              hi := ((1517010475253509 : ℚ) / 200000000000000000) }
      im := { lo := ((-6749571220124899 : ℚ) / 100000000000000000)
              hi := ((-6293568980602553 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((8851390238324673 : ℚ) / 1000000000000000000)
              hi := ((5139255451147957 : ℚ) / 500000000000000000) }
      im := { lo := ((-214438001523177 : ℚ) / 40000000000000000)
              hi := ((-3934461071414657 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-14848632377803133 : ℚ) / 10000000000000000000)
              hi := ((-7912702783502513 : ℚ) / 10000000000000000000) }
      im := { lo := ((1099052270659547 : ℚ) / 625000000000000000)
              hi := ((12260561584358713 : ℚ) / 5000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-845547052845379 : ℚ) / 1000000000000000000)
              hi := ((6216784995466599 : ℚ) / 10000000000000000000) }
      im := { lo := ((-4006395659262047 : ℚ) / 12500000000000000000)
              hi := ((11029450660416519 : ℚ) / 10000000000000000000) } }
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

def s085_t2_sb008_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((31311481089 : ℚ) / 500000000000)
      ((-268459131 : ℚ) / 1000000000000)
      ((132917333 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((2986413130001361 : ℚ) / 1000000000000000000)
              hi := ((15181639319053971 : ℚ) / 2000000000000000000) }
      im := { lo := ((-3373959946880239 : ℚ) / 50000000000000000)
              hi := ((-6291929229276819 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((8845179886210997 : ℚ) / 1000000000000000000)
              hi := ((410883225067993 : ℚ) / 40000000000000000) }
      im := { lo := ((-1074745547330263 : ℚ) / 200000000000000000)
              hi := ((-61679476370833 : ℚ) / 15625000000000000) } }
  DrestRect :=
    { re := { lo := ((-3704670324683747 : ℚ) / 2500000000000000000)
              hi := ((-7883019954819801 : ℚ) / 10000000000000000000) }
      im := { lo := ((17601151797332797 : ℚ) / 10000000000000000000)
              hi := ((4907437090928701 : ℚ) / 2000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8454209368301403 : ℚ) / 10000000000000000000)
              hi := ((6217979133053697 : ℚ) / 10000000000000000000) }
      im := { lo := ((-32048644891895527 : ℚ) / 100000000000000000000)
              hi := ((2757334421098553 : ℚ) / 2500000000000000000) } }
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

def s085_t2_sb009_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((31311481089 : ℚ) / 500000000000)
      ((-268459131 : ℚ) / 1000000000000)
      ((132917333 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((1496137261890227 : ℚ) / 500000000000000000)
              hi := ((3798304083567451 : ℚ) / 500000000000000000) }
      im := { lo := ((-3373134813728997 : ℚ) / 50000000000000000)
              hi := ((-3145145207421597 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((1104868999431009 : ℚ) / 125000000000000000)
              hi := ((32080103408629 : ℚ) / 3125000000000000) }
      im := { lo := ((-1077299509635457 : ℚ) / 200000000000000000)
              hi := ((-1980251301969307 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-3697177305876457 : ℚ) / 2500000000000000000)
              hi := ((-7853312145813839 : ℚ) / 10000000000000000000) }
      im := { lo := ((3523484670925179 : ℚ) / 2000000000000000000)
              hi := ((613830182048853 : ℚ) / 250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2113238376127139 : ℚ) / 2500000000000000000)
              hi := ((777397218197853 : ℚ) / 1250000000000000000) }
      im := { lo := ((-6409221713368613 : ℚ) / 20000000000000000000)
              hi := ((11029222969104733 : ℚ) / 10000000000000000000) } }
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

def s085_t2_sb010_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((31311481089 : ℚ) / 500000000000)
      ((-268459131 : ℚ) / 1000000000000)
      ((132917333 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((14990782818183727 : ℚ) / 5000000000000000000)
              hi := ((1520483290985671 : ℚ) / 200000000000000000) }
      im := { lo := ((-6744620321065417 : ℚ) / 100000000000000000)
              hi := ((-1572163160322011 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((4416353487624861 : ℚ) / 500000000000000000)
              hi := ((10259167897346199 : ℚ) / 1000000000000000000) }
      im := { lo := ((-10798517982467299 : ℚ) / 2000000000000000000)
              hi := ((-3973509841263479 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-14758714124198677 : ℚ) / 10000000000000000000)
              hi := ((-1564716300167869 : ℚ) / 2000000000000000000) }
      im := { lo := ((3526730602590007 : ℚ) / 2000000000000000000)
              hi := ((24569186535751643 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1056462121445273 : ℚ) / 1250000000000000000)
              hi := ((6220374865747883 : ℚ) / 10000000000000000000) }
      im := { lo := ((-32043541667333363 : ℚ) / 100000000000000000000)
              hi := ((1102910505129953 : ℚ) / 1000000000000000000) } }
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

def s085_t2_sb011_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((31311481089 : ℚ) / 500000000000)
      ((-268459131 : ℚ) / 1000000000000)
      ((132917333 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((23469213760809 : ℚ) / 7812500000000000)
              hi := ((7608244328506983 : ℚ) / 1000000000000000000) }
      im := { lo := ((-674297195376061 : ℚ) / 10000000000000000)
              hi := ((-1257403186893239 : ℚ) / 20000000000000000) } }
  D0Rect :=
    { re := { lo := ((4413222445882583 : ℚ) / 500000000000000000)
              hi := ((10252685015429513 : ℚ) / 1000000000000000000) }
      im := { lo := ((-5412011727620381 : ℚ) / 1000000000000000000)
              hi := ((-7973017025159521 : ℚ) / 2000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-7364347538124361 : ℚ) / 5000000000000000000)
              hi := ((-1948457264269801 : ℚ) / 2500000000000000000) }
      im := { lo := ((3529968320738657 : ℚ) / 2000000000000000000)
              hi := ((2458512237449353 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-338017588280393 : ℚ) / 400000000000000000)
              hi := ((62215704348441 : ℚ) / 100000000000000000) }
      im := { lo := ((-32040948091281317 : ℚ) / 100000000000000000000)
              hi := ((11028984323348291 : ℚ) / 10000000000000000000) } }
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

def s085_t2_sb012_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((31311481089 : ℚ) / 500000000000)
      ((-268459131 : ℚ) / 1000000000000)
      ((132917333 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((30099835199016837 : ℚ) / 10000000000000000000)
              hi := ((380704561872923 : ℚ) / 50000000000000000) }
      im := { lo := ((-6741324498965671 : ℚ) / 100000000000000000)
              hi := ((-785672540640997 : ℚ) / 12500000000000000) } }
  D0Rect :=
    { re := { lo := ((2205041445374793 : ℚ) / 250000000000000000)
              hi := ((5123092205394777 : ℚ) / 500000000000000000) }
      im := { lo := ((-1356188921777377 : ℚ) / 250000000000000000)
              hi := ((-3999498627929783 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-14698651944190003 : ℚ) / 10000000000000000000)
              hi := ((-970506881023363 : ℚ) / 1250000000000000000) }
      im := { lo := ((1766598925120649 : ℚ) / 1000000000000000000)
              hi := ((24601014556789097 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-844917832257301 : ℚ) / 1000000000000000000)
              hi := ((6222761062377197 : ℚ) / 10000000000000000000) }
      im := { lo := ((-8009580569828001 : ℚ) / 25000000000000000000)
              hi := ((5514430114749963 : ℚ) / 5000000000000000000) } }
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

def s085_t2_sb013_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((31311481089 : ℚ) / 500000000000)
      ((-268459131 : ℚ) / 1000000000000)
      ((132917333 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((1206371492780243 : ℚ) / 400000000000000000)
              hi := ((7619957435061793 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3369838975388133 : ℚ) / 50000000000000000)
              hi := ((-785468228036551 : ℚ) / 12500000000000000) } }
  D0Rect :=
    { re := { lo := ((4406934717155533 : ℚ) / 500000000000000000)
              hi := ((10239666338357729 : ℚ) / 1000000000000000000) }
      im := { lo := ((-5437490570588627 : ℚ) / 1000000000000000000)
              hi := ((-802496088306543 : ℚ) / 200000000000000000) } }
  DrestRect :=
    { re := { lo := ((-7334292281920327 : ℚ) / 5000000000000000000)
              hi := ((-7734259794255013 : ℚ) / 10000000000000000000) }
      im := { lo := ((8841047956024633 : ℚ) / 5000000000000000000)
              hi := ((3077107886638689 : ℚ) / 1250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4223957045922177 : ℚ) / 5000000000000000000)
              hi := ((622394802376673 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1601783210452547 : ℚ) / 5000000000000000000)
              hi := ((11028732768976143 : ℚ) / 10000000000000000000) } }
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

def s085_t2_sb014_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((31311481089 : ℚ) / 500000000000)
      ((-268459131 : ℚ) / 1000000000000)
      ((132917333 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((30218948260927153 : ℚ) / 10000000000000000000)
              hi := ((3050337234399789 : ℚ) / 400000000000000000) }
      im := { lo := ((-3369016163945967 : ℚ) / 50000000000000000)
              hi := ((-628211241817101 : ℚ) / 10000000000000000) } }
  D0Rect :=
    { re := { lo := ((8807556013531533 : ℚ) / 1000000000000000000)
              hi := ((1023313065319587 : ℚ) / 100000000000000000) }
      im := { lo := ((-1090043283347077 : ℚ) / 200000000000000000)
              hi := ((-4025453866893047 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1829811603142037 : ℚ) / 1250000000000000000)
              hi := ((-7704443516726109 : ℚ) / 10000000000000000000) }
      im := { lo := ((3539632365905513 : ℚ) / 2000000000000000000)
              hi := ((1231633383340473 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2111662162635979 : ℚ) / 2500000000000000000)
              hi := ((6225132955084671 : ℚ) / 10000000000000000000) }
      im := { lo := ((-3203298005711557 : ℚ) / 10000000000000000000)
              hi := ((11028602560765309 : ℚ) / 10000000000000000000) } }
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

def s085_t2_sb015_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((31311481089 : ℚ) / 500000000000)
      ((-268459131 : ℚ) / 1000000000000)
      ((132917333 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((3027880814525019 : ℚ) / 1000000000000000000)
              hi := ((305269966182073 : ℚ) / 40000000000000000) }
      im := { lo := ((-3368193860808657 : ℚ) / 50000000000000000)
              hi := ((-6280480018930909 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((2200306080643863 : ℚ) / 250000000000000000)
              hi := ((5113289283645693 : ℚ) / 500000000000000000) }
      im := { lo := ((-2731467132453567 : ℚ) / 500000000000000000)
              hi := ((-1009604456141913 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-73041911186653 : ℚ) / 50000000000000000)
              hi := ((-7674600801091769 : ℚ) / 10000000000000000000) }
      im := { lo := ((1771418143325913 : ℚ) / 1000000000000000000)
              hi := ((1540527111615801 : ℚ) / 625000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4222689936283343 : ℚ) / 5000000000000000000)
              hi := ((9728615205573 : ℚ) / 15625000000000000) }
      im := { lo := ((-640604944157347 : ℚ) / 2000000000000000000)
              hi := ((551423367213187 : ℚ) / 500000000000000000) } }
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

def s085_t2_sb016_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((31311481089 : ℚ) / 500000000000)
      ((-268459131 : ℚ) / 1000000000000)
      ((132917333 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((15169431257082927 : ℚ) / 5000000000000000000)
              hi := ((305507042897699 : ℚ) / 40000000000000000) }
      im := { lo := ((-6734744414343391 : ℚ) / 100000000000000000)
              hi := ((-3139424177120463 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((8794875381946603 : ℚ) / 1000000000000000000)
              hi := ((1277501137006827 : ℚ) / 125000000000000000) }
      im := { lo := ((-547564452578341 : ℚ) / 100000000000000000)
              hi := ((-1620548740779559 : ℚ) / 400000000000000000) } }
  DrestRect :=
    { re := { lo := ((-2915650376905523 : ℚ) / 2000000000000000000)
              hi := ((-152894654240339 : ℚ) / 200000000000000000) }
      im := { lo := ((17730156451331107 : ℚ) / 10000000000000000000)
              hi := ((123320798318233 : ℚ) / 50000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2111027395436337 : ℚ) / 2500000000000000000)
              hi := ((622749217685087 : ℚ) / 1000000000000000000) }
      im := { lo := ((-3202764639557609 : ℚ) / 10000000000000000000)
              hi := ((1102834519695271 : ℚ) / 1000000000000000000) } }
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

def s085_t2_sb017_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((31311481089 : ℚ) / 500000000000)
      ((-268459131 : ℚ) / 1000000000000)
      ((132917333 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((303991138434491 : ℚ) / 100000000000000000)
              hi := ((7643623572478171 : ℚ) / 1000000000000000000) }
      im := { lo := ((-33665512338489 : ℚ) / 500000000000000)
              hi := ((-62772173539977 : ℚ) / 1000000000000000) } }
  D0Rect :=
    { re := { lo := ((1757701875953091 : ℚ) / 200000000000000000)
              hi := ((5106711030854071 : ℚ) / 500000000000000000) }
      im := { lo := ((-5488346718691911 : ℚ) / 1000000000000000000)
              hi := ((-4064316375785483 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-3637025050629191 : ℚ) / 2500000000000000000)
              hi := ((-3807420459418127 : ℚ) / 5000000000000000000) }
      im := { lo := ((4436522078133859 : ℚ) / 2500000000000000000)
              hi := ((24679843776535897 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8442835717238897 : ℚ) / 10000000000000000000)
              hi := ((6228666232269993 : ℚ) / 10000000000000000000) }
      im := { lo := ((-3202525797037987 : ℚ) / 10000000000000000000)
              hi := ((5514122073559829 : ℚ) / 5000000000000000000) } }
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

def s085_t2_sb018_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((31311481089 : ℚ) / 500000000000)
      ((-268459131 : ℚ) / 1000000000000)
      ((132917333 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((761489272864243 : ℚ) / 250000000000000000)
              hi := ((3824795384043673 : ℚ) / 500000000000000000) }
      im := { lo := ((-6573692838069 : ℚ) / 97656250000000)
              hi := ((-3137793724854391 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((8782126306231833 : ℚ) / 1000000000000000000)
              hi := ((10206817506553601 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1375260025943853 : ℚ) / 250000000000000000)
              hi := ((-4077252102038683 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-181474066980523 : ℚ) / 125000000000000000)
              hi := ((-3792463686928361 : ℚ) / 5000000000000000000) }
      im := { lo := ((4440494624269623 : ℚ) / 2500000000000000000)
              hi := ((24695484615418497 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8441561949459221 : ℚ) / 10000000000000000000)
              hi := ((3114919783687169 : ℚ) / 5000000000000000000) }
      im := { lo := ((-500356666739611 : ℚ) / 1562500000000000000)
              hi := ((11028138676948559 : ℚ) / 10000000000000000000) } }
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

def s085_t2_sb019_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((31311481089 : ℚ) / 500000000000)
      ((-268459131 : ℚ) / 1000000000000)
      ((132917333 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((15260115419829933 : ℚ) / 5000000000000000000)
              hi := ((3827788956942917 : ℚ) / 500000000000000000) }
      im := { lo := ((-6729821422502359 : ℚ) / 100000000000000000)
              hi := ((-49015301824057 : ℚ) / 781250000000000) } }
  D0Rect :=
    { re := { lo := ((4387862833813691 : ℚ) / 500000000000000000)
              hi := ((10200195952691287 : ℚ) / 1000000000000000000) }
      im := { lo := ((-2756862156117111 : ℚ) / 500000000000000000)
              hi := ((-127818104530423 : ℚ) / 31250000000000000) } }
  DrestRect :=
    { re := { lo := ((-3621931899594751 : ℚ) / 2500000000000000000)
              hi := ((-3777495984839291 : ℚ) / 5000000000000000000) }
      im := { lo := ((1777782633712207 : ℚ) / 1000000000000000000)
              hi := ((2471108277638359 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8440287652967463 : ℚ) / 10000000000000000000)
              hi := ((6231011558286363 : ℚ) / 10000000000000000000) }
      im := { lo := ((-16010183816811367 : ℚ) / 50000000000000000000)
              hi := ((551401515042443 : ℚ) / 500000000000000000) } }
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

def s085_t2_sb020_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((31311481089 : ℚ) / 500000000000)
      ((-268459131 : ℚ) / 1000000000000)
      ((132917333 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((3058108724848597 : ℚ) / 1000000000000000000)
              hi := ((3064634263460499 : ℚ) / 400000000000000000) }
      im := { lo := ((-6728182414970091 : ℚ) / 100000000000000000)
              hi := ((-3136165412761273 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((8769307852782973 : ℚ) / 1000000000000000000)
              hi := ((10193557024558647 : ℚ) / 1000000000000000000) }
      im := { lo := ((-690800027544669 : ℚ) / 125000000000000000)
              hi := ((-820619436959299 : ℚ) / 200000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1807188570988137 : ℚ) / 1250000000000000000)
              hi := ((-470314572290457 : ℚ) / 625000000000000000) }
      im := { lo := ((1779363088538879 : ℚ) / 1000000000000000000)
              hi := ((618165978356537 : ℚ) / 250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-843901702914923 : ℚ) / 1000000000000000000)
              hi := ((6232186406123099 : ℚ) / 10000000000000000000) }
      im := { lo := ((-256143042299351 : ℚ) / 800000000000000000)
              hi := ((220558379193439 : ℚ) / 200000000000000000) } }
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

def s085_t2_sb021_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((31311481089 : ℚ) / 500000000000)
      ((-268459131 : ℚ) / 1000000000000)
      ((132917333 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((30642132981257863 : ℚ) / 10000000000000000000)
              hi := ((7667614615181021 : ℚ) / 1000000000000000000) }
      im := { lo := ((-16816361264101 : ℚ) / 250000000000000)
              hi := ((-391918998244213 : ℚ) / 6250000000000000) } }
  D0Rect :=
    { re := { lo := ((876287237532179 : ℚ) / 100000000000000000)
              hi := ((636681327935673 : ℚ) / 62500000000000000) }
      im := { lo := ((-221562746173599 : ℚ) / 40000000000000000)
              hi := ((-4116004753527333 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-14427271720028837 : ℚ) / 10000000000000000000)
              hi := ((-3747523810619179 : ℚ) / 5000000000000000000) }
      im := { lo := ((8904694463561739 : ℚ) / 5000000000000000000)
              hi := ((1237107843413783 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4218875126370767 : ℚ) / 5000000000000000000)
              hi := ((194792634075331 : ℚ) / 312500000000000000) }
      im := { lo := ((-16007671500194097 : ℚ) / 50000000000000000000)
              hi := ((5513901246950619 : ℚ) / 5000000000000000000) } }
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

def s085_t2_sb022_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((31311481089 : ℚ) / 500000000000)
      ((-268459131 : ℚ) / 1000000000000)
      ((132917333 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((30703379764010883 : ℚ) / 10000000000000000000)
              hi := ((7673663688715193 : ℚ) / 1000000000000000000) }
      im := { lo := ((-1681226915376889 : ℚ) / 25000000000000000)
              hi := ((-6269078114709453 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((8756419973606657 : ℚ) / 1000000000000000000)
              hi := ((10180227889330457 : ℚ) / 1000000000000000000) }
      im := { lo := ((-5551728307431389 : ℚ) / 1000000000000000000)
              hi := ((-4128903297825837 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-14397012074608417 : ℚ) / 10000000000000000000)
              hi := ((-1866260113232391 : ℚ) / 2500000000000000000) }
      im := { lo := ((8912552576410051 : ℚ) / 5000000000000000000)
              hi := ((1547351948649037 : ℚ) / 625000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8436484786885757 : ℚ) / 10000000000000000000)
              hi := ((6234542670214923 : ℚ) / 10000000000000000000) }
      im := { lo := ((-32012828036673887 : ℚ) / 100000000000000000000)
              hi := ((5513844066391807 : ℚ) / 5000000000000000000) } }
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

def s085_t2_sb023_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((31311481089 : ℚ) / 500000000000)
      ((-268459131 : ℚ) / 1000000000000)
      ((132917333 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((1230592704066503 : ℚ) / 400000000000000000)
              hi := ((59997920789451 : ℚ) / 7812500000000000) }
      im := { lo := ((-3361636049563769 : ℚ) / 50000000000000000)
              hi := ((-1566863256743381 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((4374975027771377 : ℚ) / 500000000000000000)
              hi := ((2543384392338333 : ℚ) / 250000000000000000) }
      im := { lo := ((-5564378734914203 : ℚ) / 1000000000000000000)
              hi := ((-4141793227417343 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-7183364919590901 : ℚ) / 5000000000000000000)
              hi := ((-7435011552236093 : ℚ) / 10000000000000000000) }
      im := { lo := ((4460194708021789 : ℚ) / 2500000000000000000)
              hi := ((6193265688876501 : ℚ) / 2500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4217610015439431 : ℚ) / 5000000000000000000)
              hi := ((311786047301089 : ℚ) / 500000000000000000) }
      im := { lo := ((-1600524718495259 : ℚ) / 5000000000000000000)
              hi := ((11027591766520567 : ℚ) / 10000000000000000000) } }
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

def s085_t2_sb024_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((31311481089 : ℚ) / 500000000000)
      ((-268459131 : ℚ) / 1000000000000)
      ((132917333 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((3082645802591669 : ℚ) / 1000000000000000000)
              hi := ((1200909986396561 : ℚ) / 156250000000000000) }
      im := { lo := ((-168040942623737 : ℚ) / 2500000000000000)
              hi := ((-6265828845433283 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((8743462891025377 : ℚ) / 1000000000000000000)
              hi := ((2541707511568151 : ℚ) / 250000000000000000) }
      im := { lo := ((-446161616827907 : ℚ) / 80000000000000000)
              hi := ((-1038668554501909 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-7168212668301867 : ℚ) / 5000000000000000000)
              hi := ((-7404960731168831 : ℚ) / 10000000000000000000) }
      im := { lo := ((8718950183581 : ℚ) / 4882812500000000)
              hi := ((1239422576208143 : ℚ) / 500000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-2108487792378107 : ℚ) / 2500000000000000000)
              hi := ((3118447152572753 : ℚ) / 5000000000000000000) }
      im := { lo := ((-32008262852739123 : ℚ) / 100000000000000000000)
              hi := ((11027505492406783 : ℚ) / 10000000000000000000) } }
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

def s085_t2_sb025_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((31311481089 : ℚ) / 500000000000)
      ((-268459131 : ℚ) / 1000000000000)
      ((132917333 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((3088830449709813 : ℚ) / 1000000000000000000)
              hi := ((7691933428605223 : ℚ) / 1000000000000000000) }
      im := { lo := ((-840000545335653 : ℚ) / 12500000000000000)
              hi := ((-6264205674672851 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((109211985234407 : ℚ) / 12500000000000000)
              hi := ((317503281716393 : ℚ) / 31250000000000000) }
      im := { lo := ((-1397413071944989 : ℚ) / 250000000000000000)
              hi := ((-8335093340820561 : ℚ) / 2000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-35765241984711 : ℚ) / 25000000000000000)
              hi := ((-921861237352681 : ℚ) / 1250000000000000000) }
      im := { lo := ((69812501352293 : ℚ) / 39062500000000000)
              hi := ((24803795674423483 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8432679988994039 : ℚ) / 10000000000000000000)
              hi := ((3119032268924681 : ℚ) / 5000000000000000000) }
      im := { lo := ((-32006085735059893 : ℚ) / 100000000000000000000)
              hi := ((11027424527188477 : ℚ) / 10000000000000000000) } }
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

def s085_t2_sb026_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((31311481089 : ℚ) / 500000000000)
      ((-268459131 : ℚ) / 1000000000000)
      ((132917333 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((483599143454469 : ℚ) / 156250000000000000)
              hi := ((307922549939191 : ℚ) / 40000000000000000) }
      im := { lo := ((-6718372028584603 : ℚ) / 100000000000000000)
              hi := ((-1565645894162843 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((8730438094206731 : ℚ) / 1000000000000000000)
              hi := ((2538340559444709 : ℚ) / 250000000000000000) }
      im := { lo := ((-5602274870256311 : ℚ) / 1000000000000000000)
              hi := ((-8360821260100161 : ℚ) / 2000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-7137871771357963 : ℚ) / 5000000000000000000)
              hi := ((-1836199959822769 : ℚ) / 2500000000000000000) }
      im := { lo := ((17887550723792013 : ℚ) / 10000000000000000000)
              hi := ((2481909434482377 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4215709212258149 : ℚ) / 5000000000000000000)
              hi := ((97488180775339 : ℚ) / 156250000000000000) }
      im := { lo := ((-6400780147683147 : ℚ) / 20000000000000000000)
              hi := ((1102734265131527 : ℚ) / 1000000000000000000) } }
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

def s085_t2_sb027_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((31311481089 : ℚ) / 500000000000)
      ((-268459131 : ℚ) / 1000000000000)
      ((132917333 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((775314805242647 : ℚ) / 250000000000000000)
              hi := ((7704213466762733 : ℚ) / 1000000000000000000) }
      im := { lo := ((-335837034043219 : ℚ) / 5000000000000000)
              hi := ((-3130481284519221 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((1744780100733049 : ℚ) / 200000000000000000)
              hi := ((10146601937282921 : ℚ) / 1000000000000000000) }
      im := { lo := ((-5614888373764989 : ℚ) / 1000000000000000000)
              hi := ((-2096632824061521 : ℚ) / 500000000000000000) } }
  DrestRect :=
    { re := { lo := ((-7122683630407003 : ℚ) / 5000000000000000000)
              hi := ((-1828672237185449 : ℚ) / 2500000000000000000) }
      im := { lo := ((17903059556063081 : ℚ) / 10000000000000000000)
              hi := ((24834349029938287 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-4215077848237629 : ℚ) / 5000000000000000000)
              hi := ((6240420632717153 : ℚ) / 10000000000000000000) }
      im := { lo := ((-6400339706916161 : ℚ) / 20000000000000000000)
              hi := ((2756814732386553 : ℚ) / 2500000000000000000) } }
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

def s085_t2_sb028_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((31311481089 : ℚ) / 500000000000)
      ((-268459131 : ℚ) / 1000000000000)
      ((132917333 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((3107500989575383 : ℚ) / 1000000000000000000)
              hi := ((15420772490579309 : ℚ) / 2000000000000000000) }
      im := { lo := ((-3357555281501807 : ℚ) / 50000000000000000)
              hi := ((-3129671204595983 : ℚ) / 50000000000000000) } }
  D0Rect :=
    { re := { lo := ((8717345781961379 : ℚ) / 1000000000000000000)
              hi := ((101398244290903 : ℚ) / 10000000000000000) }
      im := { lo := ((-2813746481397003 : ℚ) / 500000000000000000)
              hi := ((-4206111495872281 : ℚ) / 1000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-1421496920398503 : ℚ) / 1000000000000000000)
              hi := ((-7284556163057907 : ℚ) / 10000000000000000000) }
      im := { lo := ((17918525602379453 : ℚ) / 10000000000000000000)
              hi := ((2484956090987827 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-1053613910955923 : ℚ) / 1250000000000000000)
              hi := ((6241615203335529 : ℚ) / 10000000000000000000) }
      im := { lo := ((-6399912625035711 : ℚ) / 20000000000000000000)
              hi := ((5513590879743383 : ℚ) / 5000000000000000000) } }
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

def s085_t2_sb029_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((31311481089 : ℚ) / 500000000000)
      ((-268459131 : ℚ) / 1000000000000)
      ((132917333 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((15568802590071927 : ℚ) / 5000000000000000000)
              hi := ((7716581291559763 : ℚ) / 1000000000000000000) }
      im := { lo := ((-6713481819295211 : ℚ) / 100000000000000000)
              hi := ((-6257722981316557 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((136105837645293 : ℚ) / 15625000000000000)
              hi := ((2533257509474539 : ℚ) / 250000000000000000) }
      im := { lo := ((-1128017674397091 : ℚ) / 200000000000000000)
              hi := ((-1054737101590399 : ℚ) / 250000000000000000) } }
  DrestRect :=
    { re := { lo := ((-14184549427210297 : ℚ) / 10000000000000000000)
              hi := ((-3627200746978461 : ℚ) / 5000000000000000000) }
      im := { lo := ((4483487124395653 : ℚ) / 2500000000000000000)
              hi := ((3108091285987877 : ℚ) / 1250000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-421383760201783 : ℚ) / 500000000000000000)
              hi := ((124856345852937 : ℚ) / 200000000000000000) }
      im := { lo := ((-3199761827529301 : ℚ) / 10000000000000000000)
              hi := ((344597610437317 : ℚ) / 312500000000000000) } }
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

def s085_t2_sb030_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((31311481089 : ℚ) / 500000000000)
      ((-268459131 : ℚ) / 1000000000000)
      ((132917333 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((7800101876382781 : ℚ) / 2500000000000000000)
              hi := ((3861397839397677 : ℚ) / 500000000000000000) }
      im := { lo := ((-671185404710751 : ℚ) / 10000000000000000)
              hi := ((-6256104666503937 : ℚ) / 100000000000000000) } }
  D0Rect :=
    { re := { lo := ((4352091959943789 : ℚ) / 500000000000000000)
              hi := ((1265777358509033 : ℚ) / 125000000000000000) }
      im := { lo := ((-1413168645230121 : ℚ) / 250000000000000000)
              hi := ((-8463552696300291 : ℚ) / 2000000000000000000) } }
  DrestRect :=
    { re := { lo := ((-283082164112779 : ℚ) / 200000000000000000)
              hi := ((-7224224820121383 : ℚ) / 10000000000000000000) }
      im := { lo := ((17949327971632143 : ℚ) / 10000000000000000000)
              hi := ((24879857380504587 : ℚ) / 10000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-8426434254539711 : ℚ) / 10000000000000000000)
              hi := ((3122006854297791 : ℚ) / 5000000000000000000) }
      im := { lo := ((-15997820138183763 : ℚ) / 50000000000000000000)
              hi := ((551353093368841 : ℚ) / 500000000000000000) } }
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

def s085_t2_sb031_certificateData :
    ProjectedJ0SubboxRectangleCertificateData
      ((31311481089 : ℚ) / 500000000000)
      ((-268459131 : ℚ) / 1000000000000)
      ((132917333 : ℚ) / 31250000000) where
  MRect :=
    { re := { lo := ((6252683875519663 : ℚ) / 2000000000000000000)
              hi := ((1545805831999151 : ℚ) / 200000000000000000) }
      im := { lo := ((-1342045447968537 : ℚ) / 20000000000000000)
              hi := ((-1563621872861861 : ℚ) / 25000000000000000) } }
  D0Rect :=
    { re := { lo := ((4348788578103427 : ℚ) / 500000000000000000)
              hi := ((5059695245309489 : ℚ) / 500000000000000000) }
      im := { lo := ((-5665251593139657 : ℚ) / 1000000000000000000)
              hi := ((-424459526555023 : ℚ) / 100000000000000000) } }
  DrestRect :=
    { re := { lo := ((-706182236605193 : ℚ) / 500000000000000000)
              hi := ((-3597013528618479 : ℚ) / 5000000000000000000) }
      im := { lo := ((17964665096664913 : ℚ) / 10000000000000000000)
              hi := ((2489494102810393 : ℚ) / 1000000000000000000) } }
  RvecTailRect :=
    { re := { lo := ((-526574329200879 : ℚ) / 625000000000000000)
              hi := ((3122602639324297 : ℚ) / 5000000000000000000) }
      im := { lo := ((-399920308142521 : ℚ) / 1250000000000000000)
              hi := ((11026996321974137 : ℚ) / 10000000000000000000) } }
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
    (hi : i ∈ positiveBoxSubboxesOf .s085_t2) :
    ProjectedJ0SubboxRectangleCertificateData
      ((positiveBoxCombinedCert .s085_t2).constants.mainLower)
      ((positiveBoxCombinedCert .s085_t2).constants.d0NegReUpper)
      ((positiveBoxCombinedCert .s085_t2).constants.restUpper) := by
  if h0 : i = .s085_t2_sb000 then
    exact s085_t2_sb000_certificateData
  else if h1 : i = .s085_t2_sb001 then
    exact s085_t2_sb001_certificateData
  else if h2 : i = .s085_t2_sb002 then
    exact s085_t2_sb002_certificateData
  else if h3 : i = .s085_t2_sb003 then
    exact s085_t2_sb003_certificateData
  else if h4 : i = .s085_t2_sb004 then
    exact s085_t2_sb004_certificateData
  else if h5 : i = .s085_t2_sb005 then
    exact s085_t2_sb005_certificateData
  else if h6 : i = .s085_t2_sb006 then
    exact s085_t2_sb006_certificateData
  else if h7 : i = .s085_t2_sb007 then
    exact s085_t2_sb007_certificateData
  else if h8 : i = .s085_t2_sb008 then
    exact s085_t2_sb008_certificateData
  else if h9 : i = .s085_t2_sb009 then
    exact s085_t2_sb009_certificateData
  else if h10 : i = .s085_t2_sb010 then
    exact s085_t2_sb010_certificateData
  else if h11 : i = .s085_t2_sb011 then
    exact s085_t2_sb011_certificateData
  else if h12 : i = .s085_t2_sb012 then
    exact s085_t2_sb012_certificateData
  else if h13 : i = .s085_t2_sb013 then
    exact s085_t2_sb013_certificateData
  else if h14 : i = .s085_t2_sb014 then
    exact s085_t2_sb014_certificateData
  else if h15 : i = .s085_t2_sb015 then
    exact s085_t2_sb015_certificateData
  else if h16 : i = .s085_t2_sb016 then
    exact s085_t2_sb016_certificateData
  else if h17 : i = .s085_t2_sb017 then
    exact s085_t2_sb017_certificateData
  else if h18 : i = .s085_t2_sb018 then
    exact s085_t2_sb018_certificateData
  else if h19 : i = .s085_t2_sb019 then
    exact s085_t2_sb019_certificateData
  else if h20 : i = .s085_t2_sb020 then
    exact s085_t2_sb020_certificateData
  else if h21 : i = .s085_t2_sb021 then
    exact s085_t2_sb021_certificateData
  else if h22 : i = .s085_t2_sb022 then
    exact s085_t2_sb022_certificateData
  else if h23 : i = .s085_t2_sb023 then
    exact s085_t2_sb023_certificateData
  else if h24 : i = .s085_t2_sb024 then
    exact s085_t2_sb024_certificateData
  else if h25 : i = .s085_t2_sb025 then
    exact s085_t2_sb025_certificateData
  else if h26 : i = .s085_t2_sb026 then
    exact s085_t2_sb026_certificateData
  else if h27 : i = .s085_t2_sb027 then
    exact s085_t2_sb027_certificateData
  else if h28 : i = .s085_t2_sb028 then
    exact s085_t2_sb028_certificateData
  else if h29 : i = .s085_t2_sb029 then
    exact s085_t2_sb029_certificateData
  else if h30 : i = .s085_t2_sb030 then
    exact s085_t2_sb030_certificateData
  else if h31 : i = .s085_t2_sb031 then
    exact s085_t2_sb031_certificateData
  else
    simp [positiveBoxSubboxesOf, h0, h1, h2, h3, h4, h5, h6, h7, h8, h9, h10, h11, h12, h13, h14, h15, h16, h17, h18, h19, h20, h21, h22, h23, h24, h25, h26, h27, h28, h29, h30, h31] at hi

end S085T2
end ProjectedJ0PositiveBoxRectangleData
end ProjectedJ0PositiveBoxSkeleton
end C2
