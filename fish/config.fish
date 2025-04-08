# ENV
set -x JAVA_HOME (/usr/libexec/java_home)
set -x OBJC_DISABLE_INITIALIZE_FORK_SAFETY 'YES'
set -x N_PREFIX $HOME/.n

# PATH
set PATH ./bin $PATH 
set PATH $N_PREFIX/bin:$PATH
set PATH $HOME/bin $PATH  
set PATH $PATH /opt/homebrew/bin
set PATH $PATH $HOME/.rvm/bin # Add RVM to PATH for scripting
set PATH $PATH $HOME/.docker/bin # Add Docker to PATH
set PATH $PATH $HOME/.ebcli-virtual-env/executables

rvm default
set -g fish_user_paths "/usr/local/opt/icu4c/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/icu4c/sbin" $fish_user_paths
source /Users/franck/.config/op/plugins.sh

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /Users/franck/anaconda3/bin/conda
    eval /Users/franck/anaconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/Users/franck/anaconda3/etc/fish/conf.d/conda.fish"
        . "/Users/franck/anaconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/Users/franck/anaconda3/bin" $PATH
    end
end
# <<< conda initialize <<<

