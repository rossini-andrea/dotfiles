-- Options
local o = vim.o

o.title = true
o.shiftwidth = 4
o.tabstop = 4
o.expandtab = true

-- Keymappings
local s = vim.keymap.set

s('n', '<F2>', ':buffers<CR>:b ')

