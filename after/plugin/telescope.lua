local builtin = require('telescope.builtin')

require('which-key').register({ s = { name = "Search" } }, { prefix = "<leader>" })

vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = "Search files" })
vim.keymap.set('n', '<C-p>', function()
    if not pcall(function() builtin.git_files { show_untracked = true } end) then
        builtin.find_files()
    end
end)

vim.keymap.set('n', '<leader>\\', function()
    builtin.current_buffer_fuzzy_find()
end, { desc = "Fuzzy find in buffer" })
vim.keymap.set('n', '<leader>p', builtin.commands, { desc = "Show commands" })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = 'Search Diagnostics' })
vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = 'Search Buffers' })
vim.keymap.set('n', '<leader>/', builtin.buffers, { desc = 'Search Buffers' })
