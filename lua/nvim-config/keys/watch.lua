return {
    {
        "<leader>tw",
        [[:80vne<CR><C-w>x<C-w>w:WatchStart ]],
        mode = { "n" },
        desc = "Open a new vertical pane that watches the output of a provided command",
    },
}
