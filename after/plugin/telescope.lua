local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', function()
	if not pcall(function () builtin.git_files{show_untracked=true} end) then
		builtin.find_files()
	end
end)
vim.keymap.set('n', '<leader>c', builtin.commands)
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ")  })
end)
