return {
	{
		"neovim/nvim-lspconfig",

		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/nvim-cmp", -- completion engine
			"hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
			"hrsh7th/cmp-buffer", -- buffer words source
			"hrsh7th/cmp-path", -- filesystem paths source
			"L3MON4D3/LuaSnip", -- snippet engine
			"saadparwaiz1/cmp_luasnip", -- snippet completion source
			"stevearc/conform.nvim", -- formatter
		},

		build = ":MasonUpdate",

		config = function()
			local lspconfig = vim.lsp.config

			local function setup_diagnostics()
				vim.diagnostic.config({
					virtual_text = true,
					signs = true,
					underline = true,
					update_in_insert = false,
					severity_sort = true,
				})
			end

			local function setup_completion()
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
						["<C-n>"] = cmp.mapping.abort(),
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

				cmp.setup.cmdline("/", {
					mapping = cmp.mapping.preset.cmdline(),
					sources = {
						{ name = "buffer" },
					},
				})
			end

			local function setup_lsp()
				require("mason").setup()

				-- LSP capabilities
				local cmp_lsp = require("cmp_nvim_lsp")
				local capabilities = vim.tbl_deep_extend(
					"force",
					{},
					vim.lsp.protocol.make_client_capabilities(),
					cmp_lsp.default_capabilities()
				)

				-- install servers
				require("mason-lspconfig").setup({
					automatic_installation = true,
					ensure_installed = {
						"lua_ls", -- lua
						"powershell_es", -- ps
						-- "clangd", -- cpp
						"cssls",
						"jdtls", -- java
						"ts_ls", -- typescript
						"svelte", -- svelte, duh
					},

					-- setup installed servers
					handlers = {
						function(server_name)
							lspconfig[server_name].setup({
								capabilities = capabilities,
								on_attach = function(client)
									client.server_capabilities.documentFormattingProvider = false
								end,
							})
						end,

						-- svelte
						["svelte"] = function()
							lspconfig.svelte.setup({
								capabilities = capabilities,
								on_attach = function(client)
									client.server_capabilities.documentFormattingProvider = false

									vim.api.nvim_create_autocmd("BufWritePost", {
										pattern = { "*.js", "*.ts" },
										callback = function()
											client.notify("$/onDidChangeTsOrJsFile", {
												uri = vim.uri_from_bufnr(0),
											})
										end,
									})
								end,
							})
						end,
					},
				})
			end

			local function setup_linter_formatter()
				local conform = require("conform")

				conform.setup({
					formatters_by_ft = {
						lua = { "stylua" },
						-- lua = { "prettierd", "prettier" },
						javascript = { "prettierd", "prettier" },
						typescript = { "prettierd", "prettier" },
						javascriptreact = { "prettierd", "prettier" },
						typescriptreact = { "prettierd", "prettier" },
						svelte = { "prettierd", "prettier" },
						css = { "prettierd", "prettier" },
						html = { "prettierd", "prettier" },
						json = { "prettierd", "prettier" },
						markdown = { "prettierd", "prettier" },
					},

					format_on_save = {
						timeout_ms = 500,
						lsp_fallback = true,
					},
					-- cwd = "buffer",
				})
			end

			setup_diagnostics()
			setup_completion()
			setup_lsp()
			setup_linter_formatter()
		end,
	},
}
