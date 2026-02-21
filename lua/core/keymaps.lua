local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- back to netrw
map("n", "<leader>e", ":Ex<CR>", opts)
map("v", "<leader>e", ":Ex<CR>", opts)

-- write
map("n", "<leader>w", ":w<CR>", opts)
map("v", "<leader>w", ":w<CR>", opts)

-- quit. just quit.
map("n", "<leader>q", ":q<CR>", opts)
map("v", "<leader>q", ":q<CR>", opts)

-- clipboard shit
map("v", "<leader>y", '"+y', opts)
map("n", "<leader>p", '"+p', opts)
map("v", "<leader>p", '"+p', opts)

-- fix whole file indent
map("n", "<leader>=", 'ggVG=', opts)

-- remove search highlight
map("n", "<Esc>", "<cmd>nohlsearch<CR>")
