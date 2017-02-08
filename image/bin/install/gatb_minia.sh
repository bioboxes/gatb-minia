#!/bin/bash

URL="https://github.com/GATB/gatb-minia-pipeline/archive/${GATB_VERSION}.tar.gz"
fetch_archive.sh ${URL} gatb
ln -s /usr/local/gatb-minia/gatb /usr/local/bin
