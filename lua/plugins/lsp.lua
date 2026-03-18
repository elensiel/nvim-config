local languages = {
	-- NVIM CORE
	lua = {
		server = "lua_ls",
		formatter = { "stylua" },
	},

	-- comment for linux systems
	-- powershell = {
	-- 	server = "powershell_es",
	-- 	formatter = nil,
	-- },

	bash = {
		formatter = { "shfmt" },
	},

	sh = {
		formatter = { "shfmt" },
	},

	-- WEB DEV STUFF
	html = {
		server = "html",
		formatter = { "prettierd", "prettier" },
	},

	css = {
		server = "cssls",
		formatter = { "prettierd", "prettier" },
	},

	typescript = {
		server = "ts_ls",
		formatter = { "prettierd", "prettier" },
	},

	svelte = {
		server = "svelte",
		formatter = { "prettierd", "prettier" },
	},

	-- MISC
	json = {
		server = nil,
		formatter = { "prettierd", "prettier" },
	},

	markdown = {
		server = "marksman",
		formatter = { "prettierd", "prettier" },
	},
}

-- cache servers and formatters
-- by looping once
-- 'seen' table for duplication checking
local servers, seen = {}, {}
local formatters = {}
for ft, lang in pairs(languages) do
	if lang.server and not seen[lang.server] then
		table.insert(servers, lang.server)
		seen[lang.server] = true
	end
	if lang.formatter then
		formatters[ft] = lang.formatter
	end
end

return {
	-- actual lsp setup here
	{
		"neovim/nvim-lspconfig", -- lsp config and launcher

		-- launch lsp on file launch
		event = { "BufReadPre", "BufNewFile" },

		dependencies = {
			"williamboman/mason.nvim", -- lsp installer
			"williamboman/mason-lspconfig.nvim", -- lsp and mason connector
		},

		config = function()
			vim.diagnostic.config({
				virtual_text = true, -- inline error msg
				-- signs = true, --  gutter signs
				underline = true,
				update_in_insert = false,
				severity_sort = true,
			})
		end,
	},

	-- lsp server manager
	{
		"williamboman/mason.nvim", -- lsp installer
		build = "MasonUpdate",

		dependencies = {
			"williamboman/mason-lspconfig.nvim", -- lsp and mason connector
		},

		config = function()
			require("mason").setup()

			local lspconfig = vim.lsp.config
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local function on_attach(client, bufnr)
				client.server_capabilities.documentFormattingProvider = false
			end

			require("mason-lspconfig").setup({
				ensure_installed = servers,

				-- setup installed servers
				handlers = {
					function(server_name)
						lspconfig[server_name].setup({
							capabilities = capabilities,
							on_attach = on_attach,
						})
					end,

					-- svelte override
					["svelte"] = function()
						lspconfig.svelte.setup({
							capabilities = capabilities,
							on_attach = function(client, bufnr)
								on_attach(client, bufnr)

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
		end,
	},

	-- formatter
	{
		"stevearc/conform.nvim",
		event = "BufReadPre",

		config = function()
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = formatters,

				-- async formatting on save
				format_on_save = function(bufnr)
					return {
						timeout_ms = 1000,
						lsp_fallback = true,
					}
				end,

				default_format_opts = {
					stop_after_first = true,
				},
			})

			-- manual format keybind
			vim.keymap.set({ "n", "v" }, "<leader>=", function()
				conform.format({
					async = true,
					lsp_fallback = true,
				})
			end)
		end,
	},
}
