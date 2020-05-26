# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish

set EDITOR "vim"

set fish_greeting ""

# PATH

set PATH $PATH ./bin
set PATH $PATH $HOME/bin 
set PATH $PATH $HOME/.rvm/bin # Add RVM to PATH for scripting

# ALIASES
 
alias fradeo="cd ~/webdesign/fradeo_web/fradeo"
alias configurator="cd ~/webdesign/configurator_web/configurator"

alias meteo="curl -H 'Accept-Language: fr' wttr.in"

alias r="rails"
alias h="heroku"

alias ack="/usr/local/Cellar/ack/2.14/bin/ack"

alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
alias vi="vim"

alias kibana="echo 'localhost:5601' && $HOME/webdesign/src/kibana/bin/kibana"
alias kb="$HOME/sandbox/src/kibana/bin/kibana"
alias elasticsearch="$HOME/sandbox/src/elasticsearch/bin/elasticsearch"
alias es="elasticsearch -d"
alias es2="$HOME/sandbox/src/elasticsearch2/bin/elasticsearch -d"
alias logstash="$HOME/sandbox/src/logstash/bin/logstash"

alias ls="exa -al --color=always --group-directories-first"

alias tmux="TERM=xterm-256color tmux"
alias t=./.tmux

alias s="cd .."
alias la="ls -a"
