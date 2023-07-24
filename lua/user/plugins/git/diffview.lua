return {
  "sindrets/diffview.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
  },
  cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  init = function()
    map("n", "<C-g><C-d>", "<cmd>DiffviewOpen<CR>")
    map("n", "<C-g><C-h>", "<cmd>DiffviewFileHistory<CR>")

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
  end,
  config = function()
    local actions = require "diffview.actions"

    require("diffview").setup {
      keymaps = {
        file_panel = {
          { "n", "q", "<cmd>DiffviewClose<CR>", { desc = "Close diffview" } },
          { "n", "j", actions.select_next_entry, { desc = "Select next entry" } },
          { "n", "<down>", actions.select_next_entry, { desc = "Select next entry" } },
          { "n", "k", actions.select_prev_entry, { desc = "Select prev entry" } },
          { "n", "<up>", actions.select_prev_entry, { desc = "Select prev entry" } },
          { "n", "c", "<Plug>GitCommit", { desc = "Open commit window" } },
          { "n", "?", actions.help "file_panel", { desc = "Open the help panel" } },

          { "n", "p", "<cmd>Git pull<CR>", { desc = "Open the help panel" } },
          { "n", "P", "<cmd>Git push<CR>", { desc = "Open the help panel" } },
        },
        file_history_panel = {
          { "n", "q", "<cmd>DiffviewClose<CR>", { desc = "Close diffview" } },
          { "n", "?", actions.help "file_history_panel", { desc = "Open the help panel" } },
        },
      },
    }
  end,
}
