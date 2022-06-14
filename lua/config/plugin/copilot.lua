return {
  setup = function() end,
  config = function()
    require("copilot").setup {
      cmp_method = "getPanelCompletions",
    }
  end,
}
