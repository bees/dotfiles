require("telescope").setup {
  extensions = {
    file_browser = {
      hijack_netrw = true,
    }
  }
}
local telescope = require("telescope")
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

telescope.load_extension "file_browser"
vim.keymap.set('n', '<leader>e', telescope.extensions.file_browser._picker, {})
