return {
  keymap = function()
    nnoremap("<C-e>", "<cmd>NvimTreeToggle<CR>", "silent")
  end,
  setup = function()
    local tree_cb = require("nvim-tree.config").nvim_tree_callback
    local keymaps = {
      { key = { "l", "<2-LeftMouse>" }, cb = tree_cb "edit" },
      { key = "L", cb = tree_cb "vsplit" },
      { key = "h", cb = tree_cb "close_node" },
      { key = { "<CR>" }, cb = tree_cb "cd" },
      { key = "<BS>", cb = tree_cb "dir_up" },
      { key = "<C-x>", cb = tree_cb "split" },
      { key = "<C-t>", cb = tree_cb "tabnew" },
      { key = "<", cb = tree_cb "prev_sibling" },
      { key = ">", cb = tree_cb "next_sibling" },
      { key = "P", cb = tree_cb "parent_node" },
      { key = "<Tab>", cb = tree_cb "preview" },
      { key = "K", cb = tree_cb "first_sibling" },
      { key = "J", cb = tree_cb "last_sibling" },
      { key = "I", cb = tree_cb "toggle_ignored" },
      { key = "H", cb = tree_cb "toggle_dotfiles" },
      { key = "R", cb = tree_cb "refresh" },
      { key = "N", cb = tree_cb "create" },
      { key = "d", cb = tree_cb "remove" },
      { key = "r", cb = tree_cb "rename" },
      { key = "<C-r>", cb = tree_cb "full_rename" },
      { key = "x", cb = tree_cb "cut" },
      { key = "c", cb = tree_cb "copy" },
      { key = "p", cb = tree_cb "paste" },
      { key = "y", cb = tree_cb "copy_name" },
      { key = "Y", cb = tree_cb "copy_path" },
      { key = "gy", cb = tree_cb "copy_absolute_path" },
      { key = "[c", cb = tree_cb "prev_git_item" },
      { key = "]c", cb = tree_cb "next_git_item" },
      { key = "s", cb = tree_cb "system_open" },
      { key = "?", cb = tree_cb "toggle_help" },
    }

    require("nvim-tree").setup {
      disable_netrw = true,
      hijack_netrw = true,
      open_on_setup = false,
      ignore_ft_on_setup = {},
      auto_close = false,
      open_on_tab = false,
      hijack_cursor = false,
      update_cwd = false,
      system_open = {
        cmd = nil,
        args = {},
      },
      view = {
        mappings = {
          list = keymaps,
          custom_only = true,
        },
      },
    }
  end,
}
