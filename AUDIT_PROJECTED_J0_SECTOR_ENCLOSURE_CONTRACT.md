# Audit Projected J0 Sector Enclosure Contract

Rota: Genuine-First. Este documento define o contrato externo que precisa ser
confiavel para transformar o pack setorial positive-box em uma hipotese
analitica consumivel pela ponte Lean condicional.

## Contrato Por Caixa

Para cada caixa retangular, o certificado externo deve registrar:

1. Regiao:

```text
sigma_min <= Re(s) <= sigma_max
t_min     <= Im(s) <= t_max
```

2. Main lower:

```text
para todo s na caixa,
  mainLower <= ||M(s)||
```

3. Setor nao destrutivo:

```text
para todo s na caixa,
  D0NegReMain(s) <= d0NegReUpper <= 0
```

4. Resto combinado:

```text
para todo s na caixa,
  restCostFinite(s) <= restUpper
```

5. Budget setorial:

```text
0 < mainLower - restUpper
```

## Objetos Do Contrato

Os objetos complexos sao:

```text
M(s) =
  adjustedProjectedJ0_M tiltSeed s

D0(s) =
  adjustedProjectedJ0_D0 coreCutoff s

Drest(s) =
  adjustedProjectedJ0_Drest coreCutoff s

RvecTail(s) =
  adjustedProjectedJ0_RvecTail tiltSeed coreCutoff K M s
```

O custo de resto combinado e:

```text
restCostFinite(s) = ||Drest(s) + RvecTail(s)||
```

Ponto de moeda: `RvecTail : C` e um vetor complexo; `restUpper : R` e uma
cota real. A cota real deve majorar a norma do vetor combinado. Nao se deve
substituir `RvecTail` por soma de uppers reais antes de formar a quantidade
que o contrato combinado declara.

## O Que Ja E Checado

A cadeia positive-box setorial atual checa:

- consistencia e hashes do sector pack;
- rerun do certifier do pack;
- chain verifier `source -> pack -> rationalized -> Lean data -> bridge`;
- algebra racional em Lean:

```text
d0NegReUpper <= 0
0 < mainLower
0 <= restUpper
0 < mainLower - restUpper
```

- ponte condicional Lean:

```text
certificado racionalizado setorial
+ hipoteses analiticas externas
------------------------------------------------
ProjectedJ0SectorConstantBoxData
------------------------------------------------
totalFinite != 0
```

Com o certificado por subcaixa, passa a ser checado tambem:

- cobertura das subcaixas em cada caixa;
- agregacao dos lowers/uppers subbox para cada box;
- direcoes de arredondamento do pack racionalizado contra os agregados;
- setor nao destrutivo em todos os uppers subbox.

## O Que Ainda Fica Fora Do Kernel Lean

Ainda nao e checado formalmente dentro do kernel:

- validade matematica das enclosures intervalares por subcaixa;
- correcao das funcoes transcendentais usadas no certifier;
- arredondamento interno do modo `fast`;
- cobertura real das subcaixas como fato formal sobre regioes Lean;
- igualdade entre os objetos computados externamente e os aliases Lean
  correspondentes.

## Leitura

O contrato v1 deixa a fronteira de confianca explicita. O Lean ja consome a
forma racional e o bridge condicional. O que falta para transformar essa cadeia
em prova kernel-checked e verificar ou formalizar as enclosures que alimentam
`mainLower`, `d0NegReUpper` e `restUpper`.

## Proximo Passo

O proximo nivel pratico e manter o certifier externo pequeno, deterministico e
auditavel, com artefatos por subcaixa e hashes. Em paralelo, pode-se escolher
uma parte menor da aritmetica intervalar para formalizacao futura.
