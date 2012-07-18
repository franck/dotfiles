PATH=$HOME/bin:/usr/local/bin:/usr/local/mysql/bin:./bin:$PATH

GIT_PS1_SHOWDIRTYSTATE=1 
GIT_PS1_SHOWSTASHSTATE=1 
GIT_PS1_SHOWUNTRACKEDFILES=1
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
WHITE="\[\033[0;37m\]"
#:/opt/nginx/sbin
# PS1="\w% "
source ~/bin/git-completion.bash
PS1="$RED\w$YELLOW\$(__git_ps1)$WHITE % "
#PS1="\w\$(__git_ps1)\$ "

PS1="$GREEN\$(~/.rvm/bin/rvm-prompt) $PS1" # add ruby version

#lsexport GEM_PATH=/Library/Ruby/Gems/1.8:$HOME/.gem/ruby/1.8

export HISTFILESIZE=10000
export HISTSIZE=10000
export PROMPT_COMMAND='history -a'
shopt -s histappend

# aliases
alias ne="cd $HOME/webdesign/neweureo/site"
alias ej="cd $HOME/webdesign/eurojob/rails3;r3"
alias eureo="cd $HOME/webdesign/eureo/site;r31"
alias mk="cd $HOME/webdesign/merrykitchen/site;r3"
alias mm="cd $HOME/webdesign/merrymenu/site;r3"
alias mb="cd $HOME/webdesign/merrybills/site;r3"
alias ce="cd $HOME/webdesign/newce/site;"
alias cf="cd $HOME/webdesign/cf/cf2010/trunk;"
alias defra="cd $HOME/webdesign/defra/site;"
alias ecj="cd $HOME/webdesign/eurochina/site;"
alias bm="cd $HOME/webdesign/business-mailer/site;r31"
alias community="cd $HOME/webdesign/community/site;r31"
alias jobsite="cd $HOME/webdesign/jobsite/site"
alias poids="cd $HOME/webdesign/courbepoids/site;rails server -p 3210"
alias backbone="cd $HOME/webdesign/sandbox/backbone;rvm use ruby-1.9.2@backbone"
alias barbier="cd $HOME/webdesign/barbier/site"
alias tbarbier="tmuxinator barbier"
alias tpoids="tmuxinator poids"
alias tjobsite="tmuxinator jobsite"
alias tfanpage="tmuxinator fanpage"

alias vi="vim"
alias s="cd .."
alias ll="ls -l"
alias l="ls"
alias la="ls -a"
alias lp="ls -p"
alias h=history
alias ett="mate app public config lib vendor/assets db lang test spec stories features Gemfile Guardfile .rvmrc &"
#alias ett="subl -n -w ."
alias ss="ruby script/server"
alias zz="bundle exec autotest"
alias rspec="rspec -c"

alias sftpce="sftp -oPort=32100 deploy@46.105.99.154"
alias sftpecj="sftp -oPort=32100 deploy@91.121.160.184"
alias sftpcf="sftp -oPort=32100 deploy@91.121.165.111"
alias sftpej="sftpcf"
alias sftpold="sftp -oPort=8888 franck@91.121.1.20"
alias sftpmerry="sftp -oPort=32100 deploy@91.121.0.126"
alias sftpit="sftp -oPort=32100 deploy@176.31.255.14"
alias sftpes="sftpit"

alias sshce="ssh deploy@46.105.99.154 -p 32100"
alias sshecj="ssh deploy@91.121.160.184 -p 32100"
alias sshcf="ssh deploy@91.121.165.111 -p 32100"
alias sshej="sshcf"
alias sshold="ssh franck@91.121.1.20 -p 8888"
alias sshfb="ssh -p 8888 eurojob-consulting.com -R :3001:127.0.0.1:3000 sleep 9999"
alias sshmerry="ssh deploy@91.121.0.126 -p 32100"
alias sshcairn="ssh cairnbri@cairnbridge.com"
alias sshit="ssh -p 32100 deploy@176.31.255.14"
alias sshes="sshit"

alias python="python3"
alias rails3="rvm ruby-1.9.2@rails3"
alias rails31="rvm ruby-1.9.2@rails31"
alias rubychef="rvm ruby-1.8.7-p299@chef; cd ~/webdesign/sandbox/chef/chef-repo"
alias r="rails"
alias r3="rails3"
alias r31="rails31"
alias shotgun="shotgun -I ."

alias tree="find . -print | sed -e 's;[^/]*/;|--;g;s;--|; |;g'"

# for pdftotext to not display Error message : "Error: No paper information available - using defaults"
export PAPERSIZE="a4"

export AUTOFEATURE=true autospec


if [[ -s "$HOME/.rvm/scripts/rvm" ]]  ; then source "$HOME/.rvm/scripts/rvm" ; fi


SHELL=/bin/bash

export VERSIONER_PYTHON_PREFER_32_BIT=yes
export EDITOR=vim
export PATH=$HOME/local/bin:$PATH
export NODE_PATH=$HOME/local/lib/node_modules
export DYLD_LIBRARY_PATH="/usr/local/mysql/lib:$DYLD_LIBRARY_PATH"
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

case "$TERM" in
  xterm-color) color_prompt=yes;;
esac

#CLICOLOR=1
#export LSCOLORS='gxfxcxdxbxegedabagacad'
#export TERM=xterm-color

export LS_OPTIONS='--color=auto'
export CLICOLOR='Yes'
export LSCOLORS='Exgxcxdxbxegedabagacad'
