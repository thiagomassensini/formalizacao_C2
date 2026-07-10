# Projected J0 Certificate Pack Verification

Pack: `/home/thlinux/formalizacao_C2/audit_outputs/projected_j0_positive_box_certificate_pack`

This is an external reproducibility check. It is not a Lean proof.

## Result

- Checks passed: 20
- Checks failed: 0
- Boxes: 27
- Certified combined: 27/27
- Certified separate: 27/27
- Min budget combined: 0.041988183220299534
- Min budget separate: 0.04189394308845744
- Worst combined box: `s0.84_t7`
- Worst separate box: `s0.84_t7`
- Rerun exit code: 0
- Largest rerun diff field: `mainNormLowerConst` = 0.0

## Respostas

1. O pack e internamente consistente: todos os arquivos obrigatorios existem,
   `boxes.csv` e `boxes.json` tem 27 caixas, as identidades de
   `parallelUpperConst` e budget fecham com diferenca maxima zero.
2. O rerun reproduz os dados dentro da tolerancia `1e-10`: a diferenca maxima
   em todos os campos comparados foi `0.0`.
3. A caixa mais apertada e `s0.84_t7`.
4. Nenhum campo diferiu no rerun; o maior diff registrado foi `0.0`.
5. O pack esta pronto para ser tratado como certificado externo auditavel.
6. Para virar prova formal Lean ainda falta um caminho confiavel que prove ou
   verifique formalmente as constantes intervalares e as hipoteses regionais
   consumidas por `ProjectedJ0ConstantBoxData`.
7. Proximo passo recomendado: manter este pack como primeiro bloco externo
   robusto e construir um verificador/certificado formal separado, sem inserir
   estes numeros diretamente como teoremas Lean improvisados.

## Internal Identities

- `parallelUpperConst` max abs identity diff: 0.0 at ``
- `budgetCombinedConst` max abs identity diff: 0.0 at ``
- `budgetSeparateConst` max abs identity diff: 0.0 at ``

## Rerun Diffs

- `mainNormLowerConst` max abs diff: 0.0 at ``
- `numeratorUpperConst` max abs diff: 0.0 at ``
- `parallelUpperConst` max abs diff: 0.0 at ``
- `restUpperCombinedConst` max abs diff: 0.0 at ``
- `restUpperSeparateConst` max abs diff: 0.0 at ``
- `budgetCombinedConst` max abs diff: 0.0 at ``
- `budgetSeparateConst` max abs diff: 0.0 at ``

## Failed Checks

- None.

## Lean Status

The pack is only an external certificate artifact. Turning it into a
formal proof still requires a trusted checker or a formalized interval
certificate path that supplies the analytic fields consumed by
`ProjectedJ0ConstantBoxData`.
