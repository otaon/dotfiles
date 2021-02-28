#!/bin/bash
set -eu

# Load utilities
. $(cd `dirname $0` ; pwd)/_utils.sh

# Set up
TOOL_NAME="Bash"
set_pref

# !CHANGE
set_and_echo LOCAL_ROOT "${LOCAL_ROOT_DEFAULT}"
set_and_echo REPO_FILES_TOOL "${REPO_FILES}/bash"

# Script body
pref_echo "START"

cp_if_exist ${LOCAL_ROOT}/.bash_profile ${REPO_FILES_TOOL}/
cp_if_exist ${LOCAL_ROOT}/.bashrc ${REPO_FILES_TOOL}/

# Tear down
pref_echo "FINISH"
unset_pref
