# V-split upper and sector-margin laboratory

This report is diagnostic only.  The continued channel mode is
`zeta_diagnostic`; none of the sampled numbers is a Lean certificate or proof
input for the genuine-first middle route.

Generated artifacts:

```text
audit_vsplit_upper_sector_points.csv
audit_vsplit_upper_sector_boxes.csv
audit_vsplit_upper_sector_summary.json
```

Extra cutoff-depth probe:

```text
audit_vsplit_upper_sector_k2probe_points.csv
audit_vsplit_upper_sector_k2probe_boxes.csv
audit_vsplit_upper_sector_k2probe_summary.json
AUDIT_VSPLIT_UPPER_SECTOR_K2PROBE_REPORT.md
```

## Sector Margin Candidates

`Lsector` below is a guarded sampled lower for `|verticalQuartetPrefix(q)|`.
It is a formalization target for interval/sector proof, not a certified lower.

| box | sigma | t | sample min \|P4\| | guarded Lsector | min Q_worst | min Q_sector | min Q_phase | sector gain % |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| positive_pocket | [0.84,0.92] | [32.75,33.0] | 0.820724783612 | 0.819083334045 | 0.0545023306803492491434609 | 0.0567341402567636277336837 | 0.0573840656783399378776627 | 4.09488832597585573164091 |
| early_vexact_fail | [0.84,0.92] | [32.0,32.25] | 0.780606481575 | 0.779045268612 | 0.0545023306803492491434609 | 0.0539382642853689500976606 | 0.0547401595030892656752835 | -1.03493995199671803628379 |
| late_anchor_fail | [0.84,0.92] | [33.5,34.0] | 0.887982334943 | 0.886206370273 | 0.0545023306803492491434609 | 0.0614213718221403332047747 | 0.0620133535977362000223887 | 12.6949454370503391344366 |

## Anchor Variation

| box | max \|anchor\| | median \|anchor\| | max \|vSplit\| | min cos(anchor,-K4) | max cos(anchor,-K4) |
| --- | --- | --- | --- | --- | --- |
| early_vexact_fail | 0.0769677354891982448073462 | 0.064518589799419987518697 | 0.089951397709574740171721 | 0.856414404240196427111455 | 0.971926115140255153317062 |
| late_anchor_fail | 0.16582108822364659108145 | 0.12084155032181943933016 | 0.172180972211986413538744 | 0.40393692318322101913958 | 0.83161031308287809248569 |
| positive_pocket | 0.0216104827485191226003528 | 0.0131424114703042869734945 | 0.0265529863534640122923007 | 0.0210749389976558777666153 | 0.999944978756423290474992 |

## CutVec Dependence

Rows are sorted by largest sampled `|cutVec|` inside each box.

