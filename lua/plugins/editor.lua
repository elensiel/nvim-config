return {
    -- beautify TODO NOTE HACK PERF FIX WARNING comments
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
    },

    -- show diagnostics, refs
    -- {
    --     "folke/trouble.nvim",
    --     opts = {}, -- for default options, refer to the configuration section for custom setup.
    --     cmd = "Trouble",
    --     keys = {
    --         {
    --             "<leader>xx",
    --             "<cmd>Trouble diagnostics toggle<cr>",
    --             desc = "Diagnostics (Trouble)",
    --         },
    --         {
    --             "<leader>xX",
    --             "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
    --             desc = "Buffer Diagnostics (Trouble)",
    --         },
    --         {
    --             "<leader>cs",
    --             "<cmd>Trouble symbols toggle focus=false<cr>",
    --             desc = "Symbols (Trouble)",
    --         },
    --         {
    --             "<leader>cl",
    --             "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
    --             desc = "LSP Definitions / references / ... (Trouble)",
    --         },
    --         {
    --             "<leader>xL",
    --             "<cmd>Trouble loclist toggle<cr>",
    --             desc = "Location List (Trouble)",
    --         },
    --         {
    --             "<leader>xQ",
    --             "<cmd>Trouble qflist toggle<cr>",
    --             desc = "Quickfix List (Trouble)",
    --         },
    --     },
    -- }

    -- commenting shortcut
    {
        'tpope/vim-commentary',
        event = "VeryLazy",
        -- gcc -> comment line
        -- gc -> comment selected
        -- gcap -> comment paragraph
    },

    -- set default settings to a more practical value
    {
        'tpope/vim-sensible',
        lazy = false,
    },

    -- surrounding shortcut
    {
        'tpope/vim-surround',
        event = "InsertEnter"
    },
}
