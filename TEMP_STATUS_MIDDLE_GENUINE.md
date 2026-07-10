# Status real do middle genuine-first no Lean

Arquivo temporario, feito so pra leitura rapida. Pode apagar depois.

## Resumo honesto

Mano, o Lean NAO fechou ainda o "middle infinito completo" do operador
genuine central.

Atualizacao de 24/06/2026: a ponte de remainder foi estendida para a regiao
finita natural

```lean
superGaussianFiniteTwoCoreReciprocalDyadic64ScaleRegion K
```

ou seja, a regiao com cutoff

```lean
64 * 2^(K+1) / Re(s) <= X
```

Agora o Lean tem os lemas:

- `superGaussianTwoCoreGenuineBlockNormLowerOn_finiteDyadic64`
- `superGaussianTwoCoreGenuineBlockNormLowerPositiveOn_finiteDyadic64`
- `superGaussianTwoCoreGenuineExtensionNonvanishingOn_finiteDyadic64_of_profileLower`
- `superGaussianFiniteGenuineRectangleRemainderControlledRegion`
- `superGaussianFiniteGenuineRectangleRemainderBelowOn_controlledRegion`
- `superGaussianFiniteGenuineRectangle_nonvanishingOn_remainderControlledRegion`
- `superGaussianFiniteGenuineRectangleNonvanishingOn_finiteDyadic64_of_normUpperBelow`
- `superGaussianFiniteGenuineRectangle_five_three_nonvanishingOn_finiteDyadic64`

Traducao: se a proxima conta provar que o upper explicito do remainder finito
fica abaixo do lower profile restaurado do two-core nessa mesma regiao finita,
o Lean ja fecha o nao-cancelamento do retangulo finite genuine. Isso e
genuine-first puro: bloco two-core certificado + remainder geometrico dominado.
Tambem existe agora uma regiao nomeada que carrega exatamente essa desigualdade
de remainder, para facilitar referencia no artigo e nas proximas reducoes.

Atualizacao 2 de 24/06/2026: a escala dyadica finita tambem foi fechada em
forma pontual. Para todo ponto do strip `0 < Re(s) <= 1` e todo `K >= 2`, Lean
agora prova que o cutoff canonico

```lean
superGaussianFiniteTwoCoreReciprocalCutoffScale K s
```

produz um retangulo finite genuine two-core nao nulo:

```lean
superGaussianFiniteGenuineRectangle 2
  (superGaussianFiniteTwoCoreReciprocalCutoffScale K s) s K 3 ≠ 0
```

Isso ficou registrado por:

- `superGaussianFiniteTwoCoreReciprocalDyadic64ScaleRegion_at_scale`
- `superGaussianFiniteGenuineRectangle_three_ne_zero_at_reciprocalDyadic64`
- `exists_superGaussianFiniteGenuineRectangle_three_ne_zero_of_unitStrip`
- `no_zero_superGaussianFiniteGenuineRectangle_three_at_reciprocalDyadic64`

Tambem ficou empacotada a passagem "dyadic64 + upper abaixo do profile" para a
regiao nomeada de remainder controlado:

- `superGaussianFiniteGenuineRectangleRemainderControlledRegion_of_finiteDyadic64`
- `superGaussianFiniteGenuineRectangleRemainderControlledRegion_five_three_of_finiteDyadic64`

Traducao: a parte finita two-core nao tem zero na escala canonica; o proximo
problema real continua sendo provar que o resto fora desse two-core fica abaixo
do lower profile, ou trocar esse alvo por uma decomposicao genuine ainda mais
fina que capture o cancelamento do quarteto.

Atualizacao 3 de 24/06/2026: o remainder finite two-core `M = 3` fora do bloco
certificado `5 x 3` agora tem uma cauda dyadica explicita. Lean provou:

```lean
superGaussianFiniteGenuineRectangleRemainderNormUpper 2 K 3 X s <=
  superGaussianFiniteTwoCoreRemainderUnitStripTailUpper K
```

e tambem fechou a forma:

```lean
superGaussianFiniteTwoCoreRemainderUnitStripTailUpper K =
  sum_{k = 6..K} 4 * (1 / 2)^k
```

com o bound uniforme:

```lean
superGaussianFiniteTwoCoreRemainderUnitStripTailUpper K <= 1 / 8
```

Declaracoes novas:

- `superGaussianFiniteTwoCoreRemainderUnitStripTailUpper`
- `superGaussianGenuineAddressTermNorm_le_unitStripTwoCoreTailTerm`
- `superGaussianFiniteGenuineRectangleRemainderNormUpper_two_three_le_unitStripTailUpper`
- `superGaussianFiniteGenuineAddressSet_three_sdiff_five_three_eq_depthTail`
- `superGaussianFiniteTwoCoreRemainderUnitStripTailUpper_eq_depthSum`
- `superGaussianFiniteTwoCoreRemainderUnitStripTailUpper_le_one_eighth`

Tambem existe uma regiao nova:

```lean
superGaussianFiniteTwoCoreTailDominatedRegion K
```

que significa: regiao dyadic64 + `tailUpper K < lowerProfile`. Nessa regiao,
Lean ja fecha:

```lean
superGaussianFiniteGenuineRectangle 2 X s K 3 != 0
```

para `K >= 5`. Como corolario concreto, se

```lean
1 / 8 < superGaussianTwoCoreGenuineBlockNormLowerProfile 2 s X
```

entao o finite two-core `M = 3` fecha naquele ponto.

Interpretacao: a cauda pura de profundidade ja esta controlada por `1 / 8`.
O que ainda nao pode ser assumido globalmente e que o lower profile passe dessa
margem em todo o strip, especialmente quando `Re(s)` fica muito pequeno. Esse e
um limite matematico real da rota atual, nao uma falha tecnica do Lean.

Atualizacao 4 de 24/06/2026: a contabilidade de profundidade finita foi
melhorada. Em vez de comparar tudo contra o bloco minimo `5 x 3`, Lean agora
usa o retangulo finite two-core completo ate profundidade `K` como bloco
certificado. Foi definido o lower profile:

```lean
superGaussianFiniteTwoCoreUnitStripNormLower K X s
```

que e a margem raw unit-strip menos o erro de cutoff dyadico. Lean provou que:

```lean
superGaussianFiniteTwoCoreUnitStripNormLower K X s <=
  norm (superGaussianFiniteGenuineRectangle 2 X s K 3)
```

Tambem foi definida a cauda de profundidade `K -> L`:

```lean
superGaussianFiniteTwoCorePostDepthRemainder K L
```

e Lean fechou a contabilidade:

```lean
superGaussianFiniteGenuineRectangle 2 X s L 3 =
  superGaussianFiniteTwoCoreFullDepthExtension K
    (superGaussianFiniteTwoCorePostDepthRemainder K L) X s
```

com bound de cauda:

```lean
norm (superGaussianFiniteTwoCorePostDepthRemainder K L s X) <=
  superGaussianFiniteTwoCorePostDepthTailUpper K L
```

e

```lean
superGaussianFiniteTwoCorePostDepthTailUpper K L <=
  8 * (1 / 2)^(K + 1)
```

Conclusao Lean:

```lean
8 * (1 / 2)^(K + 1) <
  superGaussianFiniteTwoCoreUnitStripNormLower K X s
```

implica:

```lean
superGaussianFiniteGenuineRectangle 2 X s L 3 != 0
```

para todo `L >= K`. Isso ficou empacotado como:

```lean
superGaussianFiniteTwoCoreDepthStableRegion K
```

e o teorema:

```lean
superGaussianFiniteGenuineRectangle_three_nonvanishingOn_depthStableRegion
```

Interpretacao: esta e uma melhora importante. A cauda fixa `1 / 8` era a cauda
fora do bloco minimo `5 x 3`. Agora, usando o bloco completo ate `K`, a cauda
posterior decai como `2^(-(K+1))`. Essa e a forma natural para tentar passar ao
limite/fechar estabilidade, porque a profundidade pode compensar margens
pequenas.

Mas tambem nao estamos no escuro. O que temos hoje no Lean e bem mais que
tentativa solta: temos um encanamento genuine-first muito organizado, com varias
pecas fortes ja provadas e o gargalo atual reduzido a desigualdades explicitas.

Minha leitura real:

- a geometria finita raw esta muito bem controlada;
- o bloco two-core super-Gaussian `p = 2` esta muito bem controlado em regioes
  de escala;
- o Lean ja sabe transformar varias obrigacoes de nao cancelamento em
  desigualdades reais explicitas;
- o que ainda falta e dominar o resto/remainder do middle ou provar uma condicao
  de escala/remainder forte o bastante para cobrir a regiao desejada.

Ou seja: nao e "provamos tudo"; tambem nao e "nao tem nada". O status real e:
temos uma rota genuine-first seria, auditavel, e bastante avancada, mas a parte
global do middle ainda tem obrigacoes matematicas reais.

## O que ja esta fechado no Lean

### 1. A vertical C2 raw nao cria zero

Lean provou que o fator vertical finito nao zera em `Re(s) > 0`, para qualquer
cutoff finito `K >= 2`.

Traduzindo:

> se aparecer cancelamento no raw finite genuine, nao e por culpa da direcao
> vertical C2.

Isso e importante porque tira uma fonte inteira de suspeita.

Declaracoes principais:

- `finite_geometric_depth_sum_ne_zero_of_norm_lt_one`
- `rectangularDepthFactor_ne_zero_of_re_pos`
- `rectangularGenuine_three_ne_zero_of_re_pos`

### 2. O raw two-core finito e nao zero

Para o bloco raw com cores impares `1` e `3`, o Lean provou nao cancelamento em
`Re(s) > 0`.

Esse e o bloco geometrico basico:

```lean
rectangularGenuine s K 3 ≠ 0
```

para `0 < Re(s)` e `K >= 2`.

Isso e genuine-first puro. Nada de zeta.

### 3. Existe uma margem inferior raw uniforme

Lean nao so provou que o raw nao zera. Ele tambem deu uma margem de norma:

```lean
finiteDepthVerticalNormLower s =
  ‖q s‖^2 * (1 - ‖q s‖) / (1 + ‖q s‖)
```

E para o two-core:

```lean
rectangularGenuineUniformDepthThreeNormLower s ≤
  ‖rectangularGenuine s K 3‖
```

Traduzindo:

> temos um chao quantitativo para comparar cutoff/remainder.

Isso e muito melhor que so saber "nao zera".

### 4. No strip `0 < Re(s) <= 1`, o Lean fechou uma margem explicita

No strip unitario, Lean provou:

```lean
(3 / 40) * ((s.re * log 3) / (1 + s.re * log 3)) ≤
  ‖rectangularGenuine s K 3‖
```

Traduzindo:

> dentro do strip do middle, o raw two-core tem uma margem concreta, escrita
> so em `Re(s)`.

Essa margem vai para zero quando `Re(s)` vai para zero, entao perto do eixo ela
fica delicada. Mas ela e real, provada, e genuine-first.

Declaracao:

- `rectangularGenuine_three_norm_lower_bound_of_unitStripCoreMargin`

### 5. O Lean fechou a ponte cutoff -> raw

O super-Gaussian finite genuine e comparado com o raw finite genuine.

Lean provou:

