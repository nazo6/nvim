return {
  "stevearc/dressing.nvim",
  init = function()
    require("user.shared.utils.vim").load_plugin_with_func("dressing.nvim", vim.ui, { "input", "select" })
  end,
  config = function()
    require("dressing").setup {
      input = {
        enabled = true,
        default_prompt = "Input:",
        prompt_align = "left",
        insert_only = true,
        start_in_insert = true,

        border = "rounded",
        relative = "cursor",

        prefer_width = 40,
        width = nil,
        -- min_width and max_width can be a list of mixed types.
        -- min_width = {20, 0.2} means "the greater of 20 columns or 20% of total"
        max_width = { 140, 0.9 },
        min_width = { 60, 0.5 },

        mappings = {
          i = {
            ["<C-c>"] = "Close",
            ["<CR>"] = "Confirm",
            ["<Up>"] = "HistoryPrev",
            ["<Down>"] = "HistoryNext",
          },
        },
        override = function(conf)
          conf.anchor = "SW"
        end,
      },
      select = {
        enabled = true,
        backend = { "telescope", "builtin" },
      },
    }
  end,
}
