# Audit Projected J0 External Certificate Manifest

Data UTC: 2026-07-09T02:04:23.083913+00:00.

Este manifest liga packs externos verificados a documentacao e ao
schema Lean existente. Ele nao insere numeros como teoremas e nao
transforma CSV em prova Lean.

## Packs

### projected_j0_positive_box_certificate_pack

- Diretório: `/home/thlinux/formalizacao_C2/audit_outputs/projected_j0_positive_box_certificate_pack`
- Verificação: `verified`
- JSON de verificação: `/home/thlinux/formalizacao_C2/audit_outputs/projected_j0_positive_box_pack_verification.json`
- Caixas: 27
- Combined certificados: 27/27
- Separate certificados: 27/27
- Min budget combined: 0.041988183220299534
- Min budget separate: 0.04189394308845744
- Worst combined box: `s0.84_t7`
- Worst separate box: `s0.84_t7`
- Rerun exit code: 0
- Max rerun diff: 0.0
- Lean schema target: `ProjectedJ0ConstantBoxData / ProjectedJ0ConstantAtlasData`

### projected_j0_positive_box_sector_rationalized_pack

- Diretório: `/home/thlinux/formalizacao_C2/audit_outputs/projected_j0_positive_box_sector_rationalized_pack`
- Verificação: `verified by chain`
- JSON de verificação: `/home/thlinux/formalizacao_C2/audit_outputs/projected_j0_positive_box_sector_chain_verification.json`
- Caixas: 27
- Nondestructive certificados: 27/27
- Combined certificados: 27/27
- Separate certificados: 27/27
- Min sector budget combined racionalizado: 0.054086045801
- Min sector budget separate racionalizado: 0.054031343484
- Worst combined box: `s0.84_t7`
- Worst separate box: `s0.84_t7`
- Max raw-to-pack diff: 0
- Max rationalization budget loss: 0.000000000001804634
- Bridge example found: True
- Lean schema target: `ProjectedJ0SectorConstantBoxData` via bridge condicional

### projected_j0_positive_box_sector_subbox_certificate

- Diretório: `/home/thlinux/formalizacao_C2/audit_outputs/projected_j0_positive_box_sector_subbox_certificate`
- Verificação: `verified by subbox verifier`
- JSON de verificação: `/home/thlinux/formalizacao_C2/audit_outputs/projected_j0_positive_box_sector_subbox_verification.json`
- Caixas: 27
- Subcaixas: 771
- Checks failed: 0
- Max subbox D0NegReMain upper: -0.00019368049701349772
- Min sector budget combined racionalizado: 0.054086045801
- Min sector budget separate racionalizado: 0.054031343484
- Worst combined box: `s0.84_t7`
- Max rationalized budget loss: 0.000000000001804634
- Papel: camada granular externa entre `fast/sub32` e pack racionalizado

### positive_box_sector_strict_sub16_sentinels

- Verificação: `strict localized sentinel`
- Relatório: `/home/thlinux/formalizacao_C2/AUDIT_PROJECTED_J0_POSITIVE_BOX_SECTOR_SENTINEL_STRICT_SUBDIV.md`
- CSV: `/home/thlinux/formalizacao_C2/audit_outputs/c2_projected_j0_sector_box_certifier_sector_positive_box_sentinel_strict_sub16.csv`
- JSON: `/home/thlinux/formalizacao_C2/audit_outputs/c2_projected_j0_sector_box_certifier_sector_positive_box_sentinel_strict_sub16.json`
- Caixas: `s0.84_t0`, `s0.84_t1`, `s0.85_t0`
- Nondestructive: 3/3
- Sector combined: 3/3
- Sector separate: 3/3
- Menor sector budget combined: 0.05381622219151731
- Maior d0_neg_re_upper: -0.00012349732062443897
- Tempo: 750.17 s
- Leitura: as falhas `strict/sub8` eram inflacao por subdivisao grosseira.

### projected_j0_positive_box_sector_rect_verifier

- Verificação: `independent rectangle arithmetic verifier`
- Relatório: `/home/thlinux/formalizacao_C2/AUDIT_PROJECTED_J0_POSITIVE_BOX_SECTOR_RECT_VERIFICATION.md`
- JSON: `/home/thlinux/formalizacao_C2/audit_outputs/projected_j0_positive_box_sector_rect_verification.json`
- Caixas: 27
- Subcaixas: 771
- Checks failed: 0
- Max d0 upper recomputed: -0.0001936804971152741284057518107
- Max d0 upper rat: -0.000193680497
- Min main lower recomputed: 0.05862923979330284750172890456
- Min main lower rat: 0.058629239793
- Max rest upper recomputed: 0.004688785969652566538084689602
- Max rest upper rat: 0.004688785970
- Min sector budget rat: 0.054086045801
- Worst box: `s0.84_t7`
- Papel: verificador independente da algebra retangular derivada dos retangulos brutos

### projected_j0_raw_enclosure_contract

- Relatório: `/home/thlinux/formalizacao_C2/AUDIT_PROJECTED_J0_RAW_ENCLOSURE_CONTRACT.md`
- Status: `documented`
- Papel: define o contrato que o produtor de retangulos brutos deve satisfazer
  por subcaixa.

