return {
    { 
        'jiangmiao/auto-pairs',
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
    }
}
