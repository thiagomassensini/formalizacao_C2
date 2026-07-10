# Handoff para reinicio do notebook - C2 genuine / center Gaussian tilt

Data: 2026-07-08

Este arquivo e para ser lido no proximo chat depois do reinicio do notebook.

Pedido sugerido para o proximo chat:

```text
Leia HANDOFF_REINICIO_NOTEBOOK_2026-07-08.md e continue exatamente da rota atual.
Nao use zeta como input analitico. Siga Genuine-First.
```

## Regra central

A rota ativa e Genuine-First.

Nao usar zeta, riemannZeta, ExactZeta, zetaUpper, zetaDepthCore, nem qualquer
estimativa/comparacao baseada na zeta para o middle ativo.

O trabalho atual deve ficar no operador genuine/C2, na geometria C2, no operador
center Gaussian e na contabilidade do livro-caixa.

## Estado geral

O workspace esta grande e baguncado, com muitos arquivos de auditoria e rotas
historicas. O mapa principal atualizado e:

```text
MAPA_ROTAS_MIDDLE_GENUINE_ATUAL.md
```

O handoff longo acumulado e:

```text
HANDOFF_NOVO_CHAT_MIDDLE_GENUINE.md
```

Este arquivo aqui e um resumo operacional para retomar rapido.

## Rota principal atual

A frente mais promissora agora e:

```text
C2 center Gaussian / livro-caixa com tilt
```

Objeto numerico estudado:

```text
C_X(s) = sum_{c = 2^k m} 2 * 2^(-k) * c^(-s) * exp(-(c/X)^2)
```

com:

```text
k >= 2
m odd
c = 2^k m
X = nmax / 3 nos testes atuais
```

O avaliador numerico fica em:

```text
operadores/c2_center_gaussian_ledger.py
```

Ele mede splits geometricos:

```text
depth:  |k<=main_k_max| - |k>main_k_max|
core:   |m<=core_main| - |m>core_main|
center: |c<=center_main| - |c>center_main|
```

O objetivo empirico e observar quando:

```text
|main block| - |remaining block| > 0
```

sem destruir cancelamento interno por uma decomposicao grosseira.

## Achados numericos antes do tilt

Parametros mais importantes:

```text
nmax=200000
bg_kmax=12
X=nmax/3
main_k_max=5
core_main=401
center_main_factor=1.5
t in [10,50]
```

Leitura:

```text
1. A cauda vertical k>5 e pequena.
2. O gargalo real e core/horizontal.
3. C0=1.5X e melhor que C0=X nos testes.
4. Aumentar core_main nem sempre ajuda; core_main=401 foi melhor que cortes
   maiores nos testes iniciais, porque blocos maiores carregam mais cancelamento
   interno no main.
```

Refinamento local sem tilt:

```text
t in [13.8,14.5], dt=0.001
nmax=200000, bg_kmax=12, X=nmax/3, core_main=401, C0=1.5X

sigma=0.74:
  core pass 682/701
  worst core surplus ~= -1.468017e-4 perto de t=14.288
  depth pass 701/701
  center pass 701/701

sigma=0.75:
  core pass 701/701
  worst core surplus ~= +0.003605
  depth pass 701/701
  center pass 701/701
```

Arquivos CSV relevantes:

```text
audit_outputs/c2_center_gaussian_ledger_bg12_depth_tail_dt005.csv
audit_outputs/c2_center_gaussian_ledger_bg12_local_t14_dt0001.csv
audit_outputs/c2_center_gaussian_ledger_bg5_sigmas_dt005.csv
audit_outputs/c2_center_gaussian_ledger_bg5_transition_core401_dt005.csv
```

## Tilt formal ja existente

O tilt ja estava formalizado e compila:

```text
LeanC2/Operators/Tilt.lean
LeanC2/Route/BulkAntiMiracleTilt.lean
```

Objeto formal:

```text
bracket2 f c = f(c - 1) + f(c + 1) - 2*f(c)
tilt delta x = x^(-delta)
tiltBracket delta c = bracket2 (tilt delta) c
```

Teoremas ja pagos antes:

```text
tiltBracket_zero
tiltBracket_neg_one
tiltBracket_one_pos
tiltBracket_neg_of_neg_one_lt
tiltBracket_pos_of_pos
tiltBracket_ne_zero_of_sigma_pos_of_ne_half
bracket_tilt_zero
bracket_tilt_pos
bracket_tilt_neg
bracket_tilt_zero_iff_delta_zero
```

