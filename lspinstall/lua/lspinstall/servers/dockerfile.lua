local config = require"lspinstall/util".extract_config("dockerls")
local lsp_util = require"lspinstall/util"

local script_to_use = nil

if lsp_util.is_windows() then
  config.default_config.cmd[1] = "./node_modules/.bin/docker-langserver.cmd"
  script_to_use = {
    'cmd.exe','/c','npm install dockerfile-language-server-nodejs@latest'
  }
else
  config.default_config.cmd[1] = "./node_modules/.bin/docker-langserver"
  script_to_use  = [[
  ! test -f package.json && npm init -y --scope=lspinstall || true
  npm install dockerfile-language-server-nodejs@latest
  ]]

end

return vim.tbl_extend('error', config, {
  install_script = script_to_use
})
