return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true },
  opts = {
        options = {
          icons_enabled = false,
          theme = 'rose-pine-alt'
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch' },
          lualine_c = { { 'filename', path = 1 } },
          lualine_x = {
            {
              'diagnostics',
              sources = { 'nvim_diagnostic' },
              sections = { 'error', 'warn', 'info', 'hint' },
            }
          },
          lualine_y = { 'filetype' },
          lualine_z = { 'location' }
        },
      }
}
