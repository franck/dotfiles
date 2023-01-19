require'hop'.setup()

vim.keymap.set('n', '<leader>j', '<cmd>HopWord<cr>', { noremap = true, silent = true })

vim.keymap.set('n', 'vo', function()
  vim.cmd([[:HopLineStart]])
  vim.schedule(function()
    vim.cmd([[normal! o]])
    vim.cmd([[startinsert]])
  end)
end, { noremap = true, silent = true })
