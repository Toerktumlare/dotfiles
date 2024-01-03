local g = vim.g
local opt = vim.opt
local cmd = vim.cmd

-----------------------------------------------------------
-- General
-----------------------------------------------------------
g.mapleader = ' '
opt.mouse = "a"
opt.clipboard = 'unnamedplus'
opt.swapfile = false
opt.fileencodings = "utf-8"
opt.termguicolors = true
opt.signcolumn="yes"


-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.number = true
opt.relativenumber = true
opt.showmatch = true
opt.splitright = true
opt.splitbelow = true
opt.foldenable = false
opt.linebreak = true
opt.showmode = false
opt.scrolloff = 2
opt.cmdheight = 1
opt.updatetime = 300
opt.textwidth = 120
opt.laststatus = 3

-----------------------------------------------------------
-- Search
-----------------------------------------------------------
opt.ignorecase = true
opt.smartcase = true


-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.softtabstop = 4


-----------------------------------------------------------
-- Undo
-----------------------------------------------------------
opt.undofile = true


-----------------------------------------------------------
-- Wildmenu
-----------------------------------------------------------
opt.pumblend = 17
opt.pumheight = 15
opt.wildmode = "longest:full"
opt.wildoptions = "pum"
opt.wildignore = ".hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor"

-----------------------------------------------------------
-- Format Options (h: fo-table)
-----------------------------------------------------------

opt.formatoptions = "tcrqnb"

-- tc = wrap text text (t) and comments (c) using textwidth
-- r = continue comments when pressing <CR> in I mode
-- q = enable formatting of comments using gq
-- n = detect lists for formatting
-- b autowrap in I mode, do not wrap old long lines

vim.cmd [[
    let g:do_filetype_lua = 1
]]

vim.filetype.add({
    extension= {
        mdx = "markdown"
    }
})

-- need to do this stupid thing because no lua support to set highlights
cmd('highlight WinSeparator guibg=None')

-----------------------------------------------------------
-- Autocmds
-----------------------------------------------------------

local rust_group = vim.api.nvim_create_augroup("RustAutoCommands", { clear = true })
local custom = vim.api.nvim_create_augroup("custom", { clear = true })

-- format rust files on save
vim.api.nvim_create_autocmd("BufWritePre", {
    group     = rust_group,
    pattern   = { "*.rs" },
    callback  = function()
        vim.lsp.buf.format({ async = false })
    end
})

-- reload config file on change
vim.api.nvim_create_autocmd('BufWritePost', {
    group    = custom,
    pattern  = vim.env.MYVIMRC,
    command  = 'silent source %'
})

-- return cursor to the same place when closing the file
vim.api.nvim_create_autocmd("BufReadPost", {
    group     = custom,
    pattern   = "*",
    callback  = function()
      if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
        vim.fn.setpos('.', vim.fn.getpos("'\""))
      end
    end
})
