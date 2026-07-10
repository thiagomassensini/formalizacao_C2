# Positive Box Phase Sanity Audit

Date: 2026-07-01

Scope:

- Audit-only sanity check for the positive-box sector phase step.
- No new theorem was attempted.
- No Lean theorem file was edited in this pass.
- The oddRef line remains frozen.
- Nothing was promoted to the main route.

## Lean Objects Checked

File inspected:

```text
LeanC2/AuditContinuedQuartetPositiveBoxSector.lean
```

The relevant Lean lemmas are:

```lean
q_re_eq_norm_mul_cos_phase
q_im_eq_neg_norm_mul_sin_phase
q_sq_re_eq_norm_sq_mul_cos_two_phase
```

The remaining trigonometric data packages are:

```lean
PositiveBoxQTrigPhaseData
PositiveBoxQSqTrigPhaseData
PositiveBoxQPhaseData.ofTrigPhaseData
PositiveBoxQSqPhaseData.ofTrigPhaseData
PositiveBoxSectorFactorData.ofTrigPhaseData
```

## Phase Sign Check

The definition is:

```text
q(s) = 2^(-1-s)
```

Therefore:

```text
q(s) = |q(s)| * exp(-i * s.im * log 2)
```

Taking real parts gives:

```text
Re(q(s)) = |q(s)| * cos(-s.im * log 2)
         = |q(s)| * cos(s.im * log 2)
```

because cosine is even.

The Lean theorem:

```lean
q_re_eq_norm_mul_cos_phase :
  (q s).re = ‖q s‖ * Real.cos (s.im * Real.log 2)
```

has the correct sign.

For the square:

```text
q(s)^2 = |q(s)|^2 * exp(-2i * s.im * log 2)
```

so:

```text
Re(q(s)^2) = |q(s)|^2 * cos(2 * s.im * log 2)
```

The Lean theorem:

```lean
q_sq_re_eq_norm_sq_mul_cos_two_phase :
  ((q s)^2).re =
    ‖q s‖^2 * Real.cos (2 * (s.im * Real.log 2))
```

also has the correct sign.

## Implication Chain Check

For the first factor, Lean has:

```lean
PositiveBoxQTrigPhaseData.cos_phase_lower
```

with target:

```lean
-(73 / 100) <= Real.cos (s.im * Real.log 2)
```

Using nonnegativity of `‖q s‖` and `q_re_eq_norm_mul_cos_phase`, this implies:

```lean
-(73 / 100) * ‖q s‖ <= (q s).re
```

Then `positiveBox_q_norm_upper_7_25` and
`positiveBox_one_add_q_norm_coupled_of_re_slope` imply:

```lean
(4091 / 5000)^2 <= 1 + ‖q s‖^2 + 2 * (q s).re
```

Finally `norm_one_add_sq_eq` gives:

```lean
4091 / 5000 <= ‖1 + q s‖
```

For the second factor, Lean has:

```lean
PositiveBoxQSqTrigPhaseData.cos_two_phase_product_lower
```

with target:

```lean
-(1 / 600) <=
  ‖q s‖^2 * Real.cos (2 * (s.im * Real.log 2))
```

Using `q_sq_re_eq_norm_sq_mul_cos_two_phase`, this implies:

```lean
-(1 / 600) <= ((q s)^2).re
```

Together with `positiveBox_q_norm_lower_11_40`, Lean proves:

```lean
1001 / 1000 <= ‖1 + (q s)^2‖
```

The two factor bounds then feed:

```lean
PositiveBoxSectorFactorData.sector_lower
```

which proves:

```lean
positiveBoxSectorLowerValue <= ‖verticalQuartetPrefix (q s)‖
```

So the trigonometric fields do imply the previous geometric fields and then
`sector_lower`.

## Diagnostic Margins

Box:

```text
sigma in [21/25, 43/50]
t     in [525/16, 263/8]
```

Approximate corner/grid diagnostics:

```text
min( cos(t log 2) - (-73/100) )
  ~= 0.000183812731964
```

The tight point is at:

```text
t = 525/16
cos(t log 2) ~= -0.729816187268036
```

For the squared phase product:

```text
min( |q|^2 * cos(2 t log 2) - (-1/600) )
  ~= 0.00000232789030836
```

The tight point is at:

```text
sigma = 21/25
t     = 263/8
|q|   ~= 0.279321784518055
cos(2 t log 2) ~= -0.0213320265575202
|q|^2 * cos(2 t log 2) ~= -0.00166433877635831
```

The target is:

```text
-1/600 ~= -0.00166666666666667
```

so the diagnostic slack is only about:

```text
2.33e-6
```

The local derivative estimate at the tight `q^2` corner gives an approximate
right-edge `t` slack of only:

```text
2.15e-5
```

## Recommendation

The signs and Lean implication chain are sane.

The current box appears mathematically positive in the diagnostic check, but
the `q^2` margin is extremely thin.  A formal proof on the current box would
need a fine interval argument that keeps the product

```text
|q|^2 * cos(2 t log 2)
```

intact.  A separated lower bound for the cosine and a coarse upper bound for
`|q|` is likely to lose the margin.

Recommended next move:

```text
B. shrink the positive box slightly before the formal phase proof,
   especially by lowering t_max.
```

A diagnostic shrink such as:

```text
t_max = 32.8749
```

would add roughly `1e-5` of slack to the `q^2` field.  If preserving the exact
current box matters, then option A is still possible, but it should use a fine
interval proof around the product form, not a coarse separated estimate.

## Route Discipline

- oddRef remained frozen.
- No zeta-based input was used.
- No new operator was introduced.
- Nothing was promoted to the main route.
