vim.g.formatter_config = {}

return {
  {
    "mhartington/formatter.nvim",
    cmd = "Format",
    event = { "BufRead", "FileType" },
    init = function()
      local function lsp_format(c)
        local config = c or {}
        vim.lsp.buf.format(vim.tbl_deep_extend("force", config, {}))
      end

      map("n", "<leader>f", function()
        lsp_format()
      end)

      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        group = vim.api.nvim_create_augroup("lsp-format", {}),
        callback = function()
          local formatters = require("user.plugins.external.formatter.utils").get_active_formatters()
          if #formatters == 0 then
            lsp_format { timeout_ms = 7000, async = false }
          else
            if #formatters > 1 then
              vim.notify("More than 2 formatters", vim.log.levels.WARN)
            end
            vim.cmd [[FormatWrite]]
          end
        end,
      })
    end,
    config = function()
      vim.g.formatter_config = require "user.plugins.external.formatter.config"
      local formatter_config = {}
      for _, config in ipairs(vim.g.formatter_config) do
        for _, ft in ipairs(config.filetypes) do
          if not formatter_config[ft] then
            formatter_config[ft] = {}
          end
          table.insert(formatter_config[ft], function()
            if config.condition() then
              return config.formatter()
            end

            return nil
          end)
        end
      end

      require("formatter").setup {
        logging = true,
        log_level = vim.log.levels.WARN,
        filetype = formatter_config,
      }
    end,
  },
}
