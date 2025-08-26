vim.opt.number = true

vim.opt.spell = false

vim.opt.relativenumber = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.wrap = false

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4 


vim.opt.clipboard = "unnamedplus"

vim.opt.scrolloff = 999

vim.opt.virtualedit = "block"

vim.opt.inccommand = "split"

vim.opt.ignorecase = true

vim.opt.termguicolors = true

vim.g.mapleader = " "

vim.diagnostic.config({
    virtual_lines = true
})

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

vim.keymap.set({'n', 'v', 's', 'o'}, '<Up>', '<Nop>', {noremap = true, silent = true})
vim.keymap.set({'n', 'v', 's', 'o'}, '<Down>', '<Nop>', {noremap = true, silent = true})
vim.keymap.set({'n', 'v', 's', 'o'}, '<Left>', '<Nop>', {noremap = true, silent = true})
vim.keymap.set({'n', 'v', 's', 'o'}, '<Right>', '<Nop>', {noremap = true, silent = true})


vim.keymap.set('i', '<Up>', '<Nop>', {noremap = true, silent = true})
vim.keymap.set('i', '<Down>', '<Nop>', {noremap = true, silent = true})
vim.keymap.set('i', '<Left>', '<Nop>', {noremap = true, silent = true})
vim.keymap.set('i', '<Right>', '<Nop>', {noremap = true, silent = true})


