-- configure debug adapters after all other plugins have loaded
local dap = require("dap")
local home = os.getenv("HOME")

-- custom debugger symbol text
vim.fn.sign_define(
    "DapBreakpoint",
    { text = "🛑", texthl = "", linehl = "", numhl = "" }
)
vim.fn.sign_define(
    "DapBreakpointCondition",
    { text = "⁉️", texthl = "", linehl = "", numhl = "" }
)
vim.fn.sign_define(
    "DapLogPoint",
    { text = "🪵", texthl = "", linehl = "", numhl = "" }
)
vim.fn.sign_define(
    "DapStopped",
    { text = "►", texthl = "", linehl = "", numhl = "" }
)
vim.fn.sign_define(
    "DapBreakpointRejected",
    { text = "☢️", texthl = "", linehl = "", numhl = "" }
)

-- Elixir debugger configuration
dap.adapters.mix_task = {
    type = "executable",
    command = home .. "/.local/share/nvim/mason/bin/elixir-ls",
    args = {},
}

dap.configurations.elixir = {
    {
        type = "mix_task",
        name = "mix test",
        task = "test",
        taskArgs = { "--trace" },
        request = "launch",
        startApps = true, -- for Phoenix projects
        projectDir = "${workspaceFolder}",
        requireFiles = {
            "test/**/test_helper.exs",
            "test/**/*_test.exs",
        },
    },
}

-- Go debugger configuration
dap.adapters.delve = {
    type = "server",
    port = "${port}",
    executable = {
        command = home .. "/.local/share/nvim/mason/bin/dlv",
        args = { "dap", "-l", "127.0.0.1:${port}" },
    }
}

dap.configurations.go = {
    {
        type = "delve",
        name = "Debug",
        request = "launch",
        program = "${file}",
    },
    {
        type = "delve",
        name = "Debug test", -- configuration for debugging test files
        request = "launch",
        mode = "test",
        program = "${file}",
    },
    {
        type = "delve",
        name = "Debug test (go.mod)",
        request = "launch",
        mode = "test",
        program = "./${relativeFileDirname}",
    },
}

-- Python debugger configuration
local debugpy_python = home .. "/.config/nvim/venv/bin/python"

local dap_python = require("dap-python")
dap_python.setup(debugpy_python)
dap_python.test_runner = "pytest"

table.insert(
    dap.configurations.python,
    {
        type = "python",
        request = "launch",
        name = "Launch Tornado",
        program = "${workspaceFolder}/src/${workspaceFolderBasename}/app.py",
        cwd = "${workspaceFolder}",
        justMyCode = false,
        -- For more options, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings
    }
)
