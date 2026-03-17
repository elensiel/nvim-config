local g = vim.g
local o = vim.o
local opt = vim.opt

-- nerd font support
g.have_nerd_font = true

-- 24bit rgb support for terminal
opt.termguicolors = true

-- line numbers
o.relativenumber = true

-- display invisible chars
o.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- remove netrw banner
g.netrw_banner = 0
