# AUDIT_C2_CENTER_GAUSSIAN_ZERO_BOX_CERTIFICATION

## Status

Esta auditoria transforma as caixas 2D numericas do C2 center Gaussian finite
carrier em certificados de borda semi-rigorosos.

Entrada:

```text
audit_outputs/c2_center_gaussian_zero_boxes/zero_boxes_locked.json
```

Saidas:

```text
audit_outputs/c2_center_gaussian_zero_box_certification/zero_box_certification.csv
audit_outputs/c2_center_gaussian_zero_box_certification/zero_box_certification.json
audit_outputs/c2_center_gaussian_zero_box_certification/summary_by_target.csv
```

## Metodo

Para cada caixa/perfil, a borda foi reavaliada com subdivisao fina.

O carrier finito tem a forma:

```text
C(s) = sum_c A_c * exp(-s * log c)
```

Logo:

```text
C'(s) = - sum_c log(c) * A_c * exp(-s * log c)
```

Foi usada a cota Lipschitz:

```text
|C(s) - C(sample)| <= derivative_upper * step_size / 2
```

e a margem certificada:

```text
certified_boundary_margin =
  boundary_min_sample - interpolation_error_bound
```

A caixa recebeu status `certified_finite_zero_box` quando:

```text
rounded_winding = +1
certified_boundary_margin > 0
```

## Parametros

Comando principal:

```bash
python3 gemini-code-1783101614806.py \
  --certify-boxes \
  --certify-input audit_outputs/c2_center_gaussian_zero_boxes/zero_boxes_locked.json \
  --certify-start-samples 2000 \
  --certify-samples 2000 \
  --certify-precision 80 \
  --workers 4 \
  --chunk 32 \
  --out-csv audit_outputs/c2_center_gaussian_zero_box_certification/zero_box_certification.csv \
  --out-json audit_outputs/c2_center_gaussian_zero_box_certification/zero_box_certification.json
```

Observacao: `certify_precision` fica registrado como parametro de auditoria.
A avaliacao vetorizada ainda usa aritmetica de ponto flutuante do NumPy; isto
e uma certificacao numerica semi-rigorosa do carrier finito, nao aritmetica
intervalar formal.

## Resultado Global

Foram auditadas:

```text
7 targets
5 perfis por target
35 caixas totais
```

Resultado:

```text
certified_finite_zero_box: 35/35
boundary_margin_failed: 0
needs_more_subdivision: 0
```

Todos os 7 targets foram certificados em todos os 5 perfis.

## Resumo Por Target

```text
target   caixas  status
21.022   5/5     certified_all_profiles
32.935   5/5     certified_all_profiles
37.586   5/5     certified_all_profiles
40.919   5/5     certified_all_profiles
43.327   5/5     certified_all_profiles
48.005   5/5     certified_all_profiles
49.774   5/5     certified_all_profiles
```

Todos os windings arredondados foram `+1`.

## Margens

Intervalos observados por target:

```text
target   min boundary sample     min certified margin
21.022   5.455170337648928e-4   3.399363989581815e-7
32.935   7.023082393217406e-4   1.5713114195580597e-4
37.586   7.861076391558317e-4   2.409305417898971e-4
40.919   8.380408298010334e-4   2.9286373243509877e-4
43.327   9.240956728146249e-4   3.789185754505036e-4
48.005   8.213289766304528e-4   2.763518792663315e-4
49.774   7.777897524896540e-4   2.3261265512572003e-4
```

A margem mais apertada ocorreu em:

```text
profile: dyn_400k_k6
target: 21.022
boundary_min_sample: 5.455170337648928e-4
interpolation_error_bound: 5.451770973659346e-4
certified_boundary_margin: 3.399363989581815e-7
```

Este caso deve ser o primeiro alvo para rerun com subdivisao maior ou uma cota
local de derivada por segmento.

## Interpretacao

Esta auditoria certifica caixas de zero para o carrier finito dos perfis
testados.

Ela nao afirma zero do carrier infinito.

O proximo passo para levantar o resultado ao carrier infinito e uma etapa de
comparacao de borda:

```text
finite boundary margin > finite-to-infinite tail bound
```

Para isso, o perfil mais limpo continua sendo um perfil com `X` fixo.

## Classificacao

```text
finite carrier zero boxes: certified in current numeric audit
infinite carrier lift: open
interval arithmetic certificate: open
```

## Verificacoes

Script:

```bash
python3 -m py_compile gemini-code-1783101614806.py
```

Resultado: passou.

Consistencia dos resultados:

```text
rows: 35
certified_finite_zero_box: 35
```

Busca de guardrails nos arquivos tocados:

```text
gemini-code-1783101614806.py
C2_CENTER_GAUSSIAN_CARRIER_STATUS.md
AUDIT_C2_CENTER_GAUSSIAN_ZERO_BOX_CERTIFICATION.md
```

Resultado: sem ocorrencias.

Lean: nenhum arquivo Lean foi alterado nesta etapa.

## Proxima Acao

Reforcar o caso mais fino (`21.022`, `dyn_400k_k6`) com amostragem maior ou
cota local por segmento, depois iniciar a comparacao de borda para um perfil de
`X` fixo.
