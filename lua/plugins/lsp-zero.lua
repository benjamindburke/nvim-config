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
    end,
}
