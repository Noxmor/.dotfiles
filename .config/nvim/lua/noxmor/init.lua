-- Copyright (c) 2024 Noxmor

require("noxmor.options")
require("noxmor.keymaps")
require("noxmor.lazy")

-- Better navigation for vim panes.
vim.api.nvim_set_keymap('n', '<c-h>', ':wincmd h<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<c-j>', ':wincmd j<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<c-k>', ':wincmd k<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<c-l>', ':wincmd l<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<C-h>', ':TmuxNavigateLeft<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-j>', ':TmuxNavigateDown<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', ':TmuxNavigateUp<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':TmuxNavigateRight<CR>', { noremap = true })
