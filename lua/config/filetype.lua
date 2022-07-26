vim.filetype.add {
  filename = {
    [".swcrc"] = "json",
    [".latexmkrc"] = "perl",
  },
  pattern = {
    -- For chezmoi
    ["dot_.*"] = function(path, bufnr, ext)
      local real_name = ext:gsub("dot_", ".")
      return vim.filetype.match { filename = real_name } or ""
    end,
  },
}
