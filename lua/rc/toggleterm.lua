local map = require "utils.map"

require("toggleterm").setup {
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = "<number>",
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = "float",
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = "curved",
    winblend = 3,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
}

local Terminal = require("toggleterm.terminal").Terminal
local gitui = Terminal:new { cmd = "gitui", hidden = true }

function _gitui_toggle()
  gitui:toggle()
end

map.nmap("<leader>g", "<cmd>lua _gitui_toggle()<CR>", map.ns)
map.nmap("<C-t>n", "<cmd>ToggleTerm direction=horizontal<CR>", map.ns)
