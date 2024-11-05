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

-- line duplications
vim.keymap.set("n", "<M-Down>", [[:t.<CR>]], { desc = "Duplicate a line below the current line" })
vim.keymap.set("n", "<M-Up>", [[:t.<CR>v:<Esc>k]], { desc = "Duplicate a line above the current line" })

-- toggle fold regions
vim.keymap.set({ "n", "v" }, "<M-f>", "za", { desc = "Toggle fold regions" })
