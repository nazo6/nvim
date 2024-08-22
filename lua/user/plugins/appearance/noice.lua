---@module "noice"

return {
  "folke/noice.nvim",
  enabled = not Args.feature.vscode,
  event = "VeryLazy",
  ---@type NoiceConfig
  opts = {
    cmdline = {
      opts = {
        position = {
          row = "98%",
        },
      },
    },
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    presets = {
      lsp_doc_border = true,
    },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
}
