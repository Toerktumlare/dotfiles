return require("packer").startup(function()

    use "wbthomason/packer.nvim"
    use "neovim/nvim-lspconfig"
    use "simrat39/rust-tools.nvim"

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

    use {"akinsho/toggleterm.nvim", tag = 'v1.*', config = function()
        require("toggleterm").setup()
    end}
    use 'Mofiqul/dracula.nvim'
    use "airblade/vim-gitgutter"
    use "hrsh7th/cmp-nvim-lua"

    use "tpope/vim-fugitive"
    use "tpope/vim-commentary"

    use {"cespare/vim-toml", ft = "toml"} 
    use {"rust-lang/rust.vim", ft = "rust"} 

    use "junegunn/fzf.vim"

    use "mfussenegger/nvim-dap"
    use "rcarriga/nvim-dap-ui"
    use 'nvim-lua/plenary.nvim'
    use 'theHamsta/nvim-dap-virtual-text'

    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
end)
