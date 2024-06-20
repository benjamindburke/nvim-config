return {
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
        dependencies = {
            { "nvim-tree/nvim-web-devicons", lazy = false },
        },
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
    { "eandrju/cellular-automaton.nvim",     lazy = true },

    { "tamton-aquib/duck.nvim",              lazy = true },

    -----------------------------------
    -- functional plugins
    --
    -- these plugins provide some amount of value in my developer workflow.
    -----------------------------------

    -- dependency for many plugins
    { "nvim-lua/plenary.nvim",               lazy = false },

    -- quick file navigations
    {
        "theprimeagen/harpoon",
        name = "harpoon",
        main = "harpoon",
        branch = "harpoon2",
        lazy = false,
        dependencies = { "nvim-lua/plenary.nvim" },
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
        dependencies = { "neovim/nvim-lspconfig" },
        opts = { lsp = { auto_attach = true } },
    },

    -- debugging adapter protocol (DAP)
    { "mfussenegger/nvim-dap",        main = "dap",        name = "dap" },

    -- python debugger
    { "mfussenegger/nvim-dap-python", main = "dap-python", name = "dap-python" },
}
