return {
    -----------------------------------
    -- dependencies
    --
    -- lazy loading deps instead of listing as dependencies
    -- improves startup times
    -----------------------------------

    { "nvim-tree/nvim-web-devicons",         lazy = true },

    { "nvim-lua/plenary.nvim",               lazy = true },

    { "neovim/nvim-lspconfig",               lazy = true },

    { "SmiteshP/nvim-navic",                 lazy = true },

    { "MunifTanjim/nui.nvim",                lazy = true },

    -- LSP support

    { "neovim/nvim-lspconfig",               lazy = true },

    { "williamboman/mason.nvim",             lazy = true },

    { "williamboman/mason-lspconfig.nvim",   lazy = true },

    -- Autocompletion

    { "hrsh7th/nvim-cmp",                    lazy = true },

    { "hrsh7th/cmp-nvim-lsp",                lazy = true },

    { "hrsh7th/cmp-buffer",                  lazy = true },

    { "hrsh7th/cmp-path",                    lazy = true },

    { "hrsh7th/cmp-nvim-lua",                lazy = true },

    { "rafamadriz/friendly-snippets",        lazy = true },

    -----------------------------------
    -- cosmetic plugins
    --
    -- these make my terminal look nice.
    -----------------------------------

    -- indentation lines with multiple color support
    { "lukas-reineke/indent-blankline.nvim", main = "ibl" },

    -- lua-based status bar at bottom of buffers
    {
        "nvim-lualine/lualine.nvim",
        opts = { options = { theme = "moonfly" } },
    },

    -- use openai to generate colorschemes from words
    {
        "svermeulen/text-to-colorscheme.nvim",
        lazy = true,
        opts = {
            ai = {
                openai_api_key = os.getenv("OPENAI_API_KEY"),
                gpt_model = "gpt-3.5-turbo-0613",
            },
        },
    },

    -- render markdown in transparent terminal pane
    {
        "ellisonleao/glow.nvim",
        opts = { style = "dark" },
        lazy = true,
    },

    -- funzies
    { "eandrju/cellular-automaton.nvim", lazy = true },

    { "tamton-aquib/duck.nvim",          lazy = true },

    -----------------------------------
    -- functional plugins
    --
    -- these plugins provide some amount of value in my developer workflow.
    -----------------------------------

    -- language server protocol support
    {
        "vonheikemen/lsp-zero.nvim",
        version = "v3.x",
        lazy = false,
    },

    -- quick file navigations
    {
        "theprimeagen/harpoon",
        name = "harpoon",
        main = "harpoon",
        branch = "harpoon2",
        lazy = false,
    },

    -- automatically create pairs of "", (), {}, []
    { "windwp/nvim-autopairs",      event = "InsertEnter", config = true },

    -- tree navigation for vim undo branches
    { "mbbill/undotree" },

    -- git plugin
    { "tpope/vim-fugitive",         lazy = false },

    -- command output watcher
    { "Makaze/watch.nvim",          lazy = true },

    -- treesitter playground
    { "nvim-treesitter/playground", lazy = true },

    -- language server symbol provider
    {
        "SmiteshP/nvim-navic",
        opts = { lsp = { auto_attach = true } },
    },

    -- debugging adapter protocol (DAP)
    { "mfussenegger/nvim-dap",        main = "dap",        name = "dap" },

    -- python debugger
    { "mfussenegger/nvim-dap-python", main = "dap-python", name = "dap-python" },
}
