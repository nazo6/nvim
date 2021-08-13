local schemas = require('data.catalog').schemas
local root_pattern = require('lspconfig').util.root_pattern

local function no_formatting(client)
  client.resolved_capabilities.document_formatting = false
end

return {
  denols = {
    root_dir = root_pattern '.nvim-lsp-denols',
  },
  cssls = { on_attach = no_formatting },
  html = { on_attach = no_formatting },
  jsonls = { filetypes = { 'json', 'jsonc' }, settings = { json = { schemas = schemas } } },
  typescript = {
    root_dir = root_pattern('package.json', 'tsconfig.json'),
    on_attach = no_formatting,
  },
  tailwindcss = {
    root_dir = root_pattern('tailwind.config.js', 'tailwind.config.ts'),
  },
  lua = require('lua-dev').setup {
    library = {
      vimruntime = true,
      types = true,
      plugins = true,
    },
    lspconfig = {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
        },
      },
    },
  },
}
