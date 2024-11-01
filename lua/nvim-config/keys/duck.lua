return {
    {
        "<leader>duck",
        function() require("duck").hatch("🦆", 2) end,
        mode = { "n" },
        desc = "Create a new duck at 2 steps/s",
    },
    {
        "<leader>amog5",
        function() require("duck").hatch("ඞ", 5) end,
        mode = { "n" },
        desc = "Create a new among us at 5 steps/s",
    },
    {
        "<leader>amog10",
        function() require("duck").hatch("ඞ", 10) end,
        mode = { "n" },
        desc = "Create a new among us at 10 steps/s",
    },
    {
        "<leader>waldo",
        function()
            local duck = require("duck")
            local count = 30
            for _ = 1, count, 1
            do
                duck.hatch("✨", 5)
                duck.hatch("✨", 10)
                duck.hatch("✨", 15)
                duck.hatch("✨", 20)
            end
            duck.hatch("ඞ", 20)
        end,
        mode = { "n" },
        desc = "Time to play where's waldo!",
    },
    {
        "<leader>duckstop",
        function() require("duck").cook_all() end,
        mode = { "n" },
        desc = "Remove all ducks spawned in the buffer",
    },
}
