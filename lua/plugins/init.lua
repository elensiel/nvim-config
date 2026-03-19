local fn = vim.fn
local Plug = fn["plug#"]

-- placeholder for all plugins
local plugins = {}

-- pull plugins from each file
local files = {
	"appearance",
	"behavior",
	"editor",
	"finder",
	"git",
	"lsp",
	"ui",
}

-- append plugins from files
for _, f in ipairs(files) do
	for _, p in ipairs(require("plugins." .. f)) do
		table.insert(plugins, p)
	end
end

-- installation plugins here
vim.call("plug#begin", fn.stdpath("data") .. "/plugged")

for _, p in ipairs(plugins) do
	if p.opts then
		Plug(p.repo, p.opts)
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