> se o residuo causado pelo cutoff for menor que a margem raw, entao o objeto
> regularizado nao zera.

Isso e o formato certo:

```lean
raw margin > cutoff residual
```

Declaracoes:

- `superGaussianFiniteGenuineRectangle_ne_zero_of_cutoffResidual_lt_raw`
- `superGaussianFiniteGenuineRectangle_three_ne_zero_of_cutoffResidual_lt_uniformRaw`
- `superGaussianFiniteGenuineRectangle_three_ne_zero_of_algebraic_unitStrip`

### 6. O residuo do cutoff ja foi majorado por uma soma algebrica finita

Lean provou que o residuo do super-Gaussian pode ser majorado por uma soma
explicita sobre enderecos C2:

```lean
superGaussianFiniteGenuineCutoffResidualAlgebraicUpper p K M X s
```

Isso troca uma coisa complexa por uma obrigacao real finita.

Declaracao:

- `superGaussianFiniteGenuineCutoffResidualNormUpper_le_algebraicUpper`

### 7. Para `p = 2`, `M = 3`, o residuo foi reduzido a escala dyadica simples

Esse foi o ultimo avanco.

Lean provou que, no two-core `p = 2`, o residuo algebrico e dominado por:

```lean
superGaussianFiniteTwoCoreUnitStripScaleUpper K X
```

e depois fechou a forma:

```lean
superGaussianFiniteTwoCoreUnitStripScaleUpper K X =
  36 * ((2 : ℝ) ^ (K + 1) - 4) * X⁻¹ ^ 2
```

Com isso, a obrigacao virou uma desigualdade de escala muito limpa:

```lean
36 * ((2 : ℝ) ^ (K + 1) - 4) <
  ((3 / 40) * ((s.re * log 3) /
    (1 + s.re * log 3))) * X ^ 2
```

Se essa desigualdade vale, Lean conclui:

```lean
superGaussianFiniteGenuineRectangle 2 X s K 3 ≠ 0
```

Declaracao principal:

- `superGaussianFiniteGenuineRectangle_three_ne_zero_of_unitStripClearedScaleUpper`

Minha opiniao: essa e uma reducao boa pra caramba, porque o problema virou
uma comparacao de escala `K`, `X`, `Re(s)`.

### 8. O bloco two-core restaurado tambem tem uma rota forte

Antes disso, o Lean ja tinha uma rota para o bloco two-core super-Gaussian
restaurado `p = 2`, com cutoff grande tipo:

```lean
768 / Re(s) <= X
```

No strip `0 < Re(s) <= 1`, isso da nao cancelamento do bloco two-core
restaurado.

Declaracoes importantes:

- `superGaussianTwoCoreNonvanishingOn_two_unitStripScaleRegion`
- `superGaussianTwoCoreGenuineBlock_two_ne_zero_of_reciprocal768_le_cutoff`
- `superGaussianTwoCoreGenuineBlockNonvanishingOn_two_reciprocal768`

Traduzindo:

> o bloco pequeno central esta muito bem certificado quando o cutoff esta na
> escala certa.

## O que ainda falta

### 1. Ainda falta fechar o genuine middle central completo

O alvo cru ainda aberto e:

```lean
GenuineCentralNoCancellation s
```

que significa:

```lean
0 < s.re ∧ genuineCentralDoubleSeries s ≠ 0
```

Esse objeto e o central infinito/raw. O Lean ainda nao tem uma prova completa
dele.

### 2. Falta ligar o bloco controlado ao middle inteiro

Hoje temos blocos finitos/regularizados bem controlados.

O que falta e uma dessas duas coisas:

1. provar que o resto/tail/remainder do middle fica abaixo da margem do bloco;
2. ou definir a versao regularizada correta do genuine central e provar que ela
   e nao zero na regiao desejada.

O Lean ja tem a forma abstrata dessa ponte:

```lean
superGaussianTwoCoreGenuineExtensionNonvanishingOn_of_remainderDominatedOn
```

e tambem:

```lean
superGaussianTwoCoreGenuineExtensionNonvanishingOn_of_blockNormLowerOn
```

Mas ainda falta alimentar isso com uma estimativa concreta do remainder.

### 3. A margem some perto de `Re(s) = 0`

A margem que temos no strip tem fator:

```lean
(s.re * log 3) / (1 + s.re * log 3)
```

Entao, se `Re(s)` fica muito pequeno, a margem fica pequena tambem.

Isso nao quebra a rota, mas exige que o cutoff `X` ou a estimativa do remainder
compense isso.

E por isso aparecem condicoes tipo:

```lean
768 / Re(s) <= X
```

ou desigualdades com `X^2`.

### 4. Ainda nao temos uma prova "sem condicao de escala"

O Lean nao provou:

```lean
para todo X > 0, nao zera
```

Na verdade, os testes numericos antigos indicam que uma frase tao forte
provavelmente seria falsa ou pelo menos perigosa.

O que o Lean esta provando e mais responsavel:

> sob uma condicao explicita de escala/cutoff/remainder, o objeto genuine
> regularizado finito nao cancela.

## Minha opiniao sincera da situacao

Estamos em um ponto bom, mas nao no ponto final.

O bom:

- a rota genuine-first esta consistente;
- o Lean aceitou varias pecas que nao sao triviais;
- o problema deixou de ser "misterioso" e virou varias desigualdades reais
  explicitas;
- temos nomes auditaveis e nao estamos mais perdidos em 30 mil linhas misturadas;
- o two-core `p = 2` parece ser uma base tecnica muito boa.

O que ainda pesa:

- o middle completo depende de controlar remainder/tail;
- perto de `Re(s) = 0`, tudo fica caro porque a margem raw vai ficando pequena;
- precisamos tomar cuidado para nao confundir "fechou bloco finito com escala"
  com "fechou o central infinito inteiro".

Minha leitura:

> A teoria esta viva e com uma rota Lean real. Mas o teorema grande ainda esta
> reduzido a obrigacoes de dominancia/remainder. A proxima luta honesta e fechar
> uma estimativa de remainder que caiba abaixo da margem ja certificada.

## Proximo alvo natural

Eu atacaria agora uma destas duas rotas:

### Rota A: continuar na escala finita explicita

Usar a condicao:

```lean
36 * ((2 : ℝ) ^ (K + 1) - 4) <
  margin(s) * X^2
```

e tentar escolher `X` como funcao de `K` e `Re(s)` para fechar uma regiao
limpa.

Essa rota e bem concreta.

### Rota B: remainder do bloco two-core restaurado

Usar o bloco two-core que ja tem margem positiva e provar que o resto do
middle fica abaixo dele.

Essa rota parece mais proxima do "middle completo", mas tambem e mais pesada.

## Frase curta do status

O Lean ja provou:

> raw finite two-core nao zera; tem margem quantitativa; super-Gaussian finite
> two-core `p = 2` nao zera quando uma desigualdade explicita de escala vale.

Ainda falta provar:

> o remainder/tail do middle genuine completo fica abaixo dessa margem, ou uma
> condicao de escala/regiao que cubra o middle desejado.

Essa e a situacao real.

## Atualizacao 5 de 24/06/2026

Avancamos mais uma etapa no modo genuine-first: a regiao `DepthStable` agora
tem um gatilho aritmetico explicito na propria escala dyadic64.

O Lean aceitou:

```lean
superGaussianFiniteTwoCoreUnitStripScaleUpper_le_reciprocalDyadic64_tailUnit
```

Isto prova que, na regiao

```lean
64 * 2^(K+1) / Re(s) <= X
```

o erro de cutoff do bloco two-core finito fica limitado por uma unica unidade
geometrica:

```lean
(1 / 2)^(K+1)
```

Com isso, Lean tambem aceitou o criterio:

```lean
superGaussianFiniteTwoCoreDepthStableRegion_of_dyadic64_marginNine
```

Em termos informais, se

```lean
9 * (1 / 2)^(K+1)
  < (3 / 40) * ((Re(s) * log 3) / (1 + Re(s) * log 3))
```

entao a escala dyadic64 ja coloca o ponto na regiao depth-stable.

Consequencia fechada:

```lean
superGaussianFiniteGenuineRectangle_three_nonvanishingOn_dyadic64_marginNine
```

Ou seja: sob essa desigualdade escalar explicita, todo prolongamento finito
`L >= K` do genuine two-core `p = 2, M = 3` e nao zero. Tambem ficou pronta a
forma canonica no cutoff `X = 64 * 2^(K+1) / Re(s)`:

```lean
superGaussianFiniteGenuineRectangle_three_ne_zero_at_dyadic64_of_marginNine
```

Leitura tecnica:

- antes, `DepthStable` era uma regiao nomeada por uma desigualdade contra o
  lower profile completo;
- agora temos uma desigualdade simples em `K` e `Re(s)` que implica essa regiao;
- a cauda pos-`K` custa `8 * 2^-(K+1)` e o cutoff dyadic64 custa no maximo mais
  `1 * 2^-(K+1)`, por isso aparece a constante segura `9`.

Esse proximo alvo tambem foi fechado na mesma rodada. O Lean aceitou:

```lean
superGaussianFiniteTwoCoreUnitStripScalarMargin_pos
exists_superGaussianFiniteTwoCore_marginDominatingDepth
exists_superGaussianFiniteTwoCoreDepthStableRegion_at_reciprocalDyadic64
exists_superGaussianFiniteGenuineRectangle_three_tailStable_at_reciprocalDyadic64
```

Agora temos o pacote pointwise:

> para todo `s` com `0 < Re(s) <= 1`, existe um `K >= 2` tal que, no cutoff
> canonico `X = 64 * 2^(K+1) / Re(s)`, todo prolongamento finito `L >= K` do
> two-core genuine `p = 2, M = 3` e nao zero.

Isso ainda nao e o limite/infinito completo, mas e uma estabilidade finita
forte: depois de escolher uma profundidade suficientemente grande para o ponto,
a cauda finita posterior nao consegue cancelar o bloco certificado.

## Atualizacao 6 de 24/06/2026

Respondendo a pergunta "ja temos bagagem para fechar as obrigacoes do middle?":
temos bagagem para fechar a proxima ponte formal, e ela foi fechada no Lean.
Ainda nao e a prova central completa, mas o alvo restante ficou muito mais
preciso.

Foi nomeado o remainder central genuine:

```lean
superGaussianFiniteTwoCoreCentralRemainder K s X
```

definido como:

```lean
genuineCentralDoubleSeries s
  - superGaussianFiniteGenuineRectangle 2 X s K 3
```

Lean provou a identidade exata:

```lean
superGaussianFiniteTwoCoreFullDepthExtension_centralRemainder_eq
```

ou seja, o retangulo finite two-core mais esse remainder central recompõe
exatamente o objeto central genuine.

O criterio final de distancia tambem foi fechado:

```lean
genuineCentralNoCancellation_of_centralRemainder_lt_unitStripLower
```

Se

```lean
norm (superGaussianFiniteTwoCoreCentralRemainder K s X)
  < superGaussianFiniteTwoCoreUnitStripNormLower K X s
```

entao:

```lean
GenuineCentralNoCancellation s
```

Finalmente, isso foi combinado com a profundidade tail-stable:

