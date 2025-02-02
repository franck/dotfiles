-- Run "rvm which ruby" and capture the output
local ruby_path = vim.fn.system("rvm which ruby")

-- Remove any trailing newline or whitespace from the command output
ruby_path = ruby_path:gsub("%s+", "")

-- Set ruby_host_prog to the resolved RVM Ruby path
vim.g.ruby_host_prog = ruby_path


-- add app/components to paths
vim.opt.path:append("app/components/**")


--
-- add ViewComponent to vim-rails plugin
--
vim.g.rails_projections = {
  ["app/components/*_component.rb"] = {
    test = "spec/components/{}_component_spec.rb",
    template = {
      "class {camelcase|capitalize|colons} < ViewComponent::Base",
      "end"
    },
    alternate = "app/components/{}_component.html.erb"
  },
  ["app/components/*/*_component.rb"] = {
    test = "spec/components/{dirname}/{basename}_spec.rb",
    template = {
      "module {camelcase|capitalize|colons}",
      "  class {camelcase|capitalize|colons} < ViewComponent::Base",
      "  end",
      "end"
    },
    alternate = "app/components/{dirname}/{basename}.html.erb"
  },
}
