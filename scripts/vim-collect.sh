#!/bin/bash
set -eu

# Load utilities
. $(cd `dirname $0` ; pwd)/_utils.sh

# Set up
TOOL_NAME="Vim"
set_pref

# !CHANGE
set_and_echo LOCAL_ROOT "${LOCAL_ROOT_DEFAULT}"
set_and_echo REPO_FILES_TOOL "${REPO_FILES}/vim"

# Script body
pref_echo "START"

cp_if_exist ${LOCAL_ROOT}/.vimrc ${REPO_FILES_TOOL}/
cp_if_exist ${LOCAL_ROOT}/.gvimrc ${REPO_FILES_TOOL}/

mkdir -p ${REPO_FILES_TOOL}/vim
cp_dir_if_exist ${LOCAL_ROOT}/.vim/config ${REPO_FILES_TOOL}/vim/
cp_dir_if_exist ${LOCAL_ROOT}/.vim/dictionary ${REPO_FILES_TOOL}/vim/

# Tear down
pref_echo "FINISH"
unset_pref