```lean
exists_tailStableDyadic64_genuineCentralNoCancellationCriterion
```

Traducao: para cada ponto do unit strip existe uma profundidade canonica
dyadic64 onde a geometria finita ja esta estavel; nesse ponto, a unica
obrigacao restante para fechar o central genuine e provar a desigualdade de
distancia do remainder central contra o lower profile finito.

Status real depois dessa atualizacao:

- fechado: estabilidade finita pointwise e ponte abstrata para o central;
- aberto: estimativa concreta do remainder central
  `superGaussianFiniteTwoCoreCentralRemainder`;
- a obrigacao aberta agora esta auditavel em uma unica desigualdade de norma.

## Atualizacao 7 de 24/06/2026

Fechamos uma versao mais forte da contabilidade finita: agora Lean nao prova
apenas que os prolongamentos `L >= K` sao nao zero; ele prova um lower bound de
norma uniforme para todos eles.

Novo lema geral:

```lean
norm_add_lower_bound_of_remainder_norm_le
```

Se o bloco certificado tem norma pelo menos `lower` e o remainder tem norma no
maximo `upper`, entao o bloco mais remainder tem norma pelo menos
`lower - upper`.

Aplicado ao genuine finite two-core, Lean aceitou:

```lean
superGaussianFiniteGenuineRectangle_three_norm_lower_of_postDepthTail
superGaussianFiniteGenuineRectangle_three_norm_lower_of_infiniteTail
superGaussianFiniteGenuineRectangle_three_norm_lower_on_depthStableRegion
```

Na regiao `DepthStable`, para todo `L >= K`:

```lean
superGaussianFiniteTwoCoreUnitStripNormLower K X s
  - 8 * (1 / 2)^(K+1)
    <= norm (superGaussianFiniteGenuineRectangle 2 X s L 3)
```

e o lado esquerdo e estritamente positivo.

Tambem ficou fechado o pacote pointwise canonico:

```lean
exists_superGaussianFiniteGenuineRectangle_three_tailStable_normLower_at_reciprocalDyadic64
```

Traducao: para cada `s` com `0 < Re(s) <= 1`, existe uma profundidade dyadic64
canonica tal que todos os retangulos finitos maiores ficam afastados de zero
por uma margem positiva explicita. Isso e mais forte que nao-anulacao finita e
e exatamente a forma que pode alimentar uma futura passagem ao limite ou uma
estimativa final do remainder central.

## Atualizacao 8 de 24/06/2026

Fechamos mais uma ponte forte para o middle central, agora na forma de
aproximacao finita.

Novo criterio:

```lean
genuineCentralNoCancellation_of_finiteApprox_lt_depthStableGap
```

Na regiao `DepthStable`, se `L >= K` e

```lean
norm (genuineCentralDoubleSeries s
  - superGaussianFiniteGenuineRectangle 2 X s L 3)
  < superGaussianFiniteTwoCoreUnitStripNormLower K X s
      - 8 * (1 / 2)^(K+1)
```

entao:

```lean
GenuineCentralNoCancellation s
```

Tambem ficou fechado o pacote pointwise canonico:

```lean
exists_tailStableDyadic64_genuineCentralNoCancellationCriterion_normGap
```

Traducao: para cada ponto do unit strip existe um `K` dyadic64 com gap positivo
tal que basta aproximar o central genuine por qualquer retangulo finito posterior
`L >= K` dentro desse gap. Essa e uma formulacao mais natural para a proxima
conta de limite/tail, porque a comparacao passa a ser diretamente entre o
central e uma sequencia finita ja provada afastada de zero.

## Atualizacao 9 de 24/06/2026

Fechamos a versao por convergencia da ponte central.

Novo criterio:

```lean
genuineCentralNoCancellation_of_depthStableApprox_tendsto_zero
```

Na regiao `DepthStable`, se

```lean
Filter.Tendsto
  (fun L =>
    genuineCentralDoubleSeries s
      - superGaussianFiniteGenuineRectangle 2 X s L 3)
  Filter.atTop
  (nhds 0)
```

entao o Lean escolhe automaticamente um `L >= K` dentro do gap positivo e fecha:

```lean
GenuineCentralNoCancellation s
```

Pacote pointwise canonico:

```lean
exists_tailStableDyadic64_genuineCentralNoCancellationCriterion_tendsto
```

Status real: a contabilidade do middle ficou reduzida a uma obrigacao de
convergencia/tail do genuine central contra os retangulos finitos two-core em
profundidade crescente. A margem positiva ja esta provada; falta alimentar a
ponte com a estimativa concreta de que esse tail vai a zero no regime correto.

## Atualizacao 10 de 24/06/2026

Refinamos a atualizacao anterior para a forma matematicamente correta.

O retangulo finite usado ate aqui tem `M = 3`, ou seja, e o canal two-core. Ele
nao deve ser tratado como se fosse automaticamente o central completo. O que
fechamos agora foi o limite verdadeiro desse canal em profundidade:

```lean
superGaussianTwoCoreDepthLayer
superGaussianTwoCoreDepthLimit
summable_superGaussianTwoCoreDepthLayer_norm
summable_superGaussianTwoCoreDepthLayer
superGaussianFiniteGenuineRectangle_three_eq_depthLayer_sum
tendsto_superGaussianFiniteGenuineRectangle_three_succ_to_depthLimit
```

Traducao: para `0 < Re(s)`, o Lean provou que

```lean
superGaussianFiniteGenuineRectangle 2 X s (N + 1) 3
```

converge para

```lean
superGaussianTwoCoreDepthLimit X s
```

quando `N -> infinito`.

Depois fechamos a ponte central com defeito limite pequeno:

```lean
genuineCentralNoCancellation_of_depthStableSuccApprox_tendsto_lt_gap
genuineCentralNoCancellation_of_twoCoreDepthLimitDefect_lt_gap
exists_tailStableDyadic64_genuineCentralNoCancellationCriterion_twoCoreLimit
```

Agora, no ponto dyadic64 escolhido pelo Lean, basta provar:

```lean
norm (genuineCentralDoubleSeries s
  - superGaussianTwoCoreDepthLimit X s)
  < superGaussianFiniteTwoCoreUnitStripNormLower K X s
      - 8 * (1 / 2)^(K+1)
```

para fechar:

```lean
GenuineCentralNoCancellation s
```

Isso e uma melhoria importante: a convergencia em profundidade do two-core foi
realmente fechada, e a obrigacao restante virou uma unica desigualdade de
defeito entre o central completo e o limite two-core regularizado.

## Atualizacao 11 de 24/06/2026

Fechamos mais uma obrigacao forte e honesta da rota genuine-first: a margem
positiva finita passa para o limite regularizado two-core.

Foi adicionado um lema geral:

```lean
norm_lower_bound_of_tendsto_of_eventually_norm_lower
```

Ele diz que, se uma sequencia complexa converge e, eventualmente, todas as suas
normas ficam acima de um piso real, entao o limite tambem fica acima desse piso.

Com isso, o Lean fechou:

```lean
superGaussianTwoCoreDepthLimit_norm_lower_on_depthStableRegion
superGaussianTwoCoreDepthLimit_ne_zero_on_depthStableRegion
exists_superGaussianTwoCoreDepthLimit_normLower_at_reciprocalDyadic64
```

Traducao: na regiao depth-stable, o limite

```lean
superGaussianTwoCoreDepthLimit X s
```

herda o gap positivo

```lean
superGaussianFiniteTwoCoreUnitStripNormLower K X s
  - 8 * (1 / 2)^(K+1)
```

e portanto nao zera. Para todo ponto do unit strip `0 < Re(s) <= 1`, o Lean
tambem escolhe um depth dyadic64 canonico onde esse pacote vale.

Status real: o canal two-core regularizado infinito agora esta certificado como
nao nulo na escala canonica. A obrigacao central restante ficou ainda mais
isolada: provar que

```lean
norm (genuineCentralDoubleSeries s
  - superGaussianTwoCoreDepthLimit X s)
  < superGaussianFiniteTwoCoreUnitStripNormLower K X s
      - 8 * (1 / 2)^(K+1)
```

no ponto dyadic64 produzido pelo Lean. Se essa estimativa de defeito fechar, o
teorema `GenuineCentralNoCancellation s` ja tem ponte formal pronta.

## Atualizacao 12 de 24/06/2026

Tentamos atacar a obrigacao central sem forcar a igualdade falsa entre o central
completo e o two-core. O avanco fechado agora foi a contabilidade por cutoff
horizontal finito.

Primeiro, o Lean recebeu bounds gerais:

```lean
complexDirichletCoeff_norm_le_one_of_re_pos_of_one_le
superGaussianCutoffWeight_two_norm_le_one
superGaussianGenuineAddressTermNorm_le_unitStripCoreTerm
```

Traducao: em `Re(s) > 0`, todo core positivo tem norma no maximo `1`, o corte
quadratico nao aumenta norma, e qualquer endereco regularizado fica dominado
pelo peso dyadico vertical.

Depois definimos o limite regularizado em profundidade para qualquer cutoff
horizontal finito `M`:

```lean
superGaussianFiniteCoreDepthLayer
superGaussianFiniteCoreDepthLimit
summable_superGaussianFiniteCoreDepthLayer_norm
summable_superGaussianFiniteCoreDepthLayer
superGaussianFiniteGenuineRectangle_eq_finiteCoreDepthLayer_sum
tendsto_superGaussianFiniteGenuineRectangle_succ_to_finiteCoreDepthLimit
superGaussianFiniteCoreDepthLimit_three_eq_twoCoreDepthLimit
```

Ou seja: para todo `M` finito, o retangulo genuine regularizado

```lean
superGaussianFiniteGenuineRectangle 2 X s (N + 1) M
```

converge em profundidade para um limite proprio. Quando `M = 3`, esse limite e
exatamente o `superGaussianTwoCoreDepthLimit` ja certificado.

O criterio central tambem foi refinado:

```lean
superGaussianFiniteCoreDepthLimit_ne_zero_of_twoCoreDefect_lt_gap
exists_tailStableDyadic64_finiteCoreDepthLimitCriterion
genuineCentralNoCancellation_of_finiteCoreDepthLimit_budget_lt_gap
exists_tailStableDyadic64_genuineCentralNoCancellationCriterion_finiteCore
```

Agora, no ponto dyadic64 escolhido pelo Lean, a obrigacao central pode ser
dividida em duas contas:

```lean
norm (genuineCentralDoubleSeries s
  - superGaussianFiniteCoreDepthLimit M X s)
+
norm (superGaussianFiniteCoreDepthLimit M X s
  - superGaussianTwoCoreDepthLimit X s)
<
superGaussianFiniteTwoCoreUnitStripNormLower K X s
  - 8 * (1 / 2)^(K+1)
```

Se essa desigualdade de orcamento fechar para algum cutoff horizontal finito
`M`, entao o Lean fecha `GenuineCentralNoCancellation s`.

Status honesto: a cauda horizontal infinita do central completo ainda nao foi
dominada. Mas agora a rota nao esta presa ao two-core puro; podemos aumentar
`M`, controlar a extensao horizontal em passos finitos e manter a mesma margem
two-core como barreira contra cancelamento.

## Atualizacao 13 de 24/06/2026

