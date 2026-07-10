#!/usr/bin/env python3
"""Point-sampled SG-to-paired diagnostic for the projected-J0 sentinel.

This program is deliberately self-contained.  It evaluates the finite
supergaussian reference used by the external rectangle producer and compares it
with the C2 continuation obtained from the paired odd-even channel.

The accelerated value is a numerical estimate.  Independently, a direct
paired truncation is accompanied by the analytic tail majorant

    |s| / Re(s) * (2*N + 1)^(-Re(s)).

The output concerns five points only.  It is neither a continuous-box
enclosure nor a kernel-checked proof.
"""

from __future__ import annotations

import math
from dataclasses import dataclass

try:
    import mpmath as mp
except ImportError as exc:  # pragma: no cover
    raise SystemExit("Install mpmath first: pip install mpmath") from exc


SIGMA_TEXT = "0.84"
T_TEXTS = ("32.855", "32.856", "32.857", "32.858", "32.859")
MARGIN_TEXT = "0.054086045801"

REFERENCE_K = 17
REFERENCE_M = 16001
REFERENCE_X = 10661.0
REFERENCE_P = 2

MP_DPS = 70
EULER_START = 500
EULER_DEPTH = 60
EULER_CHECK_START = 1000
EULER_CHECK_DEPTH = 70
DIRECT_PAIR_COUNT = 20000


@dataclass(frozen=True)
class SGTerm:
    log_address: float
    amplitude: float


@dataclass(frozen=True)
class DiagnosticRow:
    t_text: str
    continued_estimate: mp.mpc
    sg_reference: mp.mpc
    sampled_delta: mp.mpf
    acceleration_stability_delta: mp.mpf
    direct_partial_delta: mp.mpf
    paired_tail_upper: mp.mpf
    continued_tail_upper: mp.mpf
    tail_adjusted_upper: mp.mpf


def build_sg_reference_terms() -> list[SGTerm]:
    """Transcribe the producer's K=17, M=16001 SG central reference."""
    terms: list[SGTerm] = []
    sigma = float(SIGMA_TEXT)
    for k in range(2, REFERENCE_K + 1):
        depth = 1 << k
        depth_coefficient = 2.0 * math.ldexp(1.0, -k)
        for odd in range(1, REFERENCE_M + 1, 2):
            address = depth * odd
            log_address = math.log(address)
            sg_weight = math.exp(-((address / REFERENCE_X) ** REFERENCE_P))
            amplitude = (
                depth_coefficient
                * sg_weight
                * math.exp(-sigma * log_address)
            )
            if amplitude != 0.0:
                terms.append(SGTerm(log_address, amplitude))
    return terms


def sg_reference_value(terms: list[SGTerm], t: float) -> mp.mpc:
    """Evaluate the finite SG reference with compensated binary64 summation."""
    re = math.fsum(term.amplitude * math.cos(t * term.log_address) for term in terms)
    im = math.fsum(-term.amplitude * math.sin(t * term.log_address) for term in terms)
    return mp.mpc(re, im)


def paired_euler_estimate(
    s: mp.mpc,
    start: int,
    depth: int,
) -> mp.mpc:
    """Euler-accelerated estimate of sum_n ((2n+1)^-s - (2n+2)^-s)."""
    partial = mp.fsum(
        (1 if n % 2 == 1 else -1) * mp.power(n, -s)
        for n in range(1, start)
    )

    differences = [mp.power(start + j, -s) for j in range(depth + 1)]
    transformed_terms: list[mp.mpc] = []
    for order in range(depth + 1):
        transformed_terms.append(differences[0] / mp.power(2, order + 1))
        differences = [
            differences[j] - differences[j + 1]
            for j in range(len(differences) - 1)
        ]

    tail = mp.fsum(transformed_terms)
    tail_sign = 1 if start % 2 == 1 else -1
    return partial + tail_sign * tail


def paired_direct_partial(s: mp.mpc, pair_count: int) -> mp.mpc:
    """Direct first pair_count terms of the paired odd-even channel."""
    return mp.fsum(
        mp.power(2 * n + 1, -s) - mp.power(2 * n + 2, -s)
        for n in range(pair_count)
    )


def continued_central_multiplier(s: mp.mpc) -> mp.mpc:
    """Multiplier from the paired channel to the continued C2 central object."""
    q = mp.power(2, -1 - s)
    continuation_factor = (
        (1 - mp.power(2, -s))
        / (1 - mp.power(2, 1 - s))
    )
    return 2 * (q**2 / (1 - q)) * continuation_factor


def paired_tail_upper(s: mp.mpc, pair_count: int) -> mp.mpf:
    """Derivative-integral upper bound for the omitted paired channel tail."""
    sigma = mp.re(s)
    if sigma <= 0:
        raise ValueError("the paired tail bound requires Re(s) > 0")
    return abs(s) / sigma * mp.power(2 * pair_count + 1, -sigma)


