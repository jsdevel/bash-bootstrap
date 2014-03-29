#!/bin/bash
#bash-bootstrap management
alias cibashboot='cd ~/.bash-bootstrap;git add --all;git commit;git push origin master;'
alias upbashboot='cd ~/.bash-bootstrap;git pull origin master;./setup.bash'

#shortcuts for editing bash-bootstrap files
alias edivimrc='vim ~/.vimrc'
alias edibashl='vim ~/.bash_aliases;. ~/.bash_aliases'
alias edibashp='vim ~/.bash_profile;. ~/.bash_profile'
alias edibasrc='vim ~/.bash_profile;. ~/.bash_profile'
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

