# Audit Projected J0 Positive Box Sector Certificate Pack

Data: 2026-07-09.

Rota: Genuine-First. Este pack registra um certificado externo reproduzivel
para a leitura setorial da positive-box. Ele nao e prova Lean automatica.

## Diretorio

Criado:

```text
audit_outputs/projected_j0_positive_box_sector_certificate_pack/
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
audit_outputs/c2_projected_j0_sector_box_certifier_sector_positive_box_fast_sub32.csv
audit_outputs/c2_projected_j0_sector_box_certifier_sector_positive_box_fast_sub32.json
```

## Resultado

```text
total boxes: 27
certified nondestructive: 27/27
certified sector combined: 27/27
certified sector separate: 27/27
min sector budget combined: 5.408604580200e-02
min sector budget separate: 5.403134348438e-02
worst box: s0.84_t7
max d0_neg_re_upper: -1.936804970135e-04 at s0.86_t0
```

## Conteudo Por Caixa

Cada linha de `boxes.csv` e `boxes.json` registra:

```text
source_box_id
sigma_min, sigma_max
t_min, t_max
d0_neg_re_upper
d0_neg_re_lower
certified_nondestructive
mainNormLowerConst
restUpperCombinedConst
restUpperSeparateConst
sectorBudgetCombined
sectorBudgetSeparate
certified_sector_combined
certified_sector_separate
mode
interval_dps
subdiv_t
inflate
```

## Leitura

O pack setorial certifica externamente:

```text
D0NegReMain <= 0
```

em todas as 27 caixas positive-box. Portanto, dentro do contrato da camada
Lean setorial:

```text
numeratorUpper = 0
parallelUpper = 0
```

e a obrigacao de budget e apenas:

```text
mainLower - restUpper > 0.
```

## Diferenca Contra O Pack Racionalizado

Pack racionalizado anterior:

```text
min budget combined = 0.0419881832
```

Pack setorial:

```text
min sector budget combined = 0.054086045802
```

A diferenca vem da remocao do custo paralelo. O pack setorial e mais
geometrico que um upper generico de numerador.

## Status Lean

O pack alimenta conceitualmente:

```lean
ProjectedJ0SectorConstantBoxData
```

mas nao cria teoremas numericos em Lean e nao prova as enclosures dentro do
kernel.

## Racionalizacao Setorial

Nao foi criado ainda um pack racionalizado setorial. O proximo passo natural e:

```text
mainNormLowerConst arredondado para baixo;
restUpperConst arredondado para cima;
d0_neg_re_upper arredondado para cima;
exigir d0_neg_re_upper <= 0;
exigir mainLower - restUpper > 0.
```

Como a folga minima setorial e cerca de `0.054086`, a racionalizacao deve ser
direta.

## Reproducao

Rodar:

```bash
audit_outputs/projected_j0_positive_box_sector_certificate_pack/commands.sh
```
