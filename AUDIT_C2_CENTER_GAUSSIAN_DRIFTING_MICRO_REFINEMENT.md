# AUDIT_C2_CENTER_GAUSSIAN_DRIFTING_MICRO_REFINEMENT

## Escopo

Micro-refinamento dos tres alvos classificados como `drifting` na auditoria
local anterior:

```text
14.134
25.010
30.425
```

Script:

```text
gemini-code-1783101614806.py
```

Fonte dos refinamentos anteriores:

```text
audit_outputs/c2_center_gaussian_local_refinement/
```

Saidas:

```text
audit_outputs/c2_center_gaussian_drifting_micro_refinement/
```

Esta auditoria e empirica. Ela mede geometria local do carrier, sem endpoint
formal novo.

## Atualizacao do script

Foi adicionado modo de segunda fase:

```text
--refine-from-json
--micro-window
--micro-dt
--micro-targets
```

O modo aceita um diretorio de JSONs de refinamento anteriores ou um CSV
consolidado com sidecars JSON no mesmo diretorio.

Para cada linha anterior, o micro-refinamento usa o `refined_t` daquele perfil
como centro local.

## Parametros

```text
micro_window = 0.002
micro_dt = 0.000001
```

Perfis usados:

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

## Medidas salvas

Cada linha salva:

```text
profile_name
target_t
previous_refined_t
micro_refined_t
|C|min
Re C
Im C
arg C
drift_from_previous
drift_from_target
estimated_curvature
valley_width_at_2x_min
complex_derivative_abs
phase_left
phase_right
phase_delta_lr
```

Arquivos consolidados:

```text
audit_outputs/c2_center_gaussian_drifting_micro_refinement/drifting_micro_refinement.csv
audit_outputs/c2_center_gaussian_drifting_micro_refinement/drifting_micro_refinement.json
audit_outputs/c2_center_gaussian_drifting_micro_refinement/summary_by_target.csv
```

## Resumo

| target | micro span | max drift from previous | |C|min range | curvature range | width range | status |
|---:|---:|---:|---:|---:|---:|---|
| 14.134 | 0.001824 | 5.0e-06 | 5.27e-06..8.52e-04 | 6.73e+01..1.18e+04 | 7.20e-05..4.00e-03 | flat_valley |
| 25.010 | 0.001163 | 3.0e-06 | 7.71e-08..2.14e-04 | 7.25e+02..6.29e+05 | 0..1.88e-03 | true_drift |
| 30.425 | 0.001015 | 4.0e-06 | 1.71e-07..1.33e-04 | 1.25e+03..4.73e+05 | 1.00e-06..1.13e-03 | true_drift |

## Leitura por alvo

### 14.134

O micro-refinamento quase nao moveu os centros anteriores, mas os perfis
dinamicos apresentam vale muito largo dentro da janela medida. A largura em
alguns perfis saturou a janela inteira de `0.004`.

Classificacao:

```text
flat_valley
```

O deslocamento entre perfis e consistente com uma regiao local larga/raso, nao
com perda do minimo.

### 25.010

O micro-refinamento manteve cada perfil praticamente no seu minimo anterior,
mas o span entre perfis permaneceu em torno de `0.00116`. Alguns perfis fixos e
de escala menor formam um minimo muito agudo perto de `25.010858`, enquanto os
perfis dinamicos ficam em posicoes diferentes.

Classificacao:

```text
true_drift
```

### 30.425

O comportamento e parecido com `25.010`: os perfis fixos/escala menor travam
perto de `30.424876`, enquanto os dinamicos preservam posicoes diferentes. O
micro-refinamento nao colapsou o span.

Classificacao:

```text
true_drift
```

## Conclusao

O micro-refinamento mostrou que o drift anterior nao era apenas resolucao do
grid grosso: `drift_from_previous` ficou na escala de `1e-6`, mas o span entre
perfis persistiu.

Classificacao atual dos 10 candidatos:

```text
nucleo locked: 7
flat_valley:   1
true_drift:    2
weak:          0
```

Nucleo locked:

```text
21.022
32.935
37.586
40.919
43.327
48.005
49.774
```

Nucleo flexivel:

```text
14.134  flat_valley
25.010  true_drift
30.425  true_drift
```

## Proxima acao

Criar um status consolidado do carrier C2 center Gaussian com tres camadas:

```text
1. objeto formal e convergencia do corte por centro;
2. paridade com o script;
3. evidencia empirica: 10 persistentes, 7 locked, 1 flat_valley, 2 true_drift.
```
