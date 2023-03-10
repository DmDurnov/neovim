-- Automatically install packer
local ensure_packer = function()
   local fn = vim.fn
   local install_path = fn.stdpath("data") .. '/site/pack/packer/start/packer.nvim'
   if fn.empty(fn.glob(install_path)) > 0 then
      fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
      print("Installing packer. Close and reopen Neovim once done...")
      vim.cmd([[packadd packer.nvim]])
      return true
   end
   return false
end

local packer_bootstrap = ensure_packer()

local ok, packer = pcall(require, "packer")
if not ok then
   print("packer.nvim not installed. No plugins will get installed.")
   return
end

--Reload neovim whenever we save plugins.lua
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

packer.init({
   display = {
      open_fn = function()
         return require("packer.util").float({ border = "rounded" })
      end,
   },
})

return packer.startup(function(use)
   -- Libraries
   use("nvim-lua/plenary.nvim")
   use("nvim-lua/popup.nvim")
   use("lewis6991/impatient.nvim")

   -- Package management
   use("wbthomason/packer.nvim")

   -- colorscheme
   use("Mofiqul/vscode.nvim")

   -- UI
   use("folke/lsp-colors.nvim")
   use("folke/zen-mode.nvim")
   use("folke/twilight.nvim")
   use("kyazdani42/nvim-web-devicons")
   use("stevearc/dressing.nvim") -- UI hooks
   use({ "nvim-lualine/lualine.nvim", -- status line
      requires = { "kyazdani42/nvim-web-devicons", opt = true },
   })
   use("jinh0/eyeliner.nvim")
   use { 'chentoast/marks.nvim' }

   -- File explorer
   use({
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v2.x",
      requires = {
         "nvim-lua/plenary.nvim",
         "nvim-tree/nvim-web-devicons",
         "MunifTanjim/nui.nvim"
      }
   })

   -- Git
   use("tpope/vim-fugitive")
   use("lewis6991/gitsigns.nvim")
   use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
   use("f-person/git-blame.nvim")

   -- Diagnostics
   use("folke/trouble.nvim")
   use("folke/todo-comments.nvim")

   -- Telescope
   use({ "nvim-telescope/telescope.nvim",
      tag = '0.1.1',
      requires = {
         {
            'nvim-lua/plenary.nvim',
            'kyazdani42/nvim-web-devicons',
         }
      }
   })
   use { 'nvim-telescope/telescope-fzf-native.nvim',
      run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
   use("nvim-telescope/telescope-file-browser.nvim")
   use("benfowler/telescope-luasnip.nvim")
   use("nvim-telescope/telescope-symbols.nvim")
   use("nvim-telescope/telescope-packer.nvim")

   -- Movement
   use("ggandor/lightspeed.nvim")

   -- Searching
   use("junegunn/fzf")
   use("junegunn/fzf.vim")

   -- Common sense helpers
   use("windwp/nvim-autopairs")
   use("numToStr/Comment.nvim")
   use("folke/which-key.nvim") -- Legends
   use("mzlogin/vim-markdown-toc")
   use("lukas-reineke/indent-blankline.nvim")
   use("lukas-reineke/virt-column.nvim")

   -- Pretty fold
   use { 'anuvyklack/pretty-fold.nvim',
      config = function() require('pretty-fold').setup()
      end }

   -- LSP
   use("hrsh7th/nvim-cmp") -- The completion plugin
   use("hrsh7th/cmp-nvim-lsp") -- Lsp completion
   use("hrsh7th/cmp-nvim-lua") -- Neovim lua runtime API completion
   use("hrsh7th/cmp-buffer") -- buffer completions
   use("hrsh7th/cmp-path") -- path completions
   use("hrsh7th/cmp-cmdline") -- cmdline completions
   use("L3MON4D3/LuaSnip") --snippet engine
   use("saadparwaiz1/cmp_luasnip") -- snippet completions
   use("onsails/lspkind-nvim") -- pictograms for lsp completion items

   use({
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
   })
   use("j-hui/fidget.nvim") -- LSP status endpoint handler
   use("weilbith/nvim-code-action-menu") -- Show code actions in a useful manner
   use("kosayoda/nvim-lightbulb") -- Show code actions in a useful manner
   use("folke/neodev.nvim")
   use("ray-x/lsp_signature.nvim")
   use({
      "jose-elias-alvarez/null-ls.nvim",
      requires = { "nvim-lua/plenary.nvim" },
   })
   use({
      "jay-babu/mason-null-ls.nvim"
   })

   -- debug
   use({
      "mfussenegger/nvim-dap",
      "jayp0521/mason-nvim-dap.nvim"
   })
   use('rcarriga/nvim-dap-ui')

   --treesitter
   use({
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
   })

   -- doxygen
   use({
      'danymat/neogen',
      -- config = function()
      --    require('neogen').setup()
      -- end,
      requires = "nvim-treesitter/nvim-treesitter"
   })

   -- terminal
   use({ 'akinsho/toggleterm.nvim', tag = '*' })

   -- start time
   use('dstein64/vim-startuptime')

   -- aerial
   use({
      'stevearc/aerial.nvim'
   })

   if packer_bootstrap then
      require("packer").sync()
   end
end)
