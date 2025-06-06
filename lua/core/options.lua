local o = vim.o
local wo = vim.wo
local g = vim.g

o.clipboard = "unnamed,unnamedplus"

-- UI
o.termguicolors = true
o.background = "dark"
o.cursorline = true
o.number = true
o.relativenumber = false
o.signcolumn = "yes"
o.updatetime = 250
wo.wrap = false

-- splits
o.splitbelow = true
o.splitright = true

-- tabs / indents
o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.smartindent = true

-- search
o.ignorecase = true
o.smartcase = true

-- misc
g.mapleader = " "
