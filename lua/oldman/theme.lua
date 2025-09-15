local M = {}

function M.LoadTheme(color)
    color = color or "monochrome"
    vim.cmd("colorscheme " .. color)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return M

