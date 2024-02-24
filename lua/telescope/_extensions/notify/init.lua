local finders = require "telescope.finders"
local pickers = require "telescope.pickers"
local sorters = require "telescope.sorters"
local previewers = require "telescope.previewers"
local entry_display = require "telescope.pickers.entry_display"

local level_info = {
  [0] = { display = "TRACE", hi = "DiagnosticHint" },
  [1] = { display = "DEBUG", hi = "DiagnosticHint" },
  [2] = { display = "INFO", hi = "DiagnosticInfo" },
  [3] = { display = "WARN", hi = "DiagnosticWarn" },
  [4] = { display = "ERROR", hi = "DiagnosticError" },
  [5] = { display = "OFF", hi = "DiagnosticHint" },
}
local level_str_to_int = {
  trace = 0,
  debug = 1,
  info = 2,
  warn = 3,
  error = 4,
  off = 5,
}

local normalize_level = function(level)
  local new_level = level or 2
  if type(level) == "string" then
    new_level = level_str_to_int[level:lower()] or 2
  end
  return new_level
end

local finder_displayer = entry_display.create {
  separator = " ",
  items = {
    {},
    {},
    {},
  },
}

local picker = function(opts)
  pickers
    .new(opts, {
      prompt_title = "Notifications",
      sorter = sorters.get_generic_fuzzy_sorter(),
      previewer = previewers.new_buffer_previewer {
        define_preview = function(self, entry)
          local bufnr = self.state.bufnr
          local width = vim.api.nvim_win_get_width(self.state.winid)
          local split = string.rep("─", width)
          local lines = {}

          local level = normalize_level(entry.value.level)
          local level_str = level_info[level].display
          table.insert(lines, level_str .. " " .. vim.fn.strftime("%T", entry.value.time))
          table.insert(lines, split)

          if entry.value.opts and entry.value.opts.title then
            table.insert(lines, entry.value.opts.title)
            table.insert(lines, split)
          end

          local msg_lines = vim.split(entry.value.msg, "\n")
          for _, line in ipairs(msg_lines) do
            table.insert(lines, line)
          end

          vim.api.nvim_set_option_value("wrap", true, { win = self.state.winid })
          vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
          vim.api.nvim_buf_add_highlight(bufnr, -1, level_info[level].hi, 0, 0, #level_str)
        end,
      },
      finder = finders.new_table {
        results = _G.notify_history,
        entry_maker = function(entry)
          return {
            value = entry,
            display = function(entry)
              local level = normalize_level(entry.value.level)
              return finder_displayer {
                { vim.fn.strftime("%T", entry.value.time) },
                { level_info[level].display, level_info[level].hi },
                { entry.value.msg },
              }
            end,
            ordinal = entry.msg,
          }
        end,
      },
    })
    :find()
end

return require("telescope").register_extension {
  exports = {
    notify = picker,
  },
}
