. ~/bin/bash_colors.sh

platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
   platform='mac'
fi

if [ -f ~/.bash_profile ]; then
  source ~/.bash_profile
fi

PS1='\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

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
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

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
