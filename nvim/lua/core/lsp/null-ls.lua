-------------------------------------------------------------------------
-- Formatting
-------------------------------------------------------------------------
require("null-ls").setup({
  debug = true,
  sources = {
    require("null-ls").builtins.formatting.prettier,
    -- require("null-ls").builtins.formatting.stylua,
    -- require("null-ls").builtins.formatting.rubocop,
  },
})

local group_js = vim.api.nvim_create_augroup("Javascript and Ruby Formatting", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre",{ 
  pattern = {"*.js", "*.ts", "*.jsx", "*.tsx", "*.rb", "*.scss", "*.css", "*.lua" },
  callback = function()
    vim.lsp.buf.formatting()
  end,
  group = group_js, })