Simplificamos a contabilidade para a forma direta que a geometria sugere.

O Lean agora aceita o criterio minimo:

```lean
genuineCentralNoCancellation_of_twoCoreDefect_lt_twoCoreNorm
```

Traducao: se o central for escrito como

```lean
twoCoreDepthLimit + saldo
```

e

```lean
norm saldo < norm twoCoreDepthLimit
```

entao nao existe cancelamento. Esse criterio usa a norma real do bloco two-core
certificado, nao um majorante grosseiro nem uma margem explicitamente
enfraquecida.

Tambem entrou a versao dividida por um cutoff horizontal finito:

```lean
genuineCentralNoCancellation_of_finiteCoreDepthLimit_budget_lt_twoCoreNorm
```

O orcamento direto fica:

```lean
norm (genuineCentralDoubleSeries s
  - superGaussianFiniteCoreDepthLimit M X s)
+
norm (superGaussianFiniteCoreDepthLimit M X s
  - superGaussianTwoCoreDepthLimit X s)
<
norm (superGaussianTwoCoreDepthLimit X s)
```

E foram empacotadas as versoes dyadic64 pontuais:

```lean
exists_tailStableDyadic64_genuineCentralNoCancellationCriterion_direct
exists_tailStableDyadic64_genuineCentralNoCancellationCriterion_finiteCore_direct
```

Leitura real: nao estamos obrigados a usar um majorante grosseiro. A forma
mais direta ja compila. O que ainda precisa ser provado e a desigualdade do
saldo. Se conseguirmos fazer essa conta com cancelamentos internos/refinamento
por saldo, o Lean ja tem o criterio final pronto.

## Atualizacao 14 de 24/06/2026

A contabilidade simples do saldo extra tambem passou no Lean.

Definimos a camada visivel dos cores extras acima do two-core:

```lean
superGaussianFiniteCoreExtraDepthLayer
```

e Lean provou, para `M >= 3`, a decomposicao camada por camada:

```lean
superGaussianFiniteCoreDepthLayer_eq_twoCore_add_extra
superGaussianFiniteCoreDepthLayer_sub_twoCore_eq_extra
```

Depois fechamos a versao em limite:

```lean
superGaussianFiniteCoreExtraDepthLimit
superGaussianFiniteCoreDepthLimit_sub_twoCoreDepthLimit_eq_extra
superGaussianFiniteCoreDepthLimit_eq_twoCore_add_extra
```

Traducao: o Lean aceita exatamente a leitura geometrica simples:

```lean
finiteCoreDepthLimit M = twoCoreDepthLimit + extraCoreDepthLimit M
```

Tambem ficou provado que a soma das normas das camadas extras controla a norma
do saldo extra:

```lean
superGaussianFiniteCoreExtraDepthLimit_norm_le_extraSaldoUpper
```

E os criterios diretos ficaram:

```lean
superGaussianFiniteCoreDepthLimit_ne_zero_of_extraSaldo_lt_twoCoreNorm
genuineCentralNoCancellation_of_extraDepthLimit_budget_lt_twoCoreNorm
genuineCentralNoCancellation_of_extraSaldo_budget_lt_twoCoreNorm
exists_tailStableDyadic64_genuineCentralNoCancellationCriterion_extraLimit
exists_tailStableDyadic64_genuineCentralNoCancellationCriterion_extraSaldo
```

O alvo mais limpo agora e:

```lean
norm (genuineCentralDoubleSeries s
  - superGaussianFiniteCoreDepthLimit M X s)
+
norm (superGaussianFiniteCoreExtraDepthLimit M X s)
<
norm (superGaussianTwoCoreDepthLimit X s)
```

ou, usando a soma das normas das camadas extras:

```lean
norm (genuineCentralDoubleSeries s
  - superGaussianFiniteCoreDepthLimit M X s)
+
superGaussianFiniteCoreExtraSaldoNormUpper M X s
<
norm (superGaussianTwoCoreDepthLimit X s)
```

Status real: nao travou. A parte estrutural da contabilidade simples esta
aceita. O que falta e provar essa desigualdade de saldo no ponto/regiao
escolhido.

## Atualizacao 15 de 24/06/2026

A mesma estrategia foi aplicada ao proximo alvo: dois cutoffs horizontais
finitos.

Definimos o anel/banda horizontal entre `M` e `N`:

```lean
superGaussianFiniteCoreBandDepthLayer
superGaussianFiniteCoreBandDepthLimit
superGaussianFiniteCoreBandSaldoNormUpper
```

Para `M <= N`, Lean provou camada por camada:

```lean
superGaussianFiniteCoreDepthLayer_eq_lower_add_band
superGaussianFiniteCoreDepthLayer_sub_lower_eq_band
```

e no limite em profundidade:

```lean
superGaussianFiniteCoreDepthLimit_sub_lower_eq_band
superGaussianFiniteCoreDepthLimit_eq_lower_add_band
```

Combinando isso com o saldo extra ja aceito, Lean agora tem a decomposicao
exata:

```lean
superGaussianFiniteCoreDepthLimit_eq_twoCore_add_extra_add_band
```

Traducao geometrica:

```lean
finiteCoreDepthLimit N
  = twoCoreDepthLimit
  + extraCoreDepthLimit M
  + finiteHorizontalBandDepthLimit M N
```

para `3 <= M <= N`.

Tambem ficou provado que a banda tem upper proprio:

```lean
superGaussianFiniteCoreBandDepthLimit_norm_le_bandSaldoUpper
```

e que um finite-core maior nao cancela se a soma dos dois saldos visiveis fica
abaixo da norma real do two-core:

```lean
superGaussianFiniteCoreDepthLimit_ne_zero_of_extra_band_lt_twoCoreNorm
```

O criterio central novo e:

```lean
genuineCentralNoCancellation_of_finiteCoreBand_extraDepthLimit_budget_lt_twoCoreNorm
```

na forma:

```lean
norm (genuineCentralDoubleSeries s
  - superGaussianFiniteCoreDepthLimit N X s)
+
norm (superGaussianFiniteCoreBandDepthLimit M N X s)
+
norm (superGaussianFiniteCoreExtraDepthLimit M X s)
<
norm (superGaussianTwoCoreDepthLimit X s)
```

Tambem entrou a versao com uppers layerwise:

```lean
genuineCentralNoCancellation_of_finiteCoreBandSaldo_extraSaldo_budget_lt_twoCoreNorm
exists_tailStableDyadic64_genuineCentralNoCancellationCriterion_bandExtra
exists_tailStableDyadic64_genuineCentralNoCancellationCriterion_bandSaldo
```

Leitura real: agora a distancia central ate um cutoff pequeno `M` foi refinada.
Podemos comparar o central com um cutoff maior `N` e pagar separadamente a banda
finita `M..N`. Isso evita jogar tudo em um majorante grosseiro e deixa a
obrigacao minima como tres saldos geometricos visiveis contra o two-core:

```lean
central-to-N + band(M,N) + extra(3..M) < twoCoreNorm
```

Status honesto: isso ainda nao prova a desigualdade numerica/geometrica final,
mas o Lean aceitou a contabilidade natural de dois cutoffs. O proximo alvo e
tentar estimar ou especializar essa desigualdade em uma escolha concreta de
`M`, `N` e escala dyadic64.

## Atualizacao 16 de 24/06/2026

Testamos a contabilidade minima, sem arquitetura extra.

Lean aceitou o lema generico:

```lean
add_three_ne_zero_of_norm_sum_lt
```

Forma matematica:

```lean
norm r1 + norm r2 + norm r3 < norm block
```

implica:

```lean
block + r1 + r2 + r3 != 0
```

Instanciamos isso diretamente no operador genuine:

```lean
genuineCentralNoCancellation_of_basic_threeSaldo_budget_lt_twoCoreNorm
```

com:

```lean
block = superGaussianTwoCoreDepthLimit X s
r1 = genuineCentralDoubleSeries s
  - superGaussianFiniteCoreDepthLimit N X s
r2 = superGaussianFiniteCoreBandDepthLimit M N X s
r3 = superGaussianFiniteCoreExtraDepthLimit M X s
```

Lean tambem aceitou a versao pontual dyadic64:

```lean
exists_tailStableDyadic64_genuineCentralNoCancellationCriterion_basicThreeSaldo
```

Traducao: se a soma dos tres saldos geometricos visiveis fica abaixo da norma
real do two-core, o middle genuine fecha `neq zero`. Essa e a forma mais simples
e auditavel da logica atual:

```lean
central-to-N + band(M,N) + extra(3..M) < twoCoreNorm
```

Status honesto: a logica de contabilidade minima fechou. O que ainda nao fechou
sem hipotese adicional e a desigualdade numerica/geometrica dos tres saldos.
Esse e agora o gargalo real e bem isolado.

## Atualizacao 17 de 24/06/2026

Testamos a especializacao mais simples possivel da desigualdade dos saldos.

Lean aceitou que, quando os dois cutoffs horizontais coincidem, o band e zero:

```lean
superGaussianFiniteCoreBandDepthLimit_self_eq_zero
basic_threeSaldo_budget_self_of_extraDepthLimit_budget
genuineCentralNoCancellation_of_basic_threeSaldo_self
```

Forma matematica:

```lean
N = M
central-to-N + band(M,N) + extra(3..M)
  = central-to-M + extra(3..M)
```

Tambem testamos o corte minimo `M = N = 3`. Nesse caso o band e vazio e o
extra tambem e vazio:

```lean
superGaussianFiniteCoreExtraDepthLimit_three_eq_zero
basic_threeSaldo_budget_three_three_of_twoCoreDefect
genuineCentralNoCancellation_of_basic_threeSaldo_three_three
exists_tailStableDyadic64_genuineCentralNoCancellationCriterion_basicThreeSaldo_three_three
```

Forma matematica:

```lean
central-to-3 + band(3,3) + extra(3..3)
  = central-to-twoCore
```

Traducao: no caso minimo, a contabilidade de tres saldos fecha o `neq zero`
assim que:

```lean
norm (genuineCentralDoubleSeries s - superGaussianTwoCoreDepthLimit X s)
  < norm (superGaussianTwoCoreDepthLimit X s)
```

Status honesto: essa prova e propositalmente simples e passou no Lean. Ela nao
prova ainda a desigualdade central-to-twoCore; ela mostra que a forma minima da
obrigacao foi aceita e que podemos lapidar a estimativa a partir desse caso,
sem carregar band/extra quando eles sao geometricamente vazios.

## Atualizacao 18 de 24/06/2026

Mudamos a tentativa conforme o memento natural do arquivo: quando o `tsum`
central cru e grosseiro demais para a faixa media, nomeamos o canal genuine
regularizado e fechamos a nao-cancelacao desse canal diretamente.

Lean aceitou:

```lean
genuineRegularizedTwoCoreMiddle
GenuineRegularizedTwoCoreNoCancellation
genuineRegularizedTwoCoreNoCancellation_on_depthStableRegion
exists_tailStableDyadic64_genuineRegularizedTwoCoreNoCancellation
```

Forma matematica:

```lean
regularizedMiddle(X, s) = superGaussianTwoCoreDepthLimit X s
```

e, no unit strip, Lean escolhe a escala dyadic64 e prova:

