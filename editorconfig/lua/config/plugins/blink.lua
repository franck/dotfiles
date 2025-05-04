-- Completion
return {
  {
    'saghen/blink.cmp',
    enabled = true,
    dependencies = {
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
        end
      },
      "giuxtaposition/blink-cmp-copilot",
    },
    version = '*',
    opts = {
      -- 'default' for mappings similar to built-in completion
      -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
      -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
      -- See the full "keymap" documentation for information on defining your own keymap.
      -- keymap = { preset = 'enter' },
      --
      completion = {
        list = {
          selection = { preselect = false, auto_insert = false },
        },
      },

      keymap = {
        preset = 'enter',
        ['<Tab>'] = { 'select_next', 'fallback' },
      },

      snippets = { preset = 'luasnip' },

      appearance = {
        use_nvim_cmp_as_default = true,
        -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono',
        -- Blink does not expose its default kind icons so you must copy them all (or set your custom ones) and add Copilot
        kind_icons = {
          Copilot = "Co",
          Text = '󰉿',
          Method = '󰊕',
          Function = '󰊕',
          Constructor = '󰒓',

          Field = '󰜢',
          Variable = '󰆦',
          Property = '󰖷',

          Class = '󱡠',
          Interface = '󱡠',
          Struct = '󱡠',
          Module = '󰅩',

          Unit = '󰪚',
          Value = '󰦨',
          Enum = '󰦨',
          EnumMember = '󰦨',

          Keyword = '󰻾',
          Constant = '󰏿',

          Snippet = '󱄽',
          Color = '󰏘',
          File = '󰈔',
          Reference = '󰬲',
          Folder = '󰉋',
          Event = '󱐋',
          Operator = '󰪚',
          TypeParameter = '󰬛',
        },
      },

      -- do not use autocompletion in cmdline, specially for path completion as blink
      -- does not work properly for that purpose
      cmdline = { enabled = false },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { 'copilot', 'lsp', 'snippets', 'buffer' },
        providers = {
          copilot = {
            name = 'copilot',
            enabled = true,
            module = "blink-cmp-copilot",
            score_offset = 200,
            async = true,
            transform_items = function(_, items)
              local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
              local kind_idx = #CompletionItemKind + 1
              CompletionItemKind[kind_idx] = "Copilot"
              for _, item in ipairs(items) do
                item.kind = kind_idx
              end
              return items
            end,
          },
          buffer = {
            name = "buffer",
            enabled = true,
            module = "blink.cmp.sources.buffer",
            score_offset = 1000,
          },
          lsp = {
            name = 'lsp',
            enabled = true,
            module = "blink.cmp.sources.lsp",
            score_offset = 800,
          },
          snippets = {
            name = 'snippets',
            enabled = true,
            module = "blink.cmp.sources.snippets",
            score_offset = 500,
          },
        },
      },
    },
    opts_extend = { "sources.default" }
  }
}
