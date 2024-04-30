-- Copyright (c) 2024 Noxmor

return {
    "christoomey/vim-tmux-navigator",
    cmd = {
        "TmuxNavigateLeft",
        "TmuxNavigateDown",
        "TmuxNavigateUp",
        "TmuxNavigateRight",
        "TmuxNavigatePrevious"
    },
    keys = {
        { "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { noremap = true } },
        { "<C-j>", "<cmd>TmuxNavigateDown<CR>", { noremap = true } },
        { "<C-k>", "<cmd>TmuxNavigateUp<CR>", { noremap = true } },
        { "<C-l>", "<cmd>TmuxNavigateRight<CR>", { noremap = true } }
    }
}
