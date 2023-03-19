local M = {}

M.init = function()
  vim.keymap.set(
    "n",
    "<C-g><C-b>",
    "<cmd>lua require('gitsigns').toggle_current_line_blame()<CR>",
    { desc = "Stage hunk" }
  )
  vim.keymap.set("n", "<Plug>UserInteractiveCommit", function()
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
    input:map("n", "<Esc>", function()
      input:unmount()
    end)
    input:on(event.BufLeave, function()
      input:unmount()
    end)
  end)
  vim.keymap.set("n", "<C-g>c", "<Plug>UserInteractiveCommit", { remap = true })
  vim.keymap.set("n", "<C-g><C-c>", "<Plug>UserInteractiveCommit", { remap = true })

  vim.keymap.set("n", "<C-g>d", "<cmd>DiffviewOpen<CR>")
  vim.keymap.set("n", "<C-g><C-d>", "<cmd>DiffviewOpen<CR>")
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
        view = {
          { "n", "q", "<cmd>DiffviewClose<CR>", { desc = "Close diffview" } },
        },
        file_panel = {
          { "n", "j", actions.select_next_entry, { desc = "Select next entry" } },
          { "n", "<down>", actions.select_next_entry, { desc = "Select next entry" } },
          { "n", "k", actions.select_prev_entry, { desc = "Select prev entry" } },
          { "n", "<up>", actions.select_prev_entry, { desc = "Select prev entry" } },
          { "n", "c", "<Plug>UserInteractiveCommit", { desc = "Open commit window" } },
        },
      },
    }
  end,
}

return M
