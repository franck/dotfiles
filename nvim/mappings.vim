let mapleader = ","

" Telescope
nnoremap <leader>o <cmd>Telescope find_files<cr>
nnoremap <leader>O <cmd>Telescope oldfiles<cr>
" nnoremap <leader>f <cmd>Telescope live_grep<cr>
nnoremap <leader>l <cmd>Telescope buffers<cr>

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

nmap Y yy

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ARROW KEYS ARE UNACCEPTABLE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" Do not jump after search
nnoremap gd :keepjumps normal! mi*`i<CR>

" NERDTree
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Fuzzy find
" nnoremap <silent> <leader>o :GFiles<CR>
" nnoremap <silent> <leader>O :GFiles!<CR>
nnoremap <leader>f :Rg<Space>
" rocket launch with fzf
" nnoremap <silent> <leader>l :Buffers<CR>
"

let g:floaterm_width = 0.95
let g:floaterm_height = 0.95
nnoremap <leader>g :FloatermNew lazygit<CR>
