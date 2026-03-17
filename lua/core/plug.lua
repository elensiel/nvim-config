-- automatically install vim-plug

local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/autoload/plug.vim"

if (fn.empty(fn.glob(install_path))) > 0 then
	fn.system({
		"curl",
		"-fLo",
		install_path,
		"--create-dirs",
		"https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim",
	})
end
