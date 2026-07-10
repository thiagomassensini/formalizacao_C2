# Lean audit: continued quartet V-split

Arquivo criado:

```text
LeanC2/AuditContinuedQuartetVSplit.lean
```

Status de compilacao:

```text
lake env lean LeanC2/AuditContinuedQuartetVSplit.lean
```

compila sem erros.

## O que foi implementado

Definicoes audit-only no namespace:

```lean
C2.ContinuedQuartetAudit
```

Novas pecas do split vertical:

```lean
anchor : ℂ → ℂ
cutVec : ℕ → ℕ → ℂ → ℂ
vSplit : ℕ → ℕ → ℂ → ℂ
```

com:

```lean
anchor s = verticalDepthTailFromTwo s - continuedCentralOddChannel s
cutVec K M s = rectangularGenuine s K M - continuedCentralOddChannel s
vSplit K M s = anchor s + cutVec K M s
```

Identidades e bounds criados:

```lean
anchor_eq_continuedVerticalChannelAnchor
cutVec_eq_continuedCutoffError
c2ContinuedVerticalResidual_eq_vSplit
c2ContinuedVerticalResidual_eq_anchor_add_cutVec
vSplit_norm_le_anchorUpper_add_cutUpper
c2ContinuedVerticalResidualExactUpper_le_vSplitUpper
```

Ledger q-ratio abstrato com uppers para `anchor` e `cutVec`:

```lean
vSplitTiltConstantQRatio
vSplitResidualUpperQRatio
vSplitResidualLedgerQRatio
vSplitResidualUpperQRatio_eq_ledger
vSplitQRatio_quartetDominance_of_ledger
vSplitQRatio_quartetDominance_of_residualUpper
```

Infraestrutura inicial para margem setorial do quarteto:

```lean
QuartetPrefixSectorLower
c2ExpandedQuartetSectorResidualMargin
c2QuartetSectorK2Lower_le_truePrefix
c2ExpandedQuartetSectorResidualMargin_le_trueResidualMargin
C2ExpandedQuartetSectorResidualDominance
truePrefixResidualDominance_of_sectorResidualDominance
```

## O que continua aberto

Ainda nao ha prova analitica/numerica formal de:

```text
‖anchor s‖ ≤ anchorUpper s
‖cutVec K M s‖ ≤ cutUpper s
```

Tambem nao ha certificado intervalar real para:

```text
Lsector s ≤ ‖verticalQuartetPrefix (q s)‖
```

O arquivo apenas prepara a API condicional para esses proximos passos. Nada foi
promovido para a rota principal.