Leitura formal:

```text
tiltBracket zera em delta=0;
para delta>0 tem sinal positivo;
para -1<delta<0 tem sinal negativo;
na faixa delta>-1 e c>1, zera exatamente quando delta=0.
```

## O que foi feito antes do reinicio

Foi acrescentada uma normalizacao formal em:

```text
LeanC2/Operators/Tilt.lean
```

Nova definicao:

```lean
noncomputable def normalizedTiltCurvature (δ c : ℝ) : ℝ :=
  c ^ (δ + 2) * tiltBracket δ c
```

Novos lemas provados:

```text
normalizedTiltCurvature_zero
normalizedTiltCurvature_pos_of_pos
normalizedTiltCurvature_neg_of_neg_one_lt
normalizedTiltCurvature_zero_iff_delta_zero
```

Leitura:

```text
normalizedTiltCurvature e tiltBracket multiplicado por c^(delta+2).
Como c^(delta+2)>0 para c>0, a normalizacao preserva sinal e zeros.
```

Isso justifica matematicamente a "lupa" numerica usada no scanner:

```text
transverse-curvature = c^2 * tiltBracket(delta,c) / c^(-delta)
                     = c^(delta+2) * tiltBracket(delta,c)
```

Depois do reinicio foi acrescentada a ponte local:

```text
LeanC2/Operators/CenterGaussianTilt.lean
```

Objeto formal novo:

```lean
centerGaussianTiltFactor lam delta c =
  1 + lam * normalizedTiltCurvature delta c

centerGaussianTiltedFiniteLedger S term center lam delta =
  sum_{a in S} centerGaussianTiltFactor lam delta (center a) * term a
```

Novos lemas provados:

```text
centerGaussianTiltFactor_zero_delta
centerGaussianTiltFactor_zero_lambda
centerGaussianTiltFactor_sub_one
centerGaussianTiltFactor_gt_one_of_pos
centerGaussianTiltFactor_lt_one_of_neg
centerGaussianTiltFactor_pos_of_product_gt_neg_one
centerGaussianTiltFactor_ne_zero_of_product_gt_neg_one
centerGaussianTiltFactor_eq_one_iff_delta_zero
centerGaussianTiltedFiniteLedger_zero_delta
centerGaussianTiltedFiniteLedger_filter_add_filter_not
```

Leitura:

```text
O fator perturbativo fica igual a 1 na linha critica; para lam>0 fica acima de
1 quando delta>0 e abaixo de 1 quando -1<delta<0. A soma finita inclinada
preserva a decomposicao por blocos via filtros, preparando depth/core/center.
```

## Modos adicionados ao avaliador numerico

Arquivo:

```text
operadores/c2_center_gaussian_ledger.py
```

Novos modos:

```text
--tilt-mode none
--tilt-mode tilt-bracket
--tilt-mode transverse-norm
--tilt-mode transverse-curvature
--tilt-mode depth-linear
```

Significado:

```text
tilt-bracket:
  usa literalmente tiltBracket delta c.

transverse-norm:
  usa tiltBracket delta c / c^(-delta).

transverse-curvature:
  usa c^2 * tiltBracket delta c / c^(-delta),
  isto e, normalizedTiltCurvature.

depth-linear:
  bias vertical exploratorio; menos canonico.
```

## Resultado numerico principal com tilt

Rodada global com `transverse-curvature, lambda=1`:

```text
python3 operadores/c2_center_gaussian_ledger.py \
  --nmax 200000 --bg-kmax 12 --x-factor 3 \
  --sigmas 0.5,0.6,0.7,0.74,0.75 \
  --tmin 10 --tmax 50 --dt 0.05 \
  --main-k-max 5 --core-main 401 --center-main-factor 1.5 \
  --tilt-mode transverse-curvature --tilt-lambda 1 \
  --threads 56 --top 3 \
  --csv audit_outputs/c2_center_gaussian_ledger_tilt_transverse_curv_l1_dt005.csv
```

Resultado importante:

```text
sigma=0.74:
  core pass 801/801 no grid dt=0.05
  worst core surplus ~= +1.854056e-03

sigma=0.75:
  core pass 801/801
  worst core surplus ~= +6.866401e-03
```

Rodada local fina:

