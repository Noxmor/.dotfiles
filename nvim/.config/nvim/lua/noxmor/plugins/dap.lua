-- Copyright (c) 2025 Noxmor

return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
            "nvim-neotest/nvim-nio",
            "williamboman/mason.nvim",
            "jay-babu/mason-nvim-dap.nvim"
        },

        config = function()
            local mason_dap = require("mason-nvim-dap")
            mason_dap.setup({
                ensure_installed = { "codelldb" },
                automatic_installation = true
            })

            local dap = require("dap")
            local ui = require("dapui")
            local virtual_text = require("nvim-dap-virtual-text")

            ui.setup({
                layouts = {
                    {
                        elements = { "scopes", "breakpoints", "stacks", "watches" },
                        size = 40,
                        position = "right"
                    },
                    {
                        elements = { "repl", "console" },
                        size = 10,
                        position = "bottom"
                    }
                }
            })

            virtual_text.setup()

            local mason_path = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/"
            local codelldb_path = mason_path .. "adapter/codelldb"

            dap.adapters.codelldb = {
                type = "server",
                port = "${port}",
                executable = {
                    command = codelldb_path,
                    args = { "--port", "${port}" }
                }
            }

            dap.configurations.c = {
                {
                    name = "Launch",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                    stopAtBeginningOfMainSubprogram = false,
                    exitAfterTaskReturns = false
                }
            }

            dap.configurations.cpp = dap.configurations.c

            vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
            vim.keymap.set("n", "space>gb", dap.run_to_cursor)
            vim.keymap.set("n", "<space>?", function()
                ui.eval(nil, { enter = true })
            end)

            vim.keymap.set("n", "<F1>", dap.continue)
            vim.keymap.set("n", "<F2>", dap.step_into)
            vim.keymap.set("n", "<F3>", dap.step_over)
            vim.keymap.set("n", "<F4>", dap.step_out)
            vim.keymap.set("n", "<F5>", dap.step_back)
            vim.keymap.set("n", "<F6>", dap.restart)

            dap.listeners.before.attach.dapui_config = function()
                ui.open()
            end

            dap.listeners.before.launch.dapui_config = function()
                ui.open()
            end

            dap.listeners.before.event_terminated.dapui_config = function()
                ui.close()
            end

            dap.listeners.before.event_exited.dapui_config = function()
                ui.close()
            end
        end
    }
}
