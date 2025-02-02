-- Set highlight on search
vim.o.hlsearch = true
vim.o.inccommand = 'nosplit'

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme
vim.o.termguicolors = true

-- Indentation
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true -- expand tab to spaces
vim.opt.smartindent = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-------------------------------------------------------------------------
-- Ruby indentation
-------------------------------------------------------------------------
vim.cmd('let g:ruby_indent_access_modifier_style = "indent"')
vim.cmd('let g:indent_guides_start_level = 2')
vim.cmd('let g:indent_guides_guide_size = 1')
vim.cmd('let g:ruby_indent_block_style = "do"')

-------------------------------------------------------------------------
-- Rename
-------------------------------------------------------------------------

function rename()
  local old_name = vim.fn.expand('%')
  local new_name = vim.fn.input('New file name: ', old_name, 'file')
  if new_name ~= '' and new_name ~= old_name then
    vim.print(old_name .. ' => ' .. new_name)
    vim.cmd('saveas ' .. new_name)
    vim.cmd('silent !rm ' .. old_name)
    vim.cmd('bd ' .. old_name)
    vim.cmd("redraw!")
  end
end

vim.keymap.set('n', '<leader>n', rename, { noremap = true })

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
