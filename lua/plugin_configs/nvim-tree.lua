-- 'kyazdani42/nvim-tree.lua'

local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then
    print('"nvim-tree/nvim-tree.lua" not available')
    return
end

nvim_tree.setup(
{
   auto_reload_on_write = false,
   git = {
      enable = false,
   },
   modified = {
      enable = false,
   },
}
)

local map = vim.api.nvim_set_keymap
map('n', '<F2>', ':NvimTreeToggle<CR>', { noremap = false, silent = false })

local function callback_open_nvim(data)
   local isdir = vim.fn.isdirectory(data.file) == 1
   if not isdir then
      return
   end
   require("nvim-tree.api").tree.open()
end

-- local function callback_open_buf(data)
--    local realfile = vim.fn.filereadable(data.file) == 1
--    local noname = data.file == "" and vim.bo[data.buf].buftype == ""
--
--    if not realfile and not noname then
--       return
--    end
--    require("nvim-tree.api").tree.close()
-- end

vim.api.nvim_create_autocmd({"VimEnter"}, { callback = callback_open_nvim })
-- vim.api.nvim_create_autocmd({"BufEnter"}, { callback = callback_open_buf })
