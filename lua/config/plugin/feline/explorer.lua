local components = {}

-- Left
components[1] = {
  {
    provider = "   NvimTree",
  },
  {},
}

return {
  condition = function()
    return vim.api.nvim_buf_get_option(0, "filetype") == "NvimTree"
  end,
  active = components,
  inactive = components,
}
