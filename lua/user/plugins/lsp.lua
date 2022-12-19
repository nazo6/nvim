return function(use)
  use("jose-elias-alvarez/null-ls.nvim", {
    depends = { "plenary.nvim" },
    on_lua = "null-ls",
  })
  use("weilbith/nvim-code-action-menu", {
    cmd = "CodeActionMenu",
    lua_source = [[vim.g.code_action_menu_show_details = false]],
  })
  use("neovim/nvim-lspconfig", {
    on_lua = "lspconfig",
    on_cmd = { "LspInfo", "LspLog" },
    on_event = { "BufRead" },
    lua_source = [[require "user.config.lsp.setup"]],
  })
  use("onsails/lspkind-nvim", { on_lua = "lspkind" })
  use("folke/neodev.nvim", { on_lua = "neodev" })
  use("b0o/schemastore.nvim", { on_lua = "schemastore" })
  use("dnlhc/glance.nvim", { command = { "Glance" }, on_lua = { "glance" } })
  use("SmiteshP/nvim-navic", { on_lua = "nvim-navic", on_event = { "InsertEnter", "BufRead" } })
  use("mrshmllow/document-color.nvim", {
    on_lua = "document-color",
    lua_source = [[require "user.config.document-color"]],
  })
  use("https://git.sr.ht/~whynothugo/lsp_lines.nvim", {
    name = "lsp_lines.nvim",
    on_lua = "lsp_lines",
  })
  use("tamago324/nlsp-settings.nvim", { on_lua = "nlspsettings", on_cmd = "LspSettings" })
  use("williamboman/mason-lspconfig.nvim", { on_lua = "mason-lspconfig", depends = {"mason.nvim"} })
  use("WhoIsSethDaniel/mason-tool-installer.nvim", { on_lua = "mason-tool-installer" })
end
