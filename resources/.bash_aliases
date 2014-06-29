#!/bin/bash
#bash-bootstrap management
alias cibashboot='(cd ~/.bash-bootstrap && git add --all && git commit && git push origin master);'
alias upbashboot='(cd ~/.bash-bootstrap && git pull && ./setup.bash && . ~/.bash_profile)'

#shortcuts for editing bash-bootstrap files
alias edivimrc='vim ~/.vimrc'
alias edibashl='vim ~/.bash_aliases;. ~/.bash_aliases'
alias edibashp='vim ~/.bash_profile;. ~/.bash_profile'
alias edibasrc='vim ~/.bash_profile;. ~/.bash_profile'
alias edisyntax='vim ~/.vim/bundle/syntastic/syntax_checkers'
alias edisnip='vim ~/.vim/bundle/snipmate.vim/snippets'

#general shortcuts
alias ls="ls --color"
alias l="ls -Al"

#job aliases
alias j='jobs'
alias b='bg'
alias f='fg'

#git shortcuts
alias gb='git branch'
alias gst='git status'
alias gc='git commit'
alias gca='git commit -a'
alias gpu='git push'
alias grv='git remote -v'
alias gpl='git pull'
alias grh='git reset --hard'
alias grh1='git reset --hard HEAD^'

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
export PS1="\e[0;33m\W\e[0m\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
