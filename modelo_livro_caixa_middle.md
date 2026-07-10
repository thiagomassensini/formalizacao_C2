## Livro-caixa atual do middle genuine

Este arquivo e uma explicacao informal, por analogia de livro-caixa, da frente
ativa do middle genuine/C2.

## Escopo corrigido

A API publica em `LeanC2/PeerReview.lean` aponta para a rota atual por estes
certificados, do mais agregado para o mais refinado:

```lean
C2.PeerReview.CollectedSlackMiddleCertificate
C2.PeerReview.PrototypeClearedTotalMiddleCertificate
C2.PeerReview.PrototypeSurplusReserveMiddleCertificate
```

Os endpoints publicos associados incluem:

```lean
C2.PeerReview.genuineCentral_ne_zero_of_collectedSlackMiddleCertificate
C2.PeerReview.genuineCentral_ne_zero_of_prototypeClearedTotalMiddleCertificate
C2.PeerReview.genuineCentral_ne_zero_of_prototypeSurplusReserveMiddleCertificate
```

Ou seja: o arquivo publico nao pede mais o pacote canonico antigo como alvo
middle. Ele pede os ingredientes da rota viva e entrega nao-anulamento do
`genuineCentralDoubleSeries` no middle. A forma operacional mais fina no
horizonte atual e a `PrototypeSurplusReserveMiddleCertificate`, que preserva
explicitamente a reserva de `1 / 4` do caixa limpo.

O livro-caixa vivo deste documento e a rota:

```text
exact-gap anchor / cleared pressure
  -> quarter unit reserve
  -> exact weighted ledger
  -> genuineCentralDoubleSeries s ≠ 0 no middle
```

Essa rota ainda e genuine-first: a faixa middle deve ser fechada pelo lado
genuine/C2, sem usar zeta como entrada analitica para a prova local.

## Status atual

O documento antigo parava no criterio residual bruto associado ao pacote
canonico antigo:

```lean
c2CanonicalClosedScaledResidualUpper
  K M horizontalConstant horizontalScale horizontalRatio s
<
c2ExpandedQuartetResidualMargin s
```

Essa pode continuar existindo como camada estrutural do funil canonico, mas nao
e o alvo da frente pausada. O horizonte atual foi refinado para uma contabilidade
limpa, sem divisao, em cima de uma margem positiva ja depurada.

O alvo ativo mais fino e:

```lean
C2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserveBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Ele e equivalente ao alvo de pressao total:

```lean
C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBoundOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

ou seja, ponto a ponto:

```lean
D(s) + G(s) ≤ (3 / 4) * Q(s)
```

Na analogia do livro-caixa:

- `Q(s)` e o saldo limpo disponivel no caixa.
- `D(s)` e o boleto externo, ja escrito na escala limpa.
- `G(s)` e o custo do lower-factor, tambem na escala limpa.
- O alvo nao e apenas pagar os boletos; e pagar os dois e ainda deixar
  `1 / 4` do saldo como reserva.

Assim, o saldo final exigido e:

```lean
Q(s) - D(s) - G(s) ≥ (1 / 4) * Q(s)
```

que e a mesma coisa que:

```lean
D(s) + G(s) ≤ (3 / 4) * Q(s)
```

## As contas do caixa

Fixe um ponto `s` no middle e escreva:

```lean
r = ‖q s‖
```

O quarteto fornece o chao radial:

```lean
c2ExpandedQuartetK2Margin s
```

e a versao residual, depois de separar a divida vertical basica, e:

```lean
c2ExpandedQuartetResidualMargin s
```

A margem limpa usada na frente atual e:

```lean
c2ExactGapAnchorCanonicalClearedMargin s
```

Formalmente:

```lean
c2ExactGapAnchorCanonicalClearedMargin s
  =
c2ExpandedQuartetResidualMargin s * (1 - ‖q s‖) ^ 2
```

Na analogia: o residual bruto e o valor teorico que o quarteto promete; a margem
limpa `Q(s)` e esse valor ja trazido para a escala em que os boletos atuais sao
comparados.

## Os dois boletos atuais

O primeiro boleto e o debito externo limpo:

```lean
c2ExactGapAnchorCanonicalClearedExternalDebit
  K M horizontalConstant horizontalScale horizontalRatio s
```

Na analogia, ele agrupa a pressao externa que ainda precisa ser paga depois da
limpeza por fatores de borda.

O segundo boleto e o custo limpo do lower-factor:

```lean
c2ExactGapAnchorCanonicalClearedLowerFactorCost s
```

Ele e:

```lean
c2ExactGapAnchorCanonicalLowerFactorClearedWeight s *
  c2ContinuedVerticalAnchorResidualExactLowerFactorUpper s
```

Na analogia, esse e o custo de carregar o residual vertical pelo peso exato do
lower-factor.

