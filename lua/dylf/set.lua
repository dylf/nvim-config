vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 5

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.showtabline = 2
vim.opt.smartindent = false
vim.opt.autoindent = true
vim.opt.smarttab = true

vim.opt.incsearch = true
vim.opt.wrap = false
vim.opt.mouse = "a"
vim.opt.colorcolumn = "80"

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.termguicolors = true

vim.g.mapleader = " "

-- get swap files outta here
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
