. ~/bin/bash_colors.sh
source ~/.profile

# Add paths that should have been there by default
export PATH=${PATH}:/usr/local/bin:/usr/games/bin
export PATH="~/bin:$PATH"
export SHELL=/bin/bash
export EDITOR=vim
export NODE_PATH=$HOME/local/lib/node_modules

# needed for mysql2 gem in mac os
export DYLD_LIBRARY_PATH="/usr/local/mysql/lib:$DYLD_LIBRARY_PATH"
export VERSIONER_PYTHON_PREFER_32_BIT=yes

# Unbreak broken, non-colored terminal
export TERM='xterm-color'
alias ls='ls -G'
alias ll='ls -lG'
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
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
PS1="\[\033[00;33m\]\w${NORMAL}\$(grb_git_prompt) \$ "
source ~/bin/git-completion.bash

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
alias zz="bundle exec autotest"
alias rspec="rspec -c"
alias rs="redis-server /usr/local/etc/redis.conf"

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
