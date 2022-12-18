-- 'akinsho/bufferline.nvim'
local ok, bufferline = pcall(require, "bufferline")
if not ok then
    print('"akinsho/bufferline.nvim" not available')
    return
end
bufferline.setup({
    options = {
        mode = "tabs",
        numbers = "ordinal",
        show_buffer_close_icons = false,
        show_close_icon = false,
        always_show_bufferline = true,
        diagnostics = "nvim_lsp",
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = "left",
            },
        },
        separator_style = "slant",
        enforce_regular_tabs = true,
    },
})
