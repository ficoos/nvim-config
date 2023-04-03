local function add_file()
    local mark = require "harpoon.mark"
    mark.add_file()
    print("harpoon: file added")
end
local function toggle_menu()
    local ui = require "harpoon.ui"
    ui.toggle_quick_menu()
end
return {
    'ThePrimeagen/harpoon',
    dependencies = {
        { 'nvim-lua/plenary.nvim' },
    },
    keys = {
        { "<leader>a", add_file,    desc = "Harpoon: Add file" },
        { "<C-e>",     toggle_menu, desc = "Harpoon: Toggle menu" },
    }
}
