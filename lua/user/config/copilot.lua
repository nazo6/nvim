return {
  setup = function() end,
  config = function()
    require("copilot").setup {
      suggestion = {
        enabled = false,
      },
    }
  end,
}
