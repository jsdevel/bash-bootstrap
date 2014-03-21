#!/bin/bash
alias upbashboot='cd ~/.bash-bootstrap;git pull origin master;./setup.bash'
alias edivimrc='vim ~/.vimrc'
alias edibashal='vim ~/.bash_aliases;. ~/.bash_aliases'
alias edibashrc='vim ~/.bashrc;. ~/.bashrc'
alias l="ls -Al"
alias gst='git status'

function cjobs()
{
   ps -e | less;
}

sshadd(){
  ssh-add $HOME/.ssh/$1
}

if [ ~/.bash_aliases_custom ];then
  . ~/.bash_aliases_custom;
fi

