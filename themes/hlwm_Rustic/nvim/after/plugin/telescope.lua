local builtin = require('telescope.builtin')
vim.keymap.set('n', '_', builtin.find_files, {})
vim.keymap.set('n', '<C-_>', builtin.git_files, {})
vim.keymap.set('n', '<C-j>', function() 
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
