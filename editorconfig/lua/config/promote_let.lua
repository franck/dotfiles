-------------------------------------------------------------------------
-- Promote To Let
-------------------------------------------------------------------------
function promoteToLet()
  vim.cmd(':normal! dd')
  vim.cmd(':normal! P')
  vim.cmd([[:.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/]])
  vim.cmd(':normal ==')
  vim.cmd(':normal o')
  vim.cmd(':normal s')
end

vim.keymap.set('n', '<leader>p', promoteToLet)
