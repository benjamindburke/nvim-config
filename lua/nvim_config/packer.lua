-- This file can be loaded by calling `lua require("plugins")` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    use {
        "nvim-telescope/telescope.nvim", tag = "0.1.6",
        -- or                          , branch = "0.1.x",
        requires = { {"nvim-lua/plenary.nvim"} }
    }

    -- color scheme
    use { "catppuccin/nvim", as = "catppuccin" }

    -- treesitter parsing
    use { "nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" } }
    use "nvim-treesitter/playground"

    -- harpoon file navigation
    use "theprimeagen/harpoon"

    -- tree navigation for vim undo branches
    use "mbbill/undotree"

    -- git plugin
    use "tpope/vim-fugitive"

    use {
        "vonheikemen/lsp-zero.nvim",
        branch = "v3.x",
        requires = {
            -- LSP support
            {"neovim/nvim-lspconfig"},
            {"williamboman/mason.nvim"},
            {"williamboman/mason-lspconfig.nvim"},

            -- Autocompletion
            {"hrsh7th/nvim-cmp"},
            {"hrsh7th/cmp-nvim-lsp"},
            {"hrsh7th/cmp-buffer"},
            {"hrsh7th/cmp-path"},
            {"saadparwaiz1/cmp_luasnip"},
            {"hrsh7th/cmp-nvim-lua"},
            {"L3MON4D3/LuaSnip"},
            {"rafamadriz/friendly-snippets"}
        }
    }
end)
