# Audit Projected J0 Positive Box Rationalized Pack Verification

Rota: Genuine-First. Esta verificacao cobre apenas a algebra racional
do pack racionalizado; ela nao prova as enclosures analiticas.

## Resultado

- Checks failed: 0
- Boxes: 27
- Combined survivors: 27
- Separate survivors: 27
- Min budget combined rat: 0.0419881832
- Min budget separate rat: 0.041893943068
- Worst combined box: `s0.84_t7`
- Worst separate box: `s0.84_t7`
- Max rounding loss combined: 0.00000000002113689 at `s0.84_t5`
- Max rounding loss separate: 0.00000000002153838 at `s0.84_t5`

## Respostas

1. O pack racionalizado e internamente consistente se `checks failed = 0`.
2. As direcoes de arredondamento foram verificadas contra os valores raw.
3. Todas as caixas preservam budget positivo em combined e separate.
4. A caixa mais apertada e `s0.84_t7`.
5. A maior perda por arredondamento combined foi 0.00000000002113689.
6. O pack esta pronto para alimentar uma checagem algebraica Lean.
7. Aviso: isto ainda nao prova as enclosures analiticas.

## Failed Checks

- None.
