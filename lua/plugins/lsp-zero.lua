return {
    "vonheikemen/lsp-zero.nvim",
    version      = "v3.x",
    lazy         = true,
    event        = { "VimEnter" },
    dependencies = {
        "neovim/nvim-lspconfig",
        "SmiteshP/nvim-navic",
    },
    init         = function()
        local plugin = require("lsp-zero")
        plugin.extend_lspconfig()
        local navic = require("nvim-navic")

        -- configure lsps to attach to buffers
        plugin.on_attach(function(client, bufnr)
            local configure_lsp_keymaps = require("nvim-config.keys.lsp")
            configure_lsp_keymaps({ buffer = bufnr, remap = false })
            navic.attach(client, bufnr)
        end)

        local lspconfig = require("lspconfig")
        lspconfig.gopls.setup({
            on_attach = on_attach,
            cmd = { os.getenv("HOME") .. "/.local/share/nvim/mason/bin/gopls" },
            filetypes = { "go", "gomod", "gowork", "gotmpl" },
            root_dir = vim.fs.dirname(vim.fs.find({ "go.work", "go.mod", ".git" }, { upward = true })[1]),
            settings = {
                gopls = {
                    completeUnimported = true,
                    usePlaceholders = true,
                    analyses = {
                        unusedparams = true,
                    },
                },
            }
        })
    end,
}
