local ok_mason_nvim_dap, mason_nvim_dap = pcall(require, "mason-nvim-dap")
if not ok_mason_nvim_dap then
    print('"mason-nvim-dap" not available')
    return
end

mason_nvim_dap.setup()
