vim.g.mapleader = " "
vim.g.maplocalleader = " "

local k = vim.keymap

-- Escape exits Insert mode
k.set("i", "jk", "<ESC>")

-- Clear search highlights
k.set("n", "<leader>nh", ":nohl<CR>")

-- Do not copy deleted character into registery
k.set("n", "x", '"_x"')

-- Increment and decrement numbers
k.set("n", "<leader>+", "<C-a>")
k.set("n", "<leader>-", "<C-x>")

-- Windows
k.set("n", "<leader>sv", "<C-w>v") -- split vertically
k.set("n", "<leader>sh", "<C-w>s") -- split horizontally
k.set("n", "<leader>se", "<C-w>=") -- make splits equal width
k.set("n", "<leader>sx", ":close<CR>") -- close current split

-- Tabs
k.set("n", "<leader>to", ":tabnew<CR>") -- new tab
k.set("n", "<leader>tx", ":tabclose<CR>") -- close tab
k.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
k.set("n", "<leader>tp", ":tabp<CR>") -- go to previous tab
