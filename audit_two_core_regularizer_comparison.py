#!/usr/bin/env python3
"""Compare finite C2 two-core regularizers at the audited near-collision.

This is a numerical audit helper, not proof evidence.  It keeps the same
zeta-free finite genuine object isolated in Lean for the `K = 5, M = 3`
two-core prefix and changes only the cutoff profile

    W_p(n, X) = exp(-(n / X)^p).

The default certificate is the exponential-cutoff near-collision recorded by
`audit_two_core_cutoff_zero_certificate.py`.
"""

from __future__ import annotations

import argparse
import sys

try:
    import mpmath as mp
except ImportError as exc:  # pragma: no cover - audit environment check
    raise SystemExit("mpmath is required for this audit script") from exc


DEFAULT_DPS = 90

DEFAULT_SIGMA = (
    "0.0000000030194247128036203561501360761502444091951103676256028679195137886407318536631797"
)
DEFAULT_T = (
    "168021.5681646169889802475354446413458822734703419614965793993461764136166896686"
)
DEFAULT_X = "81444144.70071535"


def cutoff_weight(n: int, cutoff: mp.mpf, power: int) -> mp.mpf:
    """Super-Gaussian family `exp(-(n / X)^p)`.

    `power = 1` is the note-style exponential cutoff used by the current Lean
    finite audit.
    """

    return mp.exp(-((mp.mpf(n) / cutoff) ** power))


def address_prefix(s: mp.mpc, cutoff: mp.mpf, power: int, address: int) -> mp.mpc:
    """Normalized four-floor address quartet prefix.

    This matches `cutoffAddressQuartetPrefix` in Lean when `power = 1`, with the
    cutoff weight at address `4` removed as the common normalizing factor.
    """

    q = mp.mpf("0.5") * mp.exp(-s * mp.log(2))
    w4 = cutoff_weight(4, cutoff, power)
    total = mp.mpc(0)
    for j in range(4):
        total += q**j * cutoff_weight(address * (2**j), cutoff, power) / w4
    return total


def two_core_prefix_parts(
    sigma: mp.mpf, t: mp.mpf, cutoff: mp.mpf, power: int
) -> tuple[mp.mpc, mp.mpc, mp.mpc, mp.mpc]:
    """Return `(prefix, address_4, core_3_address_12, scalar)`.

    The finite two-core prefix is

        A_4(s, X) + 3^(-s) A_12(s, X).

    The scalar is the nonzero factor removed by the Lean factorization of
    `rectangularExponentialGenuine s 5 3 X` in the `power = 1` case.
    """

    s = mp.mpc(sigma, t)
    q = mp.mpf("0.5") * mp.exp(-s * mp.log(2))
    c3 = mp.exp(-s * mp.log(3))
    a4 = address_prefix(s, cutoff, power, 4)
    c3a12 = c3 * address_prefix(s, cutoff, power, 12)
    scalar = 2 * q**2 * cutoff_weight(4, cutoff, power)
    return a4 + c3a12, a4, c3a12, scalar


def fmt(z: mp.mpf | mp.mpc, digits: int = 24) -> str:
    return mp.nstr(z, digits)


def parse_args(argv: list[str]) -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Compare finite two-core C2 genuine regularizers."
    )
    parser.add_argument("--sigma", default=DEFAULT_SIGMA)
    parser.add_argument("--t", default=DEFAULT_T)
    parser.add_argument("--cutoff", default=DEFAULT_X)
    parser.add_argument("--dps", type=int, default=DEFAULT_DPS)
    parser.add_argument(
        "--powers",
        type=int,
        nargs="+",
        default=[1, 2, 4, 8],
        help="Cutoff powers p in exp(-(n/X)^p).",
    )
    return parser.parse_args(argv)


