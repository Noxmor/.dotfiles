-- Copyright (c) 2026 Noxmor

return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        formatters_by_ft = {
            python = { "ruff_format" },
        },

        format_on_save = {
            timeout_ms = 3000,
            lsp_format = "fallback",
        },
    },
}
