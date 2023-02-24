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
