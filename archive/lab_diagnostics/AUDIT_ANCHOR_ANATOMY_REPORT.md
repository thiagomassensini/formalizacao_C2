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

Wide-scan artifacts:

```text
audit_anchor_anatomy_wide_points.csv
audit_anchor_anatomy_wide_boxes.csv
audit_anchor_anatomy_wide_subboxes.csv
audit_anchor_anatomy_wide_summary.json
AUDIT_ANCHOR_ANATOMY_WIDE_REPORT.md
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
| positive_pocket | 0.0651805167804920920799541 | 0.366163807582985469346542 | 0.0216104827485191226003528 | 2.85063944154615915040645 | 0.674204761223581861850553 | strong_box_variation |
| early_anchor_fail | 0.0616751423671609994815056 | 1.25819258118558253467696 | 0.0769677354891982448073462 | 0.456657881077839124955746 | 0.928686930634670929103141 | factor_larger+anchor_much_larger+anchor_phase_aligned+sector_unhelpful |
| late_anchor_fail | 0.0752430041648593648779394 | 2.20380738467496998565636 | 0.16582108822364659108145 | 1.06272678286260298445888 | 0.652437148067485253433491 | factor_larger+anchor_much_larger+strong_box_variation |

## Ledger With Box Anchor Uppers

`anchor direct` is sampled `sup |anchor|` on the box.  `anchor factored` is
`sup |tau| * sup |1 - 2 odd|` on the same box.

| box | K | M | anchor direct | anchor factored | cut upper | q-ledger/Qsector | direct/Qsector | worst q-ledger slack | read |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| positive_pocket | 3 | 25 | 0.0216104827485191226003528 | 0.0238667462045716619369158 | 0.00995124696010002302354841 | 0 | 25 | -0.0211768663113290725601671 | resolvent_factor_is_main_tax |
| positive_pocket | 3 | 50 | 0.0216104827485191226003528 | 0.0238667462045716619369158 | 0.00383142049271144380243929 | 0 | 25 | -0.00419334624392695784303442 | resolvent_factor_is_main_tax |
| positive_pocket | 3 | 100 | 0.0216104827485191226003528 | 0.0238667462045716619369158 | 0.00978632287652271386149522 | 0 | 25 | -0.0207191749865898666237361 | resolvent_factor_is_main_tax |
| positive_pocket | 4 | 25 | 0.0216104827485191226003528 | 0.0238667462045716619369158 | 0.00331443766257577540317163 | 0 | 25 | -0.00275863427670052443750338 | resolvent_factor_is_main_tax |
| positive_pocket | 4 | 50 | 0.0216104827485191226003528 | 0.0238667462045716619369158 | 0.0052969528067896593868619 | 0 | 25 | -0.00826043827639017926191786 | resolvent_factor_is_main_tax |
| positive_pocket | 4 | 100 | 0.0216104827485191226003528 | 0.0238667462045716619369158 | 0.00296949481931955886166151 | 2 | 25 | -0.00180136143052314940310098 | resolvent_factor_is_main_tax |
| positive_pocket | 5 | 25 | 0.0216104827485191226003528 | 0.0238667462045716619369158 | 0.00470949451748064147397958 | 0 | 25 | -0.00663014537537287252957076 | resolvent_factor_is_main_tax |
| positive_pocket | 5 | 50 | 0.0216104827485191226003528 | 0.0238667462045716619369158 | 0.00416489739433929312235704 | 0 | 25 | -0.00511879922547667930217069 | resolvent_factor_is_main_tax |
| positive_pocket | 5 | 100 | 0.0216104827485191226003528 | 0.0238667462045716619369158 | 0.00460706125381962424434038 | 0 | 25 | -0.00634587630365543148115962 | resolvent_factor_is_main_tax |
| early_anchor_fail | 3 | 25 | 0.0769677354891982448073462 | 0.0775992065699265768272356 | 0.0115371383171939135416888 | 0 | 0 | -0.127339494090111332969387 | anchor_exceeds_margin_scale |
| early_anchor_fail | 3 | 50 | 0.0769677354891982448073462 | 0.0775992065699265768272356 | 0.0138546141738728947153407 | 0 | 0 | -0.133770868889276579508768 | anchor_exceeds_margin_scale |
| early_anchor_fail | 3 | 100 | 0.0769677354891982448073462 | 0.0775992065699265768272356 | 0.00943456101614804918636349 | 0 | 0 | -0.121504497954867281711997 | anchor_exceeds_margin_scale |
| early_anchor_fail | 4 | 25 | 0.0769677354891982448073462 | 0.0775992065699265768272356 | 0.0054706225968573800596761 | 0 | 0 | -0.110503920071047573559264 | anchor_exceeds_margin_scale |
| early_anchor_fail | 4 | 50 | 0.0769677354891982448073462 | 0.0775992065699265768272356 | 0.00261789886695660968604919 | 0 | 0 | -0.102587144820686924829046 | anchor_exceeds_margin_scale |
| early_anchor_fail | 4 | 100 | 0.0769677354891982448073462 | 0.0775992065699265768272356 | 0.0068359028951436055105177 | 0 | 0 | -0.11429279635163060865352 | anchor_exceeds_margin_scale |
| early_anchor_fail | 5 | 25 | 0.0769677354891982448073462 | 0.0775992065699265768272356 | 0.00405513500577765447730545 | 0 | 0 | -0.106575710335630123635353 | anchor_exceeds_margin_scale |
| early_anchor_fail | 5 | 50 | 0.0769677354891982448073462 | 0.0775992065699265768272356 | 0.00463562047839727460266017 | 0 | 0 | -0.108186652529106659764349 | anchor_exceeds_margin_scale |
| early_anchor_fail | 5 | 100 | 0.0769677354891982448073462 | 0.0775992065699265768272356 | 0.00354185599643545296152102 | 0 | 0 | -0.1051512770773028901238 | anchor_exceeds_margin_scale |
| late_anchor_fail | 3 | 25 | 0.16582108822364659108145 | 0.16582108822364659108145 | 0.0129175918883946600014575 | 0 | 0 | -0.279818089106725600289986 | anchor_exceeds_margin_scale |
| late_anchor_fail | 3 | 50 | 0.16582108822364659108145 | 0.16582108822364659108145 | 0.0228211747843172888117477 | 0 | 0 | -0.307302152543552881711421 | anchor_exceeds_margin_scale |
| late_anchor_fail | 3 | 100 | 0.16582108822364659108145 | 0.16582108822364659108145 | 0.018371593248349554733546 | 0 | 0 | -0.294953835526665867291781 | anchor_exceeds_margin_scale |
| late_anchor_fail | 4 | 25 | 0.16582108822364659108145 | 0.16582108822364659108145 | 0.00586157525743216427779251 | 0 | 0 | -0.26023648811093618740762 | anchor_exceeds_margin_scale |
| late_anchor_fail | 4 | 50 | 0.16582108822364659108145 | 0.16582108822364659108145 | 0.00705868095957012483628952 | 0 | 0 | -0.263558652362390382729863 | anchor_exceeds_margin_scale |
| late_anchor_fail | 4 | 100 | 0.16582108822364659108145 | 0.16582108822364659108145 | 0.00973502096180765622379257 | 0 | 0 | -0.270985933900095142561295 | anchor_exceeds_margin_scale |
| late_anchor_fail | 5 | 25 | 0.16582108822364659108145 | 0.16582108822364659108145 | 0.00636261093969797995020155 | 0 | 0 | -0.261626944132784312795678 | anchor_exceeds_margin_scale |
| late_anchor_fail | 5 | 50 | 0.16582108822364659108145 | 0.16582108822364659108145 | 0.00340997773418268836413201 | 0 | 0 | -0.253432903735598855615569 | anchor_exceeds_margin_scale |
| late_anchor_fail | 5 | 100 | 0.16582108822364659108145 | 0.16582108822364659108145 | 0.00506440878547429288802355 | 0 | 0 | -0.258024220680527525014067 | anchor_exceeds_margin_scale |

## Subbox Probe

The subbox probe checks whether interval boxes could localize the large anchor.
It does not produce a certificate.

| box | subbox | sigma | t | max \|anchor\| | max factor | min cos | max cos |
| --- | --- | --- | --- | --- | --- | --- | --- |
| positive_pocket | 0,0 | [0.84,0.88] | [32.75,32.875] | 0.0137843443692762364945277 | 0.227656925729093375357677 | 0.460519597265573203210244 | 0.997228276569972437275174 |
| positive_pocket | 0,1 | [0.84,0.88] | [32.875,33.0] | 0.0216104827485191226003528 | 0.341941871747599889191555 | 0.0210749389976558777666153 | 0.763557260115937743678974 |
| positive_pocket | 1,0 | [0.88,0.92] | [32.75,32.875] | 0.0154704186940623695097475 | 0.268682016520625567536655 | 0.763557260115937743678974 | 0.999944978756423290474992 |
| positive_pocket | 1,1 | [0.88,0.92] | [32.875,33.0] | 0.0215680084364986353220947 | 0.366163807582985469346542 | 0.256117524575110804682502 | 0.849330708027755984957625 |
| early_anchor_fail | 0,0 | [0.84,0.88] | [32.0,32.125] | 0.0769677354891982448073462 | 1.25819258118558253467696 | 0.915436807874973901108203 | 0.966398775689442545266728 |
| early_anchor_fail | 0,1 | [0.84,0.88] | [32.125,32.25] | 0.0707675146478699752434493 | 1.15285978197336937144177 | 0.856414404240196427111455 | 0.928686930634670929103141 |
| early_anchor_fail | 1,0 | [0.88,0.92] | [32.0,32.125] | 0.0703581812069484801806886 | 1.20852489947776050658429 | 0.928686930634670929103141 | 0.971926115140255153317062 |
| early_anchor_fail | 1,1 | [0.88,0.92] | [32.125,32.25] | 0.0647487724828271988524366 | 1.10840957318671871455331 | 0.880536868024910670352203 | 0.940640918451975555627516 |
| late_anchor_fail | 0,0 | [0.84,0.88] | [33.5,33.75] | 0.132568914283754596265852 | 1.83913598516558968570922 | 0.40393692318322101913958 | 0.652437148067485253433491 |
| late_anchor_fail | 0,1 | [0.84,0.88] | [33.75,34.0] | 0.16582108822364659108145 | 2.20380738467496998565636 | 0.62431766472754997164404 | 0.818967448020757692141396 |
| late_anchor_fail | 1,0 | [0.88,0.92] | [33.5,33.75] | 0.12084155032181943933016 | 1.76690439622719157401587 | 0.455839633672403136666965 | 0.679489149382294689597452 |
| late_anchor_fail | 1,1 | [0.88,0.92] | [33.75,34.0] | 0.150944686897188088994529 | 2.11640183180625040367521 | 0.652437148067485253433491 | 0.83161031308287809248569 |

## Wide Scan

Moderate wide scan:

```text
sigma=[0.75,0.95]
t=[31.5,34.5]
N=50, K=3..5, M=50
```

The wide scan is dominated by the same anchor factor:

```text
max |tau| = 0.0940307774468455729163121
max |1 - 2 odd| = 2.81650058708308584101201
max |anchor| = 0.264837739882919543642329
median cos(anchor,-K4) = 0.833157877505470149495352
Qsector min = 0.0507235248609617944158344
Qworst min = 0.0525690561313926370341102
```

So the broad box is not a plausible single interval certificate.  It must be
split, and even then the late high-`t` subboxes still carry large anchor:

```text
sigma=[0.75,0.8167], t=[33.5,34.5]: max |anchor| ~= 0.26484
sigma=[0.8167,0.8833], t=[33.5,34.5]: max |anchor| ~= 0.22046
sigma=[0.8833,0.95], t=[33.5,34.5]: max |anchor| ~= 0.18437
```

## Direct Answers

1. With `anchorUpper = sampled sup |anchor|` per full focused box, the current
   q-ratio ledger does not close the positive pocket: it passes only `2/225`
   sampled `(N,K,M,s)` rows.  The direct-balanced diagnostic passes `225/225`,
   so inside the positive pocket the resolvent seed factor is the main tax.

2. The sector margin is not enough for the bad boxes.  It is favorable in the
   late box (`~12.69%` margin gain), but `max |anchor| ~= 0.16582` is already
   much larger than the margin scale.  In the early box the sector lower is
   actually worse than the global worst-case lower under the current guard.

3. The failure boxes are primarily an anchor-size problem.  The factor
   `|1 - 2*continuedOddDirichletChannel|` grows from about `0.366` in the
   positive pocket to about `1.258` in the early failure box and `2.204` in the
   late failure box.  `|tau|` changes much less.

4. The positive pocket and its subboxes deserve an interval proof attempt first,
   but only if paired with either a sharper seed-resolvent treatment or a
   smaller localized anchor box.  The early and late failure boxes do not look
   close under triangle-style `anchorUpper`; they need either a structural
   anchor cancellation result or a different ledger that avoids charging the
   full anchor through the current resolvent factor.

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
