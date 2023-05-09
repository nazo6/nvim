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
