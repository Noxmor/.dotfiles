-- Copyright (c) 2026 Noxmor

return {
    "ej-shafran/compile-mode.nvim",
    branch = "latest",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        vim.g.compile_mode = {
            input_word_completion = true,
        }

        vim.keymap.set("n", "<leader>cc", ":below Compile<CR>", { desc = "Compile"} )
        vim.keymap.set("n", "<leader>cr", ":below Recompile<CR>", { desc = "Recompile"} )
    end
}
