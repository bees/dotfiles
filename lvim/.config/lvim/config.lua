lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "rosebones"

lvim.leader = "space"

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

lvim.plugins = {
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "mcchrish/zenbones.nvim",
    requires = "rktjmp/lush.nvim"
  },
  { "christoomey/vim-tmux-navigator" },
  { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' },
  { "luukvbaal/stabilize.nvim",
    config = function() require("stabilize").setup() end },
  { "markonm/traces.vim" },
}
