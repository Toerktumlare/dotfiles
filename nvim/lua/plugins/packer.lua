return require("packer").startup(function()

    use "wbthomason/packer.nvim"
    use "neovim/nvim-lspconfig"
    use "simrat39/rust-tools.nvim"
    use "rust-lang/rust.vim"

    -- completion
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-nvim-lua"
    use "hrsh7th/cmp-nvim-lsp-signature-help"

    -- snippets
    use "L3MON4D3/LuaSnip"
    use "saadparwaiz1/cmp_luasnip"

    use 'Mofiqul/dracula.nvim'
    use "airblade/vim-gitgutter"

    use "tpope/vim-fugitive"
    use "tpope/vim-commentary"

    use "junegunn/fzf.vim"

    use "rcarriga/nvim-dap-ui"
    use "mfussenegger/nvim-dap"
    use 'nvim-lua/plenary.nvim'
    use 'theHamsta/nvim-dap-virtual-text'

    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    use { 'nvim-telescope/telescope.nvim', tag = '0.1.0' }
    use 'nvim-lualine/lualine.nvim'
end)
