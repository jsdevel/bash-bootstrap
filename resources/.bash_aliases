#!/bin/bash
#bash-bootstrap management
alias cibashboot='(cd ~/.bash-bootstrap && git add --all && git commit && git push origin master);'
alias upbashboot='(cd ~/.bash-bootstrap && git pull && ./setup.bash && . ~/.bashrc && echo "Updated bash-bootstrap!")'
alias civimboot='(cd ~/.vim && git add --all && git commit && git push origin master);'

function cd() {
  builtin cd "$@"
  nvu
}

#vim-bootstrap
alias civimboot='(cd ~/.vim && git add --all && git commit && git push origin master);'

function upvimboot() {
  pushd ~/.vim > /dev/null
  git pull
  vim +PluginUpdate +qall
  git submodule update --init
  pushd ~/.vim/bundle/YouCompleteMe > /dev/null
  ./install.py --clang-completer --tern-completer
  popd > /dev/null
  popd > /dev/null
}

#shortcut for ranger
alias r='ranger'

#shortcuts for editing bash-bootstrap files
alias editermconf='vim ~/.config/terminator/config'
alias edilxderx='vim ~/.config/openbox/lxde-rc.xml;openbox --reconfigure'
alias edivimrc='vim ~/.vimrc'
alias edisshconfig='vim ~/.ssh/config'
alias edibashl='vim ~/.bash_aliases;. ~/.bash_aliases'
alias edibashlc='vim ~/.bash_aliases_custom;. ~/.bash_aliases_custom'
alias edibashp='vim ~/.bash_profile;. ~/.bash_profile'
alias edibasrc='vim ~/.bashrc;. ~/.bashrc'
alias edisyntax='vim ~/.vim/bundle/syntastic/syntax_checkers'
alias edisnip='vim ~/.vim/bundle/snipmate.vim/snippets'
alias viewsyslog='sudo vim /var/log/messages'

#shortcuts for working with node projects
alias nmr='rm -rf node_modules'
alias npv='grep version package.json'
alias nv='node --version'
function nvs() {
  local lines="3"
  if [[ -n "$1" ]]; then
    lines="$1"
  fi
  grep -A "$lines" '"scripts"' package.json
}
function nvu() {
  if [[ -f ".nvmrc" ]]; then
    local node_version="`node --version`"
    local nvm_version="`cat .nvmrc`"

    if [[ "$node_version" != "$nvm_version" ]]; then
      nvm use > /dev/null
    fi
  fi
}
alias grepnode='grep -r \
  --exclude-dir=node_modules \
  --exclude-dir=.cache-loader \
  --exclude-dir=.git \
  --exclude-dir=build \
  --exclude-dir=.sonar \
  --exclude-dir=coverage \
  --exclude-dir=dist'

#react-native shortcuts
alias ra='react-native'

#general shortcuts
alias ..="cd .."
alias ls="ls --color"
alias l="ls -Al"

function bsetfacl() {
  local path="$1"

  if [[ ! -d "$path" ]]; then
    echo "You must supply a directory path!" >&2
    exit 1
  fi

  sudo setfacl -R -m "u:$USER:rw" "$1"
  sudo setfacl -d -m "u:$USER:rw" "$1"
  #sudo setfacl -R -x "u:$USER:rx" "$1"
  #sudo setfacl -d -x "u:$USER:rx" "$1"
}

#job aliases
alias j='jobs'
alias b='bg'
alias f='fg'

#git shortcuts
alias gb='git branch'
function gbd() {
  local branch="`git rev-parse --abbrev-ref HEAD`"

  case "$1" in
    d)local target="develop";;
    *)local target="master";;
  esac

  git checkout "$target"

  if [[ "$branch" != 'master' ]]; then
    git branch -D "$branch"
    git pull
    git remote prune origin
  fi
}

# FF Merge a PR branch into develop and delete it
function gprbdoned() {
  local branch="`git rev-parse --abbrev-ref HEAD`"

  if [[ "$branch" != 'develop' ]]; then
    git push --no-verify -f origin HEAD && \
    git checkout develop && \
    git pull origin develop && \
    git merge --ff-only "$branch" && \
    git push --no-verify origin develop && \
    git push --no-verify origin ":$branch" && \
    git branch -d "$branch" && \
    git checkout develop
  else
    echo 'On branch develop, nothing to do.'
  fi
}

# FF Merge a PR branch into master and delete it
function gprbdonem() {
  local branch="`git rev-parse --abbrev-ref HEAD`"

  if [[ "$branch" != 'master' ]]; then
    git push --no-verify -f origin HEAD && \
    git checkout master && \
    git pull origin master && \
    git merge --ff-only "$branch" && \
    git push --no-verify origin master && \
    git push --no-verify origin ":$branch" && \
    git branch -d "$branch" && \
    git checkout master
  else
    echo 'On branch master, nothing to do.'
  fi
}

# docker alises

# enforce a tag name
alias dbuild='docker build --no-cache -t'
alias dims='docker images'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias drmi='docker rmi'
alias drmir='docker rmi -f `docker images | grep "^<none>" | sed "s|^<none>\s*<none>\s*||" | sed "s| \s*.*$||"`'
# Remove all containers with a randomly assigned name I.E. a name with "_" in it
# This is useful if you avoid "_" when naming your containers with the "--name" option
alias drmr='docker rm --force `docker ps -a --format="{{ .Names }}" | grep "_"`'
alias ddrun='docker run -d'
alias drun='docker run'
alias dstop='docker stop -t 0'

# git aliases
alias gammend='git commit --no-verify --amend --no-edit'
alias gc='git commit'
alias gco='git checkout'
alias gca='git add --all :/;git commit --no-verify'
alias gfe='git fetch'
alias gfpu='git push -f origin HEAD;git push origin --tags'
alias glo='git log'
alias gpl='git pull'
alias gpu='git push --no-verify origin HEAD;git push --no-verify origin --tags'
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

function add_user_perms_to_dir_acl() {
  local user="$1"
  local perms="$2"
  local dir="$3"

  setfacl -R -m "u:$user:$perms" $dir
  setfacl -R -d -m "u:$user:$perms" $dir
}

##
# Orphans a snippet of bash in a new process by running it in a background
# process and disowning it.  It is important that you redirect stdout and
# stderr to avoid broken pipes.
function orphan() {
  bash -c "$1" &
  disown $!
}

##
# This is primarily used for PS1.
#
# Outputs " @ hostnam" if hostname doesn't contain "local".
# Outputs " (branch-name)" when PWD is in a git repo.
# Also runs `nvm use` if `.nvmrc` exists and `node --version` isn't equal to it's
# contents.
function bash_bootstrap_ps1_extras() {
  local hostName="`hostname`"
  local branch="`git rev-parse --abbrev-ref HEAD 2> /dev/null`"

  if [ -z "`echo $hostName | grep local`" ]; then
    echo -n " @ ${hostName:0:7}"
  fi

  if [ -n "$branch" ]; then
    echo -n " ($branch)"
  fi
}

export PS1="\e[0;33m\W\e[0m\[\033[32m\]\$(bash_bootstrap_ps1_extras)\[\033[00m\] $ "
export PS2=""
export PROMPT_COMMAND='echo -ne "\033]0;${USER} ${PWD} `history 1 | cut -c 8-`\007"'
