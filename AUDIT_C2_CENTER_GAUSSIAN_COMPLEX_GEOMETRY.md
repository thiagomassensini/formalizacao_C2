# AUDIT_C2_CENTER_GAUSSIAN_COMPLEX_GEOMETRY

## Escopo

Auditoria empirica da geometria complexa dos 7 candidatos `locked` do carrier
C2 center Gaussian.

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
audit_outputs/c2_center_gaussian_complex_geometry/
```

Esta auditoria nao e prova formal. Ela mede o traco complexo local do detector.

## Atualizacao do script

Foi adicionado modo:

```text
--complex-audit
--complex-window
--complex-dt
--complex-targets
```

Para cada alvo/perfil, o script mede:

```text
Re C
Im C
arg C
phase_left
phase_right
phase_delta_unwrapped
derivative_re
derivative_im
|C'(t)|
second_derivative_abs
abs_curvature
complex_cross
valley_width_at_2x_min
classification
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

Janela:

```text
complex_window = 0.002
complex_dt = 0.000001
```

Perfis:

```text
dyn_200k_k5
dyn_400k_k6
dyn_800k_k7
fixedX_200k_k5
fixedX_400k_k6
fixedX_800k_k7
xfactor4_200k_k5
xfactor6_200k_k5
```

## Saidas consolidadas

```text
audit_outputs/c2_center_gaussian_complex_geometry/complex_geometry_locked.csv
audit_outputs/c2_center_gaussian_complex_geometry/complex_geometry_locked.json
audit_outputs/c2_center_gaussian_complex_geometry/summary_by_target.csv
```

## Resumo por alvo

| target | |C|min range | |C'| range | width range | max phase delta | status |
|---:|---:|---:|---:|---:|---|
| 21.022 | 1.18e-07..3.31e-04 | 3.44e-01..3.49e-01 | 0..3.29e-03 | 2.50e+00 | transverse_near_zero |
| 32.935 | 1.12e-07..1.50e-04 | 4.24e-01..4.36e-01 | 0..1.23e-03 | 2.78e+00 | transverse_near_zero |
| 37.586 | 6.49e-08..1.44e-04 | 4.65e-01..4.73e-01 | 0..1.07e-03 | 2.87e+00 | transverse_near_zero |
| 40.919 | 2.02e-07..1.33e-04 | 4.62e-01..4.74e-01 | 1.00e-06..9.84e-04 | 2.43e+00 | transverse_near_zero |
| 43.327 | 1.13e-07..1.67e-04 | 5.06e-01..5.12e-01 | 0..1.13e-03 | 2.71e+00 | transverse_near_zero |
| 48.005 | 2.35e-07..1.21e-04 | 4.67e-01..4.74e-01 | 0..8.87e-04 | 2.21e+00 | transverse_near_zero |
| 49.774 | 3.64e-07..1.72e-04 | 4.41e-01..4.50e-01 | 2.00e-06..1.33e-03 | 1.76e+00 | transverse_near_zero |

## Leitura

Todos os 7 alvos `locked` foram classificados como:

```text
transverse_near_zero
```

em nivel agregado.

O criterio agregado foi maioria de perfis classificados como
`transverse_near_zero`. Alguns perfis dinamicos maiores aparecem como
`shallow_minimum` em alvos especificos, porque o valor de `|C|min` e maior e o
vale local e mais largo. Isso nao quebrou a classificacao global.

## Geometria local

O valor de `|C'(t)|` ficou longe de zero e bastante estavel por alvo:

```text
21.022: 0.344..0.349
32.935: 0.424..0.436
37.586: 0.465..0.473
40.919: 0.462..0.474
43.327: 0.506..0.512
48.005: 0.467..0.474
49.774: 0.441..0.450
```

Isso e consistente com passagem transversal perto da origem, nao com minimo
plano sem direcao complexa.

## Conclusao

O nucleo locked nao e apenas minimo pequeno de `|C|`: a auditoria complexa
mostra traco local com derivada complexa nao pequena e comportamento de
passagem transversal perto da origem.

Classificacao atual do carrier na janela `[10,50]`:

```text
locked transverse_near_zero: 7
flat_valley:                1
true_drift:                 2
weak:                       0
```

## Proxima acao

Consolidar as evidencias formais/empiricas em uma versao final do status do
carrier, ou iniciar uma bateria em janelas maiores para procurar novos
candidatos fora de `[10,50]`.
