#!/bin/bash

set -o errexit
set -o nounset
set -o xtrace


NON_ESSENTIAL_BUILD="make ca-certificates wget unzip gcc python-pip python-dev zlib1g-dev"
ESSENTIAL_BUILD=""
RUNTIME="python-minimal bwa python-scipy"

# Build dependencies
apt-get update --yes
apt-get install --yes --no-install-recommends ${NON_ESSENTIAL_BUILD} ${ESSENTIAL_BUILD}

pip install --user --requirement /usr/local/share/python_requirements.txt

wget https://github.com/GATB/gatb-minia-pipeline/archive/master.zip
unzip master.zip
mv gatb-minia-pipeline-master /usr/local/gatb-minia
cd /usr/local/gatb-minia

wget https://github.com/ksahlin/BESST/archive/f38c8d27bb189da81a8f8ba27dffb305f1bcca5e.zip
unzip f38c8d27bb189da81a8f8ba27dffb305f1bcca5e.zip
mv BESST-f38c8d27bb189da81a8f8ba27dffb305f1bcca5e /usr/local/gatb-minia/BESST

rm *.zip
cd /usr/local/gatb-minia


ln -s /usr/local/gatb-minia/gatb /usr/local/bin

# Clean up dependencies
#apt-get autoremove --purge --yes ${NON_ESSENTIAL_BUILD}
#apt-get clean

# Install required files
apt-get install --yes --no-install-recommends ${RUNTIME}
#rm -rf /var/lib/apt/lists/*