```lean
regularizedMiddle(X, s) != 0
```

Tambem entrou a versao finite-core, mantendo a mesma contabilidade dos saldos:

```lean
genuineRegularizedFiniteCoreMiddle
GenuineRegularizedFiniteCoreNoCancellation
genuineRegularizedFiniteCoreNoCancellation_of_extra_band_lt_twoCoreNorm
exists_tailStableDyadic64_genuineRegularizedFiniteCoreNoCancellationCriterion_bandExtra
exists_tailStableDyadic64_genuineRegularizedFiniteCoreNoCancellation_three
```

Leitura: para um finite-core `N`, a prova usa exatamente:

```lean
extra(3..M) + band(M,N) < twoCoreNorm
```

e fecha o `neq zero` do canal regularizado finite-core. No caso minimo `M = 3`,
o canal finite-core e exatamente o two-core regularizado, entao fecha sem saldo
adicional.

Status honesto: isso fecha a prova final para o canal genuine regularizado que
o proprio arquivo indicava como substituto natural quando o central cru nao e a
superficie certa. Nao declara que o `genuineCentralDoubleSeries` cru ja e
nonzero sem a desigualdade central-to-twoCore; essa continua sendo uma ponte
separada, caso queiramos voltar ao objeto cru depois.

## Atualizacao 19 de 24/06/2026

Voltamos ao objeto cru pela forma correta: nao pela distancia direta contra o
two-core, mas pelo bulk genuine balanceado.

Lean aceitou a ponte:

```lean
genuineCentralNoCancellation_of_adjustedQuartetBalancedGenuineBulkModel_ne_zero
```

Leitura: se o bulk genuine balanceado nao zera em `Re(s) > 0`, entao o central
genuine cru tambem nao zera, porque esse bulk ja esta provado igual ao central.

Tambem entrou a regiao raw quartet-concrete:

```lean
AdjustedQuartetBalancedGenuineBulkConcreteEstimates
adjustedQuartetBalancedGenuineBulkConcrete_mem_quartetRegion
adjustedQuartetBalancedGenuineBulkModel_ne_zero_of_mem_concreteRegion
genuineCentralNoCancellation_of_mem_adjustedQuartetBalancedGenuineBulkConcreteRegion
```

Forma da prova aceita pelo Lean:

```lean
seed balanceado + defeito horizontal + cutoff cru
  < margem do quartet
```

implica:

```lean
GenuineCentralNoCancellation s
```

Por fim, empacotamos isso no formato do middle ativo:

```lean
adjustedQuartetBalancedGenuineBulkConcrete_mem_of_localData
genuineCentralNoCancellation_of_localBulkData_rawBounds
```

Traducao honesta: se ja temos `C2ExpandedScalarLocalBulkData` no ponto do
middle, faltam apenas duas contas raw explicitas:

```lean
norm seed * tiltScale <= tiltConstant
norm cutoffCru * cutoffScale <= cutoffConstant
```

Com essas duas, a dominancia do quartet que ja mora no pacote local fecha o
bulk balanceado, e a ponte fecha o central genuine cru. Essa e uma rota mais
natural que tentar provar diretamente `central-to-twoCore < twoCoreNorm`.

## Atualizacao 20 de 24/06/2026

Continuamos na estrategia simples e o Lean aceitou a decomposicao crua do
saldo do seed.

Entrou o nome para o cutoff bruto:

```lean
C2RawCentralCutoffScaledBound
```

E a ponte do seed cru:

```lean
genuineCentralNoCancellation_of_localBulkData_rawSeedBudget_rawCutoff
genuineCentralNoCancellation_of_localBulkData_rawComponentBounds
```

Depois reduzimos a forma manual: o bound horizontal nao precisa mais ser uma
hipotese externa, porque ja mora no pacote local do middle. Lean aceitou:

```lean
genuineCentralNoCancellation_of_localBulkData_rawVerticalGapCutoff
genuineCentralNoCancellation_of_localBulkData_rawVerticalCutoff
```

Na forma mais explicita, tambem passou o upper triangular do saldo
vertical/retangular:

```lean
genuineCentralNoCancellation_of_localBulkData_triangleVerticalCutoff
```

Leitura da contabilidade aceita:

```lean
vertical/rectangular triangle upper
  + horizontal geometric upper from local data
  + canonical gap
  + raw cutoff
```

ficam abaixo do orcamento do quarteto via o seed-factor e o cutoff bruto; entao
o bulk balanceado nao zera, e a ponte ja formalizada fecha:

```lean
GenuineCentralNoCancellation s
```

Status honesto: a parte logica da contabilidade do quarteto ficou fechada na
forma simples. Ainda nao provamos automaticamente a desigualdade quantitativa
dos saldos crus em toda a regiao; esse segue sendo o gargalo real, mas agora
com menos hipoteses artificiais.

## Atualizacao 21 de 24/06/2026

Tentamos provar a desigualdade dos saldos crus diretamente, mantendo a rota
genuine-first.

Lean aceitou os orcamentos raw unitarios:

```lean
c2RawTriangleVerticalRectangularUpper
c2RawTriangleSeedTiltConstant
c2RawCentralCutoffNormConstant
```

Com esses orcamentos, a desigualdade do seed nao fica mais como hipotese:

```lean
c2RawTriangleSeedFactorScaledBound_unit
c2OddTailBalancingSeed_scaled_bound_rawTriangleUnit
```

E o cutoff cru tambem fecha diretamente:

```lean
c2RawCentralCutoffScaledBound_unit_norm
```

Traducao: o Lean aceitou que o seed balanceado fica abaixo do orcamento

```lean
(vertical/rectangular triangle upper + horizontal envelope) * (1 + norm q)
```

e que o cutoff cru fica abaixo do seu proprio orcamento normado. Entao a prova
do middle genuine agora pode ser chamada pela forma:

```lean
genuineCentralNoCancellation_of_rawTriangleResidualDominance
```

O alvo remanescente ficou exatamente a dominancia residual:

```lean
C2RawTriangleResidualDominance
```

Leitura honesta: a desigualdade interna dos saldos crus foi provada. O que
ainda nao foi provado automaticamente para toda a regiao e que esse orcamento
residual total fica abaixo da margem residual do quarteto. Esse e agora o alvo
quantitativo final.

## Atualizacao 22 de 24/06/2026

Tentamos fechar a dominancia residual crua no Lean.

Lean aceitou a forma escalar expandida:

```lean
c2RawTriangleResidualUpper_eq_expanded
C2RawTriangleResidualDominance_of_scalarBudget
```

Tambem aceitou uma forma monotona com orcamentos externos:

```lean
C2RawTriangleResidualDominance_of_upperBudgets
```

Ou seja, se conseguirmos orcamentos `verticalBudget`, `horizontalBudget` e
`cutoffBudget` com:

```lean
((verticalBudget + horizontalBudget) * (1 + norm q)) / (1 - norm q)
  + horizontalBudget + cutoffBudget
  < residualQuartetMargin
```

entao o Lean fecha a dominancia residual e, pela ponte anterior, fecha
`GenuineCentralNoCancellation`.

O teste importante foi a barreira condicional:

```lean
not_C2RawTriangleResidualDominance_of_verticalDepthTailUpper_le_rawTriangle
```

Leitura: se o orcamento triangular vertical cru ja fica maior ou igual ao
envelope vertical padrao, entao essa dominancia residual nao pode fechar. Logo
a conta final nao fecha por pura contabilidade triangular; ela precisa de um
ganho genuine real no saldo vertical/central/cutoff, ou de uma decomposicao
mais fina que nao pague esse envelope inteiro.

## Atualizacao 23 de 24/06/2026

Retomamos a rota fina correta dos tres saldos.

O primeiro saldo, que antes aparecia como:

```lean
norm (genuineCentralDoubleSeries s - superGaussianFiniteCoreDepthLimit N X s)
```

agora tambem tem moeda visivel layerwise. Lean aceitou:

```lean
superGaussianFiniteCoreDepthTailNormUpper
superGaussianFiniteCoreDepthLimit_sub_rectangle_norm_le_depthTail
genuineCentral_sub_finiteCoreDepthLimit_norm_le_approx_add_depthTail
```

Traducao: o saldo `central-to-N` pode ser pago por:

```lean
finite genuine approximation error
+ regularized finite-core depth tail
```

com o mesmo cutoff horizontal `N`.

Depois conectamos isso na contabilidade minima do middle:

```lean
genuineCentralNoCancellation_of_finiteCoreApprox_band_extra_depthTail_budget_lt_twoCoreNorm
genuineCentralNoCancellation_of_finiteApproxDepthTail_bandSaldo
exists_tailStableDyadic64_genuineCentralNoCancellationCriterion_fineDepthTail
```

Forma final da obrigacao fina:

```lean
finite approximation error
+ depth tail
+ band(M,N) saldo
+ extra(3..M) saldo
< actual twoCore norm
```

Essa e a sequencia certa depois da contabilidade de tres saldos: nao usa o
orcamento triangular cru e nao tenta pagar o envelope inteiro. O que falta
agora e atacar quantitativamente esses quatro termos finos.

## Atualizacao 24 de 24/06/2026

Testamos a conclusao fina no caso minimo `M = N = 3`.

Lean aceitou que a nova cauda de profundidade realmente tende a zero:

```lean
superGaussianFiniteCoreDepthTailNormUpper_tendsto_zero
exists_superGaussianFiniteCoreDepthTailNormUpper_lt
```

Tambem aceitou que, no cutoff horizontal minimo, os dois saldos horizontais
visiveis sao exatamente zero ate na moeda de upper:

```lean
superGaussianFiniteCoreExtraSaldoNormUpper_three_eq_zero
superGaussianFiniteCoreBandSaldoNormUpper_self_eq_zero
```

Com isso, a contabilidade fina fecha assim:

```lean
genuineCentralNoCancellation_of_fineDepthTail_three_tendsto
exists_tailStableDyadic64_genuineCentralNoCancellationCriterion_fineTailTendsto
```

Traducao: se os retangulos finite genuine two-core convergem para o central
genuine no cutoff dyadic64 escolhido, entao o erro finito mais a cauda de
profundidade fica menor que a norma real do two-core, e nao sobra saldo para
cancelar o bloco certificado.

O Lean tambem aceitou a auditoria honesta dessa hipotese:

```lean
fineTail_three_tendsto_iff_central_eq_twoCoreDepthLimit
```

Isto diz que, no caso minimo `M = N = 3`, essa convergencia e exatamente a
identidade:

```lean
genuineCentralDoubleSeries s = superGaussianTwoCoreDepthLimit X s
```

Portanto a conta fina esta correta e fecha quando a identidade/convergencia
genuine correspondente e provada. O proximo gargalo real nao e mais
contabilidade: e provar a aproximacao/identidade genuine correta sem voltar ao
orcamento bruto.

## Atualizacao 25 de 24/06/2026

Avancamos a rota genuine-first para evitar a exigencia forte demais do caso
minimo `M = N = 3`.

Lean aceitou o fechamento por defeito limite fino:

```lean
genuineCentralNoCancellation_of_fineLimitDefect_budget
```

Forma da obrigacao:

```lean
finite approximation error -> defect
norm defect
+ band(M,N) saldo
+ extra(3..M) saldo
< actual twoCore norm
```

