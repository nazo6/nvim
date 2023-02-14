return {
  setup = function()
    vim.keymap.set("n", "<A-h>", "<cmd>lua require('smart-splits').resize_left()<CR>")
    vim.keymap.set("n", "<A-j>", "<cmd>lua require('smart-splits').resize_down()<CR>")
    vim.keymap.set("n", "<A-k>", "<cmd>lua require('smart-splits').resize_up()<CR>")
    vim.keymap.set("n", "<A-l>", "<cmd>lua require('smart-splits').resize_right()<CR>")
    -- moving between splits
    vim.keymap.set("n", "<C-h>", "<cmd>lua require('smart-splits').move_cursor_left()<CR>")
    vim.keymap.set("n", "<C-j>", "<cmd>lua require('smart-splits').move_cursor_down()<CR>")
    vim.keymap.set("n", "<C-k>", "<cmd>lua require('smart-splits').move_cursor_up()<CR>")
    vim.keymap.set("n", "<C-l>", "<cmd>lua require('smart-splits').move_cursor_right()<CR>")
  end,
  config = function()
    require("smart-splits").setup {
      -- Ignored filetypes (only while resizing)
      ignored_filetypes = {
        "nofile",
        "quickfix",
        "prompt",
      },
      -- Ignored buffer types (only while resizing)
      ignored_buftypes = { "neo-tree" },
      -- when moving cursor between splits left or right,
      -- place the cursor on the same row of the *screen*
      -- regardless of line numbers. False by default.
      -- Can be overridden via function parameter, see Usage.
      move_cursor_same_row = false,
      -- resize mode options
      resize_mode = {
        -- key to exit persistent resize mode
        quit_key = "<ESC>",
        -- keys to use for moving in resize mode
        -- in order of left, down, up' right
        resize_keys = { "h", "j", "k", "l" },
        -- set to true to silence the notifications
        -- when entering/exiting persistent resize mode
        silent = false,
        -- must be functions, they will be executed when
        -- entering or exiting the resize mode
        hooks = {
          on_enter = nil,
          on_leave = nil,
        },
      },
    }
  end,
}
