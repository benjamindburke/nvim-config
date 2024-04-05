require("hardtime").setup({
    disabled_keys = {
        -- allow Up/Down/Left/Right instead of forcing hjkl (UHK support)
        ["<Up>"] = {},
        ["<Down>"] = {},
        ["<Left>"] = {},
        ["<Right>"] = {},
    },
})
