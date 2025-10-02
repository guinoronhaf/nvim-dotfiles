require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "ç", "$a", { noremap = true, desc = "Skip to the end of the line." })
map("n", "vg", "<Cmd>normal!ggVG<CR>", { desc = "Select everything." })
map("t", "<ESC>", "<C-\\><C-n>", { desc = "Exit terminal mode." })
map("v", "ss", ":s/")

-- resizing windows
map("n", "<C-Down>", "<Cmd>resize -1<CR>")
map("n", "<C-Up>", "<Cmd>resize +1<CR>")
map("n", "<C-Right>", "<Cmd>vertical resize -1<CR>")
map("n", "<C-Left>", "<Cmd>vertical resize +1<CR>")
map("n", "H", "<Cmd>nohlsearch<CR>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
