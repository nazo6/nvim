return function(use)
  use {
    "jose-elias-alvarez/null-ls.nvim",
    requires = { { "nvim-lua/plenary.nvim", module = "plenary" } },
    module = "null-ls",
    after = "mason.nvim",
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
    module = "lspconfig",
    cmd = { "LspInfo", "LspLog" },
    event = { "BufRead" },
    config = function()
      require "user.config.lsp.setup"
    end,
  }
  use { "ray-x/lsp_signature.nvim", module = "lsp_signature" }
  use { "onsails/lspkind-nvim", module = "lspkind" }
  use { "folke/lua-dev.nvim", module = "lua-dev" }
  use { "b0o/schemastore.nvim", module = "schemastore" }
  use { "j-hui/fidget.nvim", module = "fidget" }
  use { "SmiteshP/nvim-navic", module = "nvim-navic", event = { "InsertEnter", "BufRead" } }
  use {
    "mrshmllow/document-color.nvim",
    module = "document-color",
    config = function()
      require "user.config.document-color"
    end,
  }
  use {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    after = "nvim-lspconfig",
    as = "lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
    end,
  }
  use { "tamago324/nlsp-settings.nvim", module = "nlspsettings", cmd = "LspSettings" }
  use { "williamboman/mason-lspconfig.nvim", module = "mason-lspconfig" }
  use { "WhoIsSethDaniel/mason-tool-installer.nvim", module = "mason-tool-installer" }
end
