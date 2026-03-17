local fn = vim.fn
local Plug = fn["plug#"]

local plugins = {
	-- colorscheme
	{
		repo = "fxn/vim-monochrome",
		config = function()
			vim.cmd("colorscheme monochrome")

			-- set bg color to pure black
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		end,
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
