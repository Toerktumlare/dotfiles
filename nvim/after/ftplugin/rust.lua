local noremap = require("utils").noremap

noremap("", "<S-c>", ":make! check<CR>")
noremap("", "<S-b>", ":make! build<CR>")
noremap("", "<S-t>", ":make! test<CR>")
noremap("", "<S-r>", ":Crun<CR>")

