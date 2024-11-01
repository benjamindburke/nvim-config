return {
    "shortcuts/no-neck-pain.nvim",
    lazy  = true,
    event = { "BufReadPre", "BufNewFile" },
    keys  = require("nvim-config.keys.no-neck-pain")
}
