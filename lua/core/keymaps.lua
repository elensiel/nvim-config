local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- back to netrw
map({ "n", "v" }, "<leader>e", ":Ex<CR>", opts)

-- write
map({ "n", "v" }, "<leader>w", ":w<CR>", opts)

-- quit. just quit.
map({ "n", "v" }, "<leader>q", ":q<CR>", opts)

-- clipboard shit
map("v", "<leader>y", '"+y', opts)
map({ "n", "v" }, "<leader>p", '"+p', opts)

-- fix whole file indent
-- map("n", "<leader>=", 'ggVG=', opts)
