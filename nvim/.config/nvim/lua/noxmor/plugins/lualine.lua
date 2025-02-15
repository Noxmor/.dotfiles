-- Copyright (c) 2025 Noxmor

return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        local lualine = require("lualine")
        local lazy_status = require("lazy.status")
        local theme = require("lualine.themes.gruvbox_dark")

        lualine.setup({
            options = {
                theme = theme
            },
            sections = {
                lualine_x = {
                    {
                        lazy_status.updates,
                        cond = lazy_status.has_updates,
                        color = { fg = "#FF9E64" }
                    },
                    { "encoding" },
                    { "fileformat" },
                    { "filetype" }
                }
            }
        })
    end
}
