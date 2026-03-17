return {
	-- scrollbar (decorated)
	{
		-- much modern
		"lewis6991/satellite.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "lewis6991/gitsigns.nvim" }, -- for git hunks

		opts = {
			handlers = {
				marks = { enable = false },
				quickfix = { enable = false },
			},
		},
	},

	-- status line
	{
		"itchyny/lightline.vim",
		config = function()
			vim.g.lightline = {
				colorscheme = "simpleblack",
			}
		end,
	},
}
