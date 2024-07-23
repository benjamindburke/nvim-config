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

-- indent at same indentation level for new lines
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

-- color support in vim terminal mode
vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- quick updates
vim.opt.updatetime = 50

-- display column at preferred max line length for visual clarity
vim.opt.colorcolumn = "100"

vim.g.mapleader = " "
vim.g.localmapleader = "\\"

-- turn off netrw banner when opening nvim
vim.g.netrw_banner = false

-- configure nerd font support
vim.g.have_nerd_font = true

-----------------------------------
-- plugin-specific setting changes
-----------------------------------

-- (barbecue.nvim) triggers CursorHold event faster
vim.opt.updatetime = 200
