local lspconfig = require "lspconfig"
local configs = require "lspconfig.configs"
local servers = require "nvim-lsp-installer.servers"
local server = require "nvim-lsp-installer.server"
local path = require "nvim-lsp-installer.path"
local shell = require "nvim-lsp-installer.installers.shell"

if not configs["teal-language-server"] then
  configs["teal-language-server"] = {
    default_config = {
      filetypes = {
        "teal",
        -- "lua", -- Also works for lua, but you may get type errors that cannot be resolved within lua itself
      },
      root_dir = lspconfig.util.root_pattern("tlconfig.lua", ".git"),
      settings = {},
    },
  }
end

local install_script = [[
hererocks lua -l5.1 -rlatest
source ./lua/bin/activate 
luarocks install --dev teal-language-server
sed -i -e "s/\.tmp//g" ./lua/bin/teal-language-server
deactivate-lua
]]
local root_dir = server.get_server_root_path "teal-language-server"
local teal_language_server = server.Server:new {
  name = "teal-language-server",
  root_dir = root_dir,
  installer = shell.bash "",
  default_options = {
    cmd = { "teal-language-server" },
  },
}
servers.register(teal_language_server)
