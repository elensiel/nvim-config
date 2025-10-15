-- Automatically install vim-plug if it's not installed
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/autoload/plug.vim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
        'curl', '-fLo', install_path, '--create-dirs',
        'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    })
end

-- Call vim-plug plugin system using vim.cmd
vim.cmd [[
call plug#begin(stdpath('data') . '/plugged')

" Editing
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
Plug 'jiangmiao/auto-pairs'

" Git
"Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-fugitive'

" LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'sheerun/vim-polygot'
Plug 'dense-analysis/ale'

" Nav
Plug 'kien/ctrlp.vim'

" Theme
Plug 'fxn/vim-monochrome'

" UI
Plug 'itchyny/lightline.vim'
"Plug 'nvim-tree/nvim-web-devicons'

call plug#end()
]]
