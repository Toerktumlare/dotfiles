local capabilities = require('cmp_nvim_lsp').default_capabilities()

require'lspconfig'.clangd.setup{
    capabilities = capabilities,
    on_attach = function()
        vim.api.nvim_buf_set_keymap(0, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true })
        vim.api.nvim_buf_set_keymap(0, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true })
        vim.api.nvim_buf_set_keymap(0, "n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { noremap = true })
        vim.api.nvim_buf_set_keymap(0, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true })
        vim.api.nvim_buf_set_keymap(0, "n", "<leader>j", "<cmd>lua vim.diagnostic.goto_next()<CR>", { noremap = true })
        vim.api.nvim_buf_set_keymap(0, "n", "<leader>k", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { noremap = true })
        vim.api.nvim_buf_set_keymap(0, "n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true })
        vim.api.nvim_buf_set_keymap(0, "n", "<F18>", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true })
        vim.api.nvim_buf_set_keymap(0, "n", "<c- >", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true })
    end,
}
