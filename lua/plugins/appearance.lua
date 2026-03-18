return {
	-- colorscheme
	{
		repo = "fxn/vim-monochrome",
		config = function()
			vim.cmd("colorscheme monochrome")

			-- set bg color to pure black
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		end,
	},
}
