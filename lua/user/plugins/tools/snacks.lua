return {
  "folke/snacks.nvim",
  event = "BufReadPre",
  opts = function()
    -- Toggle the profiler
    Snacks.toggle.profiler():map "<leader>spp"
    -- Toggle the profiler highlights
    Snacks.toggle.profiler_highlights():map "<leader>sph"

    return {
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
