" " use % to jump between opening and closing keywords of ruby constructs
" " (module, class, methods, ...)
" runtime macros/matchit.vim

source ~/.vim/plugins.vim

" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " BASIC EDITING CONFIGURATION
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible " allow unsaved background buffers and remember marks/undo for them
syntax on " Enable highlighting for syntax
set hidden
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
" remember more commands and search history
set history=10000
set expandtab

" " do not scan all includes files for autocompletion
setglobal complete-=i

set tabstop=2
set shiftwidth=2
set softtabstop=2
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
set ttymouse=xterm2
" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase

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
set scrolloff=3
" Store temporary files in a central spot
set backup
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOR
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:set t_Co=256 " 256 colors
" :set background=dark
:color grb256
:let g:solarized_termcolors=256
" :colorscheme railscasts
:colorscheme solarized
" :colorscheme gruvbox
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
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Diff settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set diffopt=vertical,filler,context:3,indent-heuristic,algorithm:patience,internal

" Detect if vim is started as a diff tool (vim -d, vimdiff)
" NOTE: Does not work when you start Vim as usual and enter diff mode using :diffthis
if &diff
  let s:is_started_as_vim_diff = 1
  syntax off
  setlocal nospell
endif

augroup aug_diffs
  au!

  " Inspect whether some windows are in diff mode, and apply changes for such windows
  " Run asynchronously, to ensure '&diff' option is properly set by Vim
  au WinEnter,BufEnter * call timer_start(50, 'CheckDiffMode')

  " Highlight VCS conflict markers
  au VimEnter,WinEnter * if !exists('w:_vsc_conflict_marker_match') |
        \   let w:_vsc_conflict_marker_match = matchadd('ErrorMsg', '^\(<\|=\||\|>\)\{7\}\([^=].\+\)\?$') |
        \ endif
augroup END

" In diff mode:
" - Disable syntax highlighting
" - Disable spell checking
function CheckDiffMode(timer)
  let curwin = winnr()

  " Check each window
  for _win in range(1, winnr('$'))
    exe "noautocmd " . _win . "wincmd w"

    call s:change_option_in_diffmode('b:', 'syntax', 'off')
    call s:change_option_in_diffmode('w:', 'spell', 0, 1)
  endfor

  " Get back to original window
  exe "noautocmd " . curwin . "wincmd w"
endfunction

" Detect window or buffer local option is in sync with diff mode
function s:change_option_in_diffmode(scope, option, value, ...)
  let isBoolean = get(a:, "1", 0)
  let backupVarname = a:scope . "_old_" . a:option

  " Entering diff mode
  if &diff && !exists(backupVarname)
    exe "let " . backupVarname . "=&" . a:option
    call s:set_option(a:option, a:value, 1, isBoolean)
  endif

  " Exiting diff mode
  if !&diff && exists(backupVarname)
    let oldValue = eval(backupVarname)
    call s:set_option(a:option, oldValue, 1, isBoolean)
    exe "unlet " . backupVarname
  endif
endfunction

function s:set_option(option, value, ...)
  let isLocal = get(a:, "1", 0)
  let isBoolean = get(a:, "2", 0)
  if isBoolean
    exe (isLocal ? "setlocal " : "set ") . (a:value ? "" : "no") . a:option
  else
    exe (isLocal ? "setlocal " : "set ") . a:option . "=" . a:value
  endif
endfunction

nmap <expr> <Up> &diff ? '[czz' : '<Up>'
nmap <expr> <Down> &diff ? ']czz' : '<Down>'

" fold on indent
" augroup vimrc
"   au BufReadPre * setlocal foldmethod=indent
"   " uncomment to have fold method indent on opening and manual after
"   "au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
" augroup END

" Set syntax to scss if file.scss.css
au BufRead,BufNewFile *.scss.css set filetype=scss.css

source ~/.vim/mappings.vim

let keyboard = system('issw')

" source ~/.vim/bepo.vim
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
