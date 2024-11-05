-- highlight current scope chunk to distinguish from indent-blankline highlights
return {
    "shellRaining/hlchunk.nvim",
    lazy  = true,
    event = { "BufReadPre", "BufNewFile", "InsertLeave" },
    opts = {
        line_num = { enable = true, notify = false },
        indent = { enable = false },
        chunk = { enable = false },
        blank = { enable = false },
    },
}
