-- https://github.com/jose-elias-alvarez/null-ls.nvim
local ok, null_ls = pcall(require, "null-ls")
if not ok then
   print("null-ls not available")
   return
end

local null_ls_diagnostics = null_ls.builtins.diagnostics

local sources = {
   null_ls_diagnostics.clazy
}

null_ls.setup({
   sources = sources,
   log_level = "trace",
})
