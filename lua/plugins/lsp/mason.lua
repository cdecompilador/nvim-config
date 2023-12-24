return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim"
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local mason_tool_installer = require("mason-tool-installer")

        -- Enable mason
        mason.setup()

        -- Install/Setup lsp servers
        mason_lspconfig.setup({
            ensure_installed = {
                "tsserver",
                "html",
                "cssls",
                "tailwindcss",
                "lua_ls",
                "pyright",
                "clangd",
                "omnisharp",
            },
            automatic_installation = true
        })

        -- Install formatters and linters
        mason_tool_installer.setup({
            ensure_installed = {
                "prettier", -- js formatter
                "stylua",   -- lua formatter
                "isort",    -- python formatter
                "eslint_d"  -- js linter
            }
        })
    end
}
