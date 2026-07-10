# Audit Projected J0 External Checker Path

Data: 2026-07-08.

Rota: Genuine-First. Este documento desenha como levar o positive-box pack de
artefato externo auditavel para uma camada consumivel por uma prova formal ou
por um verificador certificado.

## Estado Atual

O pack positive-box ja foi verificado externamente:

```text
checks failed: 0
27/27 combined
27/27 separate
max rerun diff: 0.0
worst box: s0.84_t7
```

Isso ainda nao e prova Lean. O pack registra constantes e reprodutibilidade,
mas o kernel nao verifica as enclosures analiticas.

## Opcao 1: Formalizar Aritmetica Intervalar Em Lean

Vantagens:

```text
mais forte;
menor dependencia externa;
eventualmente permite verificar as enclosures no kernel.
```

Custos:

```text
implementacao grande;
provas de arredondamento e transcendentes caras;
risco alto de travar a rota antes de colher valor local.
```

Leitura: e o caminho mais forte, mas provavelmente nao e o proximo passo
pratico para a rota projected-j0.

## Opcao 2: Verificador Externo Pequeno E Deterministico

Ideia:

```text
ler config.json e boxes.json;
verificar hashes dos artefatos;
recalcular identidades de budget;
checar sinais, contagens e reproducao;
emitir um artefato hashado.
```

Vantagens:

```text
pequeno;
deterministico;
facil de auditar;
ja alinhado com o pack verifier atual.
```

Limite:

```text
ainda exige confiar no verificador externo e na geracao das enclosures.
```

Leitura: bom como trilha de engenharia, mas ainda nao transforma os bounds em
prova formal.

## Opcao 3: Certificado Racionalizado

Ideia:

```text
arredondar mainNormLowerConst para baixo;
arredondar numeratorUpperConst e restUpperConst para cima;
recalcular parallelUpperConst;
recalcular budgets;
preservar apenas caixas com budget positivo;
emitir JSON/CSV racionalizado.
```

O Lean futuro pode verificar apenas a algebra:

```text
0 < mainLower - numeratorUpper / mainLower - restUpper
```

com numeros racionais. Isso reduz a fragilidade de ponto flutuante e prepara
um arquivo de dados mais seguro.

Limite essencial:

```text
Lean ainda nao verifica que os racionais de fato minoram/majoram as funcoes.
```

Portanto, esta camada nao e prova analitica; e uma camada de dados segura.

## Recomendacao

A proxima etapa pratica deve ser a opcao 3:

```text
rationalized certificate pack para positive-box
```

Motivos:

```text
1. preserva a robustez do bloco positive-box;
2. aproxima o formato de um futuro arquivo Lean de dados;
3. elimina dependencias desnecessarias de representacao float para a algebra;
4. nao finge que o CSV virou prova formal.
```

Depois disso, ha duas continuacoes naturais:

```text
A. criar um verificador externo pequeno que confira o pack racionalizado;
B. formalizar em Lean apenas a parte algebraica dos budgets racionais.
```

As enclosures analiticas continuam sendo a parte externa a justificar.
