# Audit Projected J0 Positive Box Sector Rect Verification

Rota: Genuine-First. Este verificador e independente do certifier: ele le os retangulos complexos ja emitidos por subcaixa e recomputa apenas a algebra retangular derivada.

## Resultado

- Status: passa
- Checks failed: 0
- Boxes: 27
- Subboxes: 771
- Max d0 upper recomputed: -0.0001936804971152741284057518107
- Max d0 upper recorded: -0.00019368049701349772
- Max d0 upper rat: -0.000193680497
- Min main lower recomputed: 0.05862923979330284750172890456
- Min main lower recorded: 0.05862923979330283
- Min main lower rat: 0.058629239793
- Max rest upper recomputed: 0.004688785969652566538084689602
- Max rest upper recorded: 0.0046887859697952155
- Max rest upper rat: 0.004688785970
- Max rest separate upper recomputed: 0.004688898630447802406535825114
- Max rest separate upper recorded: 0.004688898630447803
- Max rest separate upper rat: 0.004688898631
- Min sector budget rat: 0.054086045801
- Worst box: `s0.84_t7`
- Min slack main lower: 0.00000000000006242860464095025
- Max slack rest upper: 0.000000000001061850146922346585

## Respostas

1. O verificador retangular independente passa.
2. Ele recomputa `D0NegReMain` a partir dos retangulos de `D0` e `M`.
3. Ele recomputa o lower de main a partir do retangulo de `M`.
4. Ele recomputa o upper do resto combinado a partir de `Drest + RvecTail`.
5. Os racionais do pack continuam seguros quando nao ha checks falhos. A
   variante separate tambem foi recomputada porque os campos `Drest_abs_upper`
   e `RvecTail_abs_upper` estavam presentes.
6. Menor folga main: 0.00000000000006242860464095025.
7. Maior folga rest: 0.000000000001061850146922346585.
8. Maior d0 upper recomputado: -0.0001936804971152741284057518107.
9. O resultado aumenta a confianca no fast/sub32 porque remove uma parte da dependencia no codigo do certifier para as quantidades derivadas.
10. Limite: ainda se confia nos retangulos brutos produzidos pelo certifier.

## Failed Checks

- None
