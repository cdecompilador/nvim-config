return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp"
    },
    config = function()
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local opts = { noremap = true, silent = true }
        local on_attach = function(client, bufnr)
            opts.buffer = bufnr

            local keymap = vim.keymap

            keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
            keymap.set("n", "<leader>s", 
                "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>",
                opts)
            keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
            keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, opts)
        end

        local capabilities = cmp_nvim_lsp.default_capabilities()
        local lsp_servers = {
            "tsserver",
            "html",
            "cssls",
            "tailwindcss",
            "lua_ls",
            "pyright",
            "clangd",
            "omnisharp"
        }

        for _, srv in ipairs(lsp_servers) do
            lspconfig[srv].setup({
                capabilities = capabilities,
                on_attach = on_attach
            })
        end

        lspconfig["lua_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                Lua = {
                    diagnostics = { globals = { "vim" } },
                    workspace = {
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true
                        }
                    }
                },
            },
        })

        lspconfig["omnisharp"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            cmd = { "omnisharp", "--languageserver" }
        })
    end
}
