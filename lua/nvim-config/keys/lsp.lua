return function (opts)
    -- format code if lsp is capable of formatting
    vim.keymap.set(
        "n",
        "<leader>f",
        function()
            if (vim.bo.filetype == "python") then
                vim.cmd("!black %")
            else
                vim.lsp.buf.format()
            end
        end,
        opts
    )

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
end
