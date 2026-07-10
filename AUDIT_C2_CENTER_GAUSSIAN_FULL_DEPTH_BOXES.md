# AUDIT_C2_CENTER_GAUSSIAN_FULL_DEPTH_BOXES

## Status

Esta auditoria prepara o lift finito-infinito do C2 center Gaussian carrier.

O objetivo foi trocar os perfis truncados em profundidade por perfis de
profundidade cheia, com `X` fixo, para que o corte finito inclua todos os
centros:

```text
c <= nmax - 1
```

Assim, a cauda restante fica organizada como cauda em centro grande.

## Alteracao No Script

Foi adicionada a flag:

```bash
--full-depth-cutoff
```

Ela define:

```text
bg_kmax = floor(log2(nmax - 1))
```

sem alterar os modos antigos.

## Perfis Rodados

Valor fixo:

```text
X = 66666.66666666667
```

Perfis:

```text
fixedX_fullDepth_400k_K18
fixedX_fullDepth_800k_K19
```

Dados:

```text
nmax=400000  K=18  centers=99999
nmax=800000  K=19  centers=199999
```

Os 7 alvos locked foram refinados novamente:

```text
21.022
32.935
37.586
40.919
43.327
48.005
49.774
```

Os refinamentos de 400k e 800k coincidiram ate a precisao registrada pela
grade local.

## Caixas 2D

As caixas foram auditadas com:

```text
sigma_center = 0.5
sigma_radius = 0.002
t_radius = 0.002
box_samples = 400
```

Resultado inicial:

```text
zero_box_candidate: 14/14
rounded_winding: +1 em todas
```

## Certificacao De Borda

Foi aplicada a certificacao numerica por cota Lipschitz de borda.

Artefatos:

```text
audit_outputs/c2_center_gaussian_full_depth_boxes/full_depth_zero_box_certification_combined.csv
audit_outputs/c2_center_gaussian_full_depth_boxes/full_depth_zero_box_certification_combined.json
audit_outputs/c2_center_gaussian_full_depth_boxes/full_depth_summary_by_target.csv
```

Resultado combinado:

```text
certified_finite_zero_box: 14/14
certified_all_profiles: 7/7 targets
```

O alvo `21.022` precisou de `2000` amostras por lado. Os demais targets foram
certificados com `1000` amostras por lado.

## Resumo Por Target

```text
target   certified  min certified margin
21.022   2/2        3.2870657715831827e-4
32.935   2/2        1.3525646892630842e-4
37.586   2/2        2.1070742305670032e-4
40.919   2/2        2.194494372924771e-4
43.327   2/2        3.0296211929920186e-4
48.005   2/2        2.187549831434725e-4
49.774   2/2        1.7444675251917087e-4
```

A menor margem full-depth combinada foi:

```text
target: 32.935
certified_boundary_margin: 1.3525646892630842e-4
```

## Interpretacao

Esta auditoria mostra que as 7 caixas locked sobrevivem ao corte de
profundidade cheia nos dois tamanhos testados.

O perfil full-depth e mais adequado para o proximo passo porque a diferenca
ate o carrier infinito fica concentrada na cauda de centros grandes.

Ainda nao foi afirmado zero do carrier infinito.

## Proximo Boleto

Provar ou estimar uma cota de cauda na borda:

```text
Tail(nmax, X, sigma_min) < certified_boundary_margin
```

com:

```text
sigma_min = 0.5 - 0.002
```

Se essa desigualdade fechar para uma caixa full-depth de `X` fixo, a comparacao
de borda transfere o numero de zeros do carrier finito para o carrier infinito.

Status posterior: este boleto foi auditado em:

```text
AUDIT_C2_CENTER_GAUSSIAN_TAIL_LIFT.md
```

## Verificacoes

Script:

```bash
python3 -m py_compile gemini-code-1783101614806.py
```

Resultado: passou.

Lean: nenhum arquivo Lean foi alterado nesta etapa.
