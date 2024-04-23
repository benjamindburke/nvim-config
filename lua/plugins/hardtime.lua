-- suggest more efficient vim motions
return {
    "m4xshen/hardtime.nvim",
    lazy = true,
    dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
    },
    opts = {
        disabled_keys = {
            -- allow Up/Down/Left/Right instead of forcing hjkl (UHK support)
            ["<Up>"] = {},
            ["<Down>"] = {},
            ["<Left>"] = {},
            ["<Right>"] = {},
        },
    },
}
