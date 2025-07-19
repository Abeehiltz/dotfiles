return {
    -- Mason that manages LSP servers installation
    {
        'mason-org/mason.nvim',
        opts = {},
    },
    -- Mason-lspconfig that connects mason and neovim's LSP client
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                "lua_ls",
                "pyright",
                "ts_ls",
                "rust_analyzer",
                "clangd",
                "yamlls"
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")

            lspconfig.lua_ls.setup({})
            lspconfig.pyright.setup({})
            lspconfig.ts_ls.setup({})
            lspconfig.rust_analyzer.setup({})
            lspconfig.clangd.setup({})
            lspconfig.yamlls.setup({})
        end
    },
}
