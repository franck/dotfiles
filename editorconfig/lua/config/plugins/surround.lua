return {
  {
    "kylechui/nvim-surround",
    enable = true,
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
      })

      vim.g.surround_no_mappings = 1

      -- vim.keymap.set('n', 'yss', '<Plug>Yssurround')
      -- vim.keymap.set('n', 'ds', '<Plug>Dsurround')
      -- vim.keymap.set('n', 'ys', '<Plug>Ysurround')
      -- vim.keymap.set('n', 'ys', '<Plug>Ysurround')
      -- vim.keymap.set('n', 'yS', '<Plug>YSurround')
      -- vim.keymap.set('n', 'yss', '<Plug>Yssurround')
      -- vim.keymap.set('n', 'ySs', '<Plug>YSsurround')
      -- vim.keymap.set('n', 'ySS', '<Plug>YSsurround')
      -- vim.keymap.set('v', 'S', '<Plug>VSurround', { noremap = true })
      -- vim.keymap.set('v', 'S', '<Plug>VSurround')
      -- vim.keymap.set('x', 'gS', '<Plug>VgSurround')
      vim.keymap.set('n', 'ys', '<Plug>(nvim-surround-normal)')
      vim.keymap.set('n', 'yss', '<Plug>(nvim-surround-normal-cur)')
      vim.keymap.set('n', 'yS', '<Plug>(nvim-surround-normal-line)')
      vim.keymap.set('n', 'ds', '<Plug>(nvim-surround-delete)')
      vim.keymap.set('v', 'S', '<Plug>(nvim-surround-visual)', { noremap = true })
      vim.keymap.del('n', 'cs')
      vim.keymap.del('n', 'cS')
    end
  }
}