### projected_j0_raw_enclosure_sentinel_checker

- Verificação: `pass`
- Script: `/home/thlinux/formalizacao_C2/operadores/c2_projected_j0_raw_enclosure_sentinel_checker.py`
- Relatório: `/home/thlinux/formalizacao_C2/AUDIT_PROJECTED_J0_RAW_ENCLOSURE_SENTINEL_CHECK.md`
- JSON: `/home/thlinux/formalizacao_C2/audit_outputs/projected_j0_raw_enclosure_sentinel_check.json`
- Boxes checked: 5
- Subboxes checked: 10
- Objects checked: 40
- Contains: 40
- Strict wider: 0
- Inconclusive: 0
- Disjoint fail: 0
- Max width ratio: 0.9999999355595678
- Worst subbox: `s0.84_t0__s00_t000:D0`
- Papel: recomputacao strict localizada dos retangulos brutos para `M`, `D0`,
  `Drest` e `RvecTail`.

### projected_j0_raw_enclosure_batch_M_D0_partial

- Verificação: `pass / partial`
- Script: `/home/thlinux/formalizacao_C2/operadores/c2_projected_j0_raw_enclosure_batch_checker.py`
- Relatório: `/home/thlinux/formalizacao_C2/AUDIT_PROJECTED_J0_RAW_ENCLOSURE_BATCH_CHECK_PARTIAL.md`
- JSON: `/home/thlinux/formalizacao_C2/audit_outputs/projected_j0_raw_enclosure_batches/partial_M_D0_50_summary.json`
- CSV: `/home/thlinux/formalizacao_C2/audit_outputs/projected_j0_raw_enclosure_batches/partial_M_D0_50_summary.csv`
- Boxes checked: 2
- Subboxes checked: 50
- Objects checked: 100
- Contains: 100
- Strict wider: 0
- Inconclusive: 0
- Disjoint fail: 0
- Max width ratio: 0.9999999355595678
- Max D0NegReMain upper strict: -0.00020839735578166672
- Strict nondestructive subboxes: 50/50
- Tempo total: 799.09 s
- Estimativa para 771 subcaixas: 12321.96 s
- Status full run: `prepared / not-run`
- Papel: expansao batch strict para os objetos criticos `M,D0`; a rodada
  completa esta pronta por checkpoint/resume, mas requer janela longa.

### projected_j0_raw_enclosure_batch_M_D0_parallel_smoke

- Verificação: `pass`
- Script: `/home/thlinux/formalizacao_C2/operadores/c2_projected_j0_raw_enclosure_batch_checker.py`
- Relatório: `/home/thlinux/formalizacao_C2/AUDIT_PROJECTED_J0_RAW_ENCLOSURE_BATCH_CHECK_PARALLEL_SMOKE.md`
- JSON: `/home/thlinux/formalizacao_C2/audit_outputs/projected_j0_raw_enclosure_batch_check_M_D0_parallel_smoke.json`
- CSV: `/home/thlinux/formalizacao_C2/audit_outputs/projected_j0_raw_enclosure_batch_check_M_D0_parallel_smoke.csv`
- Workers: 4
- Boxes checked: 2
- Subboxes checked: 50
- Objects checked: 100
- Contains: 100
- Strict wider: 0
- Inconclusive: 0
- Disjoint fail: 0
- Max diff contra parcial serial: 0.0
- Tempo total: 314.49 s
- Speedup contra parcial serial: aproximadamente 2.54x
- Papel: validacao do paralelismo deterministico por batch.

### projected_j0_raw_enclosure_batch_M_D0_all

- Verificação: `pass`
- Script: `/home/thlinux/formalizacao_C2/operadores/c2_projected_j0_raw_enclosure_batch_checker.py`
- Relatório: `/home/thlinux/formalizacao_C2/AUDIT_PROJECTED_J0_RAW_ENCLOSURE_BATCH_CHECK_M_D0_ALL.md`
- JSON: `/home/thlinux/formalizacao_C2/audit_outputs/projected_j0_raw_enclosure_batch_check_M_D0_all.json`
- CSV: `/home/thlinux/formalizacao_C2/audit_outputs/projected_j0_raw_enclosure_batch_check_M_D0_all.csv`
- Workers finais: 56
- Boxes checked: 27
- Subboxes checked: 771
- Objects checked: 1542
- Contains: 1542
- Strict wider: 0
- Inconclusive: 0
- Disjoint fail: 0
- Batch `.done`: 31/31
- Max width ratio: 0.9999999355595678
- Max D0NegReMain upper strict: -0.00019368050160660985
- Strict nondestructive subboxes: 771/771
- Strict nondestructive boxes: 27/27
- Worst box strict: `s0.86_t0`
- Tempo final relancado: 506.37 s
- Papel: recomputacao strict completa dos retangulos brutos criticos `M,D0`.

### projected_j0_raw_enclosure_rest_sentinels

