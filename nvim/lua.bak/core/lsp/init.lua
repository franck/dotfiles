local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "core.lsp.lsp-signature"
require "core.lsp.lsp-installer"
require "core.lsp.null-ls"

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<cr>', vim.diagnostic.goto_next, opts)


local on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', '<leader>d', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover, bufopts)
end

require('lspconfig').sumneko_lua.setup{
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  },
  on_attach = on_attach
}
