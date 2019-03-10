""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=","

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
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

" rocket launch
nnoremap <leader>l :ls<cr>:b<space>

" snipMate mappings
imap <S-Tab> <Plug>snipMateNextOrTrigger
smap <S-Tab> <Plug>snipMateNextOrTrigger

" reindent
map <leader>i mzgg=G`z<CR>

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

" insert <%= %> and <% %> for ERB file
nmap <leader>+ i<C-x>=
nmap <leader>- i<C-x>-
imap ,- <C-x>-
imap ,+ <C-x>=

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>n :call RenameFile()<cr>
