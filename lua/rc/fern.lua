local autocmd = require("utils.autocmd")
vim.g["fern#renderer"] = "nerdfont"
vim.g["fern#default_hidden"] = 1
autocmd({
	id = "fern-hide",
	events = "FileType",
	filetypes = "fern",
	command = function()
		vim.cmd("set nonumber")
	end,
})
autocmd({
	id = "fern-keymaps",
	events = "FileType",
	filetypes = "fern",
	command = function()
		vim.api.nvim_buf_set_keymap(0, "n", "<Plug>(fern-action-open)", "<Plug>(fern-action-open:select)", {})
		vim.api.nvim_buf_set_keymap(0, "n", "d", "<Plug>(fern-action-remove)", {})
	end,
})
autocmd({ id = "fern-glyph", events = "FileType", filetypes = "fern", command = "call glyph_palette#apply()" })
