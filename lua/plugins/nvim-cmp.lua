return {
    "hrsh7th/nvim-cmp",
    lazy         = true,
    event        = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "vonheikemen/lsp-zero.nvim",
        "windwp/nvim-autopairs",
    },
    config       = function()
        local plugin = require("cmp")
        local cmp_select = { behavior = plugin.SelectBehavior.Select }
        plugin.setup({
            sources = {
                { name = "path" },
                {
                    name = "nvim_lsp",
                    keyword_length = 3,
                    entry_filter = function(entry, _ctx)
                        -- remove all text typed suggestions
                        return require("cmp.types").lsp.CompletionItemKind[entry:get_kind()] ~= "Text"
                    end,
                },
                { name = "nvim_lsp_signature_help", keyword_length = 3 },
                { name = "nvim_lua" },
                { name = "buffer",                  keyword_length = 3 },
            },
            formatting = require("lsp-zero").cmp_format({ details = false }),
            mapping = plugin.mapping.preset.insert({
                -- traverse suggested snippets
                ["<C-<Up>>"] = plugin.mapping.select_prev_item(cmp_select),
                ["<C-<Down>>"] = plugin.mapping.select_next_item(cmp_select),

                -- scroll hovered docs
                ["<C-j>"] = plugin.mapping.scroll_docs(-4),
                ["<C-y>"] = plugin.mapping.scroll_docs(4),

                -- dismiss suggestions
                ["<Enter>"] = plugin.mapping.abort(),

                -- request suggestions
                ["<C-Enter>"] = plugin.mapping.complete(),
                ["<C-Space>"] = plugin.mapping.complete(),

                -- accept currently highlighted snippet
                ["<Tab>"] = plugin.mapping.confirm({ select = true }),
            }),
            view = {
                docs = { auto_open = true },
            },
            enabled = function()
                -- disable completion in comments
                local context = require("cmp.config.context")
                -- keep command mode completion enabled when cursor is in a comment
                return (
                    not context.in_treesitter_capture("comment")
                    or not context.in_syntax_group("Comment")
                )
            end
        })

        -- Insert `(` after selecting function or method item
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        plugin.event:on(
            "confirm_done",
            cmp_autopairs.on_confirm_done()
        )
    end,
}
