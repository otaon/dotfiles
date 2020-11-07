#!/bin/bash

echo "script: Set source root."
DEPLOY_ROOT=$(cd ~/test/ ; pwd)
echo "script:   [Source root] ${DEPLOY_ROOT}"


echo "script: Set destination root."
SCRIPT_ROOT=$(cd `dirname $0` ; pwd)
REPO_ROOT=$(cd ${SCRIPT_ROOT}/../test-git ; pwd)
echo "script:   [Destination root] ${REPO_ROOT}"


echo "script: Collection files"
echo "script:   Collection Zsh files"
cp ${DEPLOY_ROOT}/.zshrc ${REPO_ROOT}/

echo "script:   Collection Bash files"
cp ${DEPLOY_ROOT}/.bashrc ${REPO_ROOT}/
cp ${DEPLOY_ROOT}/.bash_profile ${REPO_ROOT}/


echo "script:   Collection SSH files"
REPO_SSH=${REPO_ROOT}/.ssh
mkdir -p ${REPO_SSH}
cp ${DEPLOY_ROOT}/.ssh/config ${REPO_SSH}/


echo "script:   Collection Git files"
cp -r ${DEPLOY_ROOT}/.gitconfig ${REPO_ROOT}/


echo "script:   Collection Vim files"
cp -r ${DEPLOY_ROOT}/.vimrc ${REPO_ROOT}/
cp -r ${DEPLOY_ROOT}/.gvimrc ${REPO_ROOT}/
DEPLOY_VIM=${DEPLOY_ROOT}/.vim
REPO_VIM=${REPO_ROOT}/.vim
mkdir -p ${REPO_VIM}
cp -r ${DEPLOY_VIM}/config ${REPO_VIM}
cp -r ${DEPLOY_VIM}/dictionary ${REPO_VIM}/


echo "script:   Collection tmux files"
cp -r ${DEPLOY_ROOT}/.tmux.conf ${REPO_ROOT}/


echo "script:   Collection W3M files"
DEPLOY_W3M=${DEPLOY_ROOT}/.w3m
REPO_W3M=${REPO_ROOT}/.w3m
mkdir -p ${REPO_W3M}
cp -r ${DEPLOY_W3M}/keymap ${REPO_W3M}/

