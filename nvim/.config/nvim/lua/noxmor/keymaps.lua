-- Copyright (c) 2025 Noxmor

vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set('n', "<leader>nh", ":nohl<CR>", {
    desc = "Clear all search highlights."
})

-- Better navigation for vim panes.
vim.api.nvim_set_keymap('n', "<C-h>", "<cmd>wincmd h<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', "<C-j>", "<cmd>wincmd j<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', "<C-k>", "<cmd>wincmd k<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', "<C-l>", "<cmd>wincmd l<CR>", { noremap = true })

-- Disable arrow keys in normal mode.
vim.api.nvim_set_keymap('n', "<Left>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "<Down>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "<Up>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "<Right>", "<Nop>", { noremap = true, silent = true })

-- Disable arrow keys in insert mode.
vim.api.nvim_set_keymap('i', "<Left>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', "<Down>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', "<Up>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', "<Right>", "<Nop>", { noremap = true, silent = true })

-- Disable arrow keys in visual mode.
vim.api.nvim_set_keymap('v', "<Left>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', "<Down>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', "<Up>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', "<Right>", "<Nop>", { noremap = true, silent = true })
