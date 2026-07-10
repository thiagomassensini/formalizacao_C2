import LeanC2.AuditProjectedJ0PositiveBoxSkeleton

set_option linter.style.longLine false

/-!
# Positive-box all-subbox skeleton

This generated file records the 771 positive-box subbox
identifiers and rational regions. Coverage and analytic
bounds remain explicit external hypotheses.
-/

namespace C2
namespace ProjectedJ0PositiveBoxSkeleton

open ProjectedJ0RectangleArithmetic
open AdjustedQuartetProjectedJ0Aliases

inductive PositiveBoxSubboxId where
  | s084_t0_sb000 | s084_t0_sb001 | s084_t0_sb002 | s084_t0_sb003
  | s084_t0_sb004 | s084_t0_sb005 | s084_t0_sb006 | s084_t0_sb007
  | s084_t0_sb008 | s084_t0_sb009 | s084_t0_sb010 | s084_t0_sb011
  | s084_t0_sb012 | s084_t0_sb013 | s084_t0_sb014 | s084_t0_sb015
  | s084_t0_sb016 | s084_t0_sb017 | s084_t0_sb018 | s084_t0_sb019
  | s084_t0_sb020 | s084_t0_sb021 | s084_t0_sb022 | s084_t0_sb023
  | s084_t0_sb024 | s084_t0_sb025 | s084_t0_sb026 | s084_t0_sb027
  | s084_t0_sb028 | s084_t0_sb029 | s084_t0_sb030 | s084_t0_sb031
  | s084_t1_sb000 | s084_t1_sb001 | s084_t1_sb002 | s084_t1_sb003
  | s084_t1_sb004 | s084_t1_sb005 | s084_t1_sb006 | s084_t1_sb007
  | s084_t1_sb008 | s084_t1_sb009 | s084_t1_sb010 | s084_t1_sb011
  | s084_t1_sb012 | s084_t1_sb013 | s084_t1_sb014 | s084_t1_sb015
  | s084_t1_sb016 | s084_t1_sb017 | s084_t1_sb018 | s084_t1_sb019
  | s084_t1_sb020 | s084_t1_sb021 | s084_t1_sb022 | s084_t1_sb023
  | s084_t1_sb024 | s084_t1_sb025 | s084_t1_sb026 | s084_t1_sb027
  | s084_t1_sb028 | s084_t1_sb029 | s084_t1_sb030 | s084_t1_sb031
  | s084_t2_sb000 | s084_t2_sb001 | s084_t2_sb002 | s084_t2_sb003
  | s084_t2_sb004 | s084_t2_sb005 | s084_t2_sb006 | s084_t2_sb007
  | s084_t2_sb008 | s084_t2_sb009 | s084_t2_sb010 | s084_t2_sb011
  | s084_t2_sb012 | s084_t2_sb013 | s084_t2_sb014 | s084_t2_sb015
  | s084_t2_sb016 | s084_t2_sb017 | s084_t2_sb018 | s084_t2_sb019
  | s084_t2_sb020 | s084_t2_sb021 | s084_t2_sb022 | s084_t2_sb023
  | s084_t2_sb024 | s084_t2_sb025 | s084_t2_sb026 | s084_t2_sb027
  | s084_t2_sb028 | s084_t2_sb029 | s084_t2_sb030 | s084_t2_sb031
  | s084_t3_sb000 | s084_t3_sb001 | s084_t3_sb002 | s084_t3_sb003
  | s084_t3_sb004 | s084_t3_sb005 | s084_t3_sb006 | s084_t3_sb007
  | s084_t3_sb008 | s084_t3_sb009 | s084_t3_sb010 | s084_t3_sb011
  | s084_t3_sb012 | s084_t3_sb013 | s084_t3_sb014 | s084_t3_sb015
  | s084_t3_sb016 | s084_t3_sb017 | s084_t3_sb018 | s084_t3_sb019
  | s084_t3_sb020 | s084_t3_sb021 | s084_t3_sb022 | s084_t3_sb023
  | s084_t3_sb024 | s084_t3_sb025 | s084_t3_sb026 | s084_t3_sb027
  | s084_t3_sb028 | s084_t3_sb029 | s084_t3_sb030 | s084_t3_sb031
  | s084_t4_sb000 | s084_t4_sb001 | s084_t4_sb002 | s084_t4_sb003
  | s084_t4_sb004 | s084_t4_sb005 | s084_t4_sb006 | s084_t4_sb007
  | s084_t4_sb008 | s084_t4_sb009 | s084_t4_sb010 | s084_t4_sb011
  | s084_t4_sb012 | s084_t4_sb013 | s084_t4_sb014 | s084_t4_sb015
  | s084_t4_sb016 | s084_t4_sb017 | s084_t4_sb018 | s084_t4_sb019
  | s084_t4_sb020 | s084_t4_sb021 | s084_t4_sb022 | s084_t4_sb023
  | s084_t4_sb024 | s084_t4_sb025 | s084_t4_sb026 | s084_t4_sb027
  | s084_t4_sb028 | s084_t4_sb029 | s084_t4_sb030 | s084_t4_sb031
  | s084_t5_sb000 | s084_t5_sb001 | s084_t5_sb002 | s084_t5_sb003
  | s084_t5_sb004 | s084_t5_sb005 | s084_t5_sb006 | s084_t5_sb007
  | s084_t5_sb008 | s084_t5_sb009 | s084_t5_sb010 | s084_t5_sb011
  | s084_t5_sb012 | s084_t5_sb013 | s084_t5_sb014 | s084_t5_sb015
  | s084_t5_sb016 | s084_t5_sb017 | s084_t5_sb018 | s084_t5_sb019
  | s084_t5_sb020 | s084_t5_sb021 | s084_t5_sb022 | s084_t5_sb023
  | s084_t5_sb024 | s084_t5_sb025 | s084_t5_sb026 | s084_t5_sb027
  | s084_t5_sb028 | s084_t5_sb029 | s084_t5_sb030 | s084_t5_sb031
  | s084_t6_sb000 | s084_t6_sb001 | s084_t6_sb002 | s084_t6_sb003
  | s084_t6_sb004 | s084_t6_sb005 | s084_t6_sb006 | s084_t6_sb007
  | s084_t6_sb008 | s084_t6_sb009 | s084_t6_sb010 | s084_t6_sb011
  | s084_t6_sb012 | s084_t6_sb013 | s084_t6_sb014 | s084_t6_sb015
  | s084_t6_sb016 | s084_t6_sb017 | s084_t6_sb018 | s084_t6_sb019
  | s084_t6_sb020 | s084_t6_sb021 | s084_t6_sb022 | s084_t6_sb023
  | s084_t6_sb024 | s084_t6_sb025 | s084_t6_sb026 | s084_t6_sb027
  | s084_t6_sb028 | s084_t6_sb029 | s084_t6_sb030 | s084_t6_sb031
  | s084_t7_sb000 | s084_t7_sb001 | s084_t7_sb002 | s084_t7_sb003
  | s084_t7_sb004 | s084_t7_sb005 | s084_t7_sb006 | s084_t7_sb007
  | s084_t7_sb008 | s084_t7_sb009 | s084_t7_sb010 | s084_t7_sb011
  | s084_t7_sb012 | s084_t7_sb013 | s084_t7_sb014 | s084_t7_sb015
  | s084_t7_sb016 | s084_t7_sb017 | s084_t7_sb018 | s084_t7_sb019
  | s084_t7_sb020 | s084_t7_sb021 | s084_t7_sb022 | s084_t7_sb023
  | s084_t7_sb024 | s084_t7_sb025 | s084_t7_sb026 | s084_t7_sb027
  | s084_t7_sb028 | s084_t7_sb029 | s084_t7_sb030 | s084_t7_sb031
  | s084_t8_sb000 | s085_t0_sb000 | s085_t0_sb001 | s085_t0_sb002
  | s085_t0_sb003 | s085_t0_sb004 | s085_t0_sb005 | s085_t0_sb006
  | s085_t0_sb007 | s085_t0_sb008 | s085_t0_sb009 | s085_t0_sb010
  | s085_t0_sb011 | s085_t0_sb012 | s085_t0_sb013 | s085_t0_sb014
  | s085_t0_sb015 | s085_t0_sb016 | s085_t0_sb017 | s085_t0_sb018
  | s085_t0_sb019 | s085_t0_sb020 | s085_t0_sb021 | s085_t0_sb022
  | s085_t0_sb023 | s085_t0_sb024 | s085_t0_sb025 | s085_t0_sb026
  | s085_t0_sb027 | s085_t0_sb028 | s085_t0_sb029 | s085_t0_sb030
  | s085_t0_sb031 | s085_t1_sb000 | s085_t1_sb001 | s085_t1_sb002
  | s085_t1_sb003 | s085_t1_sb004 | s085_t1_sb005 | s085_t1_sb006
  | s085_t1_sb007 | s085_t1_sb008 | s085_t1_sb009 | s085_t1_sb010
  | s085_t1_sb011 | s085_t1_sb012 | s085_t1_sb013 | s085_t1_sb014
  | s085_t1_sb015 | s085_t1_sb016 | s085_t1_sb017 | s085_t1_sb018
  | s085_t1_sb019 | s085_t1_sb020 | s085_t1_sb021 | s085_t1_sb022
  | s085_t1_sb023 | s085_t1_sb024 | s085_t1_sb025 | s085_t1_sb026
  | s085_t1_sb027 | s085_t1_sb028 | s085_t1_sb029 | s085_t1_sb030
  | s085_t1_sb031 | s085_t2_sb000 | s085_t2_sb001 | s085_t2_sb002
  | s085_t2_sb003 | s085_t2_sb004 | s085_t2_sb005 | s085_t2_sb006
  | s085_t2_sb007 | s085_t2_sb008 | s085_t2_sb009 | s085_t2_sb010
  | s085_t2_sb011 | s085_t2_sb012 | s085_t2_sb013 | s085_t2_sb014
  | s085_t2_sb015 | s085_t2_sb016 | s085_t2_sb017 | s085_t2_sb018
  | s085_t2_sb019 | s085_t2_sb020 | s085_t2_sb021 | s085_t2_sb022
  | s085_t2_sb023 | s085_t2_sb024 | s085_t2_sb025 | s085_t2_sb026
  | s085_t2_sb027 | s085_t2_sb028 | s085_t2_sb029 | s085_t2_sb030
  | s085_t2_sb031 | s085_t3_sb000 | s085_t3_sb001 | s085_t3_sb002
  | s085_t3_sb003 | s085_t3_sb004 | s085_t3_sb005 | s085_t3_sb006
  | s085_t3_sb007 | s085_t3_sb008 | s085_t3_sb009 | s085_t3_sb010
  | s085_t3_sb011 | s085_t3_sb012 | s085_t3_sb013 | s085_t3_sb014
  | s085_t3_sb015 | s085_t3_sb016 | s085_t3_sb017 | s085_t3_sb018
  | s085_t3_sb019 | s085_t3_sb020 | s085_t3_sb021 | s085_t3_sb022
  | s085_t3_sb023 | s085_t3_sb024 | s085_t3_sb025 | s085_t3_sb026
  | s085_t3_sb027 | s085_t3_sb028 | s085_t3_sb029 | s085_t3_sb030
  | s085_t3_sb031 | s085_t4_sb000 | s085_t4_sb001 | s085_t4_sb002
  | s085_t4_sb003 | s085_t4_sb004 | s085_t4_sb005 | s085_t4_sb006
  | s085_t4_sb007 | s085_t4_sb008 | s085_t4_sb009 | s085_t4_sb010
  | s085_t4_sb011 | s085_t4_sb012 | s085_t4_sb013 | s085_t4_sb014
  | s085_t4_sb015 | s085_t4_sb016 | s085_t4_sb017 | s085_t4_sb018
  | s085_t4_sb019 | s085_t4_sb020 | s085_t4_sb021 | s085_t4_sb022
  | s085_t4_sb023 | s085_t4_sb024 | s085_t4_sb025 | s085_t4_sb026
  | s085_t4_sb027 | s085_t4_sb028 | s085_t4_sb029 | s085_t4_sb030
  | s085_t4_sb031 | s085_t5_sb000 | s085_t5_sb001 | s085_t5_sb002
  | s085_t5_sb003 | s085_t5_sb004 | s085_t5_sb005 | s085_t5_sb006
  | s085_t5_sb007 | s085_t5_sb008 | s085_t5_sb009 | s085_t5_sb010
  | s085_t5_sb011 | s085_t5_sb012 | s085_t5_sb013 | s085_t5_sb014
  | s085_t5_sb015 | s085_t5_sb016 | s085_t5_sb017 | s085_t5_sb018
  | s085_t5_sb019 | s085_t5_sb020 | s085_t5_sb021 | s085_t5_sb022
  | s085_t5_sb023 | s085_t5_sb024 | s085_t5_sb025 | s085_t5_sb026
  | s085_t5_sb027 | s085_t5_sb028 | s085_t5_sb029 | s085_t5_sb030
  | s085_t5_sb031 | s085_t6_sb000 | s085_t6_sb001 | s085_t6_sb002
  | s085_t6_sb003 | s085_t6_sb004 | s085_t6_sb005 | s085_t6_sb006
  | s085_t6_sb007 | s085_t6_sb008 | s085_t6_sb009 | s085_t6_sb010
  | s085_t6_sb011 | s085_t6_sb012 | s085_t6_sb013 | s085_t6_sb014
  | s085_t6_sb015 | s085_t6_sb016 | s085_t6_sb017 | s085_t6_sb018
  | s085_t6_sb019 | s085_t6_sb020 | s085_t6_sb021 | s085_t6_sb022
  | s085_t6_sb023 | s085_t6_sb024 | s085_t6_sb025 | s085_t6_sb026
  | s085_t6_sb027 | s085_t6_sb028 | s085_t6_sb029 | s085_t6_sb030
  | s085_t6_sb031 | s085_t7_sb000 | s085_t7_sb001 | s085_t7_sb002
  | s085_t7_sb003 | s085_t7_sb004 | s085_t7_sb005 | s085_t7_sb006
  | s085_t7_sb007 | s085_t7_sb008 | s085_t7_sb009 | s085_t7_sb010
  | s085_t7_sb011 | s085_t7_sb012 | s085_t7_sb013 | s085_t7_sb014
  | s085_t7_sb015 | s085_t7_sb016 | s085_t7_sb017 | s085_t7_sb018
  | s085_t7_sb019 | s085_t7_sb020 | s085_t7_sb021 | s085_t7_sb022
  | s085_t7_sb023 | s085_t7_sb024 | s085_t7_sb025 | s085_t7_sb026
  | s085_t7_sb027 | s085_t7_sb028 | s085_t7_sb029 | s085_t7_sb030
  | s085_t7_sb031 | s085_t8_sb000 | s086_t0_sb000 | s086_t0_sb001
  | s086_t0_sb002 | s086_t0_sb003 | s086_t0_sb004 | s086_t0_sb005
  | s086_t0_sb006 | s086_t0_sb007 | s086_t0_sb008 | s086_t0_sb009
  | s086_t0_sb010 | s086_t0_sb011 | s086_t0_sb012 | s086_t0_sb013
  | s086_t0_sb014 | s086_t0_sb015 | s086_t0_sb016 | s086_t0_sb017
  | s086_t0_sb018 | s086_t0_sb019 | s086_t0_sb020 | s086_t0_sb021
  | s086_t0_sb022 | s086_t0_sb023 | s086_t0_sb024 | s086_t0_sb025
  | s086_t0_sb026 | s086_t0_sb027 | s086_t0_sb028 | s086_t0_sb029
  | s086_t0_sb030 | s086_t0_sb031 | s086_t1_sb000 | s086_t1_sb001
  | s086_t1_sb002 | s086_t1_sb003 | s086_t1_sb004 | s086_t1_sb005
  | s086_t1_sb006 | s086_t1_sb007 | s086_t1_sb008 | s086_t1_sb009
  | s086_t1_sb010 | s086_t1_sb011 | s086_t1_sb012 | s086_t1_sb013
  | s086_t1_sb014 | s086_t1_sb015 | s086_t1_sb016 | s086_t1_sb017
  | s086_t1_sb018 | s086_t1_sb019 | s086_t1_sb020 | s086_t1_sb021
  | s086_t1_sb022 | s086_t1_sb023 | s086_t1_sb024 | s086_t1_sb025
  | s086_t1_sb026 | s086_t1_sb027 | s086_t1_sb028 | s086_t1_sb029
  | s086_t1_sb030 | s086_t1_sb031 | s086_t2_sb000 | s086_t2_sb001
  | s086_t2_sb002 | s086_t2_sb003 | s086_t2_sb004 | s086_t2_sb005
  | s086_t2_sb006 | s086_t2_sb007 | s086_t2_sb008 | s086_t2_sb009
  | s086_t2_sb010 | s086_t2_sb011 | s086_t2_sb012 | s086_t2_sb013
  | s086_t2_sb014 | s086_t2_sb015 | s086_t2_sb016 | s086_t2_sb017
  | s086_t2_sb018 | s086_t2_sb019 | s086_t2_sb020 | s086_t2_sb021
  | s086_t2_sb022 | s086_t2_sb023 | s086_t2_sb024 | s086_t2_sb025
  | s086_t2_sb026 | s086_t2_sb027 | s086_t2_sb028 | s086_t2_sb029
  | s086_t2_sb030 | s086_t2_sb031 | s086_t3_sb000 | s086_t3_sb001
  | s086_t3_sb002 | s086_t3_sb003 | s086_t3_sb004 | s086_t3_sb005
  | s086_t3_sb006 | s086_t3_sb007 | s086_t3_sb008 | s086_t3_sb009
  | s086_t3_sb010 | s086_t3_sb011 | s086_t3_sb012 | s086_t3_sb013
  | s086_t3_sb014 | s086_t3_sb015 | s086_t3_sb016 | s086_t3_sb017
  | s086_t3_sb018 | s086_t3_sb019 | s086_t3_sb020 | s086_t3_sb021
  | s086_t3_sb022 | s086_t3_sb023 | s086_t3_sb024 | s086_t3_sb025
  | s086_t3_sb026 | s086_t3_sb027 | s086_t3_sb028 | s086_t3_sb029
  | s086_t3_sb030 | s086_t3_sb031 | s086_t4_sb000 | s086_t4_sb001
  | s086_t4_sb002 | s086_t4_sb003 | s086_t4_sb004 | s086_t4_sb005
  | s086_t4_sb006 | s086_t4_sb007 | s086_t4_sb008 | s086_t4_sb009
  | s086_t4_sb010 | s086_t4_sb011 | s086_t4_sb012 | s086_t4_sb013
  | s086_t4_sb014 | s086_t4_sb015 | s086_t4_sb016 | s086_t4_sb017
  | s086_t4_sb018 | s086_t4_sb019 | s086_t4_sb020 | s086_t4_sb021
  | s086_t4_sb022 | s086_t4_sb023 | s086_t4_sb024 | s086_t4_sb025
  | s086_t4_sb026 | s086_t4_sb027 | s086_t4_sb028 | s086_t4_sb029
  | s086_t4_sb030 | s086_t4_sb031 | s086_t5_sb000 | s086_t5_sb001
  | s086_t5_sb002 | s086_t5_sb003 | s086_t5_sb004 | s086_t5_sb005
  | s086_t5_sb006 | s086_t5_sb007 | s086_t5_sb008 | s086_t5_sb009
  | s086_t5_sb010 | s086_t5_sb011 | s086_t5_sb012 | s086_t5_sb013
  | s086_t5_sb014 | s086_t5_sb015 | s086_t5_sb016 | s086_t5_sb017
  | s086_t5_sb018 | s086_t5_sb019 | s086_t5_sb020 | s086_t5_sb021
  | s086_t5_sb022 | s086_t5_sb023 | s086_t5_sb024 | s086_t5_sb025
  | s086_t5_sb026 | s086_t5_sb027 | s086_t5_sb028 | s086_t5_sb029
  | s086_t5_sb030 | s086_t5_sb031 | s086_t6_sb000 | s086_t6_sb001
  | s086_t6_sb002 | s086_t6_sb003 | s086_t6_sb004 | s086_t6_sb005
  | s086_t6_sb006 | s086_t6_sb007 | s086_t6_sb008 | s086_t6_sb009
  | s086_t6_sb010 | s086_t6_sb011 | s086_t6_sb012 | s086_t6_sb013
  | s086_t6_sb014 | s086_t6_sb015 | s086_t6_sb016 | s086_t6_sb017
  | s086_t6_sb018 | s086_t6_sb019 | s086_t6_sb020 | s086_t6_sb021
  | s086_t6_sb022 | s086_t6_sb023 | s086_t6_sb024 | s086_t6_sb025
  | s086_t6_sb026 | s086_t6_sb027 | s086_t6_sb028 | s086_t6_sb029
  | s086_t6_sb030 | s086_t6_sb031 | s086_t7_sb000 | s086_t7_sb001
  | s086_t7_sb002 | s086_t7_sb003 | s086_t7_sb004 | s086_t7_sb005
  | s086_t7_sb006 | s086_t7_sb007 | s086_t7_sb008 | s086_t7_sb009
  | s086_t7_sb010 | s086_t7_sb011 | s086_t7_sb012 | s086_t7_sb013
  | s086_t7_sb014 | s086_t7_sb015 | s086_t7_sb016 | s086_t7_sb017
  | s086_t7_sb018 | s086_t7_sb019 | s086_t7_sb020 | s086_t7_sb021
  | s086_t7_sb022 | s086_t7_sb023 | s086_t7_sb024 | s086_t7_sb025
  | s086_t7_sb026 | s086_t7_sb027 | s086_t7_sb028 | s086_t7_sb029
  | s086_t7_sb030 | s086_t7_sb031 | s086_t8_sb000
  deriving DecidableEq, Repr

