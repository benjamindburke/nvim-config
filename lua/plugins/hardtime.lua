-- suggest more efficient vim motions
return {
    "m4xshen/hardtime.nvim",
    lazy  = true,
    event = { "BufReadPre", "BufNewFile" },
    opts  = {
        disabled_keys = {
            -- allow Up/Down/Left/Right instead of forcing hjkl (UHK support)
            ["<Up>"] = {},
            ["<Down>"] = {},
            ["<Left>"] = {},
            ["<Right>"] = {},
        },
    },
}
