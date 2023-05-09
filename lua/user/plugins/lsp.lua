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
  { "ray-x/lsp_signature.nvim" },
  -- { "kosayoda/nvim-lightbulb" },
  { "j-hui/fidget.nvim" },
  { "folke/neodev.nvim" },
  { "b0o/schemastore.nvim" },
  { "dnlhc/glance.nvim", cmd = { "Glance" } },
  {
    "SmiteshP/nvim-navic",
    event = { "InsertEnter", "BufRead" },
    config = function()
      require("nvim-navic").setup {
        icons = {
          File = "󰈙 ",
          Module = " ",
          Namespace = "󰌗 ",
          Package = " ",
          Class = "󰌗 ",
          Method = "󰆧 ",
          Property = " ",
          Field = " ",
          Constructor = " ",
          Enum = "󰕘",
          Interface = "󰕘",
          Function = "󰊕 ",
          Variable = "󰆧 ",
          Constant = "󰏿 ",
          String = "󰀬 ",
          Number = "󰎠 ",
          Boolean = "◩ ",
          Array = "󰅪 ",
          Object = "󰅩 ",
          Key = "󰌋 ",
          Null = "󰟢 ",
          EnumMember = " ",
          Struct = "󰌗 ",
          Event = " ",
          Operator = "󰆕 ",
          TypeParameter = "󰊄 ",
        },
      }
    end,
  },
  {
    "lsp_lines.nvim",
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  },
  { "folke/neoconf.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "WhoIsSethDaniel/mason-tool-installer.nvim" },
}
