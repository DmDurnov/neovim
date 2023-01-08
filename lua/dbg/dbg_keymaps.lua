
local l_dap_ui = require('dapui')
local l_dap = require('dap')

vim.keymap.set('n', '<leader>dio', function()
   l_dap_ui.open()
end, { noremap = false, silent = false })

vim.keymap.set('n', '<leader>dit', function()
   l_dap_ui.toggle()
end, { noremap = false, silent = false })

vim.keymap.set('n', '<leader>dic', function()
   l_dap_ui.close()
end, { noremap = false, silent = false })

vim.keymap.set('n', '<leader>dc', function()
   l_dap.continue()
end, { noremap = false, silent = false })

vim.keymap.set('n', '<leader>ds', function()
   l_dap.step_over()
end, { noremap = false, silent = false })

vim.keymap.set('n', '<leader>di', function()
   l_dap.step_into()
end, { noremap = false, silent = false })

vim.keymap.set('n', '<leader>do', function()
   l_dap.step_out()
end, { noremap = false, silent = false })

vim.keymap.set('n', '<leader>dt', function()
   l_dap.terminate()
end, { noremap = false, silent = false })

vim.keymap.set('n', '<leader>db', function()
   l_dap.toggle_breakpoint()
end, { noremap = false, silent = false })
