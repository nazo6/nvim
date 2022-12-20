return function(use)
  use {
    "mfussenegger/nvim-dap",
    config = function()
      require "user.config.dap"
    end,
  }
  use {
    "rcarriga/nvim-dap-ui",
  }
  use {
    "theHamsta/nvim-dap-virtual-text",
    module = "nvim-dap-virtual-text",
  }
end
