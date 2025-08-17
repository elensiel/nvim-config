return {
    -- { 
    --     'jiangmiao/auto-pairs',
    --     -- enabled = false,
    -- },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {},
    },
    {
        'tpope/vim-commentary',
        lazy = false,
    },
    { 
        'tpope/vim-sensible',
        lazy = false,
    },
    {
        'junegunn/vim-easy-align',
        lazy = false,
    },
    { 
        'tpope/vim-surround',
        lazy = false,
    },
    {
        'lewis6991/impatient.nvim',
        lazy = false,
        config = function()
            require("impatient")
        end
    },
    {
        'dense-analysis/ale'
    },
    -- {
    --     'lewis6991/gitsigns.nvim'
    -- },
    {
        'tpope/vim-fugitive'
    },
    -- {
    --     "famiu/feline.nvim",
    --     -- lazy = false,
    --     dependencies = { 
    --         'nvim-tree/nvim-web-devicons', 
    --     },
    --     config = function()
    --         require("feline").setup()
    --     end
    -- },
}
