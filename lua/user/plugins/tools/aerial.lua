return {
  "stevearc/aerial.nvim",
  event = "BufRead",
  cmd = "Aerial",
  init = function()
    -- map("n", "<leader>o", "<cmd>AerialToggle<CR>")
  end,
  config = function()
    require("aerial").setup {
      filter_kind = false,
    }
  end,
}
