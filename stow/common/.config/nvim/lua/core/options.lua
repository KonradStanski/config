-- Vim Settings
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.wrap = false
vim.o.termguicolors = true
vim.o.number = true
vim.o.relativenumber = false

-- Set other options
local colorscheme = require("helpers.colorscheme")
vim.cmd.colorscheme(colorscheme)
