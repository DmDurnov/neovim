-- https://github.com/folke/which-key.nvim
local ok, which_key = pcall(require, "which-key")
if not ok then
    print('"folke/which-key.nvim" not available')
    return
end

-- vimopt.timeoutlen is used to trigger which-key

which_key.setup()
