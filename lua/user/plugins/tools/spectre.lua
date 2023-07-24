return {
  "windwp/nvim-spectre",
  init = function()
    map("n", "<leader>S", "<cmd>lua require('spectre').open()<CR>", { noremap = true, silent = true })
  end,
  config = function()
    require("spectre").setup {
      line_sep_start = "┌──────────────────────────────────────",
      result_padding = "│ ",
      line_sep = "└──────────────────────────────────────",
    }
  end,
}
