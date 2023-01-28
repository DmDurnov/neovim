-- https://github.com/Mofiqul/vscode.nvim
local ok, vscode = pcall(require, "vscode")
if ok then
   local c = require('vscode.colors')
   vscode.setup({
      transparent = false,
      italic_comments = true,
      color_overrides = {},
      group_overrides = {
         Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
      }
   })
   vim.cmd([[colorscheme vscode]])
   vim.cmd([[hi @class guifg=#4ec9b0]])
   vim.cmd([[hi @namespace guifg=#c8c8c8]])
   vim.cmd([[hi @parameter gui=italic guifg=#9a9a9a]])
   vim.cmd([[hi @macro guifg=#beb7ff]])
   vim.cmd([[hi @property gui=bold guifg=#cfcfcf]])
   vim.cmd([[hi @enumMember guifg=#b8d7a3]])
end
