-- formatter
local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local conditional = function(fn)
  local utils = require("null-ls.utils").make_conditional_utils()
  return fn(utils)
end


null_ls.setup({
  debug = true,
  -- the sources are prettier, eslint_d and rubocop
  sources = {
    formatting.prettier,

    -- Here we set a conditional to call the rubocop formatter. If we have a Gemfile in the project, we call "bundle exec rubocop", if not we only call "rubocop".
    conditional(function(utils)
      return utils.root_has_file("Gemfile")
          and null_ls.builtins.formatting.rubocop.with({
            command = "bundle",
            args = vim.list_extend(
              { "exec", "rubocop" },
              null_ls.builtins.formatting.rubocop._opts.args
            ),
          })
          or null_ls.builtins.formatting.rubocop
    end),

    -- Same as above, but with diagnostics.rubocop to make sure we use the proper rubocop version for the project
    conditional(function(utils)
      return utils.root_has_file("Gemfile")
          and null_ls.builtins.diagnostics.rubocop.with({
            command = "bundle",
            args = vim.list_extend(
              { "exec", "rubocop" },
              null_ls.builtins.diagnostics.rubocop._opts.args
            ),
          })
          or null_ls.builtins.diagnostics.rubocop
    end),
  },
  -- on_attach = function(client, bufnr)
  --   -- if client.supports_method("textDocument/formatting") then
  --   vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
  --   vim.api.nvim_create_autocmd("BufWritePre", {
  --     group = augroup,
  --     buffer = bufnr,
  --     callback = function()
  --       -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
  --       vim.lsp.buf.format()
  --     end,
  --   })
  --   -- end
  -- end,
})

local group_js = vim.api.nvim_create_augroup("Javascript and Ruby Formatting", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.js", "*.ts", "*.jsx", "*.tsx", "*.rb", "*.scss", "*.css", "*.lua" },
  callback = function()
    vim.lsp.buf.format { async = true }
  end,
  group = group_js,
})
