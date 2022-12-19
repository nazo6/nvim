return function(use)
  use("mfussenegger/nvim-dap", {
    on_lua = { "dap" },
    lua_source = [[require "user.config.dap"]],
  })
  use("rcarriga/nvim-dap-ui", {
    on_lua = { "dapui" },
  })
  use("theHamsta/nvim-dap-virtual-text", {
    on_lua = "nvim-dap-virtual-text",
  })
end
