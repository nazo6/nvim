local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system { "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path }
  vim.api.nvim_command "packadd packer.nvim"
end

local packer = require "packer"

packer.startup {
  function(use)
    use { "wbthomason/packer.nvim" }
    require "user.plugins.common"(use)

    require "user.plugins.appearance"(use)
    require "user.plugins.debug"(use)
    require "user.plugins.edit"(use)
    require "user.plugins.language"(use)
    require "user.plugins.lsp"(use)
    require "user.plugins.tools"(use)
    require "user.plugins.treesitter"(use)
    require "user.plugins.utils"(use)
  end,
}

vim.api.nvim_create_augroup("PackerCompile", {})
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  group = "PackerCompile",
  pattern = "*/user/plugins/*.lua",
  command = "PackerCompile",
  once = false,
})
