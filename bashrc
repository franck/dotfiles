. ~/bin/bash_colors.sh
source ~/.profile
if [ -f ~/.bash_profile ]
then
  source ~/.bash_profile
fi

# Add paths that should have been there by default
export PATH="~/bin:$PATH"
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
#PS1="\[\033[00;33m\]\w${NORMAL}\$(grb_git_prompt) \$ "
PS1="\[\033[00;33m\]\w${NORMAL}\$(git_branch) "
source ~/bin/git-completion.bash

# aliases

alias be="bundle exec"
alias vi="vim"
alias s="cd .."
alias ll="ls -l"
alias l="ls"
alias la="ls -a"
alias lp="ls -p"
alias h=history
alias ett="mate app public config lib vendor/assets db lang test spec stories features Gemfile Guardfile .rvmrc &"
alias ss="ruby script/server"
alias rspec="rspec -c"
alias rs="redis-server /usr/local/etc/redis.conf"
alias rmi="rake db:migrate & rake db:migrate RAILS_ENV='test'"
alias zs="zeus start"
alias python="python3"
