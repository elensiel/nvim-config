local o = vim.o
local g = vim.g

require('oldman.theme').LoadTheme()

-- coc.nvim requirement
o.hidden = true
o.backup = false
o.writebackup = false
o.updatetime = 300
o.shortmess = o.shortmess .. 'c'
vim.g.coc_disable_startup_warning = 1

-- netrw
vim.g.netrw_banner = 0

-- lightline
g.lightline = {
    colorscheme = 'wombat',
    background = 'dark',
}

-- ale
vim.g.ale_linters_explicit = 1 -- Only run explicitly specified linters
vim.g.ale_fix_on_save = 1 -- Run fixers on save (for .cpp/.h)
vim.g.ale_linters = {
    cpp = { 'clangd', 'cppcheck' },
    c = { 'clangd', 'cppcheck' },
    lua = { 'luacheck', 'stylua' },
}
vim.g.ale_fixers = {
    cpp = { 'clang-format' },
    c = { 'clang-format' },
    lua = { 'stylua' },
}
