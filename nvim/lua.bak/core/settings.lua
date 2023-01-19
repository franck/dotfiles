HOME = os.getenv("HOME")

-------------------------------------------------------------------------
-- Setting
-------------------------------------------------------------------------
vim.opt.encoding = "utf-8"

-- Indentation
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true -- expand tab to spaces
vim.opt.smartindent = true

-- Number
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'
vim.opt.nu = true

-- Search
vim.opt.hlsearch = true -- highlight all matches
vim.opt.incsearch = true -- highlight when typing the search pattern
vim.opt.showmatch = true -- when entering a bracket, briefly show the match if on screen
vim.opt.inccommand = 'split' -- show the effect off-screen in a preview window
vim.opt.smartcase = true

-- Basic settings
vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.wrap = false -- do not wrap text that is too long

-- Backup
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undodir = HOME .. '/.vim/undodir'
vim.opt.undofile = true

-- Other stuff
vim.opt.termguicolors = true
vim.opt.scrolloff = 8 -- how many lines above and below the cursor
vim.opt.showmode = false

vim.opt.cursorline = true

vim.opt.cmdheight = 2
vim.opt.updatetime = 300

-- make tab completion for files/buffers act like bash
vim.opt.wildmenu = true -- Enhanced command line completion.
vim.opt.wildmode = 'list:longest' -- complete files like a shell.

-- Open new split panes to right and bottom, which feels more natural
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.laststatus = 3 -- global status line

-- Leader
vim.g.mapleader = ','
