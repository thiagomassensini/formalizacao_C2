# Audit Projected J0 Raw Enclosure Contract

Rota: Genuine-First. Este documento define a fronteira que ainda precisa ser
confiavel antes da cadeia positive-box setorial poder ser tratada como
certificado analitico completo.

## Contrato Por Subcaixa

Para cada subcaixa retangular, o produtor de retangulos brutos deve garantir:

```text
para todo s na subcaixa:

M(s)        pertence a M_rectangle
D0(s)       pertence a D0_rectangle
Drest(s)    pertence a Drest_rectangle
RvecTail(s) pertence a RvecTail_rectangle
```

Com essas quatro inclusoes, o verificador retangular independente pode derivar
com seguranca:

```text
D0NegReMain upper
main_abs lower
rest_combined upper
```

## Objetos

```text
M(s):
  adjustedProjectedJ0_M tiltSeed s

D0(s):
  adjustedProjectedJ0_D0 coreCutoff s

Drest(s):
  adjustedProjectedJ0_Drest coreCutoff s

RvecTail(s):
  adjustedProjectedJ0_RvecTail tiltSeed coreCutoff K M s
```

O resto combinado deve ser formado como vetor complexo:

```text
Drest(s) + RvecTail(s)
```

e so depois convertido em cota real por norma. `RvecTail` e vetor complexo;
`restUpper` e cota real.

## Produtores Atuais

Produtor box-level:

```text
operadores/c2_projected_j0_sector_box_certifier.py
```

Produtor granular por subcaixa:

```text
operadores/c2_projected_j0_sector_subbox_certificate.py
```

O primeiro certifica caixas agregadas. O segundo reemite, por subcaixa, os
retangulos complexos brutos para `M`, `D0`, `Drest` e `RvecTail`.

## Modo Fast Atual

O modo `fast`:

- usa `float64` para logs e pesos;
- infla logs/pesos e somas por uma margem explicita;
- avalia intervalos de fase por subcaixa;
- subdivide a direcao `t`;
- e rapido o suficiente para a cadeia positive-box inteira.

Limite: o modo `fast` ainda nao e verificado no kernel Lean. Ele e uma camada
externa auditavel.

## Modo Strict Atual

O modo `strict`:

- usa `mpmath.iv`;
- e muito mais lento;
- serve como auditoria localizada;
- confirmou `s0.84_t7` em `strict/sub8`;
- recuperou `s0.84_t0`, `s0.84_t1` e `s0.85_t0` em `strict/sub16`.

Leitura: strict fortalece a confianca nas sentinelas, mas ainda nao e o
certificador primario por custo.

## Verificadores Ja Separados

O subbox verifier checa:

```text
cobertura de subcaixas
agregacao box-level
direcoes de arredondamento
budgets racionalizados
```

O rectangle verifier checa:

```text
D0NegReMain, main lower e rest upper derivados dos retangulos brutos
```

O raw enclosure checker desta etapa deve auditar a fronteira anterior:

```text
os retangulos brutos armazenados sao compativeis com uma recomputacao strict
localizada?
```

## Limite Restante

Mesmo com a auditoria strict sentinela, a prova formal completa ainda exigiria
um dos caminhos:

1. recomputacao strict independente para todas as subcaixas relevantes;
2. checker externo menor e auditavel para os retangulos brutos;
3. formalizacao parcial de aritmetica retangular;
4. certificacao formal posterior das funcoes transcendentais usadas nos
   retangulos brutos.
