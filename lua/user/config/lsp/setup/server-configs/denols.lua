local create_setup = require("user.config.lsp.setup.config-builder").create_setup
local root_pattern = require("lspconfig").util.root_pattern

local node_root_pattern = root_pattern("package.json", "tsconfig.json")
local git_root_pattern = root_pattern ".git"
local deno_root_pattern = root_pattern("deno.json", "deno.jsonc")

local function deno_root(path)
  local deno_root_path = deno_root_pattern(path)
  if deno_root_path then
    return deno_root_path
  end

  if node_root_pattern(path) then
    return nil
  end

  local git_root = git_root_pattern(path)
  if git_root then
    return git_root
  else
    return vim.fn.fnamemodify(path, ":h")
  end
end

return create_setup {
  root_dir = deno_root,
  settings = {
    enable = true,
    lint = true,
    unstable = true,
  },
  on_attach = function(client)
    client.server_capabilities.executeCommandProvider = true
  end,
}
