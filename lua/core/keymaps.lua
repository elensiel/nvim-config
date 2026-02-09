local map = vim.keymap.set
local opts = { noremap = true, silent = true}

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

-- fix whole file indent
map("n", "<leader>=", 'ggVG=', opts)

-- found @ /plugins/ui.lua -> minimap
-- map('n', '<Leader>mc', MiniMap.close)
-- map('n', '<Leader>mf', MiniMap.toggle_focus)
-- map('n', '<Leader>mo', MiniMap.open)
-- map('n', '<Leader>mr', MiniMap.refresh)
-- map('n', '<Leader>ms', MiniMap.toggle_side)
-- map('n', '<Leader>mt', MiniMap.toggle)
