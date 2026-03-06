return {
	-- autopairs. pairs. pears?
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
	},

	-- smart commenting
	{
		-- file based
		-- 'folke/ts-comments.nvim',

		-- file + buffer
		"JoosepAlviste/nvim-ts-context-commentstring",

		-- requires treesitter
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	},
}
