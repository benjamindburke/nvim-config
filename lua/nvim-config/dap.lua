-- configure debug adapters after all other plugins have loaded
local dap = require("dap")

-- custom debugger symbol text
vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })

-- Elixir debugger configuration
dap.adapters.mix_task = {
    type = "executable",
    command = "~/.local/share/nvim/mason/bin/elixir-ls",
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
        command = "~/.local/share/nvim/mason/bin/dlv",
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
local debugpy_python = "~/.config/nvim/venv/bin/python"

dap.adapters.python = function(cb, config)
    if config.request == "attach" then
        ---@diagnostic disable-next-line: undefined-field
        local port = (config.connect or config).port
        ---@diagnostic disable-next-line: undefined-field
        local host = (config.connect or config).host or "127.0.0.1"
        cb({
            type = "server",
            port = assert(port, "`connect.port` is required for a python `attach` configuration"),
            host = host,
            options = {
                source_filetype = "python",
            },
        })
    else
        cb({
            type = "executable",
            command = debugpy_python,
            args = { "-m", "debugpy.adapter" },
            options = { source_filetype = "python" },
        })
    end
end

dap.configurations.python = {
    {
        -- The first three options are required by nvim-dap
        type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
        request = "launch",
        name = "Launch file",

        -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

        program = "${file}", -- This configuration will launch the current file if used.
        pythonPath = function()
            -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
            -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
            -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
            local cwd = vim.fn.getcwd()
            local command = os.getenv("VIRTUAL_ENV") .. "/bin/python"
            if vim.fn.executable(command) == 1 then
                return command
            elseif vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
                return cwd .. "/venv/bin/python"
            elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
                return cwd .. "/.venv/bin/python"
            else
                return "/usr/bin/python"
            end
        end
    },
}
