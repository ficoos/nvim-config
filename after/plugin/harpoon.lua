local mark = require "harpoon.mark"
local ui = require "harpoon.ui"

vim.keymap.set("n", "<leader>a", function ()
    mark.add_file()
    print("harpoon: file added")
end)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

