return {
    -----------------------------------
    -- cosmetic plugins
    -- 
    -- these make my terminal look nice.
    -----------------------------------

    -- indentation lines with multiple color support
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
    },

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
        opts = {
            ai = {
                openai_api_key = os.getenv("OPENAI_API_KEY"),
                gpt_model = "gpt-3.5-turbo-0613",
            },
        }
    },

    -- render markdown in transparent terminal pane
    {
        "ellisonleao/glow.nvim",
        opts = { style = "dark" },
    },

    -- funzies
    { "eandrju/cellular-automaton.nvim" },

    -----------------------------------
    -- functional plugins
    -- 
    -- these plugins provide some amount of value in my developer workflow.
    -----------------------------------

    -- tree navigation for vim undo branches
    { "mbbill/undotree" },

    -- git plugin
    { "tpope/vim-fugitive" },

    -- command output watcher
    { "Makaze/watch.nvim" },

    -- treesitter playground
    { "nvim-treesitter/playground" },

    -- language server symbol provider
    {
        "SmiteshP/nvim-navic",
        dependencies = { "neovim/nvim-lspconfig" },
        opts = { lsp = { auto_attach = true } },
    },

    -- breadcrumb symbols in floating bar above buffer
    {
        "utilyre/barbecue.nvim",
        version = "*",
        dependencies = {
            { "SmiteshP/nvim-navic" },
            { "nvim-tree/nvim-web-devicons" },
        },
    },
}
