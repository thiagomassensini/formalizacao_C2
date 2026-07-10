# AUDIT_ADJUSTED_QUARTET_HORIZONTAL_DEFECT_BREAKDOWN

Data: 2026-07-08

## Escopo

Abrir o `horizontal_defect` do adjusted quartet por camada e por fase/projecao,
para distinguir gargalo real de gargalo criado por pagar vetor complexo como
modulo bruto.

Regra de ouro:

```text
Genuine-First. Nao usar zeta, riemannZeta, ExactZeta, zetaUpper, zetaDepthCore,
equacao funcional, formula explicita, comparacao externa com zeros, nem alturas
de zeros como input analitico.
```

Este arquivo e diagnostico numerico de operador finito. Ele nao fecha o middle,
nao substitui prova formal e nao promove CSV a teorema.

## Script

Criado:

```text
operadores/c2_adjusted_quartet_horizontal_defect_breakdown.py
```

O script reutiliza os mesmos objetos finitos de
`operadores/c2_adjusted_quartet_evaluator.py`:

```text
q
prefix = 1 + q + q^2 + q^3
horizontal_delta = odd_core - odd_ref
seed = (-vertical_rectangular_residual - horizontal_defect_seed_complex) * (1-q)
```

As quatro camadas horizontais expostas sao:

```text
D_j = 2 * q^(j+2) * horizontal_delta, j = 0,1,2,3
D = D_0 + D_1 + D_2 + D_3
horizontal_defect_total_abs = sum_j |D_j|
```

Definicao da projecao destrutiva contra um main complexo `M`:

```text
destructive_parallel(D,M) =
  max(0, -Re(D * conj(M / |M|)))
```

A parte perpendicular e a magnitude da componente imaginaria nessa base
rotacionada.

Saldos comparados:

```text
surplus_current_oriented =
  main_seeded_oriented
  - horizontal_defect_total_abs
  - tail_without_tilt
  - tilt_tail_upper

surplus_projected_parallel =
  main_seeded_oriented
  - destructive_parallel(D, main_seeded_complex)
  - tail_without_tilt
  - tilt_tail_upper

surplus_projected_phase_aware =
  main_seeded_oriented
  - max(0, |M| - |M + D|)
  - tail_without_tilt
  - tilt_tail_upper
```

Observacao: `phase_aware` usa a perda radial real do defeito complexo conhecido.
Isso e diagnostico para encontrar moeda de fase; ainda nao e automaticamente
uma cota formal reutilizavel no Lean.

## CSVs

```text
audit_outputs/c2_adjusted_quartet_horizontal_defect_breakdown_bad_window_sigma05_t11p5_13.csv
audit_outputs/c2_adjusted_quartet_horizontal_defect_breakdown_phase_valley_sigma05_t24p5_25p5.csv
audit_outputs/c2_adjusted_quartet_horizontal_defect_breakdown_phase_valley_sigma05_t47p5_48p5.csv
audit_outputs/c2_adjusted_quartet_horizontal_defect_breakdown_local_sigma0740_t14p25_14p35.csv
audit_outputs/c2_adjusted_quartet_horizontal_defect_breakdown_positive_box_084_086_t32p82_32p86.csv
```

## Comandos Rodados

Janela ruim:

```bash
python3 operadores/c2_adjusted_quartet_horizontal_defect_breakdown.py \
  --label hdef_bad_window_sigma05_t11p5_13 \
  --sigmas 0.5 \
  --t-min 11.5 --t-max 13.0 --dt 0.001 \
  --K 16 --M 12001 --ref-K 17 --ref-M 16001 \
  --reference-mode supergaussian --reference-X 10661 --reference-p 2 \
  --target-reference-mode supergaussian --target-reference-X 10661 --target-reference-p 2 \
  --odd-reference-mode supergaussian --odd-ref-M 16001 \
  --odd-reference-X 10661 --odd-reference-p 2 \
  --threads 56 --top 10 \
  --csv audit_outputs/c2_adjusted_quartet_horizontal_defect_breakdown_bad_window_sigma05_t11p5_13.csv
```

