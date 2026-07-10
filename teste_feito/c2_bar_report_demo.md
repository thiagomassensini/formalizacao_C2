# C2 close-the-bar report

Source CSV: `/mnt/data/c2_sigma_v_profile_demo_detail.csv`
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
| t1429 | core | 0.737000 | 7.063284e-03 | 7.041951e-03 | 11/11 | lean_candidate_oriented_pass |
| t1429 | core | 0.740000 | 8.566030e-03 | 8.545159e-03 | 11/11 | lean_candidate_oriented_pass |
| t1429 | core | 0.750000 | 1.341587e-02 | 1.339646e-02 | 11/11 | lean_candidate_oriented_pass |
| t1413 | core | 0.737000 | 2.549369e-02 | 2.542240e-02 | 11/11 | lean_candidate_oriented_pass |
| t1413 | core | 0.740000 | 2.637680e-02 | 2.630708e-02 | 11/11 | lean_candidate_oriented_pass |
| t1413 | core | 0.750000 | 2.931771e-02 | 2.925295e-02 | 11/11 | lean_candidate_oriented_pass |

## Melhores candidatos

| window | split | sigma | Lean C surplus | constants to try in Lean |
|---|---|---:|---:|---|
| t1413 | core | 0.750000 | 2.925295e-02 | main≥5.114568e-02, rest≤2.189273e-02, tail≤0.000000e+00 |
| t1413 | core | 0.740000 | 2.630708e-02 | main≥4.984117e-02, rest≤2.353409e-02, tail≤0.000000e+00 |
| t1413 | core | 0.737000 | 2.542240e-02 | main≥4.947245e-02, rest≤2.405005e-02, tail≤0.000000e+00 |
| t1429 | core | 0.750000 | 1.339646e-02 | main≥3.519447e-02, rest≤2.179801e-02, tail≤0.000000e+00 |
| t1429 | core | 0.740000 | 8.545159e-03 | main≥3.197727e-02, rest≤2.343211e-02, tail≤0.000000e+00 |
| t1429 | core | 0.737000 | 7.041951e-03 | main≥3.098773e-02, rest≤2.394578e-02, tail≤0.000000e+00 |

## Aviso honesto

Este relatório não prova bounds no Lean. Ele escolhe a comparação certa e mede se há folga numérica suficiente para valer a pena formalizar.
