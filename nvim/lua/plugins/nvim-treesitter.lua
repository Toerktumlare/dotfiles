require('nvim-treesitter.configs').setup({
    ensure_installed = { "lua", "rust", "toml", "fish", "markdown", "tsx", "typescript", "markdown_inline", "c" },
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
})
