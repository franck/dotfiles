return {
  {
    'echasnovski/mini.nvim',
    enable = true,
    config = function()
      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = true }

      require('mini.pairs').setup()
      require('mini.starter').setup()
    end
  }
}
