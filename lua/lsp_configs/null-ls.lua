-- https://github.com/jose-elias-alvarez/null-ls.nvim
local ok, null_ls = pcall(require, "null-ls")
if not ok then
   print("null-ls not available")
   return
end

local null_ls_diagnostics = null_ls.builtins.diagnostics

local lsp_handlers = require("lsp_configs.lsp_handlers")

require('mason-null-ls').setup({
   ensure_installed = { },
   automatic_installation = false,
   automatic_setup = true,
})

local sources = {
   null_ls_diagnostics.clazy,
   null_ls_diagnostics.cmake_lint,
}

null_ls.setup{
   debug = true,
   sources = sources,
   on_attach = function(client, bufnr)
      lsp_handlers.set_autocmds(client, bufnr)
   end
}

require('mason-null-ls').setup_handlers()
