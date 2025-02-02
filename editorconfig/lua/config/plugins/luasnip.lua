return {
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    config = function()
      local loader = require('luasnip.loaders.from_lua')
      local paths = vim.fs.joinpath(vim.fn.stdpath('config'), 'lua', 'config', 'snippets')
      loader.load { paths = paths }
      -- html_snippets = require(paths .. '/html')
      -- loader.add_snippets('eruby', html_snippets)
    end
  }
}
