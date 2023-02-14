local components = {}

-- Left
components[1] = {
  {
    provider = "   ",
    hl = { bg = "sumiInk2" },
    right_sep = {
      str = "slant_right",
      hl = {
        fg = "sumiInk2",
        bg = "sumiInk4",
      },
    },
  },
  {
    hl = { bg = "sumiInk4" },
  },
}

return {
  condition = function()
    return vim.api.nvim_buf_get_option(0, "filetype") == "neo-tree"
  end,
  active = components,
  inactive = components,
}
