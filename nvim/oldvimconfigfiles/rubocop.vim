""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUBOCOP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! RunCurrentFileRobocop()
  let filename = expand('%')
  exec ':w|call Send_to_Tmux("\nrubocop ' . filename . '\n")'
endfunction

function! RunRobocop()
  exec ':w|call Send_to_Tmux("\nrubocop\n")'
endfunction

map <leader>r :call RunCurrentFileRobocop()<cr>
map <leader>R :call RunRobocop()<cr>

