local fn = vim.fn
local Plug = fn['plug#']
local plugins = {}

for _, p in ipairs(require("plugins.appearance")) do
		table.insert(plugins, p) end
for _, p in ipairs(require("plugins.git")) do
		table.insert(plugins, p) end
for _, p in ipairs(require("plugins.ui")) do
		table.insert(plugins, p) end


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
