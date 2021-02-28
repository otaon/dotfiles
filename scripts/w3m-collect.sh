#!/bin/bash
set -eu

# Load utilities
. $(cd `dirname $0` ; pwd)/_utils.sh

# Set up
TOOL_NAME="w3m"
set_pref

# !CHANGE
set_and_echo LOCAL_ROOT "${LOCAL_ROOT_DEFAULT}/.w3m"
set_and_echo REPO_FILES_TOOL "${REPO_FILES}/w3m"

# Script body
pref_echo "START"

cp_if_exist ${LOCAL_ROOT}/keymap ${REPO_FILES_TOOL}/

# Tear down
pref_echo "FINISH"
unset_pref