Conclusao aceita pelo Lean:

```lean
GenuineCentralNoCancellation s
```

Tambem ficou a versao pontual dyadic64:

```lean
exists_tailStableDyadic64_genuineCentralNoCancellationCriterion_fineLimitDefect
```

Traducao honesta: nao precisamos provar que a aproximacao finita converge com
defeito zero. A contabilidade correta permite um defeito limite genuine, desde
que esse defeito mais os saldos horizontais visiveis ainda caiba abaixo da
norma real do bloco certificado.

Status: o `neq zero` do middle genuine ainda nao esta fechado
incondicionalmente. Mas agora o gargalo esta na forma certa e auditavel:
provar a desigualdade fina

```lean
norm defect + band(M,N) + extra(3..M) < twoCoreNorm
```

para o defeito limite genuine correspondente.

## Atualizacao 26 de 24/06/2026

Formalizamos no Lean a conta "na caneta nao tem saldo para cancelar o
quarteto" no pacote raw genuine.

O lema triangular de quatro debitos entrou como:

```lean
norm_add_four_le
```

O lower do quarteto concreto entrou como:

```lean
c2ConcreteAntiMiracleQuartet_norm_ge_K2Margin
```

O residual do modelo finito foi aberto exatamente nos quatro debitos:

```lean
c2ConcreteAntiMiracleTail_norm_le_fourTermUpper
```

Forma:

```lean
norm tail <= verticalDebt + tilt + horizontal + cutoff
```

E o fechamento final aceito pelo Lean foi:

```lean
c2ConcreteAntiMiracleFiniteModel_ne_zero_of_fourTermDominance
```

Traducao:

```lean
verticalDebt + tilt + horizontal + cutoff < quartetLower
```

implica que o modelo finito genuine do middle nao pode zerar.

Tambem conectamos isso ao certificado raw genuine existente:

```lean
adjustedQuartetBalancedGenuineBulkModel_ne_zero_of_mem_concreteRegion_ledger
```

Ou seja: o campo `quartet_dominance` do certificado e exatamente a auditoria
de livro-caixa. Ele condensa a afirmacao de que a soma dos quatro debitos
visiveis fica abaixo do credito minimo do quarteto.

Status honesto: para o pacote finito/quarteto, Lean aceitou exatamente a
contabilidade "nao ha saldo para cancelar". Para o `GenuineCentralNoCancellation`
global, ainda precisamos acoplar essa conta com a ponte genuine/limite que foi
isolada nas atualizacoes anteriores.

## Atualizacao 27 de 25/06/2026

Acoplamos a contabilidade explicita do quarteto com o alvo central raw genuine.

Entrou a ponte:

```lean
genuineCentralNoCancellation_of_mem_adjustedQuartetBalancedGenuineBulkConcreteRegion_ledger
```

Forma:

```lean
s ∈ adjustedQuartetBalancedGenuineBulkConcreteRegion ... →
  GenuineCentralNoCancellation s
```

A prova passa por:

```lean
adjustedQuartetBalancedGenuineBulkModel_ne_zero_of_mem_concreteRegion_ledger
```

e depois usa a identidade genuine-first ja existente no semiplano direito:

```lean
adjustedQuartetBalancedGenuineBulkModel_ne_zero_iff_central_ne_zero
```

Traducao: o livro-caixa finito/quarteto agora nao fica mais parado no modelo
balanceado. Quando o certificado concreto fornece `quartet_dominance`, Lean
fecha o nao cancelamento do objeto central genuine:

```lean
GenuineCentralNoCancellation s
```

Tambem roteamos o closure publico antigo

```lean
genuineCentralNoCancellation_of_mem_adjustedQuartetBalancedGenuineBulkConcreteRegion
```

pela nova ponte `_ledger`, entao as formas raw triangle que dependem dele
herdam essa rota explicita.

Status honesto: a ponte "ledger do quarteto -> central genuine" esta fechada.
O que ainda resta e produzir, para os pontos do middle canonicamente
escolhidos, os budgets que colocam `s` dentro da regiao concreta raw genuine.

## Atualizacao 28 de 25/06/2026

Extraimos o empacotamento dos budgets raw triangle como certificado de regiao
concreta.

Entraram:

```lean
adjustedQuartetBalancedGenuineBulkConcrete_mem_of_rawTriangleQuartetDominance
adjustedQuartetBalancedGenuineBulkConcrete_mem_of_rawTriangleResidualDominance
```

Forma da primeira:

```lean
offCriticalStrip s →
horizontal geometry →
C2RawTriangleQuartetDominance K M horizontalConstant horizontalScale horizontalRatio s →
s ∈ adjustedQuartetBalancedGenuineBulkConcreteRegion ...
```

Forma da segunda:

```lean
C2RawTriangleResidualDominance ... s →
s ∈ adjustedQuartetBalancedGenuineBulkConcreteRegion ...
```

Traducao: os saldos de seed e cutoff agora nao ficam mais escondidos dentro da
prova final de nao cancelamento. Lean constroi explicitamente o certificado da
regiao concreta raw genuine:

* o seed e pago por `c2OddTailBalancingSeed_scaled_bound_rawTriangleUnit`;
* o cutoff e pago por `c2RawCentralCutoffNormConstant`;
* a desigualdade residual/quarteto entra exatamente no campo
  `quartet_dominance`.

Tambem roteamos:

```lean
genuineCentralNoCancellation_of_rawTriangleResidualDominance
```

pela nova membership concreta. Agora a cadeia auditavel e:

```lean
raw residual dominance
→ adjustedQuartetBalancedGenuineBulkConcreteRegion
→ ledger do quarteto
→ balanced bulk nonzero
→ GenuineCentralNoCancellation
```

Status honesto: o empacotamento da regiao concreta esta fechado. O gargalo
restante e provar a desigualdade real

```lean
C2RawTriangleResidualDominance ...
```

ou uma forma mais forte que produza essa dominancia residual.

## Atualizacao 29 de 25/06/2026

Expusemos o endpoint literal do genuine:

```lean
genuineCentralDoubleSeries s ≠ 0
```

Entraram:

```lean
genuineCentral_ne_zero_of_bulkModel_ne_zero
genuineCentral_ne_zero_of_mem_concreteRegion_ledger
genuineCentral_ne_zero_of_localBulkData_rawBounds
genuineCentral_ne_zero_of_rawTriangleQuartetDominance
genuineCentral_ne_zero_of_rawTriangleResidualDominance
```

A cadeia agora pode ser lida sem linguagem terminal:

```lean
C2RawTriangleResidualDominance ...
→ s ∈ adjustedQuartetBalancedGenuineBulkConcreteRegion ...
→ adjustedQuartetBalancedGenuineBulkModel ... s ≠ 0
→ genuineCentralDoubleSeries s ≠ 0
```

Traducao: no lado genuine, o `neq zero` literal esta fechado a partir do
certificado/budget geometrico. Nao usamos nenhum input zeta nessa rota.

Status honesto: para remover a hipotese de budget e fechar o middle
incondicionalmente, ainda falta provar a desigualdade geometrica
`C2RawTriangleResidualDominance ...` nos pontos do middle.

## Atualizacao 30 de 25/06/2026

Tentamos atacar diretamente a desigualdade

```lean
C2RawTriangleResidualDominance ...
```

e o Lean agora registra uma obstrucao importante da rota raw triangle crua.

Entraram:

```lean
not_C2RawTriangleResidualDominance_of_verticalDepthTailUpper_le_tailNorm
C2RawTriangleResidualDominance_forces_verticalTail_strict_saving
```

Leitura:

```lean
C2RawTriangleResidualDominance ...
→ ‖verticalDepthTailFromTwo s‖ < verticalDepthTailUpper s
```

Ou seja, a dominancia residual raw triangle so pode fechar em pontos onde a
cauda vertical real e estritamente menor que o envelope geometrico bruto. Se o
envelope vertical estiver saturado, a dominancia residual e impossivel.

Traducao honesta: o gargalo nao e mais empacotamento, nem ponte para o
`neq zero`. Tambem nao e uma questao de reescrever a mesma desigualdade. A
rota raw triangle exige uma economia genuine real no saldo vertical/central,
ou entao precisamos substituir o orcamento triangular cru por um residual mais
afiado que veja cancelamento estrutural.

## Atualizacao 31 de 25/06/2026

Refinamos a rota em vez de insistir no orcamento triangular bruto.

Entrou uma interface parametrica para substituir o bloco grosso

```lean
‖verticalDepthTailFromTwo s‖ + ‖rectangularGenuine s K M‖
  + 2 * ‖genuineCentralDoubleSeries s‖
```

por um upper genuine externo:

```lean
verticalRectangularUpper
```

Os novos objetos sao:

```lean
c2RefinedVerticalSeedTiltConstant
c2RefinedVerticalResidualUpper
C2RefinedVerticalResidualDominance
```

O seed fecha com escala unitaria por:

```lean
c2OddTailBalancingSeed_scaled_bound_refinedVerticalUnit
```

e a dominancia residual refinada constrói diretamente o certificado concreto:

```lean
adjustedQuartetBalancedGenuineBulkConcrete_mem_of_refinedVerticalResidualDominance
```

O endpoint literal genuine tambem ficou exposto:

```lean
genuineCentral_ne_zero_of_refinedVerticalResidualDominance
```

Leitura:

```lean
C2VerticalRectangularResidualBound K M verticalRectangularUpper s
+ C2RefinedVerticalResidualDominance ...
→ genuineCentralDoubleSeries s ≠ 0
```

Traducao honesta: nao provamos a dominancia raw grossa, porque ela exige uma
economia que o budget triangular nao enxerga. Em vez disso, Lean agora aceita
a rota correta: qualquer upper vertical/retangular genuine mais fino alimenta
o mesmo livro-caixa do quarteto e fecha o `neq zero` do genuine.

## Atualizacao 32 de 25/06/2026

Especializamos a rota refinada no upper vertical mais afiado possivel: o norm
real do proprio residual vertical/retangular genuine.

Entraram:

```lean
c2ExactVerticalRectangularResidualNormUpper
C2VerticalRectangularResidualBound_exactNorm
C2ExactVerticalResidualDominance
```

Com endpoints:

```lean
genuineCentralNoCancellation_of_exactVerticalResidualDominance
genuineCentral_ne_zero_of_exactVerticalResidualDominance
```

Tambem abrimos a dominancia refinada em forma escalar e monotona:

```lean
c2RefinedVerticalResidualUpper_eq_expanded
C2RefinedVerticalResidualDominance_of_scalarBudget
C2RefinedVerticalResidualDominance_of_upperBudgets
```

Leitura:

```lean
C2ExactVerticalResidualDominance ...
→ genuineCentralDoubleSeries s ≠ 0
```

Agora a desigualdade restante nao paga mais a folga vertical triangular. Ela
mede o saldo vertical/retangular pelo norm genuine real:

```lean
‖c2ScaledSeededExplicitOddTailVerticalRectangularResidual K M s‖
```

Esse e o alvo mais justo para a proxima etapa do middle: provar que esse saldo
real, mais horizontal e cutoff, fica abaixo da margem residual do quarteto.

## Atualizacao 33 de 25/06/2026

