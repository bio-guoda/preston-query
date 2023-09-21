#!/bin/bash
#
# Apply query on well-defined knowledge graph.
#
# Uses a defined version of Oxigraph (default: v0.3.18) 
# to execute provided query 
# on a well defined graph.
#
# usage:
#    cat [some query] | query.sh [content id anchor]
#
# For examples, see https://github.com/bio-guoda/preston-query .
#
# ! work in progress !

set -xe

anchor=${1:-"hash://md5/2be314dfef2274b2c78a03ac0d860ad9"}
oxigraph_binary=${2:-"hash://sha256/1d62d475516f85dc8ab548ed0f8d25572186cbaf91cf43805d415d310045ea1e"}
oxigraph_binary=${2:-"hash://md5/14645c446a77e15739dccc809699b827"}
remotes=${3:-"https://linker.bio,https://zenodo.org,https://softwareheritage.org"}
hash_space=${4:-"md5"}

oxigraph=$(mktemp --tmpdir)
oxigraph_data_dir=$(mktemp --directory)
mkdir -p ${oxigraph_data_dir}

# get oxigraph program
preston cat\
 --remote "${remotes}"\
 "${oxigraph_binary}"\
 > ${oxigraph}

chmod +x "${oxigraph}"

function load {
 ${oxigraph}\
 load\
 --format application/n-quads\
 --location "${oxigraph_data_dir}"\
 --lenient  
}

# load available quads into oxigraph 
preston cat "${anchor}"\
 --remote https://linker.bio,https://zenodo.org\
 --algo "${hash_space}"\
 | preston cat\
 --remote https://linker.bio,https://zenodo.org\
 --algo "${hash_space}"\
 | load


${oxigraph}\
 query\
 --location ${oxigraph_data_dir}\
 --results-format "txt"

# attempt to clean intermediate files
rm ${oxigraph}
rm -rf ${oxigraph_data_dir}
