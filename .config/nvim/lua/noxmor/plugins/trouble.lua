-- Copyright (c) 2024 Noxmor

return {
    "folke/trouble.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "folke/todo-comments.nvim"
    },
    keys = {
        { "<leader>xx", "<cmd>TroubleToggle<CR>", desc = "Open/close trouble list." },
        { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "Open trouble workspace diagnostics list." },
        { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>", desc = "Open trouble document diagnostics list." },
        { "<leader>xq", "<cmd>TroubleToggle quickfix<CR>", desc = "Open trouble quickfix ist." },
        { "<leader>xl", "<cmd>TroubleToggle loclist<CR>", desc = "Open trouble location list." },
        { "<leader>xt", "<cmd>TodoTrouble<CR>", desc = "Open todos in trouble." }
    }
}
