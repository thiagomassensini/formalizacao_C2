# Audit Projected J0 Positive Box Sector Subbox Verification

Rota: Genuine-First. Esta verificacao confere cobertura, agregacao, direcoes de arredondamento e budgets do certificado externo por subcaixa. Ela nao recomputa as somas intervalares.

## Resultado

- Checks failed: 0
- Boxes: 27
- Subboxes: 771
- Max subbox D0NegReMain upper: -0.00019368049701349772
- Min sector budget combined rat: 0.054086045801
- Min sector budget separate rat: 0.054031343484
- Worst combined box: `s0.84_t7`
- Max rationalized budget loss: 1.804634E-12

## Artefatos

- Certificado por subcaixa: `audit_outputs/projected_j0_positive_box_sector_subbox_certificate/`
- Config: `audit_outputs/projected_j0_positive_box_sector_subbox_certificate/config.json`
- Subboxes JSONL: `audit_outputs/projected_j0_positive_box_sector_subbox_certificate/subboxes.jsonl`
- Summary por box: `audit_outputs/projected_j0_positive_box_sector_subbox_certificate/boxes_summary.json`
- Verificacao JSON: `audit_outputs/projected_j0_positive_box_sector_subbox_verification.json`

As caixas de largura positiva em `t` foram subdivididas em 32 partes. As tres
caixas degeneradas no bordo final geraram uma unica subcaixa cada, seguindo o
mesmo `split_range` usado pelo certifier. Por isso o total e 771 subcaixas.

## Respostas

1. As subcaixas cobrem cada caixa se os checks `coverage_*` passam.
2. A agregacao box-level e consistente se os checks `aggregation_*` passam.
3. O setor passa quando `sector_all_subboxes` passa.
4. O pack racionalizado e seguro contra os agregados quando os checks `*_round_*`, `d0_nonpositive` e `budget_*_positive` passam.
5. Este nivel ainda nao prova que as enclosures por subcaixa sao corretas; ele verifica a trilha externa granular.

## Failed Checks

- None
