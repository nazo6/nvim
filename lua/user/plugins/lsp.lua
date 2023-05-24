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
  {
    "lvimuser/lsp-inlayhints.nvim",
    branch = "anticonceal",
    config = function()
      require("lsp-inlayhints").setup {
        inlay_hints = {
          parameter_hints = {
            show = true,
          },
          type_hints = {
            show = true,
          },
          label_formatter = function(tbl, kind, opts, client_name)
            if kind == 2 and not opts.parameter_hints.show then
              return ""
            elseif not opts.type_hints.show then
              return ""
            end

            return table.concat(tbl, ", ")
          end,
          virt_text_formatter = function(label, hint, opts, client_name)
            if client_name == "sumneko_lua" then
              if hint.kind == 2 then
                hint.paddingLeft = false
              else
                hint.paddingRight = false
              end
            end

            local vt = {}
            vt[#vt + 1] = hint.paddingLeft and { " ", "None" } or nil
            vt[#vt + 1] = { label, opts.highlight }
            vt[#vt + 1] = hint.paddingRight and { " ", "None" } or nil

            return vt
          end,
          only_current_line = false,
          -- highlight group
          highlight = "LspInlayHint",
          -- virt_text priority
          priority = 0,
        },
        enabled_at_startup = true,
        debug_mode = false,
      }
    end,
  },
  { "mhanberg/output-panel.nvim" },
  -- { "kosayoda/nvim-lightbulb" },
  { "j-hui/fidget.nvim" },
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
