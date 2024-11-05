return {
    {
        "<F5>",
        function() require("dap").continue() end,
        mode = { "n" },
        desc = "Continue debugging"
    },

    {
        "<F10>",
        function() require("dap").step_over() end,
        mode = { "n" },
        desc = "Step over current line",
    },

    {
        "<F11>",
        function() require("dap").step_into() end,
        mode = { "n" },
        desc = "Step into child scope",
    },

    {
        "<F12>",
        function() require("dap").step_out() end,
        mode = { "n" },
        desc = "Step out of current scope into parent scope",
    },

    {
        "<leader>B",
        function() require("dap").toggle_breakpoint() end,
        mode = { "n" },
        desc = "Toggle a breakpoint activating",
    },

    {
        "<leader>b",
        function() require("dap").set_breakpoint() end,
        mode = { "n" },
        desc = "Set a breakpoint at the current line",
    },

    {
        "<leader>be",
        function() require("dap").set_exception_breakpoints() end,
        mode = { "n" },
        desc = "Set an exception breakpoint",
    },

    {
        "n",
        "<leader>lp",
        function() require("dap").set_breakpoint(nil, nil, vim.fn.input("log point message: ")) end,
        desc = "Set a logging breakpoint with log message"
    },

    {
        "<leader>dr",
        function() require("dap").repl.open() end,
        mode = { "n" },
        desc = "Open a REPL instance",
    },

    {
        "<leader>dl",
        function() require("dap").run_last() end,
        mode = { "n" },
        desc = "Run the last debugging configuration",
    },

    {
        "<leader>dh",
        function() require("dap.ui.widgets").hover() end,
        mode = { "n", "v" },
        desc = "Open hover documentation of symbol under cursor",
    },

    {
        "<leader>dp",
        function() require("dap.ui.widgets").preview() end,
        mode = { "n", "v" },
        desc = "Preview symbol under cursor",
    },

    {
        "<leader>df",
        function()
            local widgets = require("dap.ui.widgets")
            widgets.centered_float(widgets.frames)
        end,
        mode = { "n" },
        desc = "Open execution frames widget",
    },

    {
        "<leader>ds",
        function()
            local widgets = require("dap.ui.widgets")
            widgets.centered_float(widgets.scopes)
        end,
        mode = { "n" },
        desc = "Open execution scopes widget",
    },

    {
        "<leader>dt",
        function() require("dap").terminate() end,
        mode = { "n" },
        desc = "Terminate debugger",
    },

    {
        "<leader>dc",
        function() require("dap").clear_breakpoints() end,
        mode = { "n" },
        desc = "Clear all set breakpoints",
    },

    {
        "<leader>d?",
        function() require("dap").list_breakpoints() end,
        mode = { "n" },
        desc = "List all breakpoints in Telescope window",
    },
}
