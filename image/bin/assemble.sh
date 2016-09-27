#!/bin/bash

set -o errexit
set -o nounset
set -o xtrace

READS=$(biobox_args.sh 'select(has("fastq")) | .fastq | map("--12 \(.value)") | join(" ")')

cd $(mktemp -d)
gatb ${READS}
