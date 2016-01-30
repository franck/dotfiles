. ~/bin/bash_colors.sh

platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
   platform='mac'
fi

# Git prompt components
GIT_PS1_SHOWDIRTYSTATE=1 
GIT_PS1_SHOWSTASHSTATE=1 
GIT_PS1_SHOWUNTRACKEDFILES=1
function minutes_since_last_commit {
    now=`date +%s`
    last_commit=`git log --pretty=format:'%at' -1`
    seconds_since_last_commit=$((now-last_commit))
    minutes_since_last_commit=$((seconds_since_last_commit/60))
    echo $minutes_since_last_commit
}
grb_git_prompt() {
    local g="$(__gitdir)"
    if [ -n "$g" ]; then
        local MINUTES_SINCE_LAST_COMMIT=`minutes_since_last_commit`
        if [ "$MINUTES_SINCE_LAST_COMMIT" -gt 30 ]; then
            local COLOR=${RED}
        elif [ "$MINUTES_SINCE_LAST_COMMIT" -gt 10 ]; then
            local COLOR=${YELLOW}
        else
            local COLOR=${GREEN}
        fi
        local SINCE_LAST_COMMIT="${COLOR}$(minutes_since_last_commit)m${NORMAL}"
        # The __git_ps1 function inserts the current git branch where %s is
        local GIT_PROMPT=`__git_ps1 "(%s|${SINCE_LAST_COMMIT})"`
        # local GIT_PROMPT=`__git_ps1`
        echo ${GIT_PROMPT}
    fi
}
git_branch() {
  local g="$(__gitdir)"
  if [ -n "$g" ]; then
    local GIT_PROMPT=`__git_ps1`
    echo ${GIT_PROMPT}
  fi
}


PS1="\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$(git_branch) "
source ~/bin/git-completion.bash

# Add paths that should have been there by default
export PATH="$HOME/bin:$PATH"
export SHELL=/bin/bash
export EDITOR=vim
#export EDITOR=vi crontab -e
alias crontab="VIM_CRONTAB=true crontab"

# Unbreak broken, non-colored terminal
export TERM='xterm-color'
alias ls='ls -G'
alias ll='ls -lG'
#export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export LSCOLORS="Exfxcxdxbxegedabagacad"
export GREP_OPTIONS="--color"

# Erase duplicates in history
export HISTCONTROL=erasedups
# Store 10k history entries
export HISTSIZE=10000
# Append to the history file when exiting instead of overwriting it
shopt -s histappend
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# aliases
alias be="bundle exec"
alias vi="vim"
alias s="cd .."
alias ll="ls -l"
alias l="ls"
alias la="ls -a"
alias lp="ls -p"
alias h=history
alias ss="ruby script/server"
alias rspec="rspec -c"
alias rs="redis-server /usr/local/etc/redis.conf"
alias rmi="rake db:migrate & rake db:migrate RAILS_ENV='test'"
alias python="python3"

if [[ $platform ==  'mac' ]]; then
  if [ -f ~/.mac_profile ]; then
    source ~/.mac_profile
  fi
fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
