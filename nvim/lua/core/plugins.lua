-- Plugins
--
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

-- Theme
Plug('catppuccin/nvim', { as = 'catppuccin' })
Plug 'EdenEast/nightfox.nvim'
Plug 'Avimitin/neovim-deus'
Plug('folke/tokyonight.nvim', { branch = 'main' })
Plug 'crusoexia/vim-monokai'
Plug 'tjdevries/colorbuddy.nvim'

-- Optimizer
Plug 'lewis6991/impatient.nvim'

-- Lua functions
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'

-- Tpope
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-sleuth'


-- Ruby
Plug 'vim-ruby/vim-ruby'

-- Icons
Plug 'kyazdani42/nvim-web-devicons'

-- Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'saadparwaiz1/cmp_luasnip'

-- Tree navigation
Plug 'preservim/nerdtree'

-- snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

-- Status bar
-- Plug 'feline-nvim/feline.nvim'
Plug 'nvim-lualine/lualine.nvim'

-- Autoclose tags
-- Plug 'windwp/nvim-ts-autotag'

-- Auto pairs
-- Plug 'windwp/nvim-autopairs'
Plug 'jiangmiao/auto-pairs'

-- Parenthesis highlighting
Plug 'p00f/nvim-ts-rainbow'

-- Test and Tmux
Plug 'vim-test/vim-test'
Plug 'preservim/vimux'

-- Syntax highlighting
Plug('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

-- Fuzzy finder
Plug 'nvim-telescope/telescope.nvim'
-- Plug('nvim-telescope/telescope-fzf-native.nvim', { run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' })
Plug('nvim-telescope/telescope-fzf-native.nvim', { run = 'make' })

-- Rg
Plug("junegunn/fzf", { run = ":call fzf#install()" })
Plug 'junegunn/fzf.vim'

-- Bufferline
Plug('akinsho/bufferline.nvim', { tag = 'v2.*' })

-- Motion
Plug 'phaazon/hop.nvim'

-- Formatting
Plug('jose-elias-alvarez/null-ls.nvim')

-- LSP
Plug('neovim/nvim-lspconfig')
Plug('williamboman/nvim-lsp-installer')
Plug('ray-x/lsp_signature.nvim')

vim.call('plug#end')


-------------------------------------------------------------------------
-- Telescope
-------------------------------------------------------------------------
require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    }
  }
}

require('telescope').load_extension('fzf')

-------------------------------------------------------------------------
-- Ruby indentation
-------------------------------------------------------------------------
-- let g:ruby_indent_access_modifier_style="indent"
-- let g:indent_guides_start_level=2
-- let g:indent_guides_guide_size=1
-- let g:ruby_indent_block_style = 'do'
vim.cmd('let g:ruby_indent_access_modifier_style = "indent"')
vim.cmd('let g:indent_guides_start_level = 2')
vim.cmd('let g:indent_guides_guide_size = 1')
vim.cmd('let g:ruby_indent_block_style = "do"')



-------------------------------------------------------------------------
-- Theme
-------------------------------------------------------------------------
-- vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
-- vim.cmd[[colorscheme catppuccin]]

-- vim.cmd[[colorscheme tokyonight]]

vim.cmd [[colorscheme nightfox]]
-- vim.cmd[[colorscheme terafox]]
--
-- vim.cmd[[colorscheme monokai]]
--
-- vim.cmd[[colorscheme deus]]
-- vim.g.deus_background = "mid"
