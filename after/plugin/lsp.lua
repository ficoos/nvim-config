local lsp = require('lsp-zero')
local smiz_lsp = require('smizrahi.lsp')
local _, extra_lsp = pcall(require, 'extra.lsp')

lsp.preset("recommended")

lsp.ensure_installed({
	"tsserver",
	"eslint",
	"rust_analyzer",
})

lsp.skip_server_setup({'rust_analyzer'})

lsp.on_attach(function(client, bufnr)
    smiz_lsp.common_remaps(client, bufnr)
end)

lsp.nvim_workspace()

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})

