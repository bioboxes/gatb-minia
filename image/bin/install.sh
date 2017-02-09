#!/bin/bash

set -o errexit
set -o nounset
set -o xtrace


export PATH=${PATH}:/usr/local/bin/install

NON_ESSENTIAL_BUILD="
	ca-certificates \
	g++ \
	gcc \
	gfortran \
	libfreetype6-dev \
	libopenblas-dev \
	libxft-dev \
	make \
	python-dev \
	python-pip \
	wget \
	zlib1g-dev \
	"

ESSENTIAL_BUILD=""
RUNTIME="python-minimal libpython-stdlib bwa libfreetype6 libopenblas-base"

# Build dependencies
apt-get update --yes
apt-get install --yes --no-install-recommends ${NON_ESSENTIAL_BUILD} ${ESSENTIAL_BUILD}

gatb_minia.sh
besst.sh

pip install --user --requirement /usr/local/share/python_requirements.txt

# Clean up dependencies
apt-get autoremove --purge --yes ${NON_ESSENTIAL_BUILD}
apt-get clean

# Install required files
apt-get install --yes --no-install-recommends ${RUNTIME}
rm -rf /var/lib/apt/lists/*
