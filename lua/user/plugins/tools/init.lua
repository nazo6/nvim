return {
  {
    "nazo6/restart.nvim",
    lazy = false,
    priority = 0,
    config = function()
      require("restart").setup()
    end,
  },
  { "sbulav/nredir.nvim", cmd = { "Nredir" } },
}
