return {
	-- set default settings to a more practical value
	{
		"tpope/vim-sensible",
		lazy = false,
	},

	-- surrounding pair shortcut
	-- add, delete, change
	{
		"tpope/vim-surround",
		event = "InsertEnter",

		-- actions
		-- 'yss' -> add
		-- 'cs' -> change
		-- 'ds' -> delete

		-- USAGE
		-- add on current line
		-- 'yss<pair>'

		-- add on buffer word
		-- 'ysiw<pair>'
	},

	-- completion
	{
		"hrsh7th/nvim-cmp", -- completion engine

		dependencies = {
			"hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
			"hrsh7th/cmp-buffer", -- buffer words source
			"hrsh7th/cmp-path", -- filesystem paths source
			"L3MON4D3/LuaSnip", -- snippet engine
			"saadparwaiz1/cmp_luasnip", -- snippet completion source
		},

		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},

				mapping = cmp.mapping.preset.insert({
					["<C-j>"] = cmp.mapping.select_next_item(),
					["<C-k>"] = cmp.mapping.select_prev_item(),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					["<C-e>"] = cmp.mapping.abort(),
				}),

				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}, {
					{ name = "buffer" },
					{ name = "path" },
				}),
			})

			-- Command-line completion
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "path" },
					{ name = "cmdline" },
				},
			})

			-- path completion
			cmp.setup.cmdline("/", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
		end,
	},
}
