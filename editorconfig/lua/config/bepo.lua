-- Bepo

-- Move
vim.keymap.set('', 'c', 'h', { noremap = true })
vim.keymap.set('', 'r', 'l', { noremap = true })
vim.keymap.set('', 't', 'j', { noremap = true })
vim.keymap.set('', 's', 'k', { noremap = true })

-- remap W with É
vim.keymap.set('', 'é', 'w', { noremap = true })
vim.keymap.set('', 'É', 'W', { noremap = true })

-- dié => diw : delete word under cursor
-- daé => daw : delete word under cursor and space until next word
vim.keymap.set('o', 'aé', 'aw', { noremap = true })
vim.keymap.set('o', 'aÉ', 'aW', { noremap = true })
vim.keymap.set('o', 'ié', 'iw', { noremap = true })
vim.keymap.set('o', 'iÉ', 'iW', { noremap = true })
-- change
vim.keymap.set('', 'l', 'c', { noremap = true })
vim.keymap.set('', 'L', 'C', { noremap = true })

-- join
vim.keymap.set('', 'T', 'J')
vim.keymap.set('', 'S', 'K')

-- until
vim.keymap.set('', 'j', 't', { noremap = true })
vim.keymap.set('', 'J', 'T', { noremap = true })

-- replace
vim.keymap.set({ 'n', 'v' }, 'h', 'r', { noremap = true })

-- substitute
vim.keymap.set('n', 'k', 's', { noremap = true })

-- Save
vim.keymap.set('', '<leader>s', ':w<cr>', { noremap = true })
vim.keymap.set('i', '<leader>s', '<esc>:w<cr>', { noremap = true })
vim.keymap.set('', '<leader>z', ':wq<cr>', { noremap = true })

-- Y => yank whole line
vim.keymap.set('n', 'Y', 'yy')

-- ease window manipulation
vim.keymap.set('n', 'w', '<C-w>', { noremap = true })
vim.keymap.set('n', 'W', '<C-w><C-w>', { noremap = true })
vim.keymap.set('n', 'wt','<C-w>j', { noremap = true })
vim.keymap.set('n', 'ws','<C-w>k', { noremap = true })
vim.keymap.set('n', 'wc','<C-w>h', { noremap = true })
vim.keymap.set('n', 'wr','<C-w>l', { noremap = true })
vim.keymap.set('n', 'wd','<C-w>c', { noremap = true }) -- close current window
vim.keymap.set('n', 'wo','<C-w>o', { noremap = true }) -- close all other windows
vim.keymap.set('n', 'w<space>',':split<cr>', { noremap = true }) -- split horizontaly
vim.keymap.set('n', 'w<cr>',':vsplit<cr>', { noremap = true }) -- split verticaly

-- reindent
vim.keymap.set('n', '<leader>i', 'mzgg=G`z<CR>')
vim.keymap.set('n', '<leader><space>', ':nohlsearch<CR>', { noremap = true }) -- disable search highlight
vim.keymap.set('n', '<leader><leader>', '<c-^>', { noremap = true }) -- back to previous buffer

-- search current word without moving
vim.keymap.set('n', '*', '*``', { noremap = true })
vim.keymap.set('n', 'gd', '*``', { noremap = true })

-- <C-k] go to tag
-- <C-o> to go back
vim.keymap.set('n', "<C-k>", "<C-]>")
