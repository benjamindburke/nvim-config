return {
    {
        "<leader>zz",
        vim.cmd.NoNeckPain,
        mode = { "n", "v" },
        desc = "Toggle Zen mode",
    },
    {
        "<leader>z=",
        function()
            local current_width = vim.api.nvim_win_get_width(0)
            vim.cmd.NoNeckPainResize(current_width + 20)
        end,
        mode = { "n", "v" },
        desc = "Increase Zen mode buffer size by increments of 20 columns",
    },
    {
        "<leader>z-",
        function()
            local current_width = vim.api.nvim_win_get_width(0)
            vim.cmd.NoNeckPainResize(math.max(60, current_width - 20))
        end,
        mode = { "n", "v" },
        desc = "Decrease Zen mode buffer size by increments of 20 columns",
    },
}
