-- highlight current scope chunk to distinguish from indent-blankline highlights
return {
    "shellRaining/hlchunk.nvim",
    lazy  = true,
    event = { "BufReadPre", "BufNewFile", "InsertLeave" },
}
