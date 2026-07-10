# Projected J0 Positive Box Sector Certificate Pack

Created UTC: 2026-07-09T03:24:45.333894+00:00

This is an external, reproducible sector certificate pack. It is not an automatic Lean proof.

## Result

- Boxes: 27
- Certified nondestructive: 27/27
- Certified sector combined: 27/27
- Certified sector separate: 27/27
- Min sector budget combined: 5.408604580200e-02
- Min sector budget separate: 5.403134348438e-02
- Worst combined box: `s0.84_t7`
- Max D0 neg-real upper: -1.936804970135e-04 at `s0.86_t0`

## Interpretation

The sector condition certifies `D0NegReMain <= 0` on every positive-box box in this pack.
Therefore the external constants can use `numeratorUpper = 0` and `parallelUpper = 0`.

The remaining budget is `mainLower - restUpper > 0`.
