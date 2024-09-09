-- harpoon file navigation
return {
    "theprimeagen/harpoon",
    branch = "harpoon2",
    lazy = false,
    config = function()
        -- configure harpoon keymappings
        local harpoon = require("harpoon")
        harpoon:setup({})

        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
        vim.keymap.set("n", "<C-g>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

        vim.keymap.set("n", "<C-a>", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<C-s>", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<C-h>", function() harpoon:list():select(3) end)
    end,
}
