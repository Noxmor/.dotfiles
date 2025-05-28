-- Copyright (c) 2025 Noxmor

return {
    "mason-org/mason.nvim",
    dependencies = {
        "mason-org/mason-lspconfig.nvim",
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")

        mason.setup({})

        mason_lspconfig.setup({
            ensure_installed = {
                "clangd",
                "lua_ls",
                "texlab",
                "rust_analyzer"
            }
        })
    end
}
