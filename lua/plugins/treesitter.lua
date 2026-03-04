return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"windwp/nvim-ts-autotag", --auto tag
	},
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local language = {
			"lua",
			"powershell",
			"svelte",
			"html",
			"css",
			"typescript",
		}

		-- ensure installation
		require("nvim-treesitter").install(language)

		-- activate on what file
		vim.api.nvim_create_autocmd("FileType", {
			pattern = language,
			callback = function()
				vim.treesitter.start()
			end,
		})
	end,
}
