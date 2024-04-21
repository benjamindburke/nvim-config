-----------------------------------
-- set vim options
-----------------------------------

-- set large cursor
vim.opt.guicursor = ""

-- relative line numbers and line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- 4 space indents
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

-- no line wrapping
vim.opt.wrap = false

-- no vim backups, give undotree access to historical undos
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- search highlighting options
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- quick updates
vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.g.mapleader = " "
vim.g.localmapleader = "\\"

-- turn off netrw banner when opening nvim
vim.g.netrw_banner = false

-----------------------------------
-- plugin-specific setting changes
-----------------------------------

-- (barbecue.nvim) triggers CursorHold event faster
vim.opt.updatetime = 200
