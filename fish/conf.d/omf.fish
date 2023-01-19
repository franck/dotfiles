# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"


eval "$(/usr/local/bin/brew shellenv)"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish

set EDITOR "/usr/local/bin/nvim"
set GIT_EDITOR "/usr/local/bin/nvim"
set VISUAL "/usr/local/bin/nvim"

set fish_greeting ""

# PATH

set PATH ./bin $PATH 
set PATH $HOME/bin $PATH  
set PATH $PATH /opt/homebrew/bin
set PATH $PATH $HOME/.rvm/bin # Add RVM to PATH for scripting
set PATH $PATH $HOME/.ebcli-virtual-env/executables

# ENV

set -x JAVA_HOME (/usr/libexec/java_home)
set -x OBJC_DISABLE_INITIALIZE_FORK_SAFETY 'YES'

# ALIASES
 
alias fradeo="cd ~/webdesign/fradeo_web/fradeo"
alias jobday="cd ~/webdesign/jobday"
alias daphni="cd ~/webdesign/daphni/daphni"
alias blog="cd ~/webdesign/blog/blog"
alias configurator="cd ~/webdesign/configurator_web/configurator"
alias sumpps="cd ~/webdesign/sumpps_web/sumpps"
alias rpoc-bridge="cd ~/webdesign/egide/rpoc-bridge"
alias rpoc-web="cd ~/webdesign/egide/rpoc-web"
alias rweb="cd ~/webdesign/egide/rweb"
alias evenapi="cd ~/webdesign/egide/evenapi"
alias evendata="cd ~/webdesign/egide/evendata"
alias evenapiclient="cd ~/webdesign/egide/even-api-client"
alias kpdf="cd ~/webdesign/egide/k-pdf-web/k-pdf"
alias kpdfapiclient="cd ~/webdesign/egide/k-pdf-api-client"
alias kvisit="cd ~/webdesign/egide/kolimmo-visit"
alias kweb="cd ~/webdesign/egide/kolimmo-web"
alias aircall="cd ~/webdesign/aircall/web"
alias holivia="cd ~/webdesign/holivia/holivia_web"

alias meteo="curl -H 'Accept-Language: fr' wttr.in"

alias r="rails"
alias h="heroku"

alias ack="/usr/local/Cellar/ack/2.14/bin/ack"

alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
alias vi="nvim"

alias kibana="echo 'localhost:5601' && $HOME/webdesign/src/kibana/bin/kibana"
alias kb="$HOME/sandbox/src/kibana/bin/kibana"
alias elasticsearch="$HOME/sandbox/src/elasticsearch/bin/elasticsearch"
alias es="elasticsearch -d"
alias es2="$HOME/sandbox/src/elasticsearch2/bin/elasticsearch -d"
alias es5="$HOME/sandbox/src/es5/bin/elasticsearch -d"
alias logstash="$HOME/sandbox/src/logstash/bin/logstash"
alias filebeat="$HOME/sandbox/src/filebeat/filebeat"

alias ls="exa -al --color=always --group-directories-first"

# alias tmux="TERM=xterm-256color tmux"
# alias t="./.tmux"
alias t="open /Applications/Be\ Focused\ Pro.app && ./.tmux"

alias s="cd .."
alias la="ls -a"

alias rmi="rake db:migrate"

alias g="git"
alias gwip="gitupdate ."
alias glo="git log --online -10"


alias hstaging="ssh -i ~/.aws/holivia.pem ec2-user@15.188.142.111"
alias hprod="ssh -i ~/.aws/holivia.pem ec2-user@13.37.15.127"
alias hdemo="ssh -i ~/.aws/holivia.pem ec2-user@13.37.157.230"
alias hfeat="ssh -i ~/.aws/holivia.pem ec2-user@52.47.204.254"

alias love="/Applications/love.app/Contents/MacOS/love"
