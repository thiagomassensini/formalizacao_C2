# Audit Genuine Raw `tsum` Middle Obstruction

Data: 2026-07-10.

Rota: Genuine-First, frente Adjusted Quartet Projected J0.

Status: obstrução semântica dos alvos crus confirmada no kernel; primeira
camada da continuação pareada e separação do modelo SG exato presentes. A
auditoria posterior do produtor encontrou uma ponte binary64→modelo ainda
aberta.
O middle não está fechado.

## Resultado executivo

As definições históricas usam o `tsum` totalizado e incondicional do Mathlib:

```text
oddDirichletChannel s
  = ∑' n : Nat, complexDirichletCoeff s (2*n+1)

genuineCentralDoubleSeries s
  = ∑' p : Nat × Nat,
      2 * verticalRatio(s)^(p.1+2)
        * complexDirichletCoeff s (2*p.2+1).
```

Foi provado em Lean que as duas famílias não são `Summable` quando
`s.re ≤ 1`. Pelo lemma real do Mathlib
`tsum_eq_zero_of_not_summable`, segue:

```text
s.re ≤ 1 -> oddDirichletChannel s = 0;
s.re ≤ 1 -> genuineCentralDoubleSeries s = 0.
```

Em particular, os dois objetos valem zero nas três linhas positive-box:

```text
sigma = 21/25 = 0.84;
sigma = 17/20 = 0.85;
sigma = 43/50 = 0.86.
```

Consequência semântica:

```text
o tsum cru é uma representação analítica apenas no domínio de convergência;
o valor totalizado zero fora desse domínio não é uma continuação genuine;
genuineCentralDoubleSeries s != 0 não pode ser o endpoint literal do middle;
os memberships SG não devem ser instanciados para os aliases crus.
```

Os endpoints e os 27 shards históricos foram preservados. Sua interpretação
no middle foi marcada como restrita/supersedida; nenhum dado foi apagado ou
regenerado.

## Arquivos centrais

Obstrução e auditoria de corpos:

```text
LeanC2/Analytic/GenuineRawTsumObstruction.lean
LeanC2/AuditGenuineRawTsumObstruction.lean
```

Primeira camada C2-native da continuação pareada:

```text
LeanC2/Analytic/GenuinePairedContinuation.lean
```

Modelo SG exato e transferência abstrata:

```text
LeanC2/Analytic/ProjectedJ0SuperGaussianSurrogate.lean
LeanC2/Route/SurrogateTransfer.lean
```

O módulo agregado `LeanC2.lean` importa esses quatro módulos analíticos/de
rota. O audit com `#print` permanece separado do agregado.

## SummationFilter real

A notação sem parâmetro

```lean
∑' i, f i
```

expande para:

```lean
tsum f (SummationFilter.unconditional _)
```

e o corpo do filtro satisfaz:

```lean
SummationFilter.unconditional_filter β :
  (SummationFilter.unconditional β).filter = Filter.atTop.
```

Aqui `atTop` é o filtro das somas parciais sobre `Finset β`, ordenadas por
inclusão. Portanto:

| Objeto | Índice `β` | Filtro |
|---|---|---|
| `oddDirichletChannel` | `Nat` | `SummationFilter.unconditional Nat` |
| `genuineCentralDoubleSeries` | `Nat × Nat` | `SummationFilter.unconditional (Nat × Nat)` |
| `verticalDepthTailFromTwo` | `Nat` | `SummationFilter.unconditional Nat` |
| `c2TiltRegularizedResidual` | `Nat` | `SummationFilter.unconditional Nat` |
| `c2HorizontalRegularizedDefect` | `Nat` | `SummationFilter.unconditional Nat` |
| `c2PairedOddEvenChannel` | `Nat` | `SummationFilter.unconditional Nat` |

Não há filtro condicional por ordem natural nos aliases auditados. O valor de
`tsum` é `0` quando a família não é `Summable`.

## Famílias e normas exatas

### Canal ímpar cru

Foi isolada a família:

```lean
oddDirichletRawFamily s n :=
  complexDirichletCoeff s (2*n+1).
```

Sua norma exata é:

```lean
norm_oddDirichletRawFamily:
  ‖oddDirichletRawFamily s n‖
    = (((2*n+1 : Nat) : Real) ^ (-s.re)).
```

A prova reescreve o termo como uma p-série deslocada:

```text
(2*n+1)^(-sigma)
  = 2^(-sigma) * (n+1/2)^(-sigma).
```

Se a família complexa fosse incondicionalmente somável, a
finito-dimensionalidade de `Complex` daria somabilidade das normas. O
critério `Real.summable_one_div_nat_add_rpow` forçaria então `1 < s.re`, em
contradição com `s.re ≤ 1`.

