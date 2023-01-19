" :PlugInstall to install the following plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'gruvbox-community/gruvbox' 
Plug 'crusoexia/vim-monokai'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-endwise'
Plug 'jiangmiao/auto-pairs'
Plug 'akinsho/bufferline.nvim'

Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-sleuth'
Plug 'pangloss/vim-javascript'
Plug 'crusoexia/vim-javascript-lib'

" Plug 'thoughtbot/vim-rspec'
" Plug 'jgdavey/tslime.vim'

Plug 'vim-test/vim-test'
Plug 'preservim/vimux'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'nvim-lua/plenary.nvim'
" Plug 'neovim/nvim-lspconfig'
" Plug 'ervandew/supertab'
" Plug 'sunaku/vim-ruby-minitest'
" Plug 'sheerun/vim-polyglot'
Plug 'SirVer/ultisnips'
" Plug 'slim-template/vim-slim'

Plug 'preservim/nerdtree'

Plug 'fladson/vim-kitty'
Plug 'lewis6991/gitsigns.nvim'

" Telescope :
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'

Plug 'voldikss/vim-floaterm'
call plug#end()

