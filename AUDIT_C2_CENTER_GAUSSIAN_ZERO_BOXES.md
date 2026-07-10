# AUDIT_C2_CENTER_GAUSSIAN_ZERO_BOXES

## Escopo

Auditoria empirica 2D de caixas de zero para o C2 center Gaussian carrier.

Script:

```text
gemini-code-1783101614806.py
```

Fonte:

```text
audit_outputs/c2_center_gaussian_local_refinement/
```

Saidas:

```text
audit_outputs/c2_center_gaussian_zero_boxes/
```

Esta auditoria nao e prova formal. Ela mede winding numerico do carrier finito
na borda de caixas pequenas em `(sigma,t)`.

## Modo criado no script

Foi adicionado:

```text
--box-audit
--box-targets
--box-profiles
--sigma-center
--sigma-radius
--t-radius
--box-samples
--box-interior-samples
--box-boundary-threshold
--box-interior-threshold
```

Para cada alvo/perfil, o script avalia a borda do retangulo:

```text
sigma in [0.5 - r_sigma, 0.5 + r_sigma]
t     in [t0  - r_t,     t0  + r_t]
```

e mede:

```text
min |C(s)| na borda
winding number
variacao total do argumento
min |C(s)| em grid interno opcional
classificacao da caixa
```

## Parametros

Targets:

```text
21.022
32.935
37.586
40.919
43.327
48.005
49.774
```

Perfis:

```text
dyn_200k_k5
dyn_400k_k6
fixedX_400k_k6
xfactor4_200k_k5
xfactor6_200k_k5
```

Caixa:

```text
sigma_center = 0.5
sigma_radius = 0.002
t_radius     = 0.002
box_samples  = 400 por lado
interior     = 21 x 21
```

Threshold de borda:

```text
1e-4
```

## Saidas consolidadas

```text
audit_outputs/c2_center_gaussian_zero_boxes/zero_boxes_locked.csv
audit_outputs/c2_center_gaussian_zero_boxes/zero_boxes_locked.json
audit_outputs/c2_center_gaussian_zero_boxes/summary_by_target.csv
```

## Resultado por alvo

| target | windings | boundary min range | interior min range | status |
|---:|---|---:|---:|---|
| 21.022 | 1,1,1,1,1 | 5.46e-04..6.90e-04 | 4.82e-07..1.04e-05 | stable_zero_box |
| 32.935 | 1,1,1,1,1 | 7.02e-04..8.65e-04 | 5.68e-07..3.22e-05 | stable_zero_box |
| 37.586 | 1,1,1,1,1 | 7.86e-04..9.39e-04 | 4.64e-07..4.28e-05 | stable_zero_box |
| 40.919 | 1,1,1,1,1 | 8.38e-04..9.40e-04 | 4.28e-07..1.35e-05 | stable_zero_box |
| 43.327 | 1,1,1,1,1 | 9.24e-04..1.01e-03 | 1.50e-06..4.21e-05 | stable_zero_box |
| 48.005 | 1,1,1,1,1 | 8.21e-04..9.40e-04 | 2.35e-07..2.66e-05 | stable_zero_box |
| 49.774 | 1,1,1,1,1 | 7.78e-04..8.95e-04 | 8.85e-07..3.33e-05 | stable_zero_box |

## Leitura

Todos os 7 locked tiveram winding numerico:

```text
+1
```

em todos os 5 perfis testados.

Todas as caixas foram classificadas como:

```text
zero_box_candidate
```

em todos os perfis. O minimo de borda ficou sempre acima de `5.4e-4`, portanto
as bordas nao passaram perto da origem no nivel de resolucao desta bateria.

O grid interno encontrou valores pequenos dentro das caixas, coerentes com os
minimos refinados anteriormente.

## Classificacao

Nucleo locked apos box audit:

```text
21.022 stable_zero_box
32.935 stable_zero_box
37.586 stable_zero_box
40.919 stable_zero_box
43.327 stable_zero_box
48.005 stable_zero_box
49.774 stable_zero_box
```

## Conclusao

A evidencia empirica subiu de:

```text
minimo 1D persistente
```

para:

```text
caixa 2D com winding estavel e borda segura
```

para os 7 alvos locked.

Isto ainda nao e certificacao formal. O proximo passo natural seria transformar
estas caixas em certificados numericos com controle rigoroso da borda.
