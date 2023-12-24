local Util = require("lazy.core.util")

local M = {}

function M.telescope(builtin, opts)
	return function()
		require("telescope.builtin")[builtin](opts)
	end
end

function M.on_attach(on_attach)
	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			local buffer = args.buf
			local client = vim.lsp.get_client_by_id(args.data.client_id)

			on_attach(client, buffer)
		end,
	})
end

return M
