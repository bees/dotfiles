local set = vim.keymap.set
vim.g.mapleader = " "
set("n", "Q", "<nop>")
set("n", "<leader>f", vim.lsp.buf.format)

-- move line
set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

-- void register convince binds
set("x", "<leader>p", [["_dP]])
set({ "v" }, "<leader>d", [["_d]])

-- sys clipboard register convience binds
set({ "n", "v" }, "<leader>y", [["+y]])
set("n", "<leader>Y", [["+Y]])

-- avoid polluting loclist
set("n", "<leader>k", "<cmd>cnext<CR>zz")
set("n", "<leader>j", "<cmd>cprev<CR>zz")
set("n", "J", "mzJ`z")
set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")
