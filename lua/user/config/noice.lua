require("noice").setup {
  cmdline = {
    enabled = true,
    menu = "cmdline_popup",
  },
  popupmenu = {
    backend = "cmp",
  },
  views = {
    cmdline_popup = {
      position = {
        row = 5,
        col = "50%",
      },
      size = {
        width = 60,
        height = "auto",
      },
    },
  },
  routes = {
    {
      filter = {
        event = "msg_show",
        kind = "",
        find = "written",
      },
      opts = { skip = true },
    },
    {
      filter = {
        event = "cmdline",
        find = "^%s*[/?]",
      },
      view = "cmdline",
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
}

local send_key = require("user.utils").send_key_nomap
vim.keymap.set("n", "<CR>", function()
  local bufs = vim.api.nvim_list_bufs()
  local notif_win = nil
  for _, buf in pairs(bufs) do
    local win = vim.fn.bufwinid(buf)
    if win ~= -1 and vim.api.nvim_buf_get_option(buf, "filetype") == "notify" then
      notif_win = win
      break
    end
  end
  if not notif_win then
    send_key "<CR>"
  else
    pcall(vim.api.nvim_win_close, notif_win, true)
  end
end, { desc = "close notification window" })
