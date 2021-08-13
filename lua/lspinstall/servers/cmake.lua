local config = require"lspinstall/util".extract_config("cmake")
config.default_config.cmd[1] = "./venv/bin/cmake-language-server"

return vim.tbl_extend('error', config, {
  install_script = [[
  python3 -m venv ./venv
  ./venv/bin/pip3 install -U pip
  ./venv/bin/pip3 install -U cmake-language-server
  ]]
})
