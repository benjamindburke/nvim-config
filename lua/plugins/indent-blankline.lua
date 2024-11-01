-- indentation lines with multiple color support
return {
    "lukas-reineke/indent-blankline.nvim",
    lazy  = true,
    event = { "BufReadPre", "BufNewFile" },
}
