# Audit Projected J0 Valley47 Failure Priority

Data: 2026-07-08.

Rota: Genuine-First. Este relatorio prioriza apenas as 18 caixas `valley47`
que ainda falharam depois do reprocessamento `center-radius/sub128`.

Entrada:

```text
audit_outputs/c2_projected_j0_interval_box_certifier_interval_valley47_failures_center_radius_sub128.csv
```

Saida criada:

```text
audit_outputs/projected_j0_valley47_remaining_failures_priority.csv
```

## Resumo

Total de falhas restantes: 18.

Classificacao:

```text
subdiv_t_256:          5
subdiv_t_512:          3
improve_main_lower:    7
abandon_box_for_now:   3
improve_numerator:     0
```

## Criterio usado

O criterio e heuristico e serve apenas para decidir a proxima rodada externa.

```text
subdiv_t_256:
  budget intervalar quase positivo e scout ainda com folga relevante.

subdiv_t_512:
  deficit moderado, scout positivo e subdivisao simples ainda parece plausivel.

improve_main_lower:
  perda de budget para a enclosure intervalar continua grande; a leitura
  anterior indicou que o lower de |M| e o gargalo dominante.

improve_numerator:
  reservado para caixas onde parallelUpper domine apos o lower de |M| deixar
  de ser o gargalo claro.

abandon_box_for_now:
  scout ja tinha folga pequena; nao e bom alvo inicial para certificado.
```

## Subdividir primeiro

Rodar `subdiv_t_256` em:

```text
s0.5_t16
s0.5_t17
s0.5_t191
s0.5_t192
s0.5_t193
```

Rodar `subdiv_t_512` em:

```text
s0.5_t18
s0.5_t189
s0.5_t190
```

## Melhorar lower de |M|

Priorizar uma variante `sample-lipschitz` ou geometrica para:

```text
s0.5_t19
s0.5_t20
s0.5_t21
s0.5_t22
s0.5_t186
s0.5_t187
s0.5_t188
```

Essas caixas ainda tem perda de budget intervalar grande depois de `sub128`.
Mais subdivisao pode ajudar, mas o retorno esperado e menor que melhorar o
lower de `|M|`.

## Deixar para depois

Nao atacar como alvo inicial:

```text
s0.5_t23
s0.5_t184
s0.5_t185
```

Nessas caixas, o budget do scout ja era pequeno. Elas devem ficar para depois
de estabilizar o metodo em caixas com folga maior.

## Recomendacao

1. Rodar primeiro `subdiv_t_256` nas 5 caixas quase positivas.
2. Rodar `subdiv_t_512` nas 3 caixas moderadas se a primeira rodada recuperar
   pelo menos parte delas.
3. Implementar `sample-lipschitz` ou um lower geometrico para `|M|` antes de
   insistir nas 7 caixas classificadas como `improve_main_lower`.
4. Manter combined rest como moeda principal.
