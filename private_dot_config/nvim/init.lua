-- Options
local o = vim.o

o.nu = true
o.relativenumber = true
o.title = true

o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
o.expandtab = true

o.smartindent = true

o.swapfile = false
o.backup = false

o.hlsearch = true
o.incsearch = true

o.scrolloff = 10

o.timeout = false
o.ttimeout = false

-- Keymappings
vim.g.mapleader = " "
local s = vim.keymap.set
s('n', '<F2>', ':buffers<CR>:b ')
s("n", "<leader>pv", vim.cmd.Ex)

-- Yank in register and in system clipboard
s("n", "<leader>y", "\"+y")
s("v", "<leader>y", "\"+y")
s("n", "<leader>Y", "\"+Y")

vim.o.termguicolors = true

-- Plugins
require("loadlazy")
