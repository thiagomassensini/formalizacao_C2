# Auditoria s0.84_t7: genealogia Gaussian e obstrução do produtor

Data: 2026-07-10.

Status: genealogia matemática fechada; critério de parada 1 acionado antes das
enclosures. Não há conclusão de nonvanishing nesta rodada.

## Resultado executivo

O modelo SG exato foi unificado com a infraestrutura genuine do carrier:

```text
projectedJ0SG_reference s
  = c2CenterGaussianRectangle 10661 s 17 16001
  = superGaussianFiniteGenuineRectangle 2 10661 s 17 16001.
```

Também foi provado, termo a termo, que o summand do carrier Gaussian é o
summand central genuine correspondente multiplicado pela janela Gaussian.
Essas identidades são teoremas Lean sobre aritmética real/complexa exata.

A inspeção do produtor real encontrou uma divergência anterior às enclosures:
os retângulos armazenados foram gerados a partir de coeficientes binary64 com
remoção explícita de underflow. Eles não são, sem uma ponte de erro adicional,
retângulos do modelo SG exato acima.

## Genealogia formal

Arquivo:

```text
LeanC2/Analytic/GenuineGaussianGenealogy.lean
```

Teoremas principais:

```text
c2CenterGaussianSeriesAddressTerm_eq_genuineCentralRawFamily_mul_window;
projectedJ0SG_centralFinite_two_eq_c2CenterGaussianRectangle;
projectedJ0SG_reference_eq_c2CenterGaussianRectangle;
projectedJ0SG_reference_eq_superGaussianFiniteGenuineRectangle;
projectedJ0SG_totalFinite_eq_c2CenterGaussianRectangle.
```

O primeiro teorema é local. Ele não identifica somas infinitas e não usa a
genealogia como uma continuação. Os três objetos matemáticos têm os mesmos:

```text
fator externo 2;
peso dyadic 2^(-k);
endereço c = 2^k*m;
potência complexa c^(-s);
janela exp(-((c/10661)^2));
k inclusivo de 2 a 17;
m ímpar inclusivo até 16001.
```

O target permanece `(K,M)=(16,12001)`, o reference `(17,16001)`, `X=10661`
e `p=2`. A fórmula algébrica do seed também coincide no nível matemático.

## Corpo literal do produtor

Os dados da sentinela passam por:

```text
operadores/c2_projected_j0_sector_subbox_certificate.py
  -> operadores/c2_projected_j0_sector_box_certifier.py
  -> operadores/c2_projected_j0_interval_box_certifier.py
```

Em `build_central_data`, o produtor executa:

```python
coeffs = (2.0 * math.ldexp(1.0, -k)) * regularized_weight(...)
keep = coeffs != 0.0
```

`regularized_weight` usa arrays NumPy binary64 e `np.exp`. Mesmo no modo
`strict`, `term_sum_strict` converte `data.coeffs[idx]`, já arredondado em
binary64, em um intervalo pontual decimal. Não há ali uma enclosure do valor
exato de `Real.exp` que aparece no modelo Lean.

## Primeira divergência exata

Contagem reproduzida chamando o próprio `build_central_data`:

| bloco | endereços matemáticos | termos retidos | termos omitidos |
|---|---:|---:|---:|
| target `16/12001` | 90015 | 27074 | 62941 |
| reference `17/16001` | 128016 | 33075 | 94941 |

O primeiro coeficiente completo removido em ambos é:

```text
k = 5;
m = 9077;
c = 2^5 * 9077 = 290464;
(c/10661)^2 em binary64 ~= 742.3158621022295;
2 * 2^(-5) * exp(-((c/10661)^2)) arredonda para 0.0.
```

O primeiro `np.exp` que já retorna zero antes da multiplicação externa ocorre
em `(k,m,c)=(5,9095,291040)`. No modelo Lean, ambos os pesos são estritamente
positivos por `Real.exp_pos`.

Portanto a primeira igualdade que falta não é uma identidade Gaussian em
Lean. É uma estimativa certificada entre:

```text
lista finita binary64 truncada do produtor
e
retângulo SG matemático exato.
```

## Impacto sobre os retângulos da sentinela

Os 32 IDs, a cobertura, os endpoints racionais e a aritmética retangular Lean
continuam íntegros. O que não existe é o membership analítico desses
retângulos para `projectedJ0SG_M`, `projectedJ0SG_D0`,
`projectedJ0SG_Drest` e `projectedJ0SG_RvecTail` exatos.

Logo não é lícito derivar nesta rodada:

```text
1/100 <= norm(projectedJ0SG_totalFinite s);
nonvanishing do carrier Gaussian infinito;
delta < 1/200 para a função pareada;
nonvanishing da função pareada.
```

Nenhum desses statements foi postulado como hipótese escondida ou extraído dos
arquivos externos.

## Infraestrutura auditada e preservada

A convergência do carrier para `0 < s.re`, sua convergência por cutoff e os
budgets de tail existentes compilam e foram reutilizados apenas na auditoria.
O cutoff candidato `(nmax,K)=(64012,15)` é full-depth porque
`64012 <= 2^(15+1)`, mas é um subconjunto estrito do retângulo reference.

O primeiro endereço fora do retângulo no core mínimo é
`(k,m,c+1)=(2,16003,64013)`. Para um futuro lift correto será necessário
decompor diretamente o `tsum` pelo finset retangular; não se deve obter essa
cauda por uma desigualdade triangular com o cutoff menor.

A infraestrutura integral já permite reduzir a cauda Gaussian a uma cota
fechada. A auditoria encontrou uma rota racional folgada abaixo de `1/10000`,
mas ela não foi incorporada depois que o critério de parada do produtor foi
acionado.

## Próximo passo mínimo

Há duas reparações honestas possíveis, ambas somente na sentinela:

1. regenerar os coeficientes com enclosures racionais verificáveis de `exp` e
   produzir retângulos que contenham diretamente o modelo SG exato; ou
2. representar a lista binary64 como coeficientes racionais exatos e provar um
   bound separado para arredondamento dos termos retidos mais a cauda omitida
   por underflow.

Depois dessa ponte, e não antes, pode-se reutilizar a contabilidade dos 32
subboxes, levantar o retângulo ao carrier infinito e certificar o defeito para
a soma pareada.

## Verificações

Os módulos principais e o carrier compilaram individualmente antes das
edições. A auditoria de axiomas da genealogia está em:

```text
LeanC2/AuditGenuineGaussianGenealogy.lean
```

Os cinco teoremas novos usam apenas `propext`, `Classical.choice` e
`Quot.sound`. Não há axioma local nem placeholder de prova. Os 27 shards e os
32 registros da sentinela não foram regenerados.

Também passaram:

```text
lake env lean dos módulos SG, genealogia, carrier e auditorias da sentinela;
lake build LeanC2: 8300 jobs;
verificador dos dados retangulares: 27 boxes, 771 subboxes, 32 na sentinela,
  zero falhas;
git diff --check.
```

O digest agregado dos 27 shards permaneceu:

```text
7bda0ab98efbce8222f2e4ce3ae1320b0c1c89e176f0c603e133a4cb5d5644fe
```

A expansão dos corpos dos cinco teoremas de genealogia não contém o alvo raw
totalizado, canais de continuação antigos ou dependências externas à rota C2.
