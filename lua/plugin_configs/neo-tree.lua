
local ok, neo_tree = pcall(require, "neo-tree")
if not ok then
    print('"neo-tree" not available')
    return
end

neo_tree.setup()

vim.cmd([[let g:neo_tree_remove_legacy_commands = 1]])

local map = vim.api.nvim_set_keymap
map('n', '<F2>', ':Neotree toggle<CR>', { noremap = false, silent = false })
map('n', '<leader>sb', ':Neotree buffers', { noremap = false, silent = false })
