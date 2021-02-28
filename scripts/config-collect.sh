#!/bin/bash
set -eu

# Load utilities
. $(cd `dirname $0` ; pwd)/_utils.sh

# Set up
TOOL_NAME=".config/git"
set_pref

# !CHANGE
set_and_echo LOCAL_ROOT "${LOCAL_ROOT_DEFAULT}/.config"
set_and_echo REPO_FILES_TOOL "${REPO_FILES}/config"

# Script body
pref_echo "START"

mkdir -p ${REPO_FILES_TOOL}/git
cp_dir_if_exist ${LOCAL_ROOT}/git ${REPO_FILES_TOOL}/git/

# Tear down
pref_echo "FINISH"
unset_pref