Teoremas:

```lean
not_summable_oddDirichletRawFamily_of_re_le_one;
not_summable_oddDirichletCoeff_of_re_le_one;
not_summable_oddDirichletCoeff_of_re_pos_le_one;
oddDirichletChannel_eq_zero_of_re_le_one.
```

### Série central dupla crua

Foi isolada a família literal:

```lean
genuineCentralRawFamily s p :=
  2 * verticalRatio s ^ (p.1+2)
    * complexDirichletCoeff s (2*p.2+1).
```

Sua norma exata é:

```lean
norm_genuineCentralRawFamily:
  ‖genuineCentralRawFamily s p‖
    = 2 * ‖verticalRatio s‖^(p.1+2)
        * (((2*p.2+1 : Nat) : Real) ^ (-s.re)).
```

A prova de não-somabilidade fixa a profundidade `p.1 = 0`. Se a família em
`Nat × Nat` fosse `Summable`, `prod_factor 0` daria somabilidade da fatia

```text
((2 : Complex) * verticalRatio(s)^2)
  * complexDirichletCoeff s (2*n+1).
```

O fator constante é não nulo para todo `s`. Removê-lo forçaria somabilidade
do canal ímpar, contradizendo o resultado anterior.

Teoremas:

```lean
not_summable_genuineCentralRawFamily_of_re_le_one;
not_summable_genuineCentralDoubleSeries_family_of_re_le_one;
not_summable_genuineCentralDoubleSeries_family_of_re_pos_le_one;
genuineCentralDoubleSeries_eq_zero_of_re_le_one.
```

## Domínios de convergência formalizados

A baseline já possuía, no domínio `1 < s.re`:

```text
somabilidade das normas do canal ímpar;
somabilidade dos fatores vertical e ímpar da família central;
fatoração da série dupla por `centralFromOddChannel`;
cancelamento lateral das séries genuine.
```

O fator geométrico vertical é somável no domínio maior `0 < s.re`. Isso não
resgata a família dupla quando `s.re ≤ 1`, pois uma única fatia vertical não
nula ainda contém a p-série ímpar divergente.

A nova classificação formal é, portanto:

| Família | Domínio formal |
|---|---|
| canal ímpar cru | `Summable` para `1 < s.re`; não `Summable` para `s.re ≤ 1` |
| família central dupla crua | `Summable` para `1 < s.re`; não `Summable` para `s.re ≤ 1` |
| torre vertical | `Summable` para `0 < s.re` |
| família adjacente pareada | `Summable` para `0 < s.re` |

## Instâncias positive-box

Foram kernel-checked seis teoremas pointwise, válidos para todo `t : Real`:

```lean
oddDirichletChannel_eq_zero_at_sigma_21_div_25;
oddDirichletChannel_eq_zero_at_sigma_17_div_20;
oddDirichletChannel_eq_zero_at_sigma_43_div_50;

genuineCentralDoubleSeries_eq_zero_at_sigma_21_div_25;
genuineCentralDoubleSeries_eq_zero_at_sigma_17_div_20;
genuineCentralDoubleSeries_eq_zero_at_sigma_43_div_50.
```

Esses teoremas não usam a altura `t`, zeros conhecidos ou qualquer hipótese
contraditória. Eles são instâncias aritméticas de `s.re ≤ 1`.

## Ausência de regularização escondida

Os `#print` dos corpos confirmam:

```lean
c2TiltRegularizedResidual layer s = ∑' j, layer s j;
c2HorizontalRegularizedDefect layer s = ∑' j, layer s j.
```

Assim, `Regularized` nesses nomes não significa continuação analítica, soma de
Abel, soma de Cesàro ou pareamento. São `tsum` totalizados comuns.

Também não há mecanismo hidden nos dois alvos principais:

```text
oddDirichletChannel          = tsum cru sobre Nat;
genuineCentralDoubleSeries  = tsum cru sobre Nat × Nat.
```

Os lemas históricos de comparação presentes nos mesmos arquivos não entram
nos corpos dessas definições.

## Impacto sobre os aliases Projected J0

Os corpos auditados são:

```text
adjustedProjectedJ0_M;
adjustedProjectedJ0_D0;
adjustedProjectedJ0_Drest;
adjustedProjectedJ0_RvecTail;
adjustedProjectedJ0_totalFinite.
```

Classificação:

- `M` é `(q^2 + tiltSeed) * (1+q+q^2+q^3)` e não fixa a origem do
  `tiltSeed` arbitrário;
