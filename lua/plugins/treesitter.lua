return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"windwp/nvim-ts-autotag", --auto pair alt
	},
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.config").setup({
			highlight = { enable = true },
			indent = { enable = true },

			sync_install = true,
			auto_install = true,
			ensure_installed = {
				"svelte",
				"javascript",
				"html",
				"css",
				"typescript",
				"vimdoc",
				"lua",
				"bash",
				"powershell",
				"java",
				"c_sharp",
			},

			-- incremental_selection = {
			-- 	enable = true,
			-- 	keymaps = {
			-- 		init_selection = "gnn", -- start selection
			-- 		node_incremental = "grn", -- expand to next node
			-- 		scope_incremental = "<leader>grc", -- expand to scope
			-- 		node_decremental = "grm", -- shrink
			-- 	},
			-- },
		})
	end,
}
