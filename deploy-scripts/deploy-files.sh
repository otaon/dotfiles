#!/bin/sh

echo "script: Set source root."
SCRIPT_ROOT=$(cd `dirname $0` ; pwd)
REPO_ROOT=$(cd ${SCRIPT_ROOT}/.. ; pwd)
echo "script:   [Source root] ${REPO_ROOT}"


echo "script: Set destination root."
DEPLOY_ROOT=$(cd ~/test/ ; pwd)
echo "script:   [Destination root] ${DEPLOY_ROOT}"


echo "script: Copying files"
echo "script:   Copying Zsh files"
cp ${REPO_ROOT}/.zshrc ${DEPLOY_ROOT}/

echo "script:   Copying Bash files"
cp ${REPO_ROOT}/.bashrc ${DEPLOY_ROOT}/
cp ${REPO_ROOT}/.bash_profile ${DEPLOY_ROOT}/


echo "script:   Copying SSH files"
DEPLOY_SSH=${DEPLOY_ROOT}/.ssh
mkdir -p ${DEPLOY_SSH}
cp ${REPO_ROOT}/.ssh/config ${DEPLOY_SSH}/


echo "script:   Copying Git files"
cp -r ${REPO_ROOT}/.gitconfig ${DEPLOY_ROOT}/


echo "script:   Copying Vim files"
cp -r ${REPO_ROOT}/.vimrc ${DEPLOY_ROOT}/
cp -r ${REPO_ROOT}/.gvimrc ${DEPLOY_ROOT}/
REPO_VIM=${REPO_ROOT}/.vim
DEPLOY_VIM=${DEPLOY_ROOT}/.vim
mkdir -p ${DEPLOY_VIM}
cp -r ${REPO_VIM}/config ${DEPLOY_VIM}
cp -r ${REPO_VIM}/dictionary ${DEPLOY_VIM}/


echo "script:   Copying tmux files"
cp -r ${REPO_ROOT}/.tmux.conf ${DEPLOY_ROOT}/


echo "script:   Copying W3M files"
REPO_W3M=${REPO_ROOT}/.w3m
DEPLOY_W3M=${DEPLOY_ROOT}/.w3m
mkdir -p ${DEPLOY_W3M}
cp -r ${REPO_W3M}/keymap ${DEPLOY_W3M}/

