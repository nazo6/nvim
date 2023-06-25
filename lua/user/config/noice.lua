require("noice").setup {
  cmdline = {
    enabled = false,
  },
  messages = {
    enabled = false,
  },
  popupmenu = {
    enabled = false,
  },
  notify = {
    -- Noice can be used as `vim.notify` so you can route any notification like other messages
    enabled = false,
    view = "notify",
  },
  lsp = {
    progress = {
      enabled = false,
    },
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
    hover = {
      enabled = true,
      silent = true,
    },
    signature = {
      enabled = true,
      auto_open = {
        enabled = true,
        trigger = true,
        luasnip = true,
        throttle = 50,
      },
    },
    message = {
      enabled = true,
      view = "notify",
      opts = {},
    },
    documentation = {
      view = "hover",
    },
  },
  presets = {
    lsp_doc_border = true,
  },
}