def positiveBoxSubboxes : Finset PositiveBoxSubboxId :=
  [
    PositiveBoxSubboxId.s084_t0_sb000,
    PositiveBoxSubboxId.s084_t0_sb001,
    PositiveBoxSubboxId.s084_t0_sb002,
    PositiveBoxSubboxId.s084_t0_sb003,
    PositiveBoxSubboxId.s084_t0_sb004,
    PositiveBoxSubboxId.s084_t0_sb005,
    PositiveBoxSubboxId.s084_t0_sb006,
    PositiveBoxSubboxId.s084_t0_sb007,
    PositiveBoxSubboxId.s084_t0_sb008,
    PositiveBoxSubboxId.s084_t0_sb009,
    PositiveBoxSubboxId.s084_t0_sb010,
    PositiveBoxSubboxId.s084_t0_sb011,
    PositiveBoxSubboxId.s084_t0_sb012,
    PositiveBoxSubboxId.s084_t0_sb013,
    PositiveBoxSubboxId.s084_t0_sb014,
    PositiveBoxSubboxId.s084_t0_sb015,
    PositiveBoxSubboxId.s084_t0_sb016,
    PositiveBoxSubboxId.s084_t0_sb017,
    PositiveBoxSubboxId.s084_t0_sb018,
    PositiveBoxSubboxId.s084_t0_sb019,
    PositiveBoxSubboxId.s084_t0_sb020,
    PositiveBoxSubboxId.s084_t0_sb021,
    PositiveBoxSubboxId.s084_t0_sb022,
    PositiveBoxSubboxId.s084_t0_sb023,
    PositiveBoxSubboxId.s084_t0_sb024,
    PositiveBoxSubboxId.s084_t0_sb025,
    PositiveBoxSubboxId.s084_t0_sb026,
    PositiveBoxSubboxId.s084_t0_sb027,
    PositiveBoxSubboxId.s084_t0_sb028,
    PositiveBoxSubboxId.s084_t0_sb029,
    PositiveBoxSubboxId.s084_t0_sb030,
    PositiveBoxSubboxId.s084_t0_sb031,
    PositiveBoxSubboxId.s084_t1_sb000,
    PositiveBoxSubboxId.s084_t1_sb001,
    PositiveBoxSubboxId.s084_t1_sb002,
    PositiveBoxSubboxId.s084_t1_sb003,
    PositiveBoxSubboxId.s084_t1_sb004,
    PositiveBoxSubboxId.s084_t1_sb005,
    PositiveBoxSubboxId.s084_t1_sb006,
    PositiveBoxSubboxId.s084_t1_sb007,
    PositiveBoxSubboxId.s084_t1_sb008,
    PositiveBoxSubboxId.s084_t1_sb009,
    PositiveBoxSubboxId.s084_t1_sb010,
    PositiveBoxSubboxId.s084_t1_sb011,
    PositiveBoxSubboxId.s084_t1_sb012,
    PositiveBoxSubboxId.s084_t1_sb013,
    PositiveBoxSubboxId.s084_t1_sb014,
    PositiveBoxSubboxId.s084_t1_sb015,
    PositiveBoxSubboxId.s084_t1_sb016,
    PositiveBoxSubboxId.s084_t1_sb017,
    PositiveBoxSubboxId.s084_t1_sb018,
    PositiveBoxSubboxId.s084_t1_sb019,
    PositiveBoxSubboxId.s084_t1_sb020,
    PositiveBoxSubboxId.s084_t1_sb021,
    PositiveBoxSubboxId.s084_t1_sb022,
    PositiveBoxSubboxId.s084_t1_sb023,
    PositiveBoxSubboxId.s084_t1_sb024,
    PositiveBoxSubboxId.s084_t1_sb025,
    PositiveBoxSubboxId.s084_t1_sb026,
    PositiveBoxSubboxId.s084_t1_sb027,
    PositiveBoxSubboxId.s084_t1_sb028,
    PositiveBoxSubboxId.s084_t1_sb029,
    PositiveBoxSubboxId.s084_t1_sb030,
    PositiveBoxSubboxId.s084_t1_sb031,
    PositiveBoxSubboxId.s084_t2_sb000,
    PositiveBoxSubboxId.s084_t2_sb001,
    PositiveBoxSubboxId.s084_t2_sb002,
    PositiveBoxSubboxId.s084_t2_sb003,
    PositiveBoxSubboxId.s084_t2_sb004,
    PositiveBoxSubboxId.s084_t2_sb005,
    PositiveBoxSubboxId.s084_t2_sb006,
    PositiveBoxSubboxId.s084_t2_sb007,
    PositiveBoxSubboxId.s084_t2_sb008,
    PositiveBoxSubboxId.s084_t2_sb009,
    PositiveBoxSubboxId.s084_t2_sb010,
    PositiveBoxSubboxId.s084_t2_sb011,
    PositiveBoxSubboxId.s084_t2_sb012,
    PositiveBoxSubboxId.s084_t2_sb013,
    PositiveBoxSubboxId.s084_t2_sb014,
    PositiveBoxSubboxId.s084_t2_sb015,
    PositiveBoxSubboxId.s084_t2_sb016,
    PositiveBoxSubboxId.s084_t2_sb017,
    PositiveBoxSubboxId.s084_t2_sb018,
    PositiveBoxSubboxId.s084_t2_sb019,
    PositiveBoxSubboxId.s084_t2_sb020,
    PositiveBoxSubboxId.s084_t2_sb021,
    PositiveBoxSubboxId.s084_t2_sb022,
    PositiveBoxSubboxId.s084_t2_sb023,
    PositiveBoxSubboxId.s084_t2_sb024,
    PositiveBoxSubboxId.s084_t2_sb025,
    PositiveBoxSubboxId.s084_t2_sb026,
    PositiveBoxSubboxId.s084_t2_sb027,
    PositiveBoxSubboxId.s084_t2_sb028,
    PositiveBoxSubboxId.s084_t2_sb029,
    PositiveBoxSubboxId.s084_t2_sb030,
    PositiveBoxSubboxId.s084_t2_sb031,
    PositiveBoxSubboxId.s084_t3_sb000,
    PositiveBoxSubboxId.s084_t3_sb001,
    PositiveBoxSubboxId.s084_t3_sb002,
    PositiveBoxSubboxId.s084_t3_sb003,
    PositiveBoxSubboxId.s084_t3_sb004,
    PositiveBoxSubboxId.s084_t3_sb005,
    PositiveBoxSubboxId.s084_t3_sb006,
    PositiveBoxSubboxId.s084_t3_sb007,
    PositiveBoxSubboxId.s084_t3_sb008,
    PositiveBoxSubboxId.s084_t3_sb009,
    PositiveBoxSubboxId.s084_t3_sb010,
    PositiveBoxSubboxId.s084_t3_sb011,
    PositiveBoxSubboxId.s084_t3_sb012,
    PositiveBoxSubboxId.s084_t3_sb013,
    PositiveBoxSubboxId.s084_t3_sb014,
    PositiveBoxSubboxId.s084_t3_sb015,
    PositiveBoxSubboxId.s084_t3_sb016,
    PositiveBoxSubboxId.s084_t3_sb017,
    PositiveBoxSubboxId.s084_t3_sb018,
    PositiveBoxSubboxId.s084_t3_sb019,
    PositiveBoxSubboxId.s084_t3_sb020,
    PositiveBoxSubboxId.s084_t3_sb021,
    PositiveBoxSubboxId.s084_t3_sb022,
    PositiveBoxSubboxId.s084_t3_sb023,
    PositiveBoxSubboxId.s084_t3_sb024,
    PositiveBoxSubboxId.s084_t3_sb025,
    PositiveBoxSubboxId.s084_t3_sb026,
    PositiveBoxSubboxId.s084_t3_sb027,
    PositiveBoxSubboxId.s084_t3_sb028,
    PositiveBoxSubboxId.s084_t3_sb029,
    PositiveBoxSubboxId.s084_t3_sb030,
    PositiveBoxSubboxId.s084_t3_sb031,
    PositiveBoxSubboxId.s084_t4_sb000,
    PositiveBoxSubboxId.s084_t4_sb001,
    PositiveBoxSubboxId.s084_t4_sb002,
    PositiveBoxSubboxId.s084_t4_sb003,
    PositiveBoxSubboxId.s084_t4_sb004,
    PositiveBoxSubboxId.s084_t4_sb005,
    PositiveBoxSubboxId.s084_t4_sb006,
    PositiveBoxSubboxId.s084_t4_sb007,
    PositiveBoxSubboxId.s084_t4_sb008,
    PositiveBoxSubboxId.s084_t4_sb009,
    PositiveBoxSubboxId.s084_t4_sb010,
    PositiveBoxSubboxId.s084_t4_sb011,
    PositiveBoxSubboxId.s084_t4_sb012,
    PositiveBoxSubboxId.s084_t4_sb013,
    PositiveBoxSubboxId.s084_t4_sb014,
    PositiveBoxSubboxId.s084_t4_sb015,
    PositiveBoxSubboxId.s084_t4_sb016,
    PositiveBoxSubboxId.s084_t4_sb017,
    PositiveBoxSubboxId.s084_t4_sb018,
    PositiveBoxSubboxId.s084_t4_sb019,
    PositiveBoxSubboxId.s084_t4_sb020,
    PositiveBoxSubboxId.s084_t4_sb021,
    PositiveBoxSubboxId.s084_t4_sb022,
    PositiveBoxSubboxId.s084_t4_sb023,
    PositiveBoxSubboxId.s084_t4_sb024,
    PositiveBoxSubboxId.s084_t4_sb025,
    PositiveBoxSubboxId.s084_t4_sb026,
    PositiveBoxSubboxId.s084_t4_sb027,
    PositiveBoxSubboxId.s084_t4_sb028,
    PositiveBoxSubboxId.s084_t4_sb029,
    PositiveBoxSubboxId.s084_t4_sb030,
    PositiveBoxSubboxId.s084_t4_sb031,
    PositiveBoxSubboxId.s084_t5_sb000,
    PositiveBoxSubboxId.s084_t5_sb001,
    PositiveBoxSubboxId.s084_t5_sb002,
    PositiveBoxSubboxId.s084_t5_sb003,
    PositiveBoxSubboxId.s084_t5_sb004,
    PositiveBoxSubboxId.s084_t5_sb005,
    PositiveBoxSubboxId.s084_t5_sb006,
    PositiveBoxSubboxId.s084_t5_sb007,
    PositiveBoxSubboxId.s084_t5_sb008,
    PositiveBoxSubboxId.s084_t5_sb009,
    PositiveBoxSubboxId.s084_t5_sb010,
    PositiveBoxSubboxId.s084_t5_sb011,
    PositiveBoxSubboxId.s084_t5_sb012,
    PositiveBoxSubboxId.s084_t5_sb013,
    PositiveBoxSubboxId.s084_t5_sb014,
    PositiveBoxSubboxId.s084_t5_sb015,
    PositiveBoxSubboxId.s084_t5_sb016,
    PositiveBoxSubboxId.s084_t5_sb017,
    PositiveBoxSubboxId.s084_t5_sb018,
    PositiveBoxSubboxId.s084_t5_sb019,
    PositiveBoxSubboxId.s084_t5_sb020,
    PositiveBoxSubboxId.s084_t5_sb021,
    PositiveBoxSubboxId.s084_t5_sb022,
    PositiveBoxSubboxId.s084_t5_sb023,
    PositiveBoxSubboxId.s084_t5_sb024,
    PositiveBoxSubboxId.s084_t5_sb025,
    PositiveBoxSubboxId.s084_t5_sb026,
    PositiveBoxSubboxId.s084_t5_sb027,
    PositiveBoxSubboxId.s084_t5_sb028,
    PositiveBoxSubboxId.s084_t5_sb029,
    PositiveBoxSubboxId.s084_t5_sb030,
    PositiveBoxSubboxId.s084_t5_sb031,
    PositiveBoxSubboxId.s084_t6_sb000,
    PositiveBoxSubboxId.s084_t6_sb001,
    PositiveBoxSubboxId.s084_t6_sb002,
    PositiveBoxSubboxId.s084_t6_sb003,
    PositiveBoxSubboxId.s084_t6_sb004,
    PositiveBoxSubboxId.s084_t6_sb005,
    PositiveBoxSubboxId.s084_t6_sb006,
    PositiveBoxSubboxId.s084_t6_sb007,
    PositiveBoxSubboxId.s084_t6_sb008,
    PositiveBoxSubboxId.s084_t6_sb009,
    PositiveBoxSubboxId.s084_t6_sb010,
    PositiveBoxSubboxId.s084_t6_sb011,
    PositiveBoxSubboxId.s084_t6_sb012,
    PositiveBoxSubboxId.s084_t6_sb013,
    PositiveBoxSubboxId.s084_t6_sb014,
    PositiveBoxSubboxId.s084_t6_sb015,
    PositiveBoxSubboxId.s084_t6_sb016,
    PositiveBoxSubboxId.s084_t6_sb017,
    PositiveBoxSubboxId.s084_t6_sb018,
    PositiveBoxSubboxId.s084_t6_sb019,
    PositiveBoxSubboxId.s084_t6_sb020,
    PositiveBoxSubboxId.s084_t6_sb021,
    PositiveBoxSubboxId.s084_t6_sb022,
    PositiveBoxSubboxId.s084_t6_sb023,
    PositiveBoxSubboxId.s084_t6_sb024,
    PositiveBoxSubboxId.s084_t6_sb025,
    PositiveBoxSubboxId.s084_t6_sb026,
    PositiveBoxSubboxId.s084_t6_sb027,
    PositiveBoxSubboxId.s084_t6_sb028,
    PositiveBoxSubboxId.s084_t6_sb029,
    PositiveBoxSubboxId.s084_t6_sb030,
    PositiveBoxSubboxId.s084_t6_sb031,
    PositiveBoxSubboxId.s084_t7_sb000,
    PositiveBoxSubboxId.s084_t7_sb001,
    PositiveBoxSubboxId.s084_t7_sb002,
    PositiveBoxSubboxId.s084_t7_sb003,
    PositiveBoxSubboxId.s084_t7_sb004,
    PositiveBoxSubboxId.s084_t7_sb005,
    PositiveBoxSubboxId.s084_t7_sb006,
    PositiveBoxSubboxId.s084_t7_sb007,
    PositiveBoxSubboxId.s084_t7_sb008,
    PositiveBoxSubboxId.s084_t7_sb009,
    PositiveBoxSubboxId.s084_t7_sb010,
    PositiveBoxSubboxId.s084_t7_sb011,
    PositiveBoxSubboxId.s084_t7_sb012,
    PositiveBoxSubboxId.s084_t7_sb013,
    PositiveBoxSubboxId.s084_t7_sb014,
    PositiveBoxSubboxId.s084_t7_sb015,
    PositiveBoxSubboxId.s084_t7_sb016,
    PositiveBoxSubboxId.s084_t7_sb017,
    PositiveBoxSubboxId.s084_t7_sb018,
    PositiveBoxSubboxId.s084_t7_sb019,
    PositiveBoxSubboxId.s084_t7_sb020,
    PositiveBoxSubboxId.s084_t7_sb021,
    PositiveBoxSubboxId.s084_t7_sb022,
    PositiveBoxSubboxId.s084_t7_sb023,
    PositiveBoxSubboxId.s084_t7_sb024,
    PositiveBoxSubboxId.s084_t7_sb025,
    PositiveBoxSubboxId.s084_t7_sb026,
    PositiveBoxSubboxId.s084_t7_sb027,
    PositiveBoxSubboxId.s084_t7_sb028,
    PositiveBoxSubboxId.s084_t7_sb029,
    PositiveBoxSubboxId.s084_t7_sb030,
    PositiveBoxSubboxId.s084_t7_sb031,
    PositiveBoxSubboxId.s084_t8_sb000,
    PositiveBoxSubboxId.s085_t0_sb000,
    PositiveBoxSubboxId.s085_t0_sb001,
    PositiveBoxSubboxId.s085_t0_sb002,
    PositiveBoxSubboxId.s085_t0_sb003,
    PositiveBoxSubboxId.s085_t0_sb004,
    PositiveBoxSubboxId.s085_t0_sb005,
    PositiveBoxSubboxId.s085_t0_sb006,
    PositiveBoxSubboxId.s085_t0_sb007,
    PositiveBoxSubboxId.s085_t0_sb008,
    PositiveBoxSubboxId.s085_t0_sb009,
    PositiveBoxSubboxId.s085_t0_sb010,
    PositiveBoxSubboxId.s085_t0_sb011,
    PositiveBoxSubboxId.s085_t0_sb012,
    PositiveBoxSubboxId.s085_t0_sb013,
    PositiveBoxSubboxId.s085_t0_sb014,
    PositiveBoxSubboxId.s085_t0_sb015,
    PositiveBoxSubboxId.s085_t0_sb016,
    PositiveBoxSubboxId.s085_t0_sb017,
    PositiveBoxSubboxId.s085_t0_sb018,
    PositiveBoxSubboxId.s085_t0_sb019,
    PositiveBoxSubboxId.s085_t0_sb020,
    PositiveBoxSubboxId.s085_t0_sb021,
    PositiveBoxSubboxId.s085_t0_sb022,
    PositiveBoxSubboxId.s085_t0_sb023,
    PositiveBoxSubboxId.s085_t0_sb024,
    PositiveBoxSubboxId.s085_t0_sb025,
    PositiveBoxSubboxId.s085_t0_sb026,
    PositiveBoxSubboxId.s085_t0_sb027,
    PositiveBoxSubboxId.s085_t0_sb028,
    PositiveBoxSubboxId.s085_t0_sb029,
    PositiveBoxSubboxId.s085_t0_sb030,
    PositiveBoxSubboxId.s085_t0_sb031,
    PositiveBoxSubboxId.s085_t1_sb000,
    PositiveBoxSubboxId.s085_t1_sb001,
    PositiveBoxSubboxId.s085_t1_sb002,
    PositiveBoxSubboxId.s085_t1_sb003,
    PositiveBoxSubboxId.s085_t1_sb004,
    PositiveBoxSubboxId.s085_t1_sb005,
    PositiveBoxSubboxId.s085_t1_sb006,
    PositiveBoxSubboxId.s085_t1_sb007,
    PositiveBoxSubboxId.s085_t1_sb008,
    PositiveBoxSubboxId.s085_t1_sb009,
    PositiveBoxSubboxId.s085_t1_sb010,
    PositiveBoxSubboxId.s085_t1_sb011,
    PositiveBoxSubboxId.s085_t1_sb012,
    PositiveBoxSubboxId.s085_t1_sb013,
    PositiveBoxSubboxId.s085_t1_sb014,
    PositiveBoxSubboxId.s085_t1_sb015,
    PositiveBoxSubboxId.s085_t1_sb016,
    PositiveBoxSubboxId.s085_t1_sb017,
    PositiveBoxSubboxId.s085_t1_sb018,
    PositiveBoxSubboxId.s085_t1_sb019,
    PositiveBoxSubboxId.s085_t1_sb020,
    PositiveBoxSubboxId.s085_t1_sb021,
    PositiveBoxSubboxId.s085_t1_sb022,
    PositiveBoxSubboxId.s085_t1_sb023,
    PositiveBoxSubboxId.s085_t1_sb024,
    PositiveBoxSubboxId.s085_t1_sb025,
    PositiveBoxSubboxId.s085_t1_sb026,
    PositiveBoxSubboxId.s085_t1_sb027,
    PositiveBoxSubboxId.s085_t1_sb028,
    PositiveBoxSubboxId.s085_t1_sb029,
    PositiveBoxSubboxId.s085_t1_sb030,
    PositiveBoxSubboxId.s085_t1_sb031,
    PositiveBoxSubboxId.s085_t2_sb000,
    PositiveBoxSubboxId.s085_t2_sb001,
    PositiveBoxSubboxId.s085_t2_sb002,
    PositiveBoxSubboxId.s085_t2_sb003,
    PositiveBoxSubboxId.s085_t2_sb004,
    PositiveBoxSubboxId.s085_t2_sb005,
    PositiveBoxSubboxId.s085_t2_sb006,
    PositiveBoxSubboxId.s085_t2_sb007,
    PositiveBoxSubboxId.s085_t2_sb008,
    PositiveBoxSubboxId.s085_t2_sb009,
    PositiveBoxSubboxId.s085_t2_sb010,
    PositiveBoxSubboxId.s085_t2_sb011,
    PositiveBoxSubboxId.s085_t2_sb012,
    PositiveBoxSubboxId.s085_t2_sb013,
    PositiveBoxSubboxId.s085_t2_sb014,
    PositiveBoxSubboxId.s085_t2_sb015,
    PositiveBoxSubboxId.s085_t2_sb016,
    PositiveBoxSubboxId.s085_t2_sb017,
    PositiveBoxSubboxId.s085_t2_sb018,
    PositiveBoxSubboxId.s085_t2_sb019,
    PositiveBoxSubboxId.s085_t2_sb020,
    PositiveBoxSubboxId.s085_t2_sb021,
    PositiveBoxSubboxId.s085_t2_sb022,
    PositiveBoxSubboxId.s085_t2_sb023,
    PositiveBoxSubboxId.s085_t2_sb024,
    PositiveBoxSubboxId.s085_t2_sb025,
    PositiveBoxSubboxId.s085_t2_sb026,
    PositiveBoxSubboxId.s085_t2_sb027,
    PositiveBoxSubboxId.s085_t2_sb028,
    PositiveBoxSubboxId.s085_t2_sb029,
    PositiveBoxSubboxId.s085_t2_sb030,
    PositiveBoxSubboxId.s085_t2_sb031,
    PositiveBoxSubboxId.s085_t3_sb000,
    PositiveBoxSubboxId.s085_t3_sb001,
    PositiveBoxSubboxId.s085_t3_sb002,
    PositiveBoxSubboxId.s085_t3_sb003,
    PositiveBoxSubboxId.s085_t3_sb004,
    PositiveBoxSubboxId.s085_t3_sb005,
    PositiveBoxSubboxId.s085_t3_sb006,
    PositiveBoxSubboxId.s085_t3_sb007,
    PositiveBoxSubboxId.s085_t3_sb008,
    PositiveBoxSubboxId.s085_t3_sb009,
    PositiveBoxSubboxId.s085_t3_sb010,
    PositiveBoxSubboxId.s085_t3_sb011,
    PositiveBoxSubboxId.s085_t3_sb012,
    PositiveBoxSubboxId.s085_t3_sb013,
    PositiveBoxSubboxId.s085_t3_sb014,
    PositiveBoxSubboxId.s085_t3_sb015,
    PositiveBoxSubboxId.s085_t3_sb016,
    PositiveBoxSubboxId.s085_t3_sb017,
    PositiveBoxSubboxId.s085_t3_sb018,
    PositiveBoxSubboxId.s085_t3_sb019,
    PositiveBoxSubboxId.s085_t3_sb020,
    PositiveBoxSubboxId.s085_t3_sb021,
    PositiveBoxSubboxId.s085_t3_sb022,
    PositiveBoxSubboxId.s085_t3_sb023,
    PositiveBoxSubboxId.s085_t3_sb024,
    PositiveBoxSubboxId.s085_t3_sb025,
    PositiveBoxSubboxId.s085_t3_sb026,
    PositiveBoxSubboxId.s085_t3_sb027,
    PositiveBoxSubboxId.s085_t3_sb028,
    PositiveBoxSubboxId.s085_t3_sb029,
    PositiveBoxSubboxId.s085_t3_sb030,
    PositiveBoxSubboxId.s085_t3_sb031,
    PositiveBoxSubboxId.s085_t4_sb000,
    PositiveBoxSubboxId.s085_t4_sb001,
    PositiveBoxSubboxId.s085_t4_sb002,
    PositiveBoxSubboxId.s085_t4_sb003,
    PositiveBoxSubboxId.s085_t4_sb004,
    PositiveBoxSubboxId.s085_t4_sb005,
    PositiveBoxSubboxId.s085_t4_sb006,
    PositiveBoxSubboxId.s085_t4_sb007,
    PositiveBoxSubboxId.s085_t4_sb008,
    PositiveBoxSubboxId.s085_t4_sb009,
    PositiveBoxSubboxId.s085_t4_sb010,
    PositiveBoxSubboxId.s085_t4_sb011,
    PositiveBoxSubboxId.s085_t4_sb012,
    PositiveBoxSubboxId.s085_t4_sb013,
    PositiveBoxSubboxId.s085_t4_sb014,
    PositiveBoxSubboxId.s085_t4_sb015,
    PositiveBoxSubboxId.s085_t4_sb016,
    PositiveBoxSubboxId.s085_t4_sb017,
    PositiveBoxSubboxId.s085_t4_sb018,
    PositiveBoxSubboxId.s085_t4_sb019,
    PositiveBoxSubboxId.s085_t4_sb020,
    PositiveBoxSubboxId.s085_t4_sb021,
    PositiveBoxSubboxId.s085_t4_sb022,
    PositiveBoxSubboxId.s085_t4_sb023,
    PositiveBoxSubboxId.s085_t4_sb024,
    PositiveBoxSubboxId.s085_t4_sb025,
    PositiveBoxSubboxId.s085_t4_sb026,
    PositiveBoxSubboxId.s085_t4_sb027,
    PositiveBoxSubboxId.s085_t4_sb028,
    PositiveBoxSubboxId.s085_t4_sb029,
    PositiveBoxSubboxId.s085_t4_sb030,
    PositiveBoxSubboxId.s085_t4_sb031,
    PositiveBoxSubboxId.s085_t5_sb000,
    PositiveBoxSubboxId.s085_t5_sb001,
    PositiveBoxSubboxId.s085_t5_sb002,
    PositiveBoxSubboxId.s085_t5_sb003,
    PositiveBoxSubboxId.s085_t5_sb004,
    PositiveBoxSubboxId.s085_t5_sb005,
    PositiveBoxSubboxId.s085_t5_sb006,
    PositiveBoxSubboxId.s085_t5_sb007,
    PositiveBoxSubboxId.s085_t5_sb008,
    PositiveBoxSubboxId.s085_t5_sb009,
    PositiveBoxSubboxId.s085_t5_sb010,
    PositiveBoxSubboxId.s085_t5_sb011,
    PositiveBoxSubboxId.s085_t5_sb012,
    PositiveBoxSubboxId.s085_t5_sb013,
    PositiveBoxSubboxId.s085_t5_sb014,
    PositiveBoxSubboxId.s085_t5_sb015,
    PositiveBoxSubboxId.s085_t5_sb016,
    PositiveBoxSubboxId.s085_t5_sb017,
    PositiveBoxSubboxId.s085_t5_sb018,
    PositiveBoxSubboxId.s085_t5_sb019,
    PositiveBoxSubboxId.s085_t5_sb020,
    PositiveBoxSubboxId.s085_t5_sb021,
    PositiveBoxSubboxId.s085_t5_sb022,
    PositiveBoxSubboxId.s085_t5_sb023,
    PositiveBoxSubboxId.s085_t5_sb024,
    PositiveBoxSubboxId.s085_t5_sb025,
    PositiveBoxSubboxId.s085_t5_sb026,
    PositiveBoxSubboxId.s085_t5_sb027,
    PositiveBoxSubboxId.s085_t5_sb028,
    PositiveBoxSubboxId.s085_t5_sb029,
    PositiveBoxSubboxId.s085_t5_sb030,
    PositiveBoxSubboxId.s085_t5_sb031,
    PositiveBoxSubboxId.s085_t6_sb000,
    PositiveBoxSubboxId.s085_t6_sb001,
    PositiveBoxSubboxId.s085_t6_sb002,
    PositiveBoxSubboxId.s085_t6_sb003,
    PositiveBoxSubboxId.s085_t6_sb004,
    PositiveBoxSubboxId.s085_t6_sb005,
    PositiveBoxSubboxId.s085_t6_sb006,
    PositiveBoxSubboxId.s085_t6_sb007,
    PositiveBoxSubboxId.s085_t6_sb008,
    PositiveBoxSubboxId.s085_t6_sb009,
    PositiveBoxSubboxId.s085_t6_sb010,
    PositiveBoxSubboxId.s085_t6_sb011,
    PositiveBoxSubboxId.s085_t6_sb012,
    PositiveBoxSubboxId.s085_t6_sb013,
    PositiveBoxSubboxId.s085_t6_sb014,
    PositiveBoxSubboxId.s085_t6_sb015,
    PositiveBoxSubboxId.s085_t6_sb016,
    PositiveBoxSubboxId.s085_t6_sb017,
    PositiveBoxSubboxId.s085_t6_sb018,
    PositiveBoxSubboxId.s085_t6_sb019,
    PositiveBoxSubboxId.s085_t6_sb020,
    PositiveBoxSubboxId.s085_t6_sb021,
    PositiveBoxSubboxId.s085_t6_sb022,
    PositiveBoxSubboxId.s085_t6_sb023,
    PositiveBoxSubboxId.s085_t6_sb024,
    PositiveBoxSubboxId.s085_t6_sb025,
    PositiveBoxSubboxId.s085_t6_sb026,
    PositiveBoxSubboxId.s085_t6_sb027,
    PositiveBoxSubboxId.s085_t6_sb028,
    PositiveBoxSubboxId.s085_t6_sb029,
    PositiveBoxSubboxId.s085_t6_sb030,
    PositiveBoxSubboxId.s085_t6_sb031,
    PositiveBoxSubboxId.s085_t7_sb000,
    PositiveBoxSubboxId.s085_t7_sb001,
    PositiveBoxSubboxId.s085_t7_sb002,
    PositiveBoxSubboxId.s085_t7_sb003,
    PositiveBoxSubboxId.s085_t7_sb004,
    PositiveBoxSubboxId.s085_t7_sb005,
    PositiveBoxSubboxId.s085_t7_sb006,
    PositiveBoxSubboxId.s085_t7_sb007,
    PositiveBoxSubboxId.s085_t7_sb008,
    PositiveBoxSubboxId.s085_t7_sb009,
    PositiveBoxSubboxId.s085_t7_sb010,
    PositiveBoxSubboxId.s085_t7_sb011,
    PositiveBoxSubboxId.s085_t7_sb012,
    PositiveBoxSubboxId.s085_t7_sb013,
    PositiveBoxSubboxId.s085_t7_sb014,
    PositiveBoxSubboxId.s085_t7_sb015,
    PositiveBoxSubboxId.s085_t7_sb016,
    PositiveBoxSubboxId.s085_t7_sb017,
    PositiveBoxSubboxId.s085_t7_sb018,
    PositiveBoxSubboxId.s085_t7_sb019,
    PositiveBoxSubboxId.s085_t7_sb020,
    PositiveBoxSubboxId.s085_t7_sb021,
    PositiveBoxSubboxId.s085_t7_sb022,
    PositiveBoxSubboxId.s085_t7_sb023,
    PositiveBoxSubboxId.s085_t7_sb024,
    PositiveBoxSubboxId.s085_t7_sb025,
    PositiveBoxSubboxId.s085_t7_sb026,
    PositiveBoxSubboxId.s085_t7_sb027,
    PositiveBoxSubboxId.s085_t7_sb028,
    PositiveBoxSubboxId.s085_t7_sb029,
    PositiveBoxSubboxId.s085_t7_sb030,
    PositiveBoxSubboxId.s085_t7_sb031,
    PositiveBoxSubboxId.s085_t8_sb000,
    PositiveBoxSubboxId.s086_t0_sb000,
    PositiveBoxSubboxId.s086_t0_sb001,
    PositiveBoxSubboxId.s086_t0_sb002,
    PositiveBoxSubboxId.s086_t0_sb003,
    PositiveBoxSubboxId.s086_t0_sb004,
    PositiveBoxSubboxId.s086_t0_sb005,
    PositiveBoxSubboxId.s086_t0_sb006,
    PositiveBoxSubboxId.s086_t0_sb007,
    PositiveBoxSubboxId.s086_t0_sb008,
    PositiveBoxSubboxId.s086_t0_sb009,
    PositiveBoxSubboxId.s086_t0_sb010,
    PositiveBoxSubboxId.s086_t0_sb011,
    PositiveBoxSubboxId.s086_t0_sb012,
    PositiveBoxSubboxId.s086_t0_sb013,
    PositiveBoxSubboxId.s086_t0_sb014,
    PositiveBoxSubboxId.s086_t0_sb015,
    PositiveBoxSubboxId.s086_t0_sb016,
    PositiveBoxSubboxId.s086_t0_sb017,
    PositiveBoxSubboxId.s086_t0_sb018,
    PositiveBoxSubboxId.s086_t0_sb019,
    PositiveBoxSubboxId.s086_t0_sb020,
    PositiveBoxSubboxId.s086_t0_sb021,
    PositiveBoxSubboxId.s086_t0_sb022,
    PositiveBoxSubboxId.s086_t0_sb023,
    PositiveBoxSubboxId.s086_t0_sb024,
    PositiveBoxSubboxId.s086_t0_sb025,
    PositiveBoxSubboxId.s086_t0_sb026,
    PositiveBoxSubboxId.s086_t0_sb027,
    PositiveBoxSubboxId.s086_t0_sb028,
    PositiveBoxSubboxId.s086_t0_sb029,
    PositiveBoxSubboxId.s086_t0_sb030,
    PositiveBoxSubboxId.s086_t0_sb031,
    PositiveBoxSubboxId.s086_t1_sb000,
    PositiveBoxSubboxId.s086_t1_sb001,
    PositiveBoxSubboxId.s086_t1_sb002,
    PositiveBoxSubboxId.s086_t1_sb003,
    PositiveBoxSubboxId.s086_t1_sb004,
    PositiveBoxSubboxId.s086_t1_sb005,
    PositiveBoxSubboxId.s086_t1_sb006,
    PositiveBoxSubboxId.s086_t1_sb007,
    PositiveBoxSubboxId.s086_t1_sb008,
    PositiveBoxSubboxId.s086_t1_sb009,
    PositiveBoxSubboxId.s086_t1_sb010,
    PositiveBoxSubboxId.s086_t1_sb011,
    PositiveBoxSubboxId.s086_t1_sb012,
    PositiveBoxSubboxId.s086_t1_sb013,
    PositiveBoxSubboxId.s086_t1_sb014,
    PositiveBoxSubboxId.s086_t1_sb015,
    PositiveBoxSubboxId.s086_t1_sb016,
    PositiveBoxSubboxId.s086_t1_sb017,
    PositiveBoxSubboxId.s086_t1_sb018,
    PositiveBoxSubboxId.s086_t1_sb019,
    PositiveBoxSubboxId.s086_t1_sb020,
    PositiveBoxSubboxId.s086_t1_sb021,
    PositiveBoxSubboxId.s086_t1_sb022,
    PositiveBoxSubboxId.s086_t1_sb023,
    PositiveBoxSubboxId.s086_t1_sb024,
    PositiveBoxSubboxId.s086_t1_sb025,
    PositiveBoxSubboxId.s086_t1_sb026,
    PositiveBoxSubboxId.s086_t1_sb027,
    PositiveBoxSubboxId.s086_t1_sb028,
    PositiveBoxSubboxId.s086_t1_sb029,
    PositiveBoxSubboxId.s086_t1_sb030,
    PositiveBoxSubboxId.s086_t1_sb031,
    PositiveBoxSubboxId.s086_t2_sb000,
    PositiveBoxSubboxId.s086_t2_sb001,
    PositiveBoxSubboxId.s086_t2_sb002,
    PositiveBoxSubboxId.s086_t2_sb003,
    PositiveBoxSubboxId.s086_t2_sb004,
    PositiveBoxSubboxId.s086_t2_sb005,
    PositiveBoxSubboxId.s086_t2_sb006,
    PositiveBoxSubboxId.s086_t2_sb007,
    PositiveBoxSubboxId.s086_t2_sb008,
    PositiveBoxSubboxId.s086_t2_sb009,
    PositiveBoxSubboxId.s086_t2_sb010,
    PositiveBoxSubboxId.s086_t2_sb011,
    PositiveBoxSubboxId.s086_t2_sb012,
    PositiveBoxSubboxId.s086_t2_sb013,
    PositiveBoxSubboxId.s086_t2_sb014,
    PositiveBoxSubboxId.s086_t2_sb015,
    PositiveBoxSubboxId.s086_t2_sb016,
    PositiveBoxSubboxId.s086_t2_sb017,
    PositiveBoxSubboxId.s086_t2_sb018,
    PositiveBoxSubboxId.s086_t2_sb019,
    PositiveBoxSubboxId.s086_t2_sb020,
    PositiveBoxSubboxId.s086_t2_sb021,
    PositiveBoxSubboxId.s086_t2_sb022,
    PositiveBoxSubboxId.s086_t2_sb023,
    PositiveBoxSubboxId.s086_t2_sb024,
    PositiveBoxSubboxId.s086_t2_sb025,
    PositiveBoxSubboxId.s086_t2_sb026,
    PositiveBoxSubboxId.s086_t2_sb027,
    PositiveBoxSubboxId.s086_t2_sb028,
    PositiveBoxSubboxId.s086_t2_sb029,
    PositiveBoxSubboxId.s086_t2_sb030,
    PositiveBoxSubboxId.s086_t2_sb031,
    PositiveBoxSubboxId.s086_t3_sb000,
    PositiveBoxSubboxId.s086_t3_sb001,
    PositiveBoxSubboxId.s086_t3_sb002,
    PositiveBoxSubboxId.s086_t3_sb003,
    PositiveBoxSubboxId.s086_t3_sb004,
    PositiveBoxSubboxId.s086_t3_sb005,
    PositiveBoxSubboxId.s086_t3_sb006,
    PositiveBoxSubboxId.s086_t3_sb007,
    PositiveBoxSubboxId.s086_t3_sb008,
    PositiveBoxSubboxId.s086_t3_sb009,
    PositiveBoxSubboxId.s086_t3_sb010,
    PositiveBoxSubboxId.s086_t3_sb011,
    PositiveBoxSubboxId.s086_t3_sb012,
    PositiveBoxSubboxId.s086_t3_sb013,
    PositiveBoxSubboxId.s086_t3_sb014,
    PositiveBoxSubboxId.s086_t3_sb015,
    PositiveBoxSubboxId.s086_t3_sb016,
    PositiveBoxSubboxId.s086_t3_sb017,
    PositiveBoxSubboxId.s086_t3_sb018,
    PositiveBoxSubboxId.s086_t3_sb019,
    PositiveBoxSubboxId.s086_t3_sb020,
    PositiveBoxSubboxId.s086_t3_sb021,
    PositiveBoxSubboxId.s086_t3_sb022,
    PositiveBoxSubboxId.s086_t3_sb023,
    PositiveBoxSubboxId.s086_t3_sb024,
    PositiveBoxSubboxId.s086_t3_sb025,
    PositiveBoxSubboxId.s086_t3_sb026,
    PositiveBoxSubboxId.s086_t3_sb027,
    PositiveBoxSubboxId.s086_t3_sb028,
    PositiveBoxSubboxId.s086_t3_sb029,
    PositiveBoxSubboxId.s086_t3_sb030,
    PositiveBoxSubboxId.s086_t3_sb031,
    PositiveBoxSubboxId.s086_t4_sb000,
    PositiveBoxSubboxId.s086_t4_sb001,
    PositiveBoxSubboxId.s086_t4_sb002,
    PositiveBoxSubboxId.s086_t4_sb003,
    PositiveBoxSubboxId.s086_t4_sb004,
    PositiveBoxSubboxId.s086_t4_sb005,
    PositiveBoxSubboxId.s086_t4_sb006,
    PositiveBoxSubboxId.s086_t4_sb007,
    PositiveBoxSubboxId.s086_t4_sb008,
    PositiveBoxSubboxId.s086_t4_sb009,
    PositiveBoxSubboxId.s086_t4_sb010,
    PositiveBoxSubboxId.s086_t4_sb011,
    PositiveBoxSubboxId.s086_t4_sb012,
    PositiveBoxSubboxId.s086_t4_sb013,
    PositiveBoxSubboxId.s086_t4_sb014,
    PositiveBoxSubboxId.s086_t4_sb015,
    PositiveBoxSubboxId.s086_t4_sb016,
    PositiveBoxSubboxId.s086_t4_sb017,
    PositiveBoxSubboxId.s086_t4_sb018,
    PositiveBoxSubboxId.s086_t4_sb019,
    PositiveBoxSubboxId.s086_t4_sb020,
    PositiveBoxSubboxId.s086_t4_sb021,
    PositiveBoxSubboxId.s086_t4_sb022,
    PositiveBoxSubboxId.s086_t4_sb023,
    PositiveBoxSubboxId.s086_t4_sb024,
    PositiveBoxSubboxId.s086_t4_sb025,
    PositiveBoxSubboxId.s086_t4_sb026,
    PositiveBoxSubboxId.s086_t4_sb027,
    PositiveBoxSubboxId.s086_t4_sb028,
    PositiveBoxSubboxId.s086_t4_sb029,
    PositiveBoxSubboxId.s086_t4_sb030,
    PositiveBoxSubboxId.s086_t4_sb031,
    PositiveBoxSubboxId.s086_t5_sb000,
    PositiveBoxSubboxId.s086_t5_sb001,
    PositiveBoxSubboxId.s086_t5_sb002,
    PositiveBoxSubboxId.s086_t5_sb003,
    PositiveBoxSubboxId.s086_t5_sb004,
    PositiveBoxSubboxId.s086_t5_sb005,
    PositiveBoxSubboxId.s086_t5_sb006,
    PositiveBoxSubboxId.s086_t5_sb007,
    PositiveBoxSubboxId.s086_t5_sb008,
    PositiveBoxSubboxId.s086_t5_sb009,
    PositiveBoxSubboxId.s086_t5_sb010,
    PositiveBoxSubboxId.s086_t5_sb011,
    PositiveBoxSubboxId.s086_t5_sb012,
    PositiveBoxSubboxId.s086_t5_sb013,
    PositiveBoxSubboxId.s086_t5_sb014,
    PositiveBoxSubboxId.s086_t5_sb015,
    PositiveBoxSubboxId.s086_t5_sb016,
    PositiveBoxSubboxId.s086_t5_sb017,
    PositiveBoxSubboxId.s086_t5_sb018,
    PositiveBoxSubboxId.s086_t5_sb019,
    PositiveBoxSubboxId.s086_t5_sb020,
    PositiveBoxSubboxId.s086_t5_sb021,
    PositiveBoxSubboxId.s086_t5_sb022,
    PositiveBoxSubboxId.s086_t5_sb023,
    PositiveBoxSubboxId.s086_t5_sb024,
    PositiveBoxSubboxId.s086_t5_sb025,
    PositiveBoxSubboxId.s086_t5_sb026,
    PositiveBoxSubboxId.s086_t5_sb027,
    PositiveBoxSubboxId.s086_t5_sb028,
    PositiveBoxSubboxId.s086_t5_sb029,
    PositiveBoxSubboxId.s086_t5_sb030,
    PositiveBoxSubboxId.s086_t5_sb031,
    PositiveBoxSubboxId.s086_t6_sb000,
    PositiveBoxSubboxId.s086_t6_sb001,
    PositiveBoxSubboxId.s086_t6_sb002,
    PositiveBoxSubboxId.s086_t6_sb003,
    PositiveBoxSubboxId.s086_t6_sb004,
    PositiveBoxSubboxId.s086_t6_sb005,
    PositiveBoxSubboxId.s086_t6_sb006,
    PositiveBoxSubboxId.s086_t6_sb007,
    PositiveBoxSubboxId.s086_t6_sb008,
    PositiveBoxSubboxId.s086_t6_sb009,
    PositiveBoxSubboxId.s086_t6_sb010,
    PositiveBoxSubboxId.s086_t6_sb011,
    PositiveBoxSubboxId.s086_t6_sb012,
    PositiveBoxSubboxId.s086_t6_sb013,
    PositiveBoxSubboxId.s086_t6_sb014,
    PositiveBoxSubboxId.s086_t6_sb015,
    PositiveBoxSubboxId.s086_t6_sb016,
    PositiveBoxSubboxId.s086_t6_sb017,
    PositiveBoxSubboxId.s086_t6_sb018,
    PositiveBoxSubboxId.s086_t6_sb019,
    PositiveBoxSubboxId.s086_t6_sb020,
    PositiveBoxSubboxId.s086_t6_sb021,
    PositiveBoxSubboxId.s086_t6_sb022,
    PositiveBoxSubboxId.s086_t6_sb023,
    PositiveBoxSubboxId.s086_t6_sb024,
    PositiveBoxSubboxId.s086_t6_sb025,
    PositiveBoxSubboxId.s086_t6_sb026,
    PositiveBoxSubboxId.s086_t6_sb027,
    PositiveBoxSubboxId.s086_t6_sb028,
    PositiveBoxSubboxId.s086_t6_sb029,
    PositiveBoxSubboxId.s086_t6_sb030,
    PositiveBoxSubboxId.s086_t6_sb031,
    PositiveBoxSubboxId.s086_t7_sb000,
    PositiveBoxSubboxId.s086_t7_sb001,
    PositiveBoxSubboxId.s086_t7_sb002,
    PositiveBoxSubboxId.s086_t7_sb003,
    PositiveBoxSubboxId.s086_t7_sb004,
    PositiveBoxSubboxId.s086_t7_sb005,
    PositiveBoxSubboxId.s086_t7_sb006,
    PositiveBoxSubboxId.s086_t7_sb007,
    PositiveBoxSubboxId.s086_t7_sb008,
    PositiveBoxSubboxId.s086_t7_sb009,
    PositiveBoxSubboxId.s086_t7_sb010,
    PositiveBoxSubboxId.s086_t7_sb011,
    PositiveBoxSubboxId.s086_t7_sb012,
    PositiveBoxSubboxId.s086_t7_sb013,
    PositiveBoxSubboxId.s086_t7_sb014,
    PositiveBoxSubboxId.s086_t7_sb015,
    PositiveBoxSubboxId.s086_t7_sb016,
    PositiveBoxSubboxId.s086_t7_sb017,
    PositiveBoxSubboxId.s086_t7_sb018,
    PositiveBoxSubboxId.s086_t7_sb019,
    PositiveBoxSubboxId.s086_t7_sb020,
    PositiveBoxSubboxId.s086_t7_sb021,
    PositiveBoxSubboxId.s086_t7_sb022,
    PositiveBoxSubboxId.s086_t7_sb023,
    PositiveBoxSubboxId.s086_t7_sb024,
    PositiveBoxSubboxId.s086_t7_sb025,
    PositiveBoxSubboxId.s086_t7_sb026,
    PositiveBoxSubboxId.s086_t7_sb027,
    PositiveBoxSubboxId.s086_t7_sb028,
    PositiveBoxSubboxId.s086_t7_sb029,
    PositiveBoxSubboxId.s086_t7_sb030,
    PositiveBoxSubboxId.s086_t7_sb031,
    PositiveBoxSubboxId.s086_t8_sb000
  ].toFinset

