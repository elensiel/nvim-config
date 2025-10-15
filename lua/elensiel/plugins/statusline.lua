-- return {
--     {
--         "nvim-lualine/lualine.nvim",
--         -- lazy = false,
--         dependencies = { 
--             { 'nvim-tree/nvim-web-devicons'}, 
--             { 'lewis6991/gitsigns.nvim' },
--         },
--         config = function()
--             require("lualine").setup({
--                 options = {
--                     icons_enabled = true,
--                     theme = 'onedark',
--                 },
--             })
--         end
--     }
-- }

return {
    {
        "itchyny/lightline.vim",
        config = function()
            vim.g.lightline = {
                colorscheme = 'simpleblack',
            }
        end
    }
}