- `D0` usa uma camada finita menos `oddDirichletChannel` cru;
- `Drest` é a soma finita das camadas `j = 1,2,3`, todas com a mesma
  referência ímpar crua;
- `RvecTail` é definido como `totalFinite - adjustedQuartet` e herda todos os
  alvos contidos em `totalFinite`;
- `totalFinite` não é definicionalmente a série central e tampouco é um
  objeto puramente finito.

O audit prova por `rfl` a expansão:

```lean
adjustedProjectedJ0_totalFinite ... s
  = verticalDepthTailFromTwo s
    + (c2TiltRegularizedResidual ... s
       + c2ConcreteOddHorizontalDefect coreCutoff s)
    + (rectangularGenuine s K M
       - genuineCentralDoubleSeries s).
```

Logo o alias contém a série central crua com sinal negativo. No middle foi
provada a redução:

```lean
s.re ≤ 1 ->
adjustedProjectedJ0_totalFinite ... s
  = verticalDepthTailFromTwo s
    + (c2TiltRegularizedResidual ... s
       + c2ConcreteOddHorizontalDefect coreCutoff s)
    + rectangularGenuine s K M.
```

Essa redução não identifica o resultado com o surrogate externo. Ela apenas
torna visível o colapso do alvo subtraído.

## Efeito sobre os endpoints históricos

As quatro famílias de membership do pack antigo não devem ser instanciadas
para:

```text
adjustedProjectedJ0_M;
adjustedProjectedJ0_D0;
adjustedProjectedJ0_Drest;
adjustedProjectedJ0_RvecTail.
```

O produtor mede um surrogate finito supergaussiano, enquanto esses aliases
usam `tiltSeed` arbitrário, o canal ímpar cru e o target central cru. Não há
igualdade provada entre os objetos.

Em particular:

```text
certificado externo SG != membership analítico do alias cru;
totalFinite cru != genuineCentralContinuationC2;
totalFinite SG != totalFinite cru;
nonvanishing SG não implica nonvanishing da continuação sem um delta provado.
```

Os consumers antigos continuam corretos como lemas condicionais de álgebra
vetorial. O que fica supersedido é alimentá-los no middle com memberships do
pack SG contra os aliases crus.

## Continuação pareada C2-native

O arquivo `GenuinePairedContinuation.lean` define:

```lean
c2PairedOddEvenTerm s n :=
  complexDirichletCoeff s (2*n+1)
    - complexDirichletCoeff s (2*n+2);

c2PairedOddEvenChannel s := ∑' n, c2PairedOddEvenTerm s n.
```

Foi provada por teorema do valor médio a estimativa:

```text
‖c2PairedOddEvenTerm s n‖
  ≤ ‖s‖ * (2*n+1)^(-s.re-1),
```

e então:

```lean
0 < s.re -> Summable (c2PairedOddEvenTerm s).
```

O fator de continuação é:

```lean
c2OddContinuationFactor s :=
  (1 - complexDirichletCoeff s 2)
    / (1 - 2 * complexDirichletCoeff s 2),
```

formalmente igual à forma de potências complexas solicitada. O denominador é
não nulo em `0 < s.re ∧ s.re < 1`, por comparação de módulos.

Foram definidos:

```lean
c2ContinuedOddChannel s;
genuineCentralContinuationC2 s :=
  2 * (verticalRatio s ^ 2 / (1 - verticalRatio s))
    * c2ContinuedOddChannel s.
```

O denominador vertical é não nulo para `0 < s.re`. Também compilam as pontes
de compatibilidade, no domínio convergente:

```lean
1 < s.re -> c2ContinuedOddChannel s = oddDirichletChannel s;
1 < s.re ->
  genuineCentralContinuationC2 s = genuineCentralDoubleSeries s.
```

### Dependency closure

As definições, a estimativa de diferença, a prova de `Summable` pareada e as
pontes de compatibilidade são C2-native. As somabilidades raw usadas na ponte
foram refeitas localmente por p-série e separação par/ímpar, sem reutilizar os
helpers históricos de zeta summand.

Lemas locais principais:

```lean
summable_positiveDirichletCoeff_norm_c2_native_of_one_lt_re;
summable_positiveDirichletCoeff_c2_native_of_one_lt_re;
summable_oddDirichletCoeff_norm_c2_native_of_one_lt_re;
summable_oddDirichletCoeff_c2_native_of_one_lt_re;
positiveDirichletChannel_eq_odd_add_even_c2_native_of_one_lt_re.
```

A auditoria transitiva dos endpoints de compatibilidade não encontrou:

