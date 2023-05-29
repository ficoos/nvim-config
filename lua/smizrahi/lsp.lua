local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local function common_remaps(client, bufnr)
    local builtin = require('telescope.builtin')
    --local opts = { buffer = bufnr, remap = false }
    local function opts(o)
        o = o or {}
        o.buffer = o.buffer or bufnr
        o.remap = o.remap or false
        return o
    end

    require('which-key').register({ l = { name = "lsp" } }, { prefix = "<leader>" })

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts { desc = "lsp: Go to definition" })
    vim.keymap.set("n", "<leader>lo", ":silent! SymbolsOutline<CR>", opts { desc = "lsp: Outline" })
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts { desc = "lsp: Hover" })
    vim.keymap.set("n", "<leader>\\", function() builtin.lsp_document_symbols({ ignore_symbols = "variable" }) end,
        opts { desc = "lsp: Document symbol" })
    vim.keymap.set("n", "<leader>ls", function() builtin.lsp_document_symbols({ ignore_symbols = "variable" }) end,
        opts { desc = "lsp: Document Symbol" })
    vim.keymap.set("n", "<leader>lw", function() builtin.lsp_dynamic_workspace_symbols() end,
        opts { desc = "lsp: Workspace  Symbol" })
    vim.keymap.set("n", "<leader>ld", function() vim.diagnostic.open_float() end, opts { desc = "lsp: Show diagnostics" })
    vim.keymap.set("n", "<leader>lD", ":TroubleToggle document_diagnostics<CR>",
        opts { desc = "lsp: Show document diagnostics" })
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts { desc = "lsp: Go to next diagnostic" })
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts { desc = "lsp: Go to previous diagnostic" })
    vim.keymap.set("n", "<leader>la", function() vim.lsp.buf.code_action() end, opts { desc = "lsp: Code Action" })
    vim.keymap.set("n", "<leader>lr", ":TroubleToggle lsp_references<CR>",
        opts { desc = "lsp: Find all references" })
    vim.keymap.set("n", "<f2>", function() vim.lsp.buf.rename() end, opts { desc = "lsp: Rename" })
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts { desc = "lsp: Singature help" })
    vim.keymap.set("i", "<C-space>", function() vim.lsp.buf.completion({}) end, opts { desc = "lsp: Singature help" })
    vim.keymap.set('n', '<leader>lf', function() vim.lsp.buf.format { async = true } end,
        opts { desc = "lsp: Format document" })
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
    end
end

return {
    common_remaps = common_remaps,
}
