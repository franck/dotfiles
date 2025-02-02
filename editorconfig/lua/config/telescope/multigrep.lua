-- Telescope picker to find content AND be able to scope it to some files
-- To add a file scope add two spaces
-- 
-- pattern1<space><space>*.pattern2
--
-- Prompt Examples:
-- foo  *.json
-- bar  **/plugins/**
--
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local make_entry = require "telescope.make_entry"
local conf = require "telescope.config".values
local empty_sorter = require "telescope.sorters".empty()
local themes = require "telescope.themes"

local M = {}

local live_multigrep = function(opts)
  opts = opts or {}
  opts.cwd = opts.cwd or vim.uv.cwd()
  opts = themes.get_ivy(opts)

  local finder = finders.new_async_job {
    command_generator = function(prompt)
      if not prompt or prompt == "" then 
        return nil
      end

      -- prompt "foo  *.bar" (2 spaces)
      local pieces = vim.split(prompt, "  ")
      local args = { "rg" }

      -- rg -e foo
      if pieces[1] then
        table.insert(args, "-e")
        table.insert(args, pieces[1])
      end

      -- rg -e foo -g *.bar
      if pieces[2] then
        table.insert(args, "-g")
        table.insert(args, pieces[2])
      end

      return vim.tbl_flatten {
        args,
        { "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" }
      }
    end,
    entry_maker = make_entry.gen_from_vimgrep(opts),
    cwd = opts.cmd,
  }
  
  pickers.new(opts, {
    debounce = 100,
    prompt_title = "Multi Grep",
    finder = finder,
    previewer = conf.grep_previewer(opts),
    sorter = empty_sorter,
  }):find()
end

M.setup = function()
  vim.keymap.set("n", "<leader>sf", live_multigrep)
end

return M
