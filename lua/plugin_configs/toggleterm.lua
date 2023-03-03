local ok_toggleterm, toggleterm = pcall(require, 'toggleterm')
if not ok_toggleterm then
   print('toggleterm not available')
   return
end

toggleterm.setup{
   winbar = {
      enabled = true,
   }
}

function _G.set_terminal_keymaps()
   local opts = {buffer = 0}
   vim.keymap.set('t', '<leader><esc>', [[<C-\><C-N>]], opts)
   vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
   vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
   vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
   vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
   vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local map = vim.api.nvim_set_keymap
map('n', '<leader>Tf', ":ToggleTerm direction=float<CR>", { noremap = true, silent = true })
map('n', '<leader>Th', ":ToggleTerm direction horizontal<CR>", { noremap = true, silent = true })
map('n', '<leader>Tv', ":ToggleTerm direction vertical<CR>", { noremap = true, silent = true })
