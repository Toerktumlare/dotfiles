local map = require("utils").map
local noremap = require("utils").noremap
local disable = require("utils").disable

-----------------------------------------------------------
-- General
-----------------------------------------------------------
noremap("i", "jj", "<Esc>")

noremap("n", "<leader><leader>", "<c-^>")
noremap("n", "<leader>w", ":w<CR>")
noremap("n", "<leader>q", ":q<CR>")
noremap("n", "<leader>r", ":so $MYVIMRC<CR>")
noremap("n", "<leader>ev", ":split $MYVIMRC")


-----------------------------------------------------------
-- Search
-----------------------------------------------------------
noremap("n", "n", "nzz", { silent = true })
noremap("n", "N", "Nzz", { silent = true })
noremap("n", "*", "*zz", { silent = true })
noremap("n", "#", "#zz", { silent = true })
noremap("n", "g*", "g*zz", { silent = true })

noremap("n", "<C-h>", ":nohlsearch<CR>")
noremap("v", "<C-h>", ":nohlsearch<CR>")

-----------------------------------------------------------
-- Yank, Paste
-----------------------------------------------------------
noremap("v", "y", "y`]", { silent = true })
noremap("v", "p", "p`]", { silent = true })


-----------------------------------------------------------
-- Disables
-----------------------------------------------------------
disable("n", "<up>")
disable("n", "<down>")
disable("n", "<left>")
disable("n", "<right>")
disable("v", "<up>")
disable("v", "<down>")
disable("v", "<left>")
disable("v", "<right>")

disable("n", "Q")

