local tree = require("nvim-tree")
tree.setup()

vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)
