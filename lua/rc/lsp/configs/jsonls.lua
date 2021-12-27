local function no_formatting(client)
  client.resolved_capabilities.document_formatting = false
end

return {
  on_attach = no_formatting,
  filetypes = { "json", "jsonc" },
  settings = { json = { schemas = require("schemastore").json.schemas() } },
}
