# Audit Projected J0 Positive Box Rationalized Lean Data

Data: 2026-07-08.

Rota: Genuine-First. Esta camada gera dados Lean para verificar apenas a
algebra racional dos budgets do positive-box racionalizado.

## Arquivos

Gerador criado:

```text
operadores/c2_projected_j0_generate_lean_rationalized_data.py
```

Arquivo Lean gerado:

```text
LeanC2/AuditAdjustedQuartetProjectedJ0PositiveBoxRationalizedData.lean
```

Schema usado:

```text
LeanC2/AuditAdjustedQuartetProjectedJ0RationalizedCertificateSchema.lean
```

## Conteudo Lean

Foram gerados:

```text
27 certificados combined
27 certificados separate
```

Cada certificado prova apenas:

```text
0 < mainLower
0 <= numeratorUpper
0 <= restUpper
0 < mainLower - numeratorUpper/mainLower - restUpper
```

com constantes racionais.

Listas geradas:

```lean
positiveBoxCombinedRationalizedCertificates
positiveBoxSeparateRationalizedCertificates
```

## Verificacao

Comando executado:

```bash
lake env lean LeanC2/AuditAdjustedQuartetProjectedJ0PositiveBoxRationalizedData.lean
```

Resultado: passou.

O build completo do modulo tambem foi executado depois desta checagem.

## Limite

Estes teoremas nao provam que as constantes racionalizadas minoram ou majoram
as funcoes analiticas. Eles checam somente a algebra racional dos dados ja
arredondados.

## Proximo Passo

1. Conectar estes dados ao schema externo/manifest.
2. Criar um verificador externo das enclosures ou formalizar a aritmetica
   intervalar em etapa futura.
3. Manter o positive-box como primeiro bloco robusto de dados externos.
