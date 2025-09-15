local opt = vim.opt
local cmd = vim.cmd

-- UI
opt.nu = true
opt.relativenumber = true

-- Indention
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- scroll(?)
opt.wrap = false
opt.scrolloff = 8

-- Misc
opt.undofile = true
opt.swapfile = false
opt.undodir = vim.fn.stdpath("data") .. "/undo//"

-- ensure directory
vim.fn.mkdir(opt.undodir:get()[1], "p")

opt.termguicolors = true

cmd('syntax on')
cmd('filetype plugin indent on')

-- search behaviour
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true