def evaluate_point(terms: list[SGTerm], t_text: str) -> DiagnosticRow:
    s = mp.mpc(SIGMA_TEXT, t_text)
    multiplier = continued_central_multiplier(s)

    paired_estimate = paired_euler_estimate(s, EULER_START, EULER_DEPTH)
    paired_check = paired_euler_estimate(
        s,
        EULER_CHECK_START,
        EULER_CHECK_DEPTH,
    )
    continued_estimate = multiplier * paired_estimate
    continued_check = multiplier * paired_check

    sg_reference = sg_reference_value(terms, float(t_text))
    sampled_delta = abs(continued_estimate - sg_reference)
    acceleration_stability_delta = abs(continued_estimate - continued_check)

    direct_partial = multiplier * paired_direct_partial(s, DIRECT_PAIR_COUNT)
    direct_partial_delta = abs(direct_partial - sg_reference)
    raw_tail_upper = paired_tail_upper(s, DIRECT_PAIR_COUNT)
    scaled_tail_upper = abs(multiplier) * raw_tail_upper
    tail_adjusted_upper = direct_partial_delta + scaled_tail_upper

    return DiagnosticRow(
        t_text=t_text,
        continued_estimate=continued_estimate,
        sg_reference=sg_reference,
        sampled_delta=sampled_delta,
        acceleration_stability_delta=acceleration_stability_delta,
        direct_partial_delta=direct_partial_delta,
        paired_tail_upper=raw_tail_upper,
        continued_tail_upper=scaled_tail_upper,
        tail_adjusted_upper=tail_adjusted_upper,
    )


def sci(value: mp.mpf, digits: int = 13) -> str:
    return mp.nstr(value, digits, min_fixed=0, max_fixed=0)


def complex_text(value: mp.mpc, digits: int = 18) -> str:
    return f"({mp.nstr(mp.re(value), digits)}, {mp.nstr(mp.im(value), digits)})"


def main() -> int:
    mp.mp.dps = MP_DPS
    margin = mp.mpf(MARGIN_TEXT)
    sg_terms = build_sg_reference_terms()
    rows = [evaluate_point(sg_terms, t_text) for t_text in T_TEXTS]

    print("C2 projected-J0 SG -> paired sentinel diagnostic")
    print("================================================")
    print("scope: sigma=0.84; t in {32.855, 32.856, 32.857, 32.858, 32.859}")
    print(f"margin: {MARGIN_TEXT}")
    print(
        "SG reference: "
        f"K={REFERENCE_K}, M={REFERENCE_M}, X={REFERENCE_X:g}, "
        f"p={REFERENCE_P}, k=2..{REFERENCE_K}, odd m<=M"
    )
    print(
        "paired estimate: "
        f"mp.dps={MP_DPS}, Euler(start={EULER_START}, depth={EULER_DEPTH}); "
        f"stability profile=({EULER_CHECK_START}, {EULER_CHECK_DEPTH})"
    )
    print(
        "tail check: direct paired terms="
        f"{DIRECT_PAIR_COUNT}; tail <= |s|/Re(s)*(2*N+1)^(-Re(s))"
    )
    print(f"nonzero binary64 SG terms: {len(sg_terms)}")
    print()
    print(
        "t       sampled_delta      accel_stability   direct_partial_delta  "
        "continued_tail_upper  tail_adjusted_upper  adjusted/margin"
    )
    for row in rows:
        print(
            f"{row.t_text:>6}  "
            f"{sci(row.sampled_delta):>17}  "
            f"{sci(row.acceleration_stability_delta):>17}  "
            f"{sci(row.direct_partial_delta):>20}  "
            f"{sci(row.continued_tail_upper):>21}  "
            f"{sci(row.tail_adjusted_upper):>19}  "
            f"{sci(row.tail_adjusted_upper / margin):>15}"
        )

    center = rows[2]
    print()
    print(f"center continued estimate (re, im): {complex_text(center.continued_estimate)}")
    print(f"center SG reference      (re, im): {complex_text(center.sg_reference)}")
    print(f"max sampled delta: {sci(max(row.sampled_delta for row in rows))}")
    print(
        "max analytic continued-tail upper: "
        f"{sci(max(row.continued_tail_upper for row in rows))}"
    )
    max_adjusted = max(row.tail_adjusted_upper for row in rows)
    print(f"max tail-adjusted diagnostic upper: {sci(max_adjusted)}")
    print(f"tail-adjusted upper below margin at all samples: {max_adjusted < margin}")
    print()
    print("LIMITATIONS")
    print("- sampled_delta is an accelerated numerical estimate, not an upper bound")
    print("- continued_tail_upper bounds only the omitted paired-series tail")
    print("- finite arithmetic is not interval-enclosed or kernel-checked")
    print("- no claim is made between the five sampled heights")
    return 0 if max_adjusted < margin else 2


if __name__ == "__main__":
    raise SystemExit(main())
