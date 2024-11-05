return {
    {
        "<leader>pf",
        function() require("telescope.builtin").find_files() end,
        mode = { "n" },
        desc = "Grep search project files for matching file names",
    },
    {
        "<C-p>",
        function() require("telescope.builtin").git_files() end,
        mode = { "n" },
        desc = "Grep search git-tracked files for matches in file contents",
    },
    {
        -- NOTE: this motion requires https://github.com/BurntSushi/ripgrep to work
        "<leader>ps",
        function() require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ")}) end,
        mode = { "n" },
        desc = "Grep search project files for matching patterns in file contents"
    },
}
