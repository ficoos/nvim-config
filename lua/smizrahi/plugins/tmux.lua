return {
    {
        "alexghergh/nvim-tmux-navigation",
        config = function()
            local nvim_tmux_nav = require('nvim-tmux-navigation')

            nvim_tmux_nav.setup {
                disable_when_zoomed = true -- defaults to false
            }

            vim.keymap.set('n', "<M-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
            vim.keymap.set('n', "<M-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
            vim.keymap.set('n', "<M-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
            vim.keymap.set('n', "<M-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
            vim.keymap.set('n', "<M-Left>", nvim_tmux_nav.NvimTmuxNavigateLeft)
            vim.keymap.set('n', "<M-Down>", nvim_tmux_nav.NvimTmuxNavigateDown)
            vim.keymap.set('n', "<M-Up>", nvim_tmux_nav.NvimTmuxNavigateUp)
            vim.keymap.set('n', "<M-Right>", nvim_tmux_nav.NvimTmuxNavigateRight)
            vim.keymap.set('n', "<M-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
            vim.keymap.set('n', "<M-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)

            vim.keymap.set('t', "<M-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
            vim.keymap.set('t', "<M-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
            vim.keymap.set('t', "<M-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
            vim.keymap.set('t', "<M-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
            vim.keymap.set('t', "<M-Left>", nvim_tmux_nav.NvimTmuxNavigateLeft)
            vim.keymap.set('t', "<M-Down>", nvim_tmux_nav.NvimTmuxNavigateDown)
            vim.keymap.set('t', "<M-Up>", nvim_tmux_nav.NvimTmuxNavigateUp)
            vim.keymap.set('t', "<M-Right>", nvim_tmux_nav.NvimTmuxNavigateRight)
            vim.keymap.set('t', "<M-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
            vim.keymap.set('t', "<M-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
        end
    },
}
