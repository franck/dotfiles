-------------------------------------------------------------------------
-- Surround
-------------------------------------------------------------------------

vim.g.surround_no_mappings = 1

vim.keymap.set('n', 'yss', '<Plug>Yssurround')
vim.keymap.set('n', 'ds', '<Plug>Dsurround')
vim.keymap.set('n', 'ys', '<Plug>Ysurround')
vim.keymap.set('n', 'ys', '<Plug>Ysurround')
vim.keymap.set('n', 'yS', '<Plug>YSurround')
vim.keymap.set('n', 'yss', '<Plug>Yssurround')
vim.keymap.set('n', 'ySs', '<Plug>YSsurround')
vim.keymap.set('n', 'ySS', '<Plug>YSsurround')
vim.keymap.set('v', 'S', '<Plug>VSurround', { noremap = true })
vim.keymap.set('v', 'S', '<Plug>VSurround')
vim.keymap.set('x', 'gS', '<Plug>VgSurround')
vim.keymap.del('n', 'cs')
vim.keymap.del('n', 'cS')
