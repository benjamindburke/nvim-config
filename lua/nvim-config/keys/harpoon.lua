return {
    {
        "<C-g>",
        function()
            local harpoon = require("harpoon")
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        mode = { "n", "v" },
        desc = "Open the harpoon navigation UI",
    },
    {
        "<leader>a",
        function() require("harpoon"):list():add() end,
        mode = { "n" },
        desc = "Mark a new file",
    },
    {
        "<C-a>",
        function() require("harpoon"):list():select(1) end,
        mode = { "n", "v" },
        desc = "Open marked file 1",
    },
    {
        "<C-s>",
        function() require("harpoon"):list():select(2) end,
        mode = { "n", "v" },
        desc = "Open marked file 2",
    },
    {
        "<C-h>",
        function() require("harpoon"):list():select(3) end,
        mode = { "n", "v" },
        desc = "Open marked file 3",
    },
    {
        "<C-t>",
        function() require("harpoon"):list():select(4) end,
        mode = { "n", "v" },
        desc = "Open marked file 4",
    },
}
