return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      require "user.config.dap"
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
  },
  {
    "theHamsta/nvim-dap-virtual-text",
  },
}
