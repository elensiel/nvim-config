function LoadTheme()
    vim.cmd("colorscheme no-clown-fiesta")
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    "aktersnurra/no-clown-fiesta.nvim",
    priority = 1000,
    lazy = false,
    config = function()
        require("no-clown-fiesta").setup({
            theme = "dim",
            transparent = true,
            styles = {
                type = { bold = true },
                lsp = { underline = true },
                match_paren = { underline = true },
            },
        })

        LoadTheme()
    end,
}
