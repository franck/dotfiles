vim.cmd('let g:VimuxOrientation = "h"')
vim.cmd('let g:VimuxHeight = "50"')

vim.cmd('let test#strategy = "vimux"')
vim.keymap.set('n', '<leader>T', ':TestNearest<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>t', ':TestFile<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>a', ':TestSuite<cr>', { noremap = true, silent = true })

vim.cmd([[
function! PromoteToLet()
  :normal! dd
  " :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()
:map <leader>p :PromoteToLet<cr>
]])
