#!/bin/bash
#bash-bootstrap management
alias cibashboot='(cd ~/.bash-bootstrap && git add --all && git commit && git push origin master);'
alias upbashboot='(cd ~/.bash-bootstrap && git pull && ./setup.bash && . ~/.bashrc && echo "Updated bash-bootstrap!")'
alias civimboot='(cd ~/.vim && git add --all && git commit && git push origin master);'

#vim-bootstrap
alias civimboot='(cd ~/.vim && git add --all && git commit && git push origin master);'
alias upvimboot='(cd ~/.vim && git pull && git submodule update --init)'

#shortcuts for editing bash-bootstrap files
alias edivimrc='vim ~/.vimrc'
alias edisshconfig='vim ~/.ssh/config'
alias edibashl='vim ~/.bash_aliases;. ~/.bash_aliases'
alias edibashlc='vim ~/.bash_aliases_custom;. ~/.bash_aliases_custom'
alias edibashp='vim ~/.bash_profile;. ~/.bash_profile'
alias edibasrc='vim ~/.bashrc;. ~/.bashrc'
alias edisyntax='vim ~/.vim/bundle/syntastic/syntax_checkers'
alias edisnip='vim ~/.vim/bundle/snipmate.vim/snippets'
alias viewsyslog='sudo vim /var/log/messages'

#general shortcuts
alias ..="cd .."
alias ls="ls --color"
alias l="ls -Al"

#job aliases
alias j='jobs'
alias b='bg'
alias f='fg'

#git shortcuts
alias gb='git branch'
function gbd() {
  local branch="`git rev-parse --abbrev-ref HEAD`"
  git checkout master

  if [[ "$branch" != 'master' ]]; then
    git branch -D "$branch"
    git pull
    git remote prune origin
  fi
}

# FF Merge a PR branch into master and delete it
function gprbdone() {
  local branch="`git rev-parse --abbrev-ref HEAD`"

  if [[ "$branch" != 'master' ]]; then
    git push -f origin HEAD && \
    git checkout master && \
    git pull origin master -u && \
    git merge --ff-only "$branch" && \
    git push origin master && \
    git push origin ":$branch" && \
    git branch -d "$branch"
  else
    echo 'On branch master, nothing to do.'
  fi
}

# docker alises

# enforce a tag name
alias dbuild='docker build -t'
alias dims='docker images'
alias dps='docker ps'
function drmei() {
  for image in `docker images | grep "^<none>" | sed "s|^<none>\s*<none>\s*||" | sed "s| \s*.*$||"`;do
    docker rmi -f $image
  done
}
alias ddrun='docker run -d'
alias drun='docker run'
alias dstop='docker stop -t 0'

# git aliases
alias gc='git commit'
alias gca='git add --all :/;git commit'
alias gfpu='git push -f origin HEAD;git push origin --tags'
alias glo='git log'
alias gpl='git pull'
alias gpu='git push origin HEAD;git push origin --tags'
alias gpuall='git push origin HEAD;git push origin --tags'
alias grh1='git reset --hard HEAD^'
alias grh='git reset --hard'
alias grs1='git reset --soft HEAD^;git reset'
alias grv='git remote -v'
alias gst='git status'
alias gshs='git stash save -u'
alias gshp='git stash pop'
alias gnewb='git checkout -b'
alias gnew='git checkout master && gnewb'
alias gshowa='git log --pretty=format:"%an" | sort | uniq -c | sort -n'
alias gcl='grh && git clean -fd'
alias gbm='git checkout master'

#npm shortcuts
alias npu='npm publish'

#vim shortcuts
alias svim='touch .vimsession;vim -S .vimsession'

function cjobs()
{
   ps -e | less;
}

function touchexe(){
  touch $1
  chmod +x $1
  echo -e '#!/bin/bash\n' > $1
  vim $1
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
