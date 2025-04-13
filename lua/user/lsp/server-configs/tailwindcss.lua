local create_setup = require("user.lsp.config-builder").create_setup

return create_setup {
  filetypes = {
    -- html
    "aspnetcorerazor",
    "astro",
    "astro-markdown",
    "blade",
    "clojure",
    "django-html",
    "htmldjango",
    "edge",
    "eelixir", -- vim ft
    "elixir",
    "ejs",
    "erb",
    "eruby", -- vim ft
    "gohtml",
    "haml",
    "handlebars",
    "hbs",
    "html",
    -- 'HTML (Eex)',
    -- 'HTML (EEx)',
    "html-eex",
    "heex",
    "jade",
    "leaf",
    "liquid",
    "markdown",
    "mdx",
    "mustache",
    "njk",
    "nunjucks",
    "php",
    "razor",
    "slim",
    "twig",
    -- css
    "css",
    "less",
    "postcss",
    "sass",
    "scss",
    "stylus",
    "sugarss",
    -- js
    "javascript",
    "javascriptreact",
    "reason",
    "rescript",
    "typescript",
    "typescriptreact",
    -- mixed
    "vue",
    "svelte",
    -- custom
    "rust",
  },
  root_dir = vim.fs.root(0, {
    "tailwind.config.js",
    "tailwind.config.cjs",
    "tailwind.config.mjs",
    "tailwind.config.ts",
    "input.css",
    "tailwind.css",
    "global.css",
  }),
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
