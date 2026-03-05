return {
    -- set default settings to a more practical value
    {
        'tpope/vim-sensible',
        lazy = false,
    },

    -- surrounding pair shortcut
    -- add, delete, change
    {
        'tpope/vim-surround',
        event = "InsertEnter"

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
}