Vales de fase:

```bash
python3 operadores/c2_adjusted_quartet_horizontal_defect_breakdown.py \
  --label hdef_phase_valley_sigma05_t24p5_25p5 \
  --sigmas 0.5 \
  --t-min 24.5 --t-max 25.5 --dt 0.001 \
  --K 16 --M 12001 --ref-K 17 --ref-M 16001 \
  --reference-mode supergaussian --reference-X 10661 --reference-p 2 \
  --target-reference-mode supergaussian --target-reference-X 10661 --target-reference-p 2 \
  --odd-reference-mode supergaussian --odd-ref-M 16001 \
  --odd-reference-X 10661 --odd-reference-p 2 \
  --threads 28 --top 10 \
  --csv audit_outputs/c2_adjusted_quartet_horizontal_defect_breakdown_phase_valley_sigma05_t24p5_25p5.csv

python3 operadores/c2_adjusted_quartet_horizontal_defect_breakdown.py \
  --label hdef_phase_valley_sigma05_t47p5_48p5 \
  --sigmas 0.5 \
  --t-min 47.5 --t-max 48.5 --dt 0.001 \
  --K 16 --M 12001 --ref-K 17 --ref-M 16001 \
  --reference-mode supergaussian --reference-X 10661 --reference-p 2 \
  --target-reference-mode supergaussian --target-reference-X 10661 --target-reference-p 2 \
  --odd-reference-mode supergaussian --odd-ref-M 16001 \
  --odd-reference-X 10661 --odd-reference-p 2 \
  --threads 28 --top 10 \
  --csv audit_outputs/c2_adjusted_quartet_horizontal_defect_breakdown_phase_valley_sigma05_t47p5_48p5.csv
```

Janela `seed_hurts_phase`:

```bash
python3 operadores/c2_adjusted_quartet_horizontal_defect_breakdown.py \
  --label hdef_local_sigma0740_t14p25_14p35 \
  --sigmas 0.740 \
  --t-min 14.25 --t-max 14.35 --dt 0.001 \
  --K 16 --M 12001 --ref-K 17 --ref-M 16001 \
  --reference-mode supergaussian --reference-X 10661 --reference-p 2 \
  --target-reference-mode supergaussian --target-reference-X 10661 --target-reference-p 2 \
  --odd-reference-mode supergaussian --odd-ref-M 16001 \
  --odd-reference-X 10661 --odd-reference-p 2 \
  --threads 28 --top 10 \
  --csv audit_outputs/c2_adjusted_quartet_horizontal_defect_breakdown_local_sigma0740_t14p25_14p35.csv
```

Positive-box:

```bash
python3 operadores/c2_adjusted_quartet_horizontal_defect_breakdown.py \
  --label hdef_positive_box_084_086_t32p82_32p86 \
  --sigmas 0.84,0.85,0.86 \
  --t-min 32.82 --t-max 32.86 --dt 0.001 \
  --K 16 --M 12001 --ref-K 17 --ref-M 16001 \
  --reference-mode supergaussian --reference-X 10661 --reference-p 2 \
  --target-reference-mode supergaussian --target-reference-X 10661 --target-reference-p 2 \
  --odd-reference-mode supergaussian --odd-ref-M 16001 \
  --odd-reference-X 10661 --odd-reference-p 2 \
  --threads 28 --top 10 \
  --csv audit_outputs/c2_adjusted_quartet_horizontal_defect_breakdown_positive_box_084_086_t32p82_32p86.csv
```

## Resumo Por Janela

