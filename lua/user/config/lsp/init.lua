local configs = require "user.config.lsp.configs"
local utils = require "user.config.lsp.utils"

require("neoconf").setup()

require("mason-lspconfig").setup()

require("mason-lspconfig").setup_handlers {
  function(server_name)
    local config_fn = configs.mason[server_name] or utils.default_setup
    config_fn(server_name)
  end,
}

for server_name in pairs(configs.manual) do
  local config_fn = configs.manual[server_name]
  config_fn(server_name)
end

local function percentage_bar(percentage)
  local length = 12
  local incomplete = "‥"
  local complete = "─"
  local sep = "→"

  local complete_length = math.floor((percentage / 100) * length)

  return string.rep(complete, complete_length > 0 and complete_length - 1 or complete_length)
    .. (complete_length > 0 and sep or "")
    .. string.rep(incomplete, length - complete_length)
end

-- Setup lsp related plugins
require("lsp_lines").setup()
require("lsp_signature").setup()
require("fidget").setup {
  text = {
    spinner = "dots",
    done = "✓",
    commenced = "Started",
    completed = "Completed",
  },
  fmt = {
    task = function(task_name, message, percentage)
      return string.format(
        "%s %s [%s]",
        message,
        percentage and string.format("%s%% %s", percentage, percentage_bar(percentage)) or "",
        task_name
      )
    end,
  },
}

-- require("nvim-lightbulb").setup {
--   autocmd = { enabled = true },
--   sign = { enabled = false },
--   virtual_text = { enabled = true, hl_mode = "combine" },
-- }

require "user.config.lsp.null-ls"

vim.cmd "LspStart"
