#!/bin/bash
#bash-bootstrap management
alias cibashboot='prev=$CWD;cd ~/.bash-bootstrap;git add --all;git commit;git push origin master;cd $prev;'
alias upbashboot='prev=$CWD;cd ~/.bash-bootstrap;git pull origin master;./setup.bash;cd $prev'

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

#vim shortcuts
alias svim='touch .vimsession;vim -S .vimsession'

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


#Git branch in prompt.  Courtesy of @acarlos1000
function parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
