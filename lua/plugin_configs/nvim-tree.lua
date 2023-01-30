-- 'kyazdani42/nvim-tree.lua'

local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then
    print('"nvim-tree/nvim-tree.lua" not available')
    return
end

nvim_tree.setup({
    disable_netrw = true,
    hijack_netrw = true,
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
    },
    diagnostics = {
        enable = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    actions = {
        open_file = {
            resize_window = true,
        },
    },
})

local map = vim.api.nvim_set_keymap
map('n', '<F2>', ':NvimTreeToggle<CR>', { noremap = false, silent = false })

local function open_nvim_tree()
   require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({"VimEnter"}, { callback = open_nvim_tree })
