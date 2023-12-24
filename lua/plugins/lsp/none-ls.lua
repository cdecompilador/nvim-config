return {
	"nvimtools/none-ls.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"jay-babu/mason-null-ls.nvim",
	},
	config = function()
		local mason_null_ls = require("mason-null-ls")
		local null_ls = require("null-ls")
		local null_ls_utils = require("null-ls.utils")

		mason_null_ls.setup({
			ensure_installed = {
				-- "prettier",
				-- "isort",
				-- "stylua",
				"eslint_d",
                "sqlfluff",
			},
		})

		-- To setup format on save
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics

		null_ls.setup({
			root_dir = null_ls_utils.root_pattern(
                ".null-ls-root", "Makefile", ".git", "package.json", "../transactions"
            ),
			sources = {
				-- formatting.prettier.with({
				-- 	extra_filetypes = { "svelte", "vue" },
				-- }), -- js/ts formatter
				-- formatting.stylua, -- lua formatter
				-- formatting.isort, -- python formatter
				diagnostics.eslint_d.with({
					condition = function(utils)
						return utils.root_has_file(
                            { ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.json" }
                        )
					end,
				}), -- js/ts linter
                diagnostics.sqlfluff.with({
                    extra_args = { "--dialect", "sqlite" }
                })
			},
		})
	end,
}
