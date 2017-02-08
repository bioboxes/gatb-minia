#!/bin/bash

URL="https://github.com/ksahlin/BESST/archive/${BESST_VERSION}.tar.gz"
fetch_archive.sh ${URL} besst

# gatb-minia expects BESST to be present
ln -s /usr/local/besst /usr/local/gatb/BESST
