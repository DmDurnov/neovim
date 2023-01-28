local ok_toggleterm, toggleterm = pcall(require, 'toggleterm')
if not ok_toggleterm then
   print('toggleterm not available')
   return
end

toggleterm.setup{
   direction = 'float',
}

local map = vim.api.nvim_set_keymap
map('n', '<leader>T', ":ToggleTerm<CR>", { noremap = true, silent = true })

