return {
  {
    "dnlhc/glance.nvim",
    cmd = { "Glance" },
    config = function()
      local glance = require "glance"
      local actions = glance.actions

      glance.setup {
        height = 18,
        zindex = 45,
        preview_win_opts = {
          cursorline = true,
          number = true,
          wrap = true,
        },
        border = {
          enable = true,
          top_char = "―",
          bottom_char = "―",
        },
        list = {
          position = "right",
          width = 0.33,
        },
        theme = {
          enable = true,
          mode = "auto",
        },
        mappings = {
          list = {
            ["j"] = actions.next,
            ["k"] = actions.previous,
            ["<Down>"] = actions.next,
            ["<Up>"] = actions.previous,
            ["<Tab>"] = actions.next_location,
            ["<S-Tab>"] = actions.previous_location,
            ["<C-u>"] = actions.preview_scroll_win(5),
            ["<C-d>"] = actions.preview_scroll_win(-5),
            ["v"] = actions.jump_vsplit,
            ["s"] = actions.jump_split,
            ["t"] = actions.jump_tab,
            ["<CR>"] = actions.jump,
            ["o"] = actions.jump,
            ["<leader>l"] = actions.enter_win "preview",
            ["q"] = actions.close,
            ["Q"] = actions.close,
            ["<Esc>"] = actions.close,
          },
          preview = {
            ["Q"] = actions.close,
            ["<Tab>"] = actions.next_location,
            ["<S-Tab>"] = actions.previous_location,
            ["<leader>l"] = actions.enter_win "list",
          },
        },
        hooks = {},
        folds = {
          fold_closed = "",
          fold_open = "",
          folded = true,
        },
        indent_lines = {
          enable = true,
          icon = "│",
        },
        winbar = {
          enable = true,
        },
      }
    end,
  },
}
