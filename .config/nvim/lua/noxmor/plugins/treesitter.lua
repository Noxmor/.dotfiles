-- Copyright (c) 2024 Noxmor

return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
        "windwp/nvim-ts-autotag"
    },
    config = function()
        local treesitter = require("nvim-treesitter.configs")

        treesitter.setup({
            highlight = { enable = true },
            indent = { enable = true },
            autotag = { enable = true },

            ensure_installed = {
                "json",
                "yaml",
                "markdown",
                "bash",
                "lua",
                "vim",
                "vimdoc",
                "gitignore",
                "c"
            },

            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = false,
                    node_decremental = "<bs>"
                }
            }
        })
    end
}
