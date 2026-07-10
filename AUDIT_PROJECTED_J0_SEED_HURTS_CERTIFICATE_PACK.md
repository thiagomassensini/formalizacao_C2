# Audit Projected J0 Seed Hurts Certificate Pack

Data: 2026-07-08.

Rota: Genuine-First. Este pacote registra um certificado externo reproduzivel
para as 6 caixas `seed_hurts` que passam no modo combined. Ele nao e prova Lean
automatica.

## Diretorio criado

```text
audit_outputs/projected_j0_seed_hurts_certificate_pack/
```

Arquivos:

```text
config.json
boxes.csv
boxes.json
commands.sh
summary.md
README.md
```

Fonte:

```text
audit_outputs/c2_projected_j0_interval_box_certifier_interval_seed_hurts_sigma0740_t14p25_14p35_w002_pass_fast_sub512.csv
audit_outputs/c2_projected_j0_interval_box_certifier_interval_seed_hurts_sigma0740_t14p25_14p35_w002_pass_fast_sub512.json
```

## Resultado

```text
total boxes: 6
certified combined: 6/6
certified separate: 5/6
min budget combined: 1.718982124743e-04
max budget loss combined: 3.888419801655e-04
```

Caixa delicada:

```text
s0.74_t45
t = [14.340, 14.341]
budget combined = 1.718982124743e-04
budget separate = -6.216336919869e-04
```

Leitura: `s0.74_t45` so passa na moeda combined. Esta regiao exige
`subdiv-t=512`, entao ela deve ser tratada como fronteira fina, nao como bloco
robusto.

## Leitura Lean

O pack fornece constantes externas que correspondem ao formato de:

```lean
ProjectedJ0ConstantBoxData
```

Ele nao prova as constantes em Lean e nao verifica a aritmetica intervalar no
kernel.

## Reproducao

Rodar:

```bash
audit_outputs/projected_j0_seed_hurts_certificate_pack/commands.sh
```
