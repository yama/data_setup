#!/bin/sh

set -e

WDIR=`dirname "$(realpath "$0")"`
WDIR=${WDIR}/../..

TDIR="data_setup"
SDIR="script"
IDIR="input_data"
ODIR="gen_data"
MDIR="covid19"

SPATH=${WDIR}/${TDIR}/${SDIR}
IPATH=${WDIR}/${TDIR}/${IDIR}
OPATH=${WDIR}/${TDIR}/${ODIR}
MPATH=${WDIR}/${MDIR}

# exec

echo "${SPATH}/get_data.py"
      ${SPATH}/get_data.py

echo "${SPATH}/gen_json.py"
      ${SPATH}/gen_json.py

echo "${SPATH}/merge_json.py"
      ${SPATH}/merge_json.py

echo "sed 's/\\\\/\\/g' ${OPATH}/data_new.json > ${OPATH}/data.json"
      sed 's/\\\\/\\/g' ${OPATH}/data_new.json > ${OPATH}/data.json
