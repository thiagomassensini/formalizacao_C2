# AUDIT_ADJUSTED_QUARTET_TILT_BREAKDOWN

Data: 2026-07-08

## Escopo

Abrir a contabilidade fina do adjusted quartet tilt-aware para descobrir onde a
contribuicao orientada do seed/tilt esta sendo engolida.

Regra de ouro:

```text
Genuine-First. Nao usar zeta, riemannZeta, ExactZeta, zetaUpper, zetaDepthCore,
equacao funcional, formula explicita, comparacao externa com zeros, nem alturas
de zeros como input analitico.
```

Este arquivo registra diagnostico numerico de operador finito. Ele nao fecha o
middle e nao promove CSV a prova.

## Script

Criado:

```text
operadores/c2_adjusted_quartet_tilt_breakdown.py
```

O script reutiliza `c2_adjusted_quartet_evaluator.py` e expoe, ponto a ponto:

```text
main_base
seed_complex_re / seed_complex_im / seed_abs
prefix_abs
seed_prefix_norm_tax
main_seeded_oriented
oriented_gain
tail_without_tilt
tilt_tail_upper
vertical_tail
horizontal_tail
horizontal_defect
cutoff_budget
defect_total
surplus_no_tilt
surplus_tilt_norm_only
surplus_tilt_oriented
norm_tax
net_oriented_gain
failure_class
```

Formula usada para o ledger orientado:

```text
main_base = |q^2 * prefix|
main_seeded_oriented = |(q^2 + seed) * prefix|
oriented_gain = main_seeded_oriented - main_base

tail_without_tilt = vertical_tail + horizontal_tail + cutoff_budget
norm_tax = seed_prefix_norm_tax + tilt_tail_upper
defect_total = horizontal_defect

surplus_no_tilt =
  main_base - defect_total - tail_without_tilt

surplus_tilt_norm_only =
  main_base - defect_total - tail_without_tilt
  - seed_prefix_norm_tax - tilt_tail_upper

surplus_tilt_oriented =
  main_seeded_oriented - defect_total - tail_without_tilt
  - tilt_tail_upper
```

Observacao: `surplus_tilt_oriented` preserva o seed dentro do principal antes
do modulo, mas ainda paga `tilt_tail_upper` como cauda separada, em fidelidade
ao evaluator atual.

## CSVs

```text
audit_outputs/c2_adjusted_quartet_tilt_breakdown_local_sigma0740_t14p25_14p35.csv
audit_outputs/c2_adjusted_quartet_tilt_breakdown_positive_box_084_086_t32p82_32p86.csv
audit_outputs/c2_adjusted_quartet_tilt_breakdown_bad_window_sigma05_t11p5_13.csv
audit_outputs/c2_adjusted_quartet_tilt_breakdown_phase_valley_sigma05_t24p5_25p5.csv
audit_outputs/c2_adjusted_quartet_tilt_breakdown_phase_valley_sigma05_t47p5_48p5.csv
```

## Comandos Rodados

Smoke local ajustado:

```bash
python3 operadores/c2_adjusted_quartet_tilt_breakdown.py \
  --label local_sigma0740_t14p25_14p35 \
  --sigmas 0.740 \
  --t-min 14.25 --t-max 14.35 --dt 0.001 \
  --K 16 --M 12001 --ref-K 17 --ref-M 16001 \
  --reference-mode supergaussian --reference-X 10661 --reference-p 2 \
  --target-reference-mode supergaussian --target-reference-X 10661 --target-reference-p 2 \
  --odd-reference-mode supergaussian --odd-ref-M 16001 \
  --odd-reference-X 10661 --odd-reference-p 2 \
  --threads 56 --top 10 \
  --csv audit_outputs/c2_adjusted_quartet_tilt_breakdown_local_sigma0740_t14p25_14p35.csv
```

Positive-box:

```bash
python3 operadores/c2_adjusted_quartet_tilt_breakdown.py \
  --label positive_box_084_086_t32p82_32p86 \
  --sigmas 0.84,0.85,0.86 \
  --t-min 32.82 --t-max 32.86 --dt 0.001 \
  --K 16 --M 12001 --ref-K 17 --ref-M 16001 \
  --reference-mode supergaussian --reference-X 10661 --reference-p 2 \
  --target-reference-mode supergaussian --target-reference-X 10661 --target-reference-p 2 \
  --odd-reference-mode supergaussian --odd-ref-M 16001 \
  --odd-reference-X 10661 --odd-reference-p 2 \
  --threads 56 --top 10 \
  --csv audit_outputs/c2_adjusted_quartet_tilt_breakdown_positive_box_084_086_t32p82_32p86.csv
```

