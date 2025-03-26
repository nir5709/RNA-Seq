#!/bin/bash
SRRs=(
"SRR2422918"
"SRR2422919"
"SRR2422920"
"SRR2422921"
"SRR2422922"
"SRR2422923"
"SRR2422924"
"SRR2422925"
"SRR2422926"
"SRR2422927"
"SRR2422928"
"SRR2422929"
"SRR2422930"
"SRR2422931"
"SRR2422932"
"SRR2422933"
"SRR2422934"
)

# Download and convert each SRR ID
for srr_id in "${SRRs[@]}"
do
           echo "Downloading and converting $srr_id"
              prefetch $srr_id
                 fasterq-dump $srr_id --split-files --outdir /path/to/your/output/directory
                    echo "$srr_id conversion complete"
            done
