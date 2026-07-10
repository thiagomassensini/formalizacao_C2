# Audit Projected J0 Atlas Scout

Data: 2026-07-08.

Rota: Genuine-First. Este relatorio registra um scout numerico para escolher
caixas candidatas a certificados futuros. Os CSVs e JSONs abaixo nao sao prova:
eles apenas indicam onde vale tentar certificados intervalares ou geometricos.

## Script

Criado:

```text
operadores/c2_projected_j0_atlas_scout.py
```

O script reutiliza o avaliador finito e os helpers de fase ja existentes em
`operadores/`. Para cada ponto ele reconstruiu:

```text
M_complex
D0_complex, D1_complex, D2_complex, D3_complex
Drest_complex = D1 + D2 + D3
RvecTail_complex = vertical_tail + tilt_tail + horizontal_tail + cutoff
```

e emitiu, por ponto:

```text
main_abs
d0_neg_re_main
d0_destructive_numerator
parallel_exact
rest_combined
rest_separate
bounded_surplus_combined
bounded_surplus_separate
angle_D0_vs_M
angle_Drest_vs_M
failure_class
```

Por caixa, o scout usa constantes amostradas:

```text
mainNormLowerConst     = min main_abs
numeratorUpperConst    = max d0_destructive_numerator
parallelUpperConst     = numeratorUpperConst / mainNormLowerConst
restUpperCombinedConst = max rest_combined
restUpperSeparateConst = max rest_separate
```

O budget combinado por caixa e:

```text
mainNormLowerConst - parallelUpperConst - restUpperCombinedConst
```

## Saidas geradas

Padrao de saida:

```text
audit_outputs/c2_projected_j0_atlas_scout_<label>_points.csv
audit_outputs/c2_projected_j0_atlas_scout_<label>_boxes.csv
audit_outputs/c2_projected_j0_atlas_scout_<label>.json
```

Rodadas executadas:

| label | pontos | caixas | combined passa | separate passa | modos recomendados | budget combined min/max |
|---|---:|---:|---:|---:|---|---:|
| `bad_window_sigma05_t11p5_13_w010` | 1501 | 151 | 0 | 0 | `fail_parallel`: 151 | -9.609990e-01 / -1.135730e-01 |
| `bad_window_sigma05_t11p5_13_w005` | 1501 | 301 | 0 | 0 | `fail_parallel`: 301 | -9.432754e-01 / -1.058297e-01 |
| `phase_valley_sigma05_t24p5_25p5_w010` | 1001 | 101 | 0 | 0 | `fail_parallel`: 101 | -3.203249e-01 / -6.388590e-02 |
| `phase_valley_sigma05_t24p5_25p5_w005` | 1001 | 201 | 0 | 0 | `fail_parallel`: 201 | -3.081811e-01 / -6.116517e-02 |
| `valley47_sigma05_t47p5_48p5_w010` | 1001 | 101 | 19 | 19 | `combined`: 19, `split_needed`: 4, `fail_parallel`: 78 | -2.268794e-01 / 1.445582e-01 |
| `valley47_sigma05_t47p5_48p5_w005` | 1001 | 201 | 41 | 41 | `combined`: 41, `split_needed`: 4, `fail_parallel`: 156 | -2.201781e-01 / 1.515872e-01 |
| `seed_hurts_sigma0740_t14p25_14p35_w005` | 101 | 21 | 2 | 1 | `combined`: 2, `split_needed`: 2, `fail_parallel`: 17 | -4.051045e-02 / 4.250819e-03 |
| `seed_hurts_sigma0740_t14p25_14p35_w002` | 101 | 51 | 6 | 5 | `combined`: 6, `split_needed`: 2, `fail_parallel`: 43 | -3.851259e-02 / 4.250819e-03 |
| `positive_box_sigmas084_086_t32p82_32p86_w005` | 123 | 27 | 27 | 27 | `combined`: 27 | 5.804244e-02 / 6.426371e-02 |

Somando todas as rodadas diagnosticas, 95 de 1155 caixas passam no budget
combined por constantes, e 93 de 1155 passam na variante separate. Como algumas
rodadas sao a mesma janela com larguras diferentes, esse total nao deve ser
lido como cobertura disjunta.