def positiveBoxSubboxesOf : PositiveBoxId → Finset PositiveBoxSubboxId
  | .s084_t0 =>
    [
      PositiveBoxSubboxId.s084_t0_sb000,
      PositiveBoxSubboxId.s084_t0_sb001,
      PositiveBoxSubboxId.s084_t0_sb002,
      PositiveBoxSubboxId.s084_t0_sb003,
      PositiveBoxSubboxId.s084_t0_sb004,
      PositiveBoxSubboxId.s084_t0_sb005,
      PositiveBoxSubboxId.s084_t0_sb006,
      PositiveBoxSubboxId.s084_t0_sb007,
      PositiveBoxSubboxId.s084_t0_sb008,
      PositiveBoxSubboxId.s084_t0_sb009,
      PositiveBoxSubboxId.s084_t0_sb010,
      PositiveBoxSubboxId.s084_t0_sb011,
      PositiveBoxSubboxId.s084_t0_sb012,
      PositiveBoxSubboxId.s084_t0_sb013,
      PositiveBoxSubboxId.s084_t0_sb014,
      PositiveBoxSubboxId.s084_t0_sb015,
      PositiveBoxSubboxId.s084_t0_sb016,
      PositiveBoxSubboxId.s084_t0_sb017,
      PositiveBoxSubboxId.s084_t0_sb018,
      PositiveBoxSubboxId.s084_t0_sb019,
      PositiveBoxSubboxId.s084_t0_sb020,
      PositiveBoxSubboxId.s084_t0_sb021,
      PositiveBoxSubboxId.s084_t0_sb022,
      PositiveBoxSubboxId.s084_t0_sb023,
      PositiveBoxSubboxId.s084_t0_sb024,
      PositiveBoxSubboxId.s084_t0_sb025,
      PositiveBoxSubboxId.s084_t0_sb026,
      PositiveBoxSubboxId.s084_t0_sb027,
      PositiveBoxSubboxId.s084_t0_sb028,
      PositiveBoxSubboxId.s084_t0_sb029,
      PositiveBoxSubboxId.s084_t0_sb030,
      PositiveBoxSubboxId.s084_t0_sb031
    ].toFinset
  | .s084_t1 =>
    [
      PositiveBoxSubboxId.s084_t1_sb000,
      PositiveBoxSubboxId.s084_t1_sb001,
      PositiveBoxSubboxId.s084_t1_sb002,
      PositiveBoxSubboxId.s084_t1_sb003,
      PositiveBoxSubboxId.s084_t1_sb004,
      PositiveBoxSubboxId.s084_t1_sb005,
      PositiveBoxSubboxId.s084_t1_sb006,
      PositiveBoxSubboxId.s084_t1_sb007,
      PositiveBoxSubboxId.s084_t1_sb008,
      PositiveBoxSubboxId.s084_t1_sb009,
      PositiveBoxSubboxId.s084_t1_sb010,
      PositiveBoxSubboxId.s084_t1_sb011,
      PositiveBoxSubboxId.s084_t1_sb012,
      PositiveBoxSubboxId.s084_t1_sb013,
      PositiveBoxSubboxId.s084_t1_sb014,
      PositiveBoxSubboxId.s084_t1_sb015,
      PositiveBoxSubboxId.s084_t1_sb016,
      PositiveBoxSubboxId.s084_t1_sb017,
      PositiveBoxSubboxId.s084_t1_sb018,
      PositiveBoxSubboxId.s084_t1_sb019,
      PositiveBoxSubboxId.s084_t1_sb020,
      PositiveBoxSubboxId.s084_t1_sb021,
      PositiveBoxSubboxId.s084_t1_sb022,
      PositiveBoxSubboxId.s084_t1_sb023,
      PositiveBoxSubboxId.s084_t1_sb024,
      PositiveBoxSubboxId.s084_t1_sb025,
      PositiveBoxSubboxId.s084_t1_sb026,
      PositiveBoxSubboxId.s084_t1_sb027,
      PositiveBoxSubboxId.s084_t1_sb028,
      PositiveBoxSubboxId.s084_t1_sb029,
      PositiveBoxSubboxId.s084_t1_sb030,
      PositiveBoxSubboxId.s084_t1_sb031
    ].toFinset
  | .s084_t2 =>
    [
      PositiveBoxSubboxId.s084_t2_sb000,
      PositiveBoxSubboxId.s084_t2_sb001,
      PositiveBoxSubboxId.s084_t2_sb002,
      PositiveBoxSubboxId.s084_t2_sb003,
      PositiveBoxSubboxId.s084_t2_sb004,
      PositiveBoxSubboxId.s084_t2_sb005,
      PositiveBoxSubboxId.s084_t2_sb006,
      PositiveBoxSubboxId.s084_t2_sb007,
      PositiveBoxSubboxId.s084_t2_sb008,
      PositiveBoxSubboxId.s084_t2_sb009,
      PositiveBoxSubboxId.s084_t2_sb010,
      PositiveBoxSubboxId.s084_t2_sb011,
      PositiveBoxSubboxId.s084_t2_sb012,
      PositiveBoxSubboxId.s084_t2_sb013,
      PositiveBoxSubboxId.s084_t2_sb014,
      PositiveBoxSubboxId.s084_t2_sb015,
      PositiveBoxSubboxId.s084_t2_sb016,
      PositiveBoxSubboxId.s084_t2_sb017,
      PositiveBoxSubboxId.s084_t2_sb018,
      PositiveBoxSubboxId.s084_t2_sb019,
      PositiveBoxSubboxId.s084_t2_sb020,
      PositiveBoxSubboxId.s084_t2_sb021,
      PositiveBoxSubboxId.s084_t2_sb022,
      PositiveBoxSubboxId.s084_t2_sb023,
      PositiveBoxSubboxId.s084_t2_sb024,
      PositiveBoxSubboxId.s084_t2_sb025,
      PositiveBoxSubboxId.s084_t2_sb026,
      PositiveBoxSubboxId.s084_t2_sb027,
      PositiveBoxSubboxId.s084_t2_sb028,
      PositiveBoxSubboxId.s084_t2_sb029,
      PositiveBoxSubboxId.s084_t2_sb030,
      PositiveBoxSubboxId.s084_t2_sb031
    ].toFinset
  | .s084_t3 =>
    [
      PositiveBoxSubboxId.s084_t3_sb000,
      PositiveBoxSubboxId.s084_t3_sb001,
      PositiveBoxSubboxId.s084_t3_sb002,
      PositiveBoxSubboxId.s084_t3_sb003,
      PositiveBoxSubboxId.s084_t3_sb004,
      PositiveBoxSubboxId.s084_t3_sb005,
      PositiveBoxSubboxId.s084_t3_sb006,
      PositiveBoxSubboxId.s084_t3_sb007,
      PositiveBoxSubboxId.s084_t3_sb008,
      PositiveBoxSubboxId.s084_t3_sb009,
      PositiveBoxSubboxId.s084_t3_sb010,
      PositiveBoxSubboxId.s084_t3_sb011,
      PositiveBoxSubboxId.s084_t3_sb012,
      PositiveBoxSubboxId.s084_t3_sb013,
      PositiveBoxSubboxId.s084_t3_sb014,
      PositiveBoxSubboxId.s084_t3_sb015,
      PositiveBoxSubboxId.s084_t3_sb016,
      PositiveBoxSubboxId.s084_t3_sb017,
      PositiveBoxSubboxId.s084_t3_sb018,
      PositiveBoxSubboxId.s084_t3_sb019,
      PositiveBoxSubboxId.s084_t3_sb020,
      PositiveBoxSubboxId.s084_t3_sb021,
      PositiveBoxSubboxId.s084_t3_sb022,
      PositiveBoxSubboxId.s084_t3_sb023,
      PositiveBoxSubboxId.s084_t3_sb024,
      PositiveBoxSubboxId.s084_t3_sb025,
      PositiveBoxSubboxId.s084_t3_sb026,
      PositiveBoxSubboxId.s084_t3_sb027,
      PositiveBoxSubboxId.s084_t3_sb028,
      PositiveBoxSubboxId.s084_t3_sb029,
      PositiveBoxSubboxId.s084_t3_sb030,
      PositiveBoxSubboxId.s084_t3_sb031
    ].toFinset
  | .s084_t4 =>
    [
      PositiveBoxSubboxId.s084_t4_sb000,
      PositiveBoxSubboxId.s084_t4_sb001,
      PositiveBoxSubboxId.s084_t4_sb002,
      PositiveBoxSubboxId.s084_t4_sb003,
      PositiveBoxSubboxId.s084_t4_sb004,
      PositiveBoxSubboxId.s084_t4_sb005,
      PositiveBoxSubboxId.s084_t4_sb006,
      PositiveBoxSubboxId.s084_t4_sb007,
      PositiveBoxSubboxId.s084_t4_sb008,
      PositiveBoxSubboxId.s084_t4_sb009,
      PositiveBoxSubboxId.s084_t4_sb010,
      PositiveBoxSubboxId.s084_t4_sb011,
      PositiveBoxSubboxId.s084_t4_sb012,
      PositiveBoxSubboxId.s084_t4_sb013,
      PositiveBoxSubboxId.s084_t4_sb014,
      PositiveBoxSubboxId.s084_t4_sb015,
      PositiveBoxSubboxId.s084_t4_sb016,
      PositiveBoxSubboxId.s084_t4_sb017,
      PositiveBoxSubboxId.s084_t4_sb018,
      PositiveBoxSubboxId.s084_t4_sb019,
      PositiveBoxSubboxId.s084_t4_sb020,
      PositiveBoxSubboxId.s084_t4_sb021,
      PositiveBoxSubboxId.s084_t4_sb022,
      PositiveBoxSubboxId.s084_t4_sb023,
      PositiveBoxSubboxId.s084_t4_sb024,
      PositiveBoxSubboxId.s084_t4_sb025,
      PositiveBoxSubboxId.s084_t4_sb026,
      PositiveBoxSubboxId.s084_t4_sb027,
      PositiveBoxSubboxId.s084_t4_sb028,
      PositiveBoxSubboxId.s084_t4_sb029,
      PositiveBoxSubboxId.s084_t4_sb030,
      PositiveBoxSubboxId.s084_t4_sb031
    ].toFinset
  | .s084_t5 =>
    [
      PositiveBoxSubboxId.s084_t5_sb000,
      PositiveBoxSubboxId.s084_t5_sb001,
      PositiveBoxSubboxId.s084_t5_sb002,
      PositiveBoxSubboxId.s084_t5_sb003,
      PositiveBoxSubboxId.s084_t5_sb004,
      PositiveBoxSubboxId.s084_t5_sb005,
      PositiveBoxSubboxId.s084_t5_sb006,
      PositiveBoxSubboxId.s084_t5_sb007,
      PositiveBoxSubboxId.s084_t5_sb008,
      PositiveBoxSubboxId.s084_t5_sb009,
      PositiveBoxSubboxId.s084_t5_sb010,
      PositiveBoxSubboxId.s084_t5_sb011,
      PositiveBoxSubboxId.s084_t5_sb012,
      PositiveBoxSubboxId.s084_t5_sb013,
      PositiveBoxSubboxId.s084_t5_sb014,
      PositiveBoxSubboxId.s084_t5_sb015,
      PositiveBoxSubboxId.s084_t5_sb016,
      PositiveBoxSubboxId.s084_t5_sb017,
      PositiveBoxSubboxId.s084_t5_sb018,
      PositiveBoxSubboxId.s084_t5_sb019,
      PositiveBoxSubboxId.s084_t5_sb020,
      PositiveBoxSubboxId.s084_t5_sb021,
      PositiveBoxSubboxId.s084_t5_sb022,
      PositiveBoxSubboxId.s084_t5_sb023,
      PositiveBoxSubboxId.s084_t5_sb024,
      PositiveBoxSubboxId.s084_t5_sb025,
      PositiveBoxSubboxId.s084_t5_sb026,
      PositiveBoxSubboxId.s084_t5_sb027,
      PositiveBoxSubboxId.s084_t5_sb028,
      PositiveBoxSubboxId.s084_t5_sb029,
      PositiveBoxSubboxId.s084_t5_sb030,
      PositiveBoxSubboxId.s084_t5_sb031
    ].toFinset
  | .s084_t6 =>
    [
      PositiveBoxSubboxId.s084_t6_sb000,
      PositiveBoxSubboxId.s084_t6_sb001,
      PositiveBoxSubboxId.s084_t6_sb002,
      PositiveBoxSubboxId.s084_t6_sb003,
      PositiveBoxSubboxId.s084_t6_sb004,
      PositiveBoxSubboxId.s084_t6_sb005,
      PositiveBoxSubboxId.s084_t6_sb006,
      PositiveBoxSubboxId.s084_t6_sb007,
      PositiveBoxSubboxId.s084_t6_sb008,
      PositiveBoxSubboxId.s084_t6_sb009,
      PositiveBoxSubboxId.s084_t6_sb010,
      PositiveBoxSubboxId.s084_t6_sb011,
      PositiveBoxSubboxId.s084_t6_sb012,
      PositiveBoxSubboxId.s084_t6_sb013,
      PositiveBoxSubboxId.s084_t6_sb014,
      PositiveBoxSubboxId.s084_t6_sb015,
      PositiveBoxSubboxId.s084_t6_sb016,
      PositiveBoxSubboxId.s084_t6_sb017,
      PositiveBoxSubboxId.s084_t6_sb018,
      PositiveBoxSubboxId.s084_t6_sb019,
      PositiveBoxSubboxId.s084_t6_sb020,
      PositiveBoxSubboxId.s084_t6_sb021,
      PositiveBoxSubboxId.s084_t6_sb022,
      PositiveBoxSubboxId.s084_t6_sb023,
      PositiveBoxSubboxId.s084_t6_sb024,
      PositiveBoxSubboxId.s084_t6_sb025,
      PositiveBoxSubboxId.s084_t6_sb026,
      PositiveBoxSubboxId.s084_t6_sb027,
      PositiveBoxSubboxId.s084_t6_sb028,
      PositiveBoxSubboxId.s084_t6_sb029,
      PositiveBoxSubboxId.s084_t6_sb030,
      PositiveBoxSubboxId.s084_t6_sb031
    ].toFinset
  | .s084_t7 =>
    [
      PositiveBoxSubboxId.s084_t7_sb000,
      PositiveBoxSubboxId.s084_t7_sb001,
      PositiveBoxSubboxId.s084_t7_sb002,
      PositiveBoxSubboxId.s084_t7_sb003,
      PositiveBoxSubboxId.s084_t7_sb004,
      PositiveBoxSubboxId.s084_t7_sb005,
      PositiveBoxSubboxId.s084_t7_sb006,
      PositiveBoxSubboxId.s084_t7_sb007,
      PositiveBoxSubboxId.s084_t7_sb008,
      PositiveBoxSubboxId.s084_t7_sb009,
      PositiveBoxSubboxId.s084_t7_sb010,
      PositiveBoxSubboxId.s084_t7_sb011,
      PositiveBoxSubboxId.s084_t7_sb012,
      PositiveBoxSubboxId.s084_t7_sb013,
      PositiveBoxSubboxId.s084_t7_sb014,
      PositiveBoxSubboxId.s084_t7_sb015,
      PositiveBoxSubboxId.s084_t7_sb016,
      PositiveBoxSubboxId.s084_t7_sb017,
      PositiveBoxSubboxId.s084_t7_sb018,
      PositiveBoxSubboxId.s084_t7_sb019,
      PositiveBoxSubboxId.s084_t7_sb020,
      PositiveBoxSubboxId.s084_t7_sb021,
      PositiveBoxSubboxId.s084_t7_sb022,
      PositiveBoxSubboxId.s084_t7_sb023,
      PositiveBoxSubboxId.s084_t7_sb024,
      PositiveBoxSubboxId.s084_t7_sb025,
      PositiveBoxSubboxId.s084_t7_sb026,
      PositiveBoxSubboxId.s084_t7_sb027,
      PositiveBoxSubboxId.s084_t7_sb028,
      PositiveBoxSubboxId.s084_t7_sb029,
      PositiveBoxSubboxId.s084_t7_sb030,
      PositiveBoxSubboxId.s084_t7_sb031
    ].toFinset
  | .s084_t8 =>
    [
      PositiveBoxSubboxId.s084_t8_sb000
    ].toFinset
  | .s085_t0 =>
    [
      PositiveBoxSubboxId.s085_t0_sb000,
      PositiveBoxSubboxId.s085_t0_sb001,
      PositiveBoxSubboxId.s085_t0_sb002,
      PositiveBoxSubboxId.s085_t0_sb003,
      PositiveBoxSubboxId.s085_t0_sb004,
      PositiveBoxSubboxId.s085_t0_sb005,
      PositiveBoxSubboxId.s085_t0_sb006,
      PositiveBoxSubboxId.s085_t0_sb007,
      PositiveBoxSubboxId.s085_t0_sb008,
      PositiveBoxSubboxId.s085_t0_sb009,
      PositiveBoxSubboxId.s085_t0_sb010,
      PositiveBoxSubboxId.s085_t0_sb011,
      PositiveBoxSubboxId.s085_t0_sb012,
      PositiveBoxSubboxId.s085_t0_sb013,
      PositiveBoxSubboxId.s085_t0_sb014,
      PositiveBoxSubboxId.s085_t0_sb015,
      PositiveBoxSubboxId.s085_t0_sb016,
      PositiveBoxSubboxId.s085_t0_sb017,
      PositiveBoxSubboxId.s085_t0_sb018,
      PositiveBoxSubboxId.s085_t0_sb019,
      PositiveBoxSubboxId.s085_t0_sb020,
      PositiveBoxSubboxId.s085_t0_sb021,
      PositiveBoxSubboxId.s085_t0_sb022,
      PositiveBoxSubboxId.s085_t0_sb023,
      PositiveBoxSubboxId.s085_t0_sb024,
      PositiveBoxSubboxId.s085_t0_sb025,
      PositiveBoxSubboxId.s085_t0_sb026,
      PositiveBoxSubboxId.s085_t0_sb027,
      PositiveBoxSubboxId.s085_t0_sb028,
      PositiveBoxSubboxId.s085_t0_sb029,
      PositiveBoxSubboxId.s085_t0_sb030,
      PositiveBoxSubboxId.s085_t0_sb031
    ].toFinset
  | .s085_t1 =>
    [
      PositiveBoxSubboxId.s085_t1_sb000,
      PositiveBoxSubboxId.s085_t1_sb001,
      PositiveBoxSubboxId.s085_t1_sb002,
      PositiveBoxSubboxId.s085_t1_sb003,
      PositiveBoxSubboxId.s085_t1_sb004,
      PositiveBoxSubboxId.s085_t1_sb005,
      PositiveBoxSubboxId.s085_t1_sb006,
      PositiveBoxSubboxId.s085_t1_sb007,
      PositiveBoxSubboxId.s085_t1_sb008,
      PositiveBoxSubboxId.s085_t1_sb009,
      PositiveBoxSubboxId.s085_t1_sb010,
      PositiveBoxSubboxId.s085_t1_sb011,
      PositiveBoxSubboxId.s085_t1_sb012,
      PositiveBoxSubboxId.s085_t1_sb013,
      PositiveBoxSubboxId.s085_t1_sb014,
      PositiveBoxSubboxId.s085_t1_sb015,
      PositiveBoxSubboxId.s085_t1_sb016,
      PositiveBoxSubboxId.s085_t1_sb017,
      PositiveBoxSubboxId.s085_t1_sb018,
      PositiveBoxSubboxId.s085_t1_sb019,
      PositiveBoxSubboxId.s085_t1_sb020,
      PositiveBoxSubboxId.s085_t1_sb021,
      PositiveBoxSubboxId.s085_t1_sb022,
      PositiveBoxSubboxId.s085_t1_sb023,
      PositiveBoxSubboxId.s085_t1_sb024,
      PositiveBoxSubboxId.s085_t1_sb025,
      PositiveBoxSubboxId.s085_t1_sb026,
      PositiveBoxSubboxId.s085_t1_sb027,
      PositiveBoxSubboxId.s085_t1_sb028,
      PositiveBoxSubboxId.s085_t1_sb029,
      PositiveBoxSubboxId.s085_t1_sb030,
      PositiveBoxSubboxId.s085_t1_sb031
    ].toFinset
  | .s085_t2 =>
    [
      PositiveBoxSubboxId.s085_t2_sb000,
      PositiveBoxSubboxId.s085_t2_sb001,
      PositiveBoxSubboxId.s085_t2_sb002,
      PositiveBoxSubboxId.s085_t2_sb003,
      PositiveBoxSubboxId.s085_t2_sb004,
      PositiveBoxSubboxId.s085_t2_sb005,
      PositiveBoxSubboxId.s085_t2_sb006,
      PositiveBoxSubboxId.s085_t2_sb007,
      PositiveBoxSubboxId.s085_t2_sb008,
      PositiveBoxSubboxId.s085_t2_sb009,
      PositiveBoxSubboxId.s085_t2_sb010,
      PositiveBoxSubboxId.s085_t2_sb011,
      PositiveBoxSubboxId.s085_t2_sb012,
      PositiveBoxSubboxId.s085_t2_sb013,
      PositiveBoxSubboxId.s085_t2_sb014,
      PositiveBoxSubboxId.s085_t2_sb015,
      PositiveBoxSubboxId.s085_t2_sb016,
      PositiveBoxSubboxId.s085_t2_sb017,
      PositiveBoxSubboxId.s085_t2_sb018,
      PositiveBoxSubboxId.s085_t2_sb019,
      PositiveBoxSubboxId.s085_t2_sb020,
      PositiveBoxSubboxId.s085_t2_sb021,
      PositiveBoxSubboxId.s085_t2_sb022,
      PositiveBoxSubboxId.s085_t2_sb023,
      PositiveBoxSubboxId.s085_t2_sb024,
      PositiveBoxSubboxId.s085_t2_sb025,
      PositiveBoxSubboxId.s085_t2_sb026,
      PositiveBoxSubboxId.s085_t2_sb027,
      PositiveBoxSubboxId.s085_t2_sb028,
      PositiveBoxSubboxId.s085_t2_sb029,
      PositiveBoxSubboxId.s085_t2_sb030,
      PositiveBoxSubboxId.s085_t2_sb031
    ].toFinset
  | .s085_t3 =>
    [
      PositiveBoxSubboxId.s085_t3_sb000,
      PositiveBoxSubboxId.s085_t3_sb001,
      PositiveBoxSubboxId.s085_t3_sb002,
      PositiveBoxSubboxId.s085_t3_sb003,
      PositiveBoxSubboxId.s085_t3_sb004,
      PositiveBoxSubboxId.s085_t3_sb005,
      PositiveBoxSubboxId.s085_t3_sb006,
      PositiveBoxSubboxId.s085_t3_sb007,
      PositiveBoxSubboxId.s085_t3_sb008,
      PositiveBoxSubboxId.s085_t3_sb009,
      PositiveBoxSubboxId.s085_t3_sb010,
      PositiveBoxSubboxId.s085_t3_sb011,
      PositiveBoxSubboxId.s085_t3_sb012,
      PositiveBoxSubboxId.s085_t3_sb013,
      PositiveBoxSubboxId.s085_t3_sb014,
      PositiveBoxSubboxId.s085_t3_sb015,
      PositiveBoxSubboxId.s085_t3_sb016,
      PositiveBoxSubboxId.s085_t3_sb017,
      PositiveBoxSubboxId.s085_t3_sb018,
      PositiveBoxSubboxId.s085_t3_sb019,
      PositiveBoxSubboxId.s085_t3_sb020,
      PositiveBoxSubboxId.s085_t3_sb021,
      PositiveBoxSubboxId.s085_t3_sb022,
      PositiveBoxSubboxId.s085_t3_sb023,
      PositiveBoxSubboxId.s085_t3_sb024,
      PositiveBoxSubboxId.s085_t3_sb025,
      PositiveBoxSubboxId.s085_t3_sb026,
      PositiveBoxSubboxId.s085_t3_sb027,
      PositiveBoxSubboxId.s085_t3_sb028,
      PositiveBoxSubboxId.s085_t3_sb029,
      PositiveBoxSubboxId.s085_t3_sb030,
      PositiveBoxSubboxId.s085_t3_sb031
    ].toFinset
  | .s085_t4 =>
    [
      PositiveBoxSubboxId.s085_t4_sb000,
      PositiveBoxSubboxId.s085_t4_sb001,
      PositiveBoxSubboxId.s085_t4_sb002,
      PositiveBoxSubboxId.s085_t4_sb003,
      PositiveBoxSubboxId.s085_t4_sb004,
      PositiveBoxSubboxId.s085_t4_sb005,
      PositiveBoxSubboxId.s085_t4_sb006,
      PositiveBoxSubboxId.s085_t4_sb007,
      PositiveBoxSubboxId.s085_t4_sb008,
      PositiveBoxSubboxId.s085_t4_sb009,
      PositiveBoxSubboxId.s085_t4_sb010,
      PositiveBoxSubboxId.s085_t4_sb011,
      PositiveBoxSubboxId.s085_t4_sb012,
      PositiveBoxSubboxId.s085_t4_sb013,
      PositiveBoxSubboxId.s085_t4_sb014,
      PositiveBoxSubboxId.s085_t4_sb015,
      PositiveBoxSubboxId.s085_t4_sb016,
      PositiveBoxSubboxId.s085_t4_sb017,
      PositiveBoxSubboxId.s085_t4_sb018,
      PositiveBoxSubboxId.s085_t4_sb019,
      PositiveBoxSubboxId.s085_t4_sb020,
      PositiveBoxSubboxId.s085_t4_sb021,
      PositiveBoxSubboxId.s085_t4_sb022,
      PositiveBoxSubboxId.s085_t4_sb023,
      PositiveBoxSubboxId.s085_t4_sb024,
      PositiveBoxSubboxId.s085_t4_sb025,
      PositiveBoxSubboxId.s085_t4_sb026,
      PositiveBoxSubboxId.s085_t4_sb027,
      PositiveBoxSubboxId.s085_t4_sb028,
      PositiveBoxSubboxId.s085_t4_sb029,
      PositiveBoxSubboxId.s085_t4_sb030,
      PositiveBoxSubboxId.s085_t4_sb031
    ].toFinset
  | .s085_t5 =>
    [
      PositiveBoxSubboxId.s085_t5_sb000,
      PositiveBoxSubboxId.s085_t5_sb001,
      PositiveBoxSubboxId.s085_t5_sb002,
      PositiveBoxSubboxId.s085_t5_sb003,
      PositiveBoxSubboxId.s085_t5_sb004,
      PositiveBoxSubboxId.s085_t5_sb005,
      PositiveBoxSubboxId.s085_t5_sb006,
      PositiveBoxSubboxId.s085_t5_sb007,
      PositiveBoxSubboxId.s085_t5_sb008,
      PositiveBoxSubboxId.s085_t5_sb009,
      PositiveBoxSubboxId.s085_t5_sb010,
      PositiveBoxSubboxId.s085_t5_sb011,
      PositiveBoxSubboxId.s085_t5_sb012,
      PositiveBoxSubboxId.s085_t5_sb013,
      PositiveBoxSubboxId.s085_t5_sb014,
      PositiveBoxSubboxId.s085_t5_sb015,
      PositiveBoxSubboxId.s085_t5_sb016,
      PositiveBoxSubboxId.s085_t5_sb017,
      PositiveBoxSubboxId.s085_t5_sb018,
      PositiveBoxSubboxId.s085_t5_sb019,
      PositiveBoxSubboxId.s085_t5_sb020,
      PositiveBoxSubboxId.s085_t5_sb021,
      PositiveBoxSubboxId.s085_t5_sb022,
      PositiveBoxSubboxId.s085_t5_sb023,
      PositiveBoxSubboxId.s085_t5_sb024,
      PositiveBoxSubboxId.s085_t5_sb025,
      PositiveBoxSubboxId.s085_t5_sb026,
      PositiveBoxSubboxId.s085_t5_sb027,
      PositiveBoxSubboxId.s085_t5_sb028,
      PositiveBoxSubboxId.s085_t5_sb029,
      PositiveBoxSubboxId.s085_t5_sb030,
      PositiveBoxSubboxId.s085_t5_sb031
    ].toFinset
  | .s085_t6 =>
    [
      PositiveBoxSubboxId.s085_t6_sb000,
      PositiveBoxSubboxId.s085_t6_sb001,
      PositiveBoxSubboxId.s085_t6_sb002,
      PositiveBoxSubboxId.s085_t6_sb003,
      PositiveBoxSubboxId.s085_t6_sb004,
      PositiveBoxSubboxId.s085_t6_sb005,
      PositiveBoxSubboxId.s085_t6_sb006,
      PositiveBoxSubboxId.s085_t6_sb007,
      PositiveBoxSubboxId.s085_t6_sb008,
      PositiveBoxSubboxId.s085_t6_sb009,
      PositiveBoxSubboxId.s085_t6_sb010,
      PositiveBoxSubboxId.s085_t6_sb011,
      PositiveBoxSubboxId.s085_t6_sb012,
      PositiveBoxSubboxId.s085_t6_sb013,
      PositiveBoxSubboxId.s085_t6_sb014,
      PositiveBoxSubboxId.s085_t6_sb015,
      PositiveBoxSubboxId.s085_t6_sb016,
      PositiveBoxSubboxId.s085_t6_sb017,
      PositiveBoxSubboxId.s085_t6_sb018,
      PositiveBoxSubboxId.s085_t6_sb019,
      PositiveBoxSubboxId.s085_t6_sb020,
      PositiveBoxSubboxId.s085_t6_sb021,
      PositiveBoxSubboxId.s085_t6_sb022,
      PositiveBoxSubboxId.s085_t6_sb023,
      PositiveBoxSubboxId.s085_t6_sb024,
      PositiveBoxSubboxId.s085_t6_sb025,
      PositiveBoxSubboxId.s085_t6_sb026,
      PositiveBoxSubboxId.s085_t6_sb027,
      PositiveBoxSubboxId.s085_t6_sb028,
      PositiveBoxSubboxId.s085_t6_sb029,
      PositiveBoxSubboxId.s085_t6_sb030,
      PositiveBoxSubboxId.s085_t6_sb031
    ].toFinset
  | .s085_t7 =>
    [
      PositiveBoxSubboxId.s085_t7_sb000,
      PositiveBoxSubboxId.s085_t7_sb001,
      PositiveBoxSubboxId.s085_t7_sb002,
      PositiveBoxSubboxId.s085_t7_sb003,
      PositiveBoxSubboxId.s085_t7_sb004,
      PositiveBoxSubboxId.s085_t7_sb005,
      PositiveBoxSubboxId.s085_t7_sb006,
      PositiveBoxSubboxId.s085_t7_sb007,
      PositiveBoxSubboxId.s085_t7_sb008,
      PositiveBoxSubboxId.s085_t7_sb009,
      PositiveBoxSubboxId.s085_t7_sb010,
      PositiveBoxSubboxId.s085_t7_sb011,
      PositiveBoxSubboxId.s085_t7_sb012,
      PositiveBoxSubboxId.s085_t7_sb013,
      PositiveBoxSubboxId.s085_t7_sb014,
      PositiveBoxSubboxId.s085_t7_sb015,
      PositiveBoxSubboxId.s085_t7_sb016,
      PositiveBoxSubboxId.s085_t7_sb017,
      PositiveBoxSubboxId.s085_t7_sb018,
      PositiveBoxSubboxId.s085_t7_sb019,
      PositiveBoxSubboxId.s085_t7_sb020,
      PositiveBoxSubboxId.s085_t7_sb021,
      PositiveBoxSubboxId.s085_t7_sb022,
      PositiveBoxSubboxId.s085_t7_sb023,
      PositiveBoxSubboxId.s085_t7_sb024,
      PositiveBoxSubboxId.s085_t7_sb025,
      PositiveBoxSubboxId.s085_t7_sb026,
      PositiveBoxSubboxId.s085_t7_sb027,
      PositiveBoxSubboxId.s085_t7_sb028,
      PositiveBoxSubboxId.s085_t7_sb029,
      PositiveBoxSubboxId.s085_t7_sb030,
      PositiveBoxSubboxId.s085_t7_sb031
    ].toFinset
  | .s085_t8 =>
    [
      PositiveBoxSubboxId.s085_t8_sb000
    ].toFinset
  | .s086_t0 =>
    [
      PositiveBoxSubboxId.s086_t0_sb000,
      PositiveBoxSubboxId.s086_t0_sb001,
      PositiveBoxSubboxId.s086_t0_sb002,
      PositiveBoxSubboxId.s086_t0_sb003,
      PositiveBoxSubboxId.s086_t0_sb004,
      PositiveBoxSubboxId.s086_t0_sb005,
      PositiveBoxSubboxId.s086_t0_sb006,
      PositiveBoxSubboxId.s086_t0_sb007,
      PositiveBoxSubboxId.s086_t0_sb008,
      PositiveBoxSubboxId.s086_t0_sb009,
      PositiveBoxSubboxId.s086_t0_sb010,
      PositiveBoxSubboxId.s086_t0_sb011,
      PositiveBoxSubboxId.s086_t0_sb012,
      PositiveBoxSubboxId.s086_t0_sb013,
      PositiveBoxSubboxId.s086_t0_sb014,
      PositiveBoxSubboxId.s086_t0_sb015,
      PositiveBoxSubboxId.s086_t0_sb016,
      PositiveBoxSubboxId.s086_t0_sb017,
      PositiveBoxSubboxId.s086_t0_sb018,
      PositiveBoxSubboxId.s086_t0_sb019,
      PositiveBoxSubboxId.s086_t0_sb020,
      PositiveBoxSubboxId.s086_t0_sb021,
      PositiveBoxSubboxId.s086_t0_sb022,
      PositiveBoxSubboxId.s086_t0_sb023,
      PositiveBoxSubboxId.s086_t0_sb024,
      PositiveBoxSubboxId.s086_t0_sb025,
      PositiveBoxSubboxId.s086_t0_sb026,
      PositiveBoxSubboxId.s086_t0_sb027,
      PositiveBoxSubboxId.s086_t0_sb028,
      PositiveBoxSubboxId.s086_t0_sb029,
      PositiveBoxSubboxId.s086_t0_sb030,
      PositiveBoxSubboxId.s086_t0_sb031
    ].toFinset
  | .s086_t1 =>
    [
      PositiveBoxSubboxId.s086_t1_sb000,
      PositiveBoxSubboxId.s086_t1_sb001,
      PositiveBoxSubboxId.s086_t1_sb002,
      PositiveBoxSubboxId.s086_t1_sb003,
      PositiveBoxSubboxId.s086_t1_sb004,
      PositiveBoxSubboxId.s086_t1_sb005,
      PositiveBoxSubboxId.s086_t1_sb006,
      PositiveBoxSubboxId.s086_t1_sb007,
      PositiveBoxSubboxId.s086_t1_sb008,
      PositiveBoxSubboxId.s086_t1_sb009,
      PositiveBoxSubboxId.s086_t1_sb010,
      PositiveBoxSubboxId.s086_t1_sb011,
      PositiveBoxSubboxId.s086_t1_sb012,
      PositiveBoxSubboxId.s086_t1_sb013,
      PositiveBoxSubboxId.s086_t1_sb014,
      PositiveBoxSubboxId.s086_t1_sb015,
      PositiveBoxSubboxId.s086_t1_sb016,
      PositiveBoxSubboxId.s086_t1_sb017,
      PositiveBoxSubboxId.s086_t1_sb018,
      PositiveBoxSubboxId.s086_t1_sb019,
      PositiveBoxSubboxId.s086_t1_sb020,
      PositiveBoxSubboxId.s086_t1_sb021,
      PositiveBoxSubboxId.s086_t1_sb022,
      PositiveBoxSubboxId.s086_t1_sb023,
      PositiveBoxSubboxId.s086_t1_sb024,
      PositiveBoxSubboxId.s086_t1_sb025,
      PositiveBoxSubboxId.s086_t1_sb026,
      PositiveBoxSubboxId.s086_t1_sb027,
      PositiveBoxSubboxId.s086_t1_sb028,
      PositiveBoxSubboxId.s086_t1_sb029,
      PositiveBoxSubboxId.s086_t1_sb030,
      PositiveBoxSubboxId.s086_t1_sb031
    ].toFinset
  | .s086_t2 =>
    [
      PositiveBoxSubboxId.s086_t2_sb000,
      PositiveBoxSubboxId.s086_t2_sb001,
      PositiveBoxSubboxId.s086_t2_sb002,
      PositiveBoxSubboxId.s086_t2_sb003,
      PositiveBoxSubboxId.s086_t2_sb004,
      PositiveBoxSubboxId.s086_t2_sb005,
      PositiveBoxSubboxId.s086_t2_sb006,
      PositiveBoxSubboxId.s086_t2_sb007,
      PositiveBoxSubboxId.s086_t2_sb008,
      PositiveBoxSubboxId.s086_t2_sb009,
      PositiveBoxSubboxId.s086_t2_sb010,
      PositiveBoxSubboxId.s086_t2_sb011,
      PositiveBoxSubboxId.s086_t2_sb012,
      PositiveBoxSubboxId.s086_t2_sb013,
      PositiveBoxSubboxId.s086_t2_sb014,
      PositiveBoxSubboxId.s086_t2_sb015,
      PositiveBoxSubboxId.s086_t2_sb016,
      PositiveBoxSubboxId.s086_t2_sb017,
      PositiveBoxSubboxId.s086_t2_sb018,
      PositiveBoxSubboxId.s086_t2_sb019,
      PositiveBoxSubboxId.s086_t2_sb020,
      PositiveBoxSubboxId.s086_t2_sb021,
      PositiveBoxSubboxId.s086_t2_sb022,
      PositiveBoxSubboxId.s086_t2_sb023,
      PositiveBoxSubboxId.s086_t2_sb024,
      PositiveBoxSubboxId.s086_t2_sb025,
      PositiveBoxSubboxId.s086_t2_sb026,
      PositiveBoxSubboxId.s086_t2_sb027,
      PositiveBoxSubboxId.s086_t2_sb028,
      PositiveBoxSubboxId.s086_t2_sb029,
      PositiveBoxSubboxId.s086_t2_sb030,
      PositiveBoxSubboxId.s086_t2_sb031
    ].toFinset
  | .s086_t3 =>
    [
      PositiveBoxSubboxId.s086_t3_sb000,
      PositiveBoxSubboxId.s086_t3_sb001,
      PositiveBoxSubboxId.s086_t3_sb002,
      PositiveBoxSubboxId.s086_t3_sb003,
      PositiveBoxSubboxId.s086_t3_sb004,
      PositiveBoxSubboxId.s086_t3_sb005,
      PositiveBoxSubboxId.s086_t3_sb006,
      PositiveBoxSubboxId.s086_t3_sb007,
      PositiveBoxSubboxId.s086_t3_sb008,
      PositiveBoxSubboxId.s086_t3_sb009,
      PositiveBoxSubboxId.s086_t3_sb010,
      PositiveBoxSubboxId.s086_t3_sb011,
      PositiveBoxSubboxId.s086_t3_sb012,
      PositiveBoxSubboxId.s086_t3_sb013,
      PositiveBoxSubboxId.s086_t3_sb014,
      PositiveBoxSubboxId.s086_t3_sb015,
      PositiveBoxSubboxId.s086_t3_sb016,
      PositiveBoxSubboxId.s086_t3_sb017,
      PositiveBoxSubboxId.s086_t3_sb018,
      PositiveBoxSubboxId.s086_t3_sb019,
      PositiveBoxSubboxId.s086_t3_sb020,
      PositiveBoxSubboxId.s086_t3_sb021,
      PositiveBoxSubboxId.s086_t3_sb022,
      PositiveBoxSubboxId.s086_t3_sb023,
      PositiveBoxSubboxId.s086_t3_sb024,
      PositiveBoxSubboxId.s086_t3_sb025,
      PositiveBoxSubboxId.s086_t3_sb026,
      PositiveBoxSubboxId.s086_t3_sb027,
      PositiveBoxSubboxId.s086_t3_sb028,
      PositiveBoxSubboxId.s086_t3_sb029,
      PositiveBoxSubboxId.s086_t3_sb030,
      PositiveBoxSubboxId.s086_t3_sb031
    ].toFinset
  | .s086_t4 =>
    [
      PositiveBoxSubboxId.s086_t4_sb000,
      PositiveBoxSubboxId.s086_t4_sb001,
      PositiveBoxSubboxId.s086_t4_sb002,
      PositiveBoxSubboxId.s086_t4_sb003,
      PositiveBoxSubboxId.s086_t4_sb004,
      PositiveBoxSubboxId.s086_t4_sb005,
      PositiveBoxSubboxId.s086_t4_sb006,
      PositiveBoxSubboxId.s086_t4_sb007,
      PositiveBoxSubboxId.s086_t4_sb008,
      PositiveBoxSubboxId.s086_t4_sb009,
      PositiveBoxSubboxId.s086_t4_sb010,
      PositiveBoxSubboxId.s086_t4_sb011,
      PositiveBoxSubboxId.s086_t4_sb012,
      PositiveBoxSubboxId.s086_t4_sb013,
      PositiveBoxSubboxId.s086_t4_sb014,
      PositiveBoxSubboxId.s086_t4_sb015,
      PositiveBoxSubboxId.s086_t4_sb016,
      PositiveBoxSubboxId.s086_t4_sb017,
      PositiveBoxSubboxId.s086_t4_sb018,
      PositiveBoxSubboxId.s086_t4_sb019,
      PositiveBoxSubboxId.s086_t4_sb020,
      PositiveBoxSubboxId.s086_t4_sb021,
      PositiveBoxSubboxId.s086_t4_sb022,
      PositiveBoxSubboxId.s086_t4_sb023,
      PositiveBoxSubboxId.s086_t4_sb024,
      PositiveBoxSubboxId.s086_t4_sb025,
      PositiveBoxSubboxId.s086_t4_sb026,
      PositiveBoxSubboxId.s086_t4_sb027,
      PositiveBoxSubboxId.s086_t4_sb028,
      PositiveBoxSubboxId.s086_t4_sb029,
      PositiveBoxSubboxId.s086_t4_sb030,
      PositiveBoxSubboxId.s086_t4_sb031
    ].toFinset
  | .s086_t5 =>
    [
      PositiveBoxSubboxId.s086_t5_sb000,
      PositiveBoxSubboxId.s086_t5_sb001,
      PositiveBoxSubboxId.s086_t5_sb002,
      PositiveBoxSubboxId.s086_t5_sb003,
      PositiveBoxSubboxId.s086_t5_sb004,
      PositiveBoxSubboxId.s086_t5_sb005,
      PositiveBoxSubboxId.s086_t5_sb006,
      PositiveBoxSubboxId.s086_t5_sb007,
      PositiveBoxSubboxId.s086_t5_sb008,
      PositiveBoxSubboxId.s086_t5_sb009,
      PositiveBoxSubboxId.s086_t5_sb010,
      PositiveBoxSubboxId.s086_t5_sb011,
      PositiveBoxSubboxId.s086_t5_sb012,
      PositiveBoxSubboxId.s086_t5_sb013,
      PositiveBoxSubboxId.s086_t5_sb014,
      PositiveBoxSubboxId.s086_t5_sb015,
      PositiveBoxSubboxId.s086_t5_sb016,
      PositiveBoxSubboxId.s086_t5_sb017,
      PositiveBoxSubboxId.s086_t5_sb018,
      PositiveBoxSubboxId.s086_t5_sb019,
      PositiveBoxSubboxId.s086_t5_sb020,
      PositiveBoxSubboxId.s086_t5_sb021,
      PositiveBoxSubboxId.s086_t5_sb022,
      PositiveBoxSubboxId.s086_t5_sb023,
      PositiveBoxSubboxId.s086_t5_sb024,
      PositiveBoxSubboxId.s086_t5_sb025,
      PositiveBoxSubboxId.s086_t5_sb026,
      PositiveBoxSubboxId.s086_t5_sb027,
      PositiveBoxSubboxId.s086_t5_sb028,
      PositiveBoxSubboxId.s086_t5_sb029,
      PositiveBoxSubboxId.s086_t5_sb030,
      PositiveBoxSubboxId.s086_t5_sb031
    ].toFinset
  | .s086_t6 =>
    [
      PositiveBoxSubboxId.s086_t6_sb000,
      PositiveBoxSubboxId.s086_t6_sb001,
      PositiveBoxSubboxId.s086_t6_sb002,
      PositiveBoxSubboxId.s086_t6_sb003,
      PositiveBoxSubboxId.s086_t6_sb004,
      PositiveBoxSubboxId.s086_t6_sb005,
      PositiveBoxSubboxId.s086_t6_sb006,
      PositiveBoxSubboxId.s086_t6_sb007,
      PositiveBoxSubboxId.s086_t6_sb008,
      PositiveBoxSubboxId.s086_t6_sb009,
      PositiveBoxSubboxId.s086_t6_sb010,
      PositiveBoxSubboxId.s086_t6_sb011,
      PositiveBoxSubboxId.s086_t6_sb012,
      PositiveBoxSubboxId.s086_t6_sb013,
      PositiveBoxSubboxId.s086_t6_sb014,
      PositiveBoxSubboxId.s086_t6_sb015,
      PositiveBoxSubboxId.s086_t6_sb016,
      PositiveBoxSubboxId.s086_t6_sb017,
      PositiveBoxSubboxId.s086_t6_sb018,
      PositiveBoxSubboxId.s086_t6_sb019,
      PositiveBoxSubboxId.s086_t6_sb020,
      PositiveBoxSubboxId.s086_t6_sb021,
      PositiveBoxSubboxId.s086_t6_sb022,
      PositiveBoxSubboxId.s086_t6_sb023,
      PositiveBoxSubboxId.s086_t6_sb024,
      PositiveBoxSubboxId.s086_t6_sb025,
      PositiveBoxSubboxId.s086_t6_sb026,
      PositiveBoxSubboxId.s086_t6_sb027,
      PositiveBoxSubboxId.s086_t6_sb028,
      PositiveBoxSubboxId.s086_t6_sb029,
      PositiveBoxSubboxId.s086_t6_sb030,
      PositiveBoxSubboxId.s086_t6_sb031
    ].toFinset
  | .s086_t7 =>
    [
      PositiveBoxSubboxId.s086_t7_sb000,
      PositiveBoxSubboxId.s086_t7_sb001,
      PositiveBoxSubboxId.s086_t7_sb002,
      PositiveBoxSubboxId.s086_t7_sb003,
      PositiveBoxSubboxId.s086_t7_sb004,
      PositiveBoxSubboxId.s086_t7_sb005,
      PositiveBoxSubboxId.s086_t7_sb006,
      PositiveBoxSubboxId.s086_t7_sb007,
      PositiveBoxSubboxId.s086_t7_sb008,
      PositiveBoxSubboxId.s086_t7_sb009,
      PositiveBoxSubboxId.s086_t7_sb010,
      PositiveBoxSubboxId.s086_t7_sb011,
      PositiveBoxSubboxId.s086_t7_sb012,
      PositiveBoxSubboxId.s086_t7_sb013,
      PositiveBoxSubboxId.s086_t7_sb014,
      PositiveBoxSubboxId.s086_t7_sb015,
      PositiveBoxSubboxId.s086_t7_sb016,
      PositiveBoxSubboxId.s086_t7_sb017,
      PositiveBoxSubboxId.s086_t7_sb018,
      PositiveBoxSubboxId.s086_t7_sb019,
      PositiveBoxSubboxId.s086_t7_sb020,
      PositiveBoxSubboxId.s086_t7_sb021,
      PositiveBoxSubboxId.s086_t7_sb022,
      PositiveBoxSubboxId.s086_t7_sb023,
      PositiveBoxSubboxId.s086_t7_sb024,
      PositiveBoxSubboxId.s086_t7_sb025,
      PositiveBoxSubboxId.s086_t7_sb026,
      PositiveBoxSubboxId.s086_t7_sb027,
      PositiveBoxSubboxId.s086_t7_sb028,
      PositiveBoxSubboxId.s086_t7_sb029,
      PositiveBoxSubboxId.s086_t7_sb030,
      PositiveBoxSubboxId.s086_t7_sb031
    ].toFinset
  | .s086_t8 =>
    [
      PositiveBoxSubboxId.s086_t8_sb000
    ].toFinset

