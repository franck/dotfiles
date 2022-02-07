" mac dependencies :
" brew install nvim
" brew install fd

set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent

set exrc
set guicursor=
set relativenumber

set hlsearch
set incsearch
set showmatch

set hidden
set noerrorbells
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set termguicolors
set scrolloff=8
set noshowmode
set completeopt=menuone
set signcolumn=yes

set cursorline

" " do not scan all includes files for autocompletion
setglobal complete-=i

" Disable cursor line highlighting in Insert mode
augroup aug_cursor_line
  au!
  au InsertEnter * setlocal nocursorline
  au InsertLeave * setlocal cursorline
augroup END

set cmdheight=2
set updatetime=50
set shortmess+=c

" make tab completion for files/buffers act like bash
set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " romplete files like a shell.


" :PlugInstall to install the following plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'
Plug 'gruvbox-community/gruvbox' 

Plug 'neovim/nvim-lspconfig'

Plug 'ervandew/supertab'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-endwise'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'

Plug 'sunaku/vim-ruby-minitest'
Plug 'thoughtbot/vim-rspec'

Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-sleuth'

Plug 'sheerun/vim-polyglot'

Plug 'SirVer/ultisnips'

Plug 'jgdavey/tslime.vim'

Plug 'slim-template/vim-slim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'
call plug#end()

colorscheme gruvbox
highlight Normal guibg=none

" Set syntax to scss if file.scss.css
au BufRead,BufNewFile *.scss.css set filetype=scss.css

let mapleader = ","

source ~/vimold/.vim/bepo.vim

" Telescope
" nnoremap <leader>o <cmd>Telescope find_files<cr>
" nnoremap <leader>l <cmd>Telescope buffers<cr>
" nnoremap <leader>f <cmd>Telescope live_grep<cr>

" Nvim config
nnoremap <leader>vr :edit ~/.config/nvim/init.vim<cr>
nnoremap <leader>vs :source ~/.config/nvim/init.vim<cr>

nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader><leader> <c-^>

" panes
nnoremap wo :only<cr>

" reindent
map <leader>i mzgg=G`z<CR>

" insert <%= %> and <% %> for ERB file
nmap <leader>+ i<C-x>=
nmap <leader>- i<C-x>-
imap ,- <C-x>-
imap ,+ <C-x>=

nmap <leader>t :Tmux 'bundle exec rspec %<CR>'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SNIPPET CONFIG
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-d>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippets"]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
nnoremap <leader>n :call RenameFile()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" REPLACE SEARCH 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" in visual mode, only replace the selection
" in normal mode, replace all occurences

function! ReplaceVisualSelection()
  let new_name = input('New value: ')
  exec ":'<,'>s//" . new_name . '/g'
endfunction
vnoremap <leader>r :call ReplaceVisualSelection()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Create parents directories on save
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function s:MkNonExDir(file, buf)
  if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
    let dir=fnamemodify(a:file, ':h')
    if !isdirectory(dir)
      call mkdir(dir, 'p')
    endif
  endif
endfunction
augroup BWCCreateDir
  autocmd!
  autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom surround mapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:surround_no_mappings=1
nmap yss <Plug>Yssurround
nmap ds  <Plug>Dsurround
nmap ys  <Plug>Ysurround
nmap yS  <Plug>YSurround
nmap yss <Plug>Yssurround
nmap ySs <Plug>YSsurround
nmap ySS <Plug>YSsurround
vnoremap S <Plug>VSurround
vmap S <Plug>VSurround
xmap gS  <Plug>VgSurround
if !exists("g:surround_no_insert_mappings") || ! g:surround_no_insert_mappings
  if !hasmapto("<Plug>Isurround","i") && "" == mapcheck("<C-S>","i")
    imap    <C-S> <Plug>Isurround
  endif
  imap      <C-G>s <Plug>Isurround
  imap      <C-G>S <Plug>ISurround
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS LINE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:airline_theme = 'bubblegum'
let g:airline_theme = 'deus'
let g:airline#extensions#tabline#enabled = 1



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TEST
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>tt :call RunTestFile()<cr>

" vim-rspec mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>T :call RunNearestSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
if filereadable("bin/rspec")
  let g:rspec_command = ':w|call Send_to_Tmux("\ntime spring rspec {spec}\n")'
elseif filereadable("tmp/test.txt")
  let g:rspec_command = ':w|call Send_to_Tmux("\nbundle exec rails test {spec}\n")'
else
  let g:rspec_command = ':w|call Send_to_Tmux("\nbundle exec rspec {spec}\n")'
endif

function! RunTestFile(...)
  if a:0
    let command_suffix = a:1
  else
    let command_suffix = ""
  endif

  " Run the tests for the previously-marked file.
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFile()
  elseif !exists("t:grb_test_file")
    return
  end
  call RunTests(t:grb_test_file . command_suffix)
endfunction

function! SetTestFile()
  " Set the spec file that tests will be run for.
  let t:grb_test_file=expand("%:p")
endfunction

function! RunTests(filename)
  " Write the file and run tests for the given filename
  :w
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  if filereadable("tmp/test.txt")
    exec ':w|call Send_to_Tmux("\ntime spring rails test ' . a:filename . '\n")'
  elseif filereadable("bin/rspec")
    exec ":!bin/rspec " . a:filename
  elseif filereadable("Gemfile")
    "exec ":!rake rspec " . a:filename
    exec ":!rspec " . a:filename
  else
    exec ":!rspec " . a:filename
  end
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FOLDING
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open/closes folds
nnoremap <space> za
set foldmethod=indent   " fold based on indent level

let g:ruby_indent_access_modifier_style="indent"
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:ruby_indent_block_style = 'do'

nmap Y yy

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ARROW KEYS ARE UNACCEPTABLE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PROMOTE VARIABLE TO RSPEC LET
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! PromoteToLet()
  :normal! dd
  " :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()
:map <leader>p :PromoteToLet<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" using VIM with crontab
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:if $VIM_CRONTAB == "true"
:set nobackup
:set nowritebackup
:endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LSP CONFIG
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
" Clear the search buffer when hitting return
function! MapCR()
  nnoremap <cr> :nohlsearch<cr>
endfunction
call MapCR()

" Fuzzy find
nnoremap <silent> <leader>o :Files<CR>
nnoremap <silent> <leader>O :Files!<CR>
nnoremap <leader>f :Rg<Space>
" rocket launch with fzf
nnoremap <silent> <leader>l :Buffers<CR>
