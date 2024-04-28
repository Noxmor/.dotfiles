-- Copyright (c) 2024 Noxmor

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require('nvim-treesitter.configs').setup({
                ensure_installed = { "c", "lua", "vim" },
                highlight = { enable = true }
            })
        end
    },
    "ellisonleao/gruvbox.nvim",
    {
        "kyazdani42/nvim-tree.lua",
        config = function()
            require('nvim-tree').setup({})
        end
    },
    {
        "windwp/nvim-autopairs",
        config = function()
            require('nvim-autopairs').setup({})
        end
    },
    "tpope/vim-fugitive",
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x"
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require('lsp-zero').extend_lspconfig()
            require('lspconfig').clangd.setup({})
            require('lspconfig').lua_ls.setup({})
        end
    },
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
    {
        "j-hui/fidget.nvim",
        config = function()
            require('fidget').setup({})
        end
    },
    "nvim-lua/plenary.nvim",
    "ThePrimeagen/vim-be-good",
    "christoomey/vim-tmux-navigator"
}, {})