- Verificação: `pass`
- Script: `/home/thlinux/formalizacao_C2/operadores/c2_projected_j0_raw_enclosure_batch_checker.py`
- Relatório: `/home/thlinux/formalizacao_C2/AUDIT_PROJECTED_J0_RAW_ENCLOSURE_REST_SENTINELS.md`
- JSON: `/home/thlinux/formalizacao_C2/audit_outputs/projected_j0_raw_enclosure_rest_sentinels.json`
- CSV: `/home/thlinux/formalizacao_C2/audit_outputs/projected_j0_raw_enclosure_rest_sentinels.csv`
- Workers: 56
- Boxes checked: 5
- Subboxes checked: 160
- Objects checked: 320
- Contains: 320
- Strict wider: 0
- Inconclusive: 0
- Disjoint fail: 0
- Max width ratio: 0.9999999349271238
- Worst subbox: `s0.84_t0__s00_t002:RvecTail`
- Tempo: 174.66 s
- Papel: auditoria sentinela ampliada dos retangulos brutos de `Drest` e
  `RvecTail`.

### projected_j0_raw_enclosure_strict_comparison

- Relatório: `/home/thlinux/formalizacao_C2/AUDIT_PROJECTED_J0_RAW_ENCLOSURE_STRICT_COMPARISON.md`
- Status: `pass / partial-audit`
- Leitura: strict/sub16 recupera as bordas; strict/sub8 confirma `s0.84_t7`
  e `s0.86_t0`; raw sentinel contem as recomputacoes strict nas subcaixas
  auditadas.

### projected_j0_seed_hurts_certificate_pack

- Diretório: `/home/thlinux/formalizacao_C2/audit_outputs/projected_j0_seed_hurts_certificate_pack`
- Verificação: `verified`
- JSON de verificação: `/home/thlinux/formalizacao_C2/audit_outputs/projected_j0_seed_hurts_pack_verification.json`
- Caixas: 6
- Combined certificados: 6/6
- Separate certificados: 5/6
- Min budget combined: 0.00017189821247432305
- Min budget separate: -0.0006216336919868774
- Worst combined box: `s0.74_t45`
- Worst separate box: `s0.74_t45`
- Rerun exit code: 0
- Max rerun diff: 0.0
- Lean schema target: `ProjectedJ0ConstantBoxData combined only; separate nao deve ser usado para s0.74_t45`

## Leitura

O pack positive-box e o bloco robusto atual: foi verificado, reproduziu
com diff maximo zero e certifica todas as caixas em combined e separate.

O pack setorial racionalizado e o bloco positive-box preferido:

```text
preferred_positive_box_pack =
  projected_j0_positive_box_sector_rationalized_pack
```

Justificativa: no setor certificado, `parallelUpper = 0`; o budget e maior que
no pack generico; o chain verifier passa; e existe bridge condicional Lean para
`ProjectedJ0SectorConstantBoxData`.

O certificado por subcaixa e a trilha granular da fronteira externa. Ele checa
cobertura, agregacao box-level, direcoes de arredondamento e budgets contra o
pack racionalizado, mas ainda nao formaliza a validade matematica das
enclosures.

As sentinelas strict/sub16 recuperam as tres caixas de borda que falhavam em
strict/sub8. Isso fortalece a leitura de que `fast/sub32` esta alinhado com um
cross-check strict localizado, embora strict seja caro demais para uso primario.

O rect verifier independente reduz a confianca necessaria no codigo do
certifier para as quantidades derivadas: ele recomputa `D0NegReMain`,
`main_abs_lower` e `rest_combined_upper` apenas a partir dos retangulos brutos
das subcaixas.

O raw enclosure sentinel checker comeca a auditar a fronteira anterior: ele
recomputa em strict os retangulos brutos de subcaixas sentinela e compara com
os retangulos armazenados. A rodada atual e `pass`, mas ainda e auditoria
parcial.

O batch checker `M,D0` amplia essa auditoria para um formato resumivel por
lotes. O parcial de 50 subcaixas passou com todos os retangulos armazenados
contendo a recomputacao strict, e tambem preservou a condicao setorial strict
nessas subcaixas. Ele serviu como referencia serial para validar o smoke
paralelo.

O batch checker paralelo tornou a rodada completa viavel. A versao final com
workers=56 confirmou `M,D0` em todas as 771 subcaixas, com todos os retangulos
armazenados contendo a recomputacao strict, zero `disjoint_fail`, e setor
strict nao-destrutivo em todas as subcaixas. Os sentinelas ampliados de
`Drest,RvecTail` tambem passaram nos cinco boxes auditados.

O pack seed_hurts e fronteira fina: foi verificado e reproduzido, mas a
primeira caixa so deve ser usada em combined.

## O Que Falta Para Prova Lean

Ainda falta uma das seguintes frentes:

1. um verificador externo confiavel com contrato formal claro;
2. formalizacao da aritmetica intervalar relevante;
3. importacao ou validacao certificada das constantes por caixa;
4. prova regional dos campos analiticos consumidos por
   `ProjectedJ0ConstantBoxData`.

Nenhum numero dos packs foi inserido como theorem.
