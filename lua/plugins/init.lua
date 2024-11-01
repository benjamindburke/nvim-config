return {
    -----------------------------------
    -- Dependencies
    --
    -- lazy loading deps instead of listing as dependencies improves startup times
    -----------------------------------

    { "nvim-tree/nvim-web-devicons", lazy = true },

    { "nvim-lua/plenary.nvim",       lazy = true },

    {
        "SmiteshP/nvim-navic",
        lazy = true,
        opts = { lsp = { auto_attach = true } },
    },

    { "MunifTanjim/nui.nvim",              lazy = true },

    -----------------------------------
    -- Cosmetic plugins
    --
    -- these make my terminal look nice.
    -----------------------------------

    -- sakura color theme
    {
        "voxelprismatic/sakurapine",
        as = "rose-pine",
        name = "rose-pine",
        priority = 1000,
        lazy = false,
        opts = { swatch = "sakura" },
    },

    -----------------------------------
    -- Language Server Protocol (LSP) support
    --
    -- language server protocol symbol providers / installation helpers
    -----------------------------------

    { "neovim/nvim-lspconfig",             lazy = true },

    { "williamboman/mason.nvim",           lazy = true },

    { "williamboman/mason-lspconfig.nvim", lazy = true },

    { "vonheikemen/lsp-zero.nvim",         version = "v3.x" },

    -----------------------------------
    -- Functional plugins
    --
    -- these plugins provide some amount of value in my developer workflow.
    -----------------------------------

    -- treesitter playground
    { "nvim-treesitter/playground",   lazy = true },

    -----------------------------------
    -- Debugger Adapter Protocols (DAP)
    --
    -- provide breakpoint debugging support completely within Nvim
    -----------------------------------

    -- debugging adapter protocol (DAP)
    { "mfussenegger/nvim-dap",        main = "dap",          name = "dap" },
}
