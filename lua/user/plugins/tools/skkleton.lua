return {
  {
    "vim-skk/skkeleton",
    keys = { { "<C-j>", mode = { "i", "c" }, "<Plug>(skkeleton-enable)" } },
    enabled = Args.feature.denops,
    dependencies = { "vim-denops/denops.vim", "delphinus/skkeleton_indicator.nvim" },
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "skkeleton-initialize-pre",
        callback = function()
          vim.fn["skkeleton#config"] {
            eggLikeNewline = true,
            registerConvertResult = true,
            sources = { "skk_server" },
            skkServerReqEnc = "utf-8",
            skkServerResEnc = "utf-8",
          }
        end,
      })
    end,
    config = function()
      require("skkeleton_indicator").setup {}
    end,
  },
}
