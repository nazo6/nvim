return function(server)
  local config = {
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = {
          command = "clippy",
        },
      },
    },
  }

  require("rust-tools").setup {
    server = config,
  }
end
