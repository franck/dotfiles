vim.g.mapleader = ","
vim.keymap.set({ 'n', 'v' }, '<space>', '<Nop>', { silent = true })

-------------------------------------------------------------------------
-- Ragtag 
-------------------------------------------------------------------------

vim.keymap.set({ 'n', 'i' }, '<leader>-', '<%<Space><Space>%><Esc>2hi', { silent = true })
vim.keymap.set({ 'n', 'i' }, '<leader>+', '<%=<Space><Space>%><Esc>2hi', { silent = true })
vim.keymap.set({ 'n', 'i' }, '<leader>_', '<C-V><NL><Esc>I<%<Space><Esc>A<Space>%><Esc>F<NL>s', { silent = true })
