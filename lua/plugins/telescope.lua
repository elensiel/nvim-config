return {
	"nvim-telescope/telescope.nvim",
	--tag = '0.1.8',
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<CR>" },
		{ "<leader>fg", "<cmd>Telescope live_grep<CR>" },
	},
	config = function()
		require("telescope").setup({
			defaults = {
				vimgrep_arguments = {
					"rg",
					"--hidden",
					"!.git/*",
				},
			},
		})
	end,
}
