import LeanC2.Analytic.GenuineBulkConcrete

open Lean

partial def stripForalls : Expr → Nat × Expr
  | Expr.forallE _ _ b _ =>
      let r := stripForalls b
      (r.1 + 1, r.2)
  | e => (0, e)

def headConstName? (e : Expr) : Option Name :=
  match e.getAppFn with
  | Expr.const n _ => some n
  | _ => none

def target? (e : Expr) : Option String :=
  match headConstName? e with
  | some n =>
      if n == ``RiemannHypothesis then
        some "RiemannHypothesis"
      else if n == ``C2.RiemannHypothesisTerminalData then
        some "RiemannHypothesisTerminalData"
      else if n == ``C2.C2CanonicalClosedScaledMiddleLocalData then
        some "C2CanonicalClosedScaledMiddleLocalData"
      else if n == ``C2.C2CanonicalClosedScaledMiddleRegionData then
        some "C2CanonicalClosedScaledMiddleRegionData"
      else if n == ``C2.C2ExpandedScalarMiddleRegionData then
        some "C2ExpandedScalarMiddleRegionData"
      else
        none
  | none => none

#eval show CoreM Unit from do
  let env ← getEnv
  for (name, info) in env.constants.toList do
    let (nBinders, result) := stripForalls info.type
    match target? result with
    | some target =>
        if nBinders == 0 then
          logInfo m!"ZERO_BINDER | target={target} | name={name} | type={info.type}"
    | none => pure ()

#eval show CoreM Unit from do
  let env ← getEnv
  for (name, info) in env.constants.toList do
    let (nBinders, result) := stripForalls info.type
    match target? result with
    | some target =>
        if nBinders <= 2 then
          logInfo m!"LOW_BINDER | binders={nBinders} | target={target} | name={name} | type={info.type}"
    | none => pure ()

