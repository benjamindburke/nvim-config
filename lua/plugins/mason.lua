return {
    "williamboman/mason.nvim",
    lazy  = true,
    event = { "FileType" },
    init  = function()
        require("mason").setup({})
    end,
}
