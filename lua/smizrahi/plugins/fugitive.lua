return {
    'tpope/vim-fugitive',
    dependencies = { 'folke/which-key.nvim' },
    config = function()
        local wk = require("which-key")
        wk.register({
            g = {
                name = "git",
                s = { "<cmd>Git<cr>", "git: status", noremap = false },
            }
        }, { prefix = "<leader>" })
    end
}
