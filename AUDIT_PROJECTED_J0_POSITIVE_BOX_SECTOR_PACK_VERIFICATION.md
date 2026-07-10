# Audit Projected J0 Positive Box Sector Pack Verification

Rota: Genuine-First. Esta verificacao cobre a consistencia externa do
sector pack e a algebra dos budgets setoriais. Ela nao prova as
enclosures analiticas.

## Resultado

- Checks failed: 0
- Boxes: 27
- Nondestructive: 27
- Combined: 27
- Separate: 27
- Min sector budget combined: 0.05408604580200366
- Min sector budget separate: 0.05403134348437868
- Worst combined box: `s0.84_t7`
- Worst separate box: `s0.84_t7`
- Max d0_neg_re_upper: -0.00019368049701349772 at `s0.86_t0`
- Rerun exit code: 0
- Max rerun diff: 0

## Respostas

1. O sector pack e internamente consistente se `checks failed = 0`.
2. O rerun reproduz os dados quando `rerun_exit_code = 0` e `max_rerun_diff` fica dentro da tolerancia.
3. A caixa mais apertada e `s0.84_t7`.
4. O maior `d0_neg_re_upper` e -0.00019368049701349772 em `s0.86_t0`.
5. Para positive-box, o pack setorial substitui o pack racionalizado generico porque fixa `parallelUpper = 0`.
6. Ainda falta uma verificacao formal ou certificada das enclosures que produzem os bounds.
7. Esta camada ainda nao prova as enclosures analiticas.

## Failed Checks

- None.
