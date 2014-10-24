export RUBY_GC_HEAP_INIT_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

export PATH="/Users/franckdagostini/Library/Application Support/GoodSync":$PATH
export PATH=${PATH}:/usr/local/bin:/usr/games/bin:/usr/local/sbin

alias nginx_start="launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.nginx.plist"
alias nginx_stop="launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.nginx.plist"

export PHP_AUTOCONF="/usr/local/bin/autoconf"
export NODE_PATH=$HOME/local/lib/node_modules

# needed for mysql2 gem in mac os
export DYLD_LIBRARY_PATH="/usr/local/mysql/lib:$DYLD_LIBRARY_PATH"
export VERSIONER_PYTHON_PREFER_32_BIT=yes

# need for icu4c (chardetection gem)
export LDFLAGS="-L/usr/local/opt/icu4c/lib"
export CPPFLAGS="-I/usr/local/opt/icu4c/include"

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

alias tree="find . -print | sed -e 's;[^/]*/;|--;g;s;--|; |;g'"
