local create_setup = require("user.lsp.config-builder").create_setup

local filetypes = vim.lsp.config.tailwindcss.filetypes
table.insert(filetypes, "rust")

return create_setup {
  filetypes = filetypes,
  root_dir = function(bufnr, cb)
    cb(vim.fs.root(bufnr, {
      "tailwind.config.js",
      "tailwind.config.cjs",
      "tailwind.config.mjs",
      "tailwind.config.ts",
      "input.css",
      "tailwind.css",
      "global.css",
    }))
  end,
  init_options = {
    userLanguages = {
      eelixir = "html-eex",
      eruby = "erb",
      rust = "html",
    },
  },
  settings = {
    tailwindCSS = {
      experimental = {
        classRegex = {
          'class\\s*:\\s*"([^"]*)',
        },
      },
    },
  },
  on_attach = function(_, bufnr)
    vim.keymap.set(
      "n",
      "<leader>tt",
      "<cmd>Telescope tailwind css<CR>",
      { buffer = bufnr, desc = "[telescope] Tailwind" }
    )
  end,
}
