return {
	{
		repo = "ctrlpvim/ctrlp.vim",
		config = function()
			local map = vim.keymap.set
			local opts = { noremap = true, silent = true }

			map("n", "<leader>ff", ":CtrP<CR>", opts)
			map("n", "<leader>fb", ":CtrPBuffer<CR>", opts)
		end,
	},
}
