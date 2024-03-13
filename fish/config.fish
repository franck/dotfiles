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
set PATH $PATH $HOME/.ebcli-virtual-env/executables

rvm default
set -g fish_user_paths "/usr/local/opt/icu4c/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/icu4c/sbin" $fish_user_paths
