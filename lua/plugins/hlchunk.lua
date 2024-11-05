-- highlight current scope chunk to distinguish from indent-blankline highlights
return {
    "shellRaining/hlchunk.nvim",
    lazy  = true,
    event = { "BufReadPre", "BufNewFile", "InsertLeave" },
    opts  = {
        blank    = { enable = false },
        chunk    = { enable = true, notify = false },
        indent   = { enable = false },
        line_num = { enable = true, notify = false },
    },
}
