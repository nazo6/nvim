return {
  "hrsh7th/nvim-gtd",
  event = { "WinNew" },
  init = function()
    map("n", "gf", function()
      require("gtd").exec { command = "edit" }
    end)
  end,
  config = function()
    require("gtd").setup {}
  end,
}
