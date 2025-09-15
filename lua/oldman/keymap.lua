local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local api = vim.api.nvim_set_keymap

-- ctrlp
map("n", "<leader>ff", ":CtrlP<CR>", opts)
map("n", "<leader>fg", ":CtrlPBuffer<CR>", opts)

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
