import LeanC2.Analytic.GenuineBulkConcrete

open Lean

partial def stripForalls : Expr → Nat × Expr
  | Expr.forallE _ _ b _ =>
      let r := stripForalls b
      (r.1 + 1, r.2)
  | e => (0, e)

partial def containsConst (target : Name) : Expr → Bool
  | Expr.const n _ => n == target
  | Expr.app f a => containsConst target f || containsConst target a
  | Expr.lam _ t b _ => containsConst target t || containsConst target b
  | Expr.forallE _ t b _ => containsConst target t || containsConst target b
  | Expr.letE _ t v b _ => containsConst target t || containsConst target v || containsConst target b
  | Expr.mdata _ b => containsConst target b
  | Expr.proj _ _ b => containsConst target b
  | _ => false

def headConstName? (e : Expr) : Option Name :=
  match e.getAppFn with
  | Expr.const n _ => some n
  | _ => none

def target? (e : Expr) : Option String :=
  match headConstName? e with
  | some n =>
      if n == ``RiemannHypothesis then
        some "RiemannHypothesis"
      else if n == ``C2.offCriticalStripNonvanishing then
        some "offCriticalStripNonvanishing"
      else if n == ``C2.GenuineRouteData then
        some "GenuineRouteData"
      else if n == ``C2.OffCriticalCoverData then
        some "OffCriticalCoverData"
      else if n == ``C2.GenuineFInfiniteContinuationData then
        some "GenuineFInfiniteContinuationData"
      else if n == ``C2.RiemannHypothesisTerminalData then
        some "RiemannHypothesisTerminalData"
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
          logInfo m!"ZERO_CERT | target={target} | name={name} | type={info.type}"
    | none => pure ()

#eval show CoreM Unit from do
  let env ← getEnv
  for (name, info) in env.constants.toList do
    let (nBinders, result) := stripForalls info.type
    if nBinders == 0 then
      if containsConst ``RiemannHypothesis info.type ||
         containsConst ``C2.offCriticalStripNonvanishing info.type ||
         containsConst ``C2.genuineFInfinite info.type ||
         containsConst ``riemannZeta info.type then
        logInfo m!"ZERO_RELEVANT | name={name} | type={info.type}"

