# Audit Projected J0 Valley47 T188 Sub1024

Data: 2026-07-08.

Rota: Genuine-First. Esta rodada foi uma tentativa opcional e localizada na
caixa `s0.5_t188`, que estava quase positiva no scout sample-lipschitz.

## Entrada

Fonte das caixas:

```text
audit_outputs/c2_projected_j0_interval_box_certifier_interval_valley47_failures_center_radius_sub128.csv
```

Caixa:

```text
s0.5_t188
sigma = 0.5
t in [48.44, 48.444]
```

Rodada:

```text
mode = fast
main-lower-method = center-radius
subdiv-t = 1024
interval-dps = 50
inflate = 1e-12
```

Saidas:

```text
audit_outputs/c2_projected_j0_interval_box_certifier_valley47_t188_sub1024.csv
audit_outputs/c2_projected_j0_interval_box_certifier_valley47_t188_sub1024.json
```

## Resultado

```text
certified combined: 1/1
certified separate: 1/1
status: certified_combined_and_separate
```

Constantes certificadas pela rodada externa:

```text
mainNormLowerConst       = 0.28095296130799485
numeratorUpperConst      = 0.053086545690473934
parallelUpperConst       = 0.18895172146727357
restUpperCombinedConst   = 0.07663267463166637
restUpperSeparateConst   = 0.07862578919021189
budgetCombinedConst      = 0.015368565209054913
budgetSeparateConst      = 0.013375450650509393
```

Comparacao com a rodada `subdiv-t=128`:

```text
old budget combined = -0.024479696274047905
new budget combined =  0.015368565209054913
gain combined       =  0.03984826148310282

old budget separate = -0.026474823973370185
new budget separate =  0.013375450650509393
gain separate       =  0.03985027462387958
```

O ganho veio da subdivisao fina, que reduziu simultaneamente a inflacao no
main lower, no numerator upper e no rest upper. O metodo `center-radius` nao
deu ganho adicional em relacao ao lower retangular nesta caixa.

## Leitura

A caixa `s0.5_t188` foi recuperada com `subdiv-t=1024`. Isso sugere que parte
das caixas restantes de `valley47` pode ser tratada por subdivisao dirigida,
mas a frente principal continua sendo o positive-box racionalizado, por ser o
bloco mais robusto e ja preparado para checagem algebraica em Lean.

## Limite

Esta rodada continua sendo certificado externo/diagnostico intervalar. Ela nao
fecha o middle, nao injeta numeros como teoremas Lean e nao prova enclosures
analiticas dentro do kernel Lean.
