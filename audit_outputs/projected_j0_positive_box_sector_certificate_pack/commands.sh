#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/../.."
python3 operadores/c2_projected_j0_sector_box_certifier.py   --boxes-csv audit_outputs/c2_projected_j0_atlas_scout_positive_box_sigmas084_086_t32p82_32p86_w005_boxes.csv   --label sector_positive_box_fast_sub32   --mode fast   --subdiv-t 32   --interval-dps 80   --inflate 1e-13   --K 16 --M 12001 --ref-K 17 --ref-M 16001   --reference-mode supergaussian --reference-X 10661 --reference-p 2   --target-reference-mode supergaussian --target-reference-X 10661 --target-reference-p 2   --odd-reference-mode supergaussian --odd-ref-M 16001 --odd-reference-X 10661 --odd-reference-p 2   --top 10
