local map = require("utils").map
local noremap = require("utils").noremap
local disable = require("utils").disable

local builtin = require('telescope.builtin')

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

-----------------------------------------------------------
-- Telescope
-----------------------------------------------------------

vim.keymap.set("n", "<C-p>", builtin.find_files, {})
vim.keymap.set("n", "<C-g>", builtin.live_grep, {})
vim.keymap.set("n", "<leader>h", builtin.help_tags, {})


vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'List open buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help tags' })
vim.keymap.set("n", "<leader>fe", function()
  require("telescope").extensions.file_browser.file_browser({
    path = "%:p:h",  -- open in current file's directory
    select_buffer = true,
  })
end, { desc = "File Browser" })
