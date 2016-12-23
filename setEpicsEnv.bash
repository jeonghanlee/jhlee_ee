#!/bin/sh
# Shell  : setEpicsEnv.sh
# Author : Jeong Han Lee
# email  : jeonghan.lee@gmail.com


SRC="${BASH_SOURCE[0]}"
SRC_DIR="$( cd -P "$( dirname "$SRC" )" && pwd )"


export EPICS_HOST_ARCH=linux-x86_64
export EPICS_PATH=${SRC_DIR}
export EPICS_BASE=${EPICS_PATH}/epics-base
export EPICS_EXTENSIONS=${EPICS_PATH}/extensions
export EPICS_MODULES=${EPICS_PATH}/epics-modules
export EPICS_APPS=${EPICS_PATH}/epics-Apps


export PATH=${EPICS_EXTENSIONS}/bin/${EPICS_HOST_ARCH}:${EPICS_BASE}/bin/${EPICS_HOST_ARCH}:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games
export LD_LIBRARY_PATH=${EPICS_EXTENSIONS}/lib/${EPICS_HOST_ARCH}:${EPICS_BASE}/lib/${EPICS_HOST_ARCH}

