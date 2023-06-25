return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "zioroboco/nu-ls.nvim" },
    },
  },
  { "aznhe21/actions-preview.nvim" },
  {
    "neovim/nvim-lspconfig",

    cmd = { "LspInfo", "LspLog", "Neoconf" },
    event = { "BufRead", "BufNew" },
    config = function()
      require "user.config.lsp"
    end,
  },
  { "onsails/lspkind-nvim" },
  -- {
  --   "lvimuser/lsp-inlayhints.nvim",
  --   config = function()
  --     require("lsp-inlayhints").setup {}
  --   end,
  -- },
  { "mhanberg/output-panel.nvim" },
  -- { "kosayoda/nvim-lightbulb" },
  { "j-hui/fidget.nvim", tag = "legacy" },
  { "folke/neodev.nvim" },
  { "b0o/schemastore.nvim" },
  { "dnlhc/glance.nvim", cmd = { "Glance" } },
  { "SmiteshP/nvim-navic", event = { "InsertEnter", "BufRead" } },
  {
    "lsp_lines.nvim",
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  },
  { "folke/neoconf.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "WhoIsSethDaniel/mason-tool-installer.nvim" },
}
