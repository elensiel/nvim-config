return {
	-- autopairs. pairs. pears?
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},

	-- smart commenting
	{
		-- file based
		-- 'folke/ts-comments.nvim',

		-- file + buffer
		-- requires treesitter tho
		"JoosepAlviste/nvim-ts-context-commentstring",

		-- requires treesitter
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	},
}