Considerando apenas a subdivisao mais fina de cada janela obrigatoria, 74 de
781 caixas passam no combined, e 73 de 781 passam no separate.

## Onde o budget estoura

Piores caixas nas subdivisoes mais finas:

| janela | pior caixa | budget | main lower | parallel upper | rest combined | classe |
|---|---|---:|---:|---:|---:|---|
| 11.5-13.0, sigma 0.5 | `t=[11.500,11.504]` | -9.432754e-01 | 7.998550e-01 | 1.317399e+00 | 4.257319e-01 | `fail_parallel` |
| 24.5-25.5, sigma 0.5 | `t=[24.500,24.504]` | -3.081811e-01 | 3.501325e-01 | 5.063098e-01 | 1.520038e-01 | `fail_parallel` |
| 47.5-48.5, sigma 0.5 | `t=[48.235,48.239]` | -2.201781e-01 | 1.305198e-01 | 2.717584e-01 | 7.893947e-02 | `fail_parallel` |
| seed_hurts, sigma 0.740 | `t=[14.250,14.251]` | -3.851259e-02 | 4.379680e-02 | 6.393499e-02 | 1.837439e-02 | `fail_parallel` |
| positive-box | `sigma=0.84, t=32.860` | 5.804244e-02 | 6.113583e-02 | 0.000000e+00 | 3.093384e-03 | `combined` |

O estouro principal e `parallelUpper`, nao `restUpper`. Nas janelas ruins o
resto tambem custa, mas nao e o termo dominante no fracasso das constantes.

## Efeito da subdivisao

Subdividir melhora o budget, mas de modo diferente por janela:

```text
11.5-13.0: 0 -> 0 caixas combined, max budget -0.1136 -> -0.1058
24.5-25.5: 0 -> 0 caixas combined, max budget -0.0639 -> -0.0612
47.5-48.5: 19 -> 41 caixas combined, max budget 0.1446 -> 0.1516
seed_hurts: 2 -> 6 caixas combined, max budget permanece 0.00425
```

Leitura: em 47.5-48.5 e seed_hurts, a largura da caixa e parte real do custo
e a subdivisao ajuda. Nas janelas 11.5-13.0 e 24.5-25.5, a subdivisao testada
nao muda a classe: o custo paralelo continua maior que o budget disponivel.

## Seed hurts phase

A janela `seed_hurts_sigma0740_t14p25_14p35` melhora com `box_t_width=0.002`,
mas 43 de 51 caixas ainda ficam em `fail_parallel`. Isso sugere que uma
subdivisao ainda mais fina pode certificar pequenos bolsos positivos, mas nao
resolve a janela como um todo. Para cobertura robusta, a proxima tentativa deve
considerar seed/tilt diferente ou um bound geometrico que reduza o numerador
destrutivo.

## Positive-box

A positive-box passou integralmente:

```text
27 / 27 caixas combined
27 / 27 caixas separate
budget combined minimo = 5.804244e-02
```

Nesta janela amostrada, `parallelUpperConst` ficou zero nas piores caixas,
porque o numerador destrutivo de `D0` nao foi positivo nos pontos amostrados.
Ela e a melhor candidata imediata para um certificado intervalar por caixa.

## Recomendacao

1. Para positive-box e bolsos positivos da janela 47.5-48.5, o proximo passo
   natural e certificado intervalar por caixa para `numeratorUpperConst`,
   `mainNormLowerConst` e `restUpperConst`.
2. Para as janelas 11.5-13.0 e 24.5-25.5, o scout indica que so subdividir nao
   basta na escala testada. A prioridade deve ser reduzir o numerador destrutivo
   por geometria branch/tilt/half-disk ou trocar o seed.
3. Para seed_hurts, usar subdivisao para isolar bolsos positivos, mas tratar o
   restante como problema de seed/fase.
4. A variante separate nao melhora o budget numerico; ela e util como porta
   formal conservadora, mas o caminho principal deve continuar com rest
   combined quando houver certificado.

## Verificacao

Comandos executados:

```bash
python3 -m py_compile operadores/c2_projected_j0_atlas_scout.py
```

As rodadas obrigatorias foram executadas com `K=16`, `M=12001`, `ref-K=17`,
`ref-M=16001`, regularizacao supergaussian com `X=10661`, `p=2` nos tres
canais finitos usados pelo scout.
