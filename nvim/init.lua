local impatient_ok, impatient = pcall(require, "impatient")
if impatient_ok then
  impatient.enable_profile()
end

for _, source in ipairs {
  -- "core.utils",
  -- "core.options",
  "core.settings",
  "core.plugins",
  "core.bepo",
  "core.treesitter",
  "core.snippets",
  "core.cmp",
  "core.lsp",
  "core.test",
  "core.hop",
  "core.lualine",
  -- "core.autocmds",
  "core.mappings",
  -- "core.ui",
} do
  local status_ok, fault = pcall(require, source)
  if not status_ok then
    vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault)
  end
end
