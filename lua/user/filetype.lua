local loaded = false

vim.api.nvim_create_autocmd("BufReadPre", {
  group = vim.api.nvim_create_augroup("custom-filetype", {}),
  once = true,
  callback = function()
    if not loaded then
      loaded = true
      vim.filetype.add {
        extension = {
          xaml = "xml",
          saty = "satysfi",
          satyh = "satysfi",
          nu = "nu",
        },
        filename = {
          [".swcrc"] = "json",
          [".latexmkrc"] = "perl",
          -- Technitium DNS Server app
          ["dnsApp.config"] = "json",
          [".styluaignore"] = "gitignore",
          [".prettierignore"] = "gitignore",
          [".eslintignore"] = "gitignore",
        },
        pattern = {
          -- For chezmoi
          ["dot_.*"] = function(_, _, ext)
            local real_name = ext:gsub("dot_", ".")
            return vim.filetype.match { filename = real_name } or ""
          end,
        },
      }
    end
  end,
})
