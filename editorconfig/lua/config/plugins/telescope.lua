return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    enable = true,
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
      require('telescope').setup {
        pickers = {
          find_files = { 
            theme = "ivy",
            layout_config = {
              height = 50
            }
          },
          buffers = { theme = "ivy" },
          help_tags = { theme = "ivy" },
          grep_string = { theme = "ivy" },
          live_grep = { theme = "ivy" },
          diagnostics = { theme = "ivy" },

        },
        extensions = {
          fzf = {}
        }
      }

      require('telescope').load_extension('fzf')

      local builtin = require('telescope.builtin')
      vim.keymap.set("n", "<leader>v", builtin.find_files)
      vim.keymap.set("n", "<leader>l", builtin.buffers)
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      -- vim.keymap.set('n', '<leader>sf', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set("n", "<leader>nn", function()
        builtin.find_files { cwd = vim.fn.stdpath('config') }
      end)
      vim.keymap.set("n", "<leader>np", function()
        builtin.find_files {
          cwd = vim.fs.joinpath(vim.fn.stdpath('data'), 'lazy')
        }
      end)
      require("config.telescope.multigrep").setup()
    end
  }
}
