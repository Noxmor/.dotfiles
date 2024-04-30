-- Copyright (c) 2024 Noxmor

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
