return {
  {
    "mfussenegger/nvim-dap",
    init = function()
      require("user.config.dap").init()
    end,
    config = function()
      require("user.config.dap").config()
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
  },
  {
    "theHamsta/nvim-dap-virtual-text",
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = { "williamboman/mason.nvim" },
  },
}
