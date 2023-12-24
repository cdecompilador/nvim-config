vim.opt.swapfile = false

-- Show relative line numbers
vim.opt.number = true
vim.opt.rnu = true

-- Show ruler
vim.opt.ruler = true
vim.opt.cc = "80"

-- Search adjustments
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmatch = false -- fix brace insert delay

-- Whitespace stuff
vim.opt.wrap = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- netrw explorer setup
vim.g.netrw_list_hide = "\\(^\\|\\s\\s\\)\\zs\\.\\S\\+"

-- Indent
vim.opt.smartindent = true
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "*.c", "*.cpp", "*.cc", "*.cxx" },
	callback = function()
		vim.opt.cindent = true
		vim.opt.cinkeys = "0},0],0#,!^F,o,0,e"
	end,
})
