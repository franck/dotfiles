require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "vim", "vimdoc", "javascript", "typescript", "ruby", "html", "yaml" },
  sync_install = false,
  auto_install = true,

  ignore_install = {},

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
