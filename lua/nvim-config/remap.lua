-----------------------------------
-- vim motion remappings
-----------------------------------

-- create new vertical pane for a terminal
vim.keymap.set("n", "<leader>tn", [[:100vne<CR>:term<CR><C-w>x<C-w>wi]])

-- escape ends terminal insert mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- file directory view
vim.keymap.set("n", "<leader><leader>", vim.cmd.Ex)
vim.keymap.set("n", "<leader>ls", vim.cmd.Ex)
vim.keymap.set("n", "<leader>dir", vim.cmd.Ex)

-- in visual mode, select lines and then hold `:` to move lines up
vim.keymap.set("v", ":", ":m '<-2<CR>gv=gv")
-- in visual mode, select lines and then hold `I` to move lines down
vim.keymap.set("v", "I", ":m '>+1<CR>gv=gv")

-- navigate between symbols - jump out of definition (pop tag from stack)
vim.keymap.set("n", "<C-[>", "<C-RightMouse>")
-- navigate between symbols - jump to definition (push tag to stack)
vim.keymap.set("n", "<C-]>", "<C-]>")

-- yank rest of line
vim.keymap.set("n", "Y", "yg$")

-- move the contents of line below cursor to end of current line
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

-- delete text into empty register (i.e. do not yank)
vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d")

-- never press capital Q
vim.keymap.set("n", "Q", "<nop>")

-- This function opens the URL nearest to the cursor in the default browser
vim.keymap.set("n", "gx", function()
    -- Get the current line and column
    local line = vim.fn.getline(".")
    local col = vim.fn.col(".")

    -- Extract the URL nearest to the cursor
    local escaped_line = vim.fn.shellescape(line)
    local command = "extract_nearest_url " .. escaped_line .. " " .. col
    local cleaned_url = vim.fn.system(command)

    -- If a URL has been found, open it in default browser
    if (cleaned_url ~= "") then
        vim.cmd("!open " .. vim.fn.fnameescape(cleaned_url))
    end
end)

-- format code if lsp is capable of formatting
vim.keymap.set("n", "<leader>f", function()
    if (vim.bo.filetype == "python") then
        vim.cmd("!black %")
    else
        vim.lsp.buf.format()
    end
end)

-- quick fix navigation
vim.keymap.set("n", "<C-i>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-;>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>i", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>;", "<cmd>lprev<CR>zz")

-- regex replace
vim.keymap.set("n", "<leader>s", [[:%s/\v\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- make a file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- open new vertical pane to this file
vim.keymap.set("n", "<leader>remap", [[:sp ~/.config/nvim/lua/nvim-config/remap.lua<CR>]])

-----------------------------------
-- plugin-specific mappings
-----------------------------------

-----------------------------------
-- functional plugins
-----------------------------------

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
