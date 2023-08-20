local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
    'tsserver',
    'eslint',
    'sumneko_lua',
    'rust_analyzer'
})

lsp.set_preferences({
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(_client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)

    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>ft', function() vim.lsp.buf.format { async = true } end, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, bufopts)

    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
end)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, default_remap_opts)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, default_remap_opts)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, default_remap_opts)

-- prevent newline when pressing <cr> and selecting something from popup
vim.cmd([[
ino <silent><expr> <CR> pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"
]])

local should_show_virtual_text = false
local toggle_virtual_text_diagnostics = function()
    should_show_virtual_text = not should_show_virtual_text
    vim.diagnostic.config({ virtual_text = should_show_virtual_text })
end
vim.keymap.set('n', '<leader>dd', toggle_virtual_text_diagnostics)

local diagnostics_active = true
local toggle_diagnostics = function()
    diagnostics_active = not diagnostics_active
    if diagnostics_active then
        vim.diagnostic.show()
    else
        vim.diagnostic.hide()
    end
end
vim.keymap.set('n', '<leader>dx', toggle_diagnostics)

-- format on save?
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]

lsp.setup()
