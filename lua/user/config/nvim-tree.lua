local function on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  map("n", "<CR>", api.tree.change_root_to_node, opts "CD")
  map("n", "<C-e>", api.node.open.replace_tree_buffer, opts "Open: In Place")
  map("n", "<C-k>", api.node.show_info_popup, opts "Info")
  map("n", "<C-r>", api.fs.rename_sub, opts "Rename: Omit Filename")
  map("n", "<C-t>", api.node.open.tab, opts "Open: New Tab")
  map("n", "<C-v>", api.node.open.vertical, opts "Open: Vertical Split")
  map("n", "<C-x>", api.node.open.horizontal, opts "Open: Horizontal Split")
  map("n", "h", api.node.navigate.parent_close, opts "Close Directory")
  map("n", "l", api.node.open.edit, opts "Open")
  map("n", "<Tab>", api.node.open.preview, opts "Open Preview")
  map("n", ">", api.node.navigate.sibling.next, opts "Next Sibling")
  map("n", "<", api.node.navigate.sibling.prev, opts "Previous Sibling")
  map("n", ".", api.node.run.cmd, opts "Run Command")
  map("n", "-", api.tree.change_root_to_parent, opts "Up")
  map("n", "a", api.fs.create, opts "Create")
  map("n", "bmv", api.marks.bulk.move, opts "Move Bookmarked")
  map("n", "B", api.tree.toggle_no_buffer_filter, opts "Toggle No Buffer")
  map("n", "c", api.fs.copy.node, opts "Copy")
  map("n", "C", api.tree.toggle_git_clean_filter, opts "Toggle Git Clean")
  map("n", "[c", api.node.navigate.git.prev, opts "Prev Git")
  map("n", "]c", api.node.navigate.git.next, opts "Next Git")
  map("n", "d", api.fs.remove, opts "Delete")
  map("n", "D", api.fs.trash, opts "Trash")
  map("n", "e", api.fs.rename_basename, opts "Rename: Basename")
  map("n", "]e", api.node.navigate.diagnostics.next, opts "Next Diagnostic")
  map("n", "[e", api.node.navigate.diagnostics.prev, opts "Prev Diagnostic")
  map("n", "F", api.live_filter.clear, opts "Clean Filter")
  map("n", "f", api.live_filter.start, opts "Filter")
  map("n", "?", api.tree.toggle_help, opts "Help")
  map("n", "gy", api.fs.copy.absolute_path, opts "Copy Absolute Path")
  map("n", "H", api.tree.toggle_hidden_filter, opts "Toggle Dotfiles")
  map("n", "I", api.tree.toggle_gitignore_filter, opts "Toggle Git Ignore")
  map("n", "J", api.node.navigate.sibling.last, opts "Last Sibling")
  map("n", "K", api.node.navigate.sibling.first, opts "First Sibling")
  map("n", "m", api.marks.toggle, opts "Toggle Bookmark")
  map("n", "o", api.node.open.edit, opts "Open")
  map("n", "O", api.node.open.no_window_picker, opts "Open: No Window Picker")
  map("n", "p", api.fs.paste, opts "Paste")
  map("n", "P", api.node.navigate.parent, opts "Parent Directory")
  map("n", "q", api.tree.close, opts "Close")
  map("n", "r", api.fs.rename, opts "Rename")
  map("n", "R", api.tree.reload, opts "Refresh")
  map("n", "U", api.tree.toggle_custom_filter, opts "Toggle Hidden")
  map("n", "W", api.tree.collapse_all, opts "Collapse")
  map("n", "x", api.fs.cut, opts "Cut")
  map("n", "y", api.fs.copy.filename, opts "Copy Name")
  map("n", "Y", api.fs.copy.relative_path, opts "Copy Relative Path")
  map("n", "<2-LeftMouse>", api.node.open.edit, opts "Open")
  map("n", "<2-RightMouse>", api.tree.change_root_to_node, opts "CD")

  local is_wsl = vim.fn.has "wsl" == 1
  local function get_node_path(node)
    if node.name == ".." then
      local utils = require "nvim-tree.utils"
      local core = require "nvim-tree.core"
      return utils.path_remove_trailing(core.get_cwd())
    else
      return node.absolute_path
    end
  end
  map("n", "E", function()
    local node = require("nvim-tree.lib").get_node_at_cursor()
    if node.type == "file" then
      node = node.parent
    end
    local path = get_node_path(node)
    if is_wsl then
      path = vim.fn.system('wslpath -w "' .. path .. '"')
    end

    vim.notify("Opening " .. path)

    vim.fn.system { "explorer.exe", path }
  end, opts "Open in explorer")
end

return {
  setup = function()
    map("n", "<C-f>", "<cmd>NvimTreeToggle<CR>", { silent = true })
  end,
  config = function()
    require("nvim-tree").setup {
      disable_netrw = true,
      hijack_netrw = true,
      open_on_tab = false,
      hijack_cursor = true,
      update_cwd = false,
      sync_root_with_cwd = true,
      system_open = {
        cmd = nil,
        args = {},
      },
      git = {
        ignore = false,
      },
      diagnostics = {
        enable = true,
        severity = {
          min = vim.diagnostic.severity.HINT,
          max = vim.diagnostic.severity.ERROR,
        },
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
            file = true,
            folder = true,
            folder_arrow = false,
            git = false,
          },
        },
        indent_markers = {
          enable = true,
        },
      },
      filesystem_watchers = {
        ignore_dirs = {
          [[^\.*target$]],
        },
      },
      update_focused_file = {
        enable = true,
        update_root = false,
        ignore_list = {},
      },
      actions = {
        open_file = {
          window_picker = {
            enable = true,
            picker = require("window-picker").pick_window,
          },
        },
      },
    }
  end,
}
