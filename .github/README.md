# nvim-config

This serves as an up-to-date (as of 2024-03-29) copy of ThePrimeagen's 0 to LSP
Neovim configuration tutorial on YouTube.

With some personalizations for me, of course. Feel free to rip out anything want.
I have structured the plugin modifications in such a way that, for any plugin that
I've installed and configured, the configuration lives in a self-contained 
Lua file in the [after/plugin](./after/plugin) directory whenever possible.

## Workman vs Qwerty vs Dvorak

Prime types using the Dvorak layout, which notably, is not Qwerty. I also do not
type on a Qwerty layout. I type using the Workman keyboard layout. I also type
on a fully reprogrammable 60% split ergonomic mechanical keyboard [shameless
https://uhk.io plug. I highly HIGHLY recommend the wrist rests, key cluster and
trackpad addons for the best developer experience.](https://ultimatehackingkeyboard.com/product/uhk60v2) 

Considering I don't type Qwerty OR Dvorak, I've made some navigation changes to
suit my home row of ASHTG / YNEOI'.

## Vim motion remappings

UHK keyboards come out of the box with Arrow navigation keys already mapped to
Qwerty's Mod+I/J/K/L (Mod+U/N/E/O for Workman), so I'm extremely
used to navigating files with a left thumb and UNEO.

To capitalize on this existing familiarity, I also use <C-u> for half-file
navigation upwards and <C-e> for half-file navigation downwards
(see https://github.com/benjamindburke/nvim-config/blob/main/lua/nvim_config/remap.lua)
to share the U scancode between Up Arrow and Up 1/2 Page by switching between
Mod + u and <C-u> and Mod + e and <C-e> for Down Arrow.

My left hand's home row (ASHTG) is used for Harpoon navigation.

\<C-a> through \<C-t\> navigate through Harpoon file 1-4 with \<C-g\> bringing up the
Harpoon dashboard. Additionally, with the layers available on my keyboard, it is
more ergonomic for me to use Mod+U/N/E/O for Up/Left/Down/Right Arrows, respectively,
to navigate files with Vim motions.

Despite not using Qwerty, I don't find the need to remap hjkl at all!

## Requirements

This configuration relies on:
1. npm (required to install some LSPs)
1. Nerd Font (required to render LSP symbols)
   - The specific font I use is [JetBrainsMono Nerd Font](https://www.programmingfonts.org/#jetbrainsmono)
   - https://www.nerdfonts.com/font-downloads
1. OpenAI API key and account credits
   - This is ONLY required if you wish to use the plugin text-to-colorscheme
