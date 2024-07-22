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

    { "MunifTanjim/nui.nvim",                lazy = true },

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
        opts = { swatch = "sakura" },
    },

    -- indentation lines with multiple color support
    { "lukas-reineke/indent-blankline.nvim", main = "ibl" },

    -- lua-based status bar at bottom of buffers
    {
        "nvim-lualine/lualine.nvim",
        opts = { options = { theme = "auto" } },
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

    -----------------------------------
    -- Fun plugins
    --
    -- for personal entertainment between tasks
    -----------------------------------

    -- create chaos in a file by treating letters and symbols as cellular automata
    { "eandrju/cellular-automaton.nvim",   lazy = true },

    -- animated ducks that move across open buffers
    { "tamton-aquib/duck.nvim",            lazy = true },

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
    -- Autocompletion
    --
    -- snippet providers from configured LSPs
    -----------------------------------

    { "hrsh7th/nvim-cmp" },

    { "hrsh7th/cmp-nvim-lsp" },

    { "hrsh7th/cmp-buffer" },

    { "hrsh7th/cmp-path" },

    { "hrsh7th/cmp-nvim-lua" },

    { "rafamadriz/friendly-snippets" },

    { "L3MON4D3/LuaSnip" },

    -----------------------------------
    -- Functional plugins
    --
    -- these plugins provide some amount of value in my developer workflow.
    -----------------------------------

    -- render markdown in transparent terminal pane
    {
        "ellisonleao/glow.nvim",
        opts = { style = "dark" },
        lazy = true,
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
    { "windwp/nvim-autopairs",        event = "InsertEnter", config = true },

    -- tree navigation for vim undo branches
    { "mbbill/undotree" },

    -- git plugin
    { "tpope/vim-fugitive" },

    -- command output watcher
    { "Makaze/watch.nvim" },

    -- treesitter playground
    { "nvim-treesitter/playground",   lazy = true },

    -----------------------------------
    -- Debugger Adapter Protocols (DAP)
    --
    -- provide breakpoint debugging support completely within Nvim
    -----------------------------------

    -- debugging adapter protocol (DAP)
    { "mfussenegger/nvim-dap",        main = "dap",          name = "dap" },

    -- python debugger
    { "mfussenegger/nvim-dap-python", main = "dap-python",   name = "dap-python" },
}
