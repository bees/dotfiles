vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use({
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim' } }
  })

  use({
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      vim.api.nvim_set_option('background', 'light')
      require('rose-pine').setup({
        dark_variant = 'main',
        disable_italics = true,

      })
      vim.cmd.colorscheme('rose-pine')
    end
  })

  use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
  use 'nvim-treesitter/playground'
  use 'theprimeagen/harpoon'
  use 'mbbill/undotree'
  use 'lewis6991/gitsigns.nvim'
  use 'levouh/tint.nvim'
  --use 'alexghergh/nvim-tmux-navigation'
  use 'numToStr/Navigator.nvim'
  use 'ryanoasis/vim-devicons'
  use 'rktjmp/lush.nvim'
  use 'simrat39/symbols-outline.nvim'
  use { 'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons'
    }
  }
  use({ "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  })
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }
  use("folke/zen-mode.nvim")
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
  use 'nvim-lua/lsp-status.nvim'
  use {
    'nvim-lualine/lualine.nvim',
    after = 'lsp-status.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    config = function()
      require("lsp_signature").setup({})
    end,
  }
  use {
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
  }
  use "j-hui/fidget.nvim"
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
end)
