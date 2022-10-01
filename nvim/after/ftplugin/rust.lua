local noremap = require("utils").noremap

noremap("", "<S-f>", ":RustFmt<CR>")
noremap("", "<S-c>", ":make! check<CR>")
noremap("", "<S-b>", ":make! build<CR>")
noremap("", "<S-t>", ":make! test<CR>")
noremap("", "<S-r>", ":Crun<CR>")
--noremap("", "<S-t>", ":Ctest<CR>")

vim.g.rustfmt_autosave = true
vim.g.rustfmt_emit_files = true
vim.g.rustfmt_fail_silently = false