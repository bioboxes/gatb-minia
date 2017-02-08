#!/bin/bash

URL="https://github.com/GATB/gatb-minia-pipeline/archive/${GATB_VERSION}.tar.gz"
fetch_archive.sh ${URL} gatb
ln -s /usr/local/gatb/{gatb,minia} /usr/local/bin

# Remove BESST because /usr/local/gatb/BESST/scripts/ is referenced by gatb, but
# does not exist in the installed directory
rm -rf /usr/local/gatb/BESST
