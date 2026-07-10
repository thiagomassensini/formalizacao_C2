# AUDIT_POSITIVE_BOX_CUTOFF_EXACT_UPPER_AUDIT

## Escopo

Esta etapa audita o alvo:

```text
forall s in positiveBox,
  c2ContinuedCutoffExactUpper positiveBoxK positiveBoxM s
    <= positiveBoxCutUpperValue
```

Nenhuma prova numerica foi tentada. Nenhuma estrutura nova foi criada, porque a
definicao auditada ainda nao e uma formula escalar fechada independente do
canal continuado.

## Definicoes auditadas

| Objeto | Local | Definicao auditada |
|---|---:|---|
| `c2ContinuedCutoffExactUpper K M` | `LeanC2/Analytic/GenuineBulkConcrete.lean:3912` | `fun s => norm (c2ConcreteCutoffErrorFromTarget continuedCentralOddChannel K M s)` |
| `c2ConcreteCutoffErrorFromTarget targetF K M` | `LeanC2/Route/BulkConcrete.lean:60` | `fun s => c2RectangularGenuineOperator K M s - targetF s` |
| `cutVec K M` | `LeanC2/AuditContinuedQuartetVSplit.lean:26` | `fun s => rectangularGenuine s K M - continuedCentralOddChannel s` |
| `rectangularGenuine s K M` | `LeanC2/Operators/TruncatedGenuine.lean:14` | `rectangularDirect s K M - rectangularBracket s K M` |
| `continuedCentralOddChannel s` | `LeanC2/Analytic/GenuineContinuation.lean:37` | `centralFromOddChannel continuedOddDirichletChannel s` |
| `positiveBoxK` | `LeanC2/AuditContinuedQuartetPositiveBox.lean:48` | `3` |
| `positiveBoxM` | `LeanC2/AuditContinuedQuartetPositiveBox.lean:51` | `50` |
| `positiveBoxCutUpperValue` | `LeanC2/AuditContinuedQuartetPositiveBox.lean:74` | `(3 : Real) / 1000` |

For the positive box target, this expands semantically to:

```text
norm
  (c2ConcreteCutoffErrorFromTarget continuedCentralOddChannel 3 50 s)
<= 3 / 1000
```

and, through `cutVec_eq_continuedCutoffError`, the same complex difference is:

```text
rectangularGenuine s 3 50 - continuedCentralOddChannel s
```

## Answers

| Question | Answer |
|---|---|
| Is `c2ContinuedCutoffExactUpper` a closed formula in `q`, `K`, `M`, etc.? | No. It is the exact norm of a cutoff error against `continuedCentralOddChannel`. |
| Does it depend semantically on `continuedCentralOddChannel`? | Yes. The dependency is direct in the definition. It is not an independent real upper envelope. |
| Is there an existing lemma proving the cutoff-error norm is at most this exact upper? | No separate named general lemma was found. The statement is definitional after unfolding `c2ContinuedCutoffExactUpper`, so it is `le_rfl`. |
| Does the exact upper itself use a forbidden analytic symbol? | The displayed exact-upper definition does not contain such a name, but expanding `continuedCentralOddChannel` reaches the continued odd analytic channel. Semantically this is channel-dependent, not Z-free. |
| Can the positive box use this upper genuine-first without reopening raw/continued/oddRef? | It can keep it as audit-only conditional data through the cutoff bridge. It cannot yet be treated as a genuine-first scalar proof target. `oddRef` is not needed and remains frozen. |

## Existing connectors

| Connector | Role |
|---|---|
| `cutVec_eq_continuedCutoffError` | identifies `cutVec K M s` with `c2ConcreteCutoffErrorFromTarget continuedCentralOddChannel K M s` |
| `PositiveBoxCutoffUpperData.cut_bound` | turns a bound on `c2ContinuedCutoffExactUpper positiveBoxK positiveBoxM` into the `cut_bound` field |
| `positiveBox_cut_bound_of_continuedCutoffExactUpper` | direct theorem form of the same bridge |
| `c2ContinuedCutoffExactUpper_le_triangle` | bounds the exact upper by the triangle upper |
| `c2ContinuedCutoff_norm_le_triangle` | bounds the cutoff-error norm by `norm rectangularGenuine + norm continuedCentralOddChannel` |
| `c2ContinuedCutoff_norm_le_closedUpper_of_bounds` | uses separate rectangular and central-channel bounds to get a closed upper |

The triangle and closed-upper routes still require control of
`continuedCentralOddChannel`. They do not reduce the positive-box target to the
already proved `q` endpoint bounds.

## Bound status

The target:

```text
c2ContinuedCutoffExactUpper 3 50 s <= 3 / 1000
```

does not currently look like a scalar obligation in `q` alone. The available
`q` bounds help with phase and sector geometry, but they do not bound the
continued central channel appearing inside the exact cutoff norm.

Because of that, this pass did not create:

- `PositiveBoxCutoffExactUpperBounds`
- a proof of `PositiveBoxCutoffUpperData.cutoff_upper_bound`
- any wrapper that treats the numerical bound as established

## Compilacao

The current audit tile still compiles. Commands executed successfully:

```text
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxCutoff.lean
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxSector.lean
lake env lean LeanC2/AuditContinuedQuartetPositiveBoxInterval.lean
lake env lean LeanC2/AuditContinuedQuartetPositiveBox.lean
```

All commands ended without error output.

## Guardrails

- `oddRef` remained frozen.
- `anchor_bound` was not touched.
- odd truncation was not touched.
- No numerical cutoff proof was attempted.
- No operator was introduced.
- No forbidden analytic name was introduced in this report.
- No prohibited declaration or placeholder was introduced.
- Nothing was promoted to the main route.

## Recommendation

C. keep cutoff bound conditional due to continued-channel dependency
