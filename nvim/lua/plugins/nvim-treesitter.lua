require('nvim-treesitter.configs').setup({
    ensure_installed = { "lua", "rust", "toml", "fish", "markdown", "tsx", "typescript", "markdown_inline" },
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true
    }
})
