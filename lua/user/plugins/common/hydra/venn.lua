local hint = [[
 Arrow^^^^^^   Select region with <C-v> 
 ^ ^ _K_ ^ ^   _f_: surround it with box
 _H_ ^ ^ _L_
 ^ ^ _J_ ^ ^                      _<Esc>_
]]

local M = {}

M.key = "<leader>v"
M.setup = function()
  local Hydra = require "hydra"
  Hydra {
    name = "Draw Diagram",
    hint = hint,
    config = {
      color = "pink",
      invoke_on_body = true,
      on_enter = function()
        vim.o.virtualedit = "all"
      end,
      hint = {
        float_opts = {
          border = "single",
        },
      },
    },
    mode = "n",
    body = M.key,
    heads = {
      { "H", "<C-v>h:VBox<CR>" },
      { "J", "<C-v>j:VBox<CR>" },
      { "K", "<C-v>k:VBox<CR>" },
      { "L", "<C-v>l:VBox<CR>" },
      { "f", ":VBox<CR>", { mode = "v" } },
      { "<Esc>", nil, { exit = true } },
    },
  }
end

return M