Janela ruim:

```bash
python3 operadores/c2_adjusted_quartet_tilt_breakdown.py \
  --label bad_window_sigma05_t11p5_13 \
  --sigmas 0.5 \
  --t-min 11.5 --t-max 13.0 --dt 0.001 \
  --K 16 --M 12001 --ref-K 17 --ref-M 16001 \
  --reference-mode supergaussian --reference-X 10661 --reference-p 2 \
  --target-reference-mode supergaussian --target-reference-X 10661 --target-reference-p 2 \
  --odd-reference-mode supergaussian --odd-ref-M 16001 \
  --odd-reference-X 10661 --odd-reference-p 2 \
  --threads 56 --top 10 \
  --csv audit_outputs/c2_adjusted_quartet_tilt_breakdown_bad_window_sigma05_t11p5_13.csv
```

Vales de fase:

```bash
python3 operadores/c2_adjusted_quartet_tilt_breakdown.py \
  --label phase_valley_sigma05_t24p5_25p5 \
  --sigmas 0.5 \
  --t-min 24.5 --t-max 25.5 --dt 0.001 \
  --K 16 --M 12001 --ref-K 17 --ref-M 16001 \
  --reference-mode supergaussian --reference-X 10661 --reference-p 2 \
  --target-reference-mode supergaussian --target-reference-X 10661 --target-reference-p 2 \
  --odd-reference-mode supergaussian --odd-ref-M 16001 \
  --odd-reference-X 10661 --odd-reference-p 2 \
  --threads 28 --top 10 \
  --csv audit_outputs/c2_adjusted_quartet_tilt_breakdown_phase_valley_sigma05_t24p5_25p5.csv

python3 operadores/c2_adjusted_quartet_tilt_breakdown.py \
  --label phase_valley_sigma05_t47p5_48p5 \
  --sigmas 0.5 \
  --t-min 47.5 --t-max 48.5 --dt 0.001 \
  --K 16 --M 12001 --ref-K 17 --ref-M 16001 \
  --reference-mode supergaussian --reference-X 10661 --reference-p 2 \
  --target-reference-mode supergaussian --target-reference-X 10661 --target-reference-p 2 \
  --odd-reference-mode supergaussian --odd-ref-M 16001 \
  --odd-reference-X 10661 --odd-reference-p 2 \
  --threads 28 --top 10 \
  --csv audit_outputs/c2_adjusted_quartet_tilt_breakdown_phase_valley_sigma05_t47p5_48p5.csv
```

## Resumo Por Janela

| janela | linhas | classes | pior `surplus_tilt_oriented` | leitura |
|---|---:|---|---:|---|
| local sigma 0.740, t 14.25..14.35 | 101 | 52 `seed_hurts_phase`, 49 `seed_helps_but_norm_tax_eats` | -7.150135e-02 | metade inicial fere fase; metade final ajuda, mas a taxa e o defeito comem |
| positive-box 0.84..0.86, t 32.82..32.86 | 123 | 123 `pass` | +4.399507e-02 | regiao ja folgada; oriented nao e necessario para passar |
| janela ruim sigma 0.5, t 11.5..13.0 | 1501 | 1501 `seed_helps_but_norm_tax_eats` | -1.307692e+00 | seed ajuda em todos os pontos, mas perde para `horizontal_defect` e `norm_tax` |
| vale sigma 0.5, t 24.5..25.5 | 1001 | 1001 `seed_helps_but_norm_tax_eats` | -4.385581e-01 | seed ajuda, mas o ganho liquido fica negativo |
| vale sigma 0.5, t 47.5..48.5 | 1001 | 73 `pass`, 928 `seed_helps_but_norm_tax_eats` | -3.098453e-01 | parte passa; maioria ainda perde para defeito horizontal e taxacao |

Contagem total:

| classe | linhas |
|---|---:|
| `seed_helps_but_norm_tax_eats` | 3479 |
| `pass` | 196 |
| `seed_hurts_phase` | 52 |

## Piores Pontos Por Janela

