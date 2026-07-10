# Scripts para fechar o bar C2

## O que foi criado

### `c2_sigma_v_profile.py`

Scanner principal para a fase/tilt.

Ele mede, sem usar zeta como input:

- perfil em V por sigma;
- mínimo do operador no intervalo de t;
- defeito da branch barrier;
- curvatura normalizada do tilt;
- decomposição main/rest por depth, core e center;
- três livros-caixa tilt-aware:
  - A: sem tilt explícito;
  - B: tilt como boleto norm-only;
  - C: tilt orientado/coletado no principal.

A comparação central é:

```text
A: |main| > |rest| + tail
B: |main| > |rest| + |tilt_main| + tail
C: |main + tilt_main| > |rest| + tail
```

A coluna mais importante para transformar em bound Lean é a versão `lean_surplus_*`, porque ela usa constantes uniformes no grid:

```text
lean_surplus_tilt_oriented = min_t |main + tilt_main| - max_t |rest| - max_t tail
```

Se isso passa, existe uma chance honesta de formalizar um bound uniforme naquele bloco. Se só o surplus pontual passa, ainda precisa de subdivisão de caixas ou bound dependente de fase.

### `c2_bar_margin_report.py`

Agregador/contador do bar.

Ele lê o CSV detalhado do `c2_sigma_v_profile.py` ou o CSV do `c2_middle_genuine_ledger.py` e produz:

- resumo CSV;
- JSON com os candidatos;
- Markdown com a leitura: quem compara com quem, onde sobra margem, onde estoura.

No modo tilt-aware, ele identifica:

```text
lean_candidate_oriented_pass
pointwise_oriented_pass_but_uniform_constants_fail
base_pointwise_pass_tilt_not_needed
fails_on_grid
```

No modo middle formal, ele lê:

```text
total_ratio = (D + G) / Q
quarter_surplus_ratio = 3/4 - total_ratio
```

A conta formal do bar é:

```text
D + G <= 3/4 * Q
```

## Primeiro teste recomendado

Rodar perto de t igual a 14.13 e 14.29, sem comparar com zeros externos:

```bash
python3 c2_sigma_v_profile.py \
  --nmax 200000 \
  --bg-kmax 12 \
  --x-factor 3 \
  --sigmas 0.72,0.73,0.737,0.74,0.75 \
  --windows t1413:14.13:0.35,t1429:14.29:0.25 \
  --dt 0.001 \
  --splits depth,core,center \
  --main-k-max 5 \
  --core-main 401 \
  --center-main-factor 1.5 \
  --tilt-lambda 1 \
  --csv audit_outputs/c2_sigma_v_profile_detail.csv \
  --summary-csv audit_outputs/c2_sigma_v_profile_summary.csv \
  --json audit_outputs/c2_sigma_v_profile_config.json
```

Depois resumir o bar:

```bash
python3 c2_bar_margin_report.py \
  audit_outputs/c2_sigma_v_profile_detail.csv \
  --out-csv audit_outputs/c2_bar_report_summary.csv \
  --out-json audit_outputs/c2_bar_report_summary.json \
  --out-md audit_outputs/c2_bar_report.md
```

## Leitura rápida do resultado

Prioridade de leitura:

1. `surplus_tilt_oriented`: se passar e o norm-only piorar, o tilt está ajudando como geometria, não como dívida.
2. `lean_surplus_tilt_oriented`: se passar, dá para tentar um bound uniforme direto em Lean.
3. `pointwise_oriented_pass_but_uniform_constants_fail`: passa no grid, mas precisa subdividir caixa ou usar bound mais fase-aware.
4. `branch_abs_defect` e `curvature_weighted_mean_main`: servem para escolher a moeda branch/tilt que vai alimentar o half-disk/quartet.

## Guardrail

Estes scripts são laboratório genuine-first. Eles não usam zeta como entrada analítica, não certificam roundoff, e não substituem intervalo/Lean. Eles só dizem se vale a pena formalizar a conta ou se o bar fechou a comanda na nossa cara.
