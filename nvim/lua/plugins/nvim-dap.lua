require("dapui").setup()
require("nvim-dap-virtual-text").setup()

local dap = require('dap')
local noremap = require("utils").noremap

noremap("", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
noremap("", "<F7>", ":lua require'dap'.step_into()<CR>")
noremap("", "<F8>", ":lua require'dap'.step_over()<CR>")
noremap("", "<F9>", ":lua require'dap'.continue()<CR>")
noremap("", "<F10>", ":lua require'dap'.step_out()<CR>")

dap.configurations.rust = {
    {
        name = "Launch lldb",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
        runInTerminal = false,
    }
}

-- dap.adapters.lldb = {
--     type = "executable",
--     command = "/usr/lib/codelldb/adapter",
--     name = "lldb",
-- }

dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    -- CHANGE THIS to your path!
    command = '/usr/lib/codelldb/adapter/codelldb',
    args = {"--port", "${port}"},
  }
}

-- Open/close dap ui automatically when debugging
local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