| box | K | M | median \|cutVec\| | max \|cutVec\| | max \|vSplit\| | current/Qsector pass | direct/Qsector pass | dominant issue |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| early_vexact_fail | 3 | 50 | 0.0111623381808134620887782 | 0.0138546141738728947153407 | 0.089951397709574740171721 | 0 | 0 | anchor_large |
| early_vexact_fail | 3 | 25 | 0.0101462090682912518043076 | 0.0115371383171939135416888 | 0.0884335341999699404970416 | 0 | 0 | anchor_large |
| early_vexact_fail | 3 | 100 | 0.0079382852291443819838649 | 0.00943456101614804918636349 | 0.0851868307289968236328641 | 0 | 0 | anchor_large |
| early_vexact_fail | 4 | 100 | 0.00519130698470727474066224 | 0.0068359028951436055105177 | 0.072270614817228039952921 | 0 | 0 | anchor_large |
| early_vexact_fail | 4 | 25 | 0.00430988052598462817133993 | 0.0054706225968573800596761 | 0.0758799233234258778967907 | 0 | 0 | anchor_large |
| early_vexact_fail | 5 | 50 | 0.00374831959844802547707015 | 0.00463562047839727460266017 | 0.0803180968775668492787176 | 0 | 0 | anchor_large |
| early_vexact_fail | 5 | 25 | 0.00337284559822070951711534 | 0.00405513500577765447730545 | 0.0790368221524093999233229 | 0 | 0 | anchor_large |
| early_vexact_fail | 5 | 100 | 0.00266921007070378481320145 | 0.00354185599643545296152102 | 0.0755227410101274369140521 | 0 | 0 | anchor_large |
| early_vexact_fail | 4 | 50 | 0.00173433092304406512524948 | 0.00261789886695660968604919 | 0.0769216625375268778992183 | 0 | 0 | anchor_large |
| late_anchor_fail | 3 | 50 | 0.0160156745905053450657549 | 0.0228211747843172888117477 | 0.143471295540680064226945 | 0 | 0 | anchor_large |
| late_anchor_fail | 3 | 100 | 0.010457914053823033170244 | 0.018371593248349554733546 | 0.147507857072772420014231 | 0 | 0 | anchor_large |
| late_anchor_fail | 3 | 25 | 0.00982905304719206829882494 | 0.0129175918883946600014575 | 0.153655543432872919358296 | 0 | 0 | anchor_large |
| late_anchor_fail | 4 | 100 | 0.00657110408561468450754845 | 0.00973502096180765622379257 | 0.164523003766353800479183 | 0 | 0 | anchor_large |
| late_anchor_fail | 4 | 50 | 0.00586518471068063811315132 | 0.00705868095957012483628952 | 0.16038578534675281606147 | 0 | 0 | anchor_large |
| late_anchor_fail | 5 | 25 | 0.00492339257606823662449654 | 0.00636261093969797995020155 | 0.172180972211986413538744 | 0 | 0 | anchor_large |
| late_anchor_fail | 4 | 25 | 0.0038217201315644278785027 | 0.00586157525743216427779251 | 0.169838850498995638780848 | 0 | 0 | anchor_large |
| late_anchor_fail | 5 | 100 | 0.00403140808488628737690261 | 0.00506440878547429288802355 | 0.166636974222282961752182 | 0 | 0 | anchor_large |
| late_anchor_fail | 5 | 50 | 0.00258008776560578076981071 | 0.00340997773418268836413201 | 0.162784568232164177099361 | 0 | 0 | anchor_large |

## Ledger Pass Counts

Each row has the same number of sampled points inside its box.  `Qsector` uses
the guarded sampled sector lower.

