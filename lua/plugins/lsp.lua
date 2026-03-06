return {
	-- lsp + formatter
	-- NOTE -> why formatter is here?
	-- easy config for each language
	-- via 'languages' table
	{
		"neovim/nvim-lspconfig", -- lsp config and launcher

		dependencies = {
			"williamboman/mason.nvim", -- lsp installer
			"williamboman/mason-lspconfig.nvim", -- lsp and mason connector
			"stevearc/conform.nvim", -- formatter
		},

		config = function()
			local languages = {
				-- core
				lua = { server = "lua_ls", formatter = { "prettierd", "prettier" } },
				powershell = { server = "powershell_es", formatter = nil },
				java = { server = "jdtls", formatter = { "prettierd", "prettier" } },

				-- web dev
				html = { server = "html", formatter = { "prettierd", "prettier" } },
				css = { server = "cssls", formatter = { "prettierd", "prettier" } },
				-- javascript = { server = "tsserver", formatter = { "prettierd", "prettier" } },
				typescript = { server = "ts_ls", formatter = { "prettierd", "prettier" } },
				svelte = { server = "svelte", formatter = { "prettierd", "prettier" } },

				-- misc
				json = { server = nil, formatter = { "prettierd", "prettier" } },
				markdown = { server = "marksman", formatter = { "prettierd", "prettier" } },
			}

			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
			})

			require("mason").setup()

			local lspconfig = vim.lsp.config
			local capabilities = vim.tbl_deep_extend(
				"force",
				{},
				vim.lsp.protocol.make_client_capabilities(),
				require("cmp_nvim_lsp").default_capabilities()
			)

			local servers = {}
			for _, lang in pairs(languages) do
				if lang.server then
					table.insert(servers, lang.server)
				end
			end

			require("mason-lspconfig").setup({
				ensure_installed = servers,

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

					-- svelte override
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

			local conform = require("conform")
			local formatters = {}
			for ft, lang in pairs(languages) do
				if lang.formatter then
					formatters[ft] = lang.formatter
				end
			end

			conform.setup({
				formatters_by_ft = formatters,
				format_on_save = {
					timeout_ms = 1000,
					lsp_fallback = true,
				},

				-- manual format keybind
				vim.keymap.set({ "n", "v" }, "<leader>=", function()
					conform.format({
						async = true,
						lsp_fallback = true,
					})
				end),
			})
		end,
	},
}
