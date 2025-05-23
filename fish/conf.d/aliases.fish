# ALIASES
alias p="pulumi"
alias pu="pulumi up"

alias docked='docker run --rm -it -v $PWD:/rails -v ruby-bundle-cache:/bundle ghcr.io/rails/cli'

alias dock='docker run --rm -it -v $PWD:/rails -v ruby-bundle-cache:/bundle'
alias docker_exec_web='docker compose -f docker-compose.dev.yml exec web'
alias d='docker_exec_web'
alias holivia_debug='docker attach web'
alias hop='op run --env-file="./.env.1password" --'
alias hprod='hecs console -c prod -s worker'
alias hstaging='hecs console -c staging -s worker'
alias hfranck='hecs console -c franck -s worker'

alias rails-server='docker run --rm -it -v $PWD:/rails -v ruby-bundle-cache:/bundle -p 3000:3000 ghcr.io/rails/cli rails server'
alias rails-console='docker run --rm -it -v $PWD:/rails -v ruby-bundle-cache:/bundle ghcr.io/rails/cli rails console'
alias dhc='docker run --rm -it -v .:/rails -v ruby-bundle-cache:/bundle holivia-chat'
alias dhc-server='docker run --rm -it -v .:/rails -v ruby-bundle-cache:/bundle -p 3000:3000 holivia-chat rails server'

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
alias hstats="cd ~/webdesign/holivia/holivia_stats"
alias mgme="cd ~/webdesign/mgme/mgme"
alias hinfra="cd ~/webdesign/holivia/holivia_infra"
alias hdbt="cd ~/webdesign/holivia/dbt_holivia"
alias hchat="cd ~/webdesign/holivia/holivia_chat"
alias oneone="cd ~/webdesign/oneone"
alias hooked="cd ~/webdesign/hooked/hooked"
alias ho="holivia"
alias ngrok-holivia="ngrok http --region=eu --subdomain=holivia 3000"

alias meteo="curl -H 'Accept-Language: fr' wttr.in"

alias r="rails"
alias h="heroku"

alias ack="/usr/local/Cellar/ack/2.14/bin/ack"

alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
alias vi="nvim"
alias nv="NVIM_APPNAME=editorconfig nvim"

alias kibana="echo 'localhost:5601' && $HOME/webdesign/src/kibana/bin/kibana"
alias kb="$HOME/sandbox/src/kibana/bin/kibana"
alias kb7="$HOME/sandbox/src/kibana7/bin/kibana"
alias kb8="$HOME/sandbox/src/kibana8/bin/kibana"
alias elasticsearch="$HOME/sandbox/src/elasticsearch/bin/elasticsearch"
alias es="elasticsearch -d"
alias es2="$HOME/sandbox/src/elasticsearch2/bin/elasticsearch -d"
alias es5="$HOME/sandbox/src/es5/bin/elasticsearch -d"
alias es7="$HOME/sandbox/src/es7/bin/elasticsearch -d"
alias es8="$HOME/sandbox/src/es8/bin/elasticsearch -d"
alias logstash="$HOME/sandbox/src/logstash/bin/logstash"
alias filebeat="$HOME/sandbox/src/filebeat/filebeat"

alias ls="exa -al --color=always --group-directories-first"

# alias tmux="TERM=xterm-256color tmux"
# alias t="./.tmux"
alias t="./.tmux"

alias s="cd .."
alias la="ls -a"

alias rmi="rake db:migrate"

alias g="git"
alias gwip="gitupdate ."
alias glo="git log --online -10"

alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'
alias love="/Applications/love.app/Contents/MacOS/love"
alias pwg="pwgen -Bsncs 32 1 -r '\"\'\`' | head -c32;echo"
