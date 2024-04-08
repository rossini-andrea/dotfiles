local dap, dapui = require("dap"), require("dapui")

-- Dap configuration
dap.adapters.gdb = {
    type = "executable",
    command = "gdb",
    args = { "-i", "dap" }
}

dap.configurations.c = {
    {
        name = "Launch",
        type = "gdb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = "${workspaceFolder}",
        stopAtBeginningOfMainSubprogram = false,
    },
}

dap.configurations.rust = dap.configurations.c;
dap.configurations.zig = dap.configurations.c;

-- DapUi configuration
dapui.setup()

dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
end

-- Key mappings
vim.keymap.set("n", "<leader>dt", function()
    dapui.toggle()
end, { noremap = true })
vim.keymap.set("n", "<leader>db", ":DapToggleBreakpoint<CR>", { noremap = true })
vim.keymap.set("n", "<leader>dc", ":DapContinue<CR>", { noremap = true })
vim.keymap.set("n", "<leader>dr", function()
    dapui.open({ reset = true })
end, { noremap = true })
