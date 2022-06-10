require("mini.surround").setup {}

require("mini.cursorword").setup {}
_G.cursorword_blocklist = function()
  local blocklist = { "NvimTree", "terminal", "packer", "Trouble" }
  local filetype = vim.api.nvim_buf_get_option(0, "filetype")
  vim.b.minicursorword_disable = vim.tbl_contains(blocklist, filetype)
end
vim.cmd [[au CursorMoved * lua _G.cursorword_blocklist()]]