```text
riemannZeta;
riemannZetaSummandHom;
summable_riemannZetaSummand;
continuedOddDirichletChannel;
aliases terminais de zeta.
```

Assim, a closure estrita das duas compatibilidades `1 < s.re` está paga.

## Modelo supergaussiano exato

`ProjectedJ0SuperGaussianSurrogate.lean` registra a fórmula matemática exata
associada aos parâmetros do produtor, com nomes próprios:

```text
target K/M    = 16/12001;
reference K/M = 17/16001;
X = 10661;
p = 2.
```

Ele define separadamente:

```lean
projectedJ0SG_tiltSeed;
projectedJ0SG_M;
projectedJ0SG_D0;
projectedJ0SG_Drest;
projectedJ0SG_RvecTail;
projectedJ0SG_totalFinite.
```

A contabilidade matemática exata satisfaz, para `0 < s.re`:

```lean
projectedJ0SG_totalFinite s = projectedJ0SG_reference s.
```

Essa é uma identidade interna entre objetos SG finitos. Não é uma igualdade
com a lista binary64 truncada do produtor, com o `tsum` cru ou com
`genuineCentralContinuationC2`.

`SurrogateTransfer.lean` acrescenta:

```lean
mu ≤ ‖Tsg‖ -> ‖Tcont - Tsg‖ < mu -> Tcont != 0;
```

e preserva como lower explícito a margem projected-J0:

```text
mainLower - parallelUpper - restUpper ≤ ‖projectedJ0SG_totalFinite s‖.
```

Nenhum epsilon SG→continuação foi postulado.

## Diagnóstico sentinela preliminar

Para `s0.84_t7`, com `t` entre `32.855` e `32.859`, a margem setorial
racionalizada existente é aproximadamente:

```text
0.054086045801.
```

O diagnóstico reproduzível está em:

```text
operadores/c2_projected_j0_sg_to_paired_sentinel.py;
AUDIT_PROJECTED_J0_SG_TO_PAIRED_SENTINEL.md.
```

Com soma pareada direta de `N = 20000` pares, ele encontrou:

```text
max sampled_delta         = 4.827713013117e-7;
max continued_tail_upper = 5.078100162033e-4;
max tail_adjusted_upper   = 5.138170207791e-4;
adjusted / margin         = 9.499992339421e-3.
```

O `tail_adjusted_upper` soma a distância numérica da truncatura direta ao SG
e a majorante analítica da cauda pareada. Embora seja muito menor que a margem
nos cinco pontos, a aritmética finita ainda não é interval-enclosed.

Portanto o artefato não é uma enclosure da caixa contínua, não é um bound
kernel-checked e não autoriza ainda a aplicação formal do lemma de
transferência. O próximo teste válido deve certificar o delta sobre toda a
sentinela, com soma pareada finita intervalar, cauda provada e arredondamento
outward.

## Verificações

Passaram por `lake env lean`:

```text
LeanC2/Analytic/GenuineRawTsumObstruction.lean;
LeanC2/AuditGenuineRawTsumObstruction.lean;
LeanC2/Analytic/GenuinePairedContinuation.lean;
LeanC2/Analytic/ProjectedJ0SuperGaussianSurrogate.lean;
LeanC2/Route/SurrogateTransfer.lean.
```

O audit preserva `#print` dos nove corpos relevantes, confirma
`SummationFilter.unconditional` e imprime axiomas dos endpoints da obstrução.
Uma auditoria temporária também imprimiu axiomas da somabilidade pareada, das
duas compatibilidades, da identidade SG e dos dois lemas de transferência. Os
novos teoremas auditados usam apenas:

```text
[propext, Classical.choice, Quot.sound].
```

Não apareceu `sorryAx` nem axioma local.

## Limites e ordem ativa

Já pago:

```text
obstrução formal dos tsums crus;
collapse kernel-checked no middle;
primeira camada convergente da continuação pareada;
definição literal separada do surrogate SG;
lemma abstrato de transferência e lower explícito SG.
```

Ainda aberto:

```text
provar enclosure do delta SG→continuação na sentinela inteira;
provar memberships dos retângulos somente para os aliases SG corretos;
decidir, pelo delta sentinela, entre transferir ou recertificar diretamente;
expandir depois para as 771 subboxes;
cobrir uma faixa bidimensional e o restante do middle.
```

Ordem canônica a partir desta auditoria:

```text
1. obstrução do raw tsum;
2. continuação paired genuine;
3. definição exata do surrogate SG;
4. delta surrogate→continuação na sentinela;
5. somente então enclosures kernel-checked e expansão regional.
```

Não foram provados nonvanishing de `genuineCentralContinuationC2`, o middle
inteiro ou RH.
