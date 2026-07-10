# Audit Projected J0 Positive Box Certificate Pack

Data: 2026-07-08.

Rota: Genuine-First. Este pacote registra um certificado externo reproduzivel
para as 27 caixas da positive-box. Ele nao e uma prova Lean automatica e nao
verifica aritmetica intervalar dentro do Lean.

## Diretorio criado

```text
audit_outputs/projected_j0_positive_box_certificate_pack/
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
audit_outputs/c2_projected_j0_interval_box_certifier_interval_positive_box_sigmas084_086_t32p82_32p86_w005_fast_sub8.csv
audit_outputs/c2_projected_j0_interval_box_certifier_interval_positive_box_sigmas084_086_t32p82_32p86_w005_fast_sub8.json
```

## Conteudo

O `config.json` registra:

```text
K, M, ref-K, ref-M
reference-mode, reference-X, reference-p
target-reference-mode, target-reference-X, target-reference-p
odd-reference-mode, odd-ref-M, odd-reference-X, odd-reference-p
interval-dps
inflate
mode
subdiv-t
comando gravado no JSON original
hash SHA256 do script do certifier
git head, se disponivel
data/hora UTC de geracao do pack
```

O `boxes.csv` e o `boxes.json` registram, por caixa:

```text
source_box_id
sigma_min, sigma_max
t_min, t_max
mainNormLowerConst
numeratorUpperConst
parallelUpperConst
restUpperCombinedConst
restUpperSeparateConst
budgetCombinedConst
budgetSeparateConst
certified_combined
certified_separate
status
```

## Resultado

```text
total boxes: 27
certified combined: 27/27
certified separate: 27/27
min budget combined: 4.198818322030e-02
min budget separate: 4.189394308846e-02
max budget loss combined: 1.725398027294e-02
```

Caixa mais apertada:

```text
s0.84_t7
budgetCombinedConst = 4.198818322030e-02
```

Termo dominante de inflacao:

```text
mainNormLowerConst
```

## Leitura Lean

Este pack alimenta conceitualmente:

```lean
ProjectedJ0ConstantBoxData
```

mas nao cria teoremas numericos em Lean. O proximo passo correto para Lean
seria uma camada externa/verificador certificado que leia ou reproduza estes
dados de forma auditavel. Nao usar `by norm_num` improvisado para fingir que o
CSV virou prova formal.

## Reproducao

Rodar:

```bash
audit_outputs/projected_j0_positive_box_certificate_pack/commands.sh
```

O comando reexecuta a certificacao registrada no JSON original.
