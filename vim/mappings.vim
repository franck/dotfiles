""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=","

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
" Can't be bothered to understand ESC vs <c-c> in insert mode
imap <C-c> <esc>
imap jk <esc>
imap kj <esc>
" Clear the search buffer when hitting return
function! MapCR()
  nnoremap <cr> :nohlsearch<cr>
endfunction
call MapCR()

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" swith current buffer and last opened buffer
nnoremap <leader><leader> <c-^>

nnoremap j gj
nnoremap k gk

cnoremap <C-a> <Home>

nnoremap <leader>l :ls<cr>:b<space>

" snipMate mappings
imap <S-Tab> <Plug>snipMateNextOrTrigger
smap <S-Tab> <Plug>snipMateNextOrTrigger

" reindent
map <leader>i mzgg=G`z<CR>

" jump to tag (ctags) : ctags -R .
nnoremap <leader>j <C-]>
nnoremap <leader>b <C-O>

" Open vimrc in a new split window
nmap <leader>vr :vsp $MYVIMRC<cr>
" Compile vimrc file
nmap <leader>so :source $MYVIMRC<cr>

" Rails Vim shortcuts
nmap <leader>m :Emodel<Space>
nmap <leader>c :Econtroller<Space>
nmap <leader>v :Eview<Space>
nmap <leader>h :Ehelper<Space>

" Dont mess the indentation with pasting
function! PasteCode()
  set paste
  execute "normal! o\<esc>\"*\]p"
  set nopaste
endfunction

nmap <leader>pp :call PasteCode()<CR><leader>i

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAPS TO JUMP TO SPECIFIC COMMAND-T TARGETS AND FILES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>gr :topleft :split config/routes.rb<cr>
function! ShowRoutes()
  " Requires 'scratch' plugin
  :topleft 100 :split __Routes__
  " Make sure Vim doesn't write __Routes__ as a file
  :set buftype=nofile
  " Delete everything
  :normal 1GdG
  " Put routes output in buffer
  :0r! rake -s routes
  " Size window to number of lines (1 plus rake output length)
  :exec ":normal " . line("$") . _ "
  " Move cursor to bottom
  :normal 1GG
  " Delete empty trailing line
  :normal dd
endfunction
map <leader>gR :call ShowRoutes()<cr>
map <leader>ga :CommandTFlush<cr>\|:CommandT app/assets<cr>
map <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
map <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
map <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
map <leader>gh :CommandTFlush<cr>\|:CommandT app/helpers<cr>
map <leader>gl :CommandTFlush<cr>\|:CommandT lib<cr>
map <leader>gp :CommandTFlush<cr>\|:CommandT public<cr>
map <leader>gs :CommandTFlush<cr>\|:CommandT public/stylesheets/sass<cr>
map <leader>gf :CommandTFlush<cr>\|:CommandT features<cr>
map <leader>gg :topleft 100 :split Gemfile<cr>
map <leader>gt :CommandTFlush<cr>\|:CommandTTag<cr>
map <leader>f :CommandTFlush<cr>\|:CommandT<cr>
map <leader>F :CommandTFlush<cr>\|:CommandT %%<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>n :call RenameFile()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTAGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CtagsBundler()
  let ctag_cmd = ":!ctags -f \".git/bundletags\" --exclude=.git --exclude=log --languages=javascript,sql -R `bundle show --paths`"
  execute ctag_cmd
endfunction
nmap <leader>ct :call CtagsBundler()<cr>
set tags+=.git/bundletags



