-- this is not the real initialization and is here for documentation purposes
-- lazy.nvim requires that the leader be defined *before* it's loaded so it's
-- actually defined in lazy.lua
vim.g.mapleader = "\\"

vim.keymap.set("n", "<leader>b", vim.cmd.Ex, { desc = "netrw: Browse current directory" })
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>]", ":cnext<CR>", { desc = "quickfix: Go to next error" })
vim.keymap.set("n", "<leader>[", ":cprevious<CR>", { desc = "quickfix: Go to previous error" })
