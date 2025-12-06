return {
  "stevearc/overseer.nvim",
  cmd = { "OverseerRun", "OverseerToggle" },
  init = function()
    map("n", "<C-t>", "<cmd>OverseerRun<CR>")
    map("n", "<leader>o", "<cmd>OverseerToggle<CR>")
  end,
  config = function()
    require("overseer").setup {}
  end,
}
