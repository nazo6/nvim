return function(use)
  use {
    "mfussenegger/nvim-dap",
    module = { "dap" },
    config = function()
      require "user.config.dap"
    end,
  }
  use {
    "rcarriga/nvim-dap-ui",
    module = { "dapui" },
  }
  use {
    "theHamsta/nvim-dap-virtual-text",
    module = "nvim-dap-virtual-text",
  }
end
