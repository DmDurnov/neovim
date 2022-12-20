-- 'nvim-lualine/lualine.nvim'
local ok_lualine, lualine = pcall(require, "lualine")
if not ok_lualine then
    print('"nvim-lualine/lualine.nvim" not available')
    return
end

if ok_lualine then
   lualine.setup({})
end
