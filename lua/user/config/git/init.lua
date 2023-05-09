local M = {}

M.init = function()
  require "user.config.git.def"
  map("n", "<C-g><C-b>", "<cmd>lua require('gitsigns').toggle_current_line_blame()<CR>", { desc = "Stage hunk" })

  map("n", "<C-g><C-d>", "<cmd>DiffviewOpen<CR>")
  map("n", "<C-g><C-h>", "<cmd>DiffviewFileHistory<CR>")
end

M.config = {
  gitsigns = function()
    require("gitsigns").setup {
      signcolumn = false,
      numhl = true,
    }
  end,
  diffview = function()
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

return M
