vim.filetype.add {
  extension = {
    xaml = "xml",
    saty = "satysfi",
    satyh = "satysfi",
  },
  filename = {
    [".swcrc"] = "json",
    [".latexmkrc"] = "perl",
  },
  pattern = {
    -- For chezmoi
    ["dot_.*"] = function(_, _, ext)
      local real_name = ext:gsub("dot_", ".")
      return vim.filetype.match { filename = real_name } or ""
    end,
  },
}
