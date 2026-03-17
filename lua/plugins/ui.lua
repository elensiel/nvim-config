local fn = vim.fn
local Plug = fn["plug#"]

local plugins = {
	-- status line
	{
		repo = "itchyny/lightline.vim",
		config = function()
			vim.g.lightline = {
				colorscheme = "simpleblack",
			}
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
