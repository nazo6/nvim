return {
  "folke/snacks.nvim",
  event = "BufReadPre",
  keys = { {
    "<C-g><C-g>",
    mode = { "n" },
    function()
      Snacks.lazygit.open(opts)
    end,
  } },
  opts = function()
    -- Toggle the profiler
    Snacks.toggle.profiler():map "<leader>spp"
    -- Toggle the profiler highlights
    Snacks.toggle.profiler_highlights():map "<leader>sph"

    ---@type snacks.Config
    return {
      indent = {
        enable = true,
        animate = {
          duration = {
            total = 200,
          },
        },
      },
      bigfile = {
        setup = function(ctx)
          vim.cmd [[NoMatchParen]]
          -- require("illuminate").pause_buf()
          Snacks.util.wo(0, { foldmethod = "manual", statuscolumn = "", conceallevel = 0 })
          vim.schedule(function()
            vim.bo[ctx.buf].syntax = ctx.ft
          end)
        end,
      },
    }
  end,
}