def main(argv: list[str]) -> int:
    args = parse_args(argv)
    if any(power < 1 for power in args.powers):
        print("all cutoff powers must be positive integers", file=sys.stderr)
        return 2

    mp.mp.dps = args.dps
    sigma = mp.mpf(args.sigma)
    t = mp.mpf(args.t)
    cutoff = mp.mpf(args.cutoff)

    print("finite genuine two-core regularizer comparison")
    print("object  = A_4(s,X) + 3^(-s) A_12(s,X)")
    print("cutoff  = W_p(n,X) = exp(-(n/X)^p)")
    print(f"sigma  = {fmt(sigma, 70)}")
    print(f"t      = {fmt(t, 70)}")
    print(f"X      = {fmt(cutoff, 70)}")
    print()
    print(
        "p  |prefix|                 |block|                  "
        "|A4|                     |3^-s A12|              collision gap"
    )
    print("-" * 116)

    results: dict[int, mp.mpf] = {}
    ratio_diagnostics: list[tuple[int, mp.mpc, mp.mpf]] = []
    base_ratio_diagnostics: list[tuple[int, mp.mpf, mp.mpf]] = []
    closeness_diagnostics: list[tuple[int, mp.mpf, mp.mpf]] = []
    scale_diagnostics: list[
        tuple[int, mp.mpf, mp.mpf, mp.mpf, mp.mpf, mp.mpf, mp.mpf, mp.mpf]
    ] = []
    s = mp.mpc(sigma, t)
    core3 = mp.exp(-s * mp.log(3))
    q = mp.mpf("0.5") * mp.exp(-s * mp.log(2))
    log3 = mp.log(3)
    quadratic_margin_left = 32 * (mp.mpf(96) ** 2) * (1 + sigma * log3)
    quadratic_margin_right = (sigma * log3) * (cutoff**2)
    unit_strip_scale_barrier = (
        32 * (mp.mpf(96) ** 2) * (1 + log3) / log3
    )
    unit_strip_scale_right = sigma * (cutoff**2)
    for power in args.powers:
        prefix, a4, c3a12, scalar = two_core_prefix_parts(
            sigma, t, cutoff, power
        )
        a12 = c3a12 / core3
        w4 = cutoff_weight(4, cutoff, power)
        floor_differences = [
            abs(
                cutoff_weight(4 * (2**j), cutoff, power) / w4
                - cutoff_weight(12 * (2**j), cutoff, power) / w4
            )
            for j in range(4)
        ]
        power_gaps = [
            (mp.mpf(12 * (2**j)) / cutoff) ** power
            - (mp.mpf(4 * (2**j)) / cutoff) ** power
            for j in range(4)
        ]
        closeness_upper = mp.fsum(
            (abs(q) ** j) * floor_differences[j] for j in range(4)
        )
        floor_max = max(floor_differences)
        power_gap_max = max(power_gaps)
        scale_top = (mp.mpf(96) / cutoff) ** power
        q_tail = abs(q) + abs(q) ** 2 + abs(q) ** 3
        cutoff_ratio = abs(cutoff_weight(12, cutoff, power) / w4)
        base_gap = (mp.mpf(12) / cutoff) ** power - (
            mp.mpf(4) / cutoff
        ) ** power
        prefix_lower = cutoff_ratio * (1 - q_tail)
        lower_margin = (1 - abs(core3)) * prefix_lower
        certified_lower_margin = (1 - abs(core3)) * cutoff_ratio * mp.mpf("0.125")
        block = scalar * prefix
        if c3a12 == 0:
            collision_gap = mp.inf
            collision_ratio = mp.mpc(mp.inf)
        else:
            collision_ratio = a4 / c3a12
            collision_gap = abs(collision_ratio + 1)
        results[power] = abs(prefix)
        ratio_diagnostics.append((power, collision_ratio, collision_gap))
        base_ratio_diagnostics.append((power, base_gap, cutoff_ratio))
        closeness_diagnostics.append(
            (power, abs(a4 - a12), (1 - abs(core3)) * abs(a12))
        )
        scale_diagnostics.append(
            (
                power,
                closeness_upper,
                floor_max,
                power_gap_max,
                scale_top,
                lower_margin,
                certified_lower_margin,
                (1 - abs(core3)) * abs(a12),
            )
        )
        print(
            f"{power:<2} "
            f"{fmt(abs(prefix), 22):>24} "
            f"{fmt(abs(block), 22):>24} "
            f"{fmt(abs(a4), 22):>24} "
            f"{fmt(abs(c3a12), 22):>24} "
            f"{fmt(collision_gap, 22):>24}"
        )

    print()
    print("collision ratio diagnostics: ratio = A4 / (3^(-s) A12)")
    print("p  |ratio|                 Re(ratio)+1             Im(ratio)              |ratio+1|")
    print("-" * 98)
    for power, collision_ratio, collision_gap in ratio_diagnostics:
        print(
            f"{power:<2} "
            f"{fmt(abs(collision_ratio), 22):>24} "
            f"{fmt(mp.re(collision_ratio) + 1, 22):>24} "
            f"{fmt(mp.im(collision_ratio), 22):>24} "
            f"{fmt(collision_gap, 22):>24}"
        )

    print()
    print("base cutoff-ratio floor: gap <= log(2) implies |W12/W4| >= 1/2")
    print("p  exponent gap            log(2)-gap             |W12/W4|")
    print("-" * 82)
    log_two = mp.log(2)
    for power, base_gap, cutoff_ratio in base_ratio_diagnostics:
        print(
            f"{power:<2} "
            f"{fmt(base_gap, 22):>24} "
            f"{fmt(log_two - base_gap, 22):>24} "
            f"{fmt(cutoff_ratio, 22):>24}"
        )

    print()
    print("p=2 fraction-free core-scale route")
    print("left  = 32 * 96^2 * (1 + sigma * log(3))")
    print("right = (sigma * log(3)) * X^2")
    print(
        "left                 right                right-left           "
        "right/left"
    )
    print("-" * 90)
    print(
        f"{fmt(quadratic_margin_left, 22):>20} "
        f"{fmt(quadratic_margin_right, 22):>20} "
        f"{fmt(quadratic_margin_right - quadratic_margin_left, 22):>20} "
        f"{fmt(quadratic_margin_right / quadratic_margin_left, 22):>20}"
    )

    print()
    print("p=2 unit-strip reciprocal-scale route")
    print("barrier = 32 * 96^2 * (1 + log(3)) / log(3)")
    print("right   = sigma * X^2")
    print(
        "barrier             right               right-barrier       "
        "right/barrier"
    )
    print("-" * 86)
    print(
        f"{fmt(unit_strip_scale_barrier, 22):>20} "
        f"{fmt(unit_strip_scale_right, 22):>20} "
        f"{fmt(unit_strip_scale_right - unit_strip_scale_barrier, 22):>20} "
        f"{fmt(unit_strip_scale_right / unit_strip_scale_barrier, 22):>20}"
    )

    print()
    print("address closeness route: |A4-A12| < (1-|3^(-s)|)|A12|")
    print("p  |A4-A12|               core margin             margin - difference")
    print("-" * 80)
    for power, difference, margin in closeness_diagnostics:
        print(
            f"{power:<2} "
            f"{fmt(difference, 22):>24} "
            f"{fmt(margin, 22):>24} "
            f"{fmt(margin - difference, 22):>24}"
        )

    print()
    print("formal scale route: floorMax <= powerGapMax <= (96/X)^p")
    print(
        "p  closeness upper         floorMax                "
        "2 floorMax            2 powerGapMax         2 scaleTop           "
        "32 scaleTop          q lower margin        1/8 lower margin      "
        "core margin"
    )
    print("-" * 226)
    for (
        power,
        upper,
        floor_max,
        power_gap_max,
        scale_top,
        lower_margin,
        certified_lower_margin,
        margin,
    ) in scale_diagnostics:
        print(
            f"{power:<2} "
            f"{fmt(upper, 22):>24} "
            f"{fmt(floor_max, 22):>24} "
            f"{fmt(2 * floor_max, 22):>24} "
            f"{fmt(2 * power_gap_max, 22):>24} "
            f"{fmt(2 * scale_top, 22):>24} "
            f"{fmt(32 * scale_top, 22):>24} "
            f"{fmt(lower_margin, 22):>24} "
            f"{fmt(certified_lower_margin, 22):>24} "
            f"{fmt(margin, 22):>24}"
        )

    print()
    print("notes:")
    print("- p = 1 is the exponential cutoff currently formalized in Lean.")
    print("- p > 1 is a super-Gaussian diagnostic on the same finite prefix.")
    print("- Numerical separation guides the next Lean target but closes no proof.")

    if 1 in results and results[1] > mp.mpf("1e-50"):
        print("warning: p=1 did not reproduce the expected near-collision")
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
