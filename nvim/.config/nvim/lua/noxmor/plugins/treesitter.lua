-- Copyright (c) 2025 Noxmor

return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "windwp/nvim-ts-autotag"
    },

    init = function()
        local treesitter = require("nvim-treesitter")
        local config = require("nvim-treesitter.config")

        local ensure_installed = {
            "json",
            "yaml",
            "markdown",
            "bash",
            "lua",
            "vim",
            "vimdoc",
            "gitignore",
            "c"
        }

        local already_installed = config.get_installed()

        local not_installed = vim.iter(ensure_installed)
        :filter(function(parser)
            return not vim.tbl_contains(already_installed, parser)
        end)
        :totable()

        treesitter.install(not_installed)

        vim.api.nvim_create_autocmd('FileType', {
            callback = function()
                pcall(vim.treesitter.start)
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end
        })
    end
}
