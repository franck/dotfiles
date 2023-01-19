set encoding=utf-8

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
set inccommand=split

set hidden
set noerrorbells
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set nowritebackup
set undodir=~/.vim/undodir
set undofile
set termguicolors
set scrolloff=8
set noshowmode
set completeopt=menuone

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
set updatetime=300
set shortmess+=c

" make tab completion for files/buffers act like bash
set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " romplete files like a shell.

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

colorscheme monokai
highlight Normal guibg=none

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS LINE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme = 'monokai'
let g:airline#extensions#tabline#enabled = 1

" Set syntax to scss if file.scss.css
au BufRead,BufNewFile *.scss.css set filetype=scss.css

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SNIPPET CONFIG
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippets"]

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

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