```text
python3 operadores/c2_center_gaussian_ledger.py \
  --nmax 200000 --bg-kmax 12 --x-factor 3 \
  --sigmas 0.72,0.73,0.74,0.75 \
  --tmin 13.8 --tmax 14.5 --dt 0.001 \
  --main-k-max 5 --core-main 401 --center-main-factor 1.5 \
  --tilt-mode transverse-curvature --tilt-lambda 1 \
  --threads 56 --top 4 \
  --csv audit_outputs/c2_center_gaussian_ledger_tilt_transverse_curv_l1_local_t14.csv
```

Resultado:

```text
sigma=0.72:
  core pass 582/701
  worst core surplus ~= -9.158489e-03

sigma=0.73:
  core pass 624/701
  worst core surplus ~= -3.652036e-03

sigma=0.74:
  core pass 701/701
  worst core surplus ~= +1.598049e-03

sigma=0.75:
  core pass 701/701
  worst core surplus ~= +6.605718e-03
```

Busca fina de threshold:

```text
python3 operadores/c2_center_gaussian_ledger.py \
  --nmax 200000 --bg-kmax 12 --x-factor 3 \
  --sigmas 0.735,0.736,0.737,0.738,0.739,0.740 \
  --tmin 13.8 --tmax 14.5 --dt 0.001 \
  --main-k-max 5 --core-main 401 --center-main-factor 1.5 \
  --tilt-mode transverse-curvature --tilt-lambda 1 \
  --threads 56 --top 2 \
  --csv audit_outputs/c2_center_gaussian_ledger_tilt_transverse_curv_l1_local_threshold.csv
```

Comparacao local:

```text
Sem tilt:
  sigma=0.740: worst core surplus ~= -1.468e-4

Com transverse-curvature, lambda=1:
  sigma=0.735: worst core surplus ~= -9.958e-4
  sigma=0.736: worst core surplus ~= -4.720e-4
  sigma=0.737: worst core surplus ~= +4.938e-5
  sigma=0.738: worst core surplus ~= +5.682e-4
  sigma=0.739: worst core surplus ~= +1.084e-3
  sigma=0.740: worst core surplus ~= +1.598e-3
```

Conclusao empirica:

```text
Inserir a curvatura do tilt melhora a borda observada do core.
A virada local passa de perto de sigma ~= 0.740+ para perto de sigma ~= 0.737.
```

## Arquivos de saida novos do tilt

```text
audit_outputs/c2_center_gaussian_ledger_tilt_bracket_l1_dt005.csv
audit_outputs/c2_center_gaussian_ledger_tilt_transverse_curv_l1_dt005.csv
audit_outputs/c2_center_gaussian_ledger_tilt_transverse_curv_l1_local_t14.csv
audit_outputs/c2_center_gaussian_ledger_tilt_transverse_curv_l1_local_threshold.csv
audit_outputs/c2_center_gaussian_ledger_notilt_local_threshold.csv
```

Audit de boletos Lean extraidos dos CSVs:

```text
AUDIT_C2_CENTER_GAUSSIAN_TILT_LEDGER_BOLETOS_LEAN.md
```

Leitura operacional:

```text
core/horizontal e o gargalo. Sigma=0.750 e o primeiro alvo formal conservador
porque deixa margem core na escala 6e-3. Sigma=0.740 vem depois, com margem
core na escala 1.6e-3. Sigma=0.737 passa no grid local, mas e fino demais para
ser o primeiro fechamento formal.
```

## Verificacoes que passaram

Comandos rodados e passaram:

```text
lake env lean LeanC2/Operators/Tilt.lean
lake build LeanC2.Operators.Tilt
lake env lean LeanC2/Operators/CenterGaussianTilt.lean
lake build LeanC2.Operators.CenterGaussianTilt
lake env lean LeanC2/Route/BulkAntiMiracleTilt.lean
lake env lean LeanC2.lean
python3 -m py_compile operadores/c2_center_gaussian_ledger.py
```

Tambem foi feita varredura no script para evitar uso externo proibido; ele nao
usa zeta nem comparacao externa.

## Documentos atualizados

Foram atualizados:

```text
HANDOFF_NOVO_CHAT_MIDDLE_GENUINE.md
MAPA_ROTAS_MIDDLE_GENUINE_ATUAL.md
AUDIT_C2_CENTER_GAUSSIAN_TILT_LEDGER_BOLETOS_LEAN.md
ROTA_GEOMETRICA_BRANCH_TILT_QUARTET_MIDDLE.md
AUDIT_TILT_AWARE_MIDDLE_LEDGER_EXPERIMENT.md
```

O MAPA agora tem a secao:

```text
C2 center Gaussian / livro-caixa com tilt
Rota geometrica branch / tilt / quartet / half-disk
```

O HANDOFF longo agora tem a secao:

```text
Atualizacao 2026-07-08: tilt no center Gaussian
```

## O que ainda nao esta provado

Ja esta pago:

```text
1. tiltBracket formal;
2. sinal/zero do tiltBracket;
3. normalizacao normalizedTiltCurvature;
4. preservacao de sinal/zero da normalizacao;
5. ponte abstrata do fator centerGaussianTiltFactor;
6. branch barrier com tricotomia exata em sigma=1/2;
7. superficie half-disk/quartet em torno de 1/2;
8. evidencia numerica de melhora do livro-caixa no center Gaussian.
```

Ainda nao esta pago:

```text
1. medir o perfil em V sem usar zeta como input analitico;
2. escolher a moeda branch/tilt que melhor paga o upper do quartet/half-disk;
3. formalizar a ponte pequena branch/tilt -> half-disk budget;
4. certificar grid-to-continuum e roundoff/intervalos para a desigualdade;
5. conectar o budget half-disk ao pacote middle genuine principal.
```

## Proximo passo recomendado

Nao ir direto para uma prova gigante.

Proximo passo fino:

```text
1. Seguir ROTA_GEOMETRICA_BRANCH_TILT_QUARTET_MIDDLE.md.
2. Manter center Gaussian tilt como laboratorio, nao como alvo formal primario.
3. Construir o scanner de perfil em V:
   min_abs(sigma,t), branch_defect, normalizedTiltCurvature e half-disk
   distance quando disponivel.
4. No mesmo grid, comparar tres ledgers:
   - sem tilt explicito;
   - tilt como boleto norm-only;
   - tilt orientado/coletado no principal.
5. Rodar primeiro perto de t ~= 14.13 e t ~= 14.29.
6. Usar a moeda branch/tilt que melhor paga o upper do quartet/half-disk.
7. So depois formalizar a ponte Lean branch/tilt -> half-disk budget.
```

Frase-guia:

```text
O tilt e a curvatura transversal do middle. Se entra so como modulo, vira
imposto; se entra como geometria orientada, pode virar margem.
```

Experimento ja rodado:

```text
AUDIT_TILT_AWARE_MIDDLE_LEDGER_EXPERIMENT.md
```

Leitura:

```text
No center Gaussian core, norm-only falha forte e oriented melhora todos os
pontos para sigma>=0.737 nos grids testados. No adjusted quartet positive-box,
norm-only reduz margem; oriented depende da parametrizacao e ainda precisa
calibragem.
```

Possivel proximo alvo Lean depois do scanner:

```text
LeanC2/Route/HalfInvariantBridge.lean
```

ou, se ficar mais natural no encanamento existente:

```text
LeanC2/AuditGenuineMiddle.lean
```

## Cuidado tecnico

O modo `tilt-bracket` e o objeto formal bruto. Ele e fiel ao Lean, mas
numericamente muito pequeno.

O modo `transverse-curvature` e a normalizacao que deu ganho numerico. Agora ele
tambem tem justificativa Lean como `normalizedTiltCurvature`, porque preserva
sinal e zeros do bracket bruto.

Nao tratar `transverse-curvature` como ajuste arbitrario; tratar como bracket
centrado normalizado pela escala natural `c^(delta+2)`.

## Worktree

O workspace tem muitas mudancas/untracked antigas. Nao reverter nada sem pedido
explicito do usuario.

Arquivos mexidos nesta etapa:

```text
LeanC2/Operators/Tilt.lean
LeanC2/Operators/CenterGaussianTilt.lean
operadores/c2_center_gaussian_ledger.py
HANDOFF_NOVO_CHAT_MIDDLE_GENUINE.md
MAPA_ROTAS_MIDDLE_GENUINE_ATUAL.md
HANDOFF_REINICIO_NOTEBOOK_2026-07-08.md
```

Arquivos novos/atualizados de audit output:

```text
audit_outputs/c2_center_gaussian_ledger_tilt_bracket_l1_dt005.csv
audit_outputs/c2_center_gaussian_ledger_tilt_transverse_curv_l1_dt005.csv
audit_outputs/c2_center_gaussian_ledger_tilt_transverse_curv_l1_local_t14.csv
audit_outputs/c2_center_gaussian_ledger_tilt_transverse_curv_l1_local_threshold.csv
audit_outputs/c2_center_gaussian_ledger_notilt_local_threshold.csv
```
