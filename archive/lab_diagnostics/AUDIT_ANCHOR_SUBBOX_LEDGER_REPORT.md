# Anchor Subbox Ledger Audit

Diagnostic only.  The numerical channel mode is `zeta_diagnostic` and none of
these sampled values is a Lean certificate or active-route proof input.

Generated artifacts:

```text
audit_anchor_subbox_ledger_points.csv
audit_anchor_subbox_ledger_boxes.csv
audit_anchor_subbox_ledger_summary.json
```

## Overview

| box | subboxes | max anchor sup | max cut sup | current/Qsector | current total | direct/Qsector | direct total |
| --- | --- | --- | --- | --- | --- | --- | --- |
| positive_pocket | 16 | 0.0216104827485191226003528 | 0.00995124696010002302354841 | 5149 | 7200 | 7200 | 7200 |
| early_anchor_fail | 16 | 0.0769677354891982448073462 | 0.0138546141738728947153407 | 0 | 7200 | 0 | 7200 |
| late_anchor_fail | 16 | 0.16582108822364659108145 | 0.0228211747843172888117477 | 0 | 7200 | 0 | 7200 |

## Positive Pocket Candidates

Rows shown for `N=50`.  `direct_closes_resolvent_tax` means the audit-only
direct-balanced ledger closes the sampled subbox while the current q-ratio
ledger may still fail.

| subbox | N | K | M | anchor sup | cut sup | current/Qsector | direct/Qsector | best current slack | read |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 0,0 | 50 | 3 | 25 | 0.0131424114703042869734945 | 0.00995124696010002302354841 | 0 | 25 | -0.00543935579498024104967825 | direct_closes_resolvent_tax |
| 0,0 | 50 | 3 | 50 | 0.0131424114703042869734945 | 0.00383142049271144380243929 | 25 | 25 | 0.0114540219916885862380238 | current_closes_subbox |
| 0,0 | 50 | 3 | 100 | 0.0131424114703042869734945 | 0.00978632287652271386149522 | 0 | 25 | -0.00498409372752810485174374 | direct_closes_resolvent_tax |
| 0,0 | 50 | 4 | 25 | 0.0131424114703042869734945 | 0.00331443766257577540317163 | 25 | 25 | 0.0128811190352473777015278 | current_closes_subbox |
| 0,0 | 50 | 4 | 50 | 0.0131424114703042869734945 | 0.00470084984265448428648381 | 25 | 25 | 0.00905401954951589260618848 | current_closes_subbox |
| 0,0 | 50 | 4 | 100 | 0.0131424114703042869734945 | 0.00296949481931955886166151 | 25 | 25 | 0.0138333110290869562236335 | current_closes_subbox |
| 0,0 | 50 | 5 | 25 | 0.0131424114703042869734945 | 0.00447818015373359063727236 | 25 | 25 | 0.0096686845562159652014667 | current_closes_subbox |
| 0,0 | 50 | 5 | 50 | 0.0131424114703042869734945 | 0.00416489739433929312235704 | 25 | 25 | 0.0105334809743334037254347 | current_closes_subbox |
| 0,0 | 50 | 5 | 100 | 0.0131424114703042869734945 | 0.00435943012253024755732557 | 25 | 25 | 0.00999648619405436850269624 | current_closes_subbox |
| 0,1 | 50 | 3 | 25 | 0.00741369746517814024376368 | 0.00973467916174136312242347 | 25 | 25 | 0.00562113510592690715538669 | current_closes_subbox |
| 0,1 | 50 | 3 | 50 | 0.00741369746517814024376368 | 0.00266791109265765197487775 | 25 | 25 | 0.025128482799192664035924 | current_closes_subbox |
| 0,1 | 50 | 3 | 100 | 0.00741369746517814024376368 | 0.00945872990947519933263791 | 25 | 25 | 0.00638287483716316014639587 | current_closes_subbox |
| 0,1 | 50 | 4 | 25 | 0.00741369746517814024376368 | 0.0031559596224220715420029 | 25 | 25 | 0.0237812569856056982299566 | current_closes_subbox |
| 0,1 | 50 | 4 | 50 | 0.00741369746517814024376368 | 0.00490520927722957387831796 | 25 | 25 | 0.0189525685547598949698378 | current_closes_subbox |
| 0,1 | 50 | 4 | 100 | 0.00741369746517814024376368 | 0.00275915623108322163283923 | 25 | 25 | 0.0248766066058342279367228 | current_closes_subbox |
| 0,1 | 50 | 5 | 25 | 0.00741369746517814024376368 | 0.00455085310296820026222946 | 25 | 25 | 0.0199307454286852872525355 | current_closes_subbox |
| 0,1 | 50 | 5 | 50 | 0.00741369746517814024376368 | 0.00410762905357978491004555 | 25 | 25 | 0.0211542362172485636885678 | current_closes_subbox |
| 0,1 | 50 | 5 | 100 | 0.00741369746517814024376368 | 0.00444607404540122427415761 | 25 | 25 | 0.0202199811142136977560044 | current_closes_subbox |
| 0,2 | 50 | 3 | 25 | 0.013527886767207004927228 | 0.00952851473990652671559938 | 0 | 25 | -0.00418501724945975414023835 | direct_closes_resolvent_tax |
| 0,2 | 50 | 3 | 50 | 0.013527886767207004927228 | 0.00181610939062156385764677 | 25 | 25 | 0.0171045696209654295344914 | current_closes_subbox |
| 0,2 | 50 | 3 | 100 | 0.013527886767207004927228 | 0.00903717685055835221743299 | 0 | 25 | -0.00282871137544612665632301 | direct_closes_resolvent_tax |
| 0,2 | 50 | 4 | 25 | 0.013527886767207004927228 | 0.00301801920680896731474169 | 25 | 25 | 0.0137867767556681152977328 | current_closes_subbox |
| 0,2 | 50 | 4 | 50 | 0.013527886767207004927228 | 0.00510395203198833782175183 | 25 | 25 | 0.00802869661382950232946373 | current_closes_subbox |
| 0,2 | 50 | 4 | 100 | 0.013527886767207004927228 | 0.00267490525548481419363243 | 25 | 25 | 0.0147339202138173473791529 | current_closes_subbox |

