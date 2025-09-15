local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local api = vim.api.nvim_set_keymap

vim.g.mapleader = " "

-- netrw
map("n", "<leader>e", ':Ex<CR>')

-- auto completion
api("i", "<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true, noremap = true, silent = true })
api("i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<C-h>"]], { expr = true, noremap = true, silent = true })
-- api("i", "<CR>", [[pumvisible() ? coc#_select_confirm() : "\<CR>"]], { expr = true, noremap = true, silent = true })

-- clipboard shit
map("x", "<leader>c", ':w !xclip -selection clipboard<CR><CR>', opts)
map("x", "<leader>v", '"+p', opts)
map("x", "<leader>V", '"+P', opts)

-- vim-surround
-- add
api("n", "<leader>sa", "yiwS", opts)
api("v", "<leader>sa", "S(", opts)
-- change
api("n", "<leader>sc", "cs\"'", opts)
api("v", "<leader>sc", "cs\"'", opts)
-- delete
api("n", "<leader>sd", "ds(", opts)
api("v", "<leader>sd", "ds(", opts)

-- EasyAlign
-- map("x", "<leader>ga", "<Plug>(EasyAlign)", {})
-- map("n", "<leader>ga", "<Plug>(EasyAlign)", {})

-- write and quit
map("n", "<leader>w", ":w<CR>", opts)
map("v", "<leader>w", ":w<CR>", opts)
map("n", "<leader>q", ":q<CR>", opts)
map("v", "<leader>q", ":q<CR>", opts)

-- fix indent
map("n", "<leader>=", "ggVG=", opts)
map("v", "<leader>=", "ggVG=", opts)

-- ctrlp
map("n", "<leader>ff", ":CtrlP<CR>", opts)
map("n", "<leader>fg", ":CtrlPBuffer<CR>", opts)
