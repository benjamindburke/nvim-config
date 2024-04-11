require("nvim-config")

local lazypath = vim.fn.stdpath("data").."/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

------------------------
-- run anything that needs to be configured after
-- autoloading all plugins
------------------------

vim.cmd.colorscheme "catppuccin-mocha"

local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

require("ibl").setup { indent = { highlight = highlight } }

-- update all treesitter parsers
vim.cmd.TSUpdate()

local lsp_zero = require("lsp-zero")
local navic = require("nvim-navic")

-- configure lsps to attach to buffers
lsp_zero.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    -- go to definition
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)

    -- open hover documentation
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)

    -- search for workspace symbol
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)

    -- perform a code action if any is defined
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)

    -- open method signature
    vim.keymap.set("n", "<leader>vms", function() vim.lsp.buf.signature_help() end, opts)

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
        -- this first function is the "default handler"
        -- it applies to every language server without a "custom handler"
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
        lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require("lspconfig").lua_ls.setup(lua_opts)
        end,
    }
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

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
        -- traverse suggested snippets
        ["<C-j>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-y>"] = cmp.mapping.select_next_item(cmp_select),

        -- scroll hovered docs
        ['<C-1>'] = cmp.mapping.scroll_docs(-4),
        ['<C-q>'] = cmp.mapping.scroll_docs(4),

        -- ignore suggestions
        ['<C-.>'] = cmp.mapping.abort(),

        -- accept currently highlighted snippet
        ["<CR>"] = cmp.mapping.confirm({ select = true }),

        -- complete the currently highlighted snippet
        ["<C-Space>"] = cmp.mapping.complete(),
    })
})
