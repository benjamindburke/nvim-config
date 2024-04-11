-- preferred colorscheme
return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
        flavour = "mocha",
        background = { -- :h background
            light = "latte",
            dark = "mocha",
        },
        transparent_background = false, -- disables setting the background color.
        show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
        term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
        dim_inactive = {
            enabled = false, -- dims the background color of inactive window
            shade = "dark",
            percentage = 0.15, -- percentage of the shade to apply to the inactive window
        },
        no_italic = false, -- Force no italic
        no_bold = false, -- Force no bold
        no_underline = false, -- Force no underline
        styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
            comments = { "italic" }, -- Change the style of comments
            conditionals = { "italic" },
            loops = {},
            functions = {},
            keywords = {},
            strings = {},
            variables = {},
            numbers = {},
            booleans = {},
            properties = {},
            types = {},
            operators = {},
            -- miscs = {}, -- Uncomment to turn off hard-coded styles
        },
        color_overrides = {
            mocha = {
                text     = "#F4CDE9",
                subtext1 = "#DEBAD4",
                subtext0 = "#C8A6BE",
                overlay2 = "#B293A8",
                overlay1 = "#9C7F92",
                overlay0 = "#866C7D",
                surface2 = "#705867",
                surface1 = "#5A4551",
                surface0 = "#44313B",

                base     = "#352939",
                mantle   = "#211924",
                crust    = "#1A1016",
            },
        },
        custom_highlights = {},
        integrations = {
            cmp = true,
            gitsigns = true,
            harpoon = false,
            notify = false,
            nvimtree = true,
            treesitter = true,
            barbecue = {
                dim_dirname = true, -- directory name is dimmed by default
                bold_basename = true,
                dim_context = false,
                alt_background = false,
            },
            indent_blankline = {
                enabled = true,
                scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
                colored_indent_levels = false,
            },
            mini = {
                enabled = true,
                indentscope_color = "",
            },
            native_lsp = {
                enabled = true,
                virtual_text = {
                    errors = { "italic" },
                    hints = { "italic" },
                    warnings = { "italic" },
                    information = { "italic" },
                },
                underlines = {
                    errors = { "underline" },
                    hints = { "underline" },
                    warnings = { "underline" },
                    information = { "underline" },
                },
                inlay_hints = {
                    background = true,
                },
            },
            navic = {
                enabled = false,
                custom_bg = "NONE", -- "lualine" will set background to mantle
            },
            telescope = {
                enabled = true,
            }
            -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
        },
    }
}