| janela | linhas | camada dominante | pass atual/projetado/phase-aware | classe principal | pior saldo atual |
|---|---:|---|---:|---|---:|
| sigma 0.5, t 11.5..13.0 | 1501 | j0 em 1501 | 0 / 784 / 1501 | `phase_aware_would_pass` | -1.307692e+00 |
| sigma 0.5, t 24.5..25.5 | 1001 | j0 em 1001 | 0 / 571 / 849 | `phase_aware_would_pass` | -4.385581e-01 |
| sigma 0.5, t 47.5..48.5 | 1001 | j0 em 1001 | 73 / 354 / 944 | `phase_aware_would_pass` | -3.098453e-01 |
| sigma 0.740, t 14.25..14.35 | 101 | j0 em 101 | 0 / 92 / 101 | `seed_phase_hurts` e `phase_aware_would_pass` | -7.150135e-02 |
| positive-box 0.84..0.86 | 123 | j0 em 123 | 123 / 123 / 123 | `pass_current` | +4.399507e-02 |

Contagem total:

| classe refinada | linhas |
|---|---:|
| `phase_aware_would_pass` | 3270 |
| `pass_current` | 196 |
| `mixed_phase_failure` | 194 |
| `seed_phase_hurts` | 52 |
| `tilt_tail_still_dominates` | 15 |

Camada dominante:

| camada | linhas |
|---|---:|
| `j0` | 3727 |

## Medias De Projecao

| janela | media norma bruta | media paralelo destrutivo | media perda phase-aware | angulo medio defeito vs seeded |
|---|---:|---:|---:|---:|
| 11.5..13.0 | 1.909785e+00 | 9.969919e-01 | 6.904665e-01 | 167.79 |
| 24.5..25.5 | 7.613721e-01 | 4.686967e-01 | 3.999163e-01 | 172.07 |
| 47.5..48.5 | 4.155218e-01 | 2.190188e-01 | 1.244860e-01 | 161.34 |
| 14.25..14.35 | 1.114657e-01 | 4.770203e-02 | 2.283477e-02 | 140.41 |
| positive-box | 1.468549e-02 | 0.000000e+00 | 0.000000e+00 | 62.48 |

Leitura: o defeito horizontal tem componente destrutiva real, especialmente em
`sigma=0.5`, mas a soma de normas por camada paga muito mais do que a perda
radial efetiva. No positive-box, o defeito nem aponta contra o main seeded.

## Piores Pontos Por Janela

| janela | sigma | t | atual | projetado | phase-aware | norma bruta | paralelo | phase-cost | angulo defeito | classe |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---|
| 11.5..13.0 | 0.5 | 12.237 | -1.307692e+00 | -4.204871e-01 | +3.090020e-01 | 1.911235e+00 | 1.024029e+00 | 2.945404e-01 | 179.52 | `phase_aware_would_pass` |
| 24.5..25.5 | 0.5 | 24.500 | -4.385581e-01 | -6.352516e-02 | +1.689261e-01 | 7.663816e-01 | 3.913486e-01 | 1.588973e-01 | 154.49 | `phase_aware_would_pass` |
| 47.5..48.5 | 0.5 | 48.271 | -3.098453e-01 | -1.168781e-01 | +9.490205e-02 | 4.171096e-01 | 2.241424e-01 | 1.236229e-02 | 168.32 | `phase_aware_would_pass` |
| 14.25..14.35 | 0.740 | 14.250 | -7.150135e-02 | -4.829639e-03 | +3.916635e-02 | 1.119550e-01 | 4.528325e-02 | 1.287269e-03 | 136.83 | `seed_phase_hurts` |
| positive-box | 0.840 | 32.860 | +4.399507e-02 | +6.032200e-02 | +6.032200e-02 | 1.632693e-02 | 0.000000e+00 | 0.000000e+00 | 49.79 | `pass_current` |

## Top 10: Maior Ganho De Projecao Em Pontos Que Falham No Ledger Atual

Todos aparecem na janela `sigma=0.5`, perto de `t=12.37`.

