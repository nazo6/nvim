return function(use)
  use {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { { "nvim-lua/plenary.nvim" } },
  }
  use {
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
    config = function()
      vim.g.code_action_menu_show_details = false
    end,
  }
  use {
    "neovim/nvim-lspconfig",

    cmd = { "LspInfo", "LspLog" },
    event = { "BufRead" },
    config = function()
      require "user.config.lsp.setup"
    end,
  }
  use { "onsails/lspkind-nvim" }
  use { "folke/neodev.nvim" }
  use { "b0o/schemastore.nvim" }
  use { "dnlhc/glance.nvim", command = { "Glance" } }
  use { "SmiteshP/nvim-navic", event = { "InsertEnter", "BufRead" } }
  use {
    "mrshmllow/document-color.nvim",

    config = function()
      require("document-color").setup {
        mode = "background",
      }
    end,
  }
  use {
    "lsp_lines.nvim",
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  }
  use { "tamago324/nlsp-settings.nvim" }
  use { "williamboman/mason-lspconfig.nvim" }
  use { "WhoIsSethDaniel/mason-tool-installer.nvim" }
end
