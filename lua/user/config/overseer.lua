return {
  init = function()
    vim.keymap.set("n", "<F5>", "<cmd>OverseerRun<CR>")
    vim.keymap.set("n", "<leader>or", "<cmd>OverseerRun<CR>")
    vim.keymap.set("n", "<C-t>", "<cmd>OverseerToggle<CR>")
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
