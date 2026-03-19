return {
	-- set default settings to a more practical value
	{
		repo = "tpope/vim-sensible",
	},

	-- surrounding pair shortcut
	-- add, delete, change
	{
		repo = "tpope/vim-surround",

		-- actions
		-- 'yss' -> add
		-- 'cs' -> change
		-- 'ds' -> delete

		-- USAGE
		-- add on current line
		-- 'yss<pair>'

		-- add on buffer word
		-- 'ysiw<pair>'
	},

	-- map commenting ('gcc')
	{
		repo = "tpope/vim-commentary",
	},
}
