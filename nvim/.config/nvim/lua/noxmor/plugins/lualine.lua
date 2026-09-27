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

        local function update_mason_status()
            local packages = mason_registry.get_installed_packages()
            local updates = 0

            for _, package in ipairs(packages) do
                local installed = package:get_installed_version()
                local latest = package:get_latest_version()

                if installed and latest and installed ~= latest then
                    updates = updates + 1
                end
            end

            mason_updates = updates

            lualine.refresh()
        end

        local function check_mason_updates()
            mason_registry.refresh(function()
                vim.schedule(update_mason_status)
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

        mason_registry:on("package:install:success", function()
            vim.schedule(update_mason_status)
        end)

        mason_registry:on("package:uninstall:success", function()
            vim.schedule(update_mason_status)
        end)

        mason_registry:on("update:success", function()
            vim.schedule(update_mason_status)
        end)

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
