local null_ls = require("null-ls")

-- local sources = {

--   -- standardrb
--   null_ls.builtins.formatting.standardrb.with({
--     condition = function(utils)
--       return utils.root_has_file("tmp/standardrb")
--     end,
--   }),

--   null_ls.builtins.diagnostics.standardrb.with({
--     condition = function(utils)
--       return utils.root_has_file("tmp/standardrb")
--     end,
--   }),
--   -- null_ls.builtins.formatting.standardrb,
--   -- null_ls.builtins.diagnostics.standardrb,


--   -- rubocop
--   null_ls.builtins.formatting.rubocop.with({
--     condition = function(utils)
--       return utils.root_has_file("tmp/rubocop")
--     end,
--   }),
--   null_ls.builtins.diagnostics.rubocop.with({
--     condition = function(utils)
--       return utils.root_has_file("tmp/rubocop")
--     end,
--   }),
-- }

-- null_ls.setup({
--   debug = true,
--   sources = sources,
-- })

-- -- local helpers = require("null-ls.helpers")

local group_ruby = vim.api.nvim_create_augroup("Ruby Formatting", { clear = true })

--
-- STANDARDRB
--
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "ruby",
--   group = group_ruby,
--   callback = function()
--     vim.lsp.start {
--       name = "standard",
--       cmd = { "standardrb", "--lsp" },
--     }
--   end,
-- })

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.js", "*.ts", "*.jsx", "*.tsx", "*.rb", "*.scss", "*.css", "*.lua" },
  callback = function()
    vim.lsp.buf.format { async = true }
  end,
  group = group_ruby,
})
