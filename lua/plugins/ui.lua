return {
	-- status line
	{
		repo = "itchyny/lightline.vim",
		config = function()
			vim.g.lightline = {
				colorscheme = "simpleblack",
			}
		end,
	},

	-- scrollbar
	{
		-- lighter
		repo = "dstein64/nvim-scrollview",

		-- interactive
		-- repo = "petertriho/nvim-scrollbar",
	},
}
