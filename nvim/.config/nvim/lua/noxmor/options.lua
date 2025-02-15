-- Copyright (c) 2025 Noxmor

local opt = vim.opt

-- Recognize .bash_prompt as a sh file.
vim.cmd("autocmd BufRead,BufNewFile .bash_prompt set filetype=sh")

-- Highlight trailing whitespaces in red.
vim.cmd("highlight ExtraWhitespace ctermbg=red guibg=red")

if vim.bo.filetype ~= 'markdown' then
    vim.cmd("autocmd BufWinEnter * match ExtraWhitespace /\\s\\+$/")
    vim.cmd("autocmd InsertEnter * match ExtraWhitespace /\\s\\+\\%#\\@<!$/")
    vim.cmd("autocmd InsertLeave * match ExtraWhitespace /\\s\\+$/")
    vim.cmd("autocmd BufWinLeave * call clearmatches()")
end

-- Enable colors in the terminal
-- and set a dark background.
opt.termguicolors = true
opt.background = 'dark'

-- Configure tabs.
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- Lines longer than the window should wrap.
opt.wrap = true

-- Always ignore case when searching, but assume
-- case-sensitive search with mixed case in search.
opt.ignorecase = true
opt.smartcase = true

-- Configure color column.
opt.colorcolumn = '80'
vim.cmd("highlight ColorColumn ctermbg=LightBlue guibg=LightBlue")

-- Enable line numbers and relative line numbers.
vim.opt.number = true
vim.opt.relativenumber = true

-- Use the system clipboard when copying.
opt.clipboard:append("unnamedplus")

-- Behaviour for splitting windows.
opt.splitright = true
opt.splitbelow = true
