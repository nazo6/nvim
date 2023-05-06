map("n", "<Plug>GitCommit", function()
  local Input = require "nui.input"
  local event = require("nui.utils.autocmd").event
  local input = Input({
    position = "50%",
    relative = "editor",
    size = {
      width = 50,
    },
    border = {
      style = "rounded",
      text = {
        top = "Enter commit message (Leave empty to open buffer):",
        top_align = "center",
      },
    },
  }, {
    on_submit = function(value)
      if #value == 0 then
        vim.cmd "Git commit"
      else
        vim.cmd([[Git commit -m "]] .. value .. [["]])
      end
    end,
  })
  input:mount()
  input:map("i", "<Esc>", function()
    input:unmount()
  end)
  input:on(event.BufLeave, function()
    input:unmount()
  end)
end)
