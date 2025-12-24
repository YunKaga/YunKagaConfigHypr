vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true

vim.opt.clipboard = "unnamedplus"

vim.opt.number = true
vim.opt.relativenumber = true

vim.o.shell = "zsh"

vim.cmd [[
    autocmd TermOpen * startinsert | setlocal nonumber norelativenumber
]]
