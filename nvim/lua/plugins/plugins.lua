return {
    "nvim-tree/nvim-web-devicons",
    "airblade/vim-gitgutter",
    "tpope/vim-fugitive",
    "tpope/vim-commentary",
    {
      "nvim-telescope/telescope-file-browser.nvim",
      dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
      config = function()
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
        version = "v0.9.3",
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
        local actions = require("telescope.actions")
        local fb_actions = require("telescope._extensions.file_browser.actions")
        telescope.setup {
          defaults = {
            -- preview = true,
            prompt_prefix = ' >  ',
            sorting_strategy = 'ascending',
            -- layout_strategy = "vertical",
            layout_config = {
                horizontal = {
                 preview_width = 0.6,
                    
                }
            --   vertical = {
            --     preview_height = 0.5,
            --     mirror = true,      -- This flips the results to the top
            --     prompt_position = "top", -- Often preferred when results are at the top
            --   },
            },
            file_ignore_patterns = { "node_modules", "%.git", "target" },
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
              cwd_to_path = false,
              path = vim.loop.cwd(),
              depth = 99,
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
                procMacro = { 
                  enable = true 
                },
                cargo = {
                  allFeatures = true,
                },
                check = {
                  command = "clippy",
                },
                buildScripts = {
                  enable = true,
                },
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
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {
            check_ts = true,
            enable_check_bracket_line = false,
        },
    },
    {
        "tpope/vim-surround",
        event = "VeryLazy",
    },
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter"
        },
        config = function()
            require("neotest").setup({
                adapters = {
                    require("rustaceanvim.neotest"),
                },
                -- AUTOMATION RULES
                status = {
                    virtual_text = true, -- Shows pass/fail marks right next to the function name
                    signs = true,        -- Places icons in the gutter column
                },
                output = {
                    open_on_run = true, -- Don't open windows when starting a test
                    open_win_config = {
                        border = "rounded",  -- Options: "single", "double", "rounded", "solid", "shadow"
                        split = "right",     -- Optional: keeps it as a structured layout frame
                    },
                },
                diagnostic = {
                    enabled = true,      -- Automatically pipe compilation/assertion errors into diagnostics
                    severity = vim.diagnostic.severity.ERROR,
                },
            })

            local neotest = require("neotest")
            
            -- Keymaps wrapped safely in functions with description metadata
            vim.keymap.set("n", "<leader>tt", function() neotest.run.run() end, { desc = "Run Nearest Test", silent = true })
            vim.keymap.set("n", "<leader>ts", function() neotest.summary.toggle() end, { desc = "Toggle Summary Sidebar", silent = true })
            vim.keymap.set("n", "<leader>to", function() neotest.output_panel.toggle() end, { desc = "Toggle Output Panel", silent = true })
            vim.keymap.set("n", "<leader>tf", function() neotest.run.run(vim.fn.expand("%")) end, { desc = "Run Current File", silent = true })
        end,
    }
}
