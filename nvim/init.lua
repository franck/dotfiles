-- Options to add `gf` functionality inside `.lua` files.
_G.vim.opt_local.include = [[\v<((do|load)file|require)[^''"]*[''"]\zs[^''"]+]]
_G.vim.opt_local.includeexpr = "substitute(v:fname,'\\.','/','g')"
for _, path in pairs(_G.vim.api.nvim_list_runtime_paths()) do
    _G.vim.opt_local.path:append(path .. '/lua')
end
_G.vim.opt_local.suffixesadd:prepend('.lua')

require("franck")
-- require("tokyo")
