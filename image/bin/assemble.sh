#!/bin/bash

set -o errexit
set -o nounset
set -o xtrace

READS=$(biobox_args.sh 'select(has("fastq")) | .fastq | map("--12 \(.value)") | join(" ")')

cd $(mktemp -d)
gatb ${READS}

cp assembly.fasta ${OUTPUT}/contigs.fa

cat << EOF > ${OUTPUT}/biobox.yaml
version: 0.9.0
arguments:
  - fasta:
    - id: contigs_1
      value: contigs.fa
      type: contigs
EOF

# Clean up all generated files
rm -rf -- "$(pwd -P)"
