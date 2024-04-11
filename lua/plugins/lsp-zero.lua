-- language server protocols
return {
    "vonheikemen/lsp-zero.nvim",
    version = "v3.x",
    lazy = false,
    dependencies = {
        -- LSP support
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",

        -- Autocompletion
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lua",
        "rafamadriz/friendly-snippets",
    },
}
