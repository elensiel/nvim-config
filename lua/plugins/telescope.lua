return {
    'nvim-telescope/telescope.nvim',

    dependencies = {
        'nvim-lua/plenary.nvim',

        -- sorter (optional)
        -- { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },

    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<CR>" },
        { "<leader>fg", "<cmd>Telescope git_files<CR>" },
        { "<leader>fb", "<cmd>Telescope live_grep<CR>" },
    },

    config = function()
        require("telescope").setup({
            defaults = {
                mappings = {
                    i = {
                        -- clear prompt
                        ['<C-u>'] = false,
                    },
                },

                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                    -- "--hidden",
                    "--glob", "!.git/*",
                },
            },

            pickers = {
                find_files = {
                    find_command = {
                        "fd",
                        "--type", "f",
                        "--hidden",
                        "--follow", -- follow symlinks (optional)
                        "--strip-cwd-prefix",
                        "--exclude", ".git",
                    }
                },
            },
        })
    end,
}
