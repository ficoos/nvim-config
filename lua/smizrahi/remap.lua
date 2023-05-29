-- this is not the real initialization and is here for documentation purposes
-- lazy.nvim requires that the leader be defined *before* it's loaded so it's
-- actually defined in lazy.lua
vim.g.mapleader = "\\"

vim.keymap.set("n", "<leader>b", vim.cmd.Ex, { desc = "netrw: Browse current directory" })
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "]c", ":cnext<CR>", { desc = "quickfix: Go to next" })
vim.keymap.set("n", "[c", ":cprevious<CR>", { desc = "quickfix: Go to previous" })
vim.keymap.set("n", "<leader>c", ":cclose<CR>", { desc = "quickfix: close" })

-- move with alt+direction
--vim.keymap.set("n", "<M-l>", "<c-w>l")
--vim.keymap.set("n", "<M-h>", "<c-w>h")
--vim.keymap.set("n", "<M-j>", "<c-w>j")
--vim.keymap.set("n", "<M-k>", "<c-w>k")
--vim.keymap.set("n", "<M-Left>", "<c-w><Left>")
--vim.keymap.set("n", "<M-Right>", "<c-w><Right>")
--vim.keymap.set("n", "<M-Up>", "<c-w><Up>")
--vim.keymap.set("n", "<M-Down>", "<c-w><Down>")
--
--vim.keymap.set("t", "<M-l>", "<c-\\><c-n><c-w>l")
--vim.keymap.set("t", "<M-h>", "<c-\\><c-n><c-w>h")
--vim.keymap.set("t", "<M-j>", "<c-\\><c-n><c-w>j")
--vim.keymap.set("t", "<M-k>", "<c-\\><c-n><c-w>k")
--vim.keymap.set("t", "<M-Left>", "<c-\\><c-n><c-w><Left>")
--vim.keymap.set("t", "<M-Right>", "<c-\\><c-n><c-w><Right>")
--vim.keymap.set("t", "<M-Up>", "<c-\\><c-n><c-w><Up>")
--vim.keymap.set("t", "<M-Down>", "<c-\\><c-n><c-w><Down>")
--vim.keymap.set("t", "<leader>/", "<c-\\><c-n>\\/")

-- resize with alt+shift+direction
vim.keymap.set("n", "<M-S-h>", "<c-S-w><")
vim.keymap.set("n", "<M-S-l>", "<c-S-w>>")
vim.keymap.set("n", "<M-S-j>", "<c-S-w>+")
vim.keymap.set("n", "<M-S-k>", "<c-S-w>-")
vim.keymap.set("n", "<M-S-Left>", "<c-S-w><")
vim.keymap.set("n", "<M-S-Right>", "<c-S-w>>")
vim.keymap.set("n", "<M-S-Up>", "<c-S-w>+")
vim.keymap.set("n", "<M-S-Down>", "<c-S-w>-")

vim.keymap.set("n", "<C-w>z", "<C-w>|<C-w>_")
vim.keymap.set("n", "<C-w> ", "<C-w>=")

vim.keymap.set("n", "<leader>q", ":bnext | bdelete #<CR>", { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Write buffer" })
vim.keymap.set("n", "<leader>t", ":terminal<CR>i", { desc = "Create terminal" })
vim.keymap.set("t", "<Esc>", "<C-\\><C-N>")
vim.keymap.set("t", "<C-]>", "<C-\\><C-o>p")

--- @param where "above" | "below"
local function add_empty_line(where)
    local cursor = vim.api.nvim_win_get_cursor(0)
    local row, col = cursor[1], cursor[1]
    local line = vim.api.nvim_get_current_line()
    if where == "above" then
        vim.api.nvim_buf_set_lines(0, row - 1, row, false, { "", line })
        vim.api.nvim_win_set_cursor(0, { row + 1, col })
    elseif where == "below" then
        vim.api.nvim_buf_set_lines(0, row - 1, row, false, { line, "" })
    end
end

vim.keymap.set("n", "[ ", function() add_empty_line("above") end, { desc = "Add empty line above" })
vim.keymap.set("n", "] ", function() add_empty_line("below") end, { desc = "Add empty line below" })

vim.cmd [[ autocmd BufWinEnter,WinEnter term://* startinsert ]]
vim.cmd [[ autocmd BufLeave term://* stopinsert ]]
