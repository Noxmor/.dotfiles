-- Copyright (c) 2024 Noxmor

vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set('n', "<leader>nh", ":nohl<CR>", {
    desc = "Clear all search highlights."
})
