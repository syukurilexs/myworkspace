#!/bin/bash

# Author: Syukur bin Md Kassim
# Email: syukirah@gmail.com
#
# Syukur Workspace setup script

# ##
# Varibales

SYUKUR_CONFIG=~/.syukur
SYUKUR_WORKSPACE=~/syukurworkspace
SYUKUR_ALIAS=~/.syukur/.bash_aliases
SYUKUR_BASHRC=~/.syukur/.bashrc
SYUKUR_PS1=~/.syukur/.ps1

# ##
# Functions
create_folder() {
  if [ ! -d $1 ]; then
    echo "Info - Creating folder: $1"
    mkdir -p $1
  else
    echo "Info - Folder already exists: $1"
  fi
}

add_alias() {
  # ##
  # Create aliases

  # Check bash_aliases, if not there create new file
  if [ ! -e ${SYUKUR_ALIAS} ]; then
    echo "Creating ${SYUKUR_ALIAS}"
    touch ${SYUKUR_ALIAS}
  fi

  # Check alias, if not there then add new one
  grep "alias $1" ${SYUKUR_ALIAS} >/dev/null
  if [ $? -eq 1 ]; then
    echo Info - adds alias $1=$2
    echo "alias $1='$2'" >>${SYUKUR_ALIAS}
  else
    echo Info - alias $1 already exist
  fi
}

# ##
# Crate folder required to be run

create_folder $SYUKUR_CONFIG
create_folder $SYUKUR_WORKSPACE
create_folder $SYUKUR_WORKSPACE/bin
create_folder $SYUKUR_WORKSPACE/lib
create_folder $SYUKUR_WORKSPACE/projects
create_folder $SYUKUR_WORKSPACE/projects/personal
create_folder $SYUKUR_WORKSPACE/projects/office
create_folder $SYUKUR_WORKSPACE/projects/common

# ##
# Add alias

add_alias cl "clear; ls -lrta"
add_alias mywork "cd $SYUKUR_WORKSPACE"
add_alias oproj "cd $SYUKUR_WORKSPACE/projects/office"
add_alias mproj "cd $SYUKUR_WORKSPACE/projects/personal"
add_alias cproj "cd $SYUKUR_WORKSPACE/projects/common"
add_alias dc "docker-compose"

# ##
# Copy Syukur PS1 to ~/.syukur
cp ./myps1.sh $SYUKUR_PS1

# ##
# Add syukurworkspace bin to .bashrc

if [ ! -e $SYUKUR_BASHRC ]; then
  echo Info - Creating $SYUKUR_BASHRC
  touch $SYUKUR_BASHRC
fi

cat >$SYUKUR_BASHRC <<EOL
# This is Syukur .bashrc
# Do not modify this file directly
# because this .bashrc was auto generated by script 

export PATH=\${PATH}:$SYUKUR_WORKSPACE/bin
. $SYUKUR_ALIAS
. $SYUKUR_PS1
EOL

# ##
# Add syukur env to ~/.bashrc

if [ "$(cat ~/.bashrc | grep syukurenv)" = "" ]; then
  echo "Info - Add syukurenv to .bashrc"
  echo "alias syukurenv='. ${SYUKUR_BASHRC}'" >>~/.bashrc
fi

# ##
# For private or public set up

echo -n 'Is the setup for public Yes/No? [Yes]: '
read is_public

if [ "$is_public" = "No" ]; then
  if [ "$(cat ~/.bashrc | grep '. ~/.syukur/.bashrc')" = "" ]; then
    echo Info - Add syukur .bashrc to os .bashrc
    echo '. ~/.syukur/.bashrc' >> ~/.bashrc
  fi
fi
