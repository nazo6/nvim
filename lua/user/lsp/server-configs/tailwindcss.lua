local create_setup = require("user.lsp.config-builder").create_setup

local filetypes = vim.lsp.config.tailwindcss.filetypes
table.insert(filetypes, "rust")

return create_setup {
  filetypes = filetypes,
  root_dir = function(bufnr, cb)
    local root = vim.fs.root(bufnr, {
      "tailwind.config.js",
      "tailwind.config.cjs",
      "tailwind.config.mjs",
      "tailwind.config.ts",
    })

    if root ~= nil then
      cb(root)
    end

    local package_json_dir = vim.fs.root(bufnr, { "package.json" })
    if package_json_dir ~= nil then
      local contents = vim.fn.readfile(vim.fs.joinpath(package_json_dir, "package.json"))
      contents = table.concat(contents, "\n")
      if contents then
        local json = vim.json.decode(contents)
        if json and json.devDependencies and json.devDependencies.tailwindcss then
          cb(package_json_dir)
        end
      end
    end
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
