local Util = require("util")

return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<leader>f", Util.telescope("find_files"), desc = "Find files" },
	},
	opts = {
		defaults = {
			layout_strategy = "flex",
			layout_config = {
				width = 0.95,
				horizontal = {
					preview_cutoff = 0,
				},
				flex = {
					flip_columns = 200,
				},
			},
		},
		pickers = {
			find_files = {
				find_command = {
					"rg",
					"--files",
					"--glob",
					"!**/.git/*",
					"--glob",
					"!**/target/*",
					"--glob",
					"!**/node_modules/*",
				},
			},
		},
	},
}
