#!/bin/bash
set -eu

# Check if the running shell is bash
exe=`ps -e | awk -v"pid=$$" '$1==pid {print $NF}'`
shebang=$(head -1 `readlink -f $0` | awk -F/ '{print $NF}')
test $exe != `basename $0` -a $exe != $shebang && 
  echo "This script can be executed by bash" && 
  exit 1


# Utilities
set_pref() {
	PREFIX=${TOOL_NAME}
}

unset_pref() {
	PREFIX="_"
}

pref_echo() {
	echo "[${PREFIX}] $1"
}

set_and_echo() {
	eval $1=$2
	pref_echo "$1=$2"
}

set_and_echo_once() {
	if [ ! -v $1 ]; then
		eval $1=$2
		pref_echo "$1=$2"
	fi
}

cp_if_exist() {
	pref_echo "cp $1 -> $2"
	if [ -f $1 ]; then
		cp $1 $2
	else
		pref_echo "!File not exist: $1"
	fi
}

cp_dir_if_exist() {
	pref_echo "cp $1 -> $2"
	if [ -d $1 ]; then
		cp -r $1 $2
	else
		pref_echo "!Directory not exist: $1"
	fi
}

# Set up
TOOL_NAME="Util"
set_pref

# Set Variables
set_and_echo_once LOCAL_ROOT_DEFAULT $(cd ~/ ; pwd)
set_and_echo_once REPO_SCRIPT $(cd `dirname $0` ; pwd)
set_and_echo_once REPO_ROOT $(cd ${REPO_SCRIPT}/.. ; pwd)
set_and_echo_once REPO_FILES ${REPO_ROOT}/files

# Tear down
unset_pref
