local harpoon_mark = require('harpoon.mark')
local harpoon_ui = require('harpoon.ui')
vim.keymap.set('n', '<leader>a', harpoon_mark.add_file)
vim.keymap.set('n', '<C-t>', harpoon_ui.toggle_quick_menu)

vim.keymap.set('n', '<leader>q', function() harpoon_ui.nav_file(1) end)
vim.keymap.set('n', '<leader>w', function() harpoon_ui.nav_file(2) end)
vim.keymap.set('n', '<leader>e', function() harpoon_ui.nav_file(3) end)
vim.keymap.set('n', '<leader>r', function() harpoon_ui.nav_file(4) end)