def positiveBoxSubboxRect : PositiveBoxSubboxId → RectRegion
  | .s084_t0_sb000 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((1641 : ℚ) / 50)
      tMax := ((262561 : ℚ) / 8000) }
  | .s084_t0_sb001 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262561 : ℚ) / 8000)
      tMax := ((131281 : ℚ) / 4000) }
  | .s084_t0_sb002 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((131281 : ℚ) / 4000)
      tMax := ((262563 : ℚ) / 8000) }
  | .s084_t0_sb003 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262563 : ℚ) / 8000)
      tMax := ((65641 : ℚ) / 2000) }
  | .s084_t0_sb004 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((65641 : ℚ) / 2000)
      tMax := ((52513 : ℚ) / 1600) }
  | .s084_t0_sb005 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((52513 : ℚ) / 1600)
      tMax := ((131283 : ℚ) / 4000) }
  | .s084_t0_sb006 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((131283 : ℚ) / 4000)
      tMax := ((262567 : ℚ) / 8000) }
  | .s084_t0_sb007 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262567 : ℚ) / 8000)
      tMax := ((32821 : ℚ) / 1000) }
  | .s084_t0_sb008 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((32821 : ℚ) / 1000)
      tMax := ((262569 : ℚ) / 8000) }
  | .s084_t0_sb009 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262569 : ℚ) / 8000)
      tMax := ((26257 : ℚ) / 800) }
  | .s084_t0_sb010 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((26257 : ℚ) / 800)
      tMax := ((8205343749999999 : ℚ) / 250000000000000) }
  | .s084_t0_sb011 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((8205343749999999 : ℚ) / 250000000000000)
      tMax := ((65643 : ℚ) / 2000) }
  | .s084_t0_sb012 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((65643 : ℚ) / 2000)
      tMax := ((262573 : ℚ) / 8000) }
  | .s084_t0_sb013 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262573 : ℚ) / 8000)
      tMax := ((131287 : ℚ) / 4000) }
  | .s084_t0_sb014 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((131287 : ℚ) / 4000)
      tMax := ((10503 : ℚ) / 320) }
  | .s084_t0_sb015 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((10503 : ℚ) / 320)
      tMax := ((16411 : ℚ) / 500) }
  | .s084_t0_sb016 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((16411 : ℚ) / 500)
      tMax := ((262577 : ℚ) / 8000) }
  | .s084_t0_sb017 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262577 : ℚ) / 8000)
      tMax := ((131289 : ℚ) / 4000) }
  | .s084_t0_sb018 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((131289 : ℚ) / 4000)
      tMax := ((262579 : ℚ) / 8000) }
  | .s084_t0_sb019 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262579 : ℚ) / 8000)
      tMax := ((13129 : ℚ) / 400) }
  | .s084_t0_sb020 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((13129 : ℚ) / 400)
      tMax := ((262581 : ℚ) / 8000) }
  | .s084_t0_sb021 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262581 : ℚ) / 8000)
      tMax := ((131291 : ℚ) / 4000) }
  | .s084_t0_sb022 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((131291 : ℚ) / 4000)
      tMax := ((8205718749999999 : ℚ) / 250000000000000) }
  | .s084_t0_sb023 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((8205718749999999 : ℚ) / 250000000000000)
      tMax := ((32823 : ℚ) / 1000) }
  | .s084_t0_sb024 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((32823 : ℚ) / 1000)
      tMax := ((52517 : ℚ) / 1600) }
  | .s084_t0_sb025 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((52517 : ℚ) / 1600)
      tMax := ((131293 : ℚ) / 4000) }
  | .s084_t0_sb026 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((131293 : ℚ) / 4000)
      tMax := ((262587 : ℚ) / 8000) }
  | .s084_t0_sb027 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262587 : ℚ) / 8000)
      tMax := ((8205874999999999 : ℚ) / 250000000000000) }
  | .s084_t0_sb028 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((8205874999999999 : ℚ) / 250000000000000)
      tMax := ((262589 : ℚ) / 8000) }
  | .s084_t0_sb029 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262589 : ℚ) / 8000)
      tMax := ((26259 : ℚ) / 800) }
  | .s084_t0_sb030 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((26259 : ℚ) / 800)
      tMax := ((262591 : ℚ) / 8000) }
  | .s084_t0_sb031 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262591 : ℚ) / 8000)
      tMax := ((4103 : ℚ) / 125) }
  | .s084_t1_sb000 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((1313 : ℚ) / 40)
      tMax := ((262601 : ℚ) / 8000) }
  | .s084_t1_sb001 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262601 : ℚ) / 8000)
      tMax := ((8206312500000001 : ℚ) / 250000000000000) }
  | .s084_t1_sb002 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((8206312500000001 : ℚ) / 250000000000000)
      tMax := ((262603 : ℚ) / 8000) }
  | .s084_t1_sb003 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262603 : ℚ) / 8000)
      tMax := ((6565100000000001 : ℚ) / 200000000000000) }
  | .s084_t1_sb004 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((6565100000000001 : ℚ) / 200000000000000)
      tMax := ((52521 : ℚ) / 1600) }
  | .s084_t1_sb005 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((52521 : ℚ) / 1600)
      tMax := ((131303 : ℚ) / 4000) }
  | .s084_t1_sb006 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((131303 : ℚ) / 4000)
      tMax := ((262607 : ℚ) / 8000) }
  | .s084_t1_sb007 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262607 : ℚ) / 8000)
      tMax := ((16413 : ℚ) / 500) }
  | .s084_t1_sb008 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((16413 : ℚ) / 500)
      tMax := ((6565225000000001 : ℚ) / 200000000000000) }
  | .s084_t1_sb009 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((6565225000000001 : ℚ) / 200000000000000)
      tMax := ((26261 : ℚ) / 800) }
  | .s084_t1_sb010 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((26261 : ℚ) / 800)
      tMax := ((262611 : ℚ) / 8000) }
  | .s084_t1_sb011 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262611 : ℚ) / 8000)
      tMax := ((65653 : ℚ) / 2000) }
  | .s084_t1_sb012 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((65653 : ℚ) / 2000)
      tMax := ((262613 : ℚ) / 8000) }
  | .s084_t1_sb013 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262613 : ℚ) / 8000)
      tMax := ((8206687500000001 : ℚ) / 250000000000000) }
  | .s084_t1_sb014 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((8206687500000001 : ℚ) / 250000000000000)
      tMax := ((52523 : ℚ) / 1600) }
  | .s084_t1_sb015 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((52523 : ℚ) / 1600)
      tMax := ((32827 : ℚ) / 1000) }
  | .s084_t1_sb016 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((32827 : ℚ) / 1000)
      tMax := ((262617 : ℚ) / 8000) }
  | .s084_t1_sb017 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262617 : ℚ) / 8000)
      tMax := ((131309 : ℚ) / 4000) }
  | .s084_t1_sb018 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((131309 : ℚ) / 4000)
      tMax := ((262619 : ℚ) / 8000) }
  | .s084_t1_sb019 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262619 : ℚ) / 8000)
      tMax := ((13131 : ℚ) / 400) }
  | .s084_t1_sb020 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((13131 : ℚ) / 400)
      tMax := ((6565525000000001 : ℚ) / 200000000000000) }
  | .s084_t1_sb021 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((6565525000000001 : ℚ) / 200000000000000)
      tMax := ((131311 : ℚ) / 4000) }
  | .s084_t1_sb022 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((131311 : ℚ) / 4000)
      tMax := ((262623 : ℚ) / 8000) }
  | .s084_t1_sb023 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262623 : ℚ) / 8000)
      tMax := ((8207 : ℚ) / 250) }
  | .s084_t1_sb024 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((8207 : ℚ) / 250)
      tMax := ((2101 : ℚ) / 64) }
  | .s084_t1_sb025 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((2101 : ℚ) / 64)
      tMax := ((8207062500000001 : ℚ) / 250000000000000) }
  | .s084_t1_sb026 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((8207062500000001 : ℚ) / 250000000000000)
      tMax := ((262627 : ℚ) / 8000) }
  | .s084_t1_sb027 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262627 : ℚ) / 8000)
      tMax := ((65657 : ℚ) / 2000) }
  | .s084_t1_sb028 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((65657 : ℚ) / 2000)
      tMax := ((262629 : ℚ) / 8000) }
  | .s084_t1_sb029 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262629 : ℚ) / 8000)
      tMax := ((26263 : ℚ) / 800) }
  | .s084_t1_sb030 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((26263 : ℚ) / 800)
      tMax := ((8207218750000001 : ℚ) / 250000000000000) }
  | .s084_t1_sb031 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((8207218750000001 : ℚ) / 250000000000000)
      tMax := ((32829 : ℚ) / 1000) }
  | .s084_t2_sb000 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((3283 : ℚ) / 100)
      tMax := ((6566024999999999 : ℚ) / 200000000000000) }
  | .s084_t2_sb001 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((6566024999999999 : ℚ) / 200000000000000)
      tMax := ((131321 : ℚ) / 4000) }
  | .s084_t2_sb002 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((131321 : ℚ) / 4000)
      tMax := ((262643 : ℚ) / 8000) }
  | .s084_t2_sb003 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262643 : ℚ) / 8000)
      tMax := ((65661 : ℚ) / 2000) }
  | .s084_t2_sb004 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((65661 : ℚ) / 2000)
      tMax := ((52529 : ℚ) / 1600) }
  | .s084_t2_sb005 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((52529 : ℚ) / 1600)
      tMax := ((131323 : ℚ) / 4000) }
  | .s084_t2_sb006 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((131323 : ℚ) / 4000)
      tMax := ((262647 : ℚ) / 8000) }
  | .s084_t2_sb007 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262647 : ℚ) / 8000)
      tMax := ((32831 : ℚ) / 1000) }
  | .s084_t2_sb008 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((32831 : ℚ) / 1000)
      tMax := ((262649 : ℚ) / 8000) }
  | .s084_t2_sb009 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262649 : ℚ) / 8000)
      tMax := ((5253 : ℚ) / 160) }
  | .s084_t2_sb010 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((5253 : ℚ) / 160)
      tMax := ((262651 : ℚ) / 8000) }
  | .s084_t2_sb011 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262651 : ℚ) / 8000)
      tMax := ((65663 : ℚ) / 2000) }
  | .s084_t2_sb012 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((65663 : ℚ) / 2000)
      tMax := ((262653 : ℚ) / 8000) }
  | .s084_t2_sb013 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262653 : ℚ) / 8000)
      tMax := ((131327 : ℚ) / 4000) }
  | .s084_t2_sb014 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((131327 : ℚ) / 4000)
      tMax := ((8207968750000001 : ℚ) / 250000000000000) }
  | .s084_t2_sb015 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((8207968750000001 : ℚ) / 250000000000000)
      tMax := ((4104 : ℚ) / 125) }
  | .s084_t2_sb016 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((4104 : ℚ) / 125)
      tMax := ((262657 : ℚ) / 8000) }
  | .s084_t2_sb017 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262657 : ℚ) / 8000)
      tMax := ((131329 : ℚ) / 4000) }
  | .s084_t2_sb018 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((131329 : ℚ) / 4000)
      tMax := ((262659 : ℚ) / 8000) }
  | .s084_t2_sb019 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262659 : ℚ) / 8000)
      tMax := ((13133 : ℚ) / 400) }
  | .s084_t2_sb020 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((13133 : ℚ) / 400)
      tMax := ((262661 : ℚ) / 8000) }
  | .s084_t2_sb021 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262661 : ℚ) / 8000)
      tMax := ((8208187500000001 : ℚ) / 250000000000000) }
  | .s084_t2_sb022 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((8208187500000001 : ℚ) / 250000000000000)
      tMax := ((262663 : ℚ) / 8000) }
  | .s084_t2_sb023 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262663 : ℚ) / 8000)
      tMax := ((32833 : ℚ) / 1000) }
  | .s084_t2_sb024 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((32833 : ℚ) / 1000)
      tMax := ((52533 : ℚ) / 1600) }
  | .s084_t2_sb025 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((52533 : ℚ) / 1600)
      tMax := ((131333 : ℚ) / 4000) }
  | .s084_t2_sb026 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((131333 : ℚ) / 4000)
      tMax := ((8208343750000001 : ℚ) / 250000000000000) }
  | .s084_t2_sb027 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((8208343750000001 : ℚ) / 250000000000000)
      tMax := ((65667 : ℚ) / 2000) }
  | .s084_t2_sb028 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((65667 : ℚ) / 2000)
      tMax := ((6566725000000001 : ℚ) / 200000000000000) }
  | .s084_t2_sb029 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((6566725000000001 : ℚ) / 200000000000000)
      tMax := ((26267 : ℚ) / 800) }
  | .s084_t2_sb030 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((26267 : ℚ) / 800)
      tMax := ((16416937500000003 : ℚ) / 500000000000000) }
  | .s084_t2_sb031 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((16416937500000003 : ℚ) / 500000000000000)
      tMax := ((16417 : ℚ) / 500) }
  | .s084_t3_sb000 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((6567 : ℚ) / 200)
      tMax := ((262681 : ℚ) / 8000) }
  | .s084_t3_sb001 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262681 : ℚ) / 8000)
      tMax := ((131341 : ℚ) / 4000) }
  | .s084_t3_sb002 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((131341 : ℚ) / 4000)
      tMax := ((262683 : ℚ) / 8000) }
  | .s084_t3_sb003 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262683 : ℚ) / 8000)
      tMax := ((65671 : ℚ) / 2000) }
  | .s084_t3_sb004 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((65671 : ℚ) / 2000)
      tMax := ((52537 : ℚ) / 1600) }
  | .s084_t3_sb005 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((52537 : ℚ) / 1600)
      tMax := ((131343 : ℚ) / 4000) }
  | .s084_t3_sb006 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((131343 : ℚ) / 4000)
      tMax := ((262687 : ℚ) / 8000) }
  | .s084_t3_sb007 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262687 : ℚ) / 8000)
      tMax := ((8209 : ℚ) / 250) }
  | .s084_t3_sb008 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((8209 : ℚ) / 250)
      tMax := ((262689 : ℚ) / 8000) }
  | .s084_t3_sb009 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262689 : ℚ) / 8000)
      tMax := ((26269 : ℚ) / 800) }
  | .s084_t3_sb010 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((26269 : ℚ) / 800)
      tMax := ((262691 : ℚ) / 8000) }
  | .s084_t3_sb011 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262691 : ℚ) / 8000)
      tMax := ((65673 : ℚ) / 2000) }
  | .s084_t3_sb012 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((65673 : ℚ) / 2000)
      tMax := ((262693 : ℚ) / 8000) }
  | .s084_t3_sb013 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262693 : ℚ) / 8000)
      tMax := ((131347 : ℚ) / 4000) }
  | .s084_t3_sb014 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((131347 : ℚ) / 4000)
      tMax := ((52539 : ℚ) / 1600) }
  | .s084_t3_sb015 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((52539 : ℚ) / 1600)
      tMax := ((32837 : ℚ) / 1000) }
  | .s084_t3_sb016 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((32837 : ℚ) / 1000)
      tMax := ((262697 : ℚ) / 8000) }
  | .s084_t3_sb017 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262697 : ℚ) / 8000)
      tMax := ((131349 : ℚ) / 4000) }
  | .s084_t3_sb018 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((131349 : ℚ) / 4000)
      tMax := ((262699 : ℚ) / 8000) }
  | .s084_t3_sb019 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262699 : ℚ) / 8000)
      tMax := ((2627 : ℚ) / 80) }
  | .s084_t3_sb020 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((2627 : ℚ) / 80)
      tMax := ((262701 : ℚ) / 8000) }
  | .s084_t3_sb021 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262701 : ℚ) / 8000)
      tMax := ((131351 : ℚ) / 4000) }
  | .s084_t3_sb022 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((131351 : ℚ) / 4000)
      tMax := ((262703 : ℚ) / 8000) }
  | .s084_t3_sb023 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262703 : ℚ) / 8000)
      tMax := ((16419 : ℚ) / 500) }
  | .s084_t3_sb024 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((16419 : ℚ) / 500)
      tMax := ((52541 : ℚ) / 1600) }
  | .s084_t3_sb025 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((52541 : ℚ) / 1600)
      tMax := ((131353 : ℚ) / 4000) }
  | .s084_t3_sb026 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((131353 : ℚ) / 4000)
      tMax := ((262707 : ℚ) / 8000) }
  | .s084_t3_sb027 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262707 : ℚ) / 8000)
      tMax := ((8209624999999999 : ℚ) / 250000000000000) }
  | .s084_t3_sb028 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((8209624999999999 : ℚ) / 250000000000000)
      tMax := ((262709 : ℚ) / 8000) }
  | .s084_t3_sb029 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262709 : ℚ) / 8000)
      tMax := ((26271 : ℚ) / 800) }
  | .s084_t3_sb030 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((26271 : ℚ) / 800)
      tMax := ((262711 : ℚ) / 8000) }
  | .s084_t3_sb031 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262711 : ℚ) / 8000)
      tMax := ((32839 : ℚ) / 1000) }
  | .s084_t4_sb000 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((821 : ℚ) / 25)
      tMax := ((262721 : ℚ) / 8000) }
  | .s084_t4_sb001 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262721 : ℚ) / 8000)
      tMax := ((6568050000000001 : ℚ) / 200000000000000) }
  | .s084_t4_sb002 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((6568050000000001 : ℚ) / 200000000000000)
      tMax := ((262723 : ℚ) / 8000) }
  | .s084_t4_sb003 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262723 : ℚ) / 8000)
      tMax := ((16420250000000003 : ℚ) / 500000000000000) }
  | .s084_t4_sb004 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((16420250000000003 : ℚ) / 500000000000000)
      tMax := ((10509 : ℚ) / 320) }
  | .s084_t4_sb005 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((10509 : ℚ) / 320)
      tMax := ((131363 : ℚ) / 4000) }
  | .s084_t4_sb006 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((131363 : ℚ) / 4000)
      tMax := ((8210218750000001 : ℚ) / 250000000000000) }
  | .s084_t4_sb007 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((8210218750000001 : ℚ) / 250000000000000)
      tMax := ((32841 : ℚ) / 1000) }
  | .s084_t4_sb008 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((32841 : ℚ) / 1000)
      tMax := ((6568225000000001 : ℚ) / 200000000000000) }
  | .s084_t4_sb009 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((6568225000000001 : ℚ) / 200000000000000)
      tMax := ((26273 : ℚ) / 800) }
  | .s084_t4_sb010 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((26273 : ℚ) / 800)
      tMax := ((262731 : ℚ) / 8000) }
  | .s084_t4_sb011 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262731 : ℚ) / 8000)
      tMax := ((65683 : ℚ) / 2000) }
  | .s084_t4_sb012 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((65683 : ℚ) / 2000)
      tMax := ((262733 : ℚ) / 8000) }
  | .s084_t4_sb013 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262733 : ℚ) / 8000)
      tMax := ((6568350000000001 : ℚ) / 200000000000000) }
  | .s084_t4_sb014 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((6568350000000001 : ℚ) / 200000000000000)
      tMax := ((52547 : ℚ) / 1600) }
  | .s084_t4_sb015 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((52547 : ℚ) / 1600)
      tMax := ((16421 : ℚ) / 500) }
  | .s084_t4_sb016 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((16421 : ℚ) / 500)
      tMax := ((262737 : ℚ) / 8000) }
  | .s084_t4_sb017 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262737 : ℚ) / 8000)
      tMax := ((131369 : ℚ) / 4000) }
  | .s084_t4_sb018 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((131369 : ℚ) / 4000)
      tMax := ((8210593750000001 : ℚ) / 250000000000000) }
  | .s084_t4_sb019 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((8210593750000001 : ℚ) / 250000000000000)
      tMax := ((13137 : ℚ) / 400) }
  | .s084_t4_sb020 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((13137 : ℚ) / 400)
      tMax := ((6568525000000001 : ℚ) / 200000000000000) }
  | .s084_t4_sb021 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((6568525000000001 : ℚ) / 200000000000000)
      tMax := ((131371 : ℚ) / 4000) }
  | .s084_t4_sb022 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((131371 : ℚ) / 4000)
      tMax := ((262743 : ℚ) / 8000) }
  | .s084_t4_sb023 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262743 : ℚ) / 8000)
      tMax := ((32843 : ℚ) / 1000) }
  | .s084_t4_sb024 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((32843 : ℚ) / 1000)
      tMax := ((52549 : ℚ) / 1600) }
  | .s084_t4_sb025 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((52549 : ℚ) / 1600)
      tMax := ((6568650000000001 : ℚ) / 200000000000000) }
  | .s084_t4_sb026 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((6568650000000001 : ℚ) / 200000000000000)
      tMax := ((262747 : ℚ) / 8000) }
  | .s084_t4_sb027 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262747 : ℚ) / 8000)
      tMax := ((65687 : ℚ) / 2000) }
  | .s084_t4_sb028 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((65687 : ℚ) / 2000)
      tMax := ((262749 : ℚ) / 8000) }
  | .s084_t4_sb029 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262749 : ℚ) / 8000)
      tMax := ((1051 : ℚ) / 32) }
  | .s084_t4_sb030 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((1051 : ℚ) / 32)
      tMax := ((8210968750000001 : ℚ) / 250000000000000) }
  | .s084_t4_sb031 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((8210968750000001 : ℚ) / 250000000000000)
      tMax := ((8211 : ℚ) / 250) }
  | .s084_t5_sb000 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((6569 : ℚ) / 200)
      tMax := ((8211281249999999 : ℚ) / 250000000000000) }
  | .s084_t5_sb001 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((8211281249999999 : ℚ) / 250000000000000)
      tMax := ((131381 : ℚ) / 4000) }
  | .s084_t5_sb002 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((131381 : ℚ) / 4000)
      tMax := ((262763 : ℚ) / 8000) }
  | .s084_t5_sb003 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262763 : ℚ) / 8000)
      tMax := ((65691 : ℚ) / 2000) }
  | .s084_t5_sb004 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((65691 : ℚ) / 2000)
      tMax := ((52553 : ℚ) / 1600) }
  | .s084_t5_sb005 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((52553 : ℚ) / 1600)
      tMax := ((131383 : ℚ) / 4000) }
  | .s084_t5_sb006 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((131383 : ℚ) / 4000)
      tMax := ((262767 : ℚ) / 8000) }
  | .s084_t5_sb007 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262767 : ℚ) / 8000)
      tMax := ((8211500000000001 : ℚ) / 250000000000000) }
  | .s084_t5_sb008 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((8211500000000001 : ℚ) / 250000000000000)
      tMax := ((262769 : ℚ) / 8000) }
  | .s084_t5_sb009 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262769 : ℚ) / 8000)
      tMax := ((26277 : ℚ) / 800) }
  | .s084_t5_sb010 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((26277 : ℚ) / 800)
      tMax := ((262771 : ℚ) / 8000) }
  | .s084_t5_sb011 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262771 : ℚ) / 8000)
      tMax := ((65693 : ℚ) / 2000) }
  | .s084_t5_sb012 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((65693 : ℚ) / 2000)
      tMax := ((262773 : ℚ) / 8000) }
  | .s084_t5_sb013 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262773 : ℚ) / 8000)
      tMax := ((131387 : ℚ) / 4000) }
  | .s084_t5_sb014 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((131387 : ℚ) / 4000)
      tMax := ((8211718750000001 : ℚ) / 250000000000000) }
  | .s084_t5_sb015 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((8211718750000001 : ℚ) / 250000000000000)
      tMax := ((32847 : ℚ) / 1000) }
  | .s084_t5_sb016 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((32847 : ℚ) / 1000)
      tMax := ((262777 : ℚ) / 8000) }
  | .s084_t5_sb017 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262777 : ℚ) / 8000)
      tMax := ((131389 : ℚ) / 4000) }
  | .s084_t5_sb018 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((131389 : ℚ) / 4000)
      tMax := ((262779 : ℚ) / 8000) }
  | .s084_t5_sb019 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262779 : ℚ) / 8000)
      tMax := ((8211875000000001 : ℚ) / 250000000000000) }
  | .s084_t5_sb020 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((8211875000000001 : ℚ) / 250000000000000)
      tMax := ((262781 : ℚ) / 8000) }
  | .s084_t5_sb021 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262781 : ℚ) / 8000)
      tMax := ((6569550000000001 : ℚ) / 200000000000000) }
  | .s084_t5_sb022 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((6569550000000001 : ℚ) / 200000000000000)
      tMax := ((262783 : ℚ) / 8000) }
  | .s084_t5_sb023 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262783 : ℚ) / 8000)
      tMax := ((4106 : ℚ) / 125) }
  | .s084_t5_sb024 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((4106 : ℚ) / 125)
      tMax := ((52557 : ℚ) / 1600) }
  | .s084_t5_sb025 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((52557 : ℚ) / 1600)
      tMax := ((131393 : ℚ) / 4000) }
  | .s084_t5_sb026 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((131393 : ℚ) / 4000)
      tMax := ((8212093750000001 : ℚ) / 250000000000000) }
  | .s084_t5_sb027 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((8212093750000001 : ℚ) / 250000000000000)
      tMax := ((65697 : ℚ) / 2000) }
  | .s084_t5_sb028 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((65697 : ℚ) / 2000)
      tMax := ((16424312500000003 : ℚ) / 500000000000000) }
  | .s084_t5_sb029 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((16424312500000003 : ℚ) / 500000000000000)
      tMax := ((26279 : ℚ) / 800) }
  | .s084_t5_sb030 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((26279 : ℚ) / 800)
      tMax := ((3284887500000001 : ℚ) / 100000000000000) }
  | .s084_t5_sb031 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((3284887500000001 : ℚ) / 100000000000000)
      tMax := ((8212250000000001 : ℚ) / 250000000000000) }
  | .s084_t6_sb000 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((657 : ℚ) / 20)
      tMax := ((262801 : ℚ) / 8000) }
  | .s084_t6_sb001 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262801 : ℚ) / 8000)
      tMax := ((131401 : ℚ) / 4000) }
  | .s084_t6_sb002 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((131401 : ℚ) / 4000)
      tMax := ((262803 : ℚ) / 8000) }
  | .s084_t6_sb003 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262803 : ℚ) / 8000)
      tMax := ((8212625000000001 : ℚ) / 250000000000000) }
  | .s084_t6_sb004 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((8212625000000001 : ℚ) / 250000000000000)
      tMax := ((52561 : ℚ) / 1600) }
  | .s084_t6_sb005 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((52561 : ℚ) / 1600)
      tMax := ((131403 : ℚ) / 4000) }
  | .s084_t6_sb006 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((131403 : ℚ) / 4000)
      tMax := ((262807 : ℚ) / 8000) }
  | .s084_t6_sb007 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262807 : ℚ) / 8000)
      tMax := ((32851 : ℚ) / 1000) }
  | .s084_t6_sb008 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((32851 : ℚ) / 1000)
      tMax := ((262809 : ℚ) / 8000) }
  | .s084_t6_sb009 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262809 : ℚ) / 8000)
      tMax := ((26281 : ℚ) / 800) }
  | .s084_t6_sb010 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((26281 : ℚ) / 800)
      tMax := ((262811 : ℚ) / 8000) }
  | .s084_t6_sb011 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262811 : ℚ) / 8000)
      tMax := ((65703 : ℚ) / 2000) }
  | .s084_t6_sb012 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((65703 : ℚ) / 2000)
      tMax := ((262813 : ℚ) / 8000) }
  | .s084_t6_sb013 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262813 : ℚ) / 8000)
      tMax := ((131407 : ℚ) / 4000) }
  | .s084_t6_sb014 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((131407 : ℚ) / 4000)
      tMax := ((52563 : ℚ) / 1600) }
  | .s084_t6_sb015 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((52563 : ℚ) / 1600)
      tMax := ((8213000000000001 : ℚ) / 250000000000000) }
  | .s084_t6_sb016 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((8213000000000001 : ℚ) / 250000000000000)
      tMax := ((262817 : ℚ) / 8000) }
  | .s084_t6_sb017 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262817 : ℚ) / 8000)
      tMax := ((131409 : ℚ) / 4000) }
  | .s084_t6_sb018 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((131409 : ℚ) / 4000)
      tMax := ((262819 : ℚ) / 8000) }
  | .s084_t6_sb019 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262819 : ℚ) / 8000)
      tMax := ((13141 : ℚ) / 400) }
  | .s084_t6_sb020 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((13141 : ℚ) / 400)
      tMax := ((262821 : ℚ) / 8000) }
  | .s084_t6_sb021 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262821 : ℚ) / 8000)
      tMax := ((131411 : ℚ) / 4000) }
  | .s084_t6_sb022 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((131411 : ℚ) / 4000)
      tMax := ((262823 : ℚ) / 8000) }
  | .s084_t6_sb023 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262823 : ℚ) / 8000)
      tMax := ((32853 : ℚ) / 1000) }
  | .s084_t6_sb024 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((32853 : ℚ) / 1000)
      tMax := ((10513 : ℚ) / 320) }
  | .s084_t6_sb025 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((10513 : ℚ) / 320)
      tMax := ((131413 : ℚ) / 4000) }
  | .s084_t6_sb026 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((131413 : ℚ) / 4000)
      tMax := ((262827 : ℚ) / 8000) }
  | .s084_t6_sb027 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262827 : ℚ) / 8000)
      tMax := ((65707 : ℚ) / 2000) }
  | .s084_t6_sb028 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((65707 : ℚ) / 2000)
      tMax := ((262829 : ℚ) / 8000) }
  | .s084_t6_sb029 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262829 : ℚ) / 8000)
      tMax := ((26283 : ℚ) / 800) }
  | .s084_t6_sb030 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((26283 : ℚ) / 800)
      tMax := ((262831 : ℚ) / 8000) }
  | .s084_t6_sb031 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262831 : ℚ) / 8000)
      tMax := ((16427 : ℚ) / 500) }
  | .s084_t7_sb000 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((6571 : ℚ) / 200)
      tMax := ((16427562499999997 : ℚ) / 500000000000000) }
  | .s084_t7_sb001 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((16427562499999997 : ℚ) / 500000000000000)
      tMax := ((131421 : ℚ) / 4000) }
  | .s084_t7_sb002 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((131421 : ℚ) / 4000)
      tMax := ((6571074999999999 : ℚ) / 200000000000000) }
  | .s084_t7_sb003 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((6571074999999999 : ℚ) / 200000000000000)
      tMax := ((65711 : ℚ) / 2000) }
  | .s084_t7_sb004 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((65711 : ℚ) / 2000)
      tMax := ((8213906249999999 : ℚ) / 250000000000000) }
  | .s084_t7_sb005 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((8213906249999999 : ℚ) / 250000000000000)
      tMax := ((131423 : ℚ) / 4000) }
  | .s084_t7_sb006 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((131423 : ℚ) / 4000)
      tMax := ((262847 : ℚ) / 8000) }
  | .s084_t7_sb007 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262847 : ℚ) / 8000)
      tMax := ((6571199999999999 : ℚ) / 200000000000000) }
  | .s084_t7_sb008 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((6571199999999999 : ℚ) / 200000000000000)
      tMax := ((262849 : ℚ) / 8000) }
  | .s084_t7_sb009 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262849 : ℚ) / 8000)
      tMax := ((8214062499999999 : ℚ) / 250000000000000) }
  | .s084_t7_sb010 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((8214062499999999 : ℚ) / 250000000000000)
      tMax := ((262851 : ℚ) / 8000) }
  | .s084_t7_sb011 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262851 : ℚ) / 8000)
      tMax := ((65713 : ℚ) / 2000) }
  | .s084_t7_sb012 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((65713 : ℚ) / 2000)
      tMax := ((262853 : ℚ) / 8000) }
  | .s084_t7_sb013 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262853 : ℚ) / 8000)
      tMax := ((131427 : ℚ) / 4000) }
  | .s084_t7_sb014 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((131427 : ℚ) / 4000)
      tMax := ((52571 : ℚ) / 1600) }
  | .s084_t7_sb015 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((52571 : ℚ) / 1600)
      tMax := ((32857 : ℚ) / 1000) }
  | .s084_t7_sb016 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((32857 : ℚ) / 1000)
      tMax := ((8214281249999999 : ℚ) / 250000000000000) }
  | .s084_t7_sb017 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((8214281249999999 : ℚ) / 250000000000000)
      tMax := ((131429 : ℚ) / 4000) }
  | .s084_t7_sb018 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((131429 : ℚ) / 4000)
      tMax := ((262859 : ℚ) / 8000) }
  | .s084_t7_sb019 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262859 : ℚ) / 8000)
      tMax := ((13143 : ℚ) / 400) }
  | .s084_t7_sb020 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((13143 : ℚ) / 400)
      tMax := ((262861 : ℚ) / 8000) }
  | .s084_t7_sb021 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262861 : ℚ) / 8000)
      tMax := ((131431 : ℚ) / 4000) }
  | .s084_t7_sb022 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((131431 : ℚ) / 4000)
      tMax := ((262863 : ℚ) / 8000) }
  | .s084_t7_sb023 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262863 : ℚ) / 8000)
      tMax := ((8214500000000001 : ℚ) / 250000000000000) }
  | .s084_t7_sb024 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((8214500000000001 : ℚ) / 250000000000000)
      tMax := ((52573 : ℚ) / 1600) }
  | .s084_t7_sb025 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((52573 : ℚ) / 1600)
      tMax := ((131433 : ℚ) / 4000) }
  | .s084_t7_sb026 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((131433 : ℚ) / 4000)
      tMax := ((262867 : ℚ) / 8000) }
  | .s084_t7_sb027 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262867 : ℚ) / 8000)
      tMax := ((65717 : ℚ) / 2000) }
  | .s084_t7_sb028 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((65717 : ℚ) / 2000)
      tMax := ((262869 : ℚ) / 8000) }
  | .s084_t7_sb029 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((262869 : ℚ) / 8000)
      tMax := ((26287 : ℚ) / 800) }
  | .s084_t7_sb030 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((26287 : ℚ) / 800)
      tMax := ((6571775000000001 : ℚ) / 200000000000000) }
  | .s084_t7_sb031 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((6571775000000001 : ℚ) / 200000000000000)
      tMax := ((32859 : ℚ) / 1000) }
  | .s084_t8_sb000 =>
    { sigmaMin := ((21 : ℚ) / 25)
      sigmaMax := ((21 : ℚ) / 25)
      tMin := ((1643 : ℚ) / 50)
      tMax := ((1643 : ℚ) / 50) }
  | .s085_t0_sb000 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((1641 : ℚ) / 50)
      tMax := ((262561 : ℚ) / 8000) }
  | .s085_t0_sb001 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262561 : ℚ) / 8000)
      tMax := ((131281 : ℚ) / 4000) }
  | .s085_t0_sb002 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((131281 : ℚ) / 4000)
      tMax := ((262563 : ℚ) / 8000) }
  | .s085_t0_sb003 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262563 : ℚ) / 8000)
      tMax := ((65641 : ℚ) / 2000) }
  | .s085_t0_sb004 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((65641 : ℚ) / 2000)
      tMax := ((52513 : ℚ) / 1600) }
  | .s085_t0_sb005 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((52513 : ℚ) / 1600)
      tMax := ((131283 : ℚ) / 4000) }
  | .s085_t0_sb006 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((131283 : ℚ) / 4000)
      tMax := ((262567 : ℚ) / 8000) }
  | .s085_t0_sb007 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262567 : ℚ) / 8000)
      tMax := ((32821 : ℚ) / 1000) }
  | .s085_t0_sb008 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((32821 : ℚ) / 1000)
      tMax := ((262569 : ℚ) / 8000) }
  | .s085_t0_sb009 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262569 : ℚ) / 8000)
      tMax := ((26257 : ℚ) / 800) }
  | .s085_t0_sb010 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((26257 : ℚ) / 800)
      tMax := ((8205343749999999 : ℚ) / 250000000000000) }
  | .s085_t0_sb011 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((8205343749999999 : ℚ) / 250000000000000)
      tMax := ((65643 : ℚ) / 2000) }
  | .s085_t0_sb012 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((65643 : ℚ) / 2000)
      tMax := ((262573 : ℚ) / 8000) }
  | .s085_t0_sb013 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262573 : ℚ) / 8000)
      tMax := ((131287 : ℚ) / 4000) }
  | .s085_t0_sb014 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((131287 : ℚ) / 4000)
      tMax := ((10503 : ℚ) / 320) }
  | .s085_t0_sb015 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((10503 : ℚ) / 320)
      tMax := ((16411 : ℚ) / 500) }
  | .s085_t0_sb016 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((16411 : ℚ) / 500)
      tMax := ((262577 : ℚ) / 8000) }
  | .s085_t0_sb017 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262577 : ℚ) / 8000)
      tMax := ((131289 : ℚ) / 4000) }
  | .s085_t0_sb018 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((131289 : ℚ) / 4000)
      tMax := ((262579 : ℚ) / 8000) }
  | .s085_t0_sb019 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262579 : ℚ) / 8000)
      tMax := ((13129 : ℚ) / 400) }
  | .s085_t0_sb020 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((13129 : ℚ) / 400)
      tMax := ((262581 : ℚ) / 8000) }
  | .s085_t0_sb021 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262581 : ℚ) / 8000)
      tMax := ((131291 : ℚ) / 4000) }
  | .s085_t0_sb022 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((131291 : ℚ) / 4000)
      tMax := ((8205718749999999 : ℚ) / 250000000000000) }
  | .s085_t0_sb023 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((8205718749999999 : ℚ) / 250000000000000)
      tMax := ((32823 : ℚ) / 1000) }
  | .s085_t0_sb024 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((32823 : ℚ) / 1000)
      tMax := ((52517 : ℚ) / 1600) }
  | .s085_t0_sb025 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((52517 : ℚ) / 1600)
      tMax := ((131293 : ℚ) / 4000) }
  | .s085_t0_sb026 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((131293 : ℚ) / 4000)
      tMax := ((262587 : ℚ) / 8000) }
  | .s085_t0_sb027 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262587 : ℚ) / 8000)
      tMax := ((8205874999999999 : ℚ) / 250000000000000) }
  | .s085_t0_sb028 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((8205874999999999 : ℚ) / 250000000000000)
      tMax := ((262589 : ℚ) / 8000) }
  | .s085_t0_sb029 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262589 : ℚ) / 8000)
      tMax := ((26259 : ℚ) / 800) }
  | .s085_t0_sb030 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((26259 : ℚ) / 800)
      tMax := ((262591 : ℚ) / 8000) }
  | .s085_t0_sb031 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262591 : ℚ) / 8000)
      tMax := ((4103 : ℚ) / 125) }
  | .s085_t1_sb000 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((1313 : ℚ) / 40)
      tMax := ((262601 : ℚ) / 8000) }
  | .s085_t1_sb001 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262601 : ℚ) / 8000)
      tMax := ((8206312500000001 : ℚ) / 250000000000000) }
  | .s085_t1_sb002 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((8206312500000001 : ℚ) / 250000000000000)
      tMax := ((262603 : ℚ) / 8000) }
  | .s085_t1_sb003 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262603 : ℚ) / 8000)
      tMax := ((6565100000000001 : ℚ) / 200000000000000) }
  | .s085_t1_sb004 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((6565100000000001 : ℚ) / 200000000000000)
      tMax := ((52521 : ℚ) / 1600) }
  | .s085_t1_sb005 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((52521 : ℚ) / 1600)
      tMax := ((131303 : ℚ) / 4000) }
  | .s085_t1_sb006 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((131303 : ℚ) / 4000)
      tMax := ((262607 : ℚ) / 8000) }
  | .s085_t1_sb007 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262607 : ℚ) / 8000)
      tMax := ((16413 : ℚ) / 500) }
  | .s085_t1_sb008 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((16413 : ℚ) / 500)
      tMax := ((6565225000000001 : ℚ) / 200000000000000) }
  | .s085_t1_sb009 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((6565225000000001 : ℚ) / 200000000000000)
      tMax := ((26261 : ℚ) / 800) }
  | .s085_t1_sb010 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((26261 : ℚ) / 800)
      tMax := ((262611 : ℚ) / 8000) }
  | .s085_t1_sb011 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262611 : ℚ) / 8000)
      tMax := ((65653 : ℚ) / 2000) }
  | .s085_t1_sb012 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((65653 : ℚ) / 2000)
      tMax := ((262613 : ℚ) / 8000) }
  | .s085_t1_sb013 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262613 : ℚ) / 8000)
      tMax := ((8206687500000001 : ℚ) / 250000000000000) }
  | .s085_t1_sb014 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((8206687500000001 : ℚ) / 250000000000000)
      tMax := ((52523 : ℚ) / 1600) }
  | .s085_t1_sb015 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((52523 : ℚ) / 1600)
      tMax := ((32827 : ℚ) / 1000) }
  | .s085_t1_sb016 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((32827 : ℚ) / 1000)
      tMax := ((262617 : ℚ) / 8000) }
  | .s085_t1_sb017 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262617 : ℚ) / 8000)
      tMax := ((131309 : ℚ) / 4000) }
  | .s085_t1_sb018 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((131309 : ℚ) / 4000)
      tMax := ((262619 : ℚ) / 8000) }
  | .s085_t1_sb019 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262619 : ℚ) / 8000)
      tMax := ((13131 : ℚ) / 400) }
  | .s085_t1_sb020 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((13131 : ℚ) / 400)
      tMax := ((6565525000000001 : ℚ) / 200000000000000) }
  | .s085_t1_sb021 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((6565525000000001 : ℚ) / 200000000000000)
      tMax := ((131311 : ℚ) / 4000) }
  | .s085_t1_sb022 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((131311 : ℚ) / 4000)
      tMax := ((262623 : ℚ) / 8000) }
  | .s085_t1_sb023 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262623 : ℚ) / 8000)
      tMax := ((8207 : ℚ) / 250) }
  | .s085_t1_sb024 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((8207 : ℚ) / 250)
      tMax := ((2101 : ℚ) / 64) }
  | .s085_t1_sb025 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((2101 : ℚ) / 64)
      tMax := ((8207062500000001 : ℚ) / 250000000000000) }
  | .s085_t1_sb026 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((8207062500000001 : ℚ) / 250000000000000)
      tMax := ((262627 : ℚ) / 8000) }
  | .s085_t1_sb027 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262627 : ℚ) / 8000)
      tMax := ((65657 : ℚ) / 2000) }
  | .s085_t1_sb028 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((65657 : ℚ) / 2000)
      tMax := ((262629 : ℚ) / 8000) }
  | .s085_t1_sb029 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262629 : ℚ) / 8000)
      tMax := ((26263 : ℚ) / 800) }
  | .s085_t1_sb030 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((26263 : ℚ) / 800)
      tMax := ((8207218750000001 : ℚ) / 250000000000000) }
  | .s085_t1_sb031 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((8207218750000001 : ℚ) / 250000000000000)
      tMax := ((32829 : ℚ) / 1000) }
  | .s085_t2_sb000 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((3283 : ℚ) / 100)
      tMax := ((6566024999999999 : ℚ) / 200000000000000) }
  | .s085_t2_sb001 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((6566024999999999 : ℚ) / 200000000000000)
      tMax := ((131321 : ℚ) / 4000) }
  | .s085_t2_sb002 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((131321 : ℚ) / 4000)
      tMax := ((262643 : ℚ) / 8000) }
  | .s085_t2_sb003 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262643 : ℚ) / 8000)
      tMax := ((65661 : ℚ) / 2000) }
  | .s085_t2_sb004 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((65661 : ℚ) / 2000)
      tMax := ((52529 : ℚ) / 1600) }
  | .s085_t2_sb005 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((52529 : ℚ) / 1600)
      tMax := ((131323 : ℚ) / 4000) }
  | .s085_t2_sb006 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((131323 : ℚ) / 4000)
      tMax := ((262647 : ℚ) / 8000) }
  | .s085_t2_sb007 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262647 : ℚ) / 8000)
      tMax := ((32831 : ℚ) / 1000) }
  | .s085_t2_sb008 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((32831 : ℚ) / 1000)
      tMax := ((262649 : ℚ) / 8000) }
  | .s085_t2_sb009 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262649 : ℚ) / 8000)
      tMax := ((5253 : ℚ) / 160) }
  | .s085_t2_sb010 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((5253 : ℚ) / 160)
      tMax := ((262651 : ℚ) / 8000) }
  | .s085_t2_sb011 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262651 : ℚ) / 8000)
      tMax := ((65663 : ℚ) / 2000) }
  | .s085_t2_sb012 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((65663 : ℚ) / 2000)
      tMax := ((262653 : ℚ) / 8000) }
  | .s085_t2_sb013 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262653 : ℚ) / 8000)
      tMax := ((131327 : ℚ) / 4000) }
  | .s085_t2_sb014 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((131327 : ℚ) / 4000)
      tMax := ((8207968750000001 : ℚ) / 250000000000000) }
  | .s085_t2_sb015 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((8207968750000001 : ℚ) / 250000000000000)
      tMax := ((4104 : ℚ) / 125) }
  | .s085_t2_sb016 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((4104 : ℚ) / 125)
      tMax := ((262657 : ℚ) / 8000) }
  | .s085_t2_sb017 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262657 : ℚ) / 8000)
      tMax := ((131329 : ℚ) / 4000) }
  | .s085_t2_sb018 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((131329 : ℚ) / 4000)
      tMax := ((262659 : ℚ) / 8000) }
  | .s085_t2_sb019 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262659 : ℚ) / 8000)
      tMax := ((13133 : ℚ) / 400) }
  | .s085_t2_sb020 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((13133 : ℚ) / 400)
      tMax := ((262661 : ℚ) / 8000) }
  | .s085_t2_sb021 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262661 : ℚ) / 8000)
      tMax := ((8208187500000001 : ℚ) / 250000000000000) }
  | .s085_t2_sb022 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((8208187500000001 : ℚ) / 250000000000000)
      tMax := ((262663 : ℚ) / 8000) }
  | .s085_t2_sb023 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262663 : ℚ) / 8000)
      tMax := ((32833 : ℚ) / 1000) }
  | .s085_t2_sb024 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((32833 : ℚ) / 1000)
      tMax := ((52533 : ℚ) / 1600) }
  | .s085_t2_sb025 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((52533 : ℚ) / 1600)
      tMax := ((131333 : ℚ) / 4000) }
  | .s085_t2_sb026 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((131333 : ℚ) / 4000)
      tMax := ((8208343750000001 : ℚ) / 250000000000000) }
  | .s085_t2_sb027 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((8208343750000001 : ℚ) / 250000000000000)
      tMax := ((65667 : ℚ) / 2000) }
  | .s085_t2_sb028 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((65667 : ℚ) / 2000)
      tMax := ((6566725000000001 : ℚ) / 200000000000000) }
  | .s085_t2_sb029 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((6566725000000001 : ℚ) / 200000000000000)
      tMax := ((26267 : ℚ) / 800) }
  | .s085_t2_sb030 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((26267 : ℚ) / 800)
      tMax := ((16416937500000003 : ℚ) / 500000000000000) }
  | .s085_t2_sb031 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((16416937500000003 : ℚ) / 500000000000000)
      tMax := ((16417 : ℚ) / 500) }
  | .s085_t3_sb000 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((6567 : ℚ) / 200)
      tMax := ((262681 : ℚ) / 8000) }
  | .s085_t3_sb001 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262681 : ℚ) / 8000)
      tMax := ((131341 : ℚ) / 4000) }
  | .s085_t3_sb002 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((131341 : ℚ) / 4000)
      tMax := ((262683 : ℚ) / 8000) }
  | .s085_t3_sb003 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262683 : ℚ) / 8000)
      tMax := ((65671 : ℚ) / 2000) }
  | .s085_t3_sb004 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((65671 : ℚ) / 2000)
      tMax := ((52537 : ℚ) / 1600) }
  | .s085_t3_sb005 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((52537 : ℚ) / 1600)
      tMax := ((131343 : ℚ) / 4000) }
  | .s085_t3_sb006 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((131343 : ℚ) / 4000)
      tMax := ((262687 : ℚ) / 8000) }
  | .s085_t3_sb007 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262687 : ℚ) / 8000)
      tMax := ((8209 : ℚ) / 250) }
  | .s085_t3_sb008 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((8209 : ℚ) / 250)
      tMax := ((262689 : ℚ) / 8000) }
  | .s085_t3_sb009 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262689 : ℚ) / 8000)
      tMax := ((26269 : ℚ) / 800) }
  | .s085_t3_sb010 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((26269 : ℚ) / 800)
      tMax := ((262691 : ℚ) / 8000) }
  | .s085_t3_sb011 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262691 : ℚ) / 8000)
      tMax := ((65673 : ℚ) / 2000) }
  | .s085_t3_sb012 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((65673 : ℚ) / 2000)
      tMax := ((262693 : ℚ) / 8000) }
  | .s085_t3_sb013 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262693 : ℚ) / 8000)
      tMax := ((131347 : ℚ) / 4000) }
  | .s085_t3_sb014 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((131347 : ℚ) / 4000)
      tMax := ((52539 : ℚ) / 1600) }
  | .s085_t3_sb015 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((52539 : ℚ) / 1600)
      tMax := ((32837 : ℚ) / 1000) }
  | .s085_t3_sb016 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((32837 : ℚ) / 1000)
      tMax := ((262697 : ℚ) / 8000) }
  | .s085_t3_sb017 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262697 : ℚ) / 8000)
      tMax := ((131349 : ℚ) / 4000) }
  | .s085_t3_sb018 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((131349 : ℚ) / 4000)
      tMax := ((262699 : ℚ) / 8000) }
  | .s085_t3_sb019 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262699 : ℚ) / 8000)
      tMax := ((2627 : ℚ) / 80) }
  | .s085_t3_sb020 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((2627 : ℚ) / 80)
      tMax := ((262701 : ℚ) / 8000) }
  | .s085_t3_sb021 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262701 : ℚ) / 8000)
      tMax := ((131351 : ℚ) / 4000) }
  | .s085_t3_sb022 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((131351 : ℚ) / 4000)
      tMax := ((262703 : ℚ) / 8000) }
  | .s085_t3_sb023 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262703 : ℚ) / 8000)
      tMax := ((16419 : ℚ) / 500) }
  | .s085_t3_sb024 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((16419 : ℚ) / 500)
      tMax := ((52541 : ℚ) / 1600) }
  | .s085_t3_sb025 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((52541 : ℚ) / 1600)
      tMax := ((131353 : ℚ) / 4000) }
  | .s085_t3_sb026 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((131353 : ℚ) / 4000)
      tMax := ((262707 : ℚ) / 8000) }
  | .s085_t3_sb027 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262707 : ℚ) / 8000)
      tMax := ((8209624999999999 : ℚ) / 250000000000000) }
  | .s085_t3_sb028 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((8209624999999999 : ℚ) / 250000000000000)
      tMax := ((262709 : ℚ) / 8000) }
  | .s085_t3_sb029 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262709 : ℚ) / 8000)
      tMax := ((26271 : ℚ) / 800) }
  | .s085_t3_sb030 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((26271 : ℚ) / 800)
      tMax := ((262711 : ℚ) / 8000) }
  | .s085_t3_sb031 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262711 : ℚ) / 8000)
      tMax := ((32839 : ℚ) / 1000) }
  | .s085_t4_sb000 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((821 : ℚ) / 25)
      tMax := ((262721 : ℚ) / 8000) }
  | .s085_t4_sb001 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262721 : ℚ) / 8000)
      tMax := ((6568050000000001 : ℚ) / 200000000000000) }
  | .s085_t4_sb002 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((6568050000000001 : ℚ) / 200000000000000)
      tMax := ((262723 : ℚ) / 8000) }
  | .s085_t4_sb003 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262723 : ℚ) / 8000)
      tMax := ((16420250000000003 : ℚ) / 500000000000000) }
  | .s085_t4_sb004 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((16420250000000003 : ℚ) / 500000000000000)
      tMax := ((10509 : ℚ) / 320) }
  | .s085_t4_sb005 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((10509 : ℚ) / 320)
      tMax := ((131363 : ℚ) / 4000) }
  | .s085_t4_sb006 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((131363 : ℚ) / 4000)
      tMax := ((8210218750000001 : ℚ) / 250000000000000) }
  | .s085_t4_sb007 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((8210218750000001 : ℚ) / 250000000000000)
      tMax := ((32841 : ℚ) / 1000) }
  | .s085_t4_sb008 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((32841 : ℚ) / 1000)
      tMax := ((6568225000000001 : ℚ) / 200000000000000) }
  | .s085_t4_sb009 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((6568225000000001 : ℚ) / 200000000000000)
      tMax := ((26273 : ℚ) / 800) }
  | .s085_t4_sb010 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((26273 : ℚ) / 800)
      tMax := ((262731 : ℚ) / 8000) }
  | .s085_t4_sb011 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262731 : ℚ) / 8000)
      tMax := ((65683 : ℚ) / 2000) }
  | .s085_t4_sb012 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((65683 : ℚ) / 2000)
      tMax := ((262733 : ℚ) / 8000) }
  | .s085_t4_sb013 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262733 : ℚ) / 8000)
      tMax := ((6568350000000001 : ℚ) / 200000000000000) }
  | .s085_t4_sb014 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((6568350000000001 : ℚ) / 200000000000000)
      tMax := ((52547 : ℚ) / 1600) }
  | .s085_t4_sb015 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((52547 : ℚ) / 1600)
      tMax := ((16421 : ℚ) / 500) }
  | .s085_t4_sb016 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((16421 : ℚ) / 500)
      tMax := ((262737 : ℚ) / 8000) }
  | .s085_t4_sb017 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262737 : ℚ) / 8000)
      tMax := ((131369 : ℚ) / 4000) }
  | .s085_t4_sb018 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((131369 : ℚ) / 4000)
      tMax := ((8210593750000001 : ℚ) / 250000000000000) }
  | .s085_t4_sb019 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((8210593750000001 : ℚ) / 250000000000000)
      tMax := ((13137 : ℚ) / 400) }
  | .s085_t4_sb020 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((13137 : ℚ) / 400)
      tMax := ((6568525000000001 : ℚ) / 200000000000000) }
  | .s085_t4_sb021 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((6568525000000001 : ℚ) / 200000000000000)
      tMax := ((131371 : ℚ) / 4000) }
  | .s085_t4_sb022 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((131371 : ℚ) / 4000)
      tMax := ((262743 : ℚ) / 8000) }
  | .s085_t4_sb023 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262743 : ℚ) / 8000)
      tMax := ((32843 : ℚ) / 1000) }
  | .s085_t4_sb024 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((32843 : ℚ) / 1000)
      tMax := ((52549 : ℚ) / 1600) }
  | .s085_t4_sb025 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((52549 : ℚ) / 1600)
      tMax := ((6568650000000001 : ℚ) / 200000000000000) }
  | .s085_t4_sb026 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((6568650000000001 : ℚ) / 200000000000000)
      tMax := ((262747 : ℚ) / 8000) }
  | .s085_t4_sb027 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262747 : ℚ) / 8000)
      tMax := ((65687 : ℚ) / 2000) }
  | .s085_t4_sb028 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((65687 : ℚ) / 2000)
      tMax := ((262749 : ℚ) / 8000) }
  | .s085_t4_sb029 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262749 : ℚ) / 8000)
      tMax := ((1051 : ℚ) / 32) }
  | .s085_t4_sb030 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((1051 : ℚ) / 32)
      tMax := ((8210968750000001 : ℚ) / 250000000000000) }
  | .s085_t4_sb031 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((8210968750000001 : ℚ) / 250000000000000)
      tMax := ((8211 : ℚ) / 250) }
  | .s085_t5_sb000 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((6569 : ℚ) / 200)
      tMax := ((8211281249999999 : ℚ) / 250000000000000) }
  | .s085_t5_sb001 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((8211281249999999 : ℚ) / 250000000000000)
      tMax := ((131381 : ℚ) / 4000) }
  | .s085_t5_sb002 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((131381 : ℚ) / 4000)
      tMax := ((262763 : ℚ) / 8000) }
  | .s085_t5_sb003 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262763 : ℚ) / 8000)
      tMax := ((65691 : ℚ) / 2000) }
  | .s085_t5_sb004 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((65691 : ℚ) / 2000)
      tMax := ((52553 : ℚ) / 1600) }
  | .s085_t5_sb005 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((52553 : ℚ) / 1600)
      tMax := ((131383 : ℚ) / 4000) }
  | .s085_t5_sb006 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((131383 : ℚ) / 4000)
      tMax := ((262767 : ℚ) / 8000) }
  | .s085_t5_sb007 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262767 : ℚ) / 8000)
      tMax := ((8211500000000001 : ℚ) / 250000000000000) }
  | .s085_t5_sb008 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((8211500000000001 : ℚ) / 250000000000000)
      tMax := ((262769 : ℚ) / 8000) }
  | .s085_t5_sb009 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262769 : ℚ) / 8000)
      tMax := ((26277 : ℚ) / 800) }
  | .s085_t5_sb010 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((26277 : ℚ) / 800)
      tMax := ((262771 : ℚ) / 8000) }
  | .s085_t5_sb011 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262771 : ℚ) / 8000)
      tMax := ((65693 : ℚ) / 2000) }
  | .s085_t5_sb012 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((65693 : ℚ) / 2000)
      tMax := ((262773 : ℚ) / 8000) }
  | .s085_t5_sb013 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262773 : ℚ) / 8000)
      tMax := ((131387 : ℚ) / 4000) }
  | .s085_t5_sb014 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((131387 : ℚ) / 4000)
      tMax := ((8211718750000001 : ℚ) / 250000000000000) }
  | .s085_t5_sb015 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((8211718750000001 : ℚ) / 250000000000000)
      tMax := ((32847 : ℚ) / 1000) }
  | .s085_t5_sb016 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((32847 : ℚ) / 1000)
      tMax := ((262777 : ℚ) / 8000) }
  | .s085_t5_sb017 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262777 : ℚ) / 8000)
      tMax := ((131389 : ℚ) / 4000) }
  | .s085_t5_sb018 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((131389 : ℚ) / 4000)
      tMax := ((262779 : ℚ) / 8000) }
  | .s085_t5_sb019 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262779 : ℚ) / 8000)
      tMax := ((8211875000000001 : ℚ) / 250000000000000) }
  | .s085_t5_sb020 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((8211875000000001 : ℚ) / 250000000000000)
      tMax := ((262781 : ℚ) / 8000) }
  | .s085_t5_sb021 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262781 : ℚ) / 8000)
      tMax := ((6569550000000001 : ℚ) / 200000000000000) }
  | .s085_t5_sb022 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((6569550000000001 : ℚ) / 200000000000000)
      tMax := ((262783 : ℚ) / 8000) }
  | .s085_t5_sb023 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262783 : ℚ) / 8000)
      tMax := ((4106 : ℚ) / 125) }
  | .s085_t5_sb024 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((4106 : ℚ) / 125)
      tMax := ((52557 : ℚ) / 1600) }
  | .s085_t5_sb025 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((52557 : ℚ) / 1600)
      tMax := ((131393 : ℚ) / 4000) }
  | .s085_t5_sb026 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((131393 : ℚ) / 4000)
      tMax := ((8212093750000001 : ℚ) / 250000000000000) }
  | .s085_t5_sb027 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((8212093750000001 : ℚ) / 250000000000000)
      tMax := ((65697 : ℚ) / 2000) }
  | .s085_t5_sb028 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((65697 : ℚ) / 2000)
      tMax := ((16424312500000003 : ℚ) / 500000000000000) }
  | .s085_t5_sb029 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((16424312500000003 : ℚ) / 500000000000000)
      tMax := ((26279 : ℚ) / 800) }
  | .s085_t5_sb030 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((26279 : ℚ) / 800)
      tMax := ((3284887500000001 : ℚ) / 100000000000000) }
  | .s085_t5_sb031 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((3284887500000001 : ℚ) / 100000000000000)
      tMax := ((8212250000000001 : ℚ) / 250000000000000) }
  | .s085_t6_sb000 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((657 : ℚ) / 20)
      tMax := ((262801 : ℚ) / 8000) }
  | .s085_t6_sb001 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262801 : ℚ) / 8000)
      tMax := ((131401 : ℚ) / 4000) }
  | .s085_t6_sb002 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((131401 : ℚ) / 4000)
      tMax := ((262803 : ℚ) / 8000) }
  | .s085_t6_sb003 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262803 : ℚ) / 8000)
      tMax := ((8212625000000001 : ℚ) / 250000000000000) }
  | .s085_t6_sb004 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((8212625000000001 : ℚ) / 250000000000000)
      tMax := ((52561 : ℚ) / 1600) }
  | .s085_t6_sb005 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((52561 : ℚ) / 1600)
      tMax := ((131403 : ℚ) / 4000) }
  | .s085_t6_sb006 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((131403 : ℚ) / 4000)
      tMax := ((262807 : ℚ) / 8000) }
  | .s085_t6_sb007 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262807 : ℚ) / 8000)
      tMax := ((32851 : ℚ) / 1000) }
  | .s085_t6_sb008 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((32851 : ℚ) / 1000)
      tMax := ((262809 : ℚ) / 8000) }
  | .s085_t6_sb009 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262809 : ℚ) / 8000)
      tMax := ((26281 : ℚ) / 800) }
  | .s085_t6_sb010 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((26281 : ℚ) / 800)
      tMax := ((262811 : ℚ) / 8000) }
  | .s085_t6_sb011 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262811 : ℚ) / 8000)
      tMax := ((65703 : ℚ) / 2000) }
  | .s085_t6_sb012 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((65703 : ℚ) / 2000)
      tMax := ((262813 : ℚ) / 8000) }
  | .s085_t6_sb013 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262813 : ℚ) / 8000)
      tMax := ((131407 : ℚ) / 4000) }
  | .s085_t6_sb014 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((131407 : ℚ) / 4000)
      tMax := ((52563 : ℚ) / 1600) }
  | .s085_t6_sb015 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((52563 : ℚ) / 1600)
      tMax := ((8213000000000001 : ℚ) / 250000000000000) }
  | .s085_t6_sb016 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((8213000000000001 : ℚ) / 250000000000000)
      tMax := ((262817 : ℚ) / 8000) }
  | .s085_t6_sb017 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262817 : ℚ) / 8000)
      tMax := ((131409 : ℚ) / 4000) }
  | .s085_t6_sb018 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((131409 : ℚ) / 4000)
      tMax := ((262819 : ℚ) / 8000) }
  | .s085_t6_sb019 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262819 : ℚ) / 8000)
      tMax := ((13141 : ℚ) / 400) }
  | .s085_t6_sb020 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((13141 : ℚ) / 400)
      tMax := ((262821 : ℚ) / 8000) }
  | .s085_t6_sb021 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262821 : ℚ) / 8000)
      tMax := ((131411 : ℚ) / 4000) }
  | .s085_t6_sb022 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((131411 : ℚ) / 4000)
      tMax := ((262823 : ℚ) / 8000) }
  | .s085_t6_sb023 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262823 : ℚ) / 8000)
      tMax := ((32853 : ℚ) / 1000) }
  | .s085_t6_sb024 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((32853 : ℚ) / 1000)
      tMax := ((10513 : ℚ) / 320) }
  | .s085_t6_sb025 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((10513 : ℚ) / 320)
      tMax := ((131413 : ℚ) / 4000) }
  | .s085_t6_sb026 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((131413 : ℚ) / 4000)
      tMax := ((262827 : ℚ) / 8000) }
  | .s085_t6_sb027 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262827 : ℚ) / 8000)
      tMax := ((65707 : ℚ) / 2000) }
  | .s085_t6_sb028 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((65707 : ℚ) / 2000)
      tMax := ((262829 : ℚ) / 8000) }
  | .s085_t6_sb029 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262829 : ℚ) / 8000)
      tMax := ((26283 : ℚ) / 800) }
  | .s085_t6_sb030 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((26283 : ℚ) / 800)
      tMax := ((262831 : ℚ) / 8000) }
  | .s085_t6_sb031 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262831 : ℚ) / 8000)
      tMax := ((16427 : ℚ) / 500) }
  | .s085_t7_sb000 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((6571 : ℚ) / 200)
      tMax := ((16427562499999997 : ℚ) / 500000000000000) }
  | .s085_t7_sb001 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((16427562499999997 : ℚ) / 500000000000000)
      tMax := ((131421 : ℚ) / 4000) }
  | .s085_t7_sb002 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((131421 : ℚ) / 4000)
      tMax := ((6571074999999999 : ℚ) / 200000000000000) }
  | .s085_t7_sb003 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((6571074999999999 : ℚ) / 200000000000000)
      tMax := ((65711 : ℚ) / 2000) }
  | .s085_t7_sb004 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((65711 : ℚ) / 2000)
      tMax := ((8213906249999999 : ℚ) / 250000000000000) }
  | .s085_t7_sb005 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((8213906249999999 : ℚ) / 250000000000000)
      tMax := ((131423 : ℚ) / 4000) }
  | .s085_t7_sb006 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((131423 : ℚ) / 4000)
      tMax := ((262847 : ℚ) / 8000) }
  | .s085_t7_sb007 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262847 : ℚ) / 8000)
      tMax := ((6571199999999999 : ℚ) / 200000000000000) }
  | .s085_t7_sb008 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((6571199999999999 : ℚ) / 200000000000000)
      tMax := ((262849 : ℚ) / 8000) }
  | .s085_t7_sb009 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262849 : ℚ) / 8000)
      tMax := ((8214062499999999 : ℚ) / 250000000000000) }
  | .s085_t7_sb010 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((8214062499999999 : ℚ) / 250000000000000)
      tMax := ((262851 : ℚ) / 8000) }
  | .s085_t7_sb011 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262851 : ℚ) / 8000)
      tMax := ((65713 : ℚ) / 2000) }
  | .s085_t7_sb012 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((65713 : ℚ) / 2000)
      tMax := ((262853 : ℚ) / 8000) }
  | .s085_t7_sb013 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262853 : ℚ) / 8000)
      tMax := ((131427 : ℚ) / 4000) }
  | .s085_t7_sb014 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((131427 : ℚ) / 4000)
      tMax := ((52571 : ℚ) / 1600) }
  | .s085_t7_sb015 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((52571 : ℚ) / 1600)
      tMax := ((32857 : ℚ) / 1000) }
  | .s085_t7_sb016 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((32857 : ℚ) / 1000)
      tMax := ((8214281249999999 : ℚ) / 250000000000000) }
  | .s085_t7_sb017 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((8214281249999999 : ℚ) / 250000000000000)
      tMax := ((131429 : ℚ) / 4000) }
  | .s085_t7_sb018 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((131429 : ℚ) / 4000)
      tMax := ((262859 : ℚ) / 8000) }
  | .s085_t7_sb019 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262859 : ℚ) / 8000)
      tMax := ((13143 : ℚ) / 400) }
  | .s085_t7_sb020 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((13143 : ℚ) / 400)
      tMax := ((262861 : ℚ) / 8000) }
  | .s085_t7_sb021 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262861 : ℚ) / 8000)
      tMax := ((131431 : ℚ) / 4000) }
  | .s085_t7_sb022 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((131431 : ℚ) / 4000)
      tMax := ((262863 : ℚ) / 8000) }
  | .s085_t7_sb023 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262863 : ℚ) / 8000)
      tMax := ((8214500000000001 : ℚ) / 250000000000000) }
  | .s085_t7_sb024 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((8214500000000001 : ℚ) / 250000000000000)
      tMax := ((52573 : ℚ) / 1600) }
  | .s085_t7_sb025 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((52573 : ℚ) / 1600)
      tMax := ((131433 : ℚ) / 4000) }
  | .s085_t7_sb026 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((131433 : ℚ) / 4000)
      tMax := ((262867 : ℚ) / 8000) }
  | .s085_t7_sb027 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262867 : ℚ) / 8000)
      tMax := ((65717 : ℚ) / 2000) }
  | .s085_t7_sb028 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((65717 : ℚ) / 2000)
      tMax := ((262869 : ℚ) / 8000) }
  | .s085_t7_sb029 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((262869 : ℚ) / 8000)
      tMax := ((26287 : ℚ) / 800) }
  | .s085_t7_sb030 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((26287 : ℚ) / 800)
      tMax := ((6571775000000001 : ℚ) / 200000000000000) }
  | .s085_t7_sb031 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((6571775000000001 : ℚ) / 200000000000000)
      tMax := ((32859 : ℚ) / 1000) }
  | .s085_t8_sb000 =>
    { sigmaMin := ((17 : ℚ) / 20)
      sigmaMax := ((17 : ℚ) / 20)
      tMin := ((1643 : ℚ) / 50)
      tMax := ((1643 : ℚ) / 50) }
  | .s086_t0_sb000 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((1641 : ℚ) / 50)
      tMax := ((262561 : ℚ) / 8000) }
  | .s086_t0_sb001 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262561 : ℚ) / 8000)
      tMax := ((131281 : ℚ) / 4000) }
  | .s086_t0_sb002 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((131281 : ℚ) / 4000)
      tMax := ((262563 : ℚ) / 8000) }
  | .s086_t0_sb003 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262563 : ℚ) / 8000)
      tMax := ((65641 : ℚ) / 2000) }
  | .s086_t0_sb004 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((65641 : ℚ) / 2000)
      tMax := ((52513 : ℚ) / 1600) }
  | .s086_t0_sb005 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((52513 : ℚ) / 1600)
      tMax := ((131283 : ℚ) / 4000) }
  | .s086_t0_sb006 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((131283 : ℚ) / 4000)
      tMax := ((262567 : ℚ) / 8000) }
  | .s086_t0_sb007 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262567 : ℚ) / 8000)
      tMax := ((32821 : ℚ) / 1000) }
  | .s086_t0_sb008 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((32821 : ℚ) / 1000)
      tMax := ((262569 : ℚ) / 8000) }
  | .s086_t0_sb009 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262569 : ℚ) / 8000)
      tMax := ((26257 : ℚ) / 800) }
  | .s086_t0_sb010 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((26257 : ℚ) / 800)
      tMax := ((8205343749999999 : ℚ) / 250000000000000) }
  | .s086_t0_sb011 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((8205343749999999 : ℚ) / 250000000000000)
      tMax := ((65643 : ℚ) / 2000) }
  | .s086_t0_sb012 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((65643 : ℚ) / 2000)
      tMax := ((262573 : ℚ) / 8000) }
  | .s086_t0_sb013 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262573 : ℚ) / 8000)
      tMax := ((131287 : ℚ) / 4000) }
  | .s086_t0_sb014 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((131287 : ℚ) / 4000)
      tMax := ((10503 : ℚ) / 320) }
  | .s086_t0_sb015 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((10503 : ℚ) / 320)
      tMax := ((16411 : ℚ) / 500) }
  | .s086_t0_sb016 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((16411 : ℚ) / 500)
      tMax := ((262577 : ℚ) / 8000) }
  | .s086_t0_sb017 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262577 : ℚ) / 8000)
      tMax := ((131289 : ℚ) / 4000) }
  | .s086_t0_sb018 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((131289 : ℚ) / 4000)
      tMax := ((262579 : ℚ) / 8000) }
  | .s086_t0_sb019 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262579 : ℚ) / 8000)
      tMax := ((13129 : ℚ) / 400) }
  | .s086_t0_sb020 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((13129 : ℚ) / 400)
      tMax := ((262581 : ℚ) / 8000) }
  | .s086_t0_sb021 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262581 : ℚ) / 8000)
      tMax := ((131291 : ℚ) / 4000) }
  | .s086_t0_sb022 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((131291 : ℚ) / 4000)
      tMax := ((8205718749999999 : ℚ) / 250000000000000) }
  | .s086_t0_sb023 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((8205718749999999 : ℚ) / 250000000000000)
      tMax := ((32823 : ℚ) / 1000) }
  | .s086_t0_sb024 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((32823 : ℚ) / 1000)
      tMax := ((52517 : ℚ) / 1600) }
  | .s086_t0_sb025 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((52517 : ℚ) / 1600)
      tMax := ((131293 : ℚ) / 4000) }
  | .s086_t0_sb026 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((131293 : ℚ) / 4000)
      tMax := ((262587 : ℚ) / 8000) }
  | .s086_t0_sb027 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262587 : ℚ) / 8000)
      tMax := ((8205874999999999 : ℚ) / 250000000000000) }
  | .s086_t0_sb028 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((8205874999999999 : ℚ) / 250000000000000)
      tMax := ((262589 : ℚ) / 8000) }
  | .s086_t0_sb029 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262589 : ℚ) / 8000)
      tMax := ((26259 : ℚ) / 800) }
  | .s086_t0_sb030 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((26259 : ℚ) / 800)
      tMax := ((262591 : ℚ) / 8000) }
  | .s086_t0_sb031 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262591 : ℚ) / 8000)
      tMax := ((4103 : ℚ) / 125) }
  | .s086_t1_sb000 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((1313 : ℚ) / 40)
      tMax := ((262601 : ℚ) / 8000) }
  | .s086_t1_sb001 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262601 : ℚ) / 8000)
      tMax := ((8206312500000001 : ℚ) / 250000000000000) }
  | .s086_t1_sb002 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((8206312500000001 : ℚ) / 250000000000000)
      tMax := ((262603 : ℚ) / 8000) }
  | .s086_t1_sb003 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262603 : ℚ) / 8000)
      tMax := ((6565100000000001 : ℚ) / 200000000000000) }
  | .s086_t1_sb004 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((6565100000000001 : ℚ) / 200000000000000)
      tMax := ((52521 : ℚ) / 1600) }
  | .s086_t1_sb005 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((52521 : ℚ) / 1600)
      tMax := ((131303 : ℚ) / 4000) }
  | .s086_t1_sb006 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((131303 : ℚ) / 4000)
      tMax := ((262607 : ℚ) / 8000) }
  | .s086_t1_sb007 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262607 : ℚ) / 8000)
      tMax := ((16413 : ℚ) / 500) }
  | .s086_t1_sb008 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((16413 : ℚ) / 500)
      tMax := ((6565225000000001 : ℚ) / 200000000000000) }
  | .s086_t1_sb009 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((6565225000000001 : ℚ) / 200000000000000)
      tMax := ((26261 : ℚ) / 800) }
  | .s086_t1_sb010 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((26261 : ℚ) / 800)
      tMax := ((262611 : ℚ) / 8000) }
  | .s086_t1_sb011 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262611 : ℚ) / 8000)
      tMax := ((65653 : ℚ) / 2000) }
  | .s086_t1_sb012 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((65653 : ℚ) / 2000)
      tMax := ((262613 : ℚ) / 8000) }
  | .s086_t1_sb013 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262613 : ℚ) / 8000)
      tMax := ((8206687500000001 : ℚ) / 250000000000000) }
  | .s086_t1_sb014 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((8206687500000001 : ℚ) / 250000000000000)
      tMax := ((52523 : ℚ) / 1600) }
  | .s086_t1_sb015 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((52523 : ℚ) / 1600)
      tMax := ((32827 : ℚ) / 1000) }
  | .s086_t1_sb016 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((32827 : ℚ) / 1000)
      tMax := ((262617 : ℚ) / 8000) }
  | .s086_t1_sb017 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262617 : ℚ) / 8000)
      tMax := ((131309 : ℚ) / 4000) }
  | .s086_t1_sb018 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((131309 : ℚ) / 4000)
      tMax := ((262619 : ℚ) / 8000) }
  | .s086_t1_sb019 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262619 : ℚ) / 8000)
      tMax := ((13131 : ℚ) / 400) }
  | .s086_t1_sb020 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((13131 : ℚ) / 400)
      tMax := ((6565525000000001 : ℚ) / 200000000000000) }
  | .s086_t1_sb021 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((6565525000000001 : ℚ) / 200000000000000)
      tMax := ((131311 : ℚ) / 4000) }
  | .s086_t1_sb022 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((131311 : ℚ) / 4000)
      tMax := ((262623 : ℚ) / 8000) }
  | .s086_t1_sb023 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262623 : ℚ) / 8000)
      tMax := ((8207 : ℚ) / 250) }
  | .s086_t1_sb024 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((8207 : ℚ) / 250)
      tMax := ((2101 : ℚ) / 64) }
  | .s086_t1_sb025 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((2101 : ℚ) / 64)
      tMax := ((8207062500000001 : ℚ) / 250000000000000) }
  | .s086_t1_sb026 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((8207062500000001 : ℚ) / 250000000000000)
      tMax := ((262627 : ℚ) / 8000) }
  | .s086_t1_sb027 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262627 : ℚ) / 8000)
      tMax := ((65657 : ℚ) / 2000) }
  | .s086_t1_sb028 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((65657 : ℚ) / 2000)
      tMax := ((262629 : ℚ) / 8000) }
  | .s086_t1_sb029 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262629 : ℚ) / 8000)
      tMax := ((26263 : ℚ) / 800) }
  | .s086_t1_sb030 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((26263 : ℚ) / 800)
      tMax := ((8207218750000001 : ℚ) / 250000000000000) }
  | .s086_t1_sb031 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((8207218750000001 : ℚ) / 250000000000000)
      tMax := ((32829 : ℚ) / 1000) }
  | .s086_t2_sb000 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((3283 : ℚ) / 100)
      tMax := ((6566024999999999 : ℚ) / 200000000000000) }
  | .s086_t2_sb001 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((6566024999999999 : ℚ) / 200000000000000)
      tMax := ((131321 : ℚ) / 4000) }
  | .s086_t2_sb002 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((131321 : ℚ) / 4000)
      tMax := ((262643 : ℚ) / 8000) }
  | .s086_t2_sb003 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262643 : ℚ) / 8000)
      tMax := ((65661 : ℚ) / 2000) }
  | .s086_t2_sb004 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((65661 : ℚ) / 2000)
      tMax := ((52529 : ℚ) / 1600) }
  | .s086_t2_sb005 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((52529 : ℚ) / 1600)
      tMax := ((131323 : ℚ) / 4000) }
  | .s086_t2_sb006 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((131323 : ℚ) / 4000)
      tMax := ((262647 : ℚ) / 8000) }
  | .s086_t2_sb007 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262647 : ℚ) / 8000)
      tMax := ((32831 : ℚ) / 1000) }
  | .s086_t2_sb008 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((32831 : ℚ) / 1000)
      tMax := ((262649 : ℚ) / 8000) }
  | .s086_t2_sb009 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262649 : ℚ) / 8000)
      tMax := ((5253 : ℚ) / 160) }
  | .s086_t2_sb010 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((5253 : ℚ) / 160)
      tMax := ((262651 : ℚ) / 8000) }
  | .s086_t2_sb011 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262651 : ℚ) / 8000)
      tMax := ((65663 : ℚ) / 2000) }
  | .s086_t2_sb012 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((65663 : ℚ) / 2000)
      tMax := ((262653 : ℚ) / 8000) }
  | .s086_t2_sb013 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262653 : ℚ) / 8000)
      tMax := ((131327 : ℚ) / 4000) }
  | .s086_t2_sb014 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((131327 : ℚ) / 4000)
      tMax := ((8207968750000001 : ℚ) / 250000000000000) }
  | .s086_t2_sb015 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((8207968750000001 : ℚ) / 250000000000000)
      tMax := ((4104 : ℚ) / 125) }
  | .s086_t2_sb016 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((4104 : ℚ) / 125)
      tMax := ((262657 : ℚ) / 8000) }
  | .s086_t2_sb017 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262657 : ℚ) / 8000)
      tMax := ((131329 : ℚ) / 4000) }
  | .s086_t2_sb018 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((131329 : ℚ) / 4000)
      tMax := ((262659 : ℚ) / 8000) }
  | .s086_t2_sb019 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262659 : ℚ) / 8000)
      tMax := ((13133 : ℚ) / 400) }
  | .s086_t2_sb020 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((13133 : ℚ) / 400)
      tMax := ((262661 : ℚ) / 8000) }
  | .s086_t2_sb021 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262661 : ℚ) / 8000)
      tMax := ((8208187500000001 : ℚ) / 250000000000000) }
  | .s086_t2_sb022 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((8208187500000001 : ℚ) / 250000000000000)
      tMax := ((262663 : ℚ) / 8000) }
  | .s086_t2_sb023 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262663 : ℚ) / 8000)
      tMax := ((32833 : ℚ) / 1000) }
  | .s086_t2_sb024 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((32833 : ℚ) / 1000)
      tMax := ((52533 : ℚ) / 1600) }
  | .s086_t2_sb025 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((52533 : ℚ) / 1600)
      tMax := ((131333 : ℚ) / 4000) }
  | .s086_t2_sb026 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((131333 : ℚ) / 4000)
      tMax := ((8208343750000001 : ℚ) / 250000000000000) }
  | .s086_t2_sb027 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((8208343750000001 : ℚ) / 250000000000000)
      tMax := ((65667 : ℚ) / 2000) }
  | .s086_t2_sb028 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((65667 : ℚ) / 2000)
      tMax := ((6566725000000001 : ℚ) / 200000000000000) }
  | .s086_t2_sb029 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((6566725000000001 : ℚ) / 200000000000000)
      tMax := ((26267 : ℚ) / 800) }
  | .s086_t2_sb030 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((26267 : ℚ) / 800)
      tMax := ((16416937500000003 : ℚ) / 500000000000000) }
  | .s086_t2_sb031 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((16416937500000003 : ℚ) / 500000000000000)
      tMax := ((16417 : ℚ) / 500) }
  | .s086_t3_sb000 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((6567 : ℚ) / 200)
      tMax := ((262681 : ℚ) / 8000) }
  | .s086_t3_sb001 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262681 : ℚ) / 8000)
      tMax := ((131341 : ℚ) / 4000) }
  | .s086_t3_sb002 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((131341 : ℚ) / 4000)
      tMax := ((262683 : ℚ) / 8000) }
  | .s086_t3_sb003 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262683 : ℚ) / 8000)
      tMax := ((65671 : ℚ) / 2000) }
  | .s086_t3_sb004 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((65671 : ℚ) / 2000)
      tMax := ((52537 : ℚ) / 1600) }
  | .s086_t3_sb005 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((52537 : ℚ) / 1600)
      tMax := ((131343 : ℚ) / 4000) }
  | .s086_t3_sb006 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((131343 : ℚ) / 4000)
      tMax := ((262687 : ℚ) / 8000) }
  | .s086_t3_sb007 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262687 : ℚ) / 8000)
      tMax := ((8209 : ℚ) / 250) }
  | .s086_t3_sb008 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((8209 : ℚ) / 250)
      tMax := ((262689 : ℚ) / 8000) }
  | .s086_t3_sb009 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262689 : ℚ) / 8000)
      tMax := ((26269 : ℚ) / 800) }
  | .s086_t3_sb010 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((26269 : ℚ) / 800)
      tMax := ((262691 : ℚ) / 8000) }
  | .s086_t3_sb011 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262691 : ℚ) / 8000)
      tMax := ((65673 : ℚ) / 2000) }
  | .s086_t3_sb012 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((65673 : ℚ) / 2000)
      tMax := ((262693 : ℚ) / 8000) }
  | .s086_t3_sb013 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262693 : ℚ) / 8000)
      tMax := ((131347 : ℚ) / 4000) }
  | .s086_t3_sb014 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((131347 : ℚ) / 4000)
      tMax := ((52539 : ℚ) / 1600) }
  | .s086_t3_sb015 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((52539 : ℚ) / 1600)
      tMax := ((32837 : ℚ) / 1000) }
  | .s086_t3_sb016 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((32837 : ℚ) / 1000)
      tMax := ((262697 : ℚ) / 8000) }
  | .s086_t3_sb017 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262697 : ℚ) / 8000)
      tMax := ((131349 : ℚ) / 4000) }
  | .s086_t3_sb018 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((131349 : ℚ) / 4000)
      tMax := ((262699 : ℚ) / 8000) }
  | .s086_t3_sb019 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262699 : ℚ) / 8000)
      tMax := ((2627 : ℚ) / 80) }
  | .s086_t3_sb020 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((2627 : ℚ) / 80)
      tMax := ((262701 : ℚ) / 8000) }
  | .s086_t3_sb021 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262701 : ℚ) / 8000)
      tMax := ((131351 : ℚ) / 4000) }
  | .s086_t3_sb022 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((131351 : ℚ) / 4000)
      tMax := ((262703 : ℚ) / 8000) }
  | .s086_t3_sb023 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262703 : ℚ) / 8000)
      tMax := ((16419 : ℚ) / 500) }
  | .s086_t3_sb024 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((16419 : ℚ) / 500)
      tMax := ((52541 : ℚ) / 1600) }
  | .s086_t3_sb025 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((52541 : ℚ) / 1600)
      tMax := ((131353 : ℚ) / 4000) }
  | .s086_t3_sb026 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((131353 : ℚ) / 4000)
      tMax := ((262707 : ℚ) / 8000) }
  | .s086_t3_sb027 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262707 : ℚ) / 8000)
      tMax := ((8209624999999999 : ℚ) / 250000000000000) }
  | .s086_t3_sb028 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((8209624999999999 : ℚ) / 250000000000000)
      tMax := ((262709 : ℚ) / 8000) }
  | .s086_t3_sb029 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262709 : ℚ) / 8000)
      tMax := ((26271 : ℚ) / 800) }
  | .s086_t3_sb030 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((26271 : ℚ) / 800)
      tMax := ((262711 : ℚ) / 8000) }
  | .s086_t3_sb031 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262711 : ℚ) / 8000)
      tMax := ((32839 : ℚ) / 1000) }
  | .s086_t4_sb000 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((821 : ℚ) / 25)
      tMax := ((262721 : ℚ) / 8000) }
  | .s086_t4_sb001 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262721 : ℚ) / 8000)
      tMax := ((6568050000000001 : ℚ) / 200000000000000) }
  | .s086_t4_sb002 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((6568050000000001 : ℚ) / 200000000000000)
      tMax := ((262723 : ℚ) / 8000) }
  | .s086_t4_sb003 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262723 : ℚ) / 8000)
      tMax := ((16420250000000003 : ℚ) / 500000000000000) }
  | .s086_t4_sb004 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((16420250000000003 : ℚ) / 500000000000000)
      tMax := ((10509 : ℚ) / 320) }
  | .s086_t4_sb005 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((10509 : ℚ) / 320)
      tMax := ((131363 : ℚ) / 4000) }
  | .s086_t4_sb006 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((131363 : ℚ) / 4000)
      tMax := ((8210218750000001 : ℚ) / 250000000000000) }
  | .s086_t4_sb007 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((8210218750000001 : ℚ) / 250000000000000)
      tMax := ((32841 : ℚ) / 1000) }
  | .s086_t4_sb008 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((32841 : ℚ) / 1000)
      tMax := ((6568225000000001 : ℚ) / 200000000000000) }
  | .s086_t4_sb009 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((6568225000000001 : ℚ) / 200000000000000)
      tMax := ((26273 : ℚ) / 800) }
  | .s086_t4_sb010 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((26273 : ℚ) / 800)
      tMax := ((262731 : ℚ) / 8000) }
  | .s086_t4_sb011 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262731 : ℚ) / 8000)
      tMax := ((65683 : ℚ) / 2000) }
  | .s086_t4_sb012 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((65683 : ℚ) / 2000)
      tMax := ((262733 : ℚ) / 8000) }
  | .s086_t4_sb013 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262733 : ℚ) / 8000)
      tMax := ((6568350000000001 : ℚ) / 200000000000000) }
  | .s086_t4_sb014 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((6568350000000001 : ℚ) / 200000000000000)
      tMax := ((52547 : ℚ) / 1600) }
  | .s086_t4_sb015 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((52547 : ℚ) / 1600)
      tMax := ((16421 : ℚ) / 500) }
  | .s086_t4_sb016 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((16421 : ℚ) / 500)
      tMax := ((262737 : ℚ) / 8000) }
  | .s086_t4_sb017 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262737 : ℚ) / 8000)
      tMax := ((131369 : ℚ) / 4000) }
  | .s086_t4_sb018 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((131369 : ℚ) / 4000)
      tMax := ((8210593750000001 : ℚ) / 250000000000000) }
  | .s086_t4_sb019 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((8210593750000001 : ℚ) / 250000000000000)
      tMax := ((13137 : ℚ) / 400) }
  | .s086_t4_sb020 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((13137 : ℚ) / 400)
      tMax := ((6568525000000001 : ℚ) / 200000000000000) }
  | .s086_t4_sb021 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((6568525000000001 : ℚ) / 200000000000000)
      tMax := ((131371 : ℚ) / 4000) }
  | .s086_t4_sb022 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((131371 : ℚ) / 4000)
      tMax := ((262743 : ℚ) / 8000) }
  | .s086_t4_sb023 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262743 : ℚ) / 8000)
      tMax := ((32843 : ℚ) / 1000) }
  | .s086_t4_sb024 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((32843 : ℚ) / 1000)
      tMax := ((52549 : ℚ) / 1600) }
  | .s086_t4_sb025 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((52549 : ℚ) / 1600)
      tMax := ((6568650000000001 : ℚ) / 200000000000000) }
  | .s086_t4_sb026 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((6568650000000001 : ℚ) / 200000000000000)
      tMax := ((262747 : ℚ) / 8000) }
  | .s086_t4_sb027 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262747 : ℚ) / 8000)
      tMax := ((65687 : ℚ) / 2000) }
  | .s086_t4_sb028 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((65687 : ℚ) / 2000)
      tMax := ((262749 : ℚ) / 8000) }
  | .s086_t4_sb029 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262749 : ℚ) / 8000)
      tMax := ((1051 : ℚ) / 32) }
  | .s086_t4_sb030 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((1051 : ℚ) / 32)
      tMax := ((8210968750000001 : ℚ) / 250000000000000) }
  | .s086_t4_sb031 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((8210968750000001 : ℚ) / 250000000000000)
      tMax := ((8211 : ℚ) / 250) }
  | .s086_t5_sb000 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((6569 : ℚ) / 200)
      tMax := ((8211281249999999 : ℚ) / 250000000000000) }
  | .s086_t5_sb001 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((8211281249999999 : ℚ) / 250000000000000)
      tMax := ((131381 : ℚ) / 4000) }
  | .s086_t5_sb002 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((131381 : ℚ) / 4000)
      tMax := ((262763 : ℚ) / 8000) }
  | .s086_t5_sb003 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262763 : ℚ) / 8000)
      tMax := ((65691 : ℚ) / 2000) }
  | .s086_t5_sb004 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((65691 : ℚ) / 2000)
      tMax := ((52553 : ℚ) / 1600) }
  | .s086_t5_sb005 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((52553 : ℚ) / 1600)
      tMax := ((131383 : ℚ) / 4000) }
  | .s086_t5_sb006 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((131383 : ℚ) / 4000)
      tMax := ((262767 : ℚ) / 8000) }
  | .s086_t5_sb007 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262767 : ℚ) / 8000)
      tMax := ((8211500000000001 : ℚ) / 250000000000000) }
  | .s086_t5_sb008 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((8211500000000001 : ℚ) / 250000000000000)
      tMax := ((262769 : ℚ) / 8000) }
  | .s086_t5_sb009 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262769 : ℚ) / 8000)
      tMax := ((26277 : ℚ) / 800) }
  | .s086_t5_sb010 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((26277 : ℚ) / 800)
      tMax := ((262771 : ℚ) / 8000) }
  | .s086_t5_sb011 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262771 : ℚ) / 8000)
      tMax := ((65693 : ℚ) / 2000) }
  | .s086_t5_sb012 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((65693 : ℚ) / 2000)
      tMax := ((262773 : ℚ) / 8000) }
  | .s086_t5_sb013 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262773 : ℚ) / 8000)
      tMax := ((131387 : ℚ) / 4000) }
  | .s086_t5_sb014 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((131387 : ℚ) / 4000)
      tMax := ((8211718750000001 : ℚ) / 250000000000000) }
  | .s086_t5_sb015 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((8211718750000001 : ℚ) / 250000000000000)
      tMax := ((32847 : ℚ) / 1000) }
  | .s086_t5_sb016 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((32847 : ℚ) / 1000)
      tMax := ((262777 : ℚ) / 8000) }
  | .s086_t5_sb017 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262777 : ℚ) / 8000)
      tMax := ((131389 : ℚ) / 4000) }
  | .s086_t5_sb018 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((131389 : ℚ) / 4000)
      tMax := ((262779 : ℚ) / 8000) }
  | .s086_t5_sb019 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262779 : ℚ) / 8000)
      tMax := ((8211875000000001 : ℚ) / 250000000000000) }
  | .s086_t5_sb020 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((8211875000000001 : ℚ) / 250000000000000)
      tMax := ((262781 : ℚ) / 8000) }
  | .s086_t5_sb021 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262781 : ℚ) / 8000)
      tMax := ((6569550000000001 : ℚ) / 200000000000000) }
  | .s086_t5_sb022 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((6569550000000001 : ℚ) / 200000000000000)
      tMax := ((262783 : ℚ) / 8000) }
  | .s086_t5_sb023 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262783 : ℚ) / 8000)
      tMax := ((4106 : ℚ) / 125) }
  | .s086_t5_sb024 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((4106 : ℚ) / 125)
      tMax := ((52557 : ℚ) / 1600) }
  | .s086_t5_sb025 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((52557 : ℚ) / 1600)
      tMax := ((131393 : ℚ) / 4000) }
  | .s086_t5_sb026 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((131393 : ℚ) / 4000)
      tMax := ((8212093750000001 : ℚ) / 250000000000000) }
  | .s086_t5_sb027 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((8212093750000001 : ℚ) / 250000000000000)
      tMax := ((65697 : ℚ) / 2000) }
  | .s086_t5_sb028 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((65697 : ℚ) / 2000)
      tMax := ((16424312500000003 : ℚ) / 500000000000000) }
  | .s086_t5_sb029 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((16424312500000003 : ℚ) / 500000000000000)
      tMax := ((26279 : ℚ) / 800) }
  | .s086_t5_sb030 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((26279 : ℚ) / 800)
      tMax := ((3284887500000001 : ℚ) / 100000000000000) }
  | .s086_t5_sb031 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((3284887500000001 : ℚ) / 100000000000000)
      tMax := ((8212250000000001 : ℚ) / 250000000000000) }
  | .s086_t6_sb000 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((657 : ℚ) / 20)
      tMax := ((262801 : ℚ) / 8000) }
  | .s086_t6_sb001 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262801 : ℚ) / 8000)
      tMax := ((131401 : ℚ) / 4000) }
  | .s086_t6_sb002 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((131401 : ℚ) / 4000)
      tMax := ((262803 : ℚ) / 8000) }
  | .s086_t6_sb003 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262803 : ℚ) / 8000)
      tMax := ((8212625000000001 : ℚ) / 250000000000000) }
  | .s086_t6_sb004 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((8212625000000001 : ℚ) / 250000000000000)
      tMax := ((52561 : ℚ) / 1600) }
  | .s086_t6_sb005 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((52561 : ℚ) / 1600)
      tMax := ((131403 : ℚ) / 4000) }
  | .s086_t6_sb006 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((131403 : ℚ) / 4000)
      tMax := ((262807 : ℚ) / 8000) }
  | .s086_t6_sb007 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262807 : ℚ) / 8000)
      tMax := ((32851 : ℚ) / 1000) }
  | .s086_t6_sb008 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((32851 : ℚ) / 1000)
      tMax := ((262809 : ℚ) / 8000) }
  | .s086_t6_sb009 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262809 : ℚ) / 8000)
      tMax := ((26281 : ℚ) / 800) }
  | .s086_t6_sb010 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((26281 : ℚ) / 800)
      tMax := ((262811 : ℚ) / 8000) }
  | .s086_t6_sb011 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262811 : ℚ) / 8000)
      tMax := ((65703 : ℚ) / 2000) }
  | .s086_t6_sb012 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((65703 : ℚ) / 2000)
      tMax := ((262813 : ℚ) / 8000) }
  | .s086_t6_sb013 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262813 : ℚ) / 8000)
      tMax := ((131407 : ℚ) / 4000) }
  | .s086_t6_sb014 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((131407 : ℚ) / 4000)
      tMax := ((52563 : ℚ) / 1600) }
  | .s086_t6_sb015 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((52563 : ℚ) / 1600)
      tMax := ((8213000000000001 : ℚ) / 250000000000000) }
  | .s086_t6_sb016 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((8213000000000001 : ℚ) / 250000000000000)
      tMax := ((262817 : ℚ) / 8000) }
  | .s086_t6_sb017 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262817 : ℚ) / 8000)
      tMax := ((131409 : ℚ) / 4000) }
  | .s086_t6_sb018 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((131409 : ℚ) / 4000)
      tMax := ((262819 : ℚ) / 8000) }
  | .s086_t6_sb019 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262819 : ℚ) / 8000)
      tMax := ((13141 : ℚ) / 400) }
  | .s086_t6_sb020 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((13141 : ℚ) / 400)
      tMax := ((262821 : ℚ) / 8000) }
  | .s086_t6_sb021 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262821 : ℚ) / 8000)
      tMax := ((131411 : ℚ) / 4000) }
  | .s086_t6_sb022 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((131411 : ℚ) / 4000)
      tMax := ((262823 : ℚ) / 8000) }
  | .s086_t6_sb023 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262823 : ℚ) / 8000)
      tMax := ((32853 : ℚ) / 1000) }
  | .s086_t6_sb024 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((32853 : ℚ) / 1000)
      tMax := ((10513 : ℚ) / 320) }
  | .s086_t6_sb025 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((10513 : ℚ) / 320)
      tMax := ((131413 : ℚ) / 4000) }
  | .s086_t6_sb026 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((131413 : ℚ) / 4000)
      tMax := ((262827 : ℚ) / 8000) }
  | .s086_t6_sb027 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262827 : ℚ) / 8000)
      tMax := ((65707 : ℚ) / 2000) }
  | .s086_t6_sb028 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((65707 : ℚ) / 2000)
      tMax := ((262829 : ℚ) / 8000) }
  | .s086_t6_sb029 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262829 : ℚ) / 8000)
      tMax := ((26283 : ℚ) / 800) }
  | .s086_t6_sb030 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((26283 : ℚ) / 800)
      tMax := ((262831 : ℚ) / 8000) }
  | .s086_t6_sb031 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262831 : ℚ) / 8000)
      tMax := ((16427 : ℚ) / 500) }
  | .s086_t7_sb000 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((6571 : ℚ) / 200)
      tMax := ((16427562499999997 : ℚ) / 500000000000000) }
  | .s086_t7_sb001 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((16427562499999997 : ℚ) / 500000000000000)
      tMax := ((131421 : ℚ) / 4000) }
  | .s086_t7_sb002 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((131421 : ℚ) / 4000)
      tMax := ((6571074999999999 : ℚ) / 200000000000000) }
  | .s086_t7_sb003 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((6571074999999999 : ℚ) / 200000000000000)
      tMax := ((65711 : ℚ) / 2000) }
  | .s086_t7_sb004 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((65711 : ℚ) / 2000)
      tMax := ((8213906249999999 : ℚ) / 250000000000000) }
  | .s086_t7_sb005 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((8213906249999999 : ℚ) / 250000000000000)
      tMax := ((131423 : ℚ) / 4000) }
  | .s086_t7_sb006 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((131423 : ℚ) / 4000)
      tMax := ((262847 : ℚ) / 8000) }
  | .s086_t7_sb007 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262847 : ℚ) / 8000)
      tMax := ((6571199999999999 : ℚ) / 200000000000000) }
  | .s086_t7_sb008 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((6571199999999999 : ℚ) / 200000000000000)
      tMax := ((262849 : ℚ) / 8000) }
  | .s086_t7_sb009 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262849 : ℚ) / 8000)
      tMax := ((8214062499999999 : ℚ) / 250000000000000) }
  | .s086_t7_sb010 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((8214062499999999 : ℚ) / 250000000000000)
      tMax := ((262851 : ℚ) / 8000) }
  | .s086_t7_sb011 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262851 : ℚ) / 8000)
      tMax := ((65713 : ℚ) / 2000) }
  | .s086_t7_sb012 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((65713 : ℚ) / 2000)
      tMax := ((262853 : ℚ) / 8000) }
  | .s086_t7_sb013 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262853 : ℚ) / 8000)
      tMax := ((131427 : ℚ) / 4000) }
  | .s086_t7_sb014 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((131427 : ℚ) / 4000)
      tMax := ((52571 : ℚ) / 1600) }
  | .s086_t7_sb015 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((52571 : ℚ) / 1600)
      tMax := ((32857 : ℚ) / 1000) }
  | .s086_t7_sb016 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((32857 : ℚ) / 1000)
      tMax := ((8214281249999999 : ℚ) / 250000000000000) }
  | .s086_t7_sb017 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((8214281249999999 : ℚ) / 250000000000000)
      tMax := ((131429 : ℚ) / 4000) }
  | .s086_t7_sb018 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((131429 : ℚ) / 4000)
      tMax := ((262859 : ℚ) / 8000) }
  | .s086_t7_sb019 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262859 : ℚ) / 8000)
      tMax := ((13143 : ℚ) / 400) }
  | .s086_t7_sb020 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((13143 : ℚ) / 400)
      tMax := ((262861 : ℚ) / 8000) }
  | .s086_t7_sb021 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262861 : ℚ) / 8000)
      tMax := ((131431 : ℚ) / 4000) }
  | .s086_t7_sb022 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((131431 : ℚ) / 4000)
      tMax := ((262863 : ℚ) / 8000) }
  | .s086_t7_sb023 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262863 : ℚ) / 8000)
      tMax := ((8214500000000001 : ℚ) / 250000000000000) }
  | .s086_t7_sb024 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((8214500000000001 : ℚ) / 250000000000000)
      tMax := ((52573 : ℚ) / 1600) }
  | .s086_t7_sb025 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((52573 : ℚ) / 1600)
      tMax := ((131433 : ℚ) / 4000) }
  | .s086_t7_sb026 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((131433 : ℚ) / 4000)
      tMax := ((262867 : ℚ) / 8000) }
  | .s086_t7_sb027 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262867 : ℚ) / 8000)
      tMax := ((65717 : ℚ) / 2000) }
  | .s086_t7_sb028 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((65717 : ℚ) / 2000)
      tMax := ((262869 : ℚ) / 8000) }
  | .s086_t7_sb029 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((262869 : ℚ) / 8000)
      tMax := ((26287 : ℚ) / 800) }
  | .s086_t7_sb030 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((26287 : ℚ) / 800)
      tMax := ((6571775000000001 : ℚ) / 200000000000000) }
  | .s086_t7_sb031 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((6571775000000001 : ℚ) / 200000000000000)
      tMax := ((32859 : ℚ) / 1000) }
  | .s086_t8_sb000 =>
    { sigmaMin := ((43 : ℚ) / 50)
      sigmaMax := ((43 : ℚ) / 50)
      tMin := ((1643 : ℚ) / 50)
      tMax := ((1643 : ℚ) / 50) }

