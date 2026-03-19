return {
	-- colorscheme
	{
		-- repo = "fxn/vim-monochrome",
		-- config = function()
		-- 	vim.cmd("colorscheme monochrome")
		--
		-- 	-- set bg color to pure black
		-- 	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		-- 	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		-- end,

		repo = "folke/tokyonight.nvim",
		config = function()
			vim.cmd("colorscheme tokyonight-night")

			-- set bg color to pure black
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		end,

		-- repo = "navarasu/onedark.nvim",
		-- opts = { ["tag"] = "v0.1.0" },
		-- config = function()
		-- 	vim.cmd("colorscheme onedark")
		--
		-- 	-- set bg color to pure black
		-- 	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		-- 	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		-- end,
	},
}
