#!/bin/bash
#bash-bootstrap management
alias cibashboot='prev=$CWD;cd ~/.bash-bootstrap;git add --all;git commit;git push origin master;cd $prev;'
alias upbashboot='prev=$CWD;cd ~/.bash-bootstrap;git pull origin master;./setup.bash;cd $prev'

#shortcuts for editing bash-bootstrap files
alias edivimrc='vim ~/.vimrc'
alias edibashal='vim ~/.bash_aliases;. ~/.bash_aliases'
alias edibashrc='vim ~/.bashrc;. ~/.bashrc'
alias edisyntax='vim ~/.vim/bundle/syntastic/syntax_checkers'
alias edisnip='vim ~/.vim/bundle/snipmate.vim/snippets'

#general shortcuts
alias l="ls -Al"

#git shortcuts
alias gba='git branch'
alias gst='git status'
alias gca='git commit -a'
alias gpu='git push -u origin'

#npm shortcuts
alias npu='npm publish'

function cjobs()
{
   ps -e | less;
}

sshadd(){
  ssh-add $HOME/.ssh/$1
}

if [ -f ~/.bash_aliases_custom ];then
  . ~/.bash_aliases_custom;
fi