| CSV | sigma | t | surplus oriented | gain | norm_tax | horizontal_defect | tilt_tail | cutoff | classe |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---|
| local 14.25..14.35 | 0.740 | 14.250 | -7.150135e-02 | -2.657797e-02 | 9.793367e-02 | 1.119550e-01 | 1.409218e-03 | 3.635165e-11 | `seed_hurts_phase` |
| positive-box | 0.840 | 32.860 | +4.399507e-02 | -3.541714e-03 | 5.435627e-03 | 1.632693e-02 | 5.482529e-05 | 1.042790e-11 | `pass` |
| ruim 11.5..13.0 | 0.500 | 12.237 | -1.307692e+00 | +5.573462e-01 | 7.797200e-01 | 1.911235e+00 | 2.243396e-02 | 4.914102e-10 | `seed_helps_but_norm_tax_eats` |
| vale 24.5..25.5 | 0.500 | 24.500 | -4.385581e-01 | +2.424360e-01 | 2.610222e-01 | 7.663816e-01 | 7.122907e-03 | 4.467917e-10 | `seed_helps_but_norm_tax_eats` |
| vale 47.5..48.5 | 0.500 | 48.271 | -3.098453e-01 | +1.887305e-02 | 2.281406e-01 | 4.171096e-01 | 6.413846e-03 | 3.417982e-10 | `seed_helps_but_norm_tax_eats` |

## Top 10: `oriented_gain > 0` Mas Ainda Falha

Todos os dez piores pontos aparecem na janela ruim `sigma=0.5`, `t` perto de
12.237.

| t | surplus oriented | oriented_gain | norm_tax | horizontal_defect | classe |
|---:|---:|---:|---:|---:|---|
| 12.237 | -1.307692e+00 | +5.573462e-01 | 7.797200e-01 | 1.911235e+00 | `seed_helps_but_norm_tax_eats` |
| 12.236 | -1.307681e+00 | +5.575195e-01 | 7.802986e-01 | 1.911390e+00 | `seed_helps_but_norm_tax_eats` |
| 12.238 | -1.307660e+00 | +5.572171e-01 | 7.791689e-01 | 1.911079e+00 | `seed_helps_but_norm_tax_eats` |
| 12.235 | -1.307626e+00 | +5.577370e-01 | 7.809046e-01 | 1.911546e+00 | `seed_helps_but_norm_tax_eats` |
| 12.239 | -1.307585e+00 | +5.571322e-01 | 7.786455e-01 | 1.910923e+00 | `seed_helps_but_norm_tax_eats` |
| 12.234 | -1.307528e+00 | +5.579987e-01 | 7.815381e-01 | 1.911702e+00 | `seed_helps_but_norm_tax_eats` |
| 12.240 | -1.307466e+00 | +5.570914e-01 | 7.781496e-01 | 1.910768e+00 | `seed_helps_but_norm_tax_eats` |
| 12.233 | -1.307387e+00 | +5.583047e-01 | 7.821989e-01 | 1.911858e+00 | `seed_helps_but_norm_tax_eats` |
| 12.241 | -1.307304e+00 | +5.570948e-01 | 7.776814e-01 | 1.910612e+00 | `seed_helps_but_norm_tax_eats` |
| 12.232 | -1.307201e+00 | +5.586548e-01 | 7.828869e-01 | 1.912013e+00 | `seed_helps_but_norm_tax_eats` |

Leitura: a coleta orientada ajuda de forma real, mas nao o bastante. O maior
vazamento nao e cutoff; e `horizontal_defect`, acompanhado de `norm_tax`.

## Top 10: `seed_hurts_phase`

Todos os pontos `seed_hurts_phase` aparecem no smoke local `sigma=0.740`,
inicio da janela `t=14.25..14.35`.

| t | surplus oriented | oriented_gain | norm_tax | horizontal_defect | classe |
|---:|---:|---:|---:|---:|---|
| 14.250 | -7.150135e-02 | -2.657797e-02 | 9.793367e-02 | 1.119550e-01 | `seed_hurts_phase` |
| 14.251 | -7.097799e-02 | -2.606932e-02 | 9.798376e-02 | 1.119452e-01 | `seed_hurts_phase` |
| 14.252 | -7.045304e-02 | -2.555910e-02 | 9.803347e-02 | 1.119354e-01 | `seed_hurts_phase` |
| 14.253 | -6.992662e-02 | -2.504740e-02 | 9.808278e-02 | 1.119256e-01 | `seed_hurts_phase` |
| 14.254 | -6.939880e-02 | -2.453433e-02 | 9.813170e-02 | 1.119158e-01 | `seed_hurts_phase` |
| 14.255 | -6.886970e-02 | -2.401998e-02 | 9.818021e-02 | 1.119060e-01 | `seed_hurts_phase` |
| 14.256 | -6.833938e-02 | -2.350442e-02 | 9.822831e-02 | 1.118962e-01 | `seed_hurts_phase` |
| 14.257 | -6.780794e-02 | -2.298776e-02 | 9.827600e-02 | 1.118864e-01 | `seed_hurts_phase` |
| 14.258 | -6.727545e-02 | -2.247006e-02 | 9.832326e-02 | 1.118766e-01 | `seed_hurts_phase` |
| 14.259 | -6.674201e-02 | -2.195141e-02 | 9.837010e-02 | 1.118668e-01 | `seed_hurts_phase` |

