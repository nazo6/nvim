return {
  "stevearc/overseer.nvim",
  cmd = { "OverseerRun", "OverseerToggle" },
  init = function()
    map("n", "<F4>", "<cmd>OverseerRun<CR>")
    map("n", "<C-t>", "<cmd>OverseerRun<CR>")
    map("n", "<leader>o", "<cmd>OverseerToggle<CR>")
  end,
  config = function()
    require("overseer").setup {
      strategy = {
        "toggleterm",
        use_shell = false,
        auto_scroll = true,
        close_on_exit = false,
        open_on_start = true,
        hidden = false,
      },
      templates = { "builtin", "user.gcc_run" },
      task_list = {
        default_detail = 1,
        max_width = { 100, 0.2 },
        min_width = { 40, 0.1 },
        width = nil,
        separator = "────────────────────────────────────────",
        direction = "right",
        bindings = {
          ["?"] = "ShowHelp",
          ["<CR>"] = "RunAction",
          ["<C-e>"] = "Edit",
          ["o"] = "Open",
          ["<C-v>"] = "OpenVsplit",
          ["<C-s>"] = "OpenSplit",
          ["<C-f>"] = "OpenFloat",
          ["<C-q>"] = "OpenQuickFix",
          ["p"] = "TogglePreview",
          ["zo"] = "IncreaseDetail",
          ["zc"] = "DecreaseDetail",
          ["zO"] = "IncreaseAllDetail",
          ["zC"] = "DecreaseAllDetail",
          ["["] = "DecreaseWidth",
          ["]"] = "IncreaseWidth",
          ["{"] = "PrevTask",
          ["}"] = "NextTask",
        },
      },
    }
  end,
}
