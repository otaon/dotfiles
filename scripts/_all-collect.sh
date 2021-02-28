#!/bin/bash
set -eu

# Load utilities
. $(cd `dirname $0` ; pwd)/_utils.sh

# Set up
TOOL_NAME="_"
set_pref

# Script body
pref_echo "Collect-all start"
. ${REPO_SCRIPT}/bash-collect.sh
. ${REPO_SCRIPT}/config-collect.sh
. ${REPO_SCRIPT}/git-collect.sh
. ${REPO_SCRIPT}/ssh-collect.sh
. ${REPO_SCRIPT}/tmux-collect.sh
. ${REPO_SCRIPT}/vim-collect.sh
. ${REPO_SCRIPT}/w3m-collect.sh
pref_echo "Collect-all end"

# Tear down
unset_pref
