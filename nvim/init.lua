-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'

  use { -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  requires = {
    -- Automatically install LSPs to stdpath for neovim
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'williamboman/nvim-lsp-installer',

    -- Useful status updates for LSP
    'j-hui/fidget.nvim',
  },
}

use 'hrsh7th/cmp-buffer'

use 'rafamadriz/friendly-snippets'

-- Autocompletion
use {
  'hrsh7th/nvim-cmp',
  requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path' },
}

-- Highlight, edit, and navigate code
use {
  'nvim-treesitter/nvim-treesitter',
  run = function()
    pcall(require('nvim-treesitter.install').update { with_sync = true })
  end,
}

-- Additional text objects via treesitter
use {
  'nvim-treesitter/nvim-treesitter-textobjects',
  after = 'nvim-treesitter',
}

-- Git related plugins
use 'tpope/vim-fugitive'
use 'tpope/vim-rhubarb'
use 'lewis6991/gitsigns.nvim'

use 'navarasu/onedark.nvim' -- Theme inspired by Atom
use 'nvim-lualine/lualine.nvim' -- Fancier statusline
use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
use 'tpope/vim-endwise'
use 'tpope/vim-surround'
-- use 'jiangmiao/auto-pairs'
use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically
use 'tpope/vim-eunuch' -- :Move, :Mkdir
use 'jghauser/mkdir.nvim'

use 'vim-ruby/vim-ruby'
use 'tpope/vim-rails'

use { "zbirenbaum/copilot.lua" }

use {
 "zbirenbaum/copilot-cmp",
 after = { "copilot.lua" },
 config = function ()
   require("copilot_cmp").setup()
 end
}

-- Fuzzy Finder (files, lsp, etc)
use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }

-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

-- Add custom plugins to packer from ~/.config/nvim/lua/custom/plugins.lua
local has_plugins, plugins = pcall(require, 'custom.plugins')
if has_plugins then
  plugins(use)
end

if is_bootstrap then
  require('packer').sync()
end
end)

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})

-- copilot
require("copilot").setup({
  suggestion = { enabled = false },
  panel = { enabled = false },
})

-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = true
vim.o.inccommand = true

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
vim.cmd [[colorscheme onedark]]

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

-------------------------------------------------------------------------
-- Folding
-------------------------------------------------------------------------
vim.opt.foldenable = true
vim.opt.foldlevelstart = 10
vim.opt.foldnestmax = 10
vim.keymap.set('n', '<space>', 'za', { noremap = true })
vim.opt.foldmethod = 'indent'

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

-- Set lualine as statusline
-- See `:help lualine.txt`
require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'onedark',
    component_separators = '|',
    section_separators = '',
  },
}

-- Enable Comment.nvim
require('Comment').setup()

-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
require('indent_blankline').setup {
  char = '┊',
  show_trailing_blankline_indent = false,
}

-- Gitsigns
-- See `:help gitsigns.txt`
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    }
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>l', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>v', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'typescript', 'help', 'swift' },

  highlight = { enable = false },
  indent = { enable = false },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<c-backspace>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
}

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, 'Rename')
  nmap('<leader>ca', vim.lsp.buf.code_action, 'Code Action')

  nmap('gd', vim.lsp.buf.definition, 'Goto Definition')
  nmap('gr', require('telescope.builtin').lsp_references, 'Goto References')
  nmap('gI', vim.lsp.buf.implementation, 'Goto Implementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type Definition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, 'Document Symbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Workspace Symbols')
  nmap('<leader>qf', require('telescope.builtin').quickfix, 'Workspace Symbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    if vim.lsp.buf.format then
      vim.lsp.buf.format()
    elseif vim.lsp.buf.formatting then
      vim.lsp.buf.formatting()
    end
  end, { desc = 'Format current buffer with LSP' })
end

-- Setup mason so it can manage external tooling
require('mason').setup()

-- Enable the following language servers
-- Feel free to add/remove any LSPs that you want here. They will automatically be installed
local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver', 'sumneko_lua', 'gopls',  }

-- Ensure the servers above are installed
require('mason-lspconfig').setup {
  ensure_installed = servers,
}

-- require'lspconfig'.rubocop.setup{}

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

for _, lsp in ipairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end


-- Turn on lsp status information
require('fidget').setup()

-- Example custom configuration for lua
--
-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

require('lspconfig').sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = { library = vim.api.nvim_get_runtime_file('', true) },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = { enable = false },
    },
  },
}


