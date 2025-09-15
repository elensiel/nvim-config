local function compile_and_run_cpp()
    vim.cmd('write') -- save cur file

    -- for gcc arguments
    local filepath = vim.fn.expand('%:p')
    local filename = vim.fn.expand('%:t:r')

    -- compile 
    local compile_cmd = string.format('g++ -o "%s" "%s"', filename, filepath)

    -- run
    local compile_output = vim.fn.system(compile_cmd)
    local compile_status = vim.v.shell_error

    -- if there is compile error
    if compile_status ~= 0 then
        print("Compilation failed:\n" .. compile_output)
        return
    end

    -- Compilation succeeded, run executable
    -- We use :terminal to run interactively in a new terminal buffer
    vim.cmd('tabnew') -- Open new tab for output
    vim.cmd(string.format('terminal ./%s', filename))
end

-- keybinding
-- simple call
vim.api.nvim_set_keymap('n', '<leader>r', '', { noremap=true, silent=true, callback = compile_and_run_cpp })

-- more complex call for future reference
-- vim.api.nvim_set_keymap('n', '<leader>r', 
--   '<cmd>lua(' ..
--   'function() compile_and_run_c() end' ..
--   ')()<CR>', 
--   { noremap = true, silent = true }
-- )
