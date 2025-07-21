-- This enable the lsp servers
-- Config can be found in the lsp folder inside nvim config folder.
vim.lsp.enable('lua_ls')
vim.lsp.enable('ts_ls')
vim.lsp.enable('yamlls')

-- Completion menu
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client:supports_method('textDocument/completion') then
            vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
            vim.keymap.set('i', '<C-Space>', function()
                vim.lsp.completion.get()
            end)
        end
    end,
})

-- Diagnostics
vim.diagnostic.config({
    -- Default configuration
    -- virtual_lines = true

    virtual_lines = {
        -- Only show virtual line diag for current cursor line
        current_line = true,
    }

})
