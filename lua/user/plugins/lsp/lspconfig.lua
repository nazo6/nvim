return Args.feature.vscode and {}
  or {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "mason-org/mason-lspconfig.nvim",
        dependencies = { { "williamboman/mason.nvim" } },
        opts = {
          automatic_enable = false,
        },
      },
      { "j-hui/fidget.nvim" },
    },
    cmd = { "LspLog" },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      vim.api.nvim_create_user_command("LspLog", function()
        vim.cmd(string.format("tabnew %s", vim.lsp.log.get_filename()))
      end, {
        desc = "Opens the Nvim LSP client log.",
      })
      require("user.lsp").setup()
    end,
  }
