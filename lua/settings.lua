local g = vim.g
local opt = vim.opt

--[[ Main settings ]]--
opt.wrap = true -- Activate wrap words
opt.linebreak = true
opt.hidden = true -- Work with buffers
opt.history = 1000
opt.mouse = ""  -- Disable mouse
opt.mousemodel = vim.api.extend
opt.updatetime = 300 -- Having longer updatetime (default 4000 ms) leads to noticeable delays and poor user experience
opt.shortmess:append("c")
opt.signcolumn = "yes"
opt.autoread = true
opt.foldmethod = "indent"
opt.foldnestmax = 3
opt.foldenable = false

opt.splitbelow = true -- When on, splitting a window will put the new window below the current one
opt.splitright = true -- When on, splitting a window will put the new window right of the current one

opt.fillchars = {
    horiz = "━",
    horizup = "┻",
    horizdown = "┳",
    vert = "┃",
    vertleft = "┫",
    vertright = "┣",
    verthoriz = "╋",
} -- Characters to fill the statuslines and vertical separators

opt.timeoutlen = 800 -- Time in ms to wait for a mapped sequence to complete
opt.undofile = true

--[[ Search ]]--
opt.hlsearch = true -- show highlight searsh
opt.showmatch = true -- show matching
opt.ignorecase = true -- search without case
opt.smartcase = true

--[[ Code style ]]--
opt.tabstop = 3
opt.softtabstop = 3
opt.expandtab = true
opt.shiftwidth = 3
opt.autoindent = true
opt.number = true -- Show numbers on the left
opt.relativenumber = true
opt.cmdheight = 2 -- give more space for displaying messages
opt.list = true
opt.listchars:append "tab:>~"
opt.listchars:append "trail:•"
opt.listchars:append "extends:↪"
opt.listchars:append "precedes:↩"
opt.listchars:append "space:•"
opt.termguicolors = true
-- opt.colorcolumn = "90"

opt.background = 'dark'

--[[ Backups ]]--
opt.swapfile = false
opt.backupdir = '~/.cache/nvim'
opt.backup = false
opt.writebackup = false

--[[ File encodings ]]--
opt.fileencodings = 'utf-8,cp1251'

-- Close [No name] buffers
opt.hidden = false

--g.lsp_cxx_hl_log_file = '/tmp/vim-lsp-cxx-hl.log'
--g.lsp_cxx_gl_verbose_log = true