| t | ganho projetado | atual | projetado | phase-aware | norma bruta | paralelo | angulo |
|---:|---:|---:|---:|---:|---:|---:|---:|
| 12.376 | 9.546763e-01 | -1.016273e+00 | -6.159719e-02 | +2.888442e-01 | 1.889653e+00 | 9.349763e-01 | 159.54 |
| 12.377 | 9.546739e-01 | -1.013282e+00 | -5.860781e-02 | +2.886584e-01 | 1.889498e+00 | 9.348239e-01 | 159.54 |
| 12.375 | 9.546686e-01 | -1.019267e+00 | -6.459883e-02 | +2.890297e-01 | 1.889807e+00 | 9.351389e-01 | 159.54 |
| 12.378 | 9.546616e-01 | -1.010292e+00 | -5.563082e-02 | +2.884724e-01 | 1.889343e+00 | 9.346814e-01 | 159.55 |
| 12.374 | 9.546508e-01 | -1.022263e+00 | -6.761263e-02 | +2.892149e-01 | 1.889962e+00 | 9.353116e-01 | 159.54 |
| 12.379 | 9.546394e-01 | -1.007306e+00 | -5.266632e-02 | +2.882861e-01 | 1.889188e+00 | 9.345487e-01 | 159.55 |
| 12.373 | 9.546226e-01 | -1.025261e+00 | -7.063844e-02 | +2.893998e-01 | 1.890117e+00 | 9.354946e-01 | 159.54 |
| 12.380 | 9.546075e-01 | -1.004322e+00 | -4.971443e-02 | +2.880995e-01 | 1.889033e+00 | 9.344258e-01 | 159.56 |
| 12.372 | 9.545841e-01 | -1.028260e+00 | -7.367615e-02 | +2.895844e-01 | 1.890272e+00 | 9.356880e-01 | 159.54 |
| 12.381 | 9.545660e-01 | -1.001341e+00 | -4.677524e-02 | +2.879127e-01 | 1.888878e+00 | 9.343125e-01 | 159.57 |

## Pontos Phase-Aware Ainda Falhando

As piores falhas restantes aparecem no vale `24.5..25.5`, perto de `t=25.01`.
Aqui a perda radial efetiva fica praticamente igual ao paralelo destrutivo, ou
seja, nesses pontos a fase nao salva o bastante.

| t | phase-aware | atual | projetado | norma bruta | paralelo | phase-cost | classe |
|---:|---:|---:|---:|---:|---:|---:|---|
| 25.011 | -2.938715e-02 | -3.177750e-01 | -2.941427e-02 | 7.609740e-01 | 4.726133e-01 | 4.725861e-01 | `mixed_phase_failure` |
| 25.010 | -2.911495e-02 | -3.180885e-01 | -2.961302e-02 | 7.609826e-01 | 4.725071e-01 | 4.720091e-01 | `mixed_phase_failure` |
| 25.012 | -2.898680e-02 | -3.174554e-01 | -2.920929e-02 | 7.609654e-01 | 4.727193e-01 | 4.724968e-01 | `mixed_phase_failure` |
| 25.009 | -2.874269e-02 | -3.183958e-01 | -2.980547e-02 | 7.609912e-01 | 4.724009e-01 | 4.713381e-01 | `mixed_phase_failure` |
| 25.013 | -2.858638e-02 | -3.171297e-01 | -2.899812e-02 | 7.609569e-01 | 4.728252e-01 | 4.724135e-01 | `mixed_phase_failure` |

## Respostas Tecnicas

### 1. Qual camada j domina o horizontal_defect?

`j0` domina todas as linhas testadas: 3727/3727. A falha horizontal atual nao
esta distribuida entre camadas do quartet; ela esta concentrada na primeira
camada do prefixo.

### 2. O horizontal_defect esta realmente alinhado contra o main ou a norma esta exagerando?

As duas coisas acontecem.

Em `sigma=0.5`, o defeito frequentemente aponta contra o main seeded: angulos
medios entre 161 e 172 graus nas janelas ruins/vales. Entao existe defeito
destrutivo real.

