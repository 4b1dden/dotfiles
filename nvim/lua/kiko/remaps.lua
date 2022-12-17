local default_remap_opts = { noremap = true, silent = true }

-- toggle file tree
vim.keymap.set('n', '<C-b>', ":NERDTreeToggle<CR>", default_remap_opts)
-- vim.keymap.set('n', '<C-b>', ":NERDTreeFind", default_remap_opts)

-- highlight yanked text
vim.cmd([[
au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=150}
]])

-- hide highlighted stuff on enter or esc press
vim.keymap.set('n', '<ESC>', ":nohl<CR>", default_remap_opts)
vim.keymap.set('n', '<CR>', ":nohl<CR>", default_remap_opts)

-- treat long single lines as multiple lines
vim.keymap.set('n', 'j', 'gj', { silent = true })
vim.keymap.set('n', 'k', 'gk', { silent = true })

-- use <leader>y to indicate yank will go the system clipboard
vim.keymap.set('n', '<leader>y', '"*y', default_remap_opts)

-- move stuff around
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", default_remap_opts)
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", default_remap_opts)

-- center find result
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- keep cursor in middle when jumping
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- greatest remap ever
vim.keymap.set('x', '<leader>p', '\"_dP')

-- delete to void register
vim.keymap.set('n', '<leader>d', '\"_d')
vim.keymap.set('v', '<leader>d', '\"_d')

-- replace all under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
