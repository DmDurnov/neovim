-- 'nvim-lualine/lualine.nvim'
local ok_lualine, lualine = pcall(require, "lualine")
if not ok_lualine then
    print('"nvim-lualine/lualine.nvim" not available')
    return
end

local ok_git_blame, git_blame = pcall(require, 'gitblame')
if not ok_git_blame then
   print('"gitblame not available"')
   return
end

local ok_aerial, aerial = pcall(require, "aerial")
if not ok_aerial then
   print ('"aerial" not available')
   return
end

aerial.setup({
   on_attach = function(bufnr)
      vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { buffer = bufnr })
      vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { buffer = bufnr })
   end
})

vim.keymap.set('n', "<leader>a", "<cmd>AerialToggle!<CR>")

if ok_lualine then
   -- integrate with git blame
   vim.g.gitblame_display_virtual_text = false
   local git_blame = require('gitblame')

   lualine.setup({
      options = {
         disabled_filetypes = {
            statusline = {
               'NvimTree',
               'packer',
            },
            winbar = {
               'neo-tree',
               'NvimTree',
               'packer',
               '',
            },
         },
      },
      sections = {
         lualine_c = {
            { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available }
         },
      },
      tabline = {
         lualine_a = { 'buffers' },
         lualine_b = { '' },
         lualine_c = { '' },
         lualine_x = { '' },
         lualine_y = { '' },
         lualine_z = { 'tabs' },
      },
      winbar = {
         lualine_a = {
            { 'filename', path = 2, },
         },
         lualine_b = { 'aerial' },
         lualine_c = { '' },
         lualine_x = { '' },
         lualine_y = { '' },
         lualine_z = { '' },
      },
      inactive_winbar = {
         lualine_a = { '' },
         lualine_b = { '' },
         lualine_c = { '' },
         lualine_x = { '' },
         lualine_y = { '' },
         lualine_z = { '' },
      },
      extensions = {
         'quickfix',
         'neo-tree',
      }
   })
end
