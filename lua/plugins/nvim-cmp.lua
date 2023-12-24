return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"onsails/lspkind.nvim",
		"saadparwaiz1/cmp_luasnip",
		"dcampos/nvim-snippy",
		"dcampos/cmp-snippy",
	},
	config = function()
		local cmp = require("cmp")
		local lspkind = require("lspkind")
		local snippy = require("snippy")

		vim.opt.completeopt = "menu,menuone,noselect"

		cmp.setup({
			mapping = cmp.mapping.preset.insert({
				["<Esc>"] = cmp.mapping.abort(),
				["C-n"] = cmp.mapping.complete(),
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "buffer" },
				{ name = "path" },
				{ name = "snippy" },
			}),
			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = "...",
				}),
			},
			snippet = {
				expand = function(args)
					snippy.expand_snippet(args.body)
				end,
			},
		})
	end,
}
