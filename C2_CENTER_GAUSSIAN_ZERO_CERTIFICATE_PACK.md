# C2_CENTER_GAUSSIAN_ZERO_CERTIFICATE_PACK

## Status

Este pack consolida as 7 caixas numericamente certificadas do carrier C2 center
Gaussian infinito:

```text
c2CenterGaussianSeries X s
```

para:

```text
X = 66666.66666666667
```

Conclusao permitida:

```text
dentro da certificacao numerica atual, c2CenterGaussianSeries X s tem uma
caixa de zero em cada um dos 7 targets abaixo, para o X fixo testado
```

Esta nao e uma prova formal Lean e nao usa aritmetica intervalar.

## Fontes

Certificacao das caixas finitas:

```text
audit_outputs/c2_center_gaussian_full_depth_boxes/full_depth_zero_box_certification_combined.json
```

Lift por cauda:

```text
audit_outputs/c2_center_gaussian_full_depth_boxes/full_depth_tail_lift.json
```

Relatorios:

```text
AUDIT_C2_CENTER_GAUSSIAN_FULL_DEPTH_BOXES.md
AUDIT_C2_CENTER_GAUSSIAN_TAIL_LIFT.md
```

## Geometria Das Caixas

Todas as caixas usam:

```text
sigma_center = 0.5
sigma_radius = 0.002
t_radius = 0.002
sigma_min = 0.498
```

Perfis full-depth:

```text
fixedX_fullDepth_400k_K18: nmax=400000, K=18
fixedX_fullDepth_800k_K19: nmax=800000, K=19
```

Ambos usam:

```text
X = 66666.66666666667
```

## Resumo Conservador Por Target

A tabela abaixo usa a menor margem e a maior cauda entre os dois perfis
full-depth.

| target | box center t | profiles | winding | min margin | max tail | min margin-tail | max tail/margin | status |
|---:|---:|---:|---:|---:|---:|---:|---:|---|
| 21.022 | 21.022040 | 2 | +1 | 3.2870657715831827e-04 | 1.0455626826621376e-15 | 3.2870657715727272e-04 | 3.1808389467015525e-12 | infinite_zero_box_numeric |
| 32.935 | 32.935060 | 2 | +1 | 1.3525646892630842e-04 | 1.0455626826621376e-15 | 1.3525646892526287e-04 | 7.7302231158480858e-12 | infinite_zero_box_numeric |
| 37.586 | 37.586180 | 2 | +1 | 2.1070742305670032e-04 | 1.0455626826621376e-15 | 2.1070742305565477e-04 | 4.9621540024282009e-12 | infinite_zero_box_numeric |
| 40.919 | 40.918720 | 2 | +1 | 2.1944943729247711e-04 | 1.0455626826621376e-15 | 2.1944943729143156e-04 | 4.7644810374639325e-12 | infinite_zero_box_numeric |
| 43.327 | 43.327070 | 2 | +1 | 3.0296211929920186e-04 | 1.0455626826621376e-15 | 3.0296211929816216e-04 | 3.4511333795811346e-12 | infinite_zero_box_numeric |
| 48.005 | 48.005150 | 2 | +1 | 2.1875498314347249e-04 | 1.0455626826621376e-15 | 2.1875498314242694e-04 | 4.7796062409074158e-12 | infinite_zero_box_numeric |
| 49.774 | 49.773830 | 2 | +1 | 1.7444675251917087e-04 | 1.0455626826621376e-15 | 1.7444675251824447e-04 | 5.9935921280421717e-12 | infinite_zero_box_numeric |

## Detalhe Por Perfil

| profile | target | nmax | K | margin | tail | margin-tail | ratio |
|---|---:|---:|---:|---:|---:|---:|---:|
| fixedX_fullDepth_400k_K18 | 21.022 | 400000 | 18 | 3.2870657715831827e-04 | 1.0455626826621376e-15 | 3.2870657715727272e-04 | 3.1808389467015525e-12 |
| fixedX_fullDepth_800k_K19 | 21.022 | 800000 | 19 | 3.2870657715835687e-04 | 4.6204093614534147e-63 | 3.2870657715835687e-04 | 1.4056333771585889e-59 |
| fixedX_fullDepth_400k_K18 | 32.935 | 400000 | 18 | 1.3525646892630842e-04 | 1.0455626826621376e-15 | 1.3525646892526287e-04 | 7.7302231158480858e-12 |
| fixedX_fullDepth_800k_K19 | 32.935 | 800000 | 19 | 1.3525646892633184e-04 | 4.6204093614534147e-63 | 1.3525646892633184e-04 | 3.4160357712502059e-59 |
| fixedX_fullDepth_400k_K18 | 37.586 | 400000 | 18 | 2.1070742305670032e-04 | 1.0455626826621376e-15 | 2.1070742305565477e-04 | 4.9621540024282009e-12 |
| fixedX_fullDepth_800k_K19 | 37.586 | 800000 | 19 | 2.1070742305711655e-04 | 4.6204093614534147e-63 | 2.1070742305711655e-04 | 2.1928080626760635e-59 |
| fixedX_fullDepth_400k_K18 | 40.919 | 400000 | 18 | 2.1944943729247711e-04 | 1.0455626826621376e-15 | 2.1944943729143156e-04 | 4.7644810374639325e-12 |
| fixedX_fullDepth_800k_K19 | 40.919 | 800000 | 19 | 2.1944943729278264e-04 | 4.6204093614534147e-63 | 2.1944943729278264e-04 | 2.1054550963778540e-59 |
| fixedX_fullDepth_400k_K18 | 43.327 | 400000 | 18 | 3.0296211929920771e-04 | 1.0455626826621376e-15 | 3.0296211929816216e-04 | 3.4511333795811346e-12 |
| fixedX_fullDepth_800k_K19 | 43.327 | 800000 | 19 | 3.0296211929920186e-04 | 4.6204093614534147e-63 | 3.0296211929920186e-04 | 1.5250782415112275e-59 |
| fixedX_fullDepth_400k_K18 | 48.005 | 400000 | 18 | 2.1875498314347249e-04 | 1.0455626826621376e-15 | 2.1875498314242694e-04 | 4.7796062409074158e-12 |
| fixedX_fullDepth_800k_K19 | 48.005 | 800000 | 19 | 2.1875498314367068e-04 | 4.6204093614534147e-63 | 2.1875498314367068e-04 | 2.1121390219572235e-59 |
| fixedX_fullDepth_400k_K18 | 49.774 | 400000 | 18 | 1.7444675251929002e-04 | 1.0455626826621376e-15 | 1.7444675251824447e-04 | 5.9935921280421717e-12 |
| fixedX_fullDepth_800k_K19 | 49.774 | 800000 | 19 | 1.7444675251917087e-04 | 4.6204093614534147e-63 | 1.7444675251917087e-04 | 2.6486072653864128e-59 |

## Interpretação

Cada target tem:

```text
winding finito certificado: +1
margem finita positiva
tail_bound < margem finita
```

Portanto, na certificacao numerica atual, a comparacao de borda preserva o
numero de zeros ao passar do carrier finito full-depth para o carrier infinito
com `X` fixo.

## Limites Do Pack

Este pack nao afirma:

```text
universalidade em X
prova formal Lean
certificado intervalar
resultado terminal externo ao carrier C2 center Gaussian
```

O proximo passo e substituir a avaliacao numerica de borda por aritmetica
intervalar ou certificado formal equivalente.
