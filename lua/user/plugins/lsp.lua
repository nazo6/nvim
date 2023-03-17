return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { { "nvim-lua/plenary.nvim" } },
  },
  { "aznhe21/actions-preview.nvim" },
  {
    "neovim/nvim-lspconfig",

    cmd = { "LspInfo", "LspLog" },
    event = { "BufRead" },
    config = function()
      require "user.config.lsp.setup"
    end,
  },
  { "onsails/lspkind-nvim" },
  { "ray-x/lsp_signature.nvim" },
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
  {
    "folke/neoconf.nvim",
    cmd = "Neoconf",
  },
  { "williamboman/mason-lspconfig.nvim" },
  { "WhoIsSethDaniel/mason-tool-installer.nvim" },
}
