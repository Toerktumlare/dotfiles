return {
    "nvim-tree/nvim-web-devicons",
    "airblade/vim-gitgutter",
    "tpope/vim-fugitive",
    "tpope/vim-commentary",
    {
      "nvim-telescope/telescope-file-browser.nvim",
      dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
      config = function()
        local actions = require("telescope.actions")
        local fb_actions = require("telescope._extensions.file_browser.actions")

        require("telescope").setup({
          defaults = {
            mappings = {
              i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
              },
              n = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
              },
            },
          },
          extensions = {
            file_browser = {
              hijack_netrw = true,
              mappings = {
                i = {
                  ["<C-j>"] = actions.move_selection_next,
                  ["<C-k>"] = actions.move_selection_previous,
                  },
                n = {
                  ["c"] = fb_actions.create,
                  ["r"] = fb_actions.rename,
                  ["d"] = fb_actions.remove,
                  ["y"] = fb_actions.copy,
                  ["m"] = fb_actions.move,
                  ["h"] = fb_actions.goto_parent_dir,
                  ["<C-j>"] = actions.move_selection_next,
                  ["<C-k>"] = actions.move_selection_previous,
                },
              },
            },
          },
        })
        require("telescope").load_extension("file_browser")
      end,
    },
    { 
      "Mofiqul/dracula.nvim",
      config = function()
          vim.cmd("colorscheme dracula")

      end
    },
    { 
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = { "lua", "rust", "toml", "fish", "markdown", "tsx", "typescript", "markdown_inline", "c" },
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = {
                    enable = true
                }
            }
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup({
              options = {
                    theme = 'material',
                    section_separators = { left = '', right = ''},
                    component_separators = { left = '', right = ''},
              },
              sections = {
                lualine_a = {'mode'},
                lualine_b = {''},
                lualine_c = {'filename'},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {'filetype'},
              },
            })
        end
    },
    {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.6', -- or the latest tag
      dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', cond = vim.fn.executable('make') == 1 },
      },
      config = function()
        local telescope = require('telescope')
        telescope.setup {
          defaults = {
            layout_strategy = 'horizontal',
            layout_config = { preview_width = 0.6 },
            sorting_strategy = 'ascending',
            prompt_prefix = '   ',
          },
        }

        -- Load fzf-native if available
        pcall(telescope.load_extension, 'fzf')
      end,
    },
    {
      'hrsh7th/nvim-cmp',
      dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
      },
      config = function()
        local cmp = require('cmp')
        local luasnip = require('luasnip')

        cmp.setup({
          snippet = {
            expand = function(args)
              luasnip.lsp_expand(args.body)
            end,
          },
          window = {
            completion = {
              border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },  -- Set the borders around the completion menu
              winhighlight = "Normal:Pmenu,FloatBorder:PmenuBorder,Search:PmenuSel",
            },
            documentation = {
              border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },  -- Optional border for the documentation window
            },
          },
          mapping = cmp.mapping.preset.insert({
            ['<Tab>'] = cmp.mapping.select_next_item(),
            ['<S-Tab>'] = cmp.mapping.select_prev_item(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
          }),
          sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
            { name = 'buffer' },
            { name = 'path' },
          }),
        })
      end
    },
    {
      "williamboman/mason.nvim",
      build = ":MasonUpdate",
      config = true
    },
    {
      "williamboman/mason-lspconfig.nvim",
      dependencies = { "mason.nvim" },
    },
    { 
        "neovim/nvim-lspconfig",
    },
    -- plugins.lua or your Lazy config
    {
      'mrcjkb/rustaceanvim',
      version = '^6', -- use latest major version
      ft = { 'rust' }, -- load only for Rust files
      init = function()
        vim.g.rustaceanvim = {
          server = {
            cmd = { 'rust-analyzer' }
          }
        }
        vim.g.rustaceanvim = {
          tools = {
            hover_actions = {
              auto_focus = true,
            },
            inlay_hints = {
              auto = true,
              only_current_line = false;
              show_parameter_hints = true,
              parameter_hints_prefix = "<- ",
              other_hints_prefix = "=> ",
            },
          },
          server = {
            on_attach = function(client, bufnr)

              if client.server_capabilities.inlayHintProvider then
                vim.lsp.inlay_hint.enable(true) -- ✅ FIXED: use boolean
              end
              -- your on_attach config for keymaps, etc
              local function map(mode, lhs, rhs)
                vim.keymap.set(mode, lhs, rhs, { buffer = bufnr })
              end

              vim.api.nvim_buf_set_keymap(0, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true })
              vim.api.nvim_buf_set_keymap(0, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true })
              vim.api.nvim_buf_set_keymap(0, "n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { noremap = true })
              vim.api.nvim_buf_set_keymap(0, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true })
              vim.api.nvim_buf_set_keymap(0, "n", "<leader>j", "<cmd>lua vim.diagnostic.goto_next()<CR>", { noremap = true })
              vim.api.nvim_buf_set_keymap(0, "n", "<leader>k", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { noremap = true })
              vim.api.nvim_buf_set_keymap(0, "n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true })
              vim.api.nvim_buf_set_keymap(0, "n", "<F18>", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true })
              vim.api.nvim_buf_set_keymap(0, "n", "<c- >", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true })


              -- map("n", "K", vim.lsp.buf.hover)
              -- map("n", "gd", vim.lsp.buf.definition)
              -- map("n", "gr", vim.lsp.buf.references)
              -- map("n", "<leader>ca", vim.lsp.buf.code_action)
            end,
            default_settings = {
              ["rust-analyzer"] = {
                cargo = {
                  allFeatures = true,
                },
                checkOnSave = true,
                formatting = {
                  enable = true,
                },
                check = {
                  command = "clippy",
                }
              },
            },
          },
        }
      end
    },
    {
        "chrisgrieser/nvim-lsp-endhints",
        event = "LspAttach",
        opts = {}, -- required, even if empty
    },

}
