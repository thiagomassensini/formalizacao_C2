# AUDIT_C2_CENTER_GAUSSIAN_LOCAL_REFINEMENT

## Escopo

Auditoria empirica local dos 10 minimos persistentes do C2 center Gaussian
carrier.

Script:

```text
gemini-code-1783101614806.py
```

Saidas:

```text
audit_outputs/c2_center_gaussian_local_refinement/
```

Esta auditoria nao e prova formal. Ela mede estabilidade local do detector
alinhado com o carrier formal.

## Atualizacao do script

Foi adicionado modo:

```text
--refine
--refine-window
--refine-dt
--refine-targets
--profile-name
```

Para cada alvo, o script avalia uma janela local e salva:

```text
profile_name
nmax
bg_kmax
sigma
X_mode
X
target_t
refined_t
|C(t_refined)|
Re C(t_refined)
Im C(t_refined)
arg C(t_refined)
drift_from_target
```

## Parametros

Targets:

```text
14.134, 21.022, 25.010, 30.425, 32.935,
37.586, 40.919, 43.327, 48.005, 49.774
```

Refinamento:

```text
refine_window = 0.02
refine_dt = 0.00001
```

Perfis rodados:

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
audit_outputs/c2_center_gaussian_local_refinement/all_refined_minima.csv
audit_outputs/c2_center_gaussian_local_refinement/summary_by_target.csv
```

## Resumo por minimo

| target | refined_t range | span | max drift | min |C| | max |C| | status |
|---:|---:|---:|---:|---:|---:|---|
| 14.134 | 14.133890..14.135720 | 0.001830 | 0.001720 | 5.28e-06 | 8.52e-04 | drifting |
| 21.022 | 21.021610..21.022590 | 0.000980 | 0.000590 | 4.82e-07 | 3.31e-04 | locked |
| 25.010 | 25.010470..25.011630 | 0.001160 | 0.001630 | 8.60e-07 | 2.14e-04 | drifting |
| 30.425 | 30.424240..30.425260 | 0.001020 | 0.000760 | 1.40e-06 | 1.33e-04 | drifting |
| 32.935 | 32.934490..32.935280 | 0.000790 | 0.000510 | 5.68e-07 | 1.50e-04 | locked |
| 37.586 | 37.585710..37.586290 | 0.000580 | 0.000290 | 4.64e-07 | 1.44e-04 | locked |
| 40.919 | 40.918500..40.919070 | 0.000570 | 0.000500 | 4.28e-07 | 1.33e-04 | locked |
| 43.327 | 43.326860..43.327270 | 0.000410 | 0.000270 | 1.50e-06 | 1.67e-04 | locked |
| 48.005 | 48.004830..48.005340 | 0.000510 | 0.000340 | 2.35e-07 | 1.21e-04 | locked |
| 49.774 | 49.773790..49.773920 | 0.000130 | 0.000210 | 8.85e-07 | 1.72e-04 | locked |

## Leitura

Sete minimos ficaram `locked` nesta bateria local:

```text
21.022
32.935
37.586
40.919
43.327
48.005
49.774
```

Tres minimos preservaram identidade, mas com drift maior:

```text
14.134
25.010
30.425
```

Esses tres devem ser tratados como `drifting`, nao como instaveis. Eles
continuam aparecendo nos perfis bons, mas a posicao refinada se move mais do
que a dos alvos `locked`.

## Observacoes por perfil

O perfil `fixedX_400k_k6` e os perfis `xfactor4_200k_k5` e
`xfactor6_200k_k5` produziram varios valores na faixa `1e-6` ou menor.

O perfil dinamico com escala crescente preserva os alvos, mas alguns valores de
`|C|min` sao maiores, principalmente perto de `14.134`.

## Conclusao

Os 10 candidatos continuam estaveis como familia local. A classificacao atual e:

```text
locked:   7
drifting: 3
weak:     0
split-sensitive: 0 nesta bateria refinada
```

O comportamento split-sensitive foi observado antes apenas no perfil de escala
mais agressiva. Ele nao foi usado como perfil bom nesta rodada local.

## Proxima acao

Rodar uma bateria de zoom ainda mais fina para os tres alvos `drifting`:

```text
14.134
25.010
30.425
```

com janelas menores centradas nos `refined_t` de cada perfil, para distinguir
drift real de resolucao/curvatura local.
