# Audit Projected J0 Positive Box Worst Box Independent Check

Data: 2026-07-08.

Rota: Genuine-First. Esta checagem mira a pior caixa do pack positive-box
racionalizado, `s0.84_t7`, para aumentar a confianca no artefato externo. Ela
continua sendo uma checagem intervalar externa, nao uma prova Lean das
enclosures.

## Caixa

```text
source_box_id = s0.84_t7
sigma = 0.84
t in [32.855, 32.859]
```

Entrada:

```text
audit_outputs/c2_projected_j0_atlas_scout_positive_box_sigmas084_086_t32p82_32p86_w005_boxes.csv
```

## Strict Check

Comando executado com:

```text
mode = strict
subdiv-t = 8
interval-dps = 80
inflate = 1e-14
main-lower-method = center-radius
```

Saidas:

```text
audit_outputs/c2_projected_j0_positive_box_s084_t7_strict_check.csv
audit_outputs/c2_projected_j0_positive_box_s084_t7_strict_check.json
```

Resultado:

```text
strict rodou: sim
elapsed: 123.74s
certified combined: 1/1
certified separate: 1/1
status: certified_combined_and_separate
```

Constantes strict:

```text
mainNormLowerConst      = 0.051230419277691897
numeratorUpperConst     = 5e-324
parallelUpperConst      = 1e-322
restUpperCombinedConst  = 0.009242233413190444
restUpperSeparateConst  = 0.00933647354650341
budgetCombinedConst     = 0.041988185864501454
budgetSeparateConst     = 0.04189394573118849
```

## Fast Sub32 Check

Comando executado com:

```text
mode = fast
subdiv-t = 32
interval-dps = 80
inflate = 1e-13
main-lower-method = center-radius
```

Saidas:

```text
audit_outputs/c2_projected_j0_positive_box_s084_t7_fast_sub32_check.csv
audit_outputs/c2_projected_j0_positive_box_s084_t7_fast_sub32_check.json
```

Resultado:

```text
certified combined: 1/1
certified separate: 1/1
status: certified_combined_and_separate
```

Constantes fast/sub32:

```text
mainNormLowerConst      = 0.05862923979330283
numeratorUpperConst     = 5e-324
parallelUpperConst      = 8.4e-323
restUpperCombinedConst  = 0.004543193991299174
restUpperSeparateConst  = 0.004597896308924157
budgetCombinedConst     = 0.05408604580200366
budgetSeparateConst     = 0.05403134348437868
```

## Comparacao Com O Pack

Pack original para `s0.84_t7`:

```text
budgetCombinedConst = 0.041988183220299534
budgetSeparateConst = 0.04189394308845744
```

Pack racionalizado:

```text
budgetCombinedConst_rat = 0.041988183200
budgetSeparateConst_rat = 0.041893943068
```

O strict/sub8 reproduz a escala do pack com margem ligeiramente maior:

```text
strict budget combined - pack combined ~= 2.6442e-09
strict budget separate - pack separate ~= 2.6427e-09
```

O fast/sub32 melhora o budget porque a subdivisao mais fina reduz a inflacao
intervalar de `mainNormLowerConst` e dos restos:

```text
fast/sub32 budget combined = 0.05408604580200366
fast/sub32 budget separate = 0.05403134348437868
```

## Leitura

1. O modo strict foi viavel para a pior caixa isolada.
2. `s0.84_t7` certificou em combined e separate no strict.
3. O fast/sub32 confirmou a caixa com folga maior.
4. A checagem aumenta a confianca no pack positive-box, porque a caixa mais
   apertada sobrevive em dois regimes independentes de execucao.
5. Isso ainda nao transforma o pack em prova Lean das enclosures analiticas.

## Proximo Passo

Manter `s0.84_t7` como caixa sentinela para regressao do certificador externo.
Para a rota formal, a proxima etapa e ligar a ponte condicional Lean a um
verificador externo das enclosures ou a uma formalizacao intervalar futura.
