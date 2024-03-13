# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

set EDITOR "/usr/local/bin/nvim"
set GIT_EDITOR "/usr/local/bin/nvim"
set VISUAL "/usr/local/bin/nvim"

set fish_greeting ""

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish

eval "$(/usr/local/bin/brew shellenv)"

