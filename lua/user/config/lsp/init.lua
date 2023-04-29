require("neoconf").setup()

require("mason-lspconfig").setup()

require"user.config.lsp.config"

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
