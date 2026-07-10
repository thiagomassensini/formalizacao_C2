# Audit Projected J0 Valley47 Targeted Subdivision

Data: 2026-07-08.

Rota: Genuine-First. Esta rodada atacou apenas as caixas priorizadas em
`AUDIT_PROJECTED_J0_VALLEY47_FAILURE_PRIORITY.md`.

Entrada:

```text
audit_outputs/c2_projected_j0_interval_box_certifier_interval_valley47_failures_center_radius_sub128.csv
```

## Rodada sub256

Caixas:

```text
s0.5_t16
s0.5_t17
s0.5_t191
s0.5_t192
s0.5_t193
```

Comando: `subdiv-t=256`, `main-lower-method=center-radius`, modo `fast`.

Saidas:

```text
audit_outputs/c2_projected_j0_interval_box_certifier_interval_valley47_priority_sub256.csv
audit_outputs/c2_projected_j0_interval_box_certifier_interval_valley47_priority_sub256.json
```

Resultado:

```text
combined certificados: 5/5
separate certificados: 5/5
falhas restantes neste grupo: 0/5
```

Budgets combined:

```text
s0.5_t16   2.563894e-02
s0.5_t17   1.880415e-02
s0.5_t191  1.170624e-02
s0.5_t192  1.587243e-02
s0.5_t193  1.935002e-02
```

Ganho medio contra `sub128`:

```text
main lower:      +6.456430e-03
parallelUpper:   -1.360549e-02
rest combined:   -2.804331e-03
budget combined: +2.286626e-02
```

Leitura: o maior ganho direto veio da queda de `parallelUpper`. Essa queda
combina numeratorUpper menor e main lower maior. O rest combinado tambem
estreitou, mas foi contribuicao secundaria.

## Rodada sub512

Como a rodada `sub256` recuperou caixas, a rodada moderada foi executada.

Caixas:

```text
s0.5_t18
s0.5_t189
s0.5_t190
```

Comando: `subdiv-t=512`, `main-lower-method=center-radius`, modo `fast`.

Saidas:

```text
audit_outputs/c2_projected_j0_interval_box_certifier_interval_valley47_priority_sub512.csv
audit_outputs/c2_projected_j0_interval_box_certifier_interval_valley47_priority_sub512.json
```

Resultado:

```text
combined certificados: 3/3
separate certificados: 3/3
falhas restantes neste grupo: 0/3
```

Budgets combined:

```text
s0.5_t18   2.528500e-02
s0.5_t189  1.396382e-02
s0.5_t190  1.799688e-02
```

Ganho medio contra `sub128`:

```text
main lower:      +9.815482e-03
parallelUpper:   -2.117081e-02
rest combined:   -4.310109e-03
budget combined: +3.529640e-02
```

Leitura: novamente, o maior ganho operacional veio da queda de
`parallelUpper`, com contribuicao relevante do main lower e contribuicao menor
do rest combinado.

## Reclassificacao

As 8 caixas de subdivisao direcionada foram recuperadas e saem da fila de
falhas:

```text
s0.5_t16
s0.5_t17
s0.5_t18
s0.5_t189
s0.5_t190
s0.5_t191
s0.5_t192
s0.5_t193
```

As 7 caixas marcadas como `improve_main_lower` continuam nessa classe:

```text
s0.5_t19
s0.5_t20
s0.5_t21
s0.5_t22
s0.5_t186
s0.5_t187
s0.5_t188
```

Elas ainda pedem uma melhora real do lower de `|M|`, ou uma subdivisao ainda
mais agressiva se o objetivo for recuperar por forca bruta.

As 3 caixas `abandon_box_for_now` continuam para depois:

```text
s0.5_t23
s0.5_t184
s0.5_t185
```

O budget do scout nelas ja era fraco, entao nao sao bons alvos iniciais.

## Proximo Passo

Para `valley47`, o proximo passo tecnicamente limpo e implementar ou testar
`sample-lipschitz` para o lower de `|M|` nas 7 caixas restantes. Em paralelo,
faz sentido preservar o foco de formalizacao no pack positive-box, que ja e o
bloco externo robusto verificado.
