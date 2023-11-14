return {
  {
    "j-hui/fidget.nvim",
    init = function()
      require("user.utils").load_plugin_with_func("fidget.nvim", vim, "notify")
    end,
    config = function()
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

      require("fidget").setup {
        progress = {
          display = {
            format_message = function(msg)
              local message = msg.message
              if not message then
                message = msg.done and "Completed" or "In progress..."
              end
              if msg.percentage ~= nil then
                local percent_bar = string.format("%s%% %s", msg.percentage, percentage_bar(msg.percentage))
                message = string.format("%s %s", message, percent_bar)
              end
              return message
            end,
          },
        },
        notification = {
          override_vim_notify = true,
          window = {
            winblend = 0,
            border = "rounded",
          },
        },
      }

      local banned_messages = { "EPERM" }
      local notify = vim.notify
      _G.notify_history = {}
      vim.notify = function(msg, level, opts)
        for _, banned in ipairs(banned_messages) do
          if string.find(msg, banned) then
            return
          end
        end
        table.insert(_G.notify_history, 1, {
          msg = msg,
          level = level or vim.log.levels.INFO,
          opts = opts,
          time = os.time(),
        })
        notify(msg, level, opts)
      end
    end,
  },
}
