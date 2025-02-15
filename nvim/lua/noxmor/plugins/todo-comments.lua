-- Copyright (c) 2025 Noxmor

return {
    "folke/todo-comments.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    config = function()
        local todo_comments = require("todo-comments")

        local keymap = vim.keymap

        keymap.set('n', "]t", function()
            todo_comments.jump_next()
        end, { desc = "Jump to the next todo comment." })

        keymap.set('n', "[t", function()
            todo_comments.jump_prev()
        end, { desc = "Jump to the previous todo comment." })

        todo_comments.setup({})
    end
}
