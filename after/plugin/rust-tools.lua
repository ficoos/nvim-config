local rt = require("rust-tools")
local smiz_lsp = require('smizrahi.lsp')

rt.setup({
    tools = {
        hover_actions = {
            auto_focus = true
        },
    },
    server = {
        on_attach = function(client, bufnr)
            smiz_lsp.common_remaps(client, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<C-.>", rt.code_action_group.code_action_group, { buffer = bufnr })
        end,
    },
    dap = {
        adapter = {
            type = "executable",
            command = "codelldb",
            name = "rt_lldb",
        },
    },
})
