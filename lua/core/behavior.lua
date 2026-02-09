local opt = vim.opt
local fn = vim.fn

opt.compatible = false -- disable compatibilty mode

-- editing
opt.backspace = { "indent", "eol", "start" }
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- search behaviour
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true
opt.showmatch = true

-- persistent undo
opt.undofile = true
opt.swapfile = false
fn.mkdir(opt.undodir:get()[1], "p") -- ensure undo dir
opt.undodir = fn.stdpath("data") .. "/undo//" -- set undo dir

-- limit scrolling
opt.wrap = false
opt.scrolloff = 8

opt.updatetime = 50
