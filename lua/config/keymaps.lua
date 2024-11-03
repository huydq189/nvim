-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

map("n", "0", "^", { noremap = true, silent = true })
map("i", "kj", "<esc>", { noremap = true, silent = true })
map("c", "kj", "<esc>", { noremap = true, silent = true })

-- windows
map("n", "<leader>W", "<C-w>", { desc = "Windows", remap = true })
map("n", "<leader>Wd", "<C-W>c", { desc = "Delete Window", remap = true })
LazyVim.toggle.map("<leader>Wm", LazyVim.toggle.maximize)

-- save
map({ "i", "x", "n", "s" }, "<leader>w", "<cmd>w<cr><esc>", { desc = "Save File" })
