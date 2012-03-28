" Example Vim configuration.
" Copy or symlink to ~/.vimrc or ~/_vimrc.

set nocompatible                  " Must come first because it changes other options.

runtime! autoload/pathogen.vim
silent! call pathogen#runtime_append_all_bundles()

syntax on                         " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

runtime macros/matchit.vim        " Load the matchit plugin.

set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set backupdir=/tmp
set directory=/tmp
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location


" UNCOMMENT TO USE
set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
set expandtab                    " Use spaces instead of tabs
set autoindent

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

"some stuff to get the mouse going in term
set mouse=a
set ttymouse=xterm2

if has("gui_running")
  "tell the term has 256 colors
  set t_Co=256
  set guioptions-=L
  set guioptions-=r


  colorscheme railscasts
  set guitablabel=%M%t
  set lines=40
  set columns=115

  if has("gui_gnome")
    set term=gnome-256color
    colorscheme railscasts
    set guifont=Monospace\ Bold\ 12
  endif

  if has("gui_mac") || has("gui_macvim")
    set guifont=Menlo:h14
    " key binding for Command-T to behave properly
    " uncomment to replace the Mac Command-T key to Command-T plugin
    "macmenu &File.New\ Tab key=<nop>
    "map <D-t> :CommandT<CR>
    " make Mac's Option key behave as the Meta key
  endif

  if has("gui_win32") || has("gui_win32s")
    set guifont=Consolas:h12
    set enc=utf-8
  endif
else
  "set railscasts colorscheme when running vim in gnome terminal
  if $COLORTERM == 'gnome-terminal'
    set term=gnome-256color
    colorscheme railscasts
  else
    set t_Co=256
    colorscheme railscasts
  endif
endif

map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove

"Key mapping for textmate-like indentation
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

"key mapping for window navigation
map <C-v> <C-w>v
map <C-s> <C-w>s
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-Tab> <C-w>w

" Ragtag
map <C-<lt>> :echo 'Hello'



" Uncomment to use Jamis Buck's file opening plugin
map ff :FuzzyFinderTextMate<Enter>
" Controversial...swap colon and semicolon for easier commands
"nnoremap ; :
"nnoremap : ;

"vnoremap ; :
"vnoremap : ;

" Automatic fold settings for specific files. Uncomment to use.
"autocmd FileType ruby setlocal foldmethod=syntax
"autocmd FileType css  setlocal foldmethod=inden shiftwidth=2 tabstop=2

ab bo BufOnly