def positiveBoxSubboxRegion (i : PositiveBoxSubboxId) : Set ℂ :=
  (positiveBoxSubboxRect i).toSet

structure PositiveBoxAllSubboxCoverHypotheses where
  cover :
    ∀ b ∈ positiveBoxes,
      ∀ s ∈ positiveBoxRegion b,
        ∃ i ∈ positiveBoxSubboxesOf b,
          s ∈ positiveBoxSubboxRegion i

structure PositiveBoxAllSubboxBounds
    (tiltSeed : ℂ → ℂ) (coreCutoff : ℕ → ℕ) (K Midx : ℕ) where
  main_lower :
    ∀ b ∈ positiveBoxes,
      ∀ i ∈ positiveBoxSubboxesOf b,
        ∀ s ∈ positiveBoxSubboxRegion i,
          ((positiveBoxCombinedCert b).constants.mainLower : ℝ) ≤
            ‖adjustedProjectedJ0_M tiltSeed s‖
  d0_neg_upper :
    ∀ b ∈ positiveBoxes,
      ∀ i ∈ positiveBoxSubboxesOf b,
        ∀ s ∈ positiveBoxSubboxRegion i,
          adjustedProjectedJ0_D0NegReMain tiltSeed coreCutoff s ≤
            ((positiveBoxCombinedCert b).constants.d0NegReUpper : ℝ)
  rest_upper :
    ∀ b ∈ positiveBoxes,
      ∀ i ∈ positiveBoxSubboxesOf b,
        ∀ s ∈ positiveBoxSubboxRegion i,
          adjustedProjectedJ0_restCostFinite tiltSeed coreCutoff K Midx s ≤
            ((positiveBoxCombinedCert b).constants.restUpper : ℝ)