## Bad-Box Confirmation

Representative rows for `N=50, K=4, M=50`.

| box | subbox | N | K | M | anchor sup | Qsector min | current/Qsector | direct/Qsector | read |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| early_anchor_fail | 0,0 | 50 | 4 | 50 | 0.0769677354891982448073462 | 0.0585163608155606677012056 | 0 | 0 | anchor_exceeds_margin |
| early_anchor_fail | 0,1 | 50 | 4 | 50 | 0.0741190009737639565717556 | 0.058655823974107802678543 | 0 | 0 | anchor_exceeds_margin |
| early_anchor_fail | 0,2 | 50 | 4 | 50 | 0.0707675146478699752434493 | 0.0588210805120192581076011 | 0 | 0 | anchor_exceeds_margin |
| early_anchor_fail | 0,3 | 50 | 4 | 50 | 0.066922469405173484443572 | 0.059010706103520435296534 | 0 | 0 | anchor_exceeds_margin |
| early_anchor_fail | 1,0 | 50 | 4 | 50 | 0.0735596713297015225031145 | 0.0571365060082217778552136 | 0 | 0 | anchor_exceeds_margin |
| early_anchor_fail | 1,1 | 50 | 4 | 50 | 0.0708481182761983735417446 | 0.057269386475519715623199 | 0 | 0 | anchor_exceeds_margin |
| early_anchor_fail | 1,2 | 50 | 4 | 50 | 0.0676583870538733878942436 | 0.0574269329434114719956674 | 0 | 0 | anchor_exceeds_margin |
| early_anchor_fail | 1,3 | 50 | 4 | 50 | 0.0639997588800028546488475 | 0.057607833777697769706269 | 0 | 0 | anchor_exceeds_margin |
| early_anchor_fail | 2,0 | 50 | 4 | 50 | 0.0703581812069484801806886 | 0.0557843592958924645531471 | 0 | 0 | anchor_exceeds_margin |
| early_anchor_fail | 2,1 | 50 | 4 | 50 | 0.0677804499183318604546006 | 0.0559110215768482303297869 | 0 | 0 | anchor_exceeds_margin |
| early_anchor_fail | 2,2 | 50 | 4 | 50 | 0.0647487724828271988524366 | 0.0560612795288451864791192 | 0 | 0 | anchor_exceeds_margin |
| early_anchor_fail | 2,3 | 50 | 4 | 50 | 0.0612726914652578049447448 | 0.056233925281970311309102 | 0 | 0 | anchor_exceeds_margin |
| early_anchor_fail | 3,0 | 50 | 4 | 50 | 0.0673489348454230880319988 | 0.054459699925264016153712 | 0 | 0 | anchor_exceeds_margin |
| early_anchor_fail | 3,1 | 50 | 4 | 50 | 0.0649014877465803215400166 | 0.0545804850430020512646434 | 0 | 0 | anchor_exceeds_margin |
| early_anchor_fail | 3,2 | 50 | 4 | 50 | 0.0620239042016489982469494 | 0.0547238491459651846655486 | 0 | 0 | anchor_exceeds_margin |
| early_anchor_fail | 3,3 | 50 | 4 | 50 | 0.058726124341710617375474 | 0.0548886799063936522612436 | 0 | 0 | anchor_exceeds_margin |
| late_anchor_fail | 0,0 | 50 | 4 | 50 | 0.114490977858697272561889 | 0.0666485146558016259869536 | 0 | 0 | anchor_exceeds_margin |
| late_anchor_fail | 0,1 | 50 | 4 | 50 | 0.132568914283754596265852 | 0.0677785053746075152137282 | 0 | 0 | anchor_exceeds_margin |
| late_anchor_fail | 0,2 | 50 | 4 | 50 | 0.14977889237953185654007 | 0.0690350953695237401123451 | 0 | 0 | anchor_exceeds_margin |
| late_anchor_fail | 0,3 | 50 | 4 | 50 | 0.16582108822364659108145 | 0.0704351646147411649510523 | 0 | 0 | anchor_exceeds_margin |
| late_anchor_fail | 1,0 | 50 | 4 | 50 | 0.109324524056262544608058 | 0.0649868911963684998032202 | 0 | 0 | anchor_exceeds_margin |
| late_anchor_fail | 1,1 | 50 | 4 | 50 | 0.126530199904795629636967 | 0.0660824328064326284948208 | 0 | 0 | anchor_exceeds_margin |
| late_anchor_fail | 1,2 | 50 | 4 | 50 | 0.142908567637269021468124 | 0.0672984313855220444592421 | 0 | 0 | anchor_exceeds_margin |
| late_anchor_fail | 1,3 | 50 | 4 | 50 | 0.158172992628473493636738 | 0.0686503087503903673198727 | 0 | 0 | anchor_exceeds_margin |
| late_anchor_fail | 2,0 | 50 | 4 | 50 | 0.104473021369650838056376 | 0.0633623579310960200284096 | 0 | 0 | anchor_exceeds_margin |
| late_anchor_fail | 2,1 | 50 | 4 | 50 | 0.12084155032181943933016 | 0.0644241186716407558149924 | 0 | 0 | anchor_exceeds_margin |
| late_anchor_fail | 2,2 | 50 | 4 | 50 | 0.136423653700248209662538 | 0.0656004985571838392221525 | 0 | 0 | anchor_exceeds_margin |
| late_anchor_fail | 2,3 | 50 | 4 | 50 | 0.150944686897188088994529 | 0.066905575081196516577175 | 0 | 0 | anchor_exceeds_margin |
| late_anchor_fail | 3,0 | 50 | 4 | 50 | 0.0999143035246355187304408 | 0.0617743883883844327510949 | 0 | 0 | anchor_exceeds_margin |
| late_anchor_fail | 3,1 | 50 | 4 | 50 | 0.115479834832567491758063 | 0.062803057143793340315581 | 0 | 0 | anchor_exceeds_margin |
| late_anchor_fail | 3,2 | 50 | 4 | 50 | 0.130299793626422434954506 | 0.0639407961327427480997162 | 0 | 0 | anchor_exceeds_margin |
| late_anchor_fail | 3,3 | 50 | 4 | 50 | 0.144110461141173772190473 | 0.065200443756864116841224 | 0 | 0 | anchor_exceeds_margin |

## Reading

Subdividing the positive pocket helps localize `anchor`, but the current
q-ratio ledger still often pays the resolvent tax.  The direct-balanced audit
ledger is the signal that the local geometry is promising; turning that into a
route theorem would require a genuine proof that the direct-balanced ledger
controls the actual residual, not just this diagnostic replacement.

The early and late boxes remain negative under subboxing with triangle-style
`anchorUpper`.  Those boxes need a structural cancellation or a different
anchor treatment.
