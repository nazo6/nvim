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
          surql = "surrealdb",
          v = "systemverilog",
          cir = "ngspice",
          mdx = "mdx",
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
          ["${HOME}/.local/share/chezmoi/.*"] = {
            function(path, buf)
              if path:match "/dot_" then
                return vim.filetype.match {
                  filename = path:gsub("/dot_", "/."),
                  buf = buf,
                }
              end
            end,
            { priority = -math.huge },
          },
        },
      }

      vim.treesitter.language.register("markdown", "mdx")
    end
  end,
})
