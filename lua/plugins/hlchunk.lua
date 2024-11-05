-- highlight current scope chunk to distinguish from indent-blankline highlights
local style = {
    "#2F78B4", -- blue
    "#BA0000", -- maple red
}

return {
    "shellRaining/hlchunk.nvim",
    lazy  = true,
    event = { "BufReadPre", "BufNewFile", "InsertLeave" },
    opts  = {
        blank    = { enable = false },
        chunk    = { enable = true, notify = false, style = style },
        indent   = { enable = false },
        line_num = { enable = true, notify = false, style = style },
    },
}
