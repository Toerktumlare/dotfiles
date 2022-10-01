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