Mas a norma bruta exagera bastante. Na pior janela `11.5..13.0`, a media da
norma bruta e 1.9098, enquanto a media da componente paralela destrutiva e
0.9970 e a perda radial phase-aware e 0.6905.

### 3. A coleta orientada do seed muda a direcao do main de forma boa ou ruim?

Depende da janela.

Nas janelas `sigma=0.5`, o seed aumenta o main, mas ainda deixa o defeito
horizontal bastante destrutivo. Na janela `sigma=0.740`, o seed fere a fase em
52/101 pontos; o angulo medio do seed contra o main nesses pontos e 144.72
graus, e nos piores pontos fica perto de 155 graus.

No positive-box, existem pontos com `oriented_gain < 0`, mas a regiao ja passa
e o defeito horizontal nao e destrutivo contra o main seeded.

### 4. Nos pontos `seed_hurts_phase`, qual e o angulo entre seed e main?

Na janela `sigma=0.740`, os 52 pontos `seed_hurts_phase` tem angulo medio
`seed vs main` de 144.72 graus. Nos dez piores, o angulo vai de 155.39 para
151.58 graus. Ou seja, o seed esta entrando majoritariamente contra o main
base nesses pontos.

### 5. Nos pontos `seed_helps_but_norm_tax_eats`, o problema e defeito destrutivo real ou projecao grossa?

E misto, mas a projecao grossa e grande.

Na janela `11.5..13.0`, o defeito e quase oposto ao main em muitos pontos, mas
mesmo ali a perda radial efetiva e muito menor que `sum_j |D_j|`. O ledger
atual passa 0/1501; o projetado paralelo passaria 784/1501; o phase-aware
passaria 1501/1501.

Isso diz que pagar `horizontal_defect_total_abs` como soma de modulos e
contabilidade grossa demais para a geometria observada.

### 6. Existe uma moeda phase-aware que poderia substituir `horizontal_defect_total_abs` por componente menor?

Sim, como rota diagnostica. A moeda candidata e uma cota de perda radial ou uma
cota de projecao destrutiva contra `main_seeded_complex`, em vez de
`sum_j |D_j|`.

Forma operacional observada:

```text
horizontal_cost_phase <= max(0, |M| - |M + D|)
```

ou, mais simples para Lean pequeno:

```text
horizontal_cost_parallel <= max(0, -Re(D * conj(M / |M|)))
```

A primeira e mais forte numericamente, mas tambem mais carregada para formalizar.
A segunda e mais simples e ja melhora muito a contabilidade.

### 7. Proximo passo Lean pequeno

Resposta: **a) lemma de projecao/fase para horizontal_defect**, com preparacao
para **b) half-disk/quartet com moeda branch/tilt**.

Nao recomendo abandonar o adjusted quartet direto nessa forma, porque o
diagnostico mostrou que a falha atual e fortemente contabilidade por norma
grossa. Tambem nao recomendo investir em cutoff como frente principal.

## Recomendacao

Proximo passo objetivo:

```text
formalizar um lemma pequeno de livro-caixa vetorial:

se M e o main seeded e D e o defeito horizontal complexo,
entao a perda contra |M| deve ser paga por uma componente projetada/faseada,
nao por sum_j |D_j|.
```

Versao inicial menos ambiciosa:

```text
substituir horizontal_defect_total_abs por uma moeda:

destructive_parallel(D, M)
  + um allowance explicito para a parte perpendicular/fase residual.
```

Tambem vale separar `j0` como frente propria:

```text
D0 = 2 * q^2 * horizontal_delta
```

porque todas as rodadas indicam que a obstrucao horizontal passa por essa
primeira camada.

Conclusao curta:

```text
horizontal_defect e real, mas esta sendo pago caro demais.
O gargalo principal agora parece ser a falta de uma moeda de fase/projecao,
nao cutoff e nao simplesmente falta bruta de tamanho.
```
