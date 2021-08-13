require("lualine").setup({
	options = { theme = "tokyonight" },
	sections = {
		lualine_a = { { "mode", { upper = true } } },
		lualine_b = { { "diagnostics", { sources = { "nvim_lsp" } } } },
		lualine_c = { { "filename", { file_status = true, path = 1 } }, "branch" },
		lualine_x = { "fileformat", "encoding" },
		lualine_y = { "filetype" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
})
