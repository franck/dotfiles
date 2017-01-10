. ~/bin/bash_colors.sh

platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
   platform='mac'
fi


# source ~/.bash_prompt.old
source ~/.bash_prompt
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

if [ -f ~/.secret_env ]; then
  source ~/.secret_env
fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
