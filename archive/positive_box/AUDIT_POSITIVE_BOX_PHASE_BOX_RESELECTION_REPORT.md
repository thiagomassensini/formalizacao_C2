# Positive Box Phase Box Reselection Audit

Date: 2026-07-01

Scope:

- Diagnostic q/phase scan only.
- No odd-channel, oddRef, anchor, cutoff, or truncation quantity was evaluated.
- No Lean theorem file was edited in this pass.
- Nothing was promoted to the main route.

## Old Box

The previous positive box was:

```text
sigma in [21/25, 43/50] = [0.84, 0.86]
t     in [525/16, 263/8] = [32.8125, 32.875]
```

with:

```text
N = 50
K = 3
M = 50
```

The diagnostic phase margins were:

```text
min(cos(t log 2) + 73/100)
  ~= 0.000183812731964

min(|q|^2 * cos(2 t log 2) + 1/600)
  ~= 0.00000232789030836
```

The second margin was the bottleneck, attained at approximately:

```text
sigma = 21/25
t     = 263/8
```

The old sector diagnostics were:

```text
min |1 + q|                  ~= 0.818726779646671
min |1 + q^2|                ~= 1.00125981115795
min |verticalQuartetPrefix|  ~= 0.825360655312979
slack over 819/1000         ~= 0.00636065531298
```

## Scanner

The diagnostic scanner evaluated only:

```text
q = 2^(-1-s)
cos(t log 2)
|q|^2 * cos(2 t log 2)
|1 + q|
|1 + q^2|
|1 + q + q^2 + q^3|
```

No channel target or continuation object was evaluated.

Candidate boxes kept:

```text
sigma in [21/25, 43/50]
```

and varied only the `t` interval.

## Candidate Results

With `t_min = 525/16` unchanged, shrinking only `t_max` fixes the `q^2`
margin but leaves the `q` margin too thin:

```text
t = [32.8125, 32.86]
q margin        ~= 0.0001838127
q^2 margin      ~= 0.0016245956
prefix slack    ~= 0.0063606553
```

Raising `t_min` slightly fixes the `q` margin.  The main candidates were:

```text
t = [32.815, 32.86]
q margin        ~= 0.0013695717
q^2 margin      ~= 0.0016245956
min |1 + q|     ~= 0.8191312205
min |1 + q^2|   ~= 1.0028344943
min prefix      ~= 0.8255490760
prefix slack    ~= 0.0065490760

t = [32.8175, 32.86]
q margin        ~= 0.0025575186
q^2 margin      ~= 0.0016245956
min |1 + q|     ~= 0.8195362074
min |1 + q^2|   ~= 1.0028344943
min prefix      ~= 0.8257377251
prefix slack    ~= 0.0067377251

t = [32.82, 32.86]
q margin        ~= 0.0037476499
q^2 margin      ~= 0.0016245956
min |1 + q|     ~= 0.8199417384
min |1 + q^2|   ~= 1.0028344943
min prefix      ~= 0.8259266023
prefix slack    ~= 0.0069266023
```

The candidate `t = [32.82, 32.855]` gives a larger `q^2` margin:

```text
q margin        ~= 0.0037476499
q^2 margin      ~= 0.0021517526
prefix slack    ~= 0.0069266023
```

but it is narrower than needed for the current phase target.

## Recommended Subbox

Recommended new positive-box `t` interval:

```text
t in [1641/50, 1643/50] = [32.82, 32.86]
```

Keep:

```text
sigma in [21/25, 43/50]
N = 50
K = 3
M = 50
```

Reasons:

- simple rational endpoints;
- `q` phase margin improves from about `1.84e-4` to `3.75e-3`;
- `q^2` phase margin improves from about `2.33e-6` to `1.62e-3`;
- sector prefix remains safely above `819/1000`;
- it avoids relying on an ultra-thin right-edge margin.

The widest candidate meeting the requested margin thresholds was:

```text
t in [6563/200, 1643/50] = [32.815, 32.86]
```

That box is also viable, but its `q` phase margin is only about `1.37e-3`.
The recommended `[1641/50, 1643/50]` box gives a cleaner formal target.

## Sector Preservation

For the recommended subbox:

```text
min |1 + q|                 ~= 0.8199417384
target 4091/5000            = 0.8182

min |1 + q^2|               ~= 1.0028344943
target 1001/1000            = 1.001

min |verticalQuartetPrefix| ~= 0.8259266023
target 819/1000             = 0.819
```

So the diagnostic sector lower remains comfortably above the existing target.

## Future Step

If this subbox is accepted, the next task should be:

```text
1. update the audit-only positive-box t endpoints to:
   positiveBoxTMin = 1641 / 50
   positiveBoxTMax = 1643 / 50

2. re-run the existing q endpoint and sector files;

3. then attempt the two formal phase bounds:
   -(73 / 100) <= cos(t log 2)
   -(1 / 600) <= |q|^2 * cos(2 t log 2)
```

No phase proof was attempted in this pass.

## Discipline Check

- oddRef remained frozen.
- No zeta or zeta diagnostic input was used.
- No new operator was introduced.
- No main-route file was promoted or imported.
- No anchor, cutoff, or odd-truncation bound was attacked.