namespace PositiveBoxAllSubboxBounds

def toPositiveBoxSubboxCovers
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ} {K Midx : ℕ}
    (bounds : PositiveBoxAllSubboxBounds tiltSeed coreCutoff K Midx)
    (covers : PositiveBoxAllSubboxCoverHypotheses) :
    PositiveBoxSubboxCovers
      PositiveBoxSubboxId
      (fun _ i => positiveBoxSubboxRegion i)
      tiltSeed coreCutoff K Midx where
  subboxes := positiveBoxSubboxesOf
  cover := by
    intro b hb
    exact
      { cover := covers.cover b hb
        main_lower_subbox := bounds.main_lower b hb
        d0_neg_subbox := bounds.d0_neg_upper b hb
        rest_upper_subbox := bounds.rest_upper b hb }

end PositiveBoxAllSubboxBounds

theorem positiveBox_totalFinite_ne_zero_of_all_subbox_bounds
    {tiltSeed : ℂ → ℂ} {coreCutoff : ℕ → ℕ} {K Midx : ℕ}
    (bounds : PositiveBoxAllSubboxBounds tiltSeed coreCutoff K Midx)
    (covers : PositiveBoxAllSubboxCoverHypotheses) :
    ∀ s ∈ positiveGlobalRegion,
      adjustedProjectedJ0_totalFinite tiltSeed coreCutoff K Midx s ≠ 0 := by
  exact positiveBox_totalFinite_ne_zero_of_subbox_covers
    (PositiveBoxAllSubboxBounds.toPositiveBoxSubboxCovers bounds covers)

end ProjectedJ0PositiveBoxSkeleton
end C2
