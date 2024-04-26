-----------------------------------
-- vim motion remappings
-----------------------------------

-- file directory view
vim.keymap.set("n", "<leader><leader>", vim.cmd.Ex)
vim.keymap.set("n", "<leader>ls", vim.cmd.Ex)
vim.keymap.set("n", "<leader>dir", vim.cmd.Ex)

-- in visual mode, select lines and then hold Shift+J to move lines up
vim.keymap.set("v", "J", ":m '<-2<CR>gv=gv")
-- in visual mode, select lines and then hold Shift+K to move lines down
vim.keymap.set("v", "K", ":m '>+1<CR>gv=gv")

-- navigate between symbols - jump out of definition (pop tag from stack)
vim.keymap.set("n", "<C-[>", "<C-RightMouse>")
-- navigate between symbols - jump to definition (push tag to stack)
vim.keymap.set("n", "<C-]>", "<C-]>")

vim.keymap.set("n", "Y", "yg$")
vim.keymap.set("n", "J", "mzJ`z")

-- half page navigation - keep cursor at col 1
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- up
vim.keymap.set("n", "<C-e>", "<C-d>zz") -- down

-- when searching terms keep cursor at col 1
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- paste buffer over highlighted text without changing paste buffer to deleted text
vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set({ "n", "v" }, "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d")

-- never press capital Q
vim.keymap.set("n", "Q", "<nop>")

-- format code if lsp is capable of formatting
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
end)

-- quick fix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- regex replace
vim.keymap.set("n", "<leader>s", [[:%s/\v\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- make a file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- navigate to next pane
vim.keymap.set("n", "<leader>w<Right>", "<C-w>w")
-- navigate to previous pane
vim.keymap.set("n", "<leader>w<Left>", "<C-w>W")

-- navigate to bottom right pane
vim.keymap.set("n", "<leader>w<Down>", "<C-w>b")
-- navigate to top left pane
vim.keymap.set("n", "<leader>w<Up>", "<C-w>t")

-- create new vertical pane for a terminal
vim.keymap.set("n", "<leader>tn", [[:100vne<CR>:term<CR><C-w>x<C-w>wi]])

-- open new vertical pane to this file
vim.keymap.set("n", "<leader>remap", [[:sp ~/.config/nvim/lua/nvim-config/remap.lua<CR>]])

-----------------------------------
-- plugin-specific mappings
-----------------------------------

-----------------------------------
-- fun plugins
-----------------------------------

-- cellular-automaton.nvim
-- make text on screen rain as if liquid
vim.keymap.set("n", "<leader>rain", "<cmd>CellularAutomaton make_it_rain<CR>")

-- duck.nvim
-- create new duck at 2 steps a second
vim.keymap.set("n", "<leader>duck", function() require("duck").hatch("🦆", 2) end)

-- create new amogus at 5 steps a second
vim.keymap.set("n", "<leader>amog5", function() require("duck").hatch("ඞ", 5) end)

-- create new amogus at 10 steps a second
vim.keymap.set("n", "<leader>amog10", function() require("duck").hatch("ඞ", 10) end)

-- where's waldo

vim.keymap.set("n", "<leader>waldo", function()
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
end)

-- get rid of all spawned creatures
vim.keymap.set("n", "<leader>duckstop", function() require("duck").cook_all() end)

-----------------------------------
-- functional plugins
-----------------------------------

-- watch.nvim
-- open a new vertical pane and populate the :WatchStart command
vim.keymap.set("n", "<leader>tw", [[:80vne<CR><C-w>x<C-w>w:WatchStart ]])

-- vim-fugitive.nvim
-- new horizontal split for Git change tree
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

-- glow.nvim
-- render current buffer as markdown in new floating transparent pane
vim.keymap.set("n", "<leader>md", vim.cmd.Glow)

-- undotree.nvim
-- open undo tree terminal ui
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- nvim-dap.nvim
-- debug adapter protocol breakpoints and step-through mappings
vim.keymap.set("n", "<F5>", function() require("dap").continue() end)
vim.keymap.set("n", "<F10>", function() require("dap").step_over() end)
vim.keymap.set("n", "<F11>", function() require("dap").step_into() end)
vim.keymap.set("n", "<F12>", function() require("dap").step_out() end)
vim.keymap.set("n", "<leader>b", function() require("dap").toggle_breakpoint() end)
vim.keymap.set("n", "<leader>B", function() require("dap").set_breakpoint() end)
vim.keymap.set("n", "<leader>Be", function() require("dap").set_exception_breakpoints() end)
vim.keymap.set("n", "<leader>lp", function()
    require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end)
vim.keymap.set("n", "<leader>dr", function() require("dap").repl.open() end)
vim.keymap.set("n", "<leader>dl", function() require("dap").run_last() end)
vim.keymap.set({ "n", "v" }, "<leader>dh", function()
    require("dap.ui.widgets").hover()
end)
vim.keymap.set({ "n", "v" }, "<leader>dp", function()
    require("dap.ui.widgets").preview()
end)
vim.keymap.set("n", "<leader>df", function()
    local widgets = require("dap.ui.widgets")
    widgets.centered_float(widgets.frames)
end)
vim.keymap.set("n", "<leader>ds", function()
    local widgets = require("dap.ui.widgets")
    widgets.centered_float(widgets.scopes)
end)
vim.keymap.set("n", "<leader>dt", function() require("dap").terminate() end)
vim.keymap.set("n", "<leader>dc", function() require("dap").clear_breakpoints() end)
vim.keymap.set("n", "<leader>d?", function() require("dap").list_breakpoints() end)