Com a notacao compacta:

```lean
Q = c2ExactGapAnchorCanonicalClearedMargin s
D =
  c2ExactGapAnchorCanonicalClearedExternalDebit
    K M horizontalConstant horizontalScale horizontalRatio s
G = c2ExactGapAnchorCanonicalClearedLowerFactorCost s
```

o alvo atual e simplesmente:

```lean
D + G ≤ (3 / 4) * Q
```

## Por que a reserva de um quarto importa

A rota antiga por `UnitReserve` dizia, em essencia, que o lower-factor cabia no
caixa disponivel. Isso era util, mas fraco demais como horizonte principal:
cabia sem garantir uma folga quantitativa suficiente para o fechamento do caixa.

A frente atual exige a forma mais forte:

```lean
C2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserveBudgetOnMiddle
```

Ela diz que o lower-factor cabe mesmo depois de reservar `1 / 4` da margem
limpa. Em Lean, ja foi provado que essa forma e equivalente a:

```lean
C2ExactGapAnchorCanonicalPrototypePressureSurplusReserveBoundOnMiddle
```

e tambem a:

```lean
C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBoundOnMiddle
```

Portanto, os tres jeitos abaixo sao o mesmo alvo matematico:

```lean
C2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserveBudgetOnMiddle

C2ExactGapAnchorCanonicalPrototypePressureSurplusReserveBoundOnMiddle

C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBoundOnMiddle
```

Leitura em portugues: fechar qualquer um deles fecha a mesma conta. A forma
mais legivel para guiar a analise e:

```lean
D + G ≤ (3 / 4) * Q
```

## Como isso desce para nao-anulamento

Depois que o alvo de reserva de um quarto for provado no middle, o arquivo Lean
ja tem os wrappers:

```lean
C2ExactGapAnchorCanonicalExactWeightedLedgerOnMiddle_of_quarterUnitReserve
```

e:

```lean
genuineCentral_ne_zero_on_middle_of_exactGapAnchorCanonicalQuarterUnitReserve
```

O fluxo logico e:

```text
quarter unit reserve
  -> surplus reserve
  -> cleared total pressure bound
  -> exact weighted ledger
  -> exact-gap anchor non-cancellation
  -> genuineCentralDoubleSeries s ≠ 0 no middle
```

Em paralelo, os campos de escala e horizontal ainda precisam estar disponiveis:

```lean
C2ExpandedScalarScaleData
C2ExpandedHorizontalLayerBudget
```

Esses campos sao o lado "sinais, escalas e camada horizontal" da prova. O alvo
`D + G ≤ 3/4 Q` e o lado "fechamento do caixa".

Importante: esse fluxo nao passa por uma reconstrucao do pacote canonico antigo.
Ele fecha o nao-anulamento do middle pela rota exata de anchor/gap.

## O que nao e mais o horizonte principal

Nao devemos tratar como rota ativa principal:

- provar direto o residual bruto com envelopes grossos;
- reconstruir o pacote canonico antigo como se fosse o checkpoint vivo da frente
  atual;
- usar a `UnitReserve` antiga como certificado final;
- voltar para rotas baseadas em `ExactZeta`, `zetaUpper` ou `zetaDepthCore`;
- escolher bounds separados grosseiros que pagam cada boleto isoladamente, mas
  estouram a soma total.

Essas formas podem aparecer como historico, auditoria ou consequencia
downstream. O proximo alvo vivo e a conta agregada fina:

```lean
D(s) + G(s) ≤ (3 / 4) * Q(s)
```

## Proximo passo

O trabalho seguinte deve procurar a prova mais refinada possivel de:

```lean
C2ExactGapAnchorCanonicalLowerFactorClearedQuarterUnitReserveBudgetOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

Equivalente e talvez mais facil de atacar:

```lean
C2ExactGapAnchorCanonicalPrototypePressureClearedTotalBoundOnMiddle
  horizontalConstant horizontalScale horizontalRatio near edge
```

A estrategia recomendada e:

1. Manter `Q` como margem limpa exata ou usar o lower bound mais fino
   disponivel para ela.
2. Controlar `D` e `G` com os uppers mais finos disponiveis, evitando pagar cada
   um por uma cota grosseira independente.
3. Priorizar um estimate agregado para `D + G`, porque o alvo real e a soma
   ficar abaixo de `3 / 4 Q`.
4. So depois converter para `QuarterUnitReserve`, usando as equivalencias ja
   formalizadas.

Resumo da analogia: o middle fecha quando, em cada ponto da regiao, o caixa
limpo `Q` paga o boleto externo `D`, paga o lower-factor `G`, e ainda termina
com pelo menos um quarto do caixa em reserva.

## Laboratorio finito alinhado com o Lean

Para orientar a escolha de bounds antes da formalizacao, foi criado:

```text
operadores/c2_middle_genuine_ledger.py
```

Ele nao e uma prova e nao substitui o Lean. A funcao dele e medir a mesma
moeda do livro-caixa usando um operador finito genuine/C2.

O nucleo finito que ele reproduz e:

```lean
rectangularGenuine s K M
  = rectangularDirect s K M - rectangularBracket s K M
  = 2 * (sum k=2..K q(s)^k) * (sum m odd<=M m^(-s))
