require("bufferline").setup {
  options = {
    numbers = "none",
    max_name_length = 18,
    max_prefix_length = 15,
    tab_size = 18,
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = true,
    offsets = { { filetype = "NvimTree", text = "", text_align = "left" } },
  },
}
