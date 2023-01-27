return {
  'nvim-telescope/telescope.nvim', tag = '0.1.0',
  dependencies = { { 'nvim-lua/plenary.nvim' } },
  keys = function()
    local builtin = require('telescope.builtin')
    return {
      { '<leader>pf', builtin.find_files, 'Search files' },
      { '<C-p>', builtin.git_files, 'Search files tracked in git'},
      { '<leader>ps', function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") })
      end, 'grep files' }
    }
  end
}
