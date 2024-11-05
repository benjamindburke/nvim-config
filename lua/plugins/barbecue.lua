-- breadcrumb symbol navigation like vscode
return {
    "utilyre/barbecue.nvim",
    name         = "barbecue",
    version      = "*",
    lazy         = true,
    event        = { "BufReadPre", "BufNewFile" },
    dependencies = {
        -- listing sakurapine as a dependency ensures barbecue loads afterwards
        "voxelprismatic/sakurapine",
    },
    opts         = {
        -- prevent barbecue from updating itself automatically
        create_autocmd = false,
    },
    init         = function()
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