| box | K | M | current/Qworst | current/Qsector | current/Qphase | direct/Qsector | phase/Qsector | best current slack Qsector | dominant issue |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| early_vexact_fail | 3 | 25 | 0 | 0 | 0 | 0 | 0 | -0.072592538335305328313937 | anchor_large |
| early_vexact_fail | 3 | 50 | 0 | 0 | 0 | 0 | 0 | -0.0690133087930421543295975 | anchor_large |
| early_vexact_fail | 3 | 100 | 0 | 0 | 0 | 0 | 0 | -0.0688090743333111565617572 | anchor_large |
| early_vexact_fail | 4 | 25 | 0 | 0 | 0 | 0 | 0 | -0.0541649284990334368194651 | anchor_large |
| early_vexact_fail | 4 | 50 | 0 | 0 | 0 | 0 | 1 | -0.0478979491583185774638032 | anchor_large |
| early_vexact_fail | 4 | 100 | 0 | 0 | 0 | 0 | 0 | -0.0523320434882848934564173 | anchor_large |
| early_vexact_fail | 5 | 25 | 0 | 0 | 0 | 0 | 0 | -0.0559476742041302907593242 | anchor_large |
| early_vexact_fail | 5 | 50 | 0 | 0 | 0 | 0 | 0 | -0.0518116048797606989331766 | anchor_large |
| early_vexact_fail | 5 | 100 | 0 | 0 | 0 | 0 | 0 | -0.0529270442195357396931535 | anchor_large |
| late_anchor_fail | 3 | 25 | 0 | 0 | 0 | 0 | 0 | -0.0826338088594336977291899 | anchor_large |
| late_anchor_fail | 3 | 50 | 0 | 0 | 0 | 0 | 0 | -0.0833659142754428850969543 | anchor_large |
| late_anchor_fail | 3 | 100 | 0 | 0 | 0 | 0 | 0 | -0.0842096887840138610561758 | anchor_large |
| late_anchor_fail | 4 | 25 | 0 | 0 | 0 | 0 | 0 | -0.093848870945012588260001 | anchor_large |
| late_anchor_fail | 4 | 50 | 0 | 0 | 0 | 0 | 0 | -0.0945142860371886304683296 | anchor_large |
| late_anchor_fail | 4 | 100 | 0 | 0 | 0 | 0 | 0 | -0.0989387066833047333009172 | anchor_large |
| late_anchor_fail | 5 | 25 | 0 | 0 | 0 | 0 | 0 | -0.0940340623546775526794449 | anchor_large |
| late_anchor_fail | 5 | 50 | 0 | 0 | 0 | 0 | 0 | -0.0902869075207911516740427 | anchor_large |
| late_anchor_fail | 5 | 100 | 0 | 0 | 0 | 0 | 0 | -0.0965782269999481264474242 | anchor_large |
| positive_pocket | 3 | 25 | 21 | 23 | 23 | 25 | 25 | 0.0286753014651928865717888 | current_passes |
| positive_pocket | 3 | 50 | 25 | 25 | 25 | 25 | 25 | 0.0361478530904564753347505 | current_passes |
| positive_pocket | 3 | 100 | 22 | 24 | 24 | 25 | 25 | 0.0289368583198261715873856 | current_passes |
| positive_pocket | 4 | 25 | 25 | 25 | 25 | 25 | 25 | 0.036599197621704802861083 | current_passes |
| positive_pocket | 4 | 50 | 20 | 20 | 20 | 25 | 25 | 0.0311637419975499785425706 | current_passes |
| positive_pocket | 4 | 100 | 25 | 25 | 25 | 25 | 25 | 0.0369334175355742596718123 | current_passes |
| positive_pocket | 5 | 25 | 25 | 25 | 25 | 25 | 25 | 0.0382964134638001520548592 | current_passes |
| positive_pocket | 5 | 50 | 20 | 22 | 23 | 25 | 25 | 0.034993177636192583752546 | current_passes |
| positive_pocket | 5 | 100 | 25 | 25 | 25 | 25 | 25 | 0.0376956598546715040786155 | current_passes |

## Recommendation

The most formalizable pieces from this run are:

```text
cutUpper for K >= 3
sector lower on the positive pocket
sector lower on the late box, if anchor is treated separately
```

The `cutVec` envelope is small for the main `K=3..5` run.  In the positive
pocket the largest sampled `|cutVec|` is about `0.00996`; in the early V-exact
failure box it is about `0.01386`; in the late anchor box it is about
`0.02283`.  The separate `K=2` probe makes `cutVec` much worse, reaching about
`0.06557` in the late box, but even there `anchor` is still larger.

The sector lower is useful where the phase box is favorable.  In the positive
pocket it raises the minimum margin by about `4.09%`, and in the late box by
about `12.69%`.  In the early V-exact failure box it is not useful with the
current guard; the guarded sector lower is slightly worse than the global
worst-case lower.

The next real bottleneck is `anchor`.  The positive pocket has
`max |anchor| ~= 0.02162`, while the early and late failure boxes have
`max |anchor| ~= 0.07697` and `0.16583`.  In both failure boxes, current,
direct-balanced, and sector-margin variants still fail on this grid.  So a
plain sector margin is not enough there; the next bound needs a structural
anchor estimate or a safe cancellation certificate involving `anchor + cutVec`.

For Lean, the clean next audit target is not to promote these numbers, but to
add conditional APIs for:

```text
anchorUpper boxes or formulas
cutUpper via the existing depth/core cutoff split
sector lower via an interval bound for |(1+q)(1+q^2)|
```

## Reading

The useful next Lean targets are still conditional:

```text
|anchor s| <= anchorUpper s
|cutVec K M s| <= cutUpper s
Lsector s <= |verticalQuartetPrefix (q s)|
```

The sector numbers here only identify small boxes where an interval proof of
the prefix lower looks worth attempting.  A formal sector certificate should
bound the product expression for `|P4(q)|` over the whole `(sigma,t)` box, not
reuse pointwise phase samples.
