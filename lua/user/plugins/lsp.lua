return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { { "nvim-lua/plenary.nvim" } },
  },
  {
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
    config = function()
      vim.g.code_action_menu_show_details = false
    end,
  },
  {
    "neovim/nvim-lspconfig",

    cmd = { "LspInfo", "LspLog" },
    event = { "BufRead" },
    config = function()
      require "user.config.lsp.setup"
    end,
  },
  { "onsails/lspkind-nvim" },
  { "folke/neodev.nvim" },
  { "b0o/schemastore.nvim" },
  { "dnlhc/glance.nvim", command = { "Glance" } },
  { "SmiteshP/nvim-navic", event = { "InsertEnter", "BufRead" } },
  {
    "mrshmllow/document-color.nvim",

    config = function()
      require("document-color").setup {
        mode = "background",
      }
    end,
  },
  {
    "lsp_lines.nvim",
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  },
  { "tamago324/nlsp-settings.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "WhoIsSethDaniel/mason-tool-installer.nvim" },
}
