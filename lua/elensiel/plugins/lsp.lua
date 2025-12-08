return {
    {
        "neovim/nvim-lspconfig",

        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "jay-babu/mason-null-ls.nvim", -- null-ls integration
            "hrsh7th/nvim-cmp",         -- completion engine
            "hrsh7th/cmp-nvim-lsp",     -- LSP source for nvim-cmp
            "hrsh7th/cmp-buffer",       -- buffer words source
            "hrsh7th/cmp-path",         -- filesystem paths source
            "L3MON4D3/LuaSnip",         -- snippet engine
            "saadparwaiz1/cmp_luasnip", -- snippet completion source
            "jose-elias-alvarez/null-ls.nvim",   -- linters and formatters
        },
        
        build = ":MasonUpdate",

        config = function()
            local lspconfig = require("lspconfig")

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
                        ["<CR>"] = cmp.mapping.confirm({ select = true }),
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
                        "clangd", -- cpp
                        "jdtls", -- java
                    },

                    -- setup installed servers
                    handlers = {
                        function(server_name)
                            lspconfig[server_name].setup {
                                capabilities = capabilities
                            }
                        end,
                    },
                })
            end

            local function setup_linter_formatter()
                local null_ls = require("null-ls")
                local mason_null_ls = require("mason-null-ls")

                -- linter/formatter to install
                local tools = {
                    formatting = {
                        "stylua", -- lua
                        "clang-format", -- cpp
                    },
                    diagnostics = {
                        "luacheck", -- lua
                        "cpplint", -- cpp
                    }
                }

                mason_null_ls.setup({
                    automatic_installation = true,
                    ensure_installed = vim.list_extend(tools.formatting, tools.diagnostics),
                })

                -- build sources
                local sources = {}
                for _, tool in ipairs(tools) do
                    if null_ls.builtins.formatting[tool] then
                        table.insert(sources, null_ls.builtins.formatting[tool])
                    elseif null_ls.builtins.diagnostics[tool] then
                        table.insert(sources, null_ls.builtins.diagnostics[tool])
                    else
                        vim.notify("[null-ls] Unknown tool: " .. tool, vim.log.levels.WARN)
                    end
                end

                -- setup autoformat that supports it
                null_ls.setup({
                    sources = sources,
                    on_attach = function(client, bufnr)
                        if client.supports_method and client.supports_method("textDocument/formatting") then
                            vim.api.nvim_clear_autocmds({ buffer = bufnr })
                            vim.api.nvim_create_autocmd("BufWritePre", {
                                buffer = bufnr,
                                callback = function()
                                    vim.lsp.buf.format({ bufnr = bufnr })
                                end,
                            })
                        end
                    end,
                })
            end

            setup_diagnostics()
            setup_completion()
            setup_lsp()
            setup_linter_formatter()
        end
    }
}
