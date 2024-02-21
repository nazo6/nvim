return {
  "NeogitOrg/neogit",
  cmd = { "Neogit" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-telescope/telescope.nvim",
  },
  ---@type NeogitConfig
  opts = {
    graph_style = "unicode",
  },
}
