-- Copyright (c) 2025 Noxmor

return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        local lualine = require("lualine")
        local lazy_status = require("lazy.status")
        local mason_registry = require("mason-registry")
        local theme = require("lualine.themes.gruvbox_dark")

        local mason_updates = 0

        local function check_mason_updates()
            mason_registry.refresh(function()
                local packages = mason_registry.get_installed_packages()
                local remaining = #packages
                local updates = 0

                if remaining == 0 then
                    mason_updates = 0
                    lualine.refresh()
                    return
                end

                for _, package in ipairs(packages) do
                    package:get_latest_version(function(success, result)
                        if success and result then
                            updates = updates + 1
                        end

                        remaining = remaining - 1

                        if remaining == 0 then
                            mason_updates = updates
                            vim.schedule(function()
                                lualine.refresh()
                            end)
                        end
                    end)
                end
            end)
        end

        local function mason_status()
            if mason_updates > 0 then
                return "󰏗 " .. mason_updates
            end

            return ""
        end

        vim.api.nvim_create_autocmd("VimEnter", {
            callback = check_mason_updates,
        })

        local color = "#FF9E64";

        lualine.setup({
            options = {
                theme = theme
            },
            sections = {
                lualine_x = {
                    {
                        mason_status,
                        cond = function() return mason_updates > 0 end,
                        color = { fg = color }
                    },
                    {
                        lazy_status.updates,
                        cond = lazy_status.has_updates,
                        color = { fg = color }
                    },
                    { "encoding" },
                    { "fileformat" },
                    { "filetype" }
                }
            }
        })
    end
}
