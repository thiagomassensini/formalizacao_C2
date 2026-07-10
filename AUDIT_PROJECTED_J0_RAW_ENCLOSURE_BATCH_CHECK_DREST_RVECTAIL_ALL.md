# Audit Projected J0 Raw Enclosure Batch Check Drest RvecTail All

Rota: Genuine-First. Este relatorio audita retangulos brutos por recomputacao strict independente para os objetos selecionados. O script nao importa o certifier setorial nem o evaluator; ele reaproveita apenas os helpers intervalares independentes do checker sentinela.

## Resultado

- Status: `pass`
- Boxes checados: 27
- Subcaixas checadas: 771
- Objetos checados: 1542
- Contains: 1542
- Strict wider: 0
- Inconclusive: 0
- Disjoint fail: 0
- Max width ratio: 0.9999999349271238
- Worst subbox: `s0.84_t0__s00_t002:RvecTail`
- Tempo total: 580.57s
- Tempo por subcaixa: 0.75s
- Estimativa para todas as subcaixas disponiveis: 580.57s

## Setor Recomputado M,D0

- Subcaixas com D0 upper strict: 771
- Subcaixas strict nondestructive: 771
- Boxes com D0 upper strict: 27
- Boxes strict nondestructive: 27
- Max D0NegReMain upper strict: -0.00019368050160660985
- Max D0NegReMain upper stored: -0.00019368049701349772
- Max D0NegReMain upper rationalized: -0.000193680497
- Worst box strict: `s0.86_t0`

## Leitura

Status `contains` significa que o retangulo armazenado contem a recomputacao strict. Status `strict_wider` significa que a recomputacao strict ficou mais larga, mas ainda sobrepoe o retangulo armazenado. `disjoint_fail` seria a falha dura que suspende a cadeia.

## Nota

Rodada completa strict para Drest,RvecTail em todas as subboxes positive-box.

## Limite

Esta auditoria recomputa retangulos brutos por modo strict, mas ainda permanece externa ao kernel Lean e nao formaliza as enclosures analiticas.
