""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VUNBLE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" :PluginInstall  => Install plugins
" :PluginList     => List plugins

" Fugitive is a Git wrapper
" Glog
Plugin 'tpope/vim-fugitive'

" Fuzzy search 
" need to install 'ag' utility for better perf, $brew install the_silver_searcher / apt-get install silversearcher-ag
" C-p
" Plugin 'kien/ctrlp.vim'

" ysiw<strong> => <strong>test</strong>
Plugin 'tpope/vim-surround'

" supercharge the '.' command to repeat a surround for instance
" Plugin 'tpope/vim-repeat'

" VIM RAILS
" :A                  => open alternate file (spec for model, etc.)
" :Emodel <tab>       => Tab complete to open model by name 
" :Eview <tab>        => Tab complete to open model by name 
" :Econtroller <tab>  => Tab complete to open model by name 
" replace E by V, S or T to open in split or tab
"
" :Rails console      => launch console
" <visual> :Rextract filename => put visual selection inside a details
" :h rails<cr> for more
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rvm'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-sleuth'

" Collection of languages pack : syntax, indent
Plugin 'sheerun/vim-polyglot'

" gcc     => comment current linge
" gcip    => comment inside paragraph
" Plugin 'tpope/vim-commentary'
Plugin 'file:///Users/franck/sandbox/src/vim-commentary'

" Auto pairing brackets, quotes, ...
Plugin 'jiangmiao/auto-pairs'

" add end after if
Plugin 'tpope/vim-endwise'

" insert <%= %> or <% %>
" INSERT MODE : 
" C-x =     => <%= %>
" C-x -     => <% %>
Plugin 'tpope/vim-ragtag'

" SNIPMATE
" S-tab to complete
" INSERT MODE : letters<C-r>Tab to see what's available.
" Ex: exp<C-r>Tab => exp, expb, experr
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
" optional
Plugin 'honza/vim-snippets'

" add r and stands for 'ruby-block' so you could do :
" dar     => delete around ruby-block
" dir     => delete inside ruby-block
" var     => visual select around ruby-block
" Plugin 'kana/vim-textobj-user'
" Plugin 'rhysd/vim-textobj-ruby'

" Coffeescript support
" Plugin 'kchmck/vim-coffee-script'

" Plugin 'sunaku/vim-ruby-minitest'
Plugin 'thoughtbot/vim-rspec'

" Run specs async
" Plugin 'tpope/vim-dispatch'
Plugin 'jgdavey/tslime.vim'
Plugin 'szw/vim-maximizer'

" :Ack pattern
" Plugin 'mileszs/ack.vim'

" vim-searchindex
" show number of occurance and current occurance index in commandline
" Plugin 'google/vim-searchindex'

" Plugin 'lyokha/vim-xkbswitch'

" Plugin 'rizzatti/dash.vim'

" NerdTree
" Plugin 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required:
filetype plugin indent on    " required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make CtrlP use ag for listing the files. Way faster and no useless files.
" let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
" let g:ctrlp_use_caching = 0
" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_map = '<leader>h'
"

autocmd FileType ruby let b:dispatch = 'rspec %'


