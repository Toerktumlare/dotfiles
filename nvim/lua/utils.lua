local u = {}

function u.map(mode, keys, action, options)
    if options == nil then
        options = {}
    end
    vim.api.nvim_set_keymap(mode, keys, action, options)
end

function u.noremap(mode, keys, action, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, keys, action, options)
end

function u.disable(mode, keys)
    u.noremap(mode, keys, "<nop>")
end

return u
