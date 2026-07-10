# Audit Projected J0 Angular Ratio Scout

Data: 2026-07-08.

Rota: Genuine-First. Este scout mede a moeda angular

```text
lambda(s) = max(0, -Re(D0(s) / M(s)))
```

e reescreve o budget amostral como:

```text
angularBudget = (1 - lambdaConst) * mainNormLowerConst - restUpperConst.
```

O diagnostico e numerico e serve apenas para orientar a escolha de certificados
futuros. Ele nao e uma prova.

## Script

Criado:

```text
operadores/c2_projected_j0_angular_ratio_scout.py
```

Saidas geradas:

```text
audit_outputs/c2_projected_j0_angular_ratio_scout_angular_positive_box_sigmas084_086_t32p82_32p86_points.csv
audit_outputs/c2_projected_j0_angular_ratio_scout_angular_positive_box_sigmas084_086_t32p82_32p86_boxes.csv
audit_outputs/c2_projected_j0_angular_ratio_scout_angular_positive_box_sigmas084_086_t32p82_32p86.json

audit_outputs/c2_projected_j0_angular_ratio_scout_angular_valley47_sigma05_t47p5_48p5_points.csv
audit_outputs/c2_projected_j0_angular_ratio_scout_angular_valley47_sigma05_t47p5_48p5_boxes.csv
audit_outputs/c2_projected_j0_angular_ratio_scout_angular_valley47_sigma05_t47p5_48p5.json

audit_outputs/c2_projected_j0_angular_ratio_scout_angular_seed_hurts_sigma0740_t14p25_14p35_points.csv
audit_outputs/c2_projected_j0_angular_ratio_scout_angular_seed_hurts_sigma0740_t14p25_14p35_boxes.csv
audit_outputs/c2_projected_j0_angular_ratio_scout_angular_seed_hurts_sigma0740_t14p25_14p35.json

audit_outputs/c2_projected_j0_angular_ratio_scout_angular_bad_window_sigma05_t11p5_13_points.csv
audit_outputs/c2_projected_j0_angular_ratio_scout_angular_bad_window_sigma05_t11p5_13_boxes.csv
audit_outputs/c2_projected_j0_angular_ratio_scout_angular_bad_window_sigma05_t11p5_13.json

audit_outputs/c2_projected_j0_angular_ratio_scout_angular_phase_valley_sigma05_t24p5_25p5_points.csv
audit_outputs/c2_projected_j0_angular_ratio_scout_angular_phase_valley_sigma05_t24p5_25p5_boxes.csv
audit_outputs/c2_projected_j0_angular_ratio_scout_angular_phase_valley_sigma05_t24p5_25p5.json
```

## Resumo Por Janela

| janela | pontos | caixas | lambda min | lambda max | lambda mean | pass combined | pass separate | min budget combined | max budget combined |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| positive-box | 123 | 27 | 0.000000 | 0.000000 | 0.000000 | 27 | 27 | 0.058042441166 | 0.064263708472 |
| valley47 | 1001 | 201 | 0.511971 | 2.071251 | 1.180988 | 43 | 43 | -0.215061962968 | 0.152460120870 |
| seed_hurts | 101 | 51 | 0.762320 | 1.444985 | 0.984775 | 7 | 6 | -0.037863289868 | 0.004250819198 |
| t 11.5..13.0 | 1501 | 151 | 0.811434 | 1.867561 | 1.212215 | 0 | 0 | -0.928674695188 | -0.101367724682 |
| t 24.5..25.5 | 1001 | 101 | 0.771331 | 1.418502 | 0.939781 | 0 | 0 | -0.298652982734 | -0.059940451031 |

## Leitura

Positive-box passa porque o termo angular destrutivo ficou nulo em todos os
pontos amostrados. A folga de main/rest tambem existe, mas a leitura principal
e setorial: `D0/M` nao entrou no semiplano destrutivo.

Valley47 tem bolsos positivos. A janela tem 43 caixas que passam com constantes
angulares, mas 132 caixas foram classificadas como `fail_lambda_ge_one` e 21
como `fail_lambda_large`. Portanto, a falha principal e angular; main pequeno e
largura de caixa aparecem como efeitos secundarios.

Seed_hurts e uma fronteira fina. O valor medio de `lambda` ficou perto de 1,
com caixas passando apenas quando a margem local ainda suporta o rest.

As janelas t 11.5..13.0 e t 24.5..25.5 nao passam no scout angular. Na primeira,
`lambda` frequentemente passa de 1 e o budget fica sempre negativo. Na segunda,
`lambda` fica menos extremo, mas ainda alto demais para o rest e a escala local.

## Perguntas Da Tarefa

1. Intervalo de `destructive_ratio`: de 0 no positive-box ate cerca de 2.071 em
   valley47.
2. Nas janelas ruins, `lambda` fica perto de 1 e muitas vezes passa de 1.
3. Positive-box passa principalmente porque `lambda = 0` na malha testada, com
   folga adicional em main/rest.
4. Valley47 falha principalmente por `lambda` grande; algumas caixas tambem
   sofrem com escala de main ou largura.
5. Ha padrao contra sigma: a janela em sigma alto testada ficou inteiramente no
   setor nao destrutivo, enquanto sigma 0.74 e 0.5 mostram transicao e
   instabilidade angular.
6. A forma angular sugere um bound geometrico regional/setorial, nao um unico
   bound universal grosseiro para todas as janelas testadas.

## Recomendacao

A proxima camada deve buscar `lambda` por geometria branch/tilt/half-disk onde
o setor e estavel, e usar atlas intervalar nas janelas com bolsos locais. Para
as janelas ruins, um bound universal simples de `lambda` parece improvavel; o
caminho pragmatico e regional.
