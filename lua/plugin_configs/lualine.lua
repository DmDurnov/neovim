-- 'nvim-lualine/lualine.nvim'
local ok_lualine, lualine = pcall(require, "lualine")
if not ok_lualine then
    print('"nvim-lualine/lualine.nvim" not available')
    return
end

if ok_lualine then
   -- integrate with git blame
   vim.g.gitblame_display_virtual_text = false
   local git_blame = require('gitblame')

   lualine.setup({
      sections = {
         lualine_c = {
            { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available }
         }
      }
   })
end
