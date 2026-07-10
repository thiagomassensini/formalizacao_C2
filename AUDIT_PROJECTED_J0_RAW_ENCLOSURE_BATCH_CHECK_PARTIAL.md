# Audit Projected J0 Raw Enclosure Batch Check Partial

Rota: Genuine-First. Este relatorio audita retangulos brutos por recomputacao strict independente para os objetos selecionados. O script nao importa o certifier setorial nem o evaluator; ele reaproveita apenas os helpers intervalares independentes do checker sentinela.

## Resultado

- Status: `pass`
- Boxes checados: 2
- Subcaixas checadas: 50
- Objetos checados: 100
- Contains: 100
- Strict wider: 0
- Inconclusive: 0
- Disjoint fail: 0
- Max width ratio: 0.9999999355595678
- Worst subbox: `s0.84_t0__s00_t000:D0`
- Tempo total: 799.09s
- Tempo por subcaixa: 15.98s
- Estimativa para todas as subcaixas disponiveis: 12321.96s

## Setor Recomputado M,D0

- Subcaixas com D0 upper strict: 50
- Subcaixas strict nondestructive: 50
- Boxes com D0 upper strict: 2
- Boxes strict nondestructive: 2
- Max D0NegReMain upper strict: -0.00020839735578166672
- Max D0NegReMain upper stored: -0.00020839735021895822
- Max D0NegReMain upper rationalized: -0.00020839735
- Worst box strict: `s0.84_t0`

## Leitura

Status `contains` significa que o retangulo armazenado contem a recomputacao strict. Status `strict_wider` significa que a recomputacao strict ficou mais larga, mas ainda sobrepoe o retangulo armazenado. `disjoint_fail` seria a falha dura que suspende a cadeia.

## Nota

Rodada parcial de seguranca: 50 subcaixas, objetos M,D0.

## Limite

Esta auditoria recomputa retangulos brutos por modo strict, mas ainda permanece externa ao kernel Lean e nao formaliza as enclosures analiticas.
