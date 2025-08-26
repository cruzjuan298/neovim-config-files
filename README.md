## My Personal Neovim Configuration files

The config files are both seperated into a lua folder in my /.config/nvim path. Generally, this makes it more organized for me to edit and add plugins.
If you'd like the same setup, run the following for both files:
````sh
cp <your clone directory>/file.lua /.config.nvim/lua/file.lua
````
## Walkthroughh
The first portion of the plugin.lua file sets up lazy.nvim. In that table is where all of my plugins reside. From top to bottom they include:
- colorscheme
- treesitter
- portable package manager
- lsp's
- file explorers (newtr is set by default but oil.nvim is included for easy setup)

I decided to use mason for my packagae manager (for now). To install lsp's, run the ```:MasonInstall {lsp name}``` or the ```:Mason``` command to see the menu of avilable lsp's.
Lsp's will automatically be configured because of the function in the mason-lsp-config.nvim table.