```

Em cima disso ele calcula:

```text
Q = cleared_margin
D = cleared_external_debit
G = cleared_lower_factor_cost
total_ratio = (D + G) / Q
quarter_surplus_ratio = 3/4 - total_ratio
```

O script existente mais proximo na pasta `operadores/` era:

```text
operadores/c2_genuine_operator_only_cpu.py
```

Ele e util como referencia de operador genuine finito, mas trabalha como
scanner global `D - B` com cutoff exponencial. Para a rota atual, o laboratorio
mais fiel e o novo `c2_middle_genuine_ledger.py`, porque mede diretamente a
contabilidade `Q, D, G` do middle.

Ponto de cautela: os objetos centrais infinitos/continuados sao representados
no script por referencias finitas C2. Por padrao:

```text
--reference-mode raw
```

Isso usa a referencia retangular crua. Para diagnostico numerico, tambem ha:

```text
--reference-mode exponential
--reference-mode supergaussian --reference-X <X> --reference-p <p>
```

Esses modos seguem regularizacoes finitas C2 ja existentes no Lean. Eles ajudam
a testar estabilidade no eixo critico, mas nao mudam o alvo formal da prova.

Portanto, a coluna `ref_delta` precisa estar pequena/estavel antes de qualquer
conclusao sobre folga. Uma amostra com `ref_delta` grande e apenas teste de
encanamento, nao evidencia para matar rota ou declarar estouro de caixa.

## Cortes finitos escolhidos

A varredura de estabilidade foi feita por:

```text
operadores/c2_middle_reference_stability_sweep.py
```

Na malha `sigma=1/2`, `t=[1,50]`, `dt=0.25`, o melhor compromisso de fidelidade
e custo foi:

```text
--reference-mode supergaussian
--reference-X 10661
--reference-p 2
```

Com essa escolha:

```text
minimo aceitavel:
  K=14, M=8001

recomendado:
  K=15, M=10001

alta confianca:
  K=16, M=12001
```

O corte recomendado foi conferido contra `(K,M)=(16,12001)` e teve
`max_ref_delta` da ordem de `3.2e-7`. O corte de alta confianca foi conferido
contra `(17,16001)` e teve `max_ref_delta` da ordem de `5.1e-10`.

O modo `raw` nao estabilizou no eixo critico e nao deve ser usado como
referencia numerica para decidir folga do middle.

Arquivos de auditoria gerados:

```text
audit_outputs/c2_middle_stability_super_p2_x10661_refined_dt025.csv
audit_outputs/c2_middle_stability_modes_x_p_dt025.csv
audit_outputs/c2_middle_stability_raw_dt025.csv
audit_outputs/c2_middle_ledger_recommended_super_p2_x10661_K15_M10001.csv
audit_outputs/c2_middle_ledger_high_conf_super_p2_x10661_K16_M12001.csv
```

Leitura para a prova: agora temos cortes numericamente confiaveis para medir os
boletos. Como a versao que paga dois uppers centrais separados ainda aparece
cara demais, o proximo refinamento formal deve mirar uma conta central mais
agregada/defect-aware ou uma decomposicao do lower-factor, em vez de aumentar
os cortes esperando que isso sozinho feche o caixa.

## Refinamento do boleto do cutoff e do anchor

A primeira conta estava misturando dois objetos: alvo retangular cru e
referencia supergaussiana. Isso fazia o cutoff parecer enorme.

Quando o alvo finito tambem e supergaussiano:

```text
--target-reference-mode supergaussian
--reference-mode supergaussian --reference-X 10661 --reference-p 2
```

o boleto do cutoff praticamente some:

```text
cutoff_pressure_ratio ~= 1.8e-8
```

Mas o boleto refinado de anchor ainda nao cabe:

```text
defect_anchor_ratio ~= 143.44 no pior ponto testado
```

Na analogia do livro-caixa: quitamos o boleto falso do cutoff, que vinha de
comparar moedas diferentes. Porem o boleto real do anchor/lower-factor continua
maior que a reserva disponivel. Portanto a melhor proxima decisao nao e
empurrar cortes maiores; e trocar a frente para a rota de quarteto ajustado,
onde a conta e uma margem direta:

```text
main - defect - tail > 0
```

Essa frente preserva a regra genuine-first e evita pagar o lower-factor caro do
ledger exact-gap.
