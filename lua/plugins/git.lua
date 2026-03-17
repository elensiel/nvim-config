local fn = vim.fn
local Plug = fn["plug#"]

local plugins = {
	-- git cmd inside nvim
	{
		repo = "tpope/vim-fugitive",
	},

	-- git changes signs
	{
		repo = "lewis6991/gitsigns.nvim",
	},
}

-- installation plugins here
vim.call("plug#begin", fn.stdpath("data") .. "/plugged")

for _, p in ipairs(plugins) do
	if p.run then
		Plug(p.repo, { ["do"] = p.run })
	else
		Plug(p.repo)
	end
end

vim.call("plug#end")

-- run config if has config
for _, p in ipairs(plugins) do
	if p.config then
		p.config()
	end
end
