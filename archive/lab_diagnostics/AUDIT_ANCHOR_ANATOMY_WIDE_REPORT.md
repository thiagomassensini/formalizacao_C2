# Anchor anatomy audit

This is a diagnostic report only.  The continued odd channel is evaluated in
`zeta_diagnostic` mode and is not proof input for the genuine-first Lean middle
route.

Generated artifacts:

```text
audit_anchor_anatomy_points.csv
audit_anchor_anatomy_boxes.csv
audit_anchor_anatomy_subboxes.csv
audit_anchor_anatomy_summary.json
```

## Algebraic Form

The relevant Lean definitions give:

```text
continuedCentralOddChannel s =
  centralFromOddChannel continuedOddDirichletChannel s
```

and the existing audit route already proves the factorization:

```text
anchor s =
  verticalDepthTailFromTwo s *
    (1 - 2 * continuedOddDirichletChannel s)
```

So the scanner measures both `|anchor|` and the diagnostic product:

```text
|tau| * |1 - 2 * continuedOddDirichletChannel|
```

## Anchor Growth

| box | max \|tau\| | max \|1-2 odd\| | max \|anchor\| | anchor rel range | median cos(anchor,-K4) | growth read |
| --- | --- | --- | --- | --- | --- | --- |
| wide_anchor_scan | 0.0940307774468455729163121 | 2.81650058708308584101201 | 0.264837739882919543642329 | 19.7051838847307146661451 | 0.833157877505470149495352 | anchor_phase_aligned+strong_box_variation+sector_unhelpful |

## Ledger With Box Anchor Uppers

`anchor direct` is sampled `sup |anchor|` on the box.  `anchor factored` is
`sup |tau| * sup |1 - 2 odd|` on the same box.

| box | K | M | anchor direct | anchor factored | cut upper | q-ledger/Qsector | direct/Qsector | worst q-ledger slack | read |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| wide_anchor_scan | 3 | 50 | 0.264837739882919543642329 | 0.264837739882919543642329 | 0.0374637890445631724036654 | 0 | 0 | -0.561397849763718737103648 | anchor_exceeds_margin_scale |
| wide_anchor_scan | 4 | 50 | 0.264837739882919543642329 | 0.264837739882919543642329 | 0.0104907325852905995685028 | 0 | 0 | -0.484627891782844782081214 | anchor_exceeds_margin_scale |
| wide_anchor_scan | 5 | 50 | 0.264837739882919543642329 | 0.264837739882919543642329 | 0.00742922952191662703094626 | 0 | 0 | -0.475914327493665399698428 | anchor_exceeds_margin_scale |

## Subbox Probe

The subbox probe checks whether interval boxes could localize the large anchor.
It does not produce a certificate.

| box | subbox | sigma | t | max \|anchor\| | max factor | min cos | max cos |
| --- | --- | --- | --- | --- | --- | --- | --- |
| wide_anchor_scan | 0,0 | [0.75,0.816666666666666666666667] | [31.5,32.5] | 0.103001770312904735615 | 1.51175191620044377996398 | 0.533052610472406079420584 | 0.999820164519810234767932 |
| wide_anchor_scan | 0,1 | [0.75,0.816666666666666666666667] | [32.5,33.5] | 0.119191079747272913565398 | 1.53012656166007819292406 | -0.522543736718003090786107 | 0.636128235897494979934265 |
| wide_anchor_scan | 0,2 | [0.75,0.816666666666666666666667] | [33.5,34.5] | 0.264837739882919543642329 | 2.81650058708308584101201 | 0.281918652444710905195507 | 0.992961313495466497220149 |
| wide_anchor_scan | 1,0 | [0.816666666666666666666667,0.883333333333333333333333] | [31.5,32.5] | 0.0861465393776488494294661 | 1.38661898129247931664553 | 0.684476448569921399141498 | 0.999936760812214498882346 |
| wide_anchor_scan | 1,1 | [0.816666666666666666666667,0.883333333333333333333333] | [32.5,33.5] | 0.0992443596940379665340023 | 1.40328878587855351962727 | -0.0753704249770426162833729 | 0.855857709979388830042117 |
| wide_anchor_scan | 1,2 | [0.816666666666666666666667,0.883333333333333333333333] | [33.5,34.5] | 0.220455540489945944482905 | 2.60381265316828803976019 | 0.384011664453788436293208 | 0.993440465483428413588354 |
| wide_anchor_scan | 2,0 | [0.883333333333333333333333,0.95] | [31.5,32.5] | 0.072707239105112558555688 | 1.28404991788556661875584 | 0.808433019032883247343183 | 0.999992635259560788022243 |
| wide_anchor_scan | 2,1 | [0.883333333333333333333333,0.95] | [32.5,33.5] | 0.0838733988366588524455487 | 1.30681379430437958745888 | 0.314224720667188160209311 | 0.983118061563565956349554 |
| wide_anchor_scan | 2,2 | [0.883333333333333333333333,0.95] | [33.5,34.5] | 0.184360482009279490490228 | 2.41878284371740185216148 | 0.480998782629698381258128 | 0.993991704027406766302321 |

## Reading

The positive pocket is small because both the factor and the anchor remain
small.  The failure boxes are not primarily a `cutVec` problem: the sampled
box upper for `anchor` is already comparable to or larger than the available
quartet margin scale.

In the early failure box the anchor is also strongly aligned against `-K4`,
so a pure triangle upper is especially expensive.  In the late failure box the
sector margin improves the quartet side, but the anchor upper is too large for
the current q-ratio resolvent ledger.

The most plausible next formal work is:

```text
1. Prove the anchor factorization in the new audit file as a local lemma.
2. Create abstract AnchorUpperData over regions/boxes.
3. Try interval bounds for |1 - 2 * continuedOddDirichletChannel|.
4. If interval boxes stay too large, look for a structural cancellation
   criterion for anchor + cutVec or for the seed-resolvent factor.
```