Compactamos a entrada final da rota exata.

Para a rota refinada, Lean agora sabe ir nos dois sentidos entre a desigualdade
residual e o campo de dominancia do quarteto:

```lean
C2RefinedVerticalResidualDominance_of_quartetDominance
C2RefinedVerticalResidualDominance_iff_quartetDominance
```

Para o residual exato, entraram as formas especializadas:

```lean
C2ExactVerticalResidualDominance_of_scalarBudget
C2ExactVerticalResidualDominance_of_upperBudgets
C2ExactVerticalResidualDominance_of_quartetDominance
C2ExactVerticalResidualDominance_iff_quartetDominance
```

E fechamos os endpoints diretos:

```lean
genuineCentralNoCancellation_of_exactVerticalScalarBudget
genuineCentral_ne_zero_of_exactVerticalScalarBudget
genuineCentralNoCancellation_of_exactVerticalUpperBudgets
genuineCentral_ne_zero_of_exactVerticalUpperBudgets
```

Traducao operacional:

```lean
((‖c2ScaledSeededExplicitOddTailVerticalRectangularResidual K M s‖
    + horizontal) * (1 + ‖q s‖)) / (1 - ‖q s‖)
  + horizontal + cutoff
<
c2ExpandedQuartetResidualMargin s
```

junto com a geometria horizontal local implica diretamente:

```lean
GenuineCentralNoCancellation s
genuineCentralDoubleSeries s ≠ 0
```

Status honesto: nao fechamos essa desigualdade para todo ponto do middle sem
uma estimativa genuine adicional. O que fechou foi a cadeia Lean inteira depois
dessa desigualdade. O proximo alvo matematico esta isolado no saldo genuine
real:

```lean
‖c2ScaledSeededExplicitOddTailVerticalRectangularResidual K M s‖
```

Ele precisa ser estimado pequeno o suficiente para caber abaixo da margem do
quarteto junto com horizontal e cutoff.

## Atualizacao 34 de 25/06/2026

Normalizamos a desigualdade escalar exata para uma unica margem disponivel para
o residual genuine.

Entrou a allowance:

```lean
c2ExactVerticalResidualNormAllowance
```

Ela e a sobra da margem do quarteto depois de pagar horizontal e cutoff, com o
fator resolvente desfeito:

```lean
(margin - horizontal - cutoff) * ((1 - ‖q s‖) / (1 + ‖q s‖))
  - horizontal
```

Lean aceitou a equivalencia algébrica:

```lean
exactVerticalScalarBudget_iff_norm_lt_allowance
```

Traducao:

```lean
((exactResidualNorm + horizontal) * (1 + ‖q s‖)) / (1 - ‖q s‖)
  + horizontal + cutoff
<
margin
```

e exatamente o mesmo que:

```lean
exactResidualNorm < c2ExactVerticalResidualNormAllowance ...
```

no `offCriticalStrip`, onde `‖q s‖ < 1`.

Tambem entraram os fechamentos:

```lean
C2ExactVerticalResidualDominance_of_norm_lt_allowance
C2ExactVerticalResidualDominance_of_upper_lt_allowance
C2ExactVerticalResidualDominance_iff_norm_lt_allowance
genuineCentralNoCancellation_of_exactVerticalResidualNorm_lt_allowance
genuineCentral_ne_zero_of_exactVerticalResidualNorm_lt_allowance
```

Status honesto: a parte contábil/algebrica depois da estimativa esta fechada.
O proximo alvo genuine ficou ainda mais pontual:

```lean
‖c2ScaledSeededExplicitOddTailVerticalRectangularResidual K M s‖
  < c2ExactVerticalResidualNormAllowance K M ... s
```

## Atualizacao 35 de 25/06/2026

Abrimos mais uma camada do residual exato genuine.

Lean ja tinha no desenvolvimento concreto o split:

```lean
c2ScaledSeededExplicitOddTailVerticalRectangularResidual_eq_anchor_add_cutoff
```

Usamos esse split na auditoria ativa para provar:

```lean
c2ExactVerticalResidual_norm_le_anchor_add_cutoff
```

Forma:

```lean
‖exactVerticalResidual K M s‖
  ≤ ‖c2VerticalRectangularAnchorResidual s‖
    + c2RawCentralCutoffNormConstant K M s
```

Depois definimos a margem que sobra so para o anchor:

```lean
c2ExactVerticalAnchorResidualNormAllowance
```

e Lean aceitou:

```lean
exactVerticalAnchorBudget_iff_norm_lt_allowance
```

Leitura:

```lean
‖anchor‖ + cutoff < exactResidualAllowance
```

e equivalente a:

```lean
‖anchor‖ < anchorAllowance
```

Tambem entraram os fechamentos:

```lean
C2ExactVerticalResidualDominance_of_anchor_cutoff_lt_allowance
C2ExactVerticalResidualDominance_of_anchor_norm_lt_allowance
genuineCentralNoCancellation_of_anchor_cutoff_lt_allowance
genuineCentral_ne_zero_of_anchor_cutoff_lt_allowance
genuineCentralNoCancellation_of_anchor_norm_lt_allowance
genuineCentral_ne_zero_of_anchor_norm_lt_allowance
```

Status honesto: ainda nao provamos que o anchor genuine e pequeno no middle.
Mas a obrigacao agora perdeu o cutoff interno do residual e ficou:

```lean
‖c2VerticalRectangularAnchorResidual s‖
  < c2ExactVerticalAnchorResidualNormAllowance K M ... s
```

Essa e uma forma mais fina do alvo: o lado esquerdo ja nao depende de `K,M`;
os parametros `K,M` entram so pela margem/cutoff disponivel do lado direito.

## Atualizacao 36 de 25/06/2026

Refinamos o alvo do anchor genuine por uma troca de base ainda genuine-first.

Entrou a definicao:

```lean
c2ContinuedVerticalAnchorResidual
```

Forma:

```lean
c2ContinuedVerticalAnchorResidual s
  = verticalDepthTailFromTwo s - continuedCentralOddChannel s
```

Lean aceitou a identidade contabil:

```lean
c2VerticalRectangularAnchorResidual_eq_continuedAnchor_add_defect
```

Leitura:

```lean
verticalTail - genuineCentral
  =
  (verticalTail - continuedCentralOddChannel)
  +
  (continuedCentralOddChannel - genuineCentral)
```

Pela triangular, isso virou:

```lean
c2VerticalRectangularAnchorResidual_norm_le_continuedAnchor_add_defect
```

e a versao com majorante externa:

```lean
c2VerticalRectangularAnchorResidual_norm_le_continuedAnchor_upper
```

Tambem definimos a allowance normalizada depois de pagar o defeito central:

```lean
c2ContinuedVerticalAnchorResidualNormAllowance
```

e Lean aceitou:

```lean
continuedVerticalAnchorBudget_iff_norm_lt_allowance
```

Com isso, os fechamentos novos sao:

```lean
C2ExactVerticalResidualDominance_of_continued_anchor_defect_lt_allowance
C2ExactVerticalResidualDominance_of_continued_anchor_norm_lt_allowance
genuineCentralNoCancellation_of_continued_anchor_defect_lt_allowance
genuineCentral_ne_zero_of_continued_anchor_defect_lt_allowance
genuineCentralNoCancellation_of_continued_anchor_norm_lt_allowance
genuineCentral_ne_zero_of_continued_anchor_norm_lt_allowance
```

Status honesto: o `neq zero` genuine agora fecha se entregarmos duas estimativas
pontuais:

```lean
‖genuineCentralDoubleSeries s - continuedCentralOddChannel s‖
  ≤ centralDefectUpper s
```

e

```lean
‖c2ContinuedVerticalAnchorResidual s‖ + centralDefectUpper s
  < c2ExactVerticalAnchorResidualNormAllowance K M ... s
```

Equivalentemente, a segunda pode ser escrita como:

```lean
‖c2ContinuedVerticalAnchorResidual s‖
  < c2ContinuedVerticalAnchorResidualNormAllowance K M ... centralDefectUpper s
```

Ou seja: nao estamos refazendo a contabilidade do quarteto. A conta do quarteto
continua fechada. O que foi refinado aqui e o boleto que falta apresentar para
acionar essa conta: anchor continuado pequeno mais defeito central controlado.

## Atualizacao 37 de 25/06/2026

Entrou o marjorante genuine-first para o defeito de rebasing.

Definimos:

```lean
c2GenuineRebasingDefectTriangleUpper
```

Forma:

```lean
c2GenuineRebasingDefectTriangleUpper genuineUpper continuedUpper s
  = genuineUpper s + continuedUpper s
```

Lean aceitou:

```lean
c2GenuineRebasingDefect_norm_le_triangleUpper_of_bounds
```

Leitura:

```lean
C2GenuineCentralBound genuineUpper s
C2ContinuedCentralBound continuedUpper s
```

implicam

```lean
‖genuineCentralDoubleSeries s - continuedCentralOddChannel s‖
  ≤ genuineUpper s + continuedUpper s
```

Tambem registramos a instancia exata automatica:

```lean
c2GenuineRebasingDefectExactTriangleUpper
c2GenuineRebasingDefect_norm_le_exactTriangleUpper
```

e a allowance normalizada correspondente:

```lean
c2ContinuedVerticalAnchorExactDefectNormAllowance
```

Os fechamentos novos sao:

```lean
C2ExactVerticalResidualDominance_of_continued_anchor_triangle_lt_allowance
C2ExactVerticalResidualDominance_of_continued_anchor_exactDefect_lt_allowance
C2ExactVerticalResidualDominance_of_continued_anchor_exactDefect_norm
genuineCentralNoCancellation_of_continued_anchor_triangle_lt_allowance
genuineCentral_ne_zero_of_continued_anchor_triangle_lt_allowance
genuineCentralNoCancellation_of_continued_anchor_exactDefect
genuineCentral_ne_zero_of_continued_anchor_exactDefect
genuineCentralNoCancellation_of_continued_anchor_exactDefect_norm
genuineCentral_ne_zero_of_continued_anchor_exactDefect_norm
```

Status honesto: o defeito central agora nao e mais uma hipotese solta. Ele
pode ser pago por uma majorante genuine triangular. Para fechar o middle por
essa rota, o boleto restante fica:

```lean
‖c2ContinuedVerticalAnchorResidual s‖
  + c2GenuineRebasingDefectTriangleUpper genuineUpper continuedUpper s
  < c2ExactVerticalAnchorResidualNormAllowance K M ... s
```

ou, na versao exata automatica:

```lean
‖c2ContinuedVerticalAnchorResidual s‖
  + c2GenuineRebasingDefectExactTriangleUpper s
  < c2ExactVerticalAnchorResidualNormAllowance K M ... s
```

A conta do quarteto continua sendo acionada do mesmo jeito; so deixamos o
defeito de rebasing com uma upper genuine registrada em Lean.

## Atualizacao 38 de 25/06/2026

Refinamos tambem o proprio anchor continuado.

Lean aceitou a fatoracao:

```lean
c2ContinuedVerticalAnchorResidual_eq_tail_mul_oddGap
```

Forma:

```lean
c2ContinuedVerticalAnchorResidual s
  =
  verticalDepthTailFromTwo s
    * (1 - 2 * continuedOddDirichletChannel s)
```

