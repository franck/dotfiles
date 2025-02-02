require("config.opt")
require("config.lazy")
require("config.bepo")
require("config.folding")
require("config.promote_let")

vim.keymap.set('n', "<leader>X", ":%lua<CR>")
vim.keymap.set('n', "<leader>x", ":.lua<CR>")
vim.keymap.set('v', "<leader>x", ":lua<CR>")

-------------------------------------------------------------------------
-- Ragtag
-------------------------------------------------------------------------
vim.keymap.set({ 'n', 'i' }, '<leader>-', '<%<Space><Space>%><Esc>2hi', { silent = true })
vim.keymap.set({ 'n', 'i' }, '<leader>+', '<%=<Space><Space>%><Esc>2hi', { silent = true })
