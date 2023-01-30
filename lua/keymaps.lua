local map = vim.api.nvim_set_keymap

-- Esc on jk as well
map('i', "jk", "<Esc>", { noremap = true })

-- Resize with arrows
VIM_KEYMAP_SET('n', "C-Up>", "<Cmd>resize -2<CR>", { noremap = true, silent = false })
VIM_KEYMAP_SET('n', "C-Down>", "<Cmd>resize +2<CR>", { noremap = true, silent = false })
VIM_KEYMAP_SET('n', "C-Left>", "<Cmd>vertical resize -2<CR>", { noremap = true, silent = false })
VIM_KEYMAP_SET('n', "C-Right>", "<Cmd>vertical resize +2<CR>", { noremap = true, silent = false })

-- Disable arrows
map('', '<up>', ':echoe "Use k"<CR>', { noremap = true, silent = false })
map('', '<down>', ':echoe "Use j"<CR>', { noremap = true, silent = false })
map('', '<left>', ':echoe "Use h"<CR>', { noremap = true, silent = false })
map('', '<right>', ':echoe "Use l"<CR>', { noremap = true, silent = false })

-- Buffers
map('n', 'gn', ':bn<CR>', { noremap = true, silent = false })
map('n', 'gp', ':bp<CR>', { noremap = true, silent =  false })

-- Tagbar
map('n', '<F8>', ':TagbarToggle<CR>', { noremap = false, silent = false })

--[[Telescope]]--
map('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { noremap = true, silent = false })
map('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', { noremap = true, silent = false })
map('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { noremap = true, silent = false })
map('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', { noremap = true, silent = false })

--[[ Git ]]--
map('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>', { noremap = true, silent = false })
map('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>', { noremap = true, silent = false })
map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})

