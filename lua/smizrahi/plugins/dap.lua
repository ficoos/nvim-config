return {
    {
        'mfussenegger/nvim-dap',
    },
    {
        'rcarriga/nvim-dap-ui',
        lazy = false,
        dependencies = {
            'mfussenegger/nvim-dap',
        },
        config = function()
            local dap = require('dap')
            local dapui = require('dapui')
            local wk = require('which-key')
            vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = '', linehl = '', numhl = '' })

            vim.keymap.set("n", "<F9>", dap.toggle_breakpoint, { desc = "dap: Toggle breakpoint" })
            vim.keymap.set("n", "<f5>", dap.continue, { desc = "dap: Continue" })
            vim.keymap.set("n", "<f11>", dap.step_into, { desc = "dap: Step into" })
            vim.keymap.set("n", "<f10>", dap.step_over, { desc = "dap: Step over" })

            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
            dapui.setup {}

            wk.register({
                d = {
                    mame = "debugger",
                    r = { dap.repl.open, "dap: Open repl", noremap = false },
                    u = { dapui.toggle, "dap: Locals", noremap = false },
                    c = { dap.close, "dap: Close", noremap = false },
                    e = { dapui.eval, "dap: Eval", noremap = false },
                },
            }, { prefix = "<leader>" })
        end
    }
}
