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

-- TODO: Add plugin files for these.
--    "nvim-lua/plenary.nvim",
--    "tpope/vim-fugitive",
--    {
--        "j-hui/fidget.nvim",
--        config = function()
--            require('fidget').setup({})
--        end
--    },
--    "ThePrimeagen/vim-be-good",
--    "christoomey/vim-tmux-navigator"

require("lazy").setup({ { import = "noxmor.plugins" }, { import = "noxmor.plugins.lsp" } }, {
    checker = {
        enabled = true
    }
})
