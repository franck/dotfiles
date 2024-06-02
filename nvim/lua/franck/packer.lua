vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- themes
  -- use({ 'rose-pine/neovim', as = 'rose-pine' })
  use { "catppuccin/nvim", as = "catppuccin" }
  use { "folke/tokyonight.nvim", as = "tokyonight" }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use { 'nvim-telescope/telescope-fzf-native.nvim', run =
  'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

  use('mbbill/undotree')

  use 'lewis6991/gitsigns.nvim'
  use('tpope/vim-fugitive')
  use('tpope/vim-commentary')

  -- LSP
  use({
    'neovim/nvim-lspconfig',
    requires = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'williamboman/nvim-lsp-installer',
      'lukas-reineke/lsp-format.nvim',
      'jose-elias-alvarez/null-ls.nvim',
      { 'j-hui/fidget.nvim', tag = 'legacy' },
    },
  })

  use('hrsh7th/cmp-buffer')
  use('rafamadriz/friendly-snippets')

  -- Autocompletion
  use({
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path'
    },
  })

  -- Copilot
  use { "zbirenbaum/copilot.lua" }

  use {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end
  }

  use 'nvim-lualine/lualine.nvim' -- Fancier statusline

  use 'tpope/vim-endwise'
  use 'tpope/vim-surround'
  use 'vim-ruby/vim-ruby'
  use 'tpope/vim-rails'

  use 'https://codeberg.org/esensar/nvim-dev-container'
end)
