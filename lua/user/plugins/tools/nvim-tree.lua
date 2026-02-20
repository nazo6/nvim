local function on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return {
      desc = "nvim-tree: " .. desc,
      buffer = bufnr,
      noremap = true,
      silent = true,
      nowait = true,
    }
  end

  api.map.on_attach.default(bufnr)

  map("n", "<CR>", api.tree.change_root_to_node, opts "CD")
  map("n", "h", api.node.navigate.parent_close, opts "Close Directory")
  map("n", "l", api.node.open.edit, opts "Open")
  map("n", "<leader>f", api.node.run.system, opts "System open")
end

return {
  "kyazdani42/nvim-tree.lua",
  dependencies = { "echasnovski/mini.icons" },
  cmd = { "NvimTreeToggle" },
  init = function()
    map("n", "<C-f>", "<cmd>NvimTreeToggle<CR>", { silent = true })
  end,
  config = function()
    require("nvim-tree").setup {
      disable_netrw = true,
      hijack_cursor = true,
      sync_root_with_cwd = true,
      git = {
        timeout = 1000,
      },
      filters = {
        git_ignored = false,
      },
      filesystem_watchers = {
        ignore_dirs = {
          ".ccls-cache",
          "build",
          "node_modules",
          "target",
        },
      },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = false,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      on_attach = on_attach,
      renderer = {
        highlight_git = true,
        icons = {
          show = {
            folder_arrow = false,
            git = false,
          },
        },
        indent_markers = {
          enable = true,
        },
      },
      update_focused_file = {
        enable = true,
      },
      actions = {
        change_dir = {
          global = true,
        },
        open_file = {
          window_picker = {
            chars = "FJDKSLA;CMRUEIWOQP",
          },
        },
      },
    }
  end,
}
