# Projected J0 Certificate Pack Verification

Pack: `/home/thlinux/formalizacao_C2/audit_outputs/projected_j0_seed_hurts_certificate_pack`

This is an external reproducibility check. It is not a Lean proof.

## Result

- Checks passed: 20
- Checks failed: 0
- Boxes: 6
- Certified combined: 6/6
- Certified separate: 5/6
- Min budget combined: 0.00017189821247432305
- Min budget separate: -0.0006216336919868774
- Worst combined box: `s0.74_t45`
- Worst separate box: `s0.74_t45`
- Rerun exit code: 0
- Largest rerun diff field: `mainNormLowerConst` = 0.0

## Respostas

1. O pack e internamente consistente: os arquivos obrigatorios existem,
   `boxes.csv` e `boxes.json` tem 6 caixas, e as identidades de
   `parallelUpperConst` e budget fecham com diferenca maxima zero.
2. O rerun reproduz os dados dentro da tolerancia `1e-10`: todos os campos
   comparados tiveram diff maximo `0.0`.
3. `s0.74_t45` so passa em combined:
   `budgetCombinedConst = 1.7189821247432305e-04` e
   `budgetSeparateConst = -6.216336919868774e-04`.
4. A moeda separate nao deve ser usada nessa primeira caixa.
5. `seed_hurts` continua sendo fronteira fina, nao bloco robusto: passa em
   combined com `subdiv-t=512`, mas perde uma caixa na variante separate.

## Internal Identities

- `parallelUpperConst` max abs identity diff: 0.0 at ``
- `budgetCombinedConst` max abs identity diff: 0.0 at ``
- `budgetSeparateConst` max abs identity diff: 0.0 at ``

## Rerun Diffs

- `mainNormLowerConst` max abs diff: 0.0 at ``
- `numeratorUpperConst` max abs diff: 0.0 at ``
- `parallelUpperConst` max abs diff: 0.0 at ``
- `restUpperCombinedConst` max abs diff: 0.0 at ``
- `restUpperSeparateConst` max abs diff: 0.0 at ``
- `budgetCombinedConst` max abs diff: 0.0 at ``
- `budgetSeparateConst` max abs diff: 0.0 at ``

## Separate Failures

- `s0.74_t45`: budgetSeparateConst = -0.0006216336919868774

## Failed Checks

- None.

## Lean Status

The pack is only an external certificate artifact. Turning it into a
formal proof still requires a trusted checker or a formalized interval
certificate path that supplies the analytic fields consumed by
`ProjectedJ0ConstantBoxData`.
