local function bootstrap_pckr()
  local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

  if not vim.loop.fs_stat(pckr_path) then
    vim.fn.system({
      'git',
      'clone',
      "--filter=blob:none",
      'https://github.com/lewis6991/pckr.nvim',
      pckr_path
    })
  end

  vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()

require('pckr').add{
     "neovim/nvim-lspconfig";
     "simrat39/rust-tools.nvim";
     -- "rust-lang/rust.vim";

     -- completion
     "hrsh7th/nvim-cmp";
     "hrsh7th/cmp-nvim-lsp";
     "hrsh7th/cmp-buffer";
     "hrsh7th/cmp-path";
     "hrsh7th/cmp-nvim-lua";
     "hrsh7th/cmp-nvim-lsp-signature-help";

     -- snippets
     "L3MON4D3/LuaSnip";
     "saadparwaiz1/cmp_luasnip";

      'Mofiqul/dracula.nvim';
      "airblade/vim-gitgutter";

      "tpope/vim-fugitive";
      "tpope/vim-commentary";

      "junegunn/fzf.vim";

     "rcarriga/nvim-dap-ui";
     "nvim-neotest/nvim-nio";
     "mfussenegger/nvim-dap";
     'theHamsta/nvim-dap-virtual-text';
     'nvim-lua/plenary.nvim';

     { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' };

     { 'nvim-telescope/telescope.nvim', tag = '0.1.4' };
     'nvim-lualine/lualine.nvim';
}
