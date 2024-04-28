-- Copyright (c) 2024 Noxmor

--require("noxmor.set")
--require("noxmor.remap")
require("noxmor.lazy")

-- Highlight trailing whitespaces in red.
vim.cmd("highlight ExtraWhitespace ctermbg=red guibg=red")

if vim.bo.filetype ~= 'markdown' then
    vim.cmd("autocmd BufWinEnter * match ExtraWhitespace /\\s\\+$/")
    vim.cmd("autocmd InsertEnter * match ExtraWhitespace /\\s\\+\\%#\\@<!$/")
    vim.cmd("autocmd InsertLeave * match ExtraWhitespace /\\s\\+$/")
    vim.cmd("autocmd BufWinLeave * call clearmatches()")
end

-- Better navigation for vim panes.
vim.api.nvim_set_keymap('n', '<c-h>', ':wincmd h<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<c-j>', ':wincmd j<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<c-k>', ':wincmd k<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<c-l>', ':wincmd l<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<C-h>', ':TmuxNavigateLeft<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-j>', ':TmuxNavigateDown<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', ':TmuxNavigateUp<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':TmuxNavigateRight<CR>', { noremap = true })


vim.cmd("autocmd BufRead,BufNewFile .bash_prompt set filetype=sh")

vim.opt.background = 'dark'
vim.cmd("colorscheme gruvbox")

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.colorcolumn = '80'
vim.cmd("highlight ColorColumn ctermbg=LightBlue guibg=LightBlue")

vim.opt.number = true
vim.opt.relativenumber = true
