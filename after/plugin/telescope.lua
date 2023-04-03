local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', function()
    if not pcall(function() builtin.git_files { show_untracked = true } end) then
        builtin.find_files()
    end
end)

vim.keymap.set('n', '<leader>\\', function()
    builtin.current_buffer_fuzzy_find()
end, { desc = "Fuzzy find in buffer" })
vim.keymap.set('n', '<leader>c', builtin.commands, { desc = "Show commands" })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = 'Search Diagnostics' })
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = 'Search Bbuffers' })
