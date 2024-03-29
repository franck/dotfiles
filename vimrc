" " use % to jump between opening and closing keywords of ruby constructs
" " (module, class, methods, ...)
" runtime macros/matchit.vim

source ~/.vim/plugins.vim

" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " BASIC EDITING CONFIGURATION
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible " allow unsaved background buffers and remember marks/undo for them
syntax on " Enable highlighting for syntax
set noerrorbells
set hidden
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
" remember more commands and search history
set history=10000

" " do not scan all includes files for autocompletion
setglobal complete-=i

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:ruby_indent_access_modifier_style = 'indent'
let g:ruby_indent_block_style = 'do'
set laststatus=2
set showmatch
set incsearch
set hlsearch
set visualbell                    " No beeping.
"some stuff to get the mouse going in term
set mouse=a
" set ttymouse=xterm2
" make searches case-sensitive only if they contain upper-case characters
set smartcase

set guicursor=

" Highlight the line with a cursor
set cursorline

" Disable cursor line highlighting in Insert mode
augroup aug_cursor_line
  au!
  au InsertEnter * setlocal nocursorline
  au InsertLeave * setlocal cursorline
augroup END
set number                        " Show line numbers.
" set relativenumber
" silent! set relativenumber
set ruler                         " Show cursor position.
set cmdheight=2
set switchbuf=useopen
set numberwidth=5
set showtabline=2
set winwidth=79
" This makes RVM work inside Vim. I have no idea why.
set shell=bash
" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=
" keep more context when scrolling off the end of a buffer
set scrolloff=8
" Store temporary files in a central spot
set noswapfile
set nobackup
set nowritebackup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
" display incomplete commands
set showcmd
" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on
" make tab completion for files/buffers act like bash
set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " romplete files like a shell.
set title                         " Set the terminal's title

" COC suggestion
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
set updatetime=50

if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOR
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:set t_Co=256 " 256 colors
" :color grb256
:let g:solarized_termcolors=256
" :colorscheme railscasts
" :colorscheme solarized

let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection = '0'

:colorscheme gruvbox
:set background=dark
" :colorscheme monokai
" :colorscheme smyck

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS LINE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FOLDING
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open/closes folds
nnoremap <space> za
set foldmethod=indent   " fold based on indent level

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" function! InsertTabWrapper()
"   let col = col('.') - 1
"   if !col || getline('.')[col - 1] !~ '\k'
"     return "\<tab>"
"   else
"     return "\<c-p>"
"   endif
" endfunction
" inoremap <tab> <c-r>=InsertTabWrapper()<cr>
" inoremap <s-tab> <c-n>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ARROW KEYS ARE UNACCEPTABLE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

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
" Use Silver Bullet for Ack plugin if available
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
endif


" Set syntax to scss if file.scss.css
au BufRead,BufNewFile *.scss.css set filetype=scss.css

source ~/.vim/mappings.vim

let keyboard = system('issw')

source ~/.vim/bepo.vim
source ~/.vim/test.vim


" Custom surround mapping
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


" Create parents directories on save
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


" " Python Setting {
" if has('python3')
"   silent! python3 1
"   set pythondll=/usr/local/Frameworks/Python.framework/Versions/3.7/Python
"   set pythonhome=/usr/local/Frameworks/Python.framework/Versions/3.7
"   set pythonthreedll=/usr/local/Frameworks/Python.framework/Versions/3.7/Python
"   set pythonthreehome=/usr/local/Frameworks/Python.framework/Versions/3.7
" endif
" " }
