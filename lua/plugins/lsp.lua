return {
	-- lsp
	{
		repo = "neoclide/coc.nvim",
		opts = { ["branch"] = "release" },
		config = function()
			local opt = vim.opt

			-- Some servers have issues with backup files, see #649
			opt.backup = false
			opt.writebackup = false

			-- Always show the signcolumn, otherwise it would shift the text each time
			-- diagnostics appeared/became resolved
			opt.signcolumn = "yes"

			local map = vim.keymap.set
			local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }

			-- navigate thru completion
			map(
				"i",
				"<C-j>",
				'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()',
				opts
			)
			map("i", "<C-k>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

			-- accept selected item
			map(
				"i",
				"<C-y>",
				[[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]],
				opts
			)
		end,
	},

	-- treesitter alt
	-- {
	-- 	repo = "sheerun/polyglot",
	-- },

	-- linter and fixer
	-- {
	-- 	repo = "dense-analysis/ale",
	-- },
}
