return {
  {
    "nazo6/restart.nvim",
    enabled = not Args.feature.vscode,
    lazy = false,
    priority = 0,
    config = function()
      require("restart").setup()
    end,
  },
  { "sbulav/nredir.nvim", cmd = { "Nredir" } },
}
