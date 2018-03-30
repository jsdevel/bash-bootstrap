#!/bin/bash

if [ -r ~/.bashrc ]; then
   source ~/.bashrc
else
  cat > ~/.bashrc <<~
#!/bin/bash
~
fi

if [ -d ~/.vim ];then
  read -p 'This will remove your ~/.vim directory.  Proceed?[y/n]' dec
  case $dec in
    y)rm -rf ~/.vim;;
    n)echo 'Cancelling bash-bootstrap!';exit 0;;
    *)echo 'Unknown decision!';exit 1;;
  esac
fi

if [ ! -d ~/.bash-bootstrap ];then
  git clone git@github.com:jsdevel/bash-bootstrap.git ~/.bash-bootstrap
  BASH_BOOTSTRAP_NO_VIM="$BASH_BOOTSTRAP_NO_VIM" ~/.bash-bootstrap/setup.bash
fi

. ~/.bashrc
