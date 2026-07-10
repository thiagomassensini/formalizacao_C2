# AUDIT_C2_CENTER_GAUSSIAN_TAIL_LIFT

## Status

Esta auditoria compara a margem certificada das caixas full-depth do carrier
finito com uma cota superior para a cauda ate o carrier infinito
`c2CenterGaussianSeries X s`, com `X` fixo.

Entrada:

```text
audit_outputs/c2_center_gaussian_full_depth_boxes/full_depth_zero_box_certification_combined.json
```

Saidas:

```text
audit_outputs/c2_center_gaussian_full_depth_boxes/full_depth_tail_lift.csv
audit_outputs/c2_center_gaussian_full_depth_boxes/full_depth_tail_lift.json
audit_outputs/c2_center_gaussian_full_depth_boxes/full_depth_tail_lift_summary_by_target.csv
```

## Metodo

Nos perfis full-depth, o corte inclui todos os centros:

```text
c <= nmax - 1
```

A cauda omitida satisfaz:

```text
c + 1 > nmax
```

Foi usada a majoracao grosseira:

```text
2 * 2^(-k) <= 1/2   para k >= 2
```

e a restricao de centros C2 foi esquecida para majorar por todos os inteiros.

Assim:

```text
Tail(nmax, X, sigma_min)
  <= 1/2 * integral_{nmax-1}^{inf}
       x^(-sigma_min) * exp(-(x/X)^2) dx
```

Com:

```text
u = x / X
A = (nmax - 1) / X
```

foi usada a cota:

```text
integral_A^inf u^(-sigma_min) * exp(-u^2) du
  <= A^(-sigma_min) * exp(-A^2) / (2*A)
```

Logo:

```text
Tail <=
  1/2 * X^(1-sigma_min) * A^(-sigma_min) * exp(-A^2) / (2*A)
```

## Parametros

Comando:

```bash
python3 gemini-code-1783101614806.py \
  --tail-lift \
  --tail-input audit_outputs/c2_center_gaussian_full_depth_boxes/full_depth_zero_box_certification_combined.json \
  --tail-sigma-min 0.498 \
  --tail-method crude_integral \
  --out-csv audit_outputs/c2_center_gaussian_full_depth_boxes/full_depth_tail_lift.csv \
  --out-json audit_outputs/c2_center_gaussian_full_depth_boxes/full_depth_tail_lift.json
```

Aqui:

```text
sigma_min = 0.5 - 0.002 = 0.498
X = 66666.66666666667
```

## Resultado Global

Foram avaliadas:

```text
14 caixas full-depth
7 targets
2 perfis por target
```

Resultado:

```text
finite_to_infinite_lift_pass: 14/14
lift_failed: 0
```

Caudas distintas:

```text
nmax=400000: 1.0455626826621376e-15
nmax=800000: 4.6204093614534147e-63
```

Maior razao cauda/margem:

```text
7.730223115848086e-12
```

Menor valor de `margin_minus_tail`:

```text
1.3525646892526287e-4
```

## Resumo Por Target

```text
target   lift    max tail/margin
21.022   2/2     3.1808389467015525e-12
32.935   2/2     7.730223115848086e-12
37.586   2/2     4.962154002428201e-12
40.919   2/2     4.7644810374639325e-12
43.327   2/2     3.4511333795811346e-12
48.005   2/2     4.779606240907416e-12
49.774   2/2     5.993592128042172e-12
```

O alvo mais apertado para o lift foi:

```text
target: 32.935
profile: fixedX_fullDepth_400k_K18
certified_boundary_margin: 1.3525646892630842e-4
tail_bound: 1.0455626826621376e-15
margin_minus_tail: 1.3525646892526287e-4
```

## Interpretacao

Para os dois perfis full-depth de `X` fixo testados, a cauda ate o carrier
infinito fica muitas ordens de grandeza abaixo da margem certificada de borda.

Assim, nesta auditoria numerica, a comparacao de borda passa para as 7 caixas.

Conclusao permitida:

```text
as 7 caixas full-depth levantam do carrier finito para o carrier infinito
c2CenterGaussianSeries X s, para X = 66666.66666666667, dentro desta
certificacao numerica
```

Esta conclusao ainda depende da camada numerica de borda dos perfis finitos.
Ela nao e uma prova Lean formal nem aritmetica intervalar.

## Proximo Boleto

Transformar a camada numerica em certificado mais forte:

```text
1. aritmetica intervalar na borda finita;
2. cota de cauda em forma Lean ou certificado auditavel externo;
3. registro final das caixas infinitas por target.
```

## Verificacoes

Script:

```bash
python3 -m py_compile gemini-code-1783101614806.py
```

Resultado: passou.

Lean: nenhum arquivo Lean foi alterado nesta etapa.
