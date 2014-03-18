#!/bin/bash

SCRIPT_DIR=$(dirname $(readlink -f ${BASH_SOURCE[@]}));
SETUP_SCRIPTS_DIR=$SCRIPT_DIR/setup-scripts
RESOURCES_DIR=$SCRIPT_DIR/resources

function modifiedHeaderTo(){
  echo "${1}Modified by bash-bootstrap on \"`date`\"" >> $2
}

function addedHeaderTo(){
  echo "${1}Added by bash-bootstrap on \"`date`\"" >> $2
}

function setup(){
  . $SETUP_SCRIPTS_DIR/$1
}

function rPath(){
  echo "$RESOURCES_DIR/$1"
}

setup default-aliases
setup vim
