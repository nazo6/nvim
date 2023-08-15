return {
  { "onsails/lspkind-nvim" },
  -- {
  --   "lvimuser/lsp-inlayhints.nvim",
  --   config = function()
  --     require("lsp-inlayhints").setup {}
  --   end,
  -- },
  { "mhanberg/output-panel.nvim" },
  -- { "kosayoda/nvim-lightbulb" },
  { "folke/neodev.nvim" },
  { "b0o/schemastore.nvim" },
  { "SmiteshP/nvim-navic", event = { "InsertEnter", "BufRead" } },
  {
    "lsp_lines.nvim",
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = true,
  },
  { "folke/neoconf.nvim" },
  { "aznhe21/actions-preview.nvim" },
}
