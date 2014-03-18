#!/bin/bash

SCRIPT_DIR=$(dirname $(readlink -f ${BASH_SOURCE[@]}));
SETUP_SCRIPTS=$SCRIPT_DIR/setup-scripts

function addedHeader(){
  echo "#Added by bash-bootstrap on \"`date`\""
}

function setup(){
  . $SETUP_SCRIPTS/$1
}

setup default-aliases
