vim.opt.tabstop = 4 -- insert 4 spaces for tab
vim.opt.softtabstop = 4 -- how many cols cursor moves when pressing tab
vim.opt.shiftwidth = 4 -- change number of space chars inserted for indentation
vim.opt.expandtab = true -- use tabs instead of spaces vim.opt.smartindent = true -- make indenting smart lol
vim.opt.smarttab = true -- tabbing will realize you have 2 vs 4

-- vim.opt.guicursor=
vim.opt.relativenumber = true -- toggle relative line numbers
vim.opt.nu = true -- toggle line numbers
vim.opt.hidden = true -- hide instead of deleting unsaved buffer when a new file is opened
vim.opt.errorbells = false -- we really don't need no error bells

vim.opt.splitbelow = true -- horizontal splits will automatically be below
vim.opt.splitright = true -- vertical splits will automatically be to the right

vim.opt.swapfile = false -- keeping history as per recs (i think from Primeagen)
vim.opt.backup = false
vim.opt.undodir = "~/.vim/undodir"
vim.opt.undofile = true

vim.opt.scrolloff = 8 -- always keeps 8 lines in the bottom
vim.opt.signcolumn = "auto" -- adds a column, useful for LSP info e.g. lints

-- syntax enable
-- syntax on              -- turn on syntax
-- filetype plugin indent on

vim.opt.formatoptions = "cro" -- stop newline continuation of comments
