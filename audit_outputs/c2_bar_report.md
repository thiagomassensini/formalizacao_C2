# C2 close-the-bar report

Source CSV: `audit_outputs/c2_sigma_v_profile_detail.csv`
Detected mode: `tilt`

## Quem compara com quem

Para o laboratório tilt-aware:

- Ledger A compara `|main|` contra `|rest| + tail_upper`.
- Ledger B compara `|main|` contra `|rest| + |tilt_main| + tail_upper`; esse é o controle negativo, porque trata tilt como imposto.
- Ledger C compara `|main + tilt_main|` contra `|rest| + tail_upper`; esse é o candidato orientado.
- A coluna `lean_surplus_*` é mais dura que a pontual: usa mínimo do main e máximo do rest/tail no grid inteiro.

## Piores grupos por margem Lean-style orientada

| window | split | sigma | pointwise C worst | Lean C surplus | pass C | verdict |
|---|---|---:|---:|---:|---:|---|
| t1413 | core | 0.720000 | -1.897829e-03 | -2.397495e-03 | 651/701 | fails_on_grid |
| t1429 | core | 0.720000 | -1.897829e-03 | -2.079022e-03 | 451/501 | fails_on_grid |
| t1413 | core | 0.730000 | 3.467433e-03 | 3.002744e-03 | 701/701 | lean_candidate_oriented_pass |
| t1429 | core | 0.730000 | 3.467433e-03 | 3.299625e-03 | 501/501 | lean_candidate_oriented_pass |
| t1413 | core | 0.737000 | 7.063284e-03 | 6.621306e-03 | 701/701 | lean_candidate_oriented_pass |
| t1429 | core | 0.737000 | 7.063284e-03 | 6.903954e-03 | 501/501 | lean_candidate_oriented_pass |
| t1413 | core | 0.740000 | 8.565340e-03 | 8.133103e-03 | 701/701 | lean_candidate_oriented_pass |
| t1429 | core | 0.740000 | 8.565340e-03 | 8.409863e-03 | 501/501 | lean_candidate_oriented_pass |
| t1413 | center | 0.720000 | 1.213350e-02 | 1.172941e-02 | 701/701 | lean_candidate_oriented_pass |
| t1429 | center | 0.720000 | 1.213350e-02 | 1.202640e-02 | 501/501 | lean_candidate_oriented_pass |
| t1413 | core | 0.750000 | 1.341174e-02 | 1.300941e-02 | 701/701 | lean_candidate_oriented_pass |
| t1429 | core | 0.750000 | 1.341174e-02 | 1.326742e-02 | 501/501 | lean_candidate_oriented_pass |
| t1413 | center | 0.730000 | 1.760805e-02 | 1.724824e-02 | 701/701 | lean_candidate_oriented_pass |
| t1429 | center | 0.730000 | 1.760805e-02 | 1.751268e-02 | 501/501 | lean_candidate_oriented_pass |
| t1413 | center | 0.737000 | 2.119646e-02 | 2.086473e-02 | 701/701 | lean_candidate_oriented_pass |
| t1429 | center | 0.737000 | 2.119646e-02 | 2.110854e-02 | 501/501 | lean_candidate_oriented_pass |
| t1413 | center | 0.740000 | 2.267703e-02 | 2.235665e-02 | 701/701 | lean_candidate_oriented_pass |
| t1429 | center | 0.740000 | 2.267703e-02 | 2.259211e-02 | 501/501 | lean_candidate_oriented_pass |
| t1413 | center | 0.750000 | 2.738029e-02 | 2.709502e-02 | 701/701 | lean_candidate_oriented_pass |
| t1429 | center | 0.750000 | 2.738029e-02 | 2.730467e-02 | 501/501 | lean_candidate_oriented_pass |

## Melhores candidatos

| window | split | sigma | Lean C surplus | constants to try in Lean |
|---|---|---:|---:|---|
| t1413 | depth | 0.750000 | 5.239407e-02 | main≥5.291923e-02, rest≤5.251584e-04, tail≤0.000000e+00 |
| t1429 | depth | 0.750000 | 5.233177e-02 | main≥5.291923e-02, rest≤5.874574e-04, tail≤0.000000e+00 |
| t1413 | depth | 0.740000 | 5.061887e-02 | main≥5.116164e-02, rest≤5.427683e-04, tail≤0.000000e+00 |
| t1429 | depth | 0.740000 | 5.055280e-02 | main≥5.116164e-02, rest≤6.088394e-04, tail≤0.000000e+00 |
| t1413 | depth | 0.737000 | 5.008125e-02 | main≥5.062944e-02, rest≤5.481869e-04, tail≤0.000000e+00 |
| t1429 | depth | 0.737000 | 5.001401e-02 | main≥5.062944e-02, rest≤6.154311e-04, tail≤0.000000e+00 |
| t1413 | depth | 0.730000 | 4.881766e-02 | main≥4.937874e-02, rest≤5.610844e-04, tail≤0.000000e+00 |
| t1429 | depth | 0.730000 | 4.874760e-02 | main≥4.937874e-02, rest≤6.311423e-04, tail≤0.000000e+00 |
| t1413 | depth | 0.720000 | 4.698989e-02 | main≥4.757004e-02, rest≤5.801538e-04, tail≤0.000000e+00 |
| t1429 | depth | 0.720000 | 4.691562e-02 | main≥4.757004e-02, rest≤6.544226e-04, tail≤0.000000e+00 |

## Aviso honesto

Este relatório não prova bounds no Lean. Ele escolhe a comparação certa e mede se há folga numérica suficiente para valer a pena formalizar.