Leitura: aqui o problema nao e apenas taxacao. A fase do seed no adjusted main
esta errada no inicio da janela.

## Respostas Tecnicas

### 1. O seed/tilt orientado aumenta o main nos pontos ruins?

Sim, na maior parte dos gargalos. Ele aumenta em todos os pontos da janela
`11.5..13.0`, em todos os pontos do vale `24.5..25.5`, e em todos os pontos do
vale `47.5..48.5`. No smoke `sigma=0.740`, porem, 52 de 101 pontos tem
`oriented_gain < 0`.

### 2. Quando aumenta, quem come o ganho?

Principalmente `horizontal_defect`, com `norm_tax` ainda maior que
`oriented_gain` nas falhas classificadas. `cutoff_budget` ficou na escala
`1e-10` ou menor nas piores linhas, portanto nao e o vilao destas rodadas.
`tilt_tail_upper` existe, mas e pequeno diante de `horizontal_defect` e da taxa
norm-only total.

### 3. O norm-only sempre piora, como no center Gaussian?

Sim no sentido operacional deste ledger: `surplus_tilt_norm_only` subtrai
`seed_prefix_norm_tax + tilt_tail_upper` do baseline, entao ele sempre piora ou
empata. O experimento confirma que tratar o seed/tilt como boleto bruto e uma
taxa pesada nas janelas ruins.

### 4. O oriented melhora so onde a regiao ja estava folgada?

Nao. Ele tambem melhora nos gargalos `sigma=0.5`, inclusive onde o surplus
continua negativo. A melhora nao e suficiente na forma atual, mas nao esta
restrita a positive-box.

### 5. Existe alguma janela onde a coleta orientada aponta rota real para half-disk/quartet?

Sim, como diagnostico: os vales `24.5..25.5` e `47.5..48.5` mostram que a
coleta orientada produz ganho sistematico. No vale `47.5..48.5`, 73 pontos ja
passam. A rota real nao e "ajustar cutoff"; e separar a moeda horizontal do
seed/tilt para nao pagar a mesma geometria como imposto.

### 6. A falha parece classificacao contabil ou falta bruta de tamanho?

As duas coisas aparecem, mas em lugares diferentes.

No smoke `sigma=0.740`, ha falha de fase em parte da janela:
`seed_hurts_phase`. Ali precisa ajustar a coleta orientada do seed.

Nas janelas `sigma=0.5`, o seed ajuda, mas a forma atual ainda tem falta bruta
de tamanho contra `horizontal_defect` e contra `norm_tax`. Isso parece menos
um problema de cutoff e mais uma contabilidade horizontal ainda grossa.

## Recomendacao

Proximo passo recomendado:

```text
e) migrar para half-disk/quartet com moeda branch/tilt,
   mas antes isolar uma forma Lean pequena para a moeda horizontal.
```

Prioridade tecnica:

```text
1. atacar horizontal_defect;
2. reduzir ou reclassificar seed_prefix_norm_tax/tilt_tail_upper;
3. ajustar a fase da coleta orientada do seed onde aparece seed_hurts_phase;
4. nao investir em cutoff como frente principal;
5. nao vender o adjusted quartet direto nesta forma como prova.
```

Forma Lean sugerida, ainda pequena:

```text
um lemma de contabilidade pointwise que separa:

main_seeded_oriented
  > horizontal_defect
    + vertical_tail
    + horizontal_tail
    + tilt_tail_upper
    + cutoff_budget

mas com uma moeda branch/tilt explicita para substituir parte de
horizontal_defect ou seed_prefix_norm_tax, em vez de pagar tudo por norma.
```

Conclusao curta:

```text
O tilt orientado nao esta morto no adjusted quartet. Ele aparece nos gargalos.
Mas a forma atual ainda joga margem fora: primeiro por fase ruim em uma janela
local, depois por defeito horizontal grande e taxacao norm-only do seed/tilt.
```
