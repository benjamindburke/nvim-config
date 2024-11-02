return {
    "williamboman/mason-lspconfig.nvim",
    lazy         = true,
    event        = { "FileType" },
    dependencies = {
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
        "vonheikemen/lsp-zero.nvim",
    },
    config       = function()
        local lspconfig = require("lspconfig")
        local lsp_zero = require("lsp-zero")
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
                -- this first function is the "default handler"
                -- it applies to every language server without a "custom handler"
                function(server_name)
                    lspconfig[server_name].setup({})
                end,
                bashls = function()
                    lspconfig.bashls.setup({})
                    vim.api.nvim_create_autocmd(
                        { "BufEnter", "BufWinEnter" },
                        {
                            group = vim.api.nvim_create_augroup("bashls.filetype", {}),
                            callback = function()
                                if (vim.bo.filetype == "sh") then
                                    vim.bo.filetype = "bash"
                                end
                            end,
                        }
                    )
                end,
                lua_ls = function()
                    local lua_opts = lsp_zero.nvim_lua_ls()
                    lspconfig.lua_ls.setup(lua_opts)
                end,
                pylsp = function()
                    lspconfig.pylsp.setup({
                        pylsp = {
                            pylsp = {
                                configurationSources = { "flake8" },
                                plugins = {
                                    flake8 = {
                                        enabled = true
                                    },
                                },
                            },
                        },
                    })
                end,
            },
        })
    end,
}
