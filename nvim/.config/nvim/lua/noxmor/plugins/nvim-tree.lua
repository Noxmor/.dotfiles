-- Copyright (c) 2025 Noxmor

return {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        local nvimtree = require("nvim-tree")

        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        nvimtree.setup({
            view = {
                relativenumber = true
            },
            actions = {
                open_file = {
                    window_picker = {
                        enable = false
                    }
                }
            },
            git = {
                ignore = false
            }
        })

        local keymap = vim.keymap

        keymap.set('n', "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle nvim-tree." })
        keymap.set('n', "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle nvim-tree on the current file." })
        keymap.set('n', "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse nvim-tree." })
        keymap.set('n', "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh nvim-tree." })
    end
}
