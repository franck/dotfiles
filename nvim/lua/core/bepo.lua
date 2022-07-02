-------------------------------------------------------------------------
-- Bepo - bepo
-------------------------------------------------------------------------
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
vim.keymap.set('n', 'l', 'c', { noremap = true })
vim.keymap.set('n', 'L', 'C', { noremap = true })

-- until
vim.keymap.set('o', 'j', 't', { noremap = true })
vim.keymap.set('o', 'J', 'T', { noremap = true })

-- replace
vim.keymap.set('n', 'h', 'r', { noremap = true })

-- substitute
vim.keymap.set('n', 'k', 's', { noremap = true })

-- ease window manipulation
vim.keymap.set('n', 'w', '<C-w>', { noremap = true })
vim.keymap.set('n', 'W', '<C-w><C-w>', { noremap = true })
vim.keymap.set('n', 'wt','<C-w>j', { noremap = true })
vim.keymap.set('n', 'ws','<C-w>k', { noremap = true })
vim.keymap.set('n', 'wc','<C-w>h', { noremap = true })
vim.keymap.set('n', 'wr','<C-w>l', { noremap = true }) 
vim.keymap.set('n', 'wd','<C-w>c', { noremap = true }) -- close current window
vim.keymap.set('n', 'wo','<C-w>o', { noremap = true }) -- close all other windows
vim.keymap.set('n', 'w<SPACE>',':split<CR>', { noremap = true }) -- split horizontaly
vim.keymap.set('n', 'w<CR>',':vsplit<CR>', { noremap = true }) -- split verticaly

-- " <> directly
-- " ————————————
vim.keymap.set('n', '«','<', { noremap = true })
vim.keymap.set('n', '»','>', { noremap = true })

-- Arrow keys are unnacceptable
vim.keymap.set('', '<Left>', '<Nop>')
vim.keymap.set('', '<Right>', '<Nop>')
vim.keymap.set('', '<Up>', '<Nop>')
vim.keymap.set('', '<Down>', '<Nop>')

vim.keymap.set('', '<leader>s', ':w<CR>', { noremap = true })
vim.keymap.set('i', '<leader>s', '<esc>:w<CR>', { noremap = true })
vim.keymap.set('', '<leader>z', ':wq<cr>', { noremap = true })

-- NerdTree
vim.cmd('let NERDTreeMapOpenInTab = "\t"')

-- Escape
vim.keymap.set('i', 'ttt', '<esc>')

-- Follow link in help
vim.keymap.set('n', '<C-l>', '<C-]>')
