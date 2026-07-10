# Audit Projected J0 Positive Box Subbox Coverage Verification

## Resultado

Status: `passou`.

```text
checks_failed = 0
boxes_count = 27
subboxes_count = 771
boxes_with_full_coverage = 27
boxes_with_gaps = 0
boxes_with_bad_sigma = 0
boxes_with_internal_overlaps = 0
max_gap = 0
max_overlap = 0
s0.84_t7 subboxes = 32
```

## Respostas

1. As 27 boxes sao cobertas pelas subboxes?
   True.

2. Ha gaps?
   False.

3. Ha overlaps internos?
   False.

4. Algum sigma range diverge?
   False.

5. Total de subboxes bate com 771?
   True.

6. `s0.84_t7` bate com a sentinela manual?
   True.

7. A cobertura pode ser promovida para prova Lean mecanica?
   Sim: os intervalos formam particoes racionais exatas por box.

## Leitura

Esta verificacao usa `Decimal` e `Fraction`, sem passar por float, para comparar
os endpoints dos boxes e subboxes. Ela so verifica cobertura geometrica dos
intervalos de subbox. Os bounds analiticos por subbox continuam externos.