Com uma upper abstrata para o canal odd continuado:

```lean
C2ContinuedOddChannelBound oddUpper s
```

definimos:

```lean
c2ContinuedVerticalAnchorOddUpper oddUpper s
  =
  verticalDepthTailUpper s * (1 + 2 * oddUpper s)
```

e Lean aceitou:

```lean
c2ContinuedVerticalAnchorResidual_norm_le_oddUpper
```

Leitura:

```lean
‖c2ContinuedVerticalAnchorResidual s‖
  ≤ verticalDepthTailUpper s * (1 + 2 * oddUpper s)
```

Tambem ficou registrada a instancia exata:

```lean
c2ContinuedOddExactUpper
c2ContinuedVerticalAnchorExactOddUpper
c2ContinuedVerticalAnchorResidual_norm_le_exactOddUpper
```

Agora a forma mais concreta do boleto final e:

```lean
c2ContinuedAnchorOddRebasingTriangleUpper
  oddUpper genuineUpper continuedUpper s
  < c2ExactVerticalAnchorResidualNormAllowance K M ... s
```

Isto expande para:

```lean
verticalDepthTailUpper s * (1 + 2 * oddUpper s)
  + genuineUpper s
  + continuedUpper s
  < c2ExactVerticalAnchorResidualNormAllowance K M ... s
```

Tambem ha uma versao em que o `continuedUpper` e herdado do mesmo `oddUpper`:

```lean
c2ContinuedAnchorOddGenuineTriangleUpper oddUpper genuineUpper s
```

Os fechamentos novos sao:

```lean
C2ExactVerticalResidualDominance_of_odd_rebasing_triangle_lt_allowance
C2ExactVerticalResidualDominance_of_odd_genuine_triangle_lt_allowance
C2ExactVerticalResidualDominance_of_exactOdd_exactDefect_lt_allowance
genuineCentralNoCancellation_of_odd_rebasing_triangle_lt_allowance
genuineCentral_ne_zero_of_odd_rebasing_triangle_lt_allowance
genuineCentralNoCancellation_of_odd_genuine_triangle_lt_allowance
genuineCentral_ne_zero_of_odd_genuine_triangle_lt_allowance
genuineCentralNoCancellation_of_exactOdd_exactDefect_lt_allowance
genuineCentral_ne_zero_of_exactOdd_exactDefect_lt_allowance
```

Status honesto: o ultimo boleto ainda precisa ser provado no middle, mas agora
ele e uma desigualdade real de envelopes: cauda vertical, upper do canal odd,
upper genuine/continued e margem disponivel do quarteto. A cadeia ate o `neq
zero` genuine esta fechada a partir dessa desigualdade.

## Atualizacao 39 de 25/06/2026

Encapsulamos o boleto final da rota refined odd-anchor como um pacote local
proprio.

Os predicados novos sao:

```lean
C2GenuineOddAnchorFinalBudget
C2GenuineOddAnchorInheritedBudget
```

A versao herdada usa o mesmo upper do canal odd para controlar tambem o
continued central:

```lean
c2ContinuedAnchorOddGenuineTriangleUpper oddUpper genuineUpper s
  < c2ExactVerticalAnchorResidualNormAllowance K M ... s
```

O pacote local novo e:

```lean
C2GenuineOddAnchorLocalData
```

Ele guarda exatamente:

```lean
offCritical
horizontalScale_pos
horizontalConstant_nonneg
horizontalRatio_nonneg
horizontalRatio_lt_one
horizontalLayer_bound
odd_bound
genuine_bound
final_budget
```

Tambem entrou um construtor a partir do budget horizontal ja existente:

```lean
C2GenuineOddAnchorLocalData.of_horizontalBudget
```

E o Lean agora fecha a cadeia:

```lean
C2GenuineOddAnchorLocalData.to_exactVerticalResidualDominance
genuineCentralNoCancellation_of_oddAnchorLocalData
genuineCentral_ne_zero_of_oddAnchorLocalData
```

Traducao honesta: se, em um ponto do middle, construirmos esse pacote local,
o genuine `neq zero` esta fechado. O item matematico que ainda falta nao e
refazer a auditoria do quarteto; e provar o campo `final_budget`, isto e, que
o upper refined odd-anchor cabe na allowance que sobrou depois de pagar
horizontal e cutoff.

## Atualizacao 40 de 25/06/2026

Tentamos fechar o `final_budget` norm-only da rota odd-anchor e o Lean mostrou
uma barreira formal.

Entrou primeiro a nao negatividade do cutoff norm:

```lean
c2RawCentralCutoffNormConstant_nonneg
```

Depois provamos que a allowance do anchor e sempre menor que a propria cauda
vertical geometrica:

```lean
c2ExactVerticalAnchorResidualNormAllowance_lt_verticalDepthTailUpper
```

Forma conceitual:

```lean
c2ExactVerticalAnchorResidualNormAllowance K M ... s
  < verticalDepthTailUpper s
```

Isso vem da fatoracao positiva:

```lean
verticalDepthTailUpper s
  - c2ExpandedQuartetResidualMargin s
      * ((1 - ‖q s‖) * (1 + ‖q s‖)⁻¹)
> 0
```

Mas o upper odd-anchor atual e:

```lean
verticalDepthTailUpper s * (1 + 2 * oddUpper s)
```

Logo, se `oddUpper s >= 0`, esse upper ja e pelo menos
`verticalDepthTailUpper s`. Com os uppers genuine/continued tambem
nao negativos, o lado esquerdo do boleto fica maior ou igual a uma quantidade
que a allowance e estritamente menor.

O Lean registrou isso como:

```lean
not_C2GenuineOddAnchorFinalBudget_of_nonneg_uppers
not_C2GenuineOddAnchorInheritedBudget_of_nonneg_uppers
not_C2GenuineOddAnchorLocalData
```

Traducao honesta: o boleto final, na forma norm-only herdada por
`C2GenuineOddAnchorLocalData`, nao pode fechar. A conta nao falhou por falta de
algebra; ela falhou porque o majorante ainda e grosseiro demais.

Proxima correcao matematica: substituir o controle

```lean
‖1 - 2 * continuedOddDirichletChannel s‖ <= 1 + 2 * oddUpper s
```

por um controle direto do gap

```lean
‖1 - 2 * continuedOddDirichletChannel s‖ <= gapUpper s
```

com `gapUpper s < 1` ou com uma economia suficiente para caber na allowance.
Essa e a economia de fase/canal que o majorante por norma destruiu.

Essa substituicao tambem ja ficou formalizada.

Novo bound direto:

```lean
C2ContinuedOddGapBound gapUpper s
```

Forma:

```lean
‖1 - 2 * continuedOddDirichletChannel s‖ <= gapUpper s
```

Novo upper do anchor:

```lean
c2ContinuedVerticalAnchorGapUpper gapUpper s
  =
verticalDepthTailUpper s * gapUpper s
```

Lean aceitou:

```lean
c2ContinuedVerticalAnchorResidual_norm_le_gapUpper
```

Novo boleto final:

```lean
C2GenuineGapAnchorFinalBudget
```

Forma:

```lean
c2ContinuedAnchorGapRebasingTriangleUpper
  gapUpper genuineUpper continuedUpper s
  < c2ExactVerticalAnchorResidualNormAllowance K M ... s
```

E os endpoints:

```lean
C2ExactVerticalResidualDominance_of_gapAnchorFinalBudget
genuineCentralNoCancellation_of_gapAnchorFinalBudget
genuineCentral_ne_zero_of_gapAnchorFinalBudget
```

Traducao: a rota norm-only morreu formalmente, mas a rota correta agora esta
aberta no Lean. O boleto a provar deixou de ser "controle do canal odd por
norma" e virou "controle direto do gap odd", que e exatamente onde a economia
de fase precisa entrar.

## Atualizacao 41 de 25/06/2026

Auditoria de contexto apos revisitar a prova "na caneta nao tem saldo para
cancelar o quarteto".

O livro-caixa do quarteto esta, de fato, formalizado no Lean:

```lean
c2ConcreteAntiMiracleQuartet_norm_ge_K2Margin
c2ConcreteAntiMiracleTail_norm_le_fourTermUpper
c2ConcreteAntiMiracleFiniteModel_ne_zero_of_fourTermDominance
adjustedQuartetBalancedGenuineBulkModel_ne_zero_of_mem_concreteRegion_ledger
genuineCentral_ne_zero_of_mem_concreteRegion_ledger
```

Traducao: dado o certificado concreto com `quartet_dominance`, Lean prova que
o modelo genuine balanceado nao zera e, pela ponte central, prova
`genuineCentralDoubleSeries s ≠ 0`.

O campo importante e:

```lean
quartet_dominance
```

Ele e exatamente a auditoria:

```lean
vertical debt + tilt + horizontal + cutoff < quartet lower
```

Depois da correcao da API publica, a camada exposta em `PeerReview` para a rota
ativa e:

```lean
PeerReview.QuarterUnitMiddleCertificate
PeerReview.genuineCentral_ne_zero_of_quarterUnitMiddleCertificate
```

Essa camada e condicional no certificado middle atual: ela diz que, dados scale,
horizontal e quarter-unit reserve, segue nao-anulamento do
`genuineCentralDoubleSeries` no middle. Portanto, para auditoria interna, a
frase correta e:

```text
o livro-caixa active-main atual esta exposto no PeerReview;
o endpoint publico atual fecha genuineCentralDoubleSeries != 0 no middle;
nao confundir isso com um certificado terminal de RH.
```

A rota odd-anchor/gap-aware registrada acima e uma auditoria/refinamento
paralela. Ela nao deve ser lida como uma pendencia da prova de
`quartet_dominance`; ela diagnostica outro envelope que foi tentado depois.

## Atualizacao 42 de 25/06/2026

Fechamos no Lean o bound global pointwise do quarteto em todo o middle.

O lower original do quarteto era:

```lean
c2ConcreteAntiMiracleQuartet_norm_ge_K2Margin
```

Forma:

```lean
c2ExpandedQuartetK2Margin s <=
  ‖c2ConcreteAntiMiracleQuartet s‖
```

Como todo ponto de `c2ExpandedScalarMiddleRegion near edge` carrega a
hipotese `offCriticalStrip`, esse lower foi promovido para:

```lean
c2ConcreteAntiMiracleQuartet_norm_ge_K2Margin_of_mem_middle
```

Forma:

```lean
s ∈ c2ExpandedScalarMiddleRegion near edge →
c2ExpandedQuartetK2Margin s <=
  ‖c2ConcreteAntiMiracleQuartet s‖
```

Tambem registramos que a margem canonica e estritamente positiva em todo
ponto do middle:

```lean
c2ExpandedQuartetK2Margin_pos_of_mem_middle
```

e portanto o quarteto concreto nao zera em todo ponto do middle:

```lean
c2ConcreteAntiMiracleQuartet_ne_zero_of_mem_middle
```

Leitura honesta: esse e um bound global no dominio middle, mas pointwise no
ponto `s`. Nao foi afirmada uma constante uniforme positiva independente de
`s`; o que foi provado e o lower canonico positivo
`c2ExpandedQuartetK2Margin s` para cada ponto coberto pelo middle.
