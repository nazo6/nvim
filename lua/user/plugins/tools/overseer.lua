return {
  "stevearc/overseer.nvim",
  cmd = { "OverseerRun", "OverseerToggle" },
  init = function()
    map("n", "<C-t>", "<cmd>OverseerRun<CR>")
    map("n", "<leader>o", "<cmd>OverseerToggle<CR>")
  end,
  config = function()
    require("overseer").setup {
      component_aliases = {
        default = {
          "user.remove_winbar",
          "open_output",
          "on_exit_set_status",
          "on_complete_notify",
          { "on_complete_dispose", require_view = { "SUCCESS", "FAILURE" } },
        },
        default_vscode = {
          "default",
          "on_result_diagnostics",
        },
        default_builtin = {
          "on_exit_set_status",
          "on_complete_dispose",
          { "unique", soft = true },
        },
      },
    }
  end,
}