-- nvim-cmp setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'
local cmp_buffer = require('cmp_buffer')

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-F>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    -- ['<S-Tab>'] = cmp.mapping(function(fallback)
    --   if cmp.visible() then
    --     cmp.select_prev_item()
    --   elseif luasnip.jumpable(-1) then
    --     luasnip.jump(-1)
    --   else
    --     fallback()
    --   end
    -- end, { 'i', 's' }),
  },
  sources = {
    { name = "copilot" },
    { name = 'luasnip' },
    {
      name = 'buffer',
      option = {
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end
      }
    },
    { name = 'nvim_lsp' },
  },
  sorting = {
    comparators = {
      function(...) return cmp_buffer:compare_locality(...) end,
    }
  }
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

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

-- Follow link in help
vim.keymap.set('n', '<C-l>', '<C-]>')

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
-- Ruby indentation
-------------------------------------------------------------------------
vim.cmd('let g:ruby_indent_access_modifier_style = "indent"')
vim.cmd('let g:indent_guides_start_level = 2')
vim.cmd('let g:indent_guides_guide_size = 1')
vim.cmd('let g:ruby_indent_block_style = "do"')


-------------------------------------------------------------------------
-- Snippets
-------------------------------------------------------------------------
local luasnip_status_ok, ls = pcall(require, "luasnip")
if not luasnip_status_ok then
  return
end

local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

local fmt = require('luasnip.extras.fmt').fmt

-------------------------------------------------------------------------
-- All Snippets
-------------------------------------------------------------------------

local date = function() return { os.date('%d-%m-%Y') } end

ls.add_snippets(nil, {
  all = {
    snip({
      trig = "date",
      namr = "Date",
      dscr = "Date in the form of DD-MM-YYYY",
    }, {
      func(date, {})
    }),
  },
})


-------------------------------------------------------------------------
-- Ruby Snippet
-------------------------------------------------------------------------
-- ls.add_snippets('eruby', { })

ls.add_snippets('ruby', {

  -- Before
  snip({
    trig = "bef",
    namr = "Before",
    dscr = "Super simple before end block",
  }, fmt([[
  before do
  {}
end
]],
{
  insert(0),
}
)),

-- New rails spec rspec
snip({
  trig = "desc",
  namr = "New rails spec",
  dscr = "New describe",
}, fmt([[
require 'rails_helper'

describe {} do
{}
end
]],
{
  insert(1),
  insert(0),
}
)),

-- New rails feature spec
snip({
  trig = "feat",
  namr = "New rails feature spec",
  dscr = "New feature",
}, fmt([[
require 'rails_helper'

feature "{}" do
{}
end
]],
{
  insert(1),
  insert(0),
}
)),

-- Describe
snip({
  trig = "des",
  namr = "Describe",
  dscr = "Super simple describe block",
}, fmt([[
describe '{}' do
{}
end
]],
{
  insert(1),
  insert(0),
}
)),

-- Context
snip({
  trig = "con",
  namr = "Context block",
  dscr = "Super simple context block",
}, fmt([[
context '{}' do
{}
end
]],
{
  insert(1),
  insert(0),
}
)),

-- it
snip({
  trig = "it",
  namr = "It block",
  dscr = "Super simple it block",
}, fmt([[
it '{}' do
{}
end
]],
{
  insert(1),
  insert(0),
}
)),

-- Save and open page
snip({
  trig = "sop",
  namr = "Save and open page",
  dscr = "Lunchy gem helper",
}, text('save_and_open_page')),

-- Byebug
snip({
  trig = "bb",
  namr = "Byebug",
}, text('byebug')),

-- expect(page).to have_content
snip({
  trig = "ept",
  namr = "expect(page).to have_content",
  dscr = "Capybara matcher",
}, fmt("expect(page).to have_content {}", insert(0))),

})


-------------------------------------------------------------------------
-- Javascript Snippet
-------------------------------------------------------------------------

ls.add_snippets('javascript', {
  -- console.log
  snip({
    trig = "log",
    namr = "console.log()",
    dscr = "Console Logger",
  }, fmt("console.log({})", insert(0))),
})



-------------------------------------------------------------------------
-- Ragtag 
-------------------------------------------------------------------------

vim.keymap.set({ 'n', 'i' }, '<leader>-', '<%<Space><Space>%><Esc>2hi', { silent = true })
vim.keymap.set({ 'n', 'i' }, '<leader>+', '<%=<Space><Space>%><Esc>2hi', { silent = true })
vim.keymap.set({ 'n', 'i' }, '<leader>_', '<C-V><NL><Esc>I<%<Space><Esc>A<Space>%><Esc>F<NL>s', { silent = true })

-------------------------------------------------------------------------
-- Rename 
-------------------------------------------------------------------------

function rename()
  local old_name = vim.fn.expand('%')
  local new_name = vim.fn.input('New file name: ', old_name, 'file')
  if new_name ~= '' and new_name ~= old_name then
    vim.pretty_print(old_name .. ' => ' .. new_name)
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


-------------------------------------------------------------------------
-- Swift Lsp
-------------------------------------------------------------------------
require'lspconfig'.sourcekit.setup{}
