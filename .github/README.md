# nvim-config

Feel free to rip out anything want.

## Installation

Clone repository to `~/.config/nvim/`.

## Workman vs Qwerty vs Dvorak

I type using the Workman keyboard layout. I also type on a fully reprogrammable 60%
split ergonomic mechanical keyboard [shameless
https://uhk.io plug. I highly HIGHLY recommend the wrist rests, key cluster and
trackpad addons for the best developer experience.](https://ultimatehackingkeyboard.com/product/uhk60v2) 

Considering I don't type Qwerty OR Dvorak, and multiple layers, I've made some
navigation changes to suit my home row of `ASHTGYNEOI'`.

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

So despite not using Qwerty, I don't find the need to remap hjkl at all!

## Requirements

This configuration relies on:
1. npm (required to install some LSPs)
1. Nerd Font (required to render LSP symbols)
   - The specific font I use is [GoMono Nerd Font](https://www.programmingfonts.org/#go-mono)
   - https://www.nerdfonts.com/font-downloads
1. OpenAI API key and account credits
   - This is ONLY required if you want to use the plugin text-to-colorscheme
