local components = {}

-- Left
components[1] = {
  {
    hl = { bg = "sumiInk2" },
  },
}

return {
  condition = function()
    return vim.api.nvim_buf_get_option(0, "filetype") == "neo-tree"
  end,
  active = components,
  inactive = components,
}
