-- breadcrumb symbol navigation like vscode
return {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
        "SmiteshP/nvim-navic",
        "nvim-tree/nvim-web-devicons",
        -- listing catppuccin as a dependency ensures barbecue loads after catppuccin
        "catppuccin/nvim",
    },
    opts = {
        -- prevent barbecue from updating itself automatically
        create_autocmd = false,
        theme = "catppuccin-mocha",
    },
    init = function()
        vim.api.nvim_create_autocmd(
            {
                "WinScrolled",
                "WinResized",
                "BufWinEnter",
                "CursorHold",
                "InsertLeave",
            },
            {
                group = vim.api.nvim_create_augroup("barbecue.updater", {}),
                callback = function() require("barbecue.ui").update() end,
            }
        )
    end,
}
