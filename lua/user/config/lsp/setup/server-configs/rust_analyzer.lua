local create_config = require("user.config.lsp.setup.config-builder").create_config

return function(server)
  local rt = require "rust-tools"

  local config = create_config {
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = {
          command = "clippy",
        },
      },
    },
    on_attach = function(_, bufnr)
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
    end,
  }

  rt.setup {
    server = config,
  }
end
