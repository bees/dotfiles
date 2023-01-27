local plugins = {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
    config = function()
      vim.api.nvim_set_option('background', 'light')
      require('rose-pine').setup({
        dark_variant = 'main',
        disable_italics = true,

      })
      vim.cmd.colorscheme('rose-pine')
    end
  },
  { "nvim-treesitter/playground", lazy = true },
  { "mbbill/undotree",
    keys = {
      { "<leader>u", vim.cmd.UndotreeToggle }
    }
  },
  { "levouh/tint.nvim", config = true },
  { "numToStr/Navigator.nvim",
    config = true,
    keys = {
      { '<A-h>', '<CMD>NavigatorLeft<CR>', { 'n', 't' } },
      { '<A-l>', '<CMD>NavigatorRight<CR>', { 'n', 't' } },
      { '<A-k>', '<CMD>NavigatorUp<CR>', { 'n', 't' } },
      { '<A-j>', '<CMD>NavigatorDown<CR>', { 'n', 't' } },
      { '<A-p>', '<CMD>NavigatorPrevious<CR>', { 'n', 't' } },
    }
  },
  "ryanoasis/vim-devicons",
  { "simrat39/symbols-outline.nvim",
    config = true,
    keys = { { "<leader>po", vim.cmd.SymbolsOutline } }
  },
  { "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  },
  "folke/zen-mode.nvim",
  {
    "folke/trouble.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },
  "nvim-lua/lsp-status.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    config = function()
      require("lsp_signature").setup({})
    end,
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require("indent_blankline").setup({
        char = "│",
        context_char = "│",
        space_char_blankline = " ",
        use_treesitter = true,
        show_current_context = true,
        show_current_context_start = false,
        show_trailing_blankline_indent = false,
        filetype_exclude = {
          "TelescopePrompt",
          "help",
          "txt",
          "markdown",
        },
        buftype_exclude = { "terminal", "nofile" },
      })
    end
  },
  { "j-hui/fidget.nvim", opts = {
    text = {
      spinner = "dots_pulse",
      done = "",
      commenced = "Started",
      completed = "Completed",
    },
    window = {
      relative = "win",
      blend = 0,
      zindex = nil,
      border = "none",
    },
  } },
  { 'sindrets/diffview.nvim', dependencies = 'nvim-lua/plenary.nvim' },
}

local plugins_dir = vim.fn.stdpath('config') .. '/lua/bees/plugins'

for fname in vim.fs.dir(plugins_dir) do
  if fname ~= 'init.lua' and fname:sub(-4) == '.lua' then
    table.insert(plugins, require('bees.plugins.' .. fname:gsub("%.lua", "")))
  end
end



return require('lazy').setup(plugins)
