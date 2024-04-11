-- treesitter parsing
return {
    "nvim-treesitter/nvim-treesitter",
    name = "treesitter",
    config = function()
        vim.cmd(":TSUpdate")
    end,
    opts = {
        -- A list of parser names, or "all"
        ensure_installed = {
            "bash",
            "c",
            "clojure",
            "comment", -- highlight embedded TODO within comments
            "csv",
            "dockerfile",
            "eex", -- Embedded EliXir (EEx)
            "elixir",
            "elm",
            "erlang",
            "git_config",
            "git_rebase",
            "gitattributes",
            "gitignore",
            "gleam",
            "go",
            "gomod",
            "gosum",
            "heex", -- HTML EEx for Phoenix
            "jq",
            "json",
            "jsonc",
            "lua",
            "python",
            "query", -- treesitter query language
            "rst", -- reStructured Text (python)
            "ssh_config",
            "terraform",
            "vim", -- treesitter default - vimscript file parsing
            "vimdoc", -- treesitter default - vimdoc parsing
        },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = true,

        highlight = {
            enable = true,

            -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
            -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
            -- Using this option may slow down your editor, and you may see some duplicate highlights.
            -- Instead of true it can also be a list of languages
            additional_vim_regex_highlighting = false,
        },
    }
}
