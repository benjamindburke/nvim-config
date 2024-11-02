# Changelog

## 2024-11-02

Move plugin config from init.lua to load-time config callbacks

## 2024-11-01

Automatically remap sh file types to bash for bashls support

## 2024-11-01

Fix bug <cmd> requires <CR> at the end

## 2024-11-01

Configure lazy loading on key maps and on nvim events

## 2024-09-09

Sign every commit in history with GPG key; side effect, destroy original commited date for all commits

## 2024-09-09

Add no-neck-pain.nvim plugin

## 2024-08-07

If source file is python, run black formatter instead of vim.lsp.buf.format()

## 2024-07-23

Ensure nerd font support with vim.g.have_nerd_font = true

## 2024-07-22

Replace catppuccin colorscheme with sakurapine

## 2024-07-12

Add LuaSnip suggestion dependency for editing nvim config

## 2024-07-10

Fixed keybind harpoon mark 4th file 

## 2024-07-09

Fix lazy-load dependency commands not running when called
Tweak keybinds to be more consistent/next to each other on Workman layout (: ; i)

## 2024-07-09

Fix warning for lsp-zero-extend-lspconfig

## 2024-04-26

Attempt to use project's flake8 for ignoring warnings/errors

## 2024-04-26

Swap to harpoon branch `harpoon2` to support marks per repo branch + cwd

## 2024-04-24

nvim-dap-python works with Tornado applications!

## 2024-04-21

Remove text from suggested snippets
Use buffer formatter for all Lua files

## 2024-04-19

Add another fun plugin, duck.nvim

## 2024-04-17

Use \v very magic regexes and remove <Space> mapping to dismiss cmp snippets.
<Space> needed to be double spaced between words to enter a raw space char.

## 2024-04-14

Add a remap to open the remappings file in a new horizontal split.

## 2024-04-14

Figure out debugging using nvim-dap. Add keymappings to debug functions.

## 2024-04-11

Migrate plugin manager from packer.nvim to lazy.nvim

## 2024-03-29

Add CHANGELOG.md and README.md
