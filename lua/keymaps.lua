local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local api = vim.api.nvim_set_keymap

vim.g.mapleader = " "

-- back to netrw
map("n", "<leader>e", ":Ex<CR>", opts)
map("v", "<leader>e", ":Ex<CR>", opts)

-- fix indent then write
map("n", "<leader>w", "ggVG=:w<CR>", opts)
map("v", "<leader>w", ":normal ggVG=:w<CR>", opts)

-- quit. just quit.
map("n", "<leader>q", ":q<CR>", opts)
map("v", "<leader>q", ":q<CR>", opts)

-- clipboard shit
map("v", "<leader><C-C>", '"+y', opts)
map("n", "<leader><C-V>", '"+p', opts)
