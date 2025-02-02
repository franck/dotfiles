return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "saghen/blink.cmp",
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      local lspconfig = require('lspconfig')

      lspconfig.lua_ls.setup {
        capabilities = capabilities,
      }

      lspconfig.rubocop.setup {}

      lspconfig.ruby_lsp.setup {
        -- cmd = {
        --   "/Users/franck/.rvm/gems/ruby-3.3.1@holivia/bin/ruby-lsp",
        -- },
        capabilities = capabilities,
        init_options = {
          formatter = 'rubocop',
          linters = { 'rubocop' },
        },
      }

      lspconfig.ts_ls.setup {}


      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

          if client.supports_method('textDocument/rename') then
            vim.keymap.set('n', 'grn', vim.lsp.buf.rename)
          end

          if client.supports_method('textDocument/implementation') then
            vim.keymap.set('n', 'gri', vim.lsp.buf.implementation)
          end

          if client.supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end,
            })
          end
        end,
      })

      -- Handlers
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

      -- Shortcuts
      vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition)
      vim.keymap.set('n', 'gra', vim.lsp.buf.code_action)
      vim.keymap.set('n', 'grr', vim.lsp.buf.references)
      vim.keymap.set('n', 'gO', vim.lsp.buf.document_symbol)
      vim.keymap.set('i', '<C-s>', vim.lsp.buf.signature_help)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover)
    end,
  }
}
