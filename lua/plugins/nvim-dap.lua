return {
    "mfussenegger/nvim-dap",
    main  = "dap",
    name  = "dap",
    lazy  = true,
    keys  = require("nvim-config.keys.dap"),
    build = function()
        local plugin = require("dap")
        local home = os.getenv("HOME")

        -- configure specific debugging tasks

        -- Elixir debugger configuration
        plugin.adapters.mix_task = {
            type = "executable",
            command = home .. "/.local/share/nvim/mason/bin/elixir-ls",
            args = {},
        }

        plugin.configurations.elixir = {
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
        plugin.adapters.delve = {
            type = "server",
            port = "${port}",
            executable = {
                command = home .. "/.local/share/nvim/mason/bin/dlv",
                args = { "dap", "-l", "127.0.0.1:${port}" },
            }
        }

        plugin.configurations.go = {
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
            plugin.configurations.python,
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
    end,
    init  = function()
        -- define custom debugger symbols for increased visibility
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
    end,
}
