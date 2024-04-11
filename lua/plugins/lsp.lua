-- language server protocols
return {
    "vonheikemen/lsp-zero.nvim",
    version = "v3.x",
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
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
    },
    config = function()
        local lsp_zero = require("lsp-zero")
        local navic = require("nvim-navic")
        
        lsp_zero.on_attach(function(client, bufnr)
            local opts = {buffer = bufnr, remap = false}
        
            -- go to definition
            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        
            -- open hover documentation
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        
            -- search for workspace symbol
            vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        
            -- perform a code action if any is defined
            vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        
            -- open method signature
            vim.keymap.set("i", "<leader>vms", function() vim.lsp.buf.signature_help() end, opts)
        
            -- search for references
            vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        
            -- rename symbol
            vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        
            -- diagnostics
            vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
            vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
            vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
        
            navic.attach(client, bufnr)
        end)
        
        -- to learn how to use mason.nvim with lsp-zero
        -- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
        require("mason").setup({})
        require("mason-lspconfig").setup({
            -- full list: https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers
            ensure_installed = {
                -- some language servers require npm (node.js)
                "bashls",
                "dockerls",
                "docker_compose_language_service",
                "gopls",
                "elixirls",
                "elmls",
                "elp", -- Erlang Language Platform
                "gopls",
                "html",
                "lua_ls",
                "sqlls",
                "pylsp",
                "terraformls",
                "yamlls"
            },
            handlers = {
                lsp_zero.default_setup,
                lua_ls = function()
                    local lua_opts = lsp_zero.nvim_lua_ls()
                    require("lspconfig").lua_ls.setup(lua_opts)
                end,
            }
        })
        
        local cmp = require("cmp")
        local cmp_select = {behavior = cmp.SelectBehavior.Select}
        
        -- this is the function that loads the extra snippets to luasnip
        -- from rafamadriz/friendly-snippets
        require("luasnip.loaders.from_vscode").lazy_load()
        
        cmp.setup({
            sources = {
                { name = "path" },
                { name = "nvim_lsp" },
                { name = "nvim_lua" },
                { name = "luasnip", keyword_length = 2 },
                { name = "buffer", keyword_length = 3 },
            },
            formatting = lsp_zero.cmp_format({ details = false }),
            mapping = cmp.mapping.preset.insert({
                ["<C-j>"] = cmp.mapping.select_prev_item(cmp_select),
                ["<C-k>"] = cmp.mapping.select_next_item(cmp_select),
                ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            })
        })
    end,
}
