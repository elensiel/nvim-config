return {
	-- colorscheme
	{
		"aktersnurra/no-clown-fiesta.nvim",
		priority = 1000,
		lazy = false,
		config = function()
			require("no-clown-fiesta").setup({
				theme = "dim",

				-- enabled for floating window transparency
				-- ex. lazy, mason, telescope
				transparent = true,
				styles = {
					type = { bold = true },
					lsp = { underline = true },
					match_paren = { underline = true },
				},
			})

			--activate
			vim.cmd("colorscheme no-clown-fiesta")

			-- set bg color to pure black
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		end,
	},

	-- syntax highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",

		dependencies = {
			"windwp/nvim-ts-autotag", -- html auto tag
		},

		config = function()
			local language = {
				"lua",
				"powershell",
				"svelte",
				"html",
				"css",
				"typescript",
				-- "markdown",
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
	},
}
