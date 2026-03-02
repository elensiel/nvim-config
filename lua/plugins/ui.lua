return {
    -- file explorer icons
    -- {
    --     'nvim-mini/mini.icons',
    --     version = false,
    --     config = function()
    --         require("mini.icons").setup()
    --     end,
    -- },

    -- minimap
    -- {
    --     "nvim-mini/mini.map",
    --     dependencies = {
    --         "nvim-mini/mini.diff",
    --     },
    --     version = false,
    --     config = function()
    --         require("mini.map").setup()

    --         local map = vim.keymap.set
    --         map('n', '<Leader>mc', MiniMap.close)
    --         map('n', '<Leader>mf', MiniMap.toggle_focus)
    --         map('n', '<Leader>mo', MiniMap.open)
    --         map('n', '<Leader>mr', MiniMap.refresh)
    --         map('n', '<Leader>ms', MiniMap.toggle_side)
    --         map('n', '<Leader>mt', MiniMap.toggle)
    --     end,
    -- },

    -- status line
    {
        "itchyny/lightline.vim",
        config = function()
            vim.g.lightline = {
                colorscheme = 'simpleblack',
            }
        end,
    }
}
