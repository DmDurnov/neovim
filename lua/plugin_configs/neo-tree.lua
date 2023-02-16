
local ok, neo_tree = pcall(require, "neo-tree")
if not ok then
    print('"neo-tree" not available')
    return
end

neo_tree.setup(
{
   close_if_last_window = false,
   popup_border_style = "rounded",
   enable_git_status = true,
   enable_diagnostics = true,
}
)

local map = vim.api.nvim_set_keymap
map('n', '<F2>', ':NeoTreeShowToggle<CR>', { noremap = false, silent = false })
