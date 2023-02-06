local M = {}

-- We're not using a `pcall()` here since we're called only from where this is
-- required.
local lspconfig = require("lspconfig")

-- https://github.com/folke/neodev.nvim
local ok_neodev, neodev = pcall(require, "neodev")

if ok_neodev then
   neodev.setup()
end

M.setup = function()
    if ok_neodev then
        lspconfig.sumneko_lua.setup(
        {
           settings = {
              Lua = {
                 completion = {
                    callSnippet = "Replace",
                 }
              }
           }
        }
        )
     end
end

return M
