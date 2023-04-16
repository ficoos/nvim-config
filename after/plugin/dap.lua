local dap = require('dap')

dap.adapters.codelldb = {
    type = 'server',
    port = "${port}",
    executable = {
        command = 'codelldb',
        args = { "--port", "${port}" },
    }
}
--
dap.configurations.rust = {
    {
        name = "Rust debug",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input({
                prompt = 'Path to executable: ',
                default = vim.fn.getcwd() .. '/target/debug/',
                completion = 'file',
            })
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
    },
}
