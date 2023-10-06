local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local nvim_lsp = require('rust-tools').setup({
    tools = {
        inlay_hints = {
            max_len_align = true,
        }
    },
    server = {
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
        settings = {
            ["rust-analyzer"] = {
                check = {
                    command = "clippy",
                },
            },
        },
    },
    dap = {
        adapter = {
            type = "executable",
            command = "lldb-vscode",
            name = "lldb",
        },
    },
})

require('rust-tools').hover_actions.hover_actions()

-- Configure floating windows
vim.diagnostic.config({
    float = {
        source = "always",
        border = "rounded",
        prefix = "",
    }
})

vim.opt.completeopt = { "menu", "menuone", "noselect" }
 
local luasnip = require("luasnip")
local cmp = require('cmp')

require("luasnip.loaders.from_vscode").lazy_load({ paths = {"~/.config/nvim/snippets"}, include = {"rust"}})

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
    snippet = {
      expand = function(args)
         require('luasnip').lsp_expand(args.body) 
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), 
      ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            local entry = cmp.get_selected_entry()
            if not entry then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            else
                cmp.confirm()
            end
          elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, {"i", "s",}),
    }),
    experimental = {
        native_menu = false,
        ghost_text = true,
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'nvim_lsp_signature_help' },
      { name = 'nvim_lua' },
      { name = 'path' },
      { name = 'luasnip' }, 
      { name = 'buffer', keyword_length = 5 },
    })
})

