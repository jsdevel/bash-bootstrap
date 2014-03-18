#!/bin/bash

if [ ! -d ~/.bash-bootstrap ];then
  git clone https://github.com/jsdevel/bash-bootstrap.git ~/.bash-bootstrap
  ~/.bash-bootstrap/setup.bash
fi
