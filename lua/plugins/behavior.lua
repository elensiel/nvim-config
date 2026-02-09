return {
    -- commenting support for diff languages
    {
        "folke/ts-comments.nvim",
        opts = {},
        event = "VeryLazy",
        enabled = vim.fn.has("nvim-0.10.0") == 1,
    },

    -- autopairs. pairs.
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {},
    },
}
