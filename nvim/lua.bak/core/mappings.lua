-- Telescope mappings
vim.keymap.set('n', '<leader>o', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>O', ':Telescope oldfiles<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>f', ':Telescope live_grep<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>l', ':Telescope buffers<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader><space>', ':nohlsearch<CR>, { noremap = true }') -- disable search highlight
vim.keymap.set('n', '<leader><leader>', '<c-^>', { noremap = true }) -- back to previous buffer

vim.keymap.set('n', 'Y', 'yy')

-- reindent
vim.keymap.set('', '<leader>i', 'mzgg=G`z<CR>')

-- insert <%= %> and <% %> for ERB file
vim.keymap.set('n', ',+', 'i<C-V><NL><Esc>I<%=<Space><Esc>A<Space>%><Esc>F<NL>s')
vim.keymap.set('n', ',-', 'i<%<Space><Space>%><Esc>2hi')
vim.keymap.set('i', ',+', '<C-V><NL><Esc>I<%=<Space><Esc>A<Space>%><Esc>F<NL>s')
vim.keymap.set('i', ',-', '<%<Space><Space>%><Esc>2hi')

-------------------------------------------------------------------------
-- Folding
-------------------------------------------------------------------------
vim.opt.foldenable = true
vim.opt.foldlevelstart = 10
vim.opt.foldnestmax = 10
vim.keymap.set('n', '<space>', 'za', { noremap = true })
vim.opt.foldmethod = 'indent'

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

-------------------------------------------------------------------------
-- NERDTree
-------------------------------------------------------------------------
vim.keymap.set('', '<C-n>', ':NERDTree<CR>')
vim.keymap.set('', '<C-q>', ':NERDTreeToggle<CR>')
