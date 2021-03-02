#!/bin/bash

set -ex
set -o pipefail

if [ ! -z $INPUT_SUBDIR ]; then
    cd $INPUT_SUBDIR
fi

conda build -c conda-forge -c computational-metabolomics -c bioconda --output-folder . .

if [[ -n "${INPUT_ANACONDATOKEN}" ]]; then
  export ANACONDA_API_TOKEN=$INPUT_ANACONDATOKEN
  anaconda upload ./noarch/*.tar.bz2 -u computational-metabolomics
fi    
