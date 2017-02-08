#!/bin/bash

set -o errexit
set -o nounset
set -o xtrace


export PATH=${PATH}:/usr/local/bin/install

NON_ESSENTIAL_BUILD="make ca-certificates wget gcc g++ python-pip python-dev zlib1g-dev"
ESSENTIAL_BUILD="gfortran libopenblas-dev"
RUNTIME="python-minimal bwa"

# Build dependencies
apt-get update --yes
apt-get install --yes --no-install-recommends ${NON_ESSENTIAL_BUILD} ${ESSENTIAL_BUILD}

gatb_minia.sh
besst.sh

pip install --user --requirement /usr/local/share/python_requirements.txt

# Clean up dependencies
#apt-get autoremove --purge --yes ${NON_ESSENTIAL_BUILD}
#apt-get clean

# Install required files
apt-get install --yes --no-install-recommends ${RUNTIME}
#rm -rf /var/lib/apt/lists/*

# Can fortan libopenblas dependencies be removed?
